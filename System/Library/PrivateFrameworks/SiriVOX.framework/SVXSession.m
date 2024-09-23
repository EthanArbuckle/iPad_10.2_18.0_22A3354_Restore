@implementation SVXSession

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v7.receiver = self;
  v7.super_class = (Class)SVXSession;
  -[SVXSession description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {sessionUUID = %@, instanceContext = %@}"), v4, self->_sessionUUID, self->_instanceContext);

  return (NSString *)v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[SVXSession dealloc]";
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v4.receiver = self;
  v4.super_class = (Class)SVXSession;
  -[SVXSession dealloc](&v4, sel_dealloc);
}

- (SVXSession)initWithPerformer:(id)a3 serviceCommandHandler:(id)a4 powerLevelManager:(id)a5 speechSynthesizer:(id)a6 instanceContext:(id)a7 preferences:(id)a8 analytics:(id)a9 delegate:(id)a10
{
  NSUUID *v16;
  id v17;
  id v18;
  id v19;
  SVXSession *v20;
  id v21;
  void *v22;
  os_log_t *v23;
  NSObject *v24;
  NSUUID *v25;
  NSUUID *sessionUUID;
  NSMutableSet *v27;
  NSMutableSet *sessionIdleAssertions;
  NSObject *v29;
  NSUUID *v30;
  NSMutableArray *v31;
  NSMutableArray *currentSpeechRequestPendingBlocks;
  NSMutableArray *v33;
  NSMutableArray *pendingRequestBarriers;
  SVXTaskTrackingCenter *v35;
  SVXTaskTrackingCenter *taskTrackingCenter;
  SVXAceViewSpeakableTextExtractor *v37;
  SVXAceViewSpeakableTextExtractor *aceViewSpeakableTextExtractor;
  SVXSpeechSynthesisUtils *v39;
  SVXSpeechSynthesisUtils *speechSynthesisUtils;
  SVXSoundUtils *v41;
  SVXSoundUtils *soundUtils;
  SVXAlarmAndTimerUtilities *v43;
  SVXAlarmAndTimerUtilities *alarmAndTimerUtils;
  SVXAFConnectionFactory *v45;
  SVXAFConnectionFactory *connectionFactory;
  NSMutableSet *v47;
  NSMutableSet *audioSessionAssertions;
  AFModesConfiguration *v49;
  AFModesConfiguration *modesConfiguration;
  SRSTClient *v51;
  SRSTClient *client;
  id v54;
  id v55;
  void *v56;
  id v57;
  NSUUID *v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  NSUUID *v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  NSUUID *v68;
  id v69;
  id v70;
  void *v71;
  id v72;
  NSUUID *v73;
  id v74;
  id v75;
  void *v76;
  id v77;
  NSUUID *v78;
  id v79;
  id v80;
  void *v81;
  id v82;
  NSUUID *v83;
  id v84;
  id v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  NSUUID *v95;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  objc_super v102;
  uint8_t buf[4];
  const char *v104;
  __int16 v105;
  NSUUID *v106;
  __int16 v107;
  id v108;
  __int16 v109;
  id v110;
  __int16 v111;
  id v112;
  __int16 v113;
  id v114;
  __int16 v115;
  id v116;
  __int16 v117;
  void *v118;
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v16 = (NSUUID *)a3;
  v97 = a4;
  v17 = a4;
  v18 = a5;
  v101 = a6;
  v100 = a7;
  v99 = a8;
  v98 = a9;
  v19 = a10;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v54 = a7;
    v55 = v19;
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXSession.m"), 361, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("performer != nil"));

    v19 = v55;
    a7 = v54;
    v16 = 0;
    if (v17)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v88 = a5;
  v57 = a6;
  v58 = v16;
  v59 = a7;
  v60 = v19;
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXSession.m"), 362, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceCommandHandler != nil"));

  v19 = v60;
  a7 = v59;
  v16 = v58;
  a6 = v57;
  a5 = v88;
LABEL_3:
  if (v101)
  {
    if (v18)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v89 = a5;
    v62 = a6;
    v63 = v16;
    v64 = a7;
    v65 = v19;
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXSession.m"), 363, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("speechSynthesizer != nil"));

    v19 = v65;
    a7 = v64;
    v16 = v63;
    a6 = v62;
    a5 = v89;
    if (v18)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v90 = a5;
  v67 = a6;
  v68 = v16;
  v69 = a7;
  v70 = v19;
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXSession.m"), 364, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("powerLevelManager != nil"));

  v19 = v70;
  a7 = v69;
  v16 = v68;
  a6 = v67;
  a5 = v90;
LABEL_5:
  if (!v100)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v91 = a5;
    v72 = a6;
    v73 = v16;
    v74 = a7;
    v75 = v19;
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXSession.m"), 365, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("instanceContext != nil"));

    v19 = v75;
    a7 = v74;
    v16 = v73;
    a6 = v72;
    a5 = v91;
  }
  if (!v99)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v92 = a5;
    v77 = a6;
    v78 = v16;
    v79 = a7;
    v80 = v19;
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXSession.m"), 366, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferences != nil"));

    v19 = v80;
    a7 = v79;
    v16 = v78;
    a6 = v77;
    a5 = v92;
  }
  if (!v98)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v93 = a5;
    v82 = a6;
    v83 = v16;
    v84 = a7;
    v85 = v19;
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SVXSession.m"), 367, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("analytics != nil"));

    v19 = v85;
    a7 = v84;
    v16 = v83;
    a6 = v82;
    a5 = v93;
  }
  v102.receiver = self;
  v102.super_class = (Class)SVXSession;
  v20 = -[SVXSession init](&v102, sel_init);
  if (v20)
  {
    v95 = v16;
    v21 = a7;
    v22 = v19;
    v87 = v18;
    v23 = (os_log_t *)MEMORY[0x24BE08FB0];
    v24 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316930;
      v104 = "-[SVXSession initWithPerformer:serviceCommandHandler:powerLevelManager:speechSynthesizer:instanceContext:pr"
             "eferences:analytics:delegate:]";
      v105 = 2112;
      v106 = v95;
      v107 = 2112;
      v108 = v17;
      v109 = 2112;
      v110 = v101;
      v111 = 2112;
      v112 = v100;
      v113 = 2112;
      v114 = v99;
      v115 = 2112;
      v116 = v98;
      v117 = 2112;
      v118 = v22;
      _os_log_impl(&dword_214934000, v24, OS_LOG_TYPE_INFO, "%s performer = %@, serviceCommandHandler = %@, speechSynthesizer = %@, instanceContext = %@, preferences = %@, analytics = %@, delegate = %@", buf, 0x52u);
    }
    v20->_activityState = 1;
    v25 = (NSUUID *)objc_alloc_init(MEMORY[0x24BDD1880]);
    sessionUUID = v20->_sessionUUID;
    v20->_sessionUUID = v25;

    v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    sessionIdleAssertions = v20->_sessionIdleAssertions;
    v20->_sessionIdleAssertions = v27;

    v29 = *v23;
    if (os_log_type_enabled(*v23, OS_LOG_TYPE_INFO))
    {
      v30 = v20->_sessionUUID;
      *(_DWORD *)buf = 136315394;
      v104 = "-[SVXSession initWithPerformer:serviceCommandHandler:powerLevelManager:speechSynthesizer:instanceContext:pr"
             "eferences:analytics:delegate:]";
      v105 = 2112;
      v106 = v30;
      _os_log_impl(&dword_214934000, v29, OS_LOG_TYPE_INFO, "%s sessionUUID = %@", buf, 0x16u);
    }
    objc_storeStrong((id *)&v20->_performer, a3);
    objc_storeStrong((id *)&v20->_serviceCommandHandler, v97);
    objc_storeStrong((id *)&v20->_powerLevelManager, a5);
    objc_storeStrong((id *)&v20->_speechSynthesizer, a6);
    -[SVXSpeechSynthesizer addListener:](v20->_speechSynthesizer, "addListener:", v20);
    objc_storeStrong((id *)&v20->_instanceContext, v21);
    objc_storeStrong((id *)&v20->_preferences, a8);
    objc_storeStrong((id *)&v20->_analytics, a9);
    v19 = v22;
    objc_storeWeak((id *)&v20->_delegate, v22);
    v20->_currentInstrumentationUIState = 1;
    v20->_currentState = 1;
    v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    currentSpeechRequestPendingBlocks = v20->_currentSpeechRequestPendingBlocks;
    v20->_currentSpeechRequestPendingBlocks = v31;

    v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pendingRequestBarriers = v20->_pendingRequestBarriers;
    v20->_pendingRequestBarriers = v33;

    v16 = v95;
    v35 = -[SVXTaskTrackingCenter initWithPerformer:delegate:]([SVXTaskTrackingCenter alloc], "initWithPerformer:delegate:", v95, v20);
    taskTrackingCenter = v20->_taskTrackingCenter;
    v20->_taskTrackingCenter = v35;

    v37 = objc_alloc_init(SVXAceViewSpeakableTextExtractor);
    aceViewSpeakableTextExtractor = v20->_aceViewSpeakableTextExtractor;
    v20->_aceViewSpeakableTextExtractor = v37;

    v39 = objc_alloc_init(SVXSpeechSynthesisUtils);
    speechSynthesisUtils = v20->_speechSynthesisUtils;
    v20->_speechSynthesisUtils = v39;

    v41 = objc_alloc_init(SVXSoundUtils);
    soundUtils = v20->_soundUtils;
    v20->_soundUtils = v41;

    v43 = objc_alloc_init(SVXAlarmAndTimerUtilities);
    alarmAndTimerUtils = v20->_alarmAndTimerUtils;
    v20->_alarmAndTimerUtils = v43;

    v45 = objc_alloc_init(SVXAFConnectionFactory);
    connectionFactory = v20->_connectionFactory;
    v20->_connectionFactory = v45;

    v20->_audioSessionID = 0;
    v47 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    audioSessionAssertions = v20->_audioSessionAssertions;
    v20->_audioSessionAssertions = v47;

    v49 = (AFModesConfiguration *)objc_alloc_init(MEMORY[0x24BE09228]);
    modesConfiguration = v20->_modesConfiguration;
    v20->_modesConfiguration = v49;

    v51 = (SRSTClient *)objc_alloc_init(MEMORY[0x24BEA6A10]);
    client = v20->_client;
    v20->_client = v51;

    v20->_isStateFeedbackEnabled = objc_msgSend(MEMORY[0x24BE091E0], "isStateFeedbackEnabled");
    v18 = v87;
  }

  return v20;
}

- (void)prewarmWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SVXPerforming *performer;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  SVXSession *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  performer = self->_performer;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __44__SVXSession_prewarmWithContext_completion___block_invoke;
  v11[3] = &unk_24D24EED8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v11);

}

- (id)activateWithContext:(id)a3 completion:(id)a4
{
  return -[SVXSession activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:completion:](self, "activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:completion:", a3, 0, 0, 0, 0, 0, 0, 0, a4);
}

- (id)activateWithContext:(id)a3 options:(unint64_t)a4 deviceSetupContext:(id)a5 deviceProblemsState:(id)a6 localDeviceContext:(id)a7 speechSynthesisRecord:(id)a8 speechSynthesisState:(int64_t)a9 speechRecordingAlertPolicy:(id)a10 completion:(id)a11
{
  id v16;
  id v17;
  SVXTaskContext *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  os_log_t *v22;
  AFAnalyticsTurnBasedInstrumentationContext *previousRequestInstrumentationContext;
  AFAnalytics *analytics;
  AFAnalytics *v25;
  AFAnalytics *v26;
  os_log_t *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  os_log_t v34;
  NSObject *v35;
  AFAnalytics *v36;
  AFAnalytics *v37;
  void *v38;
  SVXPerforming *performer;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v57;
  id v58;
  SVXTaskContext *v59;
  _QWORD v60[5];
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  unint64_t v69;
  int64_t v70;
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  AFAnalytics *v74;
  __int16 v75;
  AFAnalytics *v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v58 = a5;
  v57 = a6;
  v54 = a7;
  v17 = a8;
  v53 = a10;
  v55 = a11;
  v18 = [SVXTaskContext alloc];
  v19 = objc_msgSend(v16, "timestamp");
  if (!v19)
    v19 = mach_absolute_time();
  v20 = objc_alloc_init(MEMORY[0x24BDD1880]);
  LOWORD(v51) = 0;
  v59 = -[SVXTaskContext initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:](v18, "initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:", 1, v19, 0, v20, 0, 0, 0, 0, v51, 0, v16, 0, 0);

  v21 = objc_msgSend(v16, "source");
  v22 = (os_log_t *)MEMORY[0x24BE08FB0];
  if (v21 == 4 && (previousRequestInstrumentationContext = self->_previousRequestInstrumentationContext) != 0)
  {
    analytics = self->_analytics;
    v25 = previousRequestInstrumentationContext;
    v26 = analytics;
    v27 = v22;
    v28 = *v22;
    if (os_log_type_enabled(*v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v72 = "SVXInstrumentationNextTurnBasedContextfromContext";
      v73 = 2112;
      v74 = v26;
      v75 = 2112;
      v76 = v25;
      _os_log_impl(&dword_214934000, v28, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Start turn (for analytics %@) from current turn (%@)", buf, 0x20u);
    }
    -[AFAnalytics nextTurnBasedContextForAnalytics:](v25, "nextTurnBasedContextForAnalytics:", v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = self->_analytics;
    v30 = *v22;
    if (os_log_type_enabled(*v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "SVXInstrumentationNewTurnBasedContext";
      v73 = 2112;
      v74 = v25;
      _os_log_impl(&dword_214934000, v30, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Start new turn for analytics (%@)", buf, 0x16u);
      v27 = v22;
      v30 = *v22;
    }
    else
    {
      v27 = v22;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v72 = "SVXInstrumentationNewTurnBasedContext";
      v73 = 2112;
      v74 = 0;
      _os_log_impl(&dword_214934000, v30, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Previous turn ID (%@)", buf, 0x16u);
    }
    v29 = (void *)objc_msgSend(MEMORY[0x24BE090D0], "newTurnBasedContextWithPreviousTurnID:analytics:", 0, v25);
    v26 = 0;
  }

  objc_msgSend(v16, "requestInfo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v16, "requestInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "turnIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTurnIdentifier:", v33);

  }
  v34 = *v27;
  if (os_log_type_enabled(*v27, OS_LOG_TYPE_INFO))
  {
    v35 = v34;
    objc_msgSend(v29, "turnIdentifier");
    v36 = (AFAnalytics *)objc_claimAutoreleasedReturnValue();
    -[AFAnalyticsTurnBasedInstrumentationContext turnIdentifier](self->_previousRequestInstrumentationContext, "turnIdentifier");
    v37 = (AFAnalytics *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v72 = "-[SVXSession activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSynth"
          "esisRecord:speechSynthesisState:speechRecordingAlertPolicy:completion:]";
    v73 = 2112;
    v74 = v36;
    v75 = 2112;
    v76 = v37;
    _os_log_impl(&dword_214934000, v35, OS_LOG_TYPE_INFO, "%s turnID = %@, previousTurnID = %@", buf, 0x20u);

  }
  v52 = v29;
  -[SVXTaskTrackingCenter beginTrackingTaskWithContext:instrumentationContext:](self->_taskTrackingCenter, "beginTrackingTaskWithContext:instrumentationContext:", v59, v29);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  performer = self->_performer;
  v60[0] = MEMORY[0x24BDAC760];
  v60[1] = 3221225472;
  v60[2] = __181__SVXSession_activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_completion___block_invoke;
  v60[3] = &unk_24D24DCF0;
  v60[4] = self;
  v61 = v16;
  v62 = v58;
  v63 = v57;
  v64 = v54;
  v65 = v17;
  v69 = a4;
  v70 = a9;
  v68 = v55;
  v66 = v53;
  v40 = v38;
  v67 = v40;
  v41 = v53;
  v42 = v17;
  v43 = v54;
  v44 = v57;
  v45 = v58;
  v46 = v16;
  v47 = v55;
  -[SVXPerforming performBlock:](performer, "performBlock:", v60);
  v48 = v67;
  v49 = v40;

  return v49;
}

- (void)deactivateWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  SVXPerforming *performer;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  performer = self->_performer;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__SVXSession_deactivateWithContext_completion___block_invoke;
  v11[3] = &unk_24D24EED8;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[SVXPerforming performBlock:](performer, "performBlock:", v11);

}

- (void)performBlock:(id)a3
{
  if (a3)
    -[SVXPerforming performBlock:](self->_performer, "performBlock:");
}

- (void)preheatWithStyle:(int64_t)a3
{
  SVXPerforming *performer;
  _QWORD v4[6];

  performer = self->_performer;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__SVXSession_preheatWithStyle___block_invoke;
  v4[3] = &unk_24D24EA18;
  v4[4] = self;
  v4[5] = a3;
  -[SVXPerforming performBlock:](performer, "performBlock:", v4);
}

- (void)stopSpeech
{
  SVXPerforming *performer;
  _QWORD v3[5];

  performer = self->_performer;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __24__SVXSession_stopSpeech__block_invoke;
  v3[3] = &unk_24D24EFF0;
  v3[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v3);
}

- (void)transitSpeechToAutomaticEndpointingWithTimestamp:(unint64_t)a3
{
  SVXPerforming *performer;
  _QWORD v4[6];

  performer = self->_performer;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__SVXSession_transitSpeechToAutomaticEndpointingWithTimestamp___block_invoke;
  v4[3] = &unk_24D24EA18;
  v4[4] = self;
  v4[5] = a3;
  -[SVXPerforming performBlock:](performer, "performBlock:", v4);
}

- (void)transitSpeechToManualEndpointing
{
  SVXPerforming *performer;
  _QWORD v3[5];

  performer = self->_performer;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__SVXSession_transitSpeechToManualEndpointing__block_invoke;
  v3[3] = &unk_24D24EFF0;
  v3[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v3);
}

- (void)cancelRequest
{
  SVXPerforming *performer;
  _QWORD v3[5];

  performer = self->_performer;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __27__SVXSession_cancelRequest__block_invoke;
  v3[3] = &unk_24D24EFF0;
  v3[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v3);
}

- (void)dismiss
{
  SVXPerforming *performer;
  _QWORD v3[5];

  performer = self->_performer;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __21__SVXSession_dismiss__block_invoke;
  v3[3] = &unk_24D24EFF0;
  v3[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v3);
}

- (void)getStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  SVXPerforming *performer;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    performer = self->_performer;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __37__SVXSession_getStateWithCompletion___block_invoke;
    v7[3] = &unk_24D24EF28;
    v7[4] = self;
    v8 = v4;
    -[SVXPerforming performBlock:](performer, "performBlock:", v7);

  }
}

- (void)getActivityStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  SVXPerforming *performer;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    performer = self->_performer;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __45__SVXSession_getActivityStateWithCompletion___block_invoke;
    v7[3] = &unk_24D24EF28;
    v7[4] = self;
    v8 = v4;
    -[SVXPerforming performBlock:](performer, "performBlock:", v7);

  }
}

- (void)getAudioPowerWithType:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  SVXPerforming *performer;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    performer = self->_performer;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __47__SVXSession_getAudioPowerWithType_completion___block_invoke;
    v9[3] = &unk_24D24EB40;
    v11 = a3;
    v9[4] = self;
    v10 = v6;
    -[SVXPerforming performBlock:](performer, "performBlock:", v9);

  }
}

- (void)getAlarmAndTimerFiringContextWithCompletion:(id)a3
{
  id v5;
  void *v6;
  SVXPerforming *performer;
  _QWORD v8[5];
  id v9;
  SEL v10;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    performer = self->_performer;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __58__SVXSession_getAlarmAndTimerFiringContextWithCompletion___block_invoke;
    v8[3] = &unk_24D24EB40;
    v8[4] = self;
    v9 = v5;
    v10 = a2;
    -[SVXPerforming performBlock:](performer, "performBlock:", v8);

  }
}

- (void)startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  SVXPerforming *performer;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  SVXSession *v15;
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a5;
  performer = self->_performer;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__SVXSession_startAudioPlaybackRequest_options_completion___block_invoke;
  v13[3] = &unk_24D24DD40;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v17 = a4;
  v11 = v9;
  v12 = v8;
  -[SVXPerforming performBlock:](performer, "performBlock:", v13);

}

- (void)stopAudioPlaybackRequest:(id)a3 immediately:(BOOL)a4
{
  id v6;
  SVXPerforming *performer;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a3;
  performer = self->_performer;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__SVXSession_stopAudioPlaybackRequest_immediately___block_invoke;
  v9[3] = &unk_24D24DD68;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v9);

}

- (void)addRequestBarrier:(id)a3
{
  id v4;
  void *v5;
  SVXPerforming *performer;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    performer = self->_performer;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __32__SVXSession_addRequestBarrier___block_invoke;
    v7[3] = &unk_24D24EF28;
    v7[4] = self;
    v8 = v4;
    -[SVXPerforming performBlock:](performer, "performBlock:", v7);

  }
}

- (void)handleCommand:(id)a3 taskTracker:(id)a4
{
  id v6;
  id v7;
  SVXPerforming *performer;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    performer = self->_performer;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __40__SVXSession_handleCommand_taskTracker___block_invoke;
    v9[3] = &unk_24D24EF00;
    v9[4] = self;
    v10 = v6;
    v11 = v7;
    -[SVXPerforming performBlock:](performer, "performBlock:", v9);

  }
}

- (void)invalidate
{
  SVXPerforming *performer;
  _QWORD v3[5];

  performer = self->_performer;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __24__SVXSession_invalidate__block_invoke;
  v3[3] = &unk_24D24EFF0;
  v3[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v3);
}

- (void)updateDeviceProblemsState:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXSession updateDeviceProblemsState:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s deviceProblemsState = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__SVXSession_updateDeviceProblemsState___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);

}

- (void)updateDeviceSetupContext:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXSession updateDeviceSetupContext:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s deviceSetupContext = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__SVXSession_updateDeviceSetupContext___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);

}

- (void)updateLocalDeviceContext:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXSession updateLocalDeviceContext:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s localDeviceContext = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__SVXSession_updateLocalDeviceContext___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);

}

- (id)getTaskTrackingCenter
{
  return self->_taskTrackingCenter;
}

- (id)currentRequestUUID
{
  return self->_currentRequestUUID;
}

- (void)activateWithSpeechRequestOptions:(id)a3 options:(unint64_t)a4 deviceSetupContext:(id)a5 deviceProblemsState:(id)a6 localDeviceContext:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  SVXPerforming *performer;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  unint64_t v31;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  performer = self->_performer;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __124__SVXSession_activateWithSpeechRequestOptions_options_deviceSetupContext_deviceProblemsState_localDeviceContext_completion___block_invoke;
  v25[3] = &unk_24D24DD90;
  v25[4] = self;
  v26 = v14;
  v30 = v18;
  v31 = a4;
  v27 = v15;
  v28 = v16;
  v29 = v17;
  v20 = v18;
  v21 = v17;
  v22 = v16;
  v23 = v15;
  v24 = v14;
  -[SVXPerforming performBlock:](performer, "performBlock:", v25);

}

- (void)assistantConnectionSpeechRecordingWillBegin:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[SVXSession assistantConnectionSpeechRecordingWillBegin:]";
    v10 = 2112;
    v11 = v4;
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s connection = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__SVXSession_assistantConnectionSpeechRecordingWillBegin___block_invoke;
  v7[3] = &unk_24D24EFF0;
  v7[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v7);

}

- (void)assistantConnection:(id)a3 speechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXPerforming *performer;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[SVXSession assistantConnection:speechRecordingWillBeginWithInputAudioPowerXPCWrapper:]";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_debug_impl(&dword_214934000, v8, OS_LOG_TYPE_DEBUG, "%s connection = %@, wrapper = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __88__SVXSession_assistantConnection_speechRecordingWillBeginWithInputAudioPowerXPCWrapper___block_invoke;
  v11[3] = &unk_24D24F018;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  -[SVXPerforming performBlock:](performer, "performBlock:", v11);

}

- (void)assistantConnection:(id)a3 speechRecordingDidBeginOnAVRecordRoute:(id)a4 audioSessionID:(unsigned int)a5
{
  id v8;
  id v9;
  NSObject *v10;
  SVXPerforming *performer;
  id v12;
  _QWORD v13[5];
  id v14;
  unsigned int v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v17 = "-[SVXSession assistantConnection:speechRecordingDidBeginOnAVRecordRoute:audioSessionID:]";
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    v22 = 2048;
    v23 = a5;
    _os_log_debug_impl(&dword_214934000, v10, OS_LOG_TYPE_DEBUG, "%s connection = %@, route = %@, audioSessionID = %lu", buf, 0x2Au);
  }
  performer = self->_performer;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __88__SVXSession_assistantConnection_speechRecordingDidBeginOnAVRecordRoute_audioSessionID___block_invoke;
  v13[3] = &unk_24D24DDB8;
  v15 = a5;
  v13[4] = self;
  v14 = v9;
  v12 = v9;
  -[SVXPerforming performBlock:](performer, "performBlock:", v13);

}

- (void)assistantConnection:(id)a3 speechRecordingDidChangeAVRecordRoute:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXPerforming *performer;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[SVXSession assistantConnection:speechRecordingDidChangeAVRecordRoute:]";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_debug_impl(&dword_214934000, v8, OS_LOG_TYPE_DEBUG, "%s connection = %@, route = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__SVXSession_assistantConnection_speechRecordingDidChangeAVRecordRoute___block_invoke;
  v11[3] = &unk_24D24F018;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  -[SVXPerforming performBlock:](performer, "performBlock:", v11);

}

- (void)assistantConnectionSpeechRecordingDidDetectStartpoint:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[SVXSession assistantConnectionSpeechRecordingDidDetectStartpoint:]";
    v10 = 2112;
    v11 = v4;
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s connection = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__SVXSession_assistantConnectionSpeechRecordingDidDetectStartpoint___block_invoke;
  v7[3] = &unk_24D24EFF0;
  v7[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v7);

}

- (void)assistantConnection:(id)a3 speechRecordingPerformTwoShotPromptWithType:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  SVXPerforming *performer;
  id v12;
  _QWORD v13[5];
  id v14;
  int64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "-[SVXSession assistantConnection:speechRecordingPerformTwoShotPromptWithType:completion:]";
    v18 = 2112;
    v19 = v8;
    v20 = 2048;
    v21 = a4;
    _os_log_debug_impl(&dword_214934000, v10, OS_LOG_TYPE_DEBUG, "%s connection = %@, type = %ld", buf, 0x20u);
  }
  performer = self->_performer;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __89__SVXSession_assistantConnection_speechRecordingPerformTwoShotPromptWithType_completion___block_invoke;
  v13[3] = &unk_24D24EB40;
  v14 = v9;
  v15 = a4;
  v13[4] = self;
  v12 = v9;
  -[SVXPerforming performBlock:](performer, "performBlock:", v13);

}

- (void)assistantConnectionSpeechRecordingDidEnd:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[SVXSession assistantConnectionSpeechRecordingDidEnd:]";
    v10 = 2112;
    v11 = v4;
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s connection = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SVXSession_assistantConnectionSpeechRecordingDidEnd___block_invoke;
  v7[3] = &unk_24D24EFF0;
  v7[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v7);

}

- (void)assistantConnectionSpeechRecordingDidCancel:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[SVXSession assistantConnectionSpeechRecordingDidCancel:]";
    v10 = 2112;
    v11 = v4;
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s connection = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__SVXSession_assistantConnectionSpeechRecordingDidCancel___block_invoke;
  v7[3] = &unk_24D24EFF0;
  v7[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v7);

}

- (void)assistantConnection:(id)a3 speechRecordingDidFail:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXPerforming *performer;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[SVXSession assistantConnection:speechRecordingDidFail:]";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_debug_impl(&dword_214934000, v8, OS_LOG_TYPE_DEBUG, "%s connection = %@, error = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__SVXSession_assistantConnection_speechRecordingDidFail___block_invoke;
  v11[3] = &unk_24D24F018;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  -[SVXPerforming performBlock:](performer, "performBlock:", v11);

}

- (void)assistantConnection:(id)a3 speechRecognitionDidFail:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXPerforming *performer;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[SVXSession assistantConnection:speechRecognitionDidFail:]";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_debug_impl(&dword_214934000, v8, OS_LOG_TYPE_DEBUG, "%s connection = %@, error = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__SVXSession_assistantConnection_speechRecognitionDidFail___block_invoke;
  v11[3] = &unk_24D24F018;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  -[SVXPerforming performBlock:](performer, "performBlock:", v11);

}

- (void)assistantConnection:(id)a3 speechRecognized:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SVXPerforming *performer;
  id v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v13 = v8;
    objc_msgSend(v7, "af_bestTextInterpretation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v18 = "-[SVXSession assistantConnection:speechRecognized:]";
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v14;
    _os_log_debug_impl(&dword_214934000, v13, OS_LOG_TYPE_DEBUG, "%s connection = %@, speechRecognized = %@, text = %@", buf, 0x2Au);

  }
  if (-[SVXSession _isTapToRadarEnabled](self, "_isTapToRadarEnabled"))
  {
    -[SVXSession _tapToRadarManager](self, "_tapToRadarManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "af_bestTextInterpretation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRecognitionText:", v10);

  }
  performer = self->_performer;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __51__SVXSession_assistantConnection_speechRecognized___block_invoke;
  v15[3] = &unk_24D24F018;
  v15[4] = self;
  v16 = v7;
  v12 = v7;
  -[SVXPerforming performBlock:](performer, "performBlock:", v15);

}

- (void)assistantConnection:(id)a3 speechRecognizedPartialResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SVXPerforming *performer;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v11 = v8;
    objc_msgSend(v7, "af_bestTextInterpretation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v16 = "-[SVXSession assistantConnection:speechRecognizedPartialResult:]";
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v12;
    _os_log_debug_impl(&dword_214934000, v11, OS_LOG_TYPE_DEBUG, "%s connection = %@, partialResult = %@, text = %@", buf, 0x2Au);

  }
  performer = self->_performer;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64__SVXSession_assistantConnection_speechRecognizedPartialResult___block_invoke;
  v13[3] = &unk_24D24F018;
  v13[4] = self;
  v14 = v7;
  v10 = v7;
  -[SVXPerforming performBlock:](performer, "performBlock:", v13);

}

- (void)assistantConnection:(id)a3 recognizedAdditionalSpeechInterpretation:(id)a4 refId:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315906;
    v12 = "-[SVXSession assistantConnection:recognizedAdditionalSpeechInterpretation:refId:]";
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_debug_impl(&dword_214934000, v10, OS_LOG_TYPE_DEBUG, "%s connection = %@, interpretation = %@, refId = %@", (uint8_t *)&v11, 0x2Au);
  }

}

- (void)assistantConnection:(id)a3 recognitionUpdateWithPhrases:(id)a4 utterances:(id)a5 refId:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v14 = 136316162;
    v15 = "-[SVXSession assistantConnection:recognitionUpdateWithPhrases:utterances:refId:]";
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    _os_log_debug_impl(&dword_214934000, v13, OS_LOG_TYPE_DEBUG, "%s connection = %@, phrases = %@, utterances = %@, refId = %@", (uint8_t *)&v14, 0x34u);
  }

}

- (void)assistantConnectionRequestWillStart:(id)a3
{
  AFModesConfiguration *v4;
  os_log_t *v5;
  NSObject *v6;
  NSObject *v7;
  SVXPerforming *performer;
  AFModesConfiguration *modesConfiguration;
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  AFModesConfiguration *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (AFModesConfiguration *)a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[SVXSession assistantConnectionRequestWillStart:]";
    v13 = 2112;
    v14 = v4;
    _os_log_debug_impl(&dword_214934000, v6, OS_LOG_TYPE_DEBUG, "%s connection = %@", buf, 0x16u);
  }
  if (objc_msgSend(MEMORY[0x24BE091E0], "isResponseFrameworkEnabled"))
  {
    v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
    {
      modesConfiguration = self->_modesConfiguration;
      *(_DWORD *)buf = 136315394;
      v12 = "-[SVXSession assistantConnectionRequestWillStart:]";
      v13 = 2112;
      v14 = modesConfiguration;
      _os_log_debug_impl(&dword_214934000, v7, OS_LOG_TYPE_DEBUG, "%s #modes Sending modes configuration : %@", buf, 0x16u);
    }
    -[AFModesConfiguration setModesConfiguration:](v4, "setModesConfiguration:", self->_modesConfiguration);
  }
  performer = self->_performer;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__SVXSession_assistantConnectionRequestWillStart___block_invoke;
  v10[3] = &unk_24D24EFF0;
  v10[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v10);

}

- (void)assistantConnectionDismissAssistant:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[SVXSession assistantConnectionDismissAssistant:]";
    v10 = 2112;
    v11 = v4;
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s connection = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__SVXSession_assistantConnectionDismissAssistant___block_invoke;
  v7[3] = &unk_24D24EFF0;
  v7[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v7);

}

- (void)assistantConnectionRequestFinished:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[SVXSession assistantConnectionRequestFinished:]";
    v10 = 2112;
    v11 = v4;
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s connection = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__SVXSession_assistantConnectionRequestFinished___block_invoke;
  v7[3] = &unk_24D24EFF0;
  v7[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v7);

}

- (void)assistantConnection:(id)a3 receivedCommand:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  SVXPerforming *performer;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[SVXSession assistantConnection:receivedCommand:completion:]";
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_debug_impl(&dword_214934000, v11, OS_LOG_TYPE_DEBUG, "%s connection = %@, command = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__SVXSession_assistantConnection_receivedCommand_completion___block_invoke;
  v15[3] = &unk_24D24EED8;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v13 = v10;
  v14 = v9;
  -[SVXPerforming performBlock:](performer, "performBlock:", v15);

}

- (void)assistantConnection:(id)a3 requestFailedWithError:(id)a4 requestClass:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  SVXPerforming *performer;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v17 = "-[SVXSession assistantConnection:requestFailedWithError:requestClass:]";
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    _os_log_debug_impl(&dword_214934000, v11, OS_LOG_TYPE_DEBUG, "%s connection = %@, error = %@, requestClass = %@", buf, 0x2Au);
  }
  performer = self->_performer;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __70__SVXSession_assistantConnection_requestFailedWithError_requestClass___block_invoke;
  v14[3] = &unk_24D24F018;
  v14[4] = self;
  v15 = v9;
  v13 = v9;
  -[SVXPerforming performBlock:](performer, "performBlock:", v14);

}

- (void)assistantConnection:(id)a3 shouldSpeak:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  SVXPerforming *performer;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "-[SVXSession assistantConnection:shouldSpeak:]";
    v13 = 2112;
    v14 = v6;
    v15 = 1024;
    v16 = v4;
    _os_log_debug_impl(&dword_214934000, v7, OS_LOG_TYPE_DEBUG, "%s connection = %@, shouldSpeak = %d", buf, 0x1Cu);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__SVXSession_assistantConnection_shouldSpeak___block_invoke;
  v9[3] = &unk_24D24DDE0;
  v9[4] = self;
  v10 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v9);

}

- (void)assistantConnection:(id)a3 didChangeAudioSessionID:(unsigned int)a4
{
  id v6;
  NSObject *v7;
  SVXPerforming *performer;
  _QWORD v9[5];
  unsigned int v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "-[SVXSession assistantConnection:didChangeAudioSessionID:]";
    v13 = 2112;
    v14 = v6;
    v15 = 2048;
    v16 = a4;
    _os_log_debug_impl(&dword_214934000, v7, OS_LOG_TYPE_DEBUG, "%s connection = %@, sessionID = %lu", buf, 0x20u);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__SVXSession_assistantConnection_didChangeAudioSessionID___block_invoke;
  v9[3] = &unk_24D24F158;
  v9[4] = self;
  v10 = a4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v9);

}

- (void)assistantConnectionAudioSessionDidBeginInterruption:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[SVXSession assistantConnectionAudioSessionDidBeginInterruption:]";
    v10 = 2112;
    v11 = v4;
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s connection = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__SVXSession_assistantConnectionAudioSessionDidBeginInterruption___block_invoke;
  v7[3] = &unk_24D24EFF0;
  v7[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v7);

}

- (void)assistantConnectionAudioSessionDidEndInterruption:(id)a3 shouldResume:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  SVXPerforming *performer;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "-[SVXSession assistantConnectionAudioSessionDidEndInterruption:shouldResume:]";
    v13 = 2112;
    v14 = v6;
    v15 = 1024;
    v16 = v4;
    _os_log_debug_impl(&dword_214934000, v7, OS_LOG_TYPE_DEBUG, "%s connection = %@, shouldResume = %d", buf, 0x1Cu);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__SVXSession_assistantConnectionAudioSessionDidEndInterruption_shouldResume___block_invoke;
  v9[3] = &unk_24D24DDE0;
  v9[4] = self;
  v10 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v9);

}

- (void)assistantConnection:(id)a3 setUserActivtiyInfoAndMakeCurrent:(id)a4 webpageURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  SVXPerforming *performer;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v19 = "-[SVXSession assistantConnection:setUserActivtiyInfoAndMakeCurrent:webpageURL:]";
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    _os_log_debug_impl(&dword_214934000, v11, OS_LOG_TYPE_DEBUG, "%s connection = %@, info = %@, url = %@", buf, 0x2Au);
  }
  performer = self->_performer;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __79__SVXSession_assistantConnection_setUserActivtiyInfoAndMakeCurrent_webpageURL___block_invoke;
  v15[3] = &unk_24D24EF00;
  v15[4] = self;
  v16 = v10;
  v17 = v9;
  v13 = v9;
  v14 = v10;
  -[SVXPerforming performBlock:](performer, "performBlock:", v15);

}

- (void)assistantConnection:(id)a3 willStartAudioPlaybackRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXPerforming *performer;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[SVXSession assistantConnection:willStartAudioPlaybackRequest:]";
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_debug_impl(&dword_214934000, v8, OS_LOG_TYPE_DEBUG, "%s connection = %@, request = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__SVXSession_assistantConnection_willStartAudioPlaybackRequest___block_invoke;
  v11[3] = &unk_24D24F018;
  v11[4] = self;
  v12 = v7;
  v10 = v7;
  -[SVXPerforming performBlock:](performer, "performBlock:", v11);

}

- (void)assistantConnection:(id)a3 didStartAudioPlaybackRequest:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int64_t v9;
  SVXPerforming *performer;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "-[SVXSession assistantConnection:didStartAudioPlaybackRequest:]";
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_debug_impl(&dword_214934000, v8, OS_LOG_TYPE_DEBUG, "%s connection = %@, request = %@", buf, 0x20u);
  }
  v9 = -[SVXSoundUtils getIDFromAudioPlaybackRequest:](self->_soundUtils, "getIDFromAudioPlaybackRequest:", v7);
  if ((unint64_t)(v9 - 1) <= 2)
    -[AFAnalytics logEventWithType:context:](self->_analytics, "logEventWithType:context:", 2 * (v9 - 1) + 2707, 0);
  performer = self->_performer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__SVXSession_assistantConnection_didStartAudioPlaybackRequest___block_invoke;
  v12[3] = &unk_24D24F018;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  -[SVXPerforming performBlock:](performer, "performBlock:", v12);

}

- (void)assistantConnection:(id)a3 didStopAudioPlaybackRequest:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int64_t v12;
  AFAnalytics *v13;
  void *v14;
  AFAnalytics *v15;
  uint64_t v16;
  AFAnalytics *analytics;
  AFAnalytics *v18;
  SVXPerforming *performer;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v26 = "-[SVXSession assistantConnection:didStopAudioPlaybackRequest:error:]";
    v27 = 2112;
    v28 = v8;
    v29 = 2112;
    v30 = v9;
    v31 = 2112;
    v32 = v10;
    _os_log_debug_impl(&dword_214934000, v11, OS_LOG_TYPE_DEBUG, "%s connection = %@, request = %@, error = %@", buf, 0x2Au);
  }
  v12 = -[SVXSoundUtils getIDFromAudioPlaybackRequest:](self->_soundUtils, "getIDFromAudioPlaybackRequest:", v9);
  switch(v12)
  {
    case 3:
      analytics = self->_analytics;
      AFAnalyticsContextCreateWithError();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = analytics;
      v16 = 2712;
      goto LABEL_9;
    case 2:
      v18 = self->_analytics;
      AFAnalyticsContextCreateWithError();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v18;
      v16 = 2710;
      goto LABEL_9;
    case 1:
      v13 = self->_analytics;
      AFAnalyticsContextCreateWithError();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v13;
      v16 = 2708;
LABEL_9:
      -[AFAnalytics logEventWithType:context:](v15, "logEventWithType:context:", v16, v14);

      break;
  }
  performer = self->_performer;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __68__SVXSession_assistantConnection_didStopAudioPlaybackRequest_error___block_invoke;
  v22[3] = &unk_24D24EF00;
  v22[4] = self;
  v23 = v9;
  v24 = v10;
  v20 = v10;
  v21 = v9;
  -[SVXPerforming performBlock:](performer, "performBlock:", v22);

}

- (void)assistantConnection:(id)a3 didHandleQuickStopWithAction:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  SVXPerforming *performer;
  _QWORD v9[6];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[SVXSession assistantConnection:didHandleQuickStopWithAction:]";
    v12 = 2112;
    v13 = v6;
    v14 = 2048;
    v15 = a4;
    _os_log_debug_impl(&dword_214934000, v7, OS_LOG_TYPE_DEBUG, "%s connection = %@, actions = %tu", buf, 0x20u);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__SVXSession_assistantConnection_didHandleQuickStopWithAction___block_invoke;
  v9[3] = &unk_24D24EA18;
  v9[4] = self;
  v9[5] = a4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v9);

}

- (void)assistantConnection:(id)a3 willProcessStartPlayback:(int64_t)a4 intent:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  SVXPerforming *performer;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  int64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  int64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v22 = "-[SVXSession assistantConnection:willProcessStartPlayback:intent:completion:]";
    v23 = 2112;
    v24 = v10;
    v25 = 2048;
    v26 = a4;
    v27 = 2112;
    v28 = v11;
    _os_log_debug_impl(&dword_214934000, v13, OS_LOG_TYPE_DEBUG, "%s connection = %@, playbackType = %ld, intent = %@", buf, 0x2Au);
  }
  performer = self->_performer;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __77__SVXSession_assistantConnection_willProcessStartPlayback_intent_completion___block_invoke;
  v17[3] = &unk_24D24DD40;
  v17[4] = self;
  v18 = v11;
  v19 = v12;
  v20 = a4;
  v15 = v12;
  v16 = v11;
  -[SVXPerforming performBlock:](performer, "performBlock:", v17);

}

- (void)assistantConnection:(id)a3 startPlaybackDidFail:(int64_t)a4
{
  id v6;
  NSObject *v7;
  SVXPerforming *performer;
  _QWORD v9[6];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[SVXSession assistantConnection:startPlaybackDidFail:]";
    v12 = 2112;
    v13 = v6;
    v14 = 2048;
    v15 = a4;
    _os_log_debug_impl(&dword_214934000, v7, OS_LOG_TYPE_DEBUG, "%s connection = %@, playbackType = %ld", buf, 0x20u);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__SVXSession_assistantConnection_startPlaybackDidFail___block_invoke;
  v9[3] = &unk_24D24EA18;
  v9[4] = self;
  v9[5] = a4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v9);

}

- (void)assistantConnection:(id)a3 audioSessionWillBecomeActive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  SVXPerforming *performer;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "-[SVXSession assistantConnection:audioSessionWillBecomeActive:]";
    v13 = 2112;
    v14 = v6;
    v15 = 1024;
    v16 = v4;
    _os_log_debug_impl(&dword_214934000, v7, OS_LOG_TYPE_DEBUG, "%s connection = %@, flag = %d", buf, 0x1Cu);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__SVXSession_assistantConnection_audioSessionWillBecomeActive___block_invoke;
  v9[3] = &unk_24D24DDE0;
  v9[4] = self;
  v10 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v9);

}

- (void)assistantConnection:(id)a3 audioSessionDidBecomeActive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  SVXPerforming *performer;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "-[SVXSession assistantConnection:audioSessionDidBecomeActive:]";
    v13 = 2112;
    v14 = v6;
    v15 = 1024;
    v16 = v4;
    _os_log_debug_impl(&dword_214934000, v7, OS_LOG_TYPE_DEBUG, "%s connection = %@, flag = %d", buf, 0x1Cu);
  }
  performer = self->_performer;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__SVXSession_assistantConnection_audioSessionDidBecomeActive___block_invoke;
  v9[3] = &unk_24D24DDE0;
  v9[4] = self;
  v10 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v9);

}

- (void)assistantConnection:(id)a3 startUIRequestWithText:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  SVXPerforming *performer;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "-[SVXSession assistantConnection:startUIRequestWithText:completion:]";
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    _os_log_debug_impl(&dword_214934000, v11, OS_LOG_TYPE_DEBUG, "%s connection = %@, text = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __68__SVXSession_assistantConnection_startUIRequestWithText_completion___block_invoke;
  v14[3] = &unk_24D24EF28;
  v14[4] = self;
  v15 = v10;
  v13 = v10;
  -[SVXPerforming performBlock:](performer, "performBlock:", v14);

}

- (void)assistantConnection:(id)a3 startUIRequestWithInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  SVXPerforming *performer;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "-[SVXSession assistantConnection:startUIRequestWithInfo:completion:]";
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    _os_log_debug_impl(&dword_214934000, v11, OS_LOG_TYPE_DEBUG, "%s connection = %@, info = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __68__SVXSession_assistantConnection_startUIRequestWithInfo_completion___block_invoke;
  v14[3] = &unk_24D24DE08;
  v15 = v10;
  v13 = v10;
  -[SVXPerforming performBlock:](performer, "performBlock:", v14);

}

- (void)assistantConnection:(id)a3 willProcessAppLaunchWithBundleIdentifier:(id)a4
{
  id v5;
  SVXPerforming *performer;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__SVXSession_assistantConnection_willProcessAppLaunchWithBundleIdentifier___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);

}

- (void)assistantConnection:(id)a3 appLaunchFailedWithBundleIdentifier:(id)a4
{
  id v5;
  SVXPerforming *performer;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__SVXSession_assistantConnection_appLaunchFailedWithBundleIdentifier___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);

}

- (void)acquireAudioSessionForReason:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXTaskContext *v9;
  void *v10;
  SVXPerforming *performer;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[SVXSession acquireAudioSessionForReason:completion:]";
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s reason = %@", buf, 0x16u);
  }
  LOWORD(v15) = 0;
  v9 = -[SVXTaskContext initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:]([SVXTaskContext alloc], "initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:", 12, mach_absolute_time(), 0, self->_currentRequestUUID, 0, 0, 0, 0, v15, 0, 0, 0, 0);
  -[SVXTaskTrackingCenter beginTrackingTaskWithContext:instrumentationContext:](self->_taskTrackingCenter, "beginTrackingTaskWithContext:instrumentationContext:", v9, self->_currentRequestInstrumentationContext);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  performer = self->_performer;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __54__SVXSession_acquireAudioSessionForReason_completion___block_invoke;
  v16[3] = &unk_24D24F068;
  v16[4] = self;
  v17 = v6;
  v18 = v10;
  v19 = v7;
  v12 = v10;
  v13 = v6;
  v14 = v7;
  -[SVXPerforming performBlock:](performer, "performBlock:", v16);

}

- (void)speechSynthesizerDidBecomeBusy
{
  NSObject *v3;
  SVXPerforming *performer;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SVXSession speechSynthesizerDidBecomeBusy]";
    _os_log_debug_impl(&dword_214934000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  performer = self->_performer;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__SVXSession_speechSynthesizerDidBecomeBusy__block_invoke;
  v5[3] = &unk_24D24EFF0;
  v5[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v5);
}

- (void)speechSynthesizerDidBecomeIdle
{
  NSObject *v3;
  SVXPerforming *performer;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SVXSession speechSynthesizerDidBecomeIdle]";
    _os_log_debug_impl(&dword_214934000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  performer = self->_performer;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__SVXSession_speechSynthesizerDidBecomeIdle__block_invoke;
  v5[3] = &unk_24D24EFF0;
  v5[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v5);
}

- (void)speechSynthesizerWillEnqueueRequest:(id)a3 taskTracker:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315650;
    v9 = "-[SVXSession speechSynthesizerWillEnqueueRequest:taskTracker:]";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_debug_impl(&dword_214934000, v7, OS_LOG_TYPE_DEBUG, "%s request = %@, taskTracker = %@", (uint8_t *)&v8, 0x20u);
  }

}

- (void)speechSynthesizerWillStartRequest:(id)a3 taskTracker:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  SVXSession *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  SVXPerforming *performer;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  int v33;
  _QWORD v34[5];
  id v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x24BE08FB0];
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v38 = "-[SVXSession speechSynthesizerWillStartRequest:taskTracker:]";
    v39 = 2112;
    v40 = v6;
    v41 = 2112;
    v42 = v7;
    _os_log_debug_impl(&dword_214934000, v9, OS_LOG_TYPE_DEBUG, "%s request = %@, taskTracker = %@", buf, 0x20u);
  }
  if (-[SVXSession _isTapToRadarEnabled](self, "_isTapToRadarEnabled"))
  {
    objc_msgSend(v7, "dialogIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXSession _tapToRadarManager](self, "_tapToRadarManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getRMVIssueDialogIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v10);

    if (v13)
    {
      v14 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "-[SVXSession speechSynthesizerWillStartRequest:taskTracker:]";
        v39 = 2112;
        v40 = v10;
        _os_log_impl(&dword_214934000, v14, OS_LOG_TYPE_INFO, "%s RMV issue (%@) detected, initiating auto tap-to-radar", buf, 0x16u);
      }
      objc_msgSend(v7, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "requestUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("Siri detected a voice recognition error");
      v18 = CFSTR("RMV");
      v19 = CFSTR("Recognize My Voice");
    }
    else
    {
      objc_msgSend(v11, "getDomainFatalIssueDialogIdentifiers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "containsObject:", v10);

      if (v24)
      {
        v25 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v38 = "-[SVXSession speechSynthesizerWillStartRequest:taskTracker:]";
          v39 = 2112;
          v40 = v10;
          _os_log_impl(&dword_214934000, v25, OS_LOG_TYPE_INFO, "%s Domain Fatal issue (%@) detected, initiating auto tap-to-radar", buf, 0x16u);
        }
        objc_msgSend(v7, "context");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "requestUUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = CFSTR("Siri detected a domain error");
        v18 = CFSTR("Domain Fatal");
        v20 = self;
        v21 = v10;
        v22 = v16;
        v19 = CFSTR("Domain Fatal");
        goto LABEL_13;
      }
      objc_msgSend(v11, "getWebSearchIssueDialogIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v15, "containsObject:", v10))
        goto LABEL_14;
      objc_msgSend(v11, "getEarlyCutoffUtterances");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "getRecognitionText");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "lowercaseString");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v29, "containsObject:", v31);

      if (!v33)
        goto LABEL_15;
      v32 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v38 = "-[SVXSession speechSynthesizerWillStartRequest:taskTracker:]";
        v39 = 2112;
        v40 = v10;
        _os_log_impl(&dword_214934000, v32, OS_LOG_TYPE_INFO, "%s Early cutoff issue (%@) detected, initiating auto tap-to-radar", buf, 0x16u);
      }
      objc_msgSend(v7, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "requestUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("Siri detected a potential speech problem");
      v18 = CFSTR("ASR Early Cutoff");
      v19 = CFSTR("Speech Recognition early cutoff caused web search");
    }
    v20 = self;
    v21 = v10;
    v22 = v16;
LABEL_13:
    -[SVXSession _promptRadarWithReason:requestID:displayReason:issueTitleName:issueDescName:](v20, "_promptRadarWithReason:requestID:displayReason:issueTitleName:issueDescName:", v21, v22, v17, v18, v19);

LABEL_14:
LABEL_15:

  }
  performer = self->_performer;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __60__SVXSession_speechSynthesizerWillStartRequest_taskTracker___block_invoke;
  v34[3] = &unk_24D24EF00;
  v34[4] = self;
  v35 = v6;
  v36 = v7;
  v27 = v7;
  v28 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v34);

}

- (void)speechSynthesizerDidStartRequest:(id)a3 record:(id)a4 taskTracker:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  SVXPerforming *performer;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v21 = "-[SVXSession speechSynthesizerDidStartRequest:record:taskTracker:]";
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v10;
    _os_log_debug_impl(&dword_214934000, v11, OS_LOG_TYPE_DEBUG, "%s request = %@, record = %@, taskTracker = %@", buf, 0x2Au);
  }
  performer = self->_performer;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __66__SVXSession_speechSynthesizerDidStartRequest_record_taskTracker___block_invoke;
  v16[3] = &unk_24D24E638;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  -[SVXPerforming performBlock:](performer, "performBlock:", v16);

}

- (void)speechSynthesizerDidFinishRequest:(id)a3 utteranceInfo:(id)a4 record:(id)a5 taskTracker:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  SVXPerforming *performer;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    v24 = "-[SVXSession speechSynthesizerDidFinishRequest:utteranceInfo:record:taskTracker:]";
    v25 = 2112;
    v26 = v10;
    v27 = 2112;
    v28 = v11;
    v29 = 2112;
    v30 = v12;
    v31 = 2112;
    v32 = v13;
    _os_log_debug_impl(&dword_214934000, v14, OS_LOG_TYPE_DEBUG, "%s request = %@, utteranceInfo = %@, record = %@, taskTracker = %@", buf, 0x34u);
  }
  performer = self->_performer;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __81__SVXSession_speechSynthesizerDidFinishRequest_utteranceInfo_record_taskTracker___block_invoke;
  v19[3] = &unk_24D24E638;
  v19[4] = self;
  v20 = v10;
  v21 = v12;
  v22 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v10;
  -[SVXPerforming performBlock:](performer, "performBlock:", v19);

}

- (void)speechSynthesizerDidCancelRequest:(id)a3 taskTracker:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXPerforming *performer;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[SVXSession speechSynthesizerDidCancelRequest:taskTracker:]";
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_debug_impl(&dword_214934000, v8, OS_LOG_TYPE_DEBUG, "%s request = %@, taskTracker = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__SVXSession_speechSynthesizerDidCancelRequest_taskTracker___block_invoke;
  v12[3] = &unk_24D24EF00;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v12);

}

- (void)speechSynthesizerDidInterruptRequest:(id)a3 taskTracker:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  SVXPerforming *performer;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[SVXSession speechSynthesizerDidInterruptRequest:taskTracker:]";
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_debug_impl(&dword_214934000, v8, OS_LOG_TYPE_DEBUG, "%s request = %@, taskTracker = %@", buf, 0x20u);
  }
  performer = self->_performer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__SVXSession_speechSynthesizerDidInterruptRequest_taskTracker___block_invoke;
  v12[3] = &unk_24D24EF00;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v12);

}

- (void)speechSynthesizerDidFailRequest:(id)a3 taskTracker:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  SVXPerforming *performer;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v21 = "-[SVXSession speechSynthesizerDidFailRequest:taskTracker:error:]";
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v10;
    _os_log_debug_impl(&dword_214934000, v11, OS_LOG_TYPE_DEBUG, "%s request = %@, taskTracker = %@, error = %@", buf, 0x2Au);
  }
  performer = self->_performer;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __64__SVXSession_speechSynthesizerDidFailRequest_taskTracker_error___block_invoke;
  v16[3] = &unk_24D24E638;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  -[SVXPerforming performBlock:](performer, "performBlock:", v16);

}

- (void)stateFeedbackManagerDidStartPlaybackForStateFeedbackType:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!a3 && self->_isStateFeedbackEnabled && self->_currentState == 2)
  {
    v4 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v5 = v4;
      SRUIFSiriSessionEventGetDescription();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136315650;
      v8 = "-[SVXSession stateFeedbackManagerDidStartPlaybackForStateFeedbackType:]";
      v9 = 2048;
      v10 = 0;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s #statefeedback SRUIFSiriStateFeedbackType:%ld SRUIFSiriSessionEvent: %@", (uint8_t *)&v7, 0x20u);

    }
    -[SVXSession _setCurrentState:](self, "_setCurrentState:", 3);
  }
}

- (void)taskTrackingCenterWillBecomeBusy:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "-[SVXSession taskTrackingCenterWillBecomeBusy:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s taskTrackingCenter = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__SVXSession_taskTrackingCenterWillBecomeBusy___block_invoke;
  v7[3] = &unk_24D24EFF0;
  v7[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v7);

}

- (void)taskTrackingCenter:(id)a3 didBeginTrackingTaskWithContext:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315650;
    v9 = "-[SVXSession taskTrackingCenter:didBeginTrackingTaskWithContext:]";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s taskTrackingCenter = %@, context = %@", (uint8_t *)&v8, 0x20u);
  }

}

- (void)taskTrackingCenter:(id)a3 didEndTrackingTaskWithContext:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315650;
    v9 = "-[SVXSession taskTrackingCenter:didEndTrackingTaskWithContext:]";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s taskTrackingCenter = %@, context = %@", (uint8_t *)&v8, 0x20u);
  }

}

- (void)taskTrackingCenterDidBecomeIdle:(id)a3
{
  id v5;
  NSObject *v6;
  SVXPerforming *performer;
  _QWORD v8[6];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[SVXSession taskTrackingCenterDidBecomeIdle:]";
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s taskTrackingCenter = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__SVXSession_taskTrackingCenterDidBecomeIdle___block_invoke;
  v8[3] = &unk_24D24EA18;
  v8[4] = self;
  v8[5] = a2;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);

}

- (void)_activateWithContext:(id)a3 options:(unint64_t)a4 deviceSetupContext:(id)a5 deviceProblemsState:(id)a6 localDeviceContext:(id)a7 speechSynthesisRecord:(id)a8 speechSynthesisState:(int64_t)a9 speechRecordingAlertPolicy:(id)a10 taskTracker:(id)a11 completion:(id)a12
{
  id v17;
  const __CFString *v18;
  id v19;
  __CFString *v20;
  id *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  __CFString *v26;
  NSObject *v27;
  __CFString *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  SVXSession *v32;
  __CFString *v33;
  __CFString *v34;
  NSObject *v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  SVXSessionDelegate **p_delegate;
  id WeakRetained;
  unint64_t v43;
  NSObject *v44;
  void *v45;
  SASetApplicationContext *setApplicationContext;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  int v50;
  int v51;
  void *v52;
  id v53;
  __CFString *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  unint64_t v65;
  unint64_t v66;
  void *v67;
  SVXSpeechSynthesisRequest *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  NSObject *v74;
  id *v75;
  os_signpost_id_t v76;
  NSObject *v77;
  NSObject *v78;
  NSObject *v79;
  double v80;
  uint64_t v81;
  void *v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  double v93;
  double v94;
  void *v95;
  void *v96;
  int64_t activityState;
  NSObject *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  const __CFString *v103;
  NSObject *v104;
  uint64_t v105;
  uint64_t v106;
  NSObject *v107;
  void *v108;
  void *v109;
  char v110;
  NSObject *v111;
  NSObject *v112;
  void *v113;
  int v114;
  NSObject *v115;
  void *v116;
  int v117;
  NSObject *v118;
  NSObject *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  int IsActive;
  NSObject *v125;
  id v126;
  NSObject *v127;
  uint64_t v128;
  NSObject *v129;
  uint64_t v130;
  NSObject *v131;
  uint64_t v132;
  NSObject *v133;
  int v134;
  NSObject *v135;
  int v136;
  NSObject *v137;
  id v138;
  NSObject *v139;
  uint64_t v140;
  NSObject *v141;
  uint64_t v142;
  NSObject *v143;
  int v144;
  NSObject *v145;
  id v146;
  NSObject *v147;
  id v148;
  NSObject *v149;
  int v150;
  NSObject *v151;
  void *v152;
  NSObject *v153;
  void *v154;
  id v155;
  void *v156;
  unint64_t v157;
  uint64_t v158;
  id v159;
  NSObject *v160;
  __CFString *v161;
  void *v162;
  NSObject *v163;
  uint64_t v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  NSObject *v170;
  void *v171;
  void *v172;
  void *v173;
  id v174;
  NSObject *v175;
  int v176;
  NSObject *v177;
  __CFString *v178;
  __CFString *v179;
  __CFString *v180;
  void *v181;
  uint64_t v182;
  SVXActivationContext *currentActivationContext;
  void *v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  void *v188;
  const __CFString *v189;
  void *v190;
  id v191;
  void *v192;
  id v193;
  id v194;
  id v196;
  _QWORD v197[5];
  id v198;
  _QWORD v199[5];
  id v200;
  _QWORD v201[5];
  id v202;
  id v203;
  _QWORD v204[5];
  id v205;
  id v206;
  _QWORD v207[5];
  void *v208;
  __CFString *v209;
  id v210;
  id v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  int v215;
  _QWORD v216[5];
  id v217;
  id v218;
  _QWORD v219[5];
  id v220;
  id v221;
  _QWORD v222[4];
  __CFString *v223;
  SVXSession *v224;
  id v225;
  id v226;
  id v227;
  uint64_t v228;
  const __CFString *v229;
  uint64_t v230;
  void *v231;
  uint8_t buf[4];
  const char *v233;
  __int16 v234;
  _BYTE v235[10];
  const __CFString *v236;
  __int16 v237;
  __CFString *v238;
  uint64_t v239;

  v239 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v196 = a5;
  v18 = (const __CFString *)a6;
  v19 = a7;
  v194 = a8;
  v193 = a10;
  v20 = (__CFString *)a11;
  v191 = a12;
  v21 = (id *)MEMORY[0x24BE08FB0];
  v22 = (id)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    if (a4)
    {
      v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v24 = v23;
      if ((a4 & 1) != 0)
        objc_msgSend(v23, "addObject:", CFSTR("clearsContext"));
      v25 = (void *)objc_msgSend(v24, "copy");

    }
    else
    {
      v25 = (void *)MEMORY[0x24BDBD1A8];
    }
    v26 = v25;
    *(_DWORD *)buf = 136315906;
    v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSyn"
           "thesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
    v234 = 2112;
    *(_QWORD *)v235 = v17;
    *(_WORD *)&v235[8] = 2112;
    v236 = v26;
    v237 = 2112;
    v238 = v20;
    _os_log_impl(&dword_214934000, v22, OS_LOG_TYPE_INFO, "%s context = %@, options = %@, taskTracker = %@", buf, 0x2Au);

  }
  v27 = *v21;
  v28 = (__CFString *)v18;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSyn"
           "thesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
    v234 = 2112;
    *(_QWORD *)v235 = v196;
    *(_WORD *)&v235[8] = 2112;
    v236 = v18;
    _os_log_impl(&dword_214934000, v27, OS_LOG_TYPE_INFO, "%s deviceSetupContext = %@, deviceProblemsState = %@", buf, 0x20u);
  }

  v29 = *v21;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v19, "identifier");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSyn"
           "thesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
    v234 = 2112;
    *(_QWORD *)v235 = v30;
    _os_log_impl(&dword_214934000, v29, OS_LOG_TYPE_INFO, "%s localDeviceContext = %@", buf, 0x16u);

  }
  v192 = v19;

  v31 = *v21;
  v32 = self;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a9 > 2)
      v33 = CFSTR("(unknown)");
    else
      v33 = off_24D24D6F8[a9];
    v34 = v33;
    *(_DWORD *)buf = 136315650;
    v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSyn"
           "thesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
    v234 = 2112;
    *(_QWORD *)v235 = v194;
    *(_WORD *)&v235[8] = 2112;
    v236 = v34;
    _os_log_impl(&dword_214934000, v31, OS_LOG_TYPE_INFO, "%s speechSynthesisRecord = %@, speechSynthesisState = %@", buf, 0x20u);

  }
  v35 = *v21;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSyn"
           "thesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
    v234 = 2112;
    *(_QWORD *)v235 = v193;
    _os_log_impl(&dword_214934000, v35, OS_LOG_TYPE_INFO, "%s speechRecordingAlertPolicy = %@", buf, 0x16u);
  }

  v36 = objc_msgSend(v17, "source");
  if (v36 <= 9
    && ((1 << v36) & 0x3D6) != 0
    && (-[AFPreferences assistantIsEnabled](self->_preferences, "assistantIsEnabled") & 1) == 0)
  {
    objc_msgSend(v17, "requestInfo");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "activationEvent");

    v39 = *v21;
    if (v38 != 6)
    {
      v59 = v18;
      if (os_log_type_enabled((os_log_t)*v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speec"
               "hSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
        _os_log_error_impl(&dword_214934000, v39, OS_LOG_TYPE_ERROR, "%s Siri is not enabled.", buf, 0xCu);
      }
      v60 = (void *)MEMORY[0x24BDD1540];
      v230 = *MEMORY[0x24BDD1398];
      objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:", 18);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v231 = v61;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v231, &v230, 1);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 1, v62);
      v53 = (id)objc_claimAutoreleasedReturnValue();

      v54 = v20;
      v57 = v191;
      v58 = v192;
      if (v191)
        (*((void (**)(id, id))v191 + 2))(v191, v53);
      v28 = (__CFString *)v59;
      goto LABEL_219;
    }
    v40 = v39;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechS"
             "ynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
      _os_log_error_impl(&dword_214934000, v40, OS_LOG_TYPE_ERROR, "%s Siri is not enabled, but since this is a critical security alert, we will allow this announcement", buf, 0xCu);
    }

  }
  -[SVXSession _resetMyriadDecision](self, "_resetMyriadDecision");
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "session:willActivateWithContext:", self, v17);

  v43 = objc_msgSend(v17, "source");
  if (v43 > 9 || ((1 << v43) & 0x3C6) == 0 || (objc_msgSend(MEMORY[0x24BE09170], "isAvailable") & 1) != 0)
  {
    if ((a4 & 1) != 0)
    {
      v44 = *v21;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speec"
               "hSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
        _os_log_impl(&dword_214934000, v44, OS_LOG_TYPE_DEFAULT, "%s clearContext", buf, 0xCu);
      }

      -[SVXSession _connection:](self, "_connection:", 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "clearContext");

      setApplicationContext = self->_setApplicationContext;
      self->_setApplicationContext = 0;

    }
    v189 = v18;
    v190 = v17;
    switch(objc_msgSend(v17, "source"))
    {
      case 1:
      case 9:
        objc_msgSend(v17, "requestInfo");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = *v21;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          v234 = 2112;
          *(_QWORD *)v235 = v47;
          _os_log_impl(&dword_214934000, v48, OS_LOG_TYPE_INFO, "%s requestInfo = %@", buf, 0x16u);
        }

        v49 = *v21;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          v50 = objc_msgSend(v47, "isSpeechRequest");
          v51 = AFPreferencesTypeToSiriEnabled();
          *(_DWORD *)buf = 136315650;
          v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          v234 = 1024;
          *(_DWORD *)v235 = v50;
          *(_WORD *)&v235[4] = 1024;
          *(_DWORD *)&v235[6] = v51;
          _os_log_impl(&dword_214934000, v49, OS_LOG_TYPE_INFO, "%s isSpeechRequest = %d, isTypeToSiriEnabled = %d.", buf, 0x18u);
        }

        if (objc_msgSend(v47, "isSpeechRequest"))
        {
          objc_msgSend(v47, "speechRequestOptions");
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          v47 = 0;
          v53 = 0;
          v54 = v20;
          if (v52)
            goto LABEL_90;
        }
        else
        {
          v54 = v20;
        }
        v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE09360]), "initWithActivationEvent:", 1);
        v53 = v47;
LABEL_90:
        objc_msgSend(v190, "buttonEvent");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v82, "type") == 1)
        {
          v83 = *v21;
          if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
          {
            v84 = objc_msgSend(v190, "timestamp");
            v85 = objc_msgSend(v82, "timestamp");
            *(_DWORD *)buf = 136315650;
            v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:s"
                   "peechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
            v234 = 2048;
            *(_QWORD *)v235 = v84;
            v32 = self;
            *(_WORD *)&v235[8] = 2048;
            v236 = (const __CFString *)v85;
            _os_log_impl(&dword_214934000, v83, OS_LOG_TYPE_INFO, "%s button_track typedown context = %lld button = %lld", buf, 0x20u);
          }

          v86 = objc_msgSend(v82, "timestamp");
          if (v86)
          {
            v87 = v86;
            AFMachAbsoluteTimeGetTimeInterval();
            objc_msgSend(v52, "setHomeButtonDownEventTime:");
            objc_msgSend(v52, "setHomeButtonDownEventMachAbsoluteTime:", v87);
LABEL_100:
            AFMachAbsoluteTimeGetTimeInterval();
            objc_msgSend(v52, "setActivationEventTime:");
            objc_msgSend(v52, "setActivationEventMachAbsoluteTime:", v87);
LABEL_101:
            objc_msgSend(v52, "setSpeechSynthesisRecord:", v194);

            if (v52)
              goto LABEL_126;
            goto LABEL_102;
          }
        }
        else if (objc_msgSend(v82, "type") == 2)
        {
          v88 = *v21;
          if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
          {
            v89 = objc_msgSend(v190, "timestamp");
            v90 = objc_msgSend(v82, "timestamp");
            *(_DWORD *)buf = 136315650;
            v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:s"
                   "peechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
            v234 = 2048;
            *(_QWORD *)v235 = v89;
            v32 = self;
            *(_WORD *)&v235[8] = 2048;
            v236 = (const __CFString *)v90;
            _os_log_impl(&dword_214934000, v88, OS_LOG_TYPE_INFO, "%s button_track typeup context = %lld button = %lld", buf, 0x20u);
          }

        }
        v87 = objc_msgSend(v190, "timestamp");
        if (!v87)
          goto LABEL_101;
        goto LABEL_100;
      case 2:
      case 8:
        objc_msgSend(v17, "requestInfo");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v63;
        if (v63)
        {
          if (objc_msgSend(v63, "isSpeechRequest"))
          {
            objc_msgSend(v53, "speechRequestOptions");
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            v53 = 0;
          }
          else
          {
            v52 = 0;
          }
        }
        else
        {
          v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE09360]), "initWithActivationEvent:", 0);
        }
        if (!objc_msgSend(v52, "endpointerOperationMode"))
          objc_msgSend(v52, "setEndpointerOperationMode:", 3);
        objc_msgSend(v52, "activationEventTime");
        v54 = v20;
        if (v93 != 0.0)
          goto LABEL_124;
        goto LABEL_120;
      case 3:
        v64 = *v21;
        if (os_log_type_enabled((os_log_t)*v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          _os_log_impl(&dword_214934000, v64, OS_LOG_TYPE_INFO, "%s Starting active audio session request for Myriad...", buf, 0xCu);
        }
        v219[0] = MEMORY[0x24BDAC760];
        v219[1] = 3221225472;
        v219[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_101;
        v219[3] = &unk_24D24DF48;
        v219[4] = self;
        v220 = v17;
        v57 = v191;
        v221 = v191;
        v54 = v20;
        -[SVXSession _startActiveAudioSessionRequestForType:taskTracker:completion:](self, "_startActiveAudioSessionRequestForType:taskTracker:completion:", 2, v20, v219);

        v53 = 0;
        goto LABEL_104;
      case 4:
        v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE09360]), "initWithActivationEvent:", 5);
        objc_msgSend(v52, "setEndpointerOperationMode:", 3);
        if (v194 && (v65 = objc_msgSend(v194, "beginTimestamp"), v66 = objc_msgSend(v194, "endTimestamp"), v65) && v66)
        {
          if (v65 <= v66)
            v65 = v66;
        }
        else
        {
          v65 = objc_msgSend(v190, "timestamp");
          if (!v65)
            goto LABEL_108;
        }
        AFMachAbsoluteTimeGetTimeInterval();
        objc_msgSend(v52, "setActivationEventTime:");
        objc_msgSend(v52, "setActivationEventMachAbsoluteTime:", v65);
LABEL_108:
        objc_msgSend(v52, "setRecordingAlertPolicy:", v193);
        v53 = 0;
        v54 = v20;
        if (!v52)
          goto LABEL_102;
        goto LABEL_126;
      case 5:
        objc_msgSend(v17, "systemEvent");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        switch(objc_msgSend(v67, "type"))
        {
          case 1:
            v68 = -[SVXSpeechSynthesisRequest initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:]([SVXSpeechSynthesisRequest alloc], "initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:", 3, 1, 0, 0, CFSTR("SIRI_VOX_SYSTEM_DEVICE_SETUP_COMPLETION"), 0, 0);
            v69 = objc_msgSend(v67, "audioSessionID");
            v70 = 0;
            v185 = 0;
            v186 = 0;
            v71 = v67;
            v72 = 4;
            goto LABEL_239;
          case 2:
            v68 = -[SVXSpeechSynthesisRequest initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:]([SVXSpeechSynthesisRequest alloc], "initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:", 3, 1, 0, 0, CFSTR("SIRI_VOX_SYSTEM_FACTORY_RESET_CONFIRMATION"), 0, 0);
            goto LABEL_238;
          case 3:
            v151 = *v21;
            if (os_log_type_enabled((os_log_t)*v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              _os_log_impl(&dword_214934000, v151, OS_LOG_TYPE_INFO, "%s Starting active audio session request for Audio Ducking Coordination...", buf, 0xCu);
            }
            v216[0] = MEMORY[0x24BDAC760];
            v216[1] = 3221225472;
            v216[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_102;
            v216[3] = &unk_24D24DF48;
            v216[4] = self;
            v217 = v17;
            v57 = v191;
            v218 = v191;
            v54 = v20;
            -[SVXSession _startActiveAudioSessionRequestForType:taskTracker:completion:](self, "_startActiveAudioSessionRequestForType:taskTracker:completion:", 1, v20, v216);

            v152 = v217;
            goto LABEL_241;
          case 7:
            v184 = v67;
            objc_msgSend(v67, "deviceSetupFlowScene");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            v157 = objc_msgSend(v156, "sceneID");
            if (v157 == 5)
              v158 = 5;
            else
              v158 = 0;
            v186 = v158;
            v159 = *v21;
            v58 = v192;
            if (os_log_type_enabled((os_log_t)*v21, OS_LOG_TYPE_INFO))
            {
              v160 = v159;
              if (v157 > 9)
                v161 = CFSTR("(unknown)");
              else
                v161 = off_24D24E738[v157];
              v178 = v161;
              v179 = CFSTR("unspecified");
              v180 = off_24D24D238[v186];
              *(_DWORD *)buf = 136315906;
              v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              v234 = 2112;
              *(_QWORD *)v235 = v178;
              *(_WORD *)&v235[8] = 2112;
              v236 = CFSTR("unspecified");
              v237 = 2112;
              v238 = v180;
              _os_log_impl(&dword_214934000, v160, OS_LOG_TYPE_INFO, "%s deviceSetupFlowSceneID = %@, introductionSoundID = %@, conclusionSoundID = %@", buf, 0x2Au);

            }
            SVXDeviceSetupCreateSpeechSynthesisRequestForSceneWithID(objc_msgSend(v156, "sceneID"));
            v68 = (SVXSpeechSynthesisRequest *)objc_claimAutoreleasedReturnValue();
            v71 = v184;
            v69 = objc_msgSend(v184, "audioSessionID");

            v70 = 0;
            v185 = 0;
            goto LABEL_250;
          case 8:
            objc_msgSend(v67, "storeDemo");
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            v163 = *v21;
            if (os_log_type_enabled((os_log_t)*v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              v234 = 2112;
              *(_QWORD *)v235 = v162;
              _os_log_impl(&dword_214934000, v163, OS_LOG_TYPE_INFO, "%s storeDemo = %@", buf, 0x16u);
            }
            objc_msgSend(v162, "languageCode");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v185 = objc_msgSend(v162, "gender");
            SVXStoreDemoGetLocalizationKey(objc_msgSend(v162, "transcriptID"));
            v164 = objc_claimAutoreleasedReturnValue();
            v165 = v162;
            v58 = v192;
            v188 = v165;
            if (v164)
            {
              v166 = (void *)v164;
              -[SVXSession _connection:](self, "_connection:", 1);
              v167 = (void *)objc_claimAutoreleasedReturnValue();
              -[SVXSession _createClientConfiguration:storeDemo:preferences:](self, "_createClientConfiguration:storeDemo:preferences:", v196, v165, self->_preferences);
              v168 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v167, "setConfiguration:", v168);

              v68 = -[SVXSpeechSynthesisRequest initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:]([SVXSpeechSynthesisRequest alloc], "initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:", 3, 1, 0, 0, v166, 0, 0);
              v169 = v166;
            }
            else
            {
              v177 = *v21;
              if (os_log_type_enabled((os_log_t)*v21, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceConte"
                       "xt:speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
                _os_log_impl(&dword_214934000, v177, OS_LOG_TYPE_INFO, "%s No valid localizationKey", buf, 0xCu);
              }
              v68 = 0;
              v169 = 0;
            }
            v69 = objc_msgSend(v67, "audioSessionID");

            v186 = 0;
            v71 = v67;
LABEL_250:
            v72 = 0;
            goto LABEL_251;
          case 12:
            if (SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext))
            {
              v170 = *v21;
              v54 = v20;
              v58 = v192;
              if (os_log_type_enabled((os_log_t)*v21, OS_LOG_TYPE_ERROR))
              {
                currentActivationContext = self->_currentActivationContext;
                *(_DWORD *)buf = 136315650;
                v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceConte"
                       "xt:speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
                v234 = 2112;
                *(_QWORD *)v235 = v17;
                *(_WORD *)&v235[8] = 2112;
                v236 = (const __CFString *)currentActivationContext;
                _os_log_error_impl(&dword_214934000, v170, OS_LOG_TYPE_ERROR, "%s Unable to activate with context %@ because the current activation context %@ is a speech request.", buf, 0x20u);
              }
              v171 = (void *)MEMORY[0x24BDD1540];
              v228 = *MEMORY[0x24BDD0FC8];
              v229 = CFSTR("Rejected alarms and timers announcement activation because there's an ongoing speech request.");
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v229, &v228, 1);
              v172 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v171, "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 5, v172);
              v173 = (void *)objc_claimAutoreleasedReturnValue();

              v174 = objc_loadWeakRetained((id *)p_delegate);
              objc_msgSend(v174, "session:didNotActivateWithContext:error:", self, v17, v173);

              v57 = v191;
              if (v191)
                (*((void (**)(id, void *))v191 + 2))(v191, v173);

              v32 = self;
            }
            else
            {
              v176 = objc_msgSend(v67, "audioSessionID");
              v207[0] = MEMORY[0x24BDAC760];
              v207[1] = 3221225472;
              v207[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_105;
              v207[3] = &unk_24D24DF20;
              v207[4] = self;
              v208 = 0;
              v215 = v176;
              v213 = 0;
              v214 = 0;
              v212 = 0;
              v54 = v20;
              v209 = v20;
              v210 = v17;
              v57 = v191;
              v211 = v191;
              -[SVXSession _getAlarmAndTimerFiringContextWithCompletion:](self, "_getAlarmAndTimerFiringContextWithCompletion:", v207);

              v152 = v208;
LABEL_241:

              v58 = v192;
            }

            v53 = 0;
            v52 = 0;
            goto LABEL_201;
          case 13:
            objc_msgSend(v67, "speechSynthesisRequest");
            v68 = (SVXSpeechSynthesisRequest *)objc_claimAutoreleasedReturnValue();
            v175 = *v21;
            if (os_log_type_enabled((os_log_t)*v21, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              v234 = 2112;
              *(_QWORD *)v235 = v68;
              _os_log_impl(&dword_214934000, v175, OS_LOG_TYPE_INFO, "%s speechSynthesisRequest = %@", buf, 0x16u);
            }
LABEL_238:
            v69 = objc_msgSend(v67, "audioSessionID");
            v70 = 0;
            v185 = 0;
            v186 = 0;
            v71 = v67;
            v72 = 0;
LABEL_239:
            v58 = v192;
LABEL_251:

            if (v68)
            {
              v181 = (void *)MEMORY[0x2199D9374]();
              v182 = MEMORY[0x24BDAC760];
              v199[0] = MEMORY[0x24BDAC760];
              v199[1] = 3221225472;
              v199[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_3_113;
              v199[3] = &unk_24D24DED0;
              v32 = self;
              v199[4] = self;
              v200 = v190;
              v197[0] = v182;
              v197[1] = 3221225472;
              v197[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_4;
              v197[3] = &unk_24D24DEF8;
              v197[4] = self;
              v57 = v191;
              v198 = v191;
              v54 = v20;
              -[SVXSession _startSpeechSynthesisRequest:languageCode:voiceName:gender:audioSessionID:introductionSoundID:conclusionSoundID:taskTracker:postActivationHandler:completion:](self, "_startSpeechSynthesisRequest:languageCode:voiceName:gender:audioSessionID:introductionSoundID:conclusionSoundID:taskTracker:postActivationHandler:completion:", v68, v70, 0, v185, v69, v72, v186, v20, v199, v197);

              objc_autoreleasePoolPop(v181);
              v53 = 0;
              v52 = 0;
              goto LABEL_202;
            }
            v52 = 0;
            v53 = 0;
            v54 = v20;
            break;
          default:

            goto LABEL_211;
        }
        goto LABEL_213;
      case 6:
        objc_msgSend(v17, "requestInfo");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = *v21;
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          v234 = 2112;
          *(_QWORD *)v235 = v73;
          _os_log_impl(&dword_214934000, v74, OS_LOG_TYPE_INFO, "%s requestInfo = %@", buf, 0x16u);
        }

        v75 = (id *)MEMORY[0x24BE08FE0];
        v76 = os_signpost_id_generate((os_log_t)*MEMORY[0x24BE08FE0]);
        v77 = *v75;
        v78 = v77;
        if (v76 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v77))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_214934000, v78, OS_SIGNPOST_INTERVAL_BEGIN, v76, "voiceUILaunch", "enableTelemetry=YES", buf, 2u);
        }

        v32 = self;
        self->_launchSignpostID = v76;
        if (objc_msgSend(v73, "isSpeechRequest"))
        {
          objc_msgSend(v73, "speechRequestOptions");
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          v73 = 0;
          v53 = 0;
          v54 = v20;
          if (v52)
            goto LABEL_117;
        }
        else
        {
          v54 = v20;
        }
        v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE09360]), "initWithActivationEvent:", 8);
        v53 = v73;
LABEL_117:
        if (!objc_msgSend(v52, "endpointerOperationMode"))
          objc_msgSend(v52, "setEndpointerOperationMode:", 3);
        objc_msgSend(v52, "activationEventTime");
        if (v94 == 0.0)
        {
LABEL_120:
          if (!objc_msgSend(v53, "timestamp") && !objc_msgSend(v190, "timestamp"))
            mach_absolute_time();
          AFMachAbsoluteTimeGetTimeInterval();
          objc_msgSend(v52, "setActivationEventTime:");
        }
LABEL_124:
        if (objc_msgSend(v52, "activationEventMachAbsoluteTime"))
        {
          if (v52)
            goto LABEL_126;
        }
        else
        {
          v106 = objc_msgSend(v53, "timestamp");
          if (!v106)
          {
            v106 = objc_msgSend(v190, "timestamp");
            if (!v106)
              v106 = mach_absolute_time();
          }
          objc_msgSend(v52, "setActivationEventMachAbsoluteTime:", v106);
          if (v52)
            goto LABEL_126;
        }
LABEL_102:
        if (!v53)
          goto LABEL_204;
        goto LABEL_103;
      case 7:
        objc_msgSend(v17, "requestInfo");
        v53 = (id)objc_claimAutoreleasedReturnValue();
        v79 = *v21;
        if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          v234 = 2112;
          *(_QWORD *)v235 = v53;
          _os_log_impl(&dword_214934000, v79, OS_LOG_TYPE_INFO, "%s requestInfo = %@", buf, 0x16u);
        }

        if (objc_msgSend(v53, "isSpeechRequest"))
        {
          objc_msgSend(v53, "speechRequestOptions");
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          v54 = v20;
          if (v52)
          {
            if (!objc_msgSend(v52, "endpointerOperationMode"))
              objc_msgSend(v52, "setEndpointerOperationMode:", 3);
            objc_msgSend(v52, "activationEventTime");
            if (v80 == 0.0)
            {
              if (!objc_msgSend(0, "timestamp") && !objc_msgSend(v190, "timestamp"))
                mach_absolute_time();
              AFMachAbsoluteTimeGetTimeInterval();
              objc_msgSend(v52, "setActivationEventTime:");
            }
            if (!objc_msgSend(v52, "activationEventMachAbsoluteTime"))
            {
              v81 = objc_msgSend(0, "timestamp");
              if (!v81)
              {
                v81 = objc_msgSend(v190, "timestamp");
                if (!v81)
                  v81 = mach_absolute_time();
              }
              objc_msgSend(v52, "setActivationEventMachAbsoluteTime:", v81);
            }
            v53 = 0;
LABEL_126:
            objc_msgSend(v196, "beginDate");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v196, "endDate");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            if (AFDeviceSetupIsActive())
            {
              activityState = v32->_activityState;

              if (activityState != 1)
              {
                v98 = *v21;
                if (os_log_type_enabled((os_log_t)*v21, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315138;
                  v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceCon"
                         "text:speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
                  _os_log_error_impl(&dword_214934000, v98, OS_LOG_TYPE_ERROR, "%s Siri is in device setup mode and is active.", buf, 0xCu);
                }
                v70 = 0;
                goto LABEL_212;
              }
            }
            else
            {

            }
            v99 = (void *)MEMORY[0x2199D9374]();
            objc_msgSend(v192, "playbackStateSnapshot");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v101 = objc_msgSend(v100, "playbackState");

            v102 = v196;
            v103 = v189;
            if (objc_msgSend(v52, "isVoiceTrigger"))
            {
              if (self->_currentRequestUUID)
              {
                v104 = *v21;
                if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315138;
                  v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceCon"
                         "text:speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
                  _os_log_impl(&dword_214934000, v104, OS_LOG_TYPE_INFO, "%s Barged-in over Siri request.", buf, 0xCu);
                }

                v105 = 2;
              }
              else
              {
                v105 = 0;
              }
              v187 = v99;
              if (a9 == 2)
              {
                v107 = *v21;
                v108 = v192;
                if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315138;
                  v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceCon"
                         "text:speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
                  _os_log_impl(&dword_214934000, v107, OS_LOG_TYPE_INFO, "%s Barged-in over Siri voice output.", buf, 0xCu);
                }

                v105 |= 4uLL;
              }
              else
              {
                v108 = v192;
              }
              objc_msgSend(v108, "homeAnnouncementSnapshot");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              v110 = objc_msgSend(v109, "state");

              if ((v110 & 1) != 0)
              {
                v111 = *v21;
                if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315138;
                  v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceCon"
                         "text:speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
                  _os_log_impl(&dword_214934000, v111, OS_LOG_TYPE_INFO, "%s Barged-in over home announcement playback.", buf, 0xCu);
                }

                v105 |= 0x20uLL;
              }
              if (v101 == 1)
              {
                v112 = *v21;
                if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315138;
                  v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceCon"
                         "text:speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
                  _os_log_impl(&dword_214934000, v112, OS_LOG_TYPE_INFO, "%s Barged-in over media playback.", buf, 0xCu);
                }

                v105 |= 1uLL;
              }
              objc_msgSend(v108, "alarmSnapshot");
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              v114 = objc_msgSend(v113, "hasFiringAlarms");

              if (v114)
              {
                v115 = *v21;
                if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315138;
                  v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceCon"
                         "text:speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
                  _os_log_impl(&dword_214934000, v115, OS_LOG_TYPE_INFO, "%s Barged-in over firing alarms.", buf, 0xCu);
                }

                v105 |= 8uLL;
              }
              objc_msgSend(v108, "timerSnapshot");
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              v117 = objc_msgSend(v116, "hasFiringTimers");

              if (v117)
              {
                v118 = *v21;
                v102 = v196;
                v99 = v187;
                if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315138;
                  v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceCon"
                         "text:speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
                  _os_log_impl(&dword_214934000, v118, OS_LOG_TYPE_INFO, "%s Barged-in over firing timers.", buf, 0xCu);
                }

                v105 |= 0x10uLL;
              }
              else
              {
                v102 = v196;
                v99 = v187;
              }
              objc_msgSend(v52, "setBargeInOptions:", v105);
              v103 = v189;
            }
            v58 = v192;
            if ((-[AFInstanceContext supportsAudioPowerUpdate](self->_instanceContext, "supportsAudioPowerUpdate") & 1) == 0)
            {
              v119 = *v21;
              if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceConte"
                       "xt:speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
                _os_log_impl(&dword_214934000, v119, OS_LOG_TYPE_INFO, "%s Disabled input and output audio power updates.", buf, 0xCu);
              }

              objc_msgSend(v52, "setDisableInputAudioPowerUpdate:", 1);
              objc_msgSend(v52, "setDisableOutputAudioPowerUpdate:", 1);
            }
            objc_msgSend(v52, "setIsMediaPlaying:", v101 == 1);
            objc_msgSend(v52, "setSpeechSynthesisRecord:", v194);
            objc_msgSend(v102, "beginDate");
            v120 = objc_claimAutoreleasedReturnValue();
            v121 = v102;
            v122 = (void *)v120;
            objc_msgSend(v121, "endDate");
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            IsActive = AFDeviceSetupIsActive();

            if (IsActive)
              objc_msgSend(v52, "setClientAnalyticsContext:", &unk_24D26FAA0);
            if (objc_msgSend(v190, "source") != 4)
              objc_msgSend(v52, "setReloadSmartSiriVolume:", 1);
            v125 = *v21;
            if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v52, "activationEvent");
              AFSpeechEventGetDescription();
              v126 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              v234 = 2112;
              *(_QWORD *)v235 = v126;
              _os_log_impl(&dword_214934000, v125, OS_LOG_TYPE_INFO, "%s speechRequestOptions.activationEvent = %@", buf, 0x16u);

            }
            v127 = *v21;
            if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v52, "activationEventTime");
              *(_DWORD *)buf = 136315394;
              v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              v234 = 2048;
              *(_QWORD *)v235 = v128;
              _os_log_impl(&dword_214934000, v127, OS_LOG_TYPE_INFO, "%s speechRequestOptions.activationEventTime = %f", buf, 0x16u);
            }

            v129 = *v21;
            if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
            {
              v130 = objc_msgSend(v52, "activationEventMachAbsoluteTime");
              *(_DWORD *)buf = 136315394;
              v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              v234 = 2048;
              *(_QWORD *)v235 = v130;
              _os_log_impl(&dword_214934000, v129, OS_LOG_TYPE_INFO, "%s speechRequestOptions.activationEventMachAbsoluteTime = %llu", buf, 0x16u);
            }

            v131 = *v21;
            if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
            {
              v132 = objc_msgSend(v52, "bargeInOptions");
              *(_DWORD *)buf = 136315394;
              v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              v234 = 2048;
              *(_QWORD *)v235 = v132;
              _os_log_impl(&dword_214934000, v131, OS_LOG_TYPE_INFO, "%s speechRequestOptions.bargeInOptions = %lu", buf, 0x16u);
            }

            v133 = *v21;
            if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
            {
              v134 = objc_msgSend(v52, "disableInputAudioPowerUpdate");
              *(_DWORD *)buf = 136315394;
              v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              v234 = 1024;
              *(_DWORD *)v235 = v134;
              _os_log_impl(&dword_214934000, v133, OS_LOG_TYPE_INFO, "%s speechRequestOptions.disableInputAudioPowerUpdate = %d", buf, 0x12u);
            }

            v135 = *v21;
            if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
            {
              v136 = objc_msgSend(v52, "disableOutputAudioPowerUpdate");
              *(_DWORD *)buf = 136315394;
              v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              v234 = 1024;
              *(_DWORD *)v235 = v136;
              _os_log_impl(&dword_214934000, v135, OS_LOG_TYPE_INFO, "%s speechRequestOptions.disableOutputAudioPowerUpdate = %d", buf, 0x12u);
            }

            v137 = *v21;
            if (os_log_type_enabled(v137, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v52, "endpointerOperationMode");
              AFSpeechEndpointerOperationModeGetName();
              v138 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              v234 = 2112;
              *(_QWORD *)v235 = v138;
              _os_log_impl(&dword_214934000, v137, OS_LOG_TYPE_INFO, "%s speechRequestOptions.endpointerOperationMode = %@", buf, 0x16u);

            }
            v139 = *v21;
            if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v52, "homeButtonDownEventTime");
              *(_DWORD *)buf = 136315394;
              v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              v234 = 2048;
              *(_QWORD *)v235 = v140;
              _os_log_impl(&dword_214934000, v139, OS_LOG_TYPE_INFO, "%s speechRequestOptions.homeButtonDownEventTime = %f", buf, 0x16u);
            }

            v141 = *v21;
            if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
            {
              v142 = objc_msgSend(v52, "homeButtonDownEventMachAbsoluteTime");
              *(_DWORD *)buf = 136315394;
              v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              v234 = 2048;
              *(_QWORD *)v235 = v142;
              _os_log_impl(&dword_214934000, v141, OS_LOG_TYPE_INFO, "%s speechRequestOptions.homeButtonDownEventMachAbsoluteTime = %llu", buf, 0x16u);
            }

            v143 = *v21;
            if (os_log_type_enabled(v143, OS_LOG_TYPE_INFO))
            {
              v144 = objc_msgSend(v52, "isMediaPlaying");
              *(_DWORD *)buf = 136315394;
              v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              v234 = 1024;
              *(_DWORD *)v235 = v144;
              _os_log_impl(&dword_214934000, v143, OS_LOG_TYPE_INFO, "%s speechRequestOptions.isMediaPlaying = %d", buf, 0x12u);
            }

            v145 = *v21;
            if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v52, "speechSynthesisRecord");
              v146 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              v234 = 2112;
              *(_QWORD *)v235 = v146;
              _os_log_impl(&dword_214934000, v145, OS_LOG_TYPE_INFO, "%s speechRequestOptions.speechSynthesisRecord = %@", buf, 0x16u);

            }
            v147 = *v21;
            if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v52, "recordingAlertPolicy");
              v148 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              v234 = 2112;
              *(_QWORD *)v235 = v148;
              _os_log_impl(&dword_214934000, v147, OS_LOG_TYPE_INFO, "%s speechRequestOptions.recordingAlertPolicy = %@", buf, 0x16u);

            }
            v149 = *v21;
            v32 = self;
            if (os_log_type_enabled(v149, OS_LOG_TYPE_INFO))
            {
              v150 = objc_msgSend(v52, "reloadSmartSiriVolume");
              *(_DWORD *)buf = 136315394;
              v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext"
                     ":speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
              v234 = 1024;
              *(_DWORD *)v235 = v150;
              _os_log_impl(&dword_214934000, v149, OS_LOG_TYPE_INFO, "%s speechRequestOptions.reloadSmartSiriVolume = %d", buf, 0x12u);
            }

            v204[0] = MEMORY[0x24BDAC760];
            v204[1] = 3221225472;
            v204[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_111;
            v204[3] = &unk_24D24DF48;
            v204[4] = self;
            v205 = v190;
            v57 = v191;
            v206 = v191;
            -[SVXSession _startSpeechRequestWithOptions:clearsContext:deviceSetupContext:deviceProblemsState:localDeviceContext:taskTracker:completion:](self, "_startSpeechRequestWithOptions:clearsContext:deviceSetupContext:deviceProblemsState:localDeviceContext:taskTracker:completion:", v52, 0, v196, v103, v192, v54, v204);

            objc_autoreleasePoolPop(v99);
LABEL_201:
            v68 = 0;
            v70 = 0;
LABEL_202:
            -[NSUserActivity becomeCurrent](v32->_userActivity, "becomeCurrent");
            goto LABEL_218;
          }
          v70 = 0;
          v53 = 0;
        }
        else
        {
          v54 = v20;
          if (v53)
          {
LABEL_103:
            v91 = MEMORY[0x2199D9374]();
            v201[0] = MEMORY[0x24BDAC760];
            v201[1] = 3221225472;
            v201[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_2_112;
            v201[3] = &unk_24D24DF48;
            v201[4] = self;
            v202 = v190;
            v57 = v191;
            v203 = v191;
            -[SVXSession _startRequestWithInfo:clearsContext:deviceSetupContext:taskTracker:completion:](self, "_startRequestWithInfo:clearsContext:deviceSetupContext:taskTracker:completion:", v53, 0, v196, v54, v201);

            v92 = (void *)v91;
            v32 = self;
            objc_autoreleasePoolPop(v92);
LABEL_104:
            v52 = 0;
            v68 = 0;
            v70 = 0;
            v58 = v192;
            goto LABEL_202;
          }
LABEL_204:
          v70 = 0;
          v52 = 0;
        }
LABEL_212:
        v58 = v192;
LABEL_213:
        v153 = *v21;
        if (os_log_type_enabled((os_log_t)*v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:spe"
                 "echSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
          v234 = 2112;
          *(_QWORD *)v235 = v190;
          _os_log_error_impl(&dword_214934000, v153, OS_LOG_TYPE_ERROR, "%s Unable to activate with context %@.", buf, 0x16u);
        }
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 4, 0);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        v155 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend(v155, "session:didNotActivateWithContext:error:", self, v190, v154);

        v57 = v191;
        if (v191)
          (*((void (**)(id, void *))v191 + 2))(v191, v154);

        v68 = 0;
LABEL_218:

        v28 = (__CFString *)v189;
        v17 = v190;
        goto LABEL_219;
      default:
LABEL_211:
        v70 = 0;
        v52 = 0;
        v53 = 0;
        v54 = v20;
        goto LABEL_212;
    }
  }
  v55 = *v21;
  if (os_log_type_enabled((os_log_t)*v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v233 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSyn"
           "thesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]";
    _os_log_error_impl(&dword_214934000, v55, OS_LOG_TYPE_ERROR, "%s Siri is not reachable.", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 2, 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v20;
  -[SVXSession _requestWillBeginWithTaskTracker:](self, "_requestWillBeginWithTaskTracker:", v20);
  v222[0] = MEMORY[0x24BDAC760];
  v222[1] = 3221225472;
  v222[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke;
  v222[3] = &unk_24D24DEA8;
  v223 = v20;
  v224 = self;
  v225 = v56;
  v226 = v17;
  v57 = v191;
  v227 = v191;
  v53 = v56;
  -[SVXSession _waitForMyriadDecisionUsingHandler:](self, "_waitForMyriadDecisionUsingHandler:", v222);
  -[SVXSession _requestDidEndWithOptions:error:](self, "_requestDidEndWithOptions:error:", 6, 0);

  v58 = v192;
LABEL_219:

}

- (void)_deactivateWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  SVXActivationContext *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  unint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  id WeakRetained;
  SVXDeactivationContext *v19;
  SVXDeactivationContext *currentDeactivationContext;
  NSObject *v21;
  SVXActivationContext *currentActivationContext;
  _QWORD v23[5];
  id v24;
  void (**v25)(_QWORD);
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = *MEMORY[0x24BE09010];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09010], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[SVXSession _deactivateWithContext:completion:]";
    v28 = 2112;
    v29 = (unint64_t)v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_DEFAULT, "%s context = %@", buf, 0x16u);
  }
  if (objc_msgSend(v6, "source") != 3)
    goto LABEL_11;
  v9 = self->_currentActivationContext;
  v10 = -[SVXActivationContext source](v9, "source");
  if (v10 != 7)
  {
    if (v10 == 6)
    {

      goto LABEL_8;
    }

LABEL_17:
    v21 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      currentActivationContext = self->_currentActivationContext;
      *(_DWORD *)buf = 136315394;
      v27 = "-[SVXSession _deactivateWithContext:completion:]";
      v28 = 2112;
      v29 = (unint64_t)currentActivationContext;
      v16 = "%s Rejected Myriad deactivation because the current activation context is %@.";
      v17 = v21;
LABEL_22:
      _os_log_error_impl(&dword_214934000, v17, OS_LOG_TYPE_ERROR, v16, buf, 0x16u);
      if (!v7)
        goto LABEL_20;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  -[SVXActivationContext requestInfo](v9, "requestInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "speechRequestOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isVoiceTrigger");

  if ((v13 & 1) == 0)
    goto LABEL_17;
LABEL_8:
  v14 = -[SVXActivationContext timestamp](self->_currentActivationContext, "timestamp");
  if (v14 <= objc_msgSend(v6, "timestamp"))
  {
LABEL_11:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "session:willDeactivateWithContext:", self, v6);

    if ((unint64_t)(self->_activityState - 3) <= 1)
    {
      v19 = (SVXDeactivationContext *)objc_msgSend(v6, "copy");
      currentDeactivationContext = self->_currentDeactivationContext;
      self->_currentDeactivationContext = v19;

    }
    -[SVXSession _cancelRequestWithOptions:keepTaskTracker:](self, "_cancelRequestWithOptions:keepTaskTracker:", 6, 0);
    if (objc_msgSend(v6, "source") == 1)
      -[SVXSession _clearContext](self, "_clearContext");
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __48__SVXSession__deactivateWithContext_completion___block_invoke;
    v23[3] = &unk_24D24EED8;
    v23[4] = self;
    v24 = v6;
    v25 = v7;
    -[SVXSession _performBlockAfterResignActive:](self, "_performBlockAfterResignActive:", v23);

    goto LABEL_20;
  }
  v15 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "-[SVXSession _deactivateWithContext:completion:]";
    v28 = 2048;
    v29 = v14;
    v16 = "%s Rejected Myriad deactivation because the current activation timestamp is %llu.";
    v17 = v15;
    goto LABEL_22;
  }
LABEL_18:
  if (v7)
LABEL_19:
    v7[2](v7);
LABEL_20:

}

- (void)_preheatWithStyle:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[SVXSession _preheatWithStyle:]";
    v9 = 2048;
    v10 = a3;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s style = %ld", (uint8_t *)&v7, 0x16u);
  }
  -[SVXSession _connection:](self, "_connection:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preheatWithStyle:", a3);

  -[SVXSession _startSessionIdleTimerWithTimeInterval:](self, "_startSessionIdleTimerWithTimeInterval:", 4.0);
}

- (void)_startSpeechRequestWithOptions:(id)a3 clearsContext:(BOOL)a4 deviceSetupContext:(id)a5 deviceProblemsState:(id)a6 localDeviceContext:(id)a7 taskTracker:(id)a8 completion:(id)a9
{
  _BOOL4 v13;
  NSUUID *v15;
  NSUUID *v16;
  id v17;
  id v18;
  id v19;
  os_log_t *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSUUID *v24;
  NSUUID *currentRequestUUID;
  AFPreferences *preferences;
  NSObject *v27;
  int v28;
  void *v29;
  int v30;
  NSObject *v31;
  void (**v32)(_QWORD);
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  SASetApplicationContext *setApplicationContext;
  void *v39;
  os_log_t v40;
  NSObject *v41;
  NSUUID *v42;
  void *v43;
  SASetApplicationContext *v44;
  SASetApplicationContext *v45;
  AFSpeechRequestOptions *v46;
  AFSpeechRequestOptions *currentSpeechRequestOptions;
  void *v48;
  id currentSpeechRequestDidStartBlock;
  void *v50;
  id v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  NSUUID *v58;
  __int16 v59;
  _QWORD v60[3];

  v13 = a4;
  v60[2] = *MEMORY[0x24BDAC8D0];
  v15 = (NSUUID *)a3;
  v16 = (NSUUID *)a5;
  v17 = a6;
  v51 = a7;
  v18 = a8;
  v19 = a9;
  v20 = (os_log_t *)MEMORY[0x24BE08FB0];
  v21 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v56 = "-[SVXSession _startSpeechRequestWithOptions:clearsContext:deviceSetupContext:deviceProblemsState:localDeviceCo"
          "ntext:taskTracker:completion:]";
    v57 = 2112;
    v58 = v15;
    v59 = 1024;
    LODWORD(v60[0]) = v13;
    WORD2(v60[0]) = 2112;
    *(_QWORD *)((char *)v60 + 6) = v18;
    _os_log_impl(&dword_214934000, v21, OS_LOG_TYPE_INFO, "%s options = %@, clearsContext = %d, taskTracker = %@", buf, 0x26u);
    v21 = *v20;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v56 = "-[SVXSession _startSpeechRequestWithOptions:clearsContext:deviceSetupContext:deviceProblemsState:localDeviceCo"
          "ntext:taskTracker:completion:]";
    v57 = 2112;
    v58 = v16;
    v59 = 2112;
    v60[0] = v17;
    _os_log_impl(&dword_214934000, v21, OS_LOG_TYPE_INFO, "%s deviceSetupContext = %@, deviceProblemsState = %@", buf, 0x20u);
    v21 = *v20;
  }
  v22 = v17;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v23 = v21;
    objc_msgSend(v51, "identifier");
    v24 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v56 = "-[SVXSession _startSpeechRequestWithOptions:clearsContext:deviceSetupContext:deviceProblemsState:localDeviceCo"
          "ntext:taskTracker:completion:]";
    v57 = 2112;
    v58 = v24;
    _os_log_impl(&dword_214934000, v23, OS_LOG_TYPE_INFO, "%s localDeviceContext = %@", buf, 0x16u);

    v21 = *v20;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    currentRequestUUID = self->_currentRequestUUID;
    *(_DWORD *)buf = 136315394;
    v56 = "-[SVXSession _startSpeechRequestWithOptions:clearsContext:deviceSetupContext:deviceProblemsState:localDeviceCo"
          "ntext:taskTracker:completion:]";
    v57 = 2112;
    v58 = currentRequestUUID;
    _os_log_impl(&dword_214934000, v21, OS_LOG_TYPE_INFO, "%s _currentRequestUUID = %@", buf, 0x16u);
    v21 = *v20;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    preferences = self->_preferences;
    v27 = v21;
    v28 = -[AFPreferences startAlertEnabled](preferences, "startAlertEnabled");
    *(_DWORD *)buf = 136315394;
    v56 = "-[SVXSession _startSpeechRequestWithOptions:clearsContext:deviceSetupContext:deviceProblemsState:localDeviceCo"
          "ntext:taskTracker:completion:]";
    v57 = 1024;
    LODWORD(v58) = v28;
    _os_log_impl(&dword_214934000, v27, OS_LOG_TYPE_INFO, "%s startAlertEnabled = %d", buf, 0x12u);

  }
  -[SVXSession _connection:](self, "_connection:", 0, v51);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isRecording");

  if (!v30)
  {
    objc_msgSend(v18, "instrumentationContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "turnIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUUID setTurnIdentifier:](v15, "setTurnIdentifier:", v34);

    -[SVXSession _requestWillBeginWithTaskTracker:](self, "_requestWillBeginWithTaskTracker:", v18);
    -[SVXSession _connection:](self, "_connection:", 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:", v15);
    v32 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v36 = *v20;
      if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v56 = "-[SVXSession _startSpeechRequestWithOptions:clearsContext:deviceSetupContext:deviceProblemsState:localDevi"
              "ceContext:taskTracker:completion:]";
        _os_log_impl(&dword_214934000, v36, OS_LOG_TYPE_DEFAULT, "%s clearContext", buf, 0xCu);
      }
      -[SVXSession _connection:](self, "_connection:", 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "clearContext");

      setApplicationContext = self->_setApplicationContext;
      self->_setApplicationContext = 0;

    }
    _SVXSessionCreateSetApplicationContext(v16);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[SASetApplicationContext isEqual:](self->_setApplicationContext, "isEqual:", v39) & 1) == 0)
    {
      v40 = *v20;
      if (os_log_type_enabled(*v20, OS_LOG_TYPE_DEFAULT))
      {
        v41 = v40;
        objc_msgSend(v39, "dictionary");
        v42 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v56 = "-[SVXSession _startSpeechRequestWithOptions:clearsContext:deviceSetupContext:deviceProblemsState:localDevi"
              "ceContext:taskTracker:completion:]";
        v57 = 2112;
        v58 = v42;
        _os_log_impl(&dword_214934000, v41, OS_LOG_TYPE_DEFAULT, "%s setApplicationContext: %@", buf, 0x16u);

      }
      -[SVXSession _connection:](self, "_connection:", 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setApplicationContext:", v39);

      v44 = (SASetApplicationContext *)objc_msgSend(v39, "copy");
      v45 = self->_setApplicationContext;
      self->_setApplicationContext = v44;

    }
    if (v32)
      v32[2](v32);
    v46 = (AFSpeechRequestOptions *)-[NSUUID copy](v15, "copy");
    currentSpeechRequestOptions = self->_currentSpeechRequestOptions;
    self->_currentSpeechRequestOptions = v46;

    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __140__SVXSession__startSpeechRequestWithOptions_clearsContext_deviceSetupContext_deviceProblemsState_localDeviceContext_taskTracker_completion___block_invoke;
    v53[3] = &unk_24D24DE08;
    v54 = v19;
    v48 = (void *)MEMORY[0x2199D950C](v53);
    currentSpeechRequestDidStartBlock = self->_currentSpeechRequestDidStartBlock;
    self->_currentSpeechRequestDidStartBlock = v48;

    -[SVXSession _connection:](self, "_connection:", 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      if (-[AFSpeechRequestOptions activationEvent](self->_currentSpeechRequestOptions, "activationEvent") != 1
        || (-[AFPreferences startAlertEnabled](self->_preferences, "startAlertEnabled") & 1) == 0)
      {
        -[SRSTClient dispatchEvent:](self->_client, "dispatchEvent:", 0);
        -[SRSTClient dispatchEvent:](self->_client, "dispatchEvent:", 5);
        -[SVXSession _setCurrentState:](self, "_setCurrentState:", 2);
      }
    }
    else
    {
      -[SVXSession _requestDidEndWithOptions:error:](self, "_requestDidEndWithOptions:error:", 0, 0);
    }

    goto LABEL_31;
  }
  v31 = *v20;
  if (os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v56 = "-[SVXSession _startSpeechRequestWithOptions:clearsContext:deviceSetupContext:deviceProblemsState:localDeviceCo"
          "ntext:taskTracker:completion:]";
    _os_log_error_impl(&dword_214934000, v31, OS_LOG_TYPE_ERROR, "%s Attempting to start a new speech request during an existing speech recording.", buf, 0xCu);
    if (!v19)
      goto LABEL_32;
    goto LABEL_14;
  }
  if (v19)
  {
LABEL_14:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 3, 0);
    v32 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void (**)(_QWORD)))v19 + 2))(v19, v32);
LABEL_31:

  }
LABEL_32:

}

- (void)_stopSpeech
{
  os_log_t *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SVXSession _stopSpeech]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (self->_currentRequestUUID)
  {
    objc_initWeak((id *)buf, self);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __25__SVXSession__stopSpeech__block_invoke;
    v6[3] = &unk_24D24F0B8;
    objc_copyWeak(&v7, (id *)buf);
    -[SVXSession _performBlockAfterContinueBlock:](self, "_performBlockAfterContinueBlock:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[SVXSession _stopSpeech]";
      _os_log_error_impl(&dword_214934000, v5, OS_LOG_TYPE_ERROR, "%s Ignored because _currentRequestUUID is nil.", buf, 0xCu);
    }
  }
}

- (void)_stopSpeechWithCurrentSpeechRequestOptions
{
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[SVXSession _stopSpeechWithCurrentSpeechRequestOptions]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  if (!self->_currentRequestUUID)
  {
    v6 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      return;
    v8 = 136315138;
    v9 = "-[SVXSession _stopSpeechWithCurrentSpeechRequestOptions]";
    v7 = "%s Ignored because _currentRequestUUID is nil.";
LABEL_11:
    _os_log_error_impl(&dword_214934000, v6, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v8, 0xCu);
    return;
  }
  if (self->_currentSpeechRequestOptions)
  {
    -[SVXSession _connection:](self, "_connection:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopSpeechWithOptions:", self->_currentSpeechRequestOptions);

    return;
  }
  v6 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
  {
    v8 = 136315138;
    v9 = "-[SVXSession _stopSpeechWithCurrentSpeechRequestOptions]";
    v7 = "%s Ignored because _currentSpeechRequestOptions is nil.";
    goto LABEL_11;
  }
}

- (void)_transitSpeechToManualEndpointing
{
  os_log_t *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[SVXSession _transitSpeechToManualEndpointing]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (self->_currentRequestUUID)
  {
    objc_initWeak((id *)buf, self);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __47__SVXSession__transitSpeechToManualEndpointing__block_invoke;
    v6[3] = &unk_24D24F0B8;
    objc_copyWeak(&v7, (id *)buf);
    -[SVXSession _performBlockAfterContinueBlock:](self, "_performBlockAfterContinueBlock:", v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[SVXSession _transitSpeechToManualEndpointing]";
      _os_log_error_impl(&dword_214934000, v5, OS_LOG_TYPE_ERROR, "%s Ignored because _currentRequestUUID is nil.", buf, 0xCu);
    }
  }
}

- (void)_transitSpeechToAutomaticEndpointingWithTimestamp:(unint64_t)a3
{
  NSObject *v4;
  SVXActivationInstrumentation *svxActivationInstrumentation;
  void *v6;
  SVXActivationInstrumentation *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  SVXActivationInstrumentation *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  unint64_t v47;
  __int16 v48;
  id v49;
  __int16 v50;
  unint64_t v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v43 = "-[SVXSession _transitSpeechToAutomaticEndpointingWithTimestamp:]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  svxActivationInstrumentation = self->_svxActivationInstrumentation;
  -[AFAnalyticsTurnBasedInstrumentationContext turnIdentifier](self->_currentRequestInstrumentationContext, "turnIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2199D9014](v39);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = svxActivationInstrumentation;
  v8 = v6;
  if (v7)
  {
    -[SVXActivationInstrumentation turnIdentifier](v7, "turnIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2199D9014]();
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = -[SVXActivationInstrumentation buttonDownTimestamp](v7, "buttonDownTimestamp");
    v32 = mach_absolute_time();
    v10 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316418;
      v43 = "SVXInstrumentationEmitButtonEvents";
      v44 = 2112;
      v45 = (uint64_t)v38;
      v46 = 2048;
      v47 = v33;
      v48 = 2112;
      v49 = v8;
      v50 = 2048;
      v51 = a3;
      v52 = 2048;
      v53 = v32;
      _os_log_debug_impl(&dword_214934000, v10, OS_LOG_TYPE_DEBUG, "%s #SVXInstrumentation - button down: turnId = %@, time = %lld button up: turnId = %@, time = %lld, turnEventTime = %lld", buf, 0x3Eu);
    }
    if ((objc_msgSend(v8, "isEqualToString:", v38) & 1) != 0)
    {
      v37 = objc_alloc_init(MEMORY[0x24BE94988]);
      v11 = objc_alloc(MEMORY[0x24BE95C78]);
      v12 = objc_alloc_init(MEMORY[0x24BDD1880]);
      v13 = (void *)objc_msgSend(v11, "initWithNSUUID:", v12);
      objc_msgSend(v37, "setActivationEventId:", v13);

      v36 = objc_alloc_init(MEMORY[0x24BE94978]);
      objc_msgSend(v36, "setButtonName:", CFSTR("Topcap"));
      objc_msgSend(v36, "setButtonInteractionType:", 1);
      v35 = objc_alloc_init(MEMORY[0x24BE94980]);
      objc_msgSend(v35, "setEventMetadata:", v37);
      objc_msgSend(v35, "setButtonInteractionDetected:", v36);
      v14 = objc_alloc_init(MEMORY[0x24BE94978]);
      objc_msgSend(v14, "setButtonName:", CFSTR("Topcap"));
      objc_msgSend(v14, "setButtonInteractionType:", 2);
      v15 = objc_alloc_init(MEMORY[0x24BE94980]);
      objc_msgSend(v15, "setEventMetadata:", v37);
      objc_msgSend(v15, "setButtonInteractionDetected:", v14);
      v16 = objc_alloc_init(MEMORY[0x24BE94990]);
      v17 = objc_alloc(MEMORY[0x24BE95C78]);
      -[SVXActivationInstrumentation turnIdentifier](v7, "turnIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithNSUUID:", v18);
      objc_msgSend(v16, "setTurnId:", v19);

      v20 = objc_alloc_init(MEMORY[0x24BE94980]);
      objc_msgSend(v20, "setEventMetadata:", v37);
      objc_msgSend(v20, "setTurnActivated:", v16);
      v21 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v43 = "SVXInstrumentationEmitButtonEvents";
        v44 = 2048;
        v45 = v33;
        v46 = 2048;
        v47 = a3;
        _os_log_impl(&dword_214934000, v21, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Emit button activation event (button down time: %lld, button up time: %lld)", buf, 0x20u);
      }
      objc_msgSend(MEMORY[0x24BE909B0], "sharedAnalytics");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "defaultMessageStream");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "emitMessage:timestamp:", v35, v33);

      objc_msgSend(MEMORY[0x24BE909B0], "sharedAnalytics");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "defaultMessageStream");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "emitMessage:timestamp:", v15, a3);

      objc_msgSend(MEMORY[0x24BE909B0], "sharedAnalytics");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "defaultMessageStream");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "emitMessage:timestamp:", v20, v32);

    }
    else
    {
      v29 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v43 = "SVXInstrumentationEmitButtonEvents";
        _os_log_error_impl(&dword_214934000, v29, OS_LOG_TYPE_ERROR, "%s #SVXInstrumentation - turnId doesn't match between button down and up event. Skip button activation instrumentation.", buf, 0xCu);
      }
    }

  }
  else
  {
    v28 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "SVXInstrumentationEmitButtonEvents";
      _os_log_error_impl(&dword_214934000, v28, OS_LOG_TYPE_ERROR, "%s #SVXInstrumentation - svxActivationInstrumentation is nil. Button down event was missed.", buf, 0xCu);
    }
  }

  v30 = self->_svxActivationInstrumentation;
  self->_svxActivationInstrumentation = 0;

  if (self->_currentRequestUUID)
  {
    objc_initWeak((id *)buf, self);
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __64__SVXSession__transitSpeechToAutomaticEndpointingWithTimestamp___block_invoke;
    v40[3] = &unk_24D24F0B8;
    objc_copyWeak(&v41, (id *)buf);
    -[SVXSession _performBlockAfterContinueBlock:](self, "_performBlockAfterContinueBlock:", v40);
    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v31 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[SVXSession _transitSpeechToAutomaticEndpointingWithTimestamp:]";
      _os_log_error_impl(&dword_214934000, v31, OS_LOG_TYPE_ERROR, "%s Ignored because _currentRequestUUID is nil.", buf, 0xCu);
    }
  }
}

- (void)_updateSpeechEndpointerOperationMode:(int64_t)a3
{
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  AFSpeechRequestOptions *currentSpeechRequestOptions;
  void *v10;
  NSObject *v11;
  const char *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    AFSpeechEndpointerOperationModeGetName();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315394;
    v14 = "-[SVXSession _updateSpeechEndpointerOperationMode:]";
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s speechEndpointerOperationMode = %@", (uint8_t *)&v13, 0x16u);

  }
  if (!self->_currentRequestUUID)
  {
    v11 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      return;
    v13 = 136315138;
    v14 = "-[SVXSession _updateSpeechEndpointerOperationMode:]";
    v12 = "%s Ignored because _currentRequestUUID is nil.";
LABEL_11:
    _os_log_error_impl(&dword_214934000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v13, 0xCu);
    return;
  }
  currentSpeechRequestOptions = self->_currentSpeechRequestOptions;
  if (currentSpeechRequestOptions)
  {
    -[AFSpeechRequestOptions setEndpointerOperationMode:](currentSpeechRequestOptions, "setEndpointerOperationMode:", a3);
    -[SVXSession _connection:](self, "_connection:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateSpeechOptions:", self->_currentSpeechRequestOptions);

    return;
  }
  v11 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
  {
    v13 = 136315138;
    v14 = "-[SVXSession _updateSpeechEndpointerOperationMode:]";
    v12 = "%s Ignored because _currentSpeechRequestOptions is nil.";
    goto LABEL_11;
  }
}

- (void)assistantConnectionUpdatedSpeechEndEstimate:(id)a3 speechEndEstimate:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (self->_isStateFeedbackEnabled)
  {
    v7 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315394;
      v10 = "-[SVXSession assistantConnectionUpdatedSpeechEndEstimate:speechEndEstimate:]";
      v11 = 2048;
      v12 = a4;
      _os_log_debug_impl(&dword_214934000, v7, OS_LOG_TYPE_DEBUG, "%s #svxstatefeedback SpeechEndEstimate: %llu", (uint8_t *)&v9, 0x16u);
    }
    -[SVXSession _stateFeedbackManager](self, "_stateFeedbackManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didUpdateSpeechEndEstimate:", a4);

  }
}

- (void)_startRequestWithInfo:(id)a3 clearsContext:(BOOL)a4 deviceSetupContext:(id)a5 taskTracker:(id)a6 completion:(id)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD);
  os_log_t *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  SASetApplicationContext *setApplicationContext;
  void *v21;
  os_log_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  SASetApplicationContext *v26;
  SASetApplicationContext *v27;
  void *v28;
  int v29;
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v10 = a4;
  v39 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, _QWORD))a7;
  v16 = (os_log_t *)MEMORY[0x24BE08FB0];
  v17 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v29 = 136316162;
    v30 = "-[SVXSession _startRequestWithInfo:clearsContext:deviceSetupContext:taskTracker:completion:]";
    v31 = 2112;
    v32 = v12;
    v33 = 1024;
    v34 = v10;
    v35 = 2112;
    v36 = v13;
    v37 = 2112;
    v38 = v14;
    _os_log_impl(&dword_214934000, v17, OS_LOG_TYPE_INFO, "%s requestInfo = %@, clearsContext = %d, deviceSetupContext = %@, taskTracker = %@", (uint8_t *)&v29, 0x30u);
  }
  -[SVXSession _requestWillBeginWithTaskTracker:](self, "_requestWillBeginWithTaskTracker:", v14);
  if (v10)
  {
    v18 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 136315138;
      v30 = "-[SVXSession _startRequestWithInfo:clearsContext:deviceSetupContext:taskTracker:completion:]";
      _os_log_impl(&dword_214934000, v18, OS_LOG_TYPE_DEFAULT, "%s clearContext", (uint8_t *)&v29, 0xCu);
    }
    -[SVXSession _connection:](self, "_connection:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "clearContext");

    setApplicationContext = self->_setApplicationContext;
    self->_setApplicationContext = 0;

  }
  _SVXSessionCreateSetApplicationContext(v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[SASetApplicationContext isEqual:](self->_setApplicationContext, "isEqual:", v21) & 1) == 0)
  {
    v22 = *v16;
    if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v22;
      objc_msgSend(v21, "dictionary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 136315394;
      v30 = "-[SVXSession _startRequestWithInfo:clearsContext:deviceSetupContext:taskTracker:completion:]";
      v31 = 2112;
      v32 = v24;
      _os_log_impl(&dword_214934000, v23, OS_LOG_TYPE_DEFAULT, "%s setApplicationContext: %@", (uint8_t *)&v29, 0x16u);

    }
    -[SVXSession _connection:](self, "_connection:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setApplicationContext:", v21);

    v26 = (SASetApplicationContext *)objc_msgSend(v21, "copy");
    v27 = self->_setApplicationContext;
    self->_setApplicationContext = v26;

  }
  -[SVXSession _connection:](self, "_connection:", 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "startRequestWithInfo:", v12);

  if (v15)
    v15[2](v15, 0);

}

- (void)_startSpeechSynthesisRequest:(id)a3 languageCode:(id)a4 voiceName:(id)a5 gender:(int64_t)a6 audioSessionID:(unsigned int)a7 introductionSoundID:(int64_t)a8 conclusionSoundID:(int64_t)a9 taskTracker:(id)a10 postActivationHandler:(id)a11 completion:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  SVXPerforming *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  int64_t v47;
  SVXPerforming *v48;
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  void *v54;
  id v55;
  id v56;
  _QWORD v57[5];
  id v58;
  void *v59;
  unsigned int v60;
  _QWORD v61[5];
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  int64_t v69;
  int64_t v70;
  int64_t v71;
  unsigned int v72;
  _QWORD v73[5];
  SVXPerforming *v74;
  id v75;
  id v76;
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  id v80;
  __int16 v81;
  id v82;
  __int16 v83;
  id v84;
  __int16 v85;
  __CFString *v86;
  __int16 v87;
  __CFString *v88;
  __int16 v89;
  __CFString *v90;
  __int16 v91;
  id v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v50 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a10;
  v20 = a11;
  v45 = a12;
  v21 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v22 = v21;
    v47 = a8;
    if ((unint64_t)a6 > 3)
      v23 = CFSTR("(unknown)");
    else
      v23 = off_24D24C478[a6];
    v24 = v23;
    v44 = v20;
    if ((unint64_t)a8 > 6)
      v25 = CFSTR("(unknown)");
    else
      v25 = off_24D24D238[a8];
    v26 = v25;
    if ((unint64_t)a9 > 6)
      v27 = CFSTR("(unknown)");
    else
      v27 = off_24D24D238[a9];
    v28 = v27;
    *(_DWORD *)buf = 136316930;
    v78 = "-[SVXSession _startSpeechSynthesisRequest:languageCode:voiceName:gender:audioSessionID:introductionSoundID:con"
          "clusionSoundID:taskTracker:postActivationHandler:completion:]";
    v79 = 2112;
    v80 = v50;
    v81 = 2112;
    v82 = v17;
    v83 = 2112;
    v84 = v18;
    v85 = 2112;
    v86 = v24;
    v87 = 2112;
    v88 = v26;
    v89 = 2112;
    v90 = v28;
    v91 = 2112;
    v92 = v19;
    _os_log_impl(&dword_214934000, v22, OS_LOG_TYPE_INFO, "%s speechSynthesisRequest = %@, languageCode = %@, name = %@, gender = %@, introductionSoundID = %@, conclusionSoundID = %@, taskTracker = %@", buf, 0x52u);

    a8 = v47;
  }
  -[SVXSession _requestWillBeginWithTaskTracker:](self, "_requestWillBeginWithTaskTracker:", v19, v44);
  v29 = self->_performer;
  -[SVXSession _connection:](self, "_connection:", 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = MEMORY[0x24BDAC760];
  v73[0] = MEMORY[0x24BDAC760];
  v73[1] = 3221225472;
  v73[2] = __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke;
  v73[3] = &unk_24D24DF98;
  v73[4] = self;
  v48 = v29;
  v74 = v48;
  v46 = v30;
  v75 = v46;
  v32 = v19;
  v76 = v32;
  v61[0] = v31;
  v61[1] = 3221225472;
  v61[2] = __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_5;
  v61[3] = &unk_24D24E010;
  v61[4] = self;
  v33 = (id)MEMORY[0x2199D950C](v73);
  v66 = v33;
  v69 = a8;
  v34 = v20;
  v67 = v34;
  v51 = v50;
  v62 = v51;
  v35 = v17;
  v63 = v35;
  v36 = v18;
  v64 = v36;
  v72 = a7;
  v70 = a6;
  v71 = a9;
  v37 = v45;
  v68 = v37;
  v38 = v32;
  v65 = v38;
  v39 = MEMORY[0x2199D950C](v61);
  v40 = (void *)v39;
  if (a7)
  {
    v57[0] = v31;
    v57[1] = 3221225472;
    v57[2] = __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_9;
    v57[3] = &unk_24D24E038;
    v60 = a7;
    v57[4] = self;
    v59 = (void *)v39;
    v58 = v38;
    v41 = v40;
    -[SVXSession _forceAudioSessionInactiveWithReason:completion:](self, "_forceAudioSessionInactiveWithReason:completion:", CFSTR("Start Speech Synthesis Request (External)"), v57);

    v42 = v59;
  }
  else
  {
    v52[0] = v31;
    v52[1] = 3221225472;
    v52[2] = __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_118;
    v52[3] = &unk_24D24E060;
    v54 = (void *)v39;
    v55 = v34;
    v52[4] = self;
    v56 = v37;
    v53 = v38;
    v43 = v40;
    -[SVXSession _forceAudioSessionActiveWithOptions:reason:completion:](self, "_forceAudioSessionActiveWithOptions:reason:completion:", 0, 3, v52);

    v42 = v54;
  }

}

- (void)_startActiveAudioSessionRequestForType:(int64_t)a3 taskTracker:(id)a4 completion:(id)a5
{
  id v9;
  void (**v10)(id, _QWORD);
  os_log_t *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  AFRelinquishableAssertion *v16;
  AFRelinquishableAssertion *audioDuckingCoordinationAssertion;
  NSObject *v18;
  AFRelinquishableAssertion *v19;
  id WeakRetained;
  SVXActivationContext *currentActivationContext;
  NSUUID *activityUUID;
  void *v23;
  NSObject *v24;
  NSUUID *v25;
  _QWORD v26[6];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = (os_log_t *)MEMORY[0x24BE08FB0];
  v12 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v28 = "-[SVXSession _startActiveAudioSessionRequestForType:taskTracker:completion:]";
    v29 = 2048;
    v30 = a3;
    v31 = 2112;
    v32 = v9;
    _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s type = %zd, taskTracker = %@", buf, 0x20u);
  }
  -[SVXSession _requestWillBeginWithTaskTracker:](self, "_requestWillBeginWithTaskTracker:", v9);
  v13 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[SVXSession _startActiveAudioSessionRequestForType:taskTracker:completion:]";
    _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s Acquiring audio ducking coordination assertion...", buf, 0xCu);
  }
  AFAudioSessionAssertionGetCurrentAcquisitionService();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __76__SVXSession__startActiveAudioSessionRequestForType_taskTracker_completion___block_invoke;
  v26[3] = &__block_descriptor_48_e38_v16__0___AFAssertionContextMutating__8l;
  v26[4] = a2;
  v26[5] = a3;
  v15 = (void *)objc_msgSend(MEMORY[0x24BE090E8], "newWithBuilder:", v26);
  objc_msgSend(v14, "acquireAudioSessionAssertionWithContext:relinquishmentHandler:", v15, &__block_literal_global_10739);
  v16 = (AFRelinquishableAssertion *)objc_claimAutoreleasedReturnValue();
  audioDuckingCoordinationAssertion = self->_audioDuckingCoordinationAssertion;
  self->_audioDuckingCoordinationAssertion = v16;

  v18 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    v19 = self->_audioDuckingCoordinationAssertion;
    *(_DWORD *)buf = 136315394;
    v28 = "-[SVXSession _startActiveAudioSessionRequestForType:taskTracker:completion:]";
    v29 = 2112;
    v30 = (int64_t)v19;
    _os_log_impl(&dword_214934000, v18, OS_LOG_TYPE_INFO, "%s Acquired audio ducking coordination assertion %@.", buf, 0x16u);
  }
  if (self->_activityState == 3)
  {
    self->_activityState = 4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    currentActivationContext = self->_currentActivationContext;
    activityUUID = self->_activityUUID;
    -[AFAnalyticsTurnBasedInstrumentationContext turnIdentifier](self->_currentRequestInstrumentationContext, "turnIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "session:didBecomeActiveWithActivationContext:activityUUID:turnID:", self, currentActivationContext, activityUUID, v23);

    v24 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      v25 = self->_activityUUID;
      *(_DWORD *)buf = 136315394;
      v28 = "-[SVXSession _startActiveAudioSessionRequestForType:taskTracker:completion:]";
      v29 = 2112;
      v30 = (int64_t)v25;
      _os_log_impl(&dword_214934000, v24, OS_LOG_TYPE_INFO, "%s SESSION IS ACTIVE (%@)", buf, 0x16u);
    }
    SVXInstrumentationEmitViewAppearContextEnd(self->_currentRequestInstrumentationContext);
  }
  if (v10)
    v10[2](v10, 0);

}

- (id)beginWaitingForMyriadDecision
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  SVXPerforming *performer;
  id v7;
  SVXPerforming *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_absolute_time());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[SVXSession beginWaitingForMyriadDecision]";
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s token = %@", buf, 0x16u);
  }
  v5 = MEMORY[0x24BDAC760];
  performer = self->_performer;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __43__SVXSession_beginWaitingForMyriadDecision__block_invoke;
  v15[3] = &unk_24D24F018;
  v15[4] = self;
  v7 = v3;
  v16 = v7;
  -[SVXPerforming performBlock:](performer, "performBlock:", v15);
  v8 = self->_performer;
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __43__SVXSession_beginWaitingForMyriadDecision__block_invoke_2;
  v13[3] = &unk_24D24F018;
  v13[4] = self;
  v9 = v7;
  v14 = v9;
  -[SVXPerforming performBlock:afterDelay:](v8, "performBlock:afterDelay:", v13, 8.0);
  v10 = v14;
  v11 = v9;

  return v11;
}

- (void)endWaitingForMyriadDecisionWithToken:(id)a3 result:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  SVXPerforming *performer;
  id v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[SVXSession endWaitingForMyriadDecisionWithToken:result:]";
    v15 = 2112;
    v16 = v6;
    v17 = 1024;
    v18 = v4;
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s token = %@, result = %d", buf, 0x1Cu);
  }
  performer = self->_performer;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__SVXSession_endWaitingForMyriadDecisionWithToken_result___block_invoke;
  v10[3] = &unk_24D24DD68;
  v10[4] = self;
  v11 = v6;
  v12 = v4;
  v9 = v6;
  -[SVXPerforming performBlock:](performer, "performBlock:", v10);

}

- (void)_beginWaitingForMyriadDecisionWithToken:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  NSObject *v7;
  int64_t myriadState;
  id myriadToken;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  int64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "-[SVXSession _beginWaitingForMyriadDecisionWithToken:]";
    v13 = 2112;
    v14 = (int64_t)v4;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s token = %@", (uint8_t *)&v11, 0x16u);
  }
  -[SVXSession _resetMyriadDecision](self, "_resetMyriadDecision");
  v7 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
  {
    myriadState = self->_myriadState;
    v11 = 136315650;
    v12 = "-[SVXSession _beginWaitingForMyriadDecisionWithToken:]";
    v13 = 2048;
    v14 = myriadState;
    v15 = 2048;
    v16 = 1;
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s _myriadState (%ld -> %ld)", (uint8_t *)&v11, 0x20u);
    v7 = *v5;
  }
  self->_myriadState = 1;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    myriadToken = self->_myriadToken;
    v11 = 136315650;
    v12 = "-[SVXSession _beginWaitingForMyriadDecisionWithToken:]";
    v13 = 2112;
    v14 = (int64_t)myriadToken;
    v15 = 2112;
    v16 = (uint64_t)v4;
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s _myriadToken (%@ -> %@)", (uint8_t *)&v11, 0x20u);
  }
  v10 = self->_myriadToken;
  self->_myriadToken = v4;

}

- (void)_endWaitingForMyriadDecisionWithToken:(id)a3 state:(int64_t)a4
{
  id v6;
  os_log_t *v7;
  NSObject *v8;
  char v9;
  NSObject *v10;
  _BOOL4 v11;
  int64_t myriadState;
  id myriadToken;
  id v14;
  NSObject *v15;
  NSMutableArray *v16;
  NSMutableArray *pendingMyriadDecisionHandlers;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  int64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x24BE08FB0];
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v30 = "-[SVXSession _endWaitingForMyriadDecisionWithToken:state:]";
    v31 = 2048;
    v32 = a4;
    v33 = 2112;
    v34 = (int64_t)v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s state = %ld, token = %@", buf, 0x20u);
  }
  v9 = objc_msgSend(v6, "isEqual:", self->_myriadToken);
  v10 = *v7;
  v11 = os_log_type_enabled(*v7, OS_LOG_TYPE_INFO);
  if ((v9 & 1) != 0)
  {
    if (v11)
    {
      myriadState = self->_myriadState;
      *(_DWORD *)buf = 136315650;
      v30 = "-[SVXSession _endWaitingForMyriadDecisionWithToken:state:]";
      v31 = 2048;
      v32 = myriadState;
      v33 = 2048;
      v34 = a4;
      _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s _myriadState (%ld -> %ld)", buf, 0x20u);
      v10 = *v7;
    }
    self->_myriadState = a4;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      myriadToken = self->_myriadToken;
      *(_DWORD *)buf = 136315650;
      v30 = "-[SVXSession _endWaitingForMyriadDecisionWithToken:state:]";
      v31 = 2112;
      v32 = (int64_t)myriadToken;
      v33 = 2112;
      v34 = 0;
      _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s _myriadToken (%@ -> %@)", buf, 0x20u);
    }
    v14 = self->_myriadToken;
    self->_myriadToken = 0;

    v15 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[SVXSession _endWaitingForMyriadDecisionWithToken:state:]";
      v31 = 1024;
      LODWORD(v32) = a4 == 2;
      _os_log_impl(&dword_214934000, v15, OS_LOG_TYPE_INFO, "%s result = %d", buf, 0x12u);
    }
    v16 = self->_pendingMyriadDecisionHandlers;
    pendingMyriadDecisionHandlers = self->_pendingMyriadDecisionHandlers;
    self->_pendingMyriadDecisionHandlers = 0;

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v18 = v16;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v25;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v25 != v21)
            objc_enumerationMutation(v18);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v22) + 16))(*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v22));
          ++v22;
        }
        while (v20 != v22);
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v20);
    }

  }
  else if (v11)
  {
    v23 = self->_myriadToken;
    *(_DWORD *)buf = 136315650;
    v30 = "-[SVXSession _endWaitingForMyriadDecisionWithToken:state:]";
    v31 = 2112;
    v32 = (int64_t)v6;
    v33 = 2112;
    v34 = (int64_t)v23;
    _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s Ignored because input token (%@) does not match _myriadToken (%@).", buf, 0x20u);
  }

}

- (void)_resetMyriadDecision
{
  NSObject **v3;
  NSObject *v4;
  int64_t myriadState;
  id myriadToken;
  id v7;
  NSMutableArray *v8;
  NSMutableArray *pendingMyriadDecisionHandlers;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = (NSObject **)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    myriadState = self->_myriadState;
    *(_DWORD *)buf = 136315650;
    v21 = "-[SVXSession _resetMyriadDecision]";
    v22 = 2048;
    v23 = myriadState;
    v24 = 2048;
    v25 = 0;
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s _myriadState (%ld -> %ld)", buf, 0x20u);
    v4 = *v3;
  }
  self->_myriadState = 0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    myriadToken = self->_myriadToken;
    *(_DWORD *)buf = 136315650;
    v21 = "-[SVXSession _resetMyriadDecision]";
    v22 = 2112;
    v23 = (int64_t)myriadToken;
    v24 = 2112;
    v25 = 0;
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s _myriadToken (%@ -> %@)", buf, 0x20u);
  }
  v7 = self->_myriadToken;
  self->_myriadToken = 0;

  v8 = self->_pendingMyriadDecisionHandlers;
  pendingMyriadDecisionHandlers = self->_pendingMyriadDecisionHandlers;
  self->_pendingMyriadDecisionHandlers = 0;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v8;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14) + 16))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14));
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)_waitForMyriadDecisionUsingHandler:(id)a3
{
  id v4;
  NSMutableArray *pendingMyriadDecisionHandlers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  switch(self->_myriadState)
  {
    case 0:
    case 2:
    case 4:
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
      goto LABEL_7;
    case 1:
      pendingMyriadDecisionHandlers = self->_pendingMyriadDecisionHandlers;
      if (!pendingMyriadDecisionHandlers)
      {
        v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v7 = self->_pendingMyriadDecisionHandlers;
        self->_pendingMyriadDecisionHandlers = v6;

        pendingMyriadDecisionHandlers = self->_pendingMyriadDecisionHandlers;
      }
      v8 = (void *)MEMORY[0x2199D950C](v9);
      -[NSMutableArray addObject:](pendingMyriadDecisionHandlers, "addObject:", v8);

      goto LABEL_7;
    case 3:
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
LABEL_7:
      v4 = v9;
      break;
    default:
      break;
  }

}

- (void)_cancelRequestWithOptions:(unint64_t)a3 keepTaskTracker:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SVXTaskTrackingCenter *taskTrackingCenter;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[SVXSession _cancelRequestWithOptions:keepTaskTracker:]";
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  -[SVXSession _connection:](self, "_connection:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "cancelRequest");
    if (self->_currentState != 1 && !self->_currentRequestDidPresentUUFR)
      objc_msgSend(v9, "rollbackRequest");
  }
  -[SVXServiceCommandHandler reset](self->_serviceCommandHandler, "reset");
  -[SVXSpeechSynthesizer cancelPendingRequests](self->_speechSynthesizer, "cancelPendingRequests");
  -[SVXSpeechSynthesizer stopCurrentRequestWithInterruptionBehavior:](self->_speechSynthesizer, "stopCurrentRequestWithInterruptionBehavior:", 1);
  objc_msgSend(v6, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  taskTrackingCenter = self->_taskTrackingCenter;
  if (v10)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __56__SVXSession__cancelRequestWithOptions_keepTaskTracker___block_invoke;
    v13[3] = &unk_24D24E0E8;
    v14 = v10;
    -[SVXTaskTrackingCenter endTrackingTasksPassingTest:](taskTrackingCenter, "endTrackingTasksPassingTest:", v13);

  }
  else
  {
    -[SVXTaskTrackingCenter endTrackingAllTasks](self->_taskTrackingCenter, "endTrackingAllTasks");
  }
  -[SRSTClient dispatchEvent:](self->_client, "dispatchEvent:", 10);
  -[SVXSession _setCurrentState:](self, "_setCurrentState:", 1);
  -[SVXSession _requestDidEndWithOptions:error:](self, "_requestDidEndWithOptions:error:", a3, 0);

}

- (void)_dismiss
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SVXSession _dismiss]";
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  -[SVXSpeechSynthesizer cancelPendingRequests](self->_speechSynthesizer, "cancelPendingRequests");
  -[SVXSpeechSynthesizer stopCurrentRequestWithInterruptionBehavior:](self->_speechSynthesizer, "stopCurrentRequestWithInterruptionBehavior:", 1);
  -[SVXTaskTrackingCenter endTrackingAllTasks](self->_taskTrackingCenter, "endTrackingAllTasks");
  -[SRSTClient dispatchEvent:](self->_client, "dispatchEvent:", 13);
  -[SVXSession _setCurrentState:](self, "_setCurrentState:", 1);
  -[SVXSession _requestDidEndWithOptions:error:](self, "_requestDidEndWithOptions:error:", 6, 0);
}

- (void)_setCurrentState:(int64_t)a3
{
  unint64_t currentState;
  void *v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  const char *v13;
  __int16 v14;
  __CFString *v15;
  __int16 v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  currentState = self->_currentState;
  if (currentState != a3)
  {
    v6 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      if (currentState > 4)
        v8 = CFSTR("(unknown)");
      else
        v8 = off_24D24E7A8[currentState];
      v9 = v8;
      if ((unint64_t)a3 > 4)
        v10 = CFSTR("(unknown)");
      else
        v10 = off_24D24E7A8[a3];
      v11 = v10;
      v12 = 136315650;
      v13 = "-[SVXSession _setCurrentState:]";
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s %@ -> %@", (uint8_t *)&v12, 0x20u);

    }
    -[SVXSession _willChangeFromState:toState:](self, "_willChangeFromState:toState:", currentState, a3);
    self->_currentState = a3;
    -[SVXSession _didChangeFromState:toState:](self, "_didChangeFromState:toState:", currentState, a3);
  }
}

- (void)_performBlockAfterContinueBlock:(id)a3
{
  NSMutableArray *currentSpeechRequestPendingBlocks;
  id v4;

  if (self->_currentSpeechRequestDidStartBlock)
  {
    currentSpeechRequestPendingBlocks = self->_currentSpeechRequestPendingBlocks;
    v4 = (id)MEMORY[0x2199D950C](a3, a2);
    -[NSMutableArray addObject:](currentSpeechRequestPendingBlocks, "addObject:", v4);

  }
  else
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)_continuePendingSpeechRequest:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void (**currentSpeechRequestDidStartBlock)(void);
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[SVXSession _continuePendingSpeechRequest:]";
    v20 = 1024;
    v21 = v3;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s success = %d", buf, 0x12u);
  }
  currentSpeechRequestDidStartBlock = (void (**)(void))self->_currentSpeechRequestDidStartBlock;
  if (currentSpeechRequestDidStartBlock)
  {
    currentSpeechRequestDidStartBlock[2]();
    v7 = self->_currentSpeechRequestDidStartBlock;
    self->_currentSpeechRequestDidStartBlock = 0;

  }
  if (v3 && self->_currentRequestUUID)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = self->_currentSpeechRequestPendingBlocks;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
  -[NSMutableArray removeAllObjects](self->_currentSpeechRequestPendingBlocks, "removeAllObjects", (_QWORD)v13);
}

- (void)_clearContext
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[SVXSession _clearContext]";
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  -[SVXSession _connection:](self, "_connection:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearContext");

}

- (void)_setApplicationContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v7 = 136315138;
    v8 = "-[SVXSession _setApplicationContext:]";
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
  }
  -[SVXSession _connection:](self, "_connection:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setApplicationContext:", v4);

}

- (void)_addRequestBarrier:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *pendingRequestBarriers;
  void *v7;
  SVXPerforming *performer;
  _QWORD v9[5];
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SVXSession _addRequestBarrier:]";
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  pendingRequestBarriers = self->_pendingRequestBarriers;
  v7 = (void *)MEMORY[0x2199D950C](v4);
  -[NSMutableArray addObject:](pendingRequestBarriers, "addObject:", v7);

  performer = self->_performer;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __33__SVXSession__addRequestBarrier___block_invoke;
  v9[3] = &unk_24D24EFF0;
  v9[4] = self;
  -[SVXPerforming performBlock:withOptions:](performer, "performBlock:withOptions:", v9, 0);

}

- (void)_performNextPendingRequestBarrier
{
  os_log_t *v3;
  NSObject *v4;
  NSObject *v5;
  void (**v6)(_QWORD, _QWORD);
  SVXPerforming *performer;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[SVXSession _performNextPendingRequestBarrier]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (self->_currentRequestUUID)
  {
    v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[SVXSession _performNextPendingRequestBarrier]";
      _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s Ignored because _currentRequestUUID is not nil.", buf, 0xCu);
    }
  }
  else
  {
    -[NSMutableArray firstObject](self->_pendingRequestBarriers, "firstObject");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_pendingRequestBarriers, "removeObjectAtIndex:", 0);
      v6[2](v6, 0);
      performer = self->_performer;
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __47__SVXSession__performNextPendingRequestBarrier__block_invoke;
      v8[3] = &unk_24D24EFF0;
      v8[4] = self;
      -[SVXPerforming performBlock:withOptions:](performer, "performBlock:withOptions:", v8, 0);
    }

  }
}

- (void)_discardPendingRequestBarriers
{
  NSObject *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[SVXSession _discardPendingRequestBarriers]";
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_pendingRequestBarriers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8) + 16))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_pendingRequestBarriers, "removeAllObjects", (_QWORD)v9);
}

- (void)_setInputAudioPowerWrapper:(id)a3
{
  AFXPCWrapper *v5;
  AFSpeechRequestOptions *currentSpeechRequestOptions;
  NSObject *v7;
  AFSpeechRequestOptions *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  AFXPCWrapper *inputAudioPowerWrapper;
  id WeakRetained;
  id v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  AFSpeechRequestOptions *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = (AFXPCWrapper *)a3;
  if (!v5)
    goto LABEL_7;
  if ((-[AFInstanceContext supportsAudioPowerUpdate](self->_instanceContext, "supportsAudioPowerUpdate") & 1) != 0)
  {
    currentSpeechRequestOptions = self->_currentSpeechRequestOptions;
    if (currentSpeechRequestOptions
      && -[AFSpeechRequestOptions disableInputAudioPowerUpdate](currentSpeechRequestOptions, "disableInputAudioPowerUpdate"))
    {
      v7 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        v8 = self->_currentSpeechRequestOptions;
        v17 = 136315394;
        v18 = "-[SVXSession _setInputAudioPowerWrapper:]";
        v19 = 2112;
        v20 = v8;
        v9 = "%s Input audio power updater disabled by current speech request options %@.";
        v10 = v7;
        v11 = 22;
LABEL_16:
        _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v17, v11);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
LABEL_7:
    v12 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v17 = 136315394;
      v18 = "-[SVXSession _setInputAudioPowerWrapper:]";
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s wrapper = %@", (uint8_t *)&v17, 0x16u);
    }
    inputAudioPowerWrapper = self->_inputAudioPowerWrapper;
    if (inputAudioPowerWrapper != v5)
    {
      if (inputAudioPowerWrapper)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "session:didEndUpdateAudioPowerWithType:", self, 1);

      }
      objc_storeStrong((id *)&self->_inputAudioPowerWrapper, a3);
      if (self->_inputAudioPowerWrapper)
      {
        v15 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v15, "session:willBeginUpdateAudioPowerWithType:wrapper:", self, 1, v5);

      }
    }
    goto LABEL_17;
  }
  v16 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v17 = 136315138;
    v18 = "-[SVXSession _setInputAudioPowerWrapper:]";
    v9 = "%s Input audio power updater not supported.";
    v10 = v16;
    v11 = 12;
    goto LABEL_16;
  }
LABEL_17:

}

- (void)_setOutputAudioPowerWrapper:(id)a3
{
  AFXPCWrapper *v5;
  AFSpeechRequestOptions *currentSpeechRequestOptions;
  NSObject *v7;
  AFSpeechRequestOptions *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  NSObject *v12;
  AFXPCWrapper *outputAudioPowerWrapper;
  id WeakRetained;
  id v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  AFSpeechRequestOptions *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = (AFXPCWrapper *)a3;
  if (!v5)
    goto LABEL_7;
  if ((-[AFInstanceContext supportsAudioPowerUpdate](self->_instanceContext, "supportsAudioPowerUpdate") & 1) != 0)
  {
    currentSpeechRequestOptions = self->_currentSpeechRequestOptions;
    if (currentSpeechRequestOptions
      && -[AFSpeechRequestOptions disableOutputAudioPowerUpdate](currentSpeechRequestOptions, "disableOutputAudioPowerUpdate"))
    {
      v7 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        v8 = self->_currentSpeechRequestOptions;
        v17 = 136315394;
        v18 = "-[SVXSession _setOutputAudioPowerWrapper:]";
        v19 = 2112;
        v20 = v8;
        v9 = "%s Output audio power updater disabled by current speech request options %@.";
        v10 = v7;
        v11 = 22;
LABEL_16:
        _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v17, v11);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
LABEL_7:
    v12 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v17 = 136315394;
      v18 = "-[SVXSession _setOutputAudioPowerWrapper:]";
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s wrapper = %@", (uint8_t *)&v17, 0x16u);
    }
    outputAudioPowerWrapper = self->_outputAudioPowerWrapper;
    if (outputAudioPowerWrapper != v5)
    {
      if (outputAudioPowerWrapper)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "session:didEndUpdateAudioPowerWithType:", self, 2);

      }
      objc_storeStrong((id *)&self->_outputAudioPowerWrapper, a3);
      if (self->_outputAudioPowerWrapper)
      {
        v15 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v15, "session:willBeginUpdateAudioPowerWithType:wrapper:", self, 2, v5);

      }
    }
    goto LABEL_17;
  }
  v16 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v17 = 136315138;
    v18 = "-[SVXSession _setOutputAudioPowerWrapper:]";
    v9 = "%s Output audio power updater not supported.";
    v10 = v16;
    v11 = 12;
    goto LABEL_16;
  }
LABEL_17:

}

- (void)_forceAudioSessionActiveWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  AFSpeechRequestOptions *currentSpeechRequestOptions;
  AFSpeechRequestOptions *v12;
  AFSpeechRequestOptions *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[SVXSession _forceAudioSessionActiveWithOptions:reason:completion:]";
    v23 = 2048;
    v24 = a3;
    v25 = 2048;
    v26 = a4;
    _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s BEGIN -forceAudioSessionActive (options = %lu, reason = %ld)", buf, 0x20u);
  }
  v10 = mach_absolute_time();
  currentSpeechRequestOptions = self->_currentSpeechRequestOptions;
  if (currentSpeechRequestOptions)
    v12 = currentSpeechRequestOptions;
  else
    v12 = (AFSpeechRequestOptions *)objc_msgSend(objc_alloc(MEMORY[0x24BE09360]), "initWithActivationEvent:", 1);
  v13 = v12;
  -[SVXSession _connection:](self, "_connection:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __68__SVXSession__forceAudioSessionActiveWithOptions_reason_completion___block_invoke;
  v16[3] = &unk_24D24E110;
  v18 = v10;
  v19 = a3;
  v20 = a4;
  v16[4] = self;
  v17 = v8;
  v15 = v8;
  objc_msgSend(v14, "forceAudioSessionActiveWithOptions:reason:speechRequestOptions:completion:", a3, a4, v13, v16);

}

- (void)_forceAudioSessionInactiveWithReason:(id)a3 completion:(id)a4
{
  AFRelinquishableAssertion *v7;
  id v8;
  NSObject **v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  AFRelinquishableAssertion *v13;
  id v14;
  void (**v15)(_QWORD);
  AFRelinquishableAssertion *audioDuckingCoordinationAssertion;
  NSObject *v17;
  void *v18;
  AFRelinquishableAssertion *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(_QWORD);
  _QWORD v23[5];
  _QWORD v24[4];
  AFRelinquishableAssertion *v25;
  SVXSession *v26;
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  AFRelinquishableAssertion *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = (AFRelinquishableAssertion *)a3;
  v8 = a4;
  v9 = (NSObject **)MEMORY[0x24BE08FB0];
  v10 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "-[SVXSession _forceAudioSessionInactiveWithReason:completion:]";
    v31 = 2112;
    v32 = v7;
    _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s BEGIN -forceAudioSessionInactive (reason = %@)", buf, 0x16u);
  }
  v11 = mach_absolute_time();
  v12 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __62__SVXSession__forceAudioSessionInactiveWithReason_completion___block_invoke;
  v24[3] = &unk_24D24DD40;
  v28 = v11;
  v13 = v7;
  v25 = v13;
  v26 = self;
  v14 = v8;
  v27 = v14;
  v15 = (void (**)(_QWORD))MEMORY[0x2199D950C](v24);
  audioDuckingCoordinationAssertion = self->_audioDuckingCoordinationAssertion;
  if (audioDuckingCoordinationAssertion)
  {
    v17 = *v9;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "-[SVXSession _forceAudioSessionInactiveWithReason:completion:]";
      v31 = 2112;
      v32 = audioDuckingCoordinationAssertion;
      _os_log_impl(&dword_214934000, v17, OS_LOG_TYPE_INFO, "%s Relinquishing audio ducking coordination assertion %@...", buf, 0x16u);
      audioDuckingCoordinationAssertion = self->_audioDuckingCoordinationAssertion;
    }
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __62__SVXSession__forceAudioSessionInactiveWithReason_completion___block_invoke_130;
    v23[3] = &__block_descriptor_40_e38_v16__0___AFAssertionContextMutating__8l;
    v23[4] = a2;
    v18 = (void *)objc_msgSend(MEMORY[0x24BE090E8], "newWithBuilder:", v23);
    -[AFRelinquishableAssertion relinquishWithContext:options:](audioDuckingCoordinationAssertion, "relinquishWithContext:options:", v18, 0);

    v19 = self->_audioDuckingCoordinationAssertion;
    self->_audioDuckingCoordinationAssertion = 0;

  }
  -[SVXSession _connection:](self, "_connection:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __62__SVXSession__forceAudioSessionInactiveWithReason_completion___block_invoke_2;
    v21[3] = &unk_24D24DE08;
    v22 = v15;
    objc_msgSend(v20, "forceAudioSessionInactiveWithOptions:completion:", 0, v21);

  }
  else
  {
    v15[2](v15);
  }

}

- (void)_setAudioSessionID:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)&a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[SVXSession _setAudioSessionID:]";
    v9 = 2048;
    v10 = v3;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s audioSessionID = %lu", (uint8_t *)&v7, 0x16u);
  }
  self->_audioSessionID = v3;
  +[SVXSpeechSynthesisConfiguration configurationWithAudioSessionID:](SVXSpeechSynthesisConfiguration, "configurationWithAudioSessionID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVXSpeechSynthesizer updateWithConfiguration:](self->_speechSynthesizer, "updateWithConfiguration:", v6);

}

- (void)_getAlarmAndTimerFiringContextWithCompletion:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  AFDeviceContext *localDeviceContext;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject **v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  NSObject **v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void (**v34)(id, id);
  _QWORD v35[4];
  id v36;
  id v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, id))a3;
  if (v4)
  {
    v5 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      localDeviceContext = self->_localDeviceContext;
      v7 = v5;
      -[AFDeviceContext identifier](localDeviceContext, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v45 = "-[SVXSession _getAlarmAndTimerFiringContextWithCompletion:]";
      v46 = 2112;
      v47 = v8;
      _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s localDeviceContext = %@", buf, 0x16u);

    }
    -[AFDeviceContext alarmSnapshot](self->_localDeviceContext, "alarmSnapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFDeviceContext timerSnapshot](self->_localDeviceContext, "timerSnapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSObject **)MEMORY[0x24BE08FB0];
    v12 = *MEMORY[0x24BE08FB0];
    v13 = *MEMORY[0x24BE08FB0];
    if (v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v45 = "-[SVXSession _getAlarmAndTimerFiringContextWithCompletion:]";
        v46 = 2112;
        v47 = v9;
        _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s clockAlarmSnapshot = %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "-[SVXSession _getAlarmAndTimerFiringContextWithCompletion:]";
      _os_log_error_impl(&dword_214934000, v12, OS_LOG_TYPE_ERROR, "%s No clock alarm snapshot.", buf, 0xCu);
    }
    v14 = *v11;
    v15 = *v11;
    if (v10)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v45 = "-[SVXSession _getAlarmAndTimerFiringContextWithCompletion:]";
        v46 = 2112;
        v47 = v10;
        _os_log_impl(&dword_214934000, v14, OS_LOG_TYPE_INFO, "%s clockTimerSnapshot = %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "-[SVXSession _getAlarmAndTimerFiringContextWithCompletion:]";
      _os_log_error_impl(&dword_214934000, v14, OS_LOG_TYPE_ERROR, "%s No clock timer snapshot.", buf, 0xCu);
    }
    v16 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    v17 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    objc_msgSend(v9, "firingAlarms");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
      objc_msgSend(v16, "unionSet:", v18);
    objc_msgSend(v16, "sortUsingComparator:", &__block_literal_global_135);
    objc_msgSend(v10, "firingTimers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
      objc_msgSend(v17, "unionSet:", v19);
    objc_msgSend(v17, "sortUsingComparator:", &__block_literal_global_137);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v10, "timersByID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allValues");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v22)
    {
      v33 = v18;
      v34 = v4;
      v23 = v10;
      v24 = v9;
      v25 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v40 != v25)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if (objc_msgSend(v27, "state") == 3 && !objc_msgSend(v19, "containsObject:", v27))
          {
            LODWORD(v22) = 1;
            goto LABEL_29;
          }
        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v22)
          continue;
        break;
      }
LABEL_29:
      v9 = v24;
      v10 = v23;
      v18 = v33;
      v4 = v34;
    }

    v28 = (NSObject **)MEMORY[0x24BE08FB0];
    v29 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[SVXSession _getAlarmAndTimerFiringContextWithCompletion:]";
      v46 = 2112;
      v47 = v16;
      _os_log_impl(&dword_214934000, v29, OS_LOG_TYPE_INFO, "%s orderedFiringAlarms = %@", buf, 0x16u);
      v29 = *v28;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[SVXSession _getAlarmAndTimerFiringContextWithCompletion:]";
      v46 = 2112;
      v47 = v17;
      _os_log_impl(&dword_214934000, v29, OS_LOG_TYPE_INFO, "%s orderedFiringTimers = %@", buf, 0x16u);
      v29 = *v28;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[SVXSession _getAlarmAndTimerFiringContextWithCompletion:]";
      v46 = 1024;
      LODWORD(v47) = v22;
      _os_log_impl(&dword_214934000, v29, OS_LOG_TYPE_INFO, "%s hasOtherRunningTimers = %d", buf, 0x12u);
    }
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __59__SVXSession__getAlarmAndTimerFiringContextWithCompletion___block_invoke_139;
    v35[3] = &unk_24D24E1D8;
    v36 = v16;
    v37 = v17;
    v38 = v22;
    v30 = v17;
    v31 = v16;
    v32 = +[SVXAlarmAndTimerFiringContext newWithBuilder:](SVXAlarmAndTimerFiringContext, "newWithBuilder:", v35);
    v4[2](v4, v32);

  }
}

- (id)_currentAccessoryInfo
{
  AFHomeAccessoryInfo *currentAccessoryInfo;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD v9[5];
  NSObject *v10;

  currentAccessoryInfo = self->_currentAccessoryInfo;
  if (!currentAccessoryInfo)
  {
    v4 = dispatch_group_create();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE092B8]), "initWithInstanceContext:", self->_instanceContext);
    dispatch_group_enter(v4);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __35__SVXSession__currentAccessoryInfo__block_invoke;
    v9[3] = &unk_24D24E200;
    v9[4] = self;
    v10 = v4;
    v6 = v4;
    objc_msgSend(v5, "getCurrentAccessoryInfoWithCompletion:", v9);
    v7 = dispatch_time(0, 1000000000);
    dispatch_group_wait(v6, v7);

    currentAccessoryInfo = self->_currentAccessoryInfo;
  }
  return currentAccessoryInfo;
}

- (void)_checkIsActiveWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  os_log_t *v5;
  NSObject *v6;
  NSUUID *currentRequestUUID;
  os_log_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSMutableSet *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  NSObject *v21;
  SVXSession *v22;
  os_log_t v23;
  SVXTaskTrackingCenter *taskTrackingCenter;
  _QWORD v25[5];
  void (**v26)(id, uint64_t);
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  SVXSession *v35;
  __int16 v36;
  NSUUID *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t))a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[SVXSession _checkIsActiveWithCompletion:]";
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (v4)
  {
    currentRequestUUID = self->_currentRequestUUID;
    if (currentRequestUUID)
    {
      v8 = *v5;
      if (!os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
LABEL_26:
        v4[2](v4, 1);
        goto LABEL_27;
      }
      *(_DWORD *)buf = 136315650;
      v33 = "-[SVXSession _checkIsActiveWithCompletion:]";
      v34 = 2112;
      v35 = self;
      v36 = 2112;
      v37 = currentRequestUUID;
      v9 = "%s %@ is active. (_currentRequestUUID = %@)";
      v10 = v8;
      v11 = 32;
    }
    else
    {
      v12 = -[NSMutableSet count](self->_audioSessionAssertions, "count");
      if (!v12)
      {
        taskTrackingCenter = self->_taskTrackingCenter;
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __43__SVXSession__checkIsActiveWithCompletion___block_invoke;
        v25[3] = &unk_24D24E228;
        v25[4] = self;
        v26 = v4;
        -[SVXTaskTrackingCenter getContextsOfAllTrackedTasksUsingBlock:](taskTrackingCenter, "getContextsOfAllTrackedTasksUsingBlock:", v25);

        goto LABEL_27;
      }
      v13 = v12;
      v14 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v33 = "-[SVXSession _checkIsActiveWithCompletion:]";
        v34 = 2112;
        v35 = self;
        v36 = 2048;
        v37 = (NSUUID *)v13;
        _os_log_impl(&dword_214934000, v14, OS_LOG_TYPE_INFO, "%s %@ is active. (_audioSessionAssertions.count = %tu)", buf, 0x20u);
      }
      if ((AFIsInternalInstall() & 1) == 0
        && !-[AFPreferences shouldLogForQA](self->_preferences, "shouldLogForQA"))
      {
        goto LABEL_26;
      }
      v15 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[SVXSession _checkIsActiveWithCompletion:]";
        _os_log_impl(&dword_214934000, v15, OS_LOG_TYPE_INFO, "%s _audioSessionAssertions = (", buf, 0xCu);
      }
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v16 = self->_audioSessionAssertions;
      v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v28 != v19)
              objc_enumerationMutation(v16);
            v21 = *v5;
            if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
            {
              v22 = *(SVXSession **)(*((_QWORD *)&v27 + 1) + 8 * i);
              *(_DWORD *)buf = 136315394;
              v33 = "-[SVXSession _checkIsActiveWithCompletion:]";
              v34 = 2112;
              v35 = v22;
              _os_log_impl(&dword_214934000, v21, OS_LOG_TYPE_INFO, "%s     %@", buf, 0x16u);
            }
          }
          v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v18);
      }

      v23 = *v5;
      if (!os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
        goto LABEL_26;
      *(_DWORD *)buf = 136315138;
      v33 = "-[SVXSession _checkIsActiveWithCompletion:]";
      v9 = "%s)";
      v10 = v23;
      v11 = 12;
    }
    _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, v9, buf, v11);
    goto LABEL_26;
  }
LABEL_27:

}

- (void)_performBlockAfterResignActive:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id postResignActiveBlock;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self->_activityState == 1)
    {
      (*((void (**)(id))v4 + 2))(v4);
    }
    else if (self->_postResignActiveBlock)
    {
      v6 = (void *)MEMORY[0x2199D950C]();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __45__SVXSession__performBlockAfterResignActive___block_invoke;
      v12[3] = &unk_24D24E250;
      v13 = v6;
      v14 = v5;
      v7 = v6;
      v8 = (void *)MEMORY[0x2199D950C](v12);
      postResignActiveBlock = self->_postResignActiveBlock;
      self->_postResignActiveBlock = v8;

    }
    else
    {
      v10 = (void *)MEMORY[0x2199D950C](v4);
      v11 = self->_postResignActiveBlock;
      self->_postResignActiveBlock = v10;

    }
  }

}

- (void)_resignActiveForReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[SVXSession _resignActiveForReason:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s reason = %@", buf, 0x16u);
  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__SVXSession__resignActiveForReason___block_invoke;
  v7[3] = &unk_24D24EB68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[SVXSession _checkIsActiveWithCompletion:](self, "_checkIsActiveWithCompletion:", v7);

}

- (void)_invalidate
{
  NSObject **v4;
  NSObject *v5;
  void (**postResignActiveBlock)(void);
  id v7;
  AFRelinquishableAssertion *audioDuckingCoordinationAssertion;
  NSObject *v9;
  void *v10;
  AFRelinquishableAssertion *v11;
  id WeakRetained;
  _QWORD v13[5];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  AFRelinquishableAssertion *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (NSObject **)MEMORY[0x24BE08FB0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[SVXSession _invalidate]";
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  postResignActiveBlock = (void (**)(void))self->_postResignActiveBlock;
  if (postResignActiveBlock)
  {
    postResignActiveBlock[2]();
    v7 = self->_postResignActiveBlock;
    self->_postResignActiveBlock = 0;

  }
  audioDuckingCoordinationAssertion = self->_audioDuckingCoordinationAssertion;
  if (audioDuckingCoordinationAssertion)
  {
    v9 = *v4;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[SVXSession _invalidate]";
      v16 = 2112;
      v17 = audioDuckingCoordinationAssertion;
      _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s Relinquishing audio ducking coordination assertion %@...", buf, 0x16u);
      audioDuckingCoordinationAssertion = self->_audioDuckingCoordinationAssertion;
    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __25__SVXSession__invalidate__block_invoke;
    v13[3] = &__block_descriptor_40_e38_v16__0___AFAssertionContextMutating__8l;
    v13[4] = a2;
    v10 = (void *)objc_msgSend(MEMORY[0x24BE090E8], "newWithBuilder:", v13);
    -[AFRelinquishableAssertion relinquishWithContext:options:](audioDuckingCoordinationAssertion, "relinquishWithContext:options:", v10, 0);

    v11 = self->_audioDuckingCoordinationAssertion;
    self->_audioDuckingCoordinationAssertion = 0;

  }
  -[SVXSpeechSynthesizer removeListener:](self->_speechSynthesizer, "removeListener:", self);
  -[SVXSpeechSynthesizer postcool](self->_speechSynthesizer, "postcool");
  -[SVXSession _resetMyriadDecision](self, "_resetMyriadDecision");
  -[SVXSession _stopSessionIdleTimer](self, "_stopSessionIdleTimer");
  -[SVXSession _invalidateConnection](self, "_invalidateConnection");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "sessionDidInvalidate:", self);

  objc_storeWeak((id *)&self->_delegate, 0);
}

- (void)_requestWillBeginWithTaskTracker:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSUUID **p_currentRequestUUID;
  SVXTaskTrackingCenter *taskTrackingCenter;
  NSUUID *currentRequestUUID;
  SVXActivationContext *currentActivationContext;
  SVXDeactivationContext *currentDeactivationContext;
  AFSpeechRequestOptions *currentSpeechRequestOptions;
  AFAnalyticsTurnBasedInstrumentationContext *currentRequestInstrumentationContext;
  id *p_currentRequestInstrumentationContext;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSUUID *v18;
  NSUUID *activityUUID;
  id WeakRetained;
  SVXActivationContext *v21;
  NSUUID *v22;
  void *v23;
  NSObject *v24;
  NSUUID *v25;
  objc_class *v26;
  id v27;
  id v28;
  id v29;
  NSUUID *v30;
  NSUUID *v31;
  id v32;
  id v33;
  objc_class *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t SchemaInvocationSourceForVoiceTrigger;
  void *v40;
  void *v41;
  NSObject *v42;
  const char *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  _BOOL4 v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  const __CFString *v54;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  BOOL v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  SVXActivationInstrumentation *v64;
  SVXActivationInstrumentation *svxActivationInstrumentation;
  NSObject *v66;
  NSUUID *v67;
  NSObject *v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  SVXActivationContext *obj;
  id v74;
  _QWORD v75[4];
  id v76;
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  id v80;
  __int16 v81;
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v78 = "-[SVXSession _requestWillBeginWithTaskTracker:]";
    v79 = 2112;
    v80 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s taskTracker = %@", buf, 0x16u);
  }
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVXSession _stopSessionIdleTimer](self, "_stopSessionIdleTimer");
  p_currentRequestUUID = &self->_currentRequestUUID;
  if (self->_currentRequestUUID)
  {
    -[SVXSession _cancelRequestWithOptions:keepTaskTracker:](self, "_cancelRequestWithOptions:keepTaskTracker:", 7, v4);
  }
  else
  {
    -[SVXServiceCommandHandler reset](self->_serviceCommandHandler, "reset");
    -[SVXSpeechSynthesizer cancelPendingRequests](self->_speechSynthesizer, "cancelPendingRequests");
    -[SVXSpeechSynthesizer stopCurrentRequestWithInterruptionBehavior:](self->_speechSynthesizer, "stopCurrentRequestWithInterruptionBehavior:", 1);
    taskTrackingCenter = self->_taskTrackingCenter;
    v75[0] = MEMORY[0x24BDAC760];
    v75[1] = 3221225472;
    v75[2] = __47__SVXSession__requestWillBeginWithTaskTracker___block_invoke;
    v75[3] = &unk_24D24E0E8;
    v76 = v6;
    -[SVXTaskTrackingCenter endTrackingTasksPassingTest:](taskTrackingCenter, "endTrackingTasksPassingTest:", v75);
    -[SVXSession _discardPendingRequestBarriers](self, "_discardPendingRequestBarriers");
    if ((objc_msgSend(v4, "listensAfterSpeaking") & 1) == 0)
    {
      -[SRSTClient dispatchEvent:](self->_client, "dispatchEvent:", 10);
      -[SVXSession _setCurrentState:](self, "_setCurrentState:", 1);
    }

  }
  currentRequestUUID = self->_currentRequestUUID;
  self->_currentRequestUUID = 0;

  currentActivationContext = self->_currentActivationContext;
  self->_currentActivationContext = 0;

  currentDeactivationContext = self->_currentDeactivationContext;
  self->_currentDeactivationContext = 0;

  currentSpeechRequestOptions = self->_currentSpeechRequestOptions;
  self->_currentSpeechRequestOptions = 0;

  *(_WORD *)&self->_currentRequestWillPresentUUFR = 0;
  p_currentRequestInstrumentationContext = (id *)&self->_currentRequestInstrumentationContext;
  currentRequestInstrumentationContext = self->_currentRequestInstrumentationContext;
  self->_currentRequestInstrumentationContext = 0;

  -[SVXSession _continuePendingSpeechRequest:](self, "_continuePendingSpeechRequest:", 0);
  *(_WORD *)&self->_isMostRecentRequestStartingMediaPlaybackLocally = 0;
  v15 = objc_msgSend(v6, "origin");
  v72 = 0;
  obj = 0;
  if (v15 == 1)
  {
    objc_msgSend(v6, "activationContext");
    obj = (SVXActivationContext *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestUUID");
    v72 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "instrumentationContext");
  v74 = (id)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v78 = "-[SVXSession _requestWillBeginWithTaskTracker:]";
    v79 = 2112;
    v80 = v74;
    _os_log_debug_impl(&dword_214934000, v16, OS_LOG_TYPE_DEBUG, "%s instrumentationContext = %@", buf, 0x16u);
  }
  if ((unint64_t)(self->_activityState - 1) <= 1)
  {
    v17 = v6;
    self->_activityState = 3;
    v18 = (NSUUID *)objc_alloc_init(MEMORY[0x24BDD1880]);
    activityUUID = self->_activityUUID;
    self->_activityUUID = v18;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v21 = obj;
    if (!obj)
      v21 = self->_currentActivationContext;
    v22 = self->_activityUUID;
    objc_msgSend(v74, "turnIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "session:willBecomeActiveWithActivationContext:activityUUID:turnID:", self, v21, v22, v23);

    v24 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v25 = self->_activityUUID;
      *(_DWORD *)buf = 136315394;
      v78 = "-[SVXSession _requestWillBeginWithTaskTracker:]";
      v79 = 2112;
      v80 = v25;
      _os_log_impl(&dword_214934000, v24, OS_LOG_TYPE_INFO, "%s SESSION GOING ACTIVE (%@)", buf, 0x16u);
    }
    v26 = (objc_class *)MEMORY[0x24BE95BB0];
    v27 = v74;
    v28 = objc_alloc_init(v26);
    v29 = objc_alloc_init(MEMORY[0x24BE95BC0]);
    objc_msgSend(v29, "setExists:", 1);
    objc_msgSend(v28, "setStartedOrChanged:", v29);
    objc_msgSend(v27, "emitInstrumentation:", v28);

    v6 = v17;
    p_currentRequestUUID = &self->_currentRequestUUID;
  }
  if (v15 == 1)
  {
    objc_storeStrong((id *)&self->_currentActivationContext, obj);
    objc_storeStrong((id *)p_currentRequestUUID, v72);
  }
  if (!*p_currentRequestUUID)
  {
    v30 = (NSUUID *)objc_alloc_init(MEMORY[0x24BDD1880]);
    v31 = *p_currentRequestUUID;
    *p_currentRequestUUID = v30;

  }
  objc_storeStrong((id *)&self->_currentRequestInstrumentationContext, v74);
  if (v15 == 1)
  {
    v32 = *p_currentRequestInstrumentationContext;
    objc_msgSend(v4, "activationContext");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v34 = (objc_class *)MEMORY[0x24BE95B28];
    v70 = v32;
    v35 = objc_alloc_init(v34);
    v36 = objc_msgSend(v33, "source");
    objc_msgSend(v33, "requestInfo");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "speechRequestOptions");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    SchemaInvocationSourceForVoiceTrigger = 0;
    v40 = v38;
    switch(v36)
    {
      case 1:
        objc_msgSend(v33, "buttonEvent");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v41, "type") == 2)
        {
          v42 = *MEMORY[0x24BE08FB0];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
            goto LABEL_41;
          *(_DWORD *)buf = 136315138;
          v78 = "SVXInstrumentationEmitInvocation";
          v43 = "%s button_track SVXButtonEventTypeUp";
          v44 = v42;
        }
        else
        {
          v46 = objc_msgSend(v41, "type");
          v47 = *MEMORY[0x24BE08FB0];
          v48 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO);
          if (v46 == 1)
          {
            if (!v48)
              goto LABEL_41;
            *(_DWORD *)buf = 136315138;
            v78 = "SVXInstrumentationEmitInvocation";
            v43 = "%s button_track SVXButtonEventTypeDown";
          }
          else
          {
            if (!v48)
              goto LABEL_41;
            *(_DWORD *)buf = 136315138;
            v78 = "SVXInstrumentationEmitInvocation";
            v43 = "%s Different button event";
          }
          v44 = v47;
        }
        _os_log_impl(&dword_214934000, v44, OS_LOG_TYPE_INFO, v43, buf, 0xCu);
LABEL_41:

        SchemaInvocationSourceForVoiceTrigger = 18;
LABEL_46:
        objc_msgSend(v35, "setInvocationSource:", SchemaInvocationSourceForVoiceTrigger, v70);
        v53 = (void *)*MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
        {
          if ((SchemaInvocationSourceForVoiceTrigger - 1) > 0x53)
            v54 = CFSTR("INVOCATIONSOURCE_UNKNOWN_INVOCATION_SOURCE");
          else
            v54 = off_24D24C7F0[(SchemaInvocationSourceForVoiceTrigger - 1)];
          *(_DWORD *)buf = 136315394;
          v78 = "SVXInstrumentationEmitInvocation";
          v79 = 2112;
          v80 = (id)v54;
          v55 = v53;
          _os_log_impl(&dword_214934000, v55, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Emit invocation event (source %@)", buf, 0x16u);

        }
        objc_msgSend(v71, "emitInstrumentation:", v35);

        objc_msgSend(v4, "activationContext");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "source");

        v58 = v57 == 1;
        p_currentRequestUUID = &self->_currentRequestUUID;
        if (v58)
        {
          objc_msgSend(*p_currentRequestInstrumentationContext, "turnIdentifier");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "activationContext");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "buttonEvent");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v61, "timestamp");

          v63 = (void *)*MEMORY[0x24BE08FB0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
          {
            v68 = v63;
            MEMORY[0x2199D9014](v59);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v78 = "-[SVXSession _requestWillBeginWithTaskTracker:]";
            v79 = 2112;
            v80 = v69;
            v81 = 2048;
            v82 = v62;
            _os_log_debug_impl(&dword_214934000, v68, OS_LOG_TYPE_DEBUG, "%s Button down event: turnId = %@, timestamp = %lld", buf, 0x20u);

          }
          v64 = -[SVXActivationInstrumentation initWithTurnIdentifier:buttonTimestamp:]([SVXActivationInstrumentation alloc], "initWithTurnIdentifier:buttonTimestamp:", v59, v62);
          svxActivationInstrumentation = self->_svxActivationInstrumentation;
          self->_svxActivationInstrumentation = v64;

          p_currentRequestUUID = &self->_currentRequestUUID;
        }
        break;
      case 2:
        SchemaInvocationSourceForVoiceTrigger = 50;
        goto LABEL_46;
      case 3:
      case 5:
        goto LABEL_46;
      case 4:
        SchemaInvocationSourceForVoiceTrigger = 52;
        goto LABEL_46;
      case 6:
        goto LABEL_30;
      case 7:
        if (objc_msgSend(v38, "isVoiceTrigger"))
        {
LABEL_30:
          objc_msgSend(v38, "voiceTriggerEventInfo", v70);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          SchemaInvocationSourceForVoiceTrigger = _getSchemaInvocationSourceForVoiceTrigger(v45);

        }
        else
        {
          objc_msgSend(v33, "requestInfo");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "activationEvent");

          if (v50 == 8)
          {
            SchemaInvocationSourceForVoiceTrigger = 50;
          }
          else
          {
            objc_msgSend(v33, "requestInfo");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "activationEvent");

            if (v52 == 6)
              SchemaInvocationSourceForVoiceTrigger = 84;
            else
              SchemaInvocationSourceForVoiceTrigger = 0;
          }
LABEL_45:
          v40 = v38;
        }
        goto LABEL_46;
      case 8:
        SchemaInvocationSourceForVoiceTrigger = 79;
        goto LABEL_46;
      default:
        goto LABEL_45;
    }
  }
  v66 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v67 = *p_currentRequestUUID;
    *(_DWORD *)buf = 136315394;
    v78 = "-[SVXSession _requestWillBeginWithTaskTracker:]";
    v79 = 2112;
    v80 = v67;
    _os_log_impl(&dword_214934000, v66, OS_LOG_TYPE_INFO, "%s BEGIN REQUEST (_currentRequestUUID = %@)", buf, 0x16u);
  }

}

- (void)_requestDidEndWithOptions:(unint64_t)a3 error:(id)a4
{
  id v7;
  uint64_t v8;
  os_log_t *v9;
  NSObject *v10;
  uint64_t v11;
  NSUUID **p_currentRequestUUID;
  NSObject *v13;
  os_log_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  NSObject *v18;
  _BOOL4 v19;
  NSUUID *v20;
  AFAnalyticsTurnBasedInstrumentationContext *currentRequestInstrumentationContext;
  AFAnalyticsTurnBasedInstrumentationContext *v22;
  AFSpeechRequestOptions *currentSpeechRequestOptions;
  SVXPerforming *performer;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  SRUIFStateFeedbackManager *stateFeedbackManager;
  SVXTaskContext *v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[5];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  unint64_t v39;
  __int16 v40;
  unint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = mach_absolute_time();
  v9 = (os_log_t *)MEMORY[0x24BE08FB0];
  v10 = *MEMORY[0x24BE08FB0];
  if (v7)
  {
    v11 = v8;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v37 = "-[SVXSession _requestDidEndWithOptions:error:]";
      v38 = 2048;
      v39 = a3;
      v40 = 2112;
      v41 = (unint64_t)v7;
      _os_log_error_impl(&dword_214934000, v10, OS_LOG_TYPE_ERROR, "%s options = %tu, error = %@", buf, 0x20u);
    }
    p_currentRequestUUID = &self->_currentRequestUUID;
    if (self->_currentRequestUUID)
    {
      if ((a3 & 2) != 0)
      {
        v14 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v37 = "-[SVXSession _requestDidEndWithOptions:error:]";
          v38 = 2112;
          v39 = (unint64_t)v7;
          v40 = 2048;
          v41 = a3;
          v15 = "%s Ignored presenting %@ because request ending options = %tu.";
          v16 = v14;
          v17 = 32;
LABEL_17:
          _os_log_impl(&dword_214934000, v16, OS_LOG_TYPE_INFO, v15, buf, v17);
        }
      }
      else
      {
        if (self->_currentRequestWillPresentUUFR)
        {
          v13 = *v9;
        }
        else
        {
          v13 = *v9;
          if (!self->_currentRequestDidPresentUUFR)
          {
            if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              v37 = "-[SVXSession _requestDidEndWithOptions:error:]";
              _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s Using built-in error dialogs.", buf, 0xCu);
            }
            LOWORD(v34) = 0;
            v32 = -[SVXTaskContext initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:]([SVXTaskContext alloc], "initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:", 9, v11, 0, self->_currentRequestUUID, 0, 0, 0, 0, v34, 0, 0, 0, v7);
            -[SVXTaskTrackingCenter beginTrackingTaskWithContext:instrumentationContext:](self->_taskTrackingCenter, "beginTrackingTaskWithContext:instrumentationContext:", v32, self->_currentRequestInstrumentationContext);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[SVXSession _presentError:taskTracker:completion:](self, "_presentError:taskTracker:completion:", v7, v33, 0);

            goto LABEL_18;
          }
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v37 = "-[SVXSession _requestDidEndWithOptions:error:]";
          v38 = 2112;
          v39 = (unint64_t)v7;
          v15 = "%s Ignored presenting %@ because UUFR was presented.";
          v16 = v13;
          v17 = 22;
          goto LABEL_17;
        }
      }
LABEL_18:
      v18 = *v9;
      v19 = os_log_type_enabled(*v9, OS_LOG_TYPE_INFO);
      v20 = *p_currentRequestUUID;
      if (v19)
      {
        *(_DWORD *)buf = 136315394;
        v37 = "-[SVXSession _requestDidEndWithOptions:error:]";
        v38 = 2112;
        v39 = (unint64_t)v20;
        _os_log_impl(&dword_214934000, v18, OS_LOG_TYPE_INFO, "%s END REQUEST (_currentRequestUUID = %@)", buf, 0x16u);
        v20 = *p_currentRequestUUID;
      }
      *p_currentRequestUUID = 0;

    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[SVXSession _requestDidEndWithOptions:error:]";
      v38 = 2048;
      v39 = a3;
      _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s options = %tu", buf, 0x16u);
    }
    p_currentRequestUUID = &self->_currentRequestUUID;
    if (self->_currentRequestUUID)
      goto LABEL_18;
  }
  currentRequestInstrumentationContext = self->_currentRequestInstrumentationContext;
  if (currentRequestInstrumentationContext)
  {
    objc_storeStrong((id *)&self->_previousRequestInstrumentationContext, currentRequestInstrumentationContext);
    v22 = self->_currentRequestInstrumentationContext;
  }
  else
  {
    v22 = 0;
  }
  self->_currentRequestInstrumentationContext = 0;

  *(_WORD *)&self->_currentRequestWillPresentUUFR = 0;
  currentSpeechRequestOptions = self->_currentSpeechRequestOptions;
  self->_currentSpeechRequestOptions = 0;

  -[SVXSession _continuePendingSpeechRequest:](self, "_continuePendingSpeechRequest:", 0);
  if ((a3 & 4) == 0)
  {
    performer = self->_performer;
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __46__SVXSession__requestDidEndWithOptions_error___block_invoke;
    v35[3] = &unk_24D24EFF0;
    v35[4] = self;
    -[SVXPerforming performBlock:withOptions:](performer, "performBlock:withOptions:", v35, 0);
    if ((a3 & 1) != 0)
      goto LABEL_26;
LABEL_29:
    v26 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("%@ %@"), v27, v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXSession _resignActiveForReason:](self, "_resignActiveForReason:", v28);

    goto LABEL_30;
  }
  -[SVXSession _discardPendingRequestBarriers](self, "_discardPendingRequestBarriers");
  if ((a3 & 1) == 0)
    goto LABEL_29;
LABEL_26:
  v25 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[SVXSession _requestDidEndWithOptions:error:]";
    v38 = 2048;
    v39 = a3;
    _os_log_impl(&dword_214934000, v25, OS_LOG_TYPE_INFO, "%s Ignored resign active because request ending options = %tu", buf, 0x16u);
  }
LABEL_30:
  if (self->_isStateFeedbackEnabled && self->_stateFeedbackManager)
  {
    v29 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[SVXSession _requestDidEndWithOptions:error:]";
      _os_log_impl(&dword_214934000, v29, OS_LOG_TYPE_INFO, "%s #svxstatefeedback Ending StateFeedbackManager.", buf, 0xCu);
    }
    -[SVXSession _stateFeedbackManager](self, "_stateFeedbackManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "siriSessionDidEnd");

    stateFeedbackManager = self->_stateFeedbackManager;
    self->_stateFeedbackManager = 0;

  }
}

- (void)_handleSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  id WeakRetained;
  SVXActivationContext *v8;
  NSUUID *activityUUID;
  void *v10;
  NSObject *v11;
  NSUUID *v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t launchSignpostID;
  os_log_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  os_log_t v20;
  SVXActivationContext *currentActivationContext;
  int v22;
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v22 = 136315394;
    v23 = "-[SVXSession _handleSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:]";
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s wrapper = %@", (uint8_t *)&v22, 0x16u);
  }
  if (!self->_currentRequestUUID)
  {
    v16 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v22 = 136315138;
    v23 = "-[SVXSession _handleSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:]";
    v17 = "%s Ignored because _currentRequestUUID is nil.";
    v18 = v16;
    v19 = 12;
LABEL_21:
    _os_log_error_impl(&dword_214934000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v22, v19);
    goto LABEL_19;
  }
  if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
  {
    v20 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    currentActivationContext = self->_currentActivationContext;
    v22 = 136315394;
    v23 = "-[SVXSession _handleSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:]";
    v24 = 2112;
    v25 = currentActivationContext;
    v17 = "%s _currentActivationContext does not allow speech recording. (_currentActivationContext = %@)";
    v18 = v20;
    v19 = 22;
    goto LABEL_21;
  }
  if (self->_activityState == 3)
  {
    self->_activityState = 4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = self->_currentActivationContext;
    activityUUID = self->_activityUUID;
    -[AFAnalyticsTurnBasedInstrumentationContext turnIdentifier](self->_currentRequestInstrumentationContext, "turnIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "session:didBecomeActiveWithActivationContext:activityUUID:turnID:", self, v8, activityUUID, v10);

    v11 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      v12 = self->_activityUUID;
      v22 = 136315394;
      v23 = "-[SVXSession _handleSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:]";
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_214934000, v11, OS_LOG_TYPE_INFO, "%s SESSION IS ACTIVE (%@)", (uint8_t *)&v22, 0x16u);
    }
    v13 = (id)*MEMORY[0x24BE08FE0];
    v14 = v13;
    launchSignpostID = self->_launchSignpostID;
    if (launchSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(v22) = 0;
      _os_signpost_emit_with_name_impl(&dword_214934000, v14, OS_SIGNPOST_INTERVAL_END, launchSignpostID, "voiceUILaunch", (const char *)&unk_2149C7932, (uint8_t *)&v22, 2u);
    }

    SVXInstrumentationEmitViewAppearContextEnd(self->_currentRequestInstrumentationContext);
  }
  -[SVXSession _setInputAudioPowerWrapper:](self, "_setInputAudioPowerWrapper:", v4);
  if (-[AFSpeechRequestOptions activationEvent](self->_currentSpeechRequestOptions, "activationEvent") != 1
    || (-[AFPreferences startAlertEnabled](self->_preferences, "startAlertEnabled") & 1) == 0)
  {
    -[SRSTClient dispatchEvent:](self->_client, "dispatchEvent:", 0);
    -[SVXSession _setCurrentState:](self, "_setCurrentState:", 2);
  }
  -[SVXSession _continuePendingSpeechRequest:](self, "_continuePendingSpeechRequest:", 1);
LABEL_19:

}

- (void)_handleSpeechRecordingDidBeginOnAVRecordRoute:(id)a3
{
  SVXActivationContext *v4;
  os_log_t *v5;
  NSObject *v6;
  os_log_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  os_log_t v11;
  SVXActivationContext *currentActivationContext;
  int v13;
  const char *v14;
  __int16 v15;
  SVXActivationContext *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (SVXActivationContext *)a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v13 = 136315394;
    v14 = "-[SVXSession _handleSpeechRecordingDidBeginOnAVRecordRoute:]";
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s recordRoute = %@", (uint8_t *)&v13, 0x16u);
  }
  if (!self->_currentRequestUUID)
  {
    v7 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v13 = 136315138;
    v14 = "-[SVXSession _handleSpeechRecordingDidBeginOnAVRecordRoute:]";
    v8 = "%s Ignored because _currentRequestUUID is nil.";
    v9 = v7;
    v10 = 12;
LABEL_11:
    _os_log_error_impl(&dword_214934000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v13, v10);
    goto LABEL_9;
  }
  if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
  {
    v11 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    currentActivationContext = self->_currentActivationContext;
    v13 = 136315394;
    v14 = "-[SVXSession _handleSpeechRecordingDidBeginOnAVRecordRoute:]";
    v15 = 2112;
    v16 = currentActivationContext;
    v8 = "%s _currentActivationContext does not allow speech recording. (_currentActivationContext = %@)";
    v9 = v11;
    v10 = 22;
    goto LABEL_11;
  }
  -[SRSTClient dispatchEvent:](self->_client, "dispatchEvent:", 0);
  -[SVXSession _setCurrentState:](self, "_setCurrentState:", 2);
  -[SVXSpeechSynthesizer prewarm](self->_speechSynthesizer, "prewarm");
LABEL_9:

}

- (void)_handleSpeechRecordingDidChangeAVRecordRoute:(id)a3
{
  SVXActivationContext *v4;
  os_log_t *v5;
  NSObject *v6;
  os_log_t v7;
  SVXActivationContext *currentActivationContext;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  os_log_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  SVXActivationContext *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (SVXActivationContext *)a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v13 = 136315394;
    v14 = "-[SVXSession _handleSpeechRecordingDidChangeAVRecordRoute:]";
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s recordRoute = %@", (uint8_t *)&v13, 0x16u);
  }
  if (self->_currentRequestUUID)
  {
    if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
    {
      v7 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        currentActivationContext = self->_currentActivationContext;
        v13 = 136315394;
        v14 = "-[SVXSession _handleSpeechRecordingDidChangeAVRecordRoute:]";
        v15 = 2112;
        v16 = currentActivationContext;
        v9 = "%s _currentActivationContext does not allow speech recording. (_currentActivationContext = %@)";
        v10 = v7;
        v11 = 22;
LABEL_10:
        _os_log_error_impl(&dword_214934000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v13, v11);
      }
    }
  }
  else
  {
    v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315138;
      v14 = "-[SVXSession _handleSpeechRecordingDidChangeAVRecordRoute:]";
      v9 = "%s Ignored because _currentRequestUUID is nil.";
      v10 = v12;
      v11 = 12;
      goto LABEL_10;
    }
  }

}

- (void)_handleSpeechRecordingDidDetectStartpoint
{
  os_log_t *v3;
  NSObject *v4;
  os_log_t v5;
  SVXActivationContext *currentActivationContext;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  os_log_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  SVXActivationContext *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v11 = 136315138;
    v12 = "-[SVXSession _handleSpeechRecordingDidDetectStartpoint]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v11, 0xCu);
  }
  if (self->_currentRequestUUID)
  {
    if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
    {
      v5 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      {
        currentActivationContext = self->_currentActivationContext;
        v11 = 136315394;
        v12 = "-[SVXSession _handleSpeechRecordingDidDetectStartpoint]";
        v13 = 2112;
        v14 = currentActivationContext;
        v7 = "%s _currentActivationContext does not allow speech recording. (_currentActivationContext = %@)";
        v8 = v5;
        v9 = 22;
LABEL_10:
        _os_log_error_impl(&dword_214934000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v11, v9);
      }
    }
  }
  else
  {
    v10 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[SVXSession _handleSpeechRecordingDidDetectStartpoint]";
      v7 = "%s Ignored because _currentRequestUUID is nil.";
      v8 = v10;
      v9 = 12;
      goto LABEL_10;
    }
  }
}

- (void)_handleSpeechRecordingPerformTwoShotPromptWithType:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, void *, __n128, __n128);
  os_log_t *v7;
  NSObject *v8;
  SVXSpeechSynthesizer *speechSynthesizer;
  void *v10;
  void *v11;
  NSObject *v12;
  __n128 v13;
  __n128 v14;
  NSObject *v15;
  __n128 v16;
  __n128 v17;
  void *v18;
  void *v19;
  SVXActivationContext *currentActivationContext;
  _QWORD v21[4];
  void (**v22)(id, void *, __n128, __n128);
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *, __n128, __n128))a4;
  v7 = (os_log_t *)MEMORY[0x24BE08FB0];
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[SVXSession _handleSpeechRecordingPerformTwoShotPromptWithType:completion:]";
    v25 = 2048;
    v26 = a3;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s type = %ld", buf, 0x16u);
  }
  if (!self->_currentRequestUUID)
  {
    v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "-[SVXSession _handleSpeechRecordingPerformTwoShotPromptWithType:completion:]";
      _os_log_error_impl(&dword_214934000, v12, OS_LOG_TYPE_ERROR, "%s Failing with invalid times because _currentRequestUUID is nil.", buf, 0xCu);
      if (!v6)
        goto LABEL_17;
    }
    else if (!v6)
    {
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:", 28);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13.n128_u64[0] = -1.0;
    v14.n128_u64[0] = -1.0;
    v6[2](v6, v11, v13, v14);
    goto LABEL_16;
  }
  if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
  {
    v15 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      currentActivationContext = self->_currentActivationContext;
      *(_DWORD *)buf = 136315394;
      v24 = "-[SVXSession _handleSpeechRecordingPerformTwoShotPromptWithType:completion:]";
      v25 = 2112;
      v26 = (int64_t)currentActivationContext;
      _os_log_error_impl(&dword_214934000, v15, OS_LOG_TYPE_ERROR, "%s _currentActivationContext does not allow speech recording. (_currentActivationContext = %@)", buf, 0x16u);
      if (!v6)
        goto LABEL_17;
    }
    else if (!v6)
    {
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 15, CFSTR("Current activation context does not allow speech recording."), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v16.n128_u64[0] = 0;
    v17.n128_u64[0] = 0;
    v6[2](v6, v11, v16, v17);
    goto LABEL_16;
  }
  if (a3 == 2)
  {
    speechSynthesizer = self->_speechSynthesizer;
    -[SVXSpeechSynthesisUtils createPhaticPrompt](self->_speechSynthesisUtils, "createPhaticPrompt");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __76__SVXSession__handleSpeechRecordingPerformTwoShotPromptWithType_completion___block_invoke;
    v21[3] = &unk_24D24EBB8;
    v22 = v6;
    -[SVXSpeechSynthesizer enqueueRequest:languageCode:voiceName:gender:audioSessionID:preparation:finalization:taskTracker:analyticsContext:](speechSynthesizer, "enqueueRequest:languageCode:voiceName:gender:audioSessionID:preparation:finalization:taskTracker:analyticsContext:", v10, 0, 0, 0, 0, 0, v21, 0, 0);

    v11 = v22;
LABEL_16:

    goto LABEL_17;
  }
  if (v6)
  {
    v18 = (void *)MEMORY[0x24BE091D8];
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unsupported Two-Shot prompt type %ld."), a3);
    objc_msgSend(v18, "errorWithCode:description:underlyingError:", 15, v19, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
LABEL_17:

}

- (void)_handleSpeechRecordingDidEnd
{
  os_log_t *v3;
  NSObject *v4;
  os_log_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  os_log_t v9;
  SVXActivationContext *currentActivationContext;
  os_log_t v11;
  NSObject *v12;
  __CFString *v13;
  unint64_t currentState;
  __CFString *v15;
  __CFString *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v17 = 136315138;
    v18 = "-[SVXSession _handleSpeechRecordingDidEnd]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v17, 0xCu);
  }
  if (!self->_currentRequestUUID)
  {
    v5 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      return;
    v17 = 136315138;
    v18 = "-[SVXSession _handleSpeechRecordingDidEnd]";
    v6 = "%s Ignored because _currentRequestUUID is nil.";
    v7 = v5;
    v8 = 12;
    goto LABEL_12;
  }
  if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
  {
    v9 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      return;
    currentActivationContext = self->_currentActivationContext;
    v17 = 136315394;
    v18 = "-[SVXSession _handleSpeechRecordingDidEnd]";
    v19 = 2112;
    v20 = (const __CFString *)currentActivationContext;
    v6 = "%s _currentActivationContext does not allow speech recording. (_currentActivationContext = %@)";
    v7 = v9;
    v8 = 22;
LABEL_12:
    _os_log_error_impl(&dword_214934000, v7, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v17, v8);
    return;
  }
  -[SRSTClient dispatchEvent:](self->_client, "dispatchEvent:", 6);
  if (self->_currentState == 2)
  {
    if (!self->_isStateFeedbackEnabled)
      -[SVXSession _setCurrentState:](self, "_setCurrentState:", 3);
  }
  else
  {
    v11 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      v13 = CFSTR("listening");
      currentState = self->_currentState;
      if (currentState > 4)
        v15 = CFSTR("(unknown)");
      else
        v15 = off_24D24E7A8[currentState];
      v16 = v15;
      v17 = 136315650;
      v18 = "-[SVXSession _handleSpeechRecordingDidEnd]";
      v19 = 2112;
      v20 = CFSTR("listening");
      v21 = 2112;
      v22 = v16;
      _os_log_error_impl(&dword_214934000, v12, OS_LOG_TYPE_ERROR, "%s _currentState is expected to be %@ when the speech recording is ended. (_currentState = %@)", (uint8_t *)&v17, 0x20u);

    }
  }
}

- (void)_handleSpeechRecordingDidCancel
{
  os_log_t *v3;
  NSObject *v4;
  os_log_t v5;
  NSObject *v6;
  __CFString *v7;
  unint64_t currentState;
  __CFString *v9;
  os_log_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  os_log_t v14;
  SVXActivationContext *currentActivationContext;
  __CFString *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v17 = 136315138;
    v18 = "-[SVXSession _handleSpeechRecordingDidCancel]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v17, 0xCu);
  }
  if (!self->_currentRequestUUID)
  {
    v10 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      return;
    v17 = 136315138;
    v18 = "-[SVXSession _handleSpeechRecordingDidCancel]";
    v11 = "%s Ignored because _currentRequestUUID is nil.";
    v12 = v10;
    v13 = 12;
    goto LABEL_14;
  }
  if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
  {
    v14 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      return;
    currentActivationContext = self->_currentActivationContext;
    v17 = 136315394;
    v18 = "-[SVXSession _handleSpeechRecordingDidCancel]";
    v19 = 2112;
    v20 = (const __CFString *)currentActivationContext;
    v11 = "%s _currentActivationContext does not allow speech recording. (_currentActivationContext = %@)";
    v12 = v14;
    v13 = 22;
LABEL_14:
    _os_log_error_impl(&dword_214934000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v17, v13);
    return;
  }
  if (self->_currentState != 2)
  {
    v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      v7 = CFSTR("listening");
      currentState = self->_currentState;
      if (currentState > 4)
        v9 = CFSTR("(unknown)");
      else
        v9 = off_24D24E7A8[currentState];
      v16 = v9;
      v17 = 136315650;
      v18 = "-[SVXSession _handleSpeechRecordingDidCancel]";
      v19 = 2112;
      v20 = CFSTR("listening");
      v21 = 2112;
      v22 = v16;
      _os_log_error_impl(&dword_214934000, v6, OS_LOG_TYPE_ERROR, "%s _currentState is expected to be %@ when the speech recording is canceled. (_currentState = %@)", (uint8_t *)&v17, 0x20u);

    }
  }
}

- (void)_handleSpeechRecordingDidFailWithError:(id)a3
{
  __CFString *v4;
  os_log_t *v5;
  NSObject *v6;
  os_log_t v7;
  os_log_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  os_log_t v12;
  SVXActivationContext *currentActivationContext;
  NSObject *v14;
  __CFString *v15;
  unint64_t currentState;
  __CFString *v17;
  __CFString *v18;
  int v19;
  const char *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v19 = 136315394;
    v20 = "-[SVXSession _handleSpeechRecordingDidFailWithError:]";
    v21 = 2112;
    v22 = v4;
    _os_log_error_impl(&dword_214934000, v6, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v19, 0x16u);
  }
  if (!self->_currentRequestUUID)
  {
    v8 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v19 = 136315138;
    v20 = "-[SVXSession _handleSpeechRecordingDidFailWithError:]";
    v9 = "%s Ignored because _currentRequestUUID is nil.";
    v10 = v8;
    v11 = 12;
LABEL_13:
    _os_log_error_impl(&dword_214934000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v19, v11);
    goto LABEL_11;
  }
  if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
  {
    v12 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    currentActivationContext = self->_currentActivationContext;
    v19 = 136315394;
    v20 = "-[SVXSession _handleSpeechRecordingDidFailWithError:]";
    v21 = 2112;
    v22 = (const __CFString *)currentActivationContext;
    v9 = "%s _currentActivationContext does not allow speech recording. (_currentActivationContext = %@)";
    v10 = v12;
    v11 = 22;
    goto LABEL_13;
  }
  if (self->_currentState != 2)
  {
    v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      v14 = v7;
      v15 = CFSTR("listening");
      currentState = self->_currentState;
      if (currentState > 4)
        v17 = CFSTR("(unknown)");
      else
        v17 = off_24D24E7A8[currentState];
      v18 = v17;
      v19 = 136315650;
      v20 = "-[SVXSession _handleSpeechRecordingDidFailWithError:]";
      v21 = 2112;
      v22 = CFSTR("listening");
      v23 = 2112;
      v24 = v18;
      _os_log_error_impl(&dword_214934000, v14, OS_LOG_TYPE_ERROR, "%s _currentState is expected to be %@ when the speech recording is failed. (_currentState = %@)", (uint8_t *)&v19, 0x20u);

    }
    -[SVXSession _continuePendingSpeechRequest:](self, "_continuePendingSpeechRequest:", 0);
  }
LABEL_11:

}

- (void)_handleSpeechRecognitionDidFailWithError:(id)a3
{
  SVXActivationContext *v4;
  os_log_t *v5;
  NSObject *v6;
  os_log_t v7;
  SVXActivationContext *currentActivationContext;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  os_log_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  SVXActivationContext *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (SVXActivationContext *)a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v13 = 136315394;
    v14 = "-[SVXSession _handleSpeechRecognitionDidFailWithError:]";
    v15 = 2112;
    v16 = v4;
    _os_log_error_impl(&dword_214934000, v6, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v13, 0x16u);
  }
  if (self->_currentRequestUUID)
  {
    if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
    {
      v7 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        currentActivationContext = self->_currentActivationContext;
        v13 = 136315394;
        v14 = "-[SVXSession _handleSpeechRecognitionDidFailWithError:]";
        v15 = 2112;
        v16 = currentActivationContext;
        v9 = "%s _currentActivationContext does not allow speech recording and recognition. (_currentActivationContext = %@)";
        v10 = v7;
        v11 = 22;
LABEL_10:
        _os_log_error_impl(&dword_214934000, v10, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v13, v11);
      }
    }
  }
  else
  {
    v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315138;
      v14 = "-[SVXSession _handleSpeechRecognitionDidFailWithError:]";
      v9 = "%s Ignored because _currentRequestUUID is nil.";
      v10 = v12;
      v11 = 12;
      goto LABEL_10;
    }
  }

}

- (void)_handleSpeechRecognized:(id)a3
{
  __CFString *v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  os_log_t v10;
  NSObject *v11;
  __CFString *v12;
  os_log_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  os_log_t v17;
  SVXActivationContext *currentActivationContext;
  int v19;
  const char *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v19 = 136315394;
    v20 = "-[SVXSession _handleSpeechRecognized:]";
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s speechRecognized = %@", (uint8_t *)&v19, 0x16u);
  }
  if (!self->_currentRequestUUID)
  {
    v13 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v19 = 136315138;
    v20 = "-[SVXSession _handleSpeechRecognized:]";
    v14 = "%s Ignored because _currentRequestUUID is nil.";
    v15 = v13;
    v16 = 12;
LABEL_13:
    _os_log_error_impl(&dword_214934000, v15, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v19, v16);
    goto LABEL_17;
  }
  if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
  {
    v17 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    currentActivationContext = self->_currentActivationContext;
    v19 = 136315394;
    v20 = "-[SVXSession _handleSpeechRecognized:]";
    v21 = 2112;
    v22 = (const __CFString *)currentActivationContext;
    v14 = "%s _currentActivationContext does not allow speech recording and recognition. (_currentActivationContext = %@)";
    v15 = v17;
    v16 = 22;
    goto LABEL_13;
  }
  -[SVXActivationContext requestInfo](self->_currentActivationContext, "requestInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "speechRequestOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "activationEvent");

  if (v9 == 30)
  {
    if (self->_currentState == 2)
    {
      v10 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        v11 = v10;
        v12 = CFSTR("listening");
        v19 = 136315394;
        v20 = "-[SVXSession _handleSpeechRecognized:]";
        v21 = 2112;
        v22 = CFSTR("listening");
        _os_log_impl(&dword_214934000, v11, OS_LOG_TYPE_INFO, "%s _currentState is %@ when speech is recognized and state transitions should be skipped", (uint8_t *)&v19, 0x16u);

      }
    }
  }
  else
  {
    -[SRSTClient dispatchEvent:](self->_client, "dispatchEvent:", 6);
    if (self->_currentState == 2 && !self->_isStateFeedbackEnabled)
      -[SVXSession _setCurrentState:](self, "_setCurrentState:", 3);
  }
LABEL_17:

}

- (void)_handleSpeechRecognizedPartialResult:(id)a3
{
  SVXActivationContext *v4;
  os_log_t *v5;
  NSObject *v6;
  os_log_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  os_log_t v11;
  SVXActivationContext *currentActivationContext;
  int v13;
  const char *v14;
  __int16 v15;
  SVXActivationContext *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (SVXActivationContext *)a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v13 = 136315394;
    v14 = "-[SVXSession _handleSpeechRecognizedPartialResult:]";
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s partialResult = %@", (uint8_t *)&v13, 0x16u);
  }
  if (!self->_currentRequestUUID)
  {
    v7 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v13 = 136315138;
    v14 = "-[SVXSession _handleSpeechRecognizedPartialResult:]";
    v8 = "%s Ignored because _currentRequestUUID is nil.";
    v9 = v7;
    v10 = 12;
LABEL_11:
    _os_log_error_impl(&dword_214934000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v13, v10);
    goto LABEL_9;
  }
  if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0)
  {
    v11 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    currentActivationContext = self->_currentActivationContext;
    v13 = 136315394;
    v14 = "-[SVXSession _handleSpeechRecognizedPartialResult:]";
    v15 = 2112;
    v16 = currentActivationContext;
    v8 = "%s _currentActivationContext does not allow speech recording and recognition. (_currentActivationContext = %@)";
    v9 = v11;
    v10 = 22;
    goto LABEL_11;
  }
  -[SVXSession _handleReceivedCommand:completion:](self, "_handleReceivedCommand:completion:", v4, &__block_literal_global_166);
LABEL_9:

}

- (void)_handleRequestWillStart
{
  os_log_t *v3;
  NSObject *v4;
  id WeakRetained;
  SVXActivationContext *currentActivationContext;
  NSUUID *activityUUID;
  void *v8;
  NSObject *v9;
  NSUUID *v10;
  int v11;
  const char *v12;
  __int16 v13;
  NSUUID *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v11 = 136315138;
    v12 = "-[SVXSession _handleRequestWillStart]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v11, 0xCu);
  }
  if (!self->_currentRequestUUID)
    -[SVXSession _requestWillBeginWithTaskTracker:](self, "_requestWillBeginWithTaskTracker:", 0);
  if ((SVXSessionIsSpeechRecordingAllowed(self->_currentActivationContext) & 1) == 0 && self->_activityState == 3)
  {
    self->_activityState = 4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    currentActivationContext = self->_currentActivationContext;
    activityUUID = self->_activityUUID;
    -[AFAnalyticsTurnBasedInstrumentationContext turnIdentifier](self->_currentRequestInstrumentationContext, "turnIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "session:didBecomeActiveWithActivationContext:activityUUID:turnID:", self, currentActivationContext, activityUUID, v8);

    v9 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
    {
      v10 = self->_activityUUID;
      v11 = 136315394;
      v12 = "-[SVXSession _handleRequestWillStart]";
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s SESSION IS ACTIVE (%@)", (uint8_t *)&v11, 0x16u);
    }
    SVXInstrumentationEmitViewAppearContextEnd(self->_currentRequestInstrumentationContext);
  }
}

- (void)_handleDismissAssistant
{
  os_log_t *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[SVXSession _handleDismissAssistant]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  if (self->_currentRequestUUID)
  {
    -[SVXSession _dismiss](self, "_dismiss");
  }
  else
  {
    v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[SVXSession _handleDismissAssistant]";
      _os_log_error_impl(&dword_214934000, v5, OS_LOG_TYPE_ERROR, "%s Ignored because _currentRequestUUID is nil.", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_handleRequestFinished
{
  os_log_t *v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[SVXSession _handleRequestFinished]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  if (self->_currentRequestUUID)
  {
    -[SVXSession _requestDidEndWithOptions:error:](self, "_requestDidEndWithOptions:error:", 0, 0);
  }
  else
  {
    v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[SVXSession _handleRequestFinished]";
      _os_log_error_impl(&dword_214934000, v5, OS_LOG_TYPE_ERROR, "%s Ignored because _currentRequestUUID is nil.", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_handleReceivedCommand:(id)a3 completion:(id)a4
{
  __CFString *v6;
  id v7;
  uint64_t v8;
  os_log_t *v9;
  NSObject *v10;
  id v11;
  __CFString *v12;
  void (**v13)(_QWORD);
  int64_t v14;
  int64_t v15;
  os_log_t v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  NSObject *v23;
  const char *v24;
  id v25;
  void *v26;
  SVXTaskContext *v27;
  id v28;
  void *v29;
  void *v30;
  NSUUID *currentRequestUUID;
  void *v32;
  void *v33;
  SVXTaskContext *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  _QWORD v39[4];
  __CFString *v40;
  id v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = a4;
  v8 = mach_absolute_time();
  v9 = (os_log_t *)MEMORY[0x24BE08FB0];
  v10 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v43 = "-[SVXSession _handleReceivedCommand:completion:]";
    v44 = 2112;
    v45 = v6;
    _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s command = %@", buf, 0x16u);
  }
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __48__SVXSession__handleReceivedCommand_completion___block_invoke;
  v39[3] = &unk_24D24EF28;
  v11 = v7;
  v41 = v11;
  v12 = v6;
  v40 = v12;
  v13 = (void (**)(_QWORD))MEMORY[0x2199D950C](v39);
  if (!self->_currentRequestUUID)
  {
    -[__CFString refId](v12, "refId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v43 = "-[SVXSession _handleReceivedCommand:completion:]";
        _os_log_error_impl(&dword_214934000, v20, OS_LOG_TYPE_ERROR, "%s Ignored because _currentRequestUUID is nil and the command.refId is not nil.", buf, 0xCu);
      }
LABEL_11:
      v13[2](v13);
      goto LABEL_27;
    }
  }
  v14 = -[SVXActivationContext source](self->_currentActivationContext, "source");
  v15 = v14;
  if (v14 == 5 || v14 == 3)
  {
    v16 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      v17 = v16;
      v18 = off_24D24D798[v15];
      *(_DWORD *)buf = 136315394;
      v43 = "-[SVXSession _handleReceivedCommand:completion:]";
      v44 = 2112;
      v45 = v18;
      _os_log_impl(&dword_214934000, v17, OS_LOG_TYPE_INFO, "%s Ignoring as current activation context is from %@", buf, 0x16u);

    }
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_26;
  -[__CFString af_dialogPhase](v12, "af_dialogPhase");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isExpository");

  if (!v22)
    goto LABEL_26;
  if (!-[SVXAceViewSpeakableTextExtractor hasSpeakableTexts:](self->_aceViewSpeakableTextExtractor, "hasSpeakableTexts:", v12))
  {
    v23 = *v9;
    if (!os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
      goto LABEL_21;
    *(_DWORD *)buf = 136315394;
    v43 = "-[SVXSession _handleReceivedCommand:completion:]";
    v44 = 2112;
    v45 = v12;
    v24 = "%s Ignored %@ because it does not contain speakable texts.";
    goto LABEL_20;
  }
  if (self->_currentRequestDidPresentUUFR)
  {
    v23 = *v9;
    if (!os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
      goto LABEL_21;
    *(_DWORD *)buf = 136315394;
    v43 = "-[SVXSession _handleReceivedCommand:completion:]";
    v44 = 2112;
    v45 = v12;
    v24 = "%s Ignored %@ because it is expository and UUFR has already been presented.";
    goto LABEL_20;
  }
  if (!self->_currentRequestWillPresentUUFR)
  {
LABEL_26:
    v38 = -[SVXServiceCommandHandler isCommandUUFR:](self->_serviceCommandHandler, "isCommandUUFR:", v12);
    v37 = v8;
    v27 = [SVXTaskContext alloc];
    v28 = objc_alloc(MEMORY[0x24BDD1880]);
    -[__CFString refId](v12, "refId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithUUIDString:", v29);
    currentRequestUUID = self->_currentRequestUUID;
    -[__CFString aceId](v12, "aceId");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString refId](v12, "refId");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v36) = v38;
    v34 = -[SVXTaskContext initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:](v27, "initWithOrigin:timestamp:sessionUUID:requestUUID:aceId:refId:dialogIdentifier:dialogPhase:isUUFR:listensAfterSpeaking:listenAfterSpeakingBehavior:activationContext:deactivationContext:error:", 11, v37, v30, currentRequestUUID, v32, v33, 0, 0, v36, 0, 0, 0, 0);

    -[SVXTaskTrackingCenter beginTrackingTaskWithContext:instrumentationContext:](self->_taskTrackingCenter, "beginTrackingTaskWithContext:instrumentationContext:", v34, self->_currentRequestInstrumentationContext);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXSession _handleCommand:taskTracker:completion:](self, "_handleCommand:taskTracker:completion:", v12, v35, v11);

    goto LABEL_27;
  }
  v23 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v43 = "-[SVXSession _handleReceivedCommand:completion:]";
    v44 = 2112;
    v45 = v12;
    v24 = "%s Ignored %@ because it is expository and UUFR is going to be presented.";
LABEL_20:
    _os_log_impl(&dword_214934000, v23, OS_LOG_TYPE_INFO, v24, buf, 0x16u);
  }
LABEL_21:
  if (v11)
  {
    v25 = objc_alloc_init(MEMORY[0x24BE811B8]);
    -[__CFString aceId](v12, "aceId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setRefId:", v26);

    (*((void (**)(id, id))v11 + 2))(v11, v25);
  }
LABEL_27:

}

- (void)_handleRequestFailedWithError:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v8 = 136315394;
    v9 = "-[SVXSession _handleRequestFailedWithError:]";
    v10 = 2112;
    v11 = v4;
    _os_log_error_impl(&dword_214934000, v6, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v8, 0x16u);
  }
  if (self->_currentRequestUUID)
  {
    -[SVXSession _requestDidEndWithOptions:error:](self, "_requestDidEndWithOptions:error:", 0, v4);
  }
  else
  {
    v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[SVXSession _handleRequestFailedWithError:]";
      _os_log_error_impl(&dword_214934000, v7, OS_LOG_TYPE_ERROR, "%s Ignored because _currentRequestUUID is nil.", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (void)_handleShouldSpeak:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  _BOOL4 v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[SVXSession _handleShouldSpeak:]";
    v7 = 1024;
    v8 = v3;
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s shouldSpeak = %d", (uint8_t *)&v5, 0x12u);
  }
}

- (void)_handleDidChangeAudioSessionID:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(_QWORD *)&a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[SVXSession _handleDidChangeAudioSessionID:]";
    v8 = 2048;
    v9 = v3;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s audioSessionID = %lu", (uint8_t *)&v6, 0x16u);
  }
  -[SVXSession _setAudioSessionID:](self, "_setAudioSessionID:", v3);
}

- (void)_handleAudioSessionDidBeginInterruption
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SVXSession _handleAudioSessionDidBeginInterruption]";
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  -[SVXSession _cancelRequestWithOptions:keepTaskTracker:](self, "_cancelRequestWithOptions:keepTaskTracker:", 6, 0);
}

- (void)_handleAudioSessionDidEndInterruption:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  _BOOL4 v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v5 = 136315394;
    v6 = "-[SVXSession _handleAudioSessionDidEndInterruption:]";
    v7 = 1024;
    v8 = v3;
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s shouldResume = %d", (uint8_t *)&v5, 0x12u);
  }
}

- (void)_handleWillStartAudioPlaybackRequest:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t v6;
  int64_t v7;
  id WeakRetained;
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
    v10 = "-[SVXSession _handleWillStartAudioPlaybackRequest:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s request = %@", (uint8_t *)&v9, 0x16u);
  }
  v6 = -[SVXSoundUtils getIDFromAudioPlaybackRequest:](self->_soundUtils, "getIDFromAudioPlaybackRequest:", v4);
  if (v6)
  {
    v7 = v6;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "session:willStartSoundWithID:", self, v7);

    if (v7 == 3 && self->_currentRequestUUID && self->_currentState == 1)
    {
      -[SRSTClient dispatchEvent:](self->_client, "dispatchEvent:", 0);
      -[SRSTClient dispatchEvent:](self->_client, "dispatchEvent:", 5);
      -[SVXSession _setCurrentState:](self, "_setCurrentState:", 2);
    }
  }

}

- (void)_handleDidStartAudioPlaybackRequest:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int64_t v10;
  int64_t v11;
  id WeakRetained;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v14 = 136315394;
    v15 = "-[SVXSession _handleDidStartAudioPlaybackRequest:]";
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s request = %@", (uint8_t *)&v14, 0x16u);
  }
  -[NSMutableDictionary objectForKey:](self->_playbackRequestInfo, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemUptime");
    objc_msgSend(v7, "setStart:");

    objc_msgSend(v7, "setDidStart:", 1);
    v9 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      v14 = 136315394;
      v15 = "-[SVXSession _handleDidStartAudioPlaybackRequest:]";
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s updating start time for request: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  v10 = -[SVXSoundUtils getIDFromAudioPlaybackRequest:](self->_soundUtils, "getIDFromAudioPlaybackRequest:", v4);
  if (v10)
  {
    v11 = v10;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "session:didStartSoundWithID:", self, v11);

  }
  if (self->_isStateFeedbackEnabled)
  {
    -[SVXSession _stateFeedbackManager](self, "_stateFeedbackManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "audioPlaybackRequestDidStartForRequest:", v4);

  }
}

- (void)_handleDidStopAudioPlaybackRequest:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int64_t v13;
  int64_t v14;
  id WeakRetained;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x24BE08FB0];
  v9 = *MEMORY[0x24BE08FB0];
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v16 = 136315650;
      v17 = "-[SVXSession _handleDidStopAudioPlaybackRequest:error:]";
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      _os_log_error_impl(&dword_214934000, v9, OS_LOG_TYPE_ERROR, "%s request = %@, error = %@", (uint8_t *)&v16, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v16 = 136315394;
    v17 = "-[SVXSession _handleDidStopAudioPlaybackRequest:error:]";
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s request = %@", (uint8_t *)&v16, 0x16u);
  }
  -[NSMutableDictionary objectForKey:](self->_playbackRequestInfo, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemUptime");
    objc_msgSend(v10, "setFinish:");

    objc_msgSend(v10, "setDidFinish:", 1);
    v12 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      v16 = 136315394;
      v17 = "-[SVXSession _handleDidStopAudioPlaybackRequest:error:]";
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s updating finish time for request: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  v13 = -[SVXSoundUtils getIDFromAudioPlaybackRequest:](self->_soundUtils, "getIDFromAudioPlaybackRequest:", v6);
  if (v13)
  {
    v14 = v13;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "session:didStopSoundWithID:error:", self, v14, v7);

  }
}

- (void)_handleDidHandleQuickStopWithActions:(unint64_t)a3
{
  os_log_t *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[SVXSession _handleDidHandleQuickStopWithActions:]";
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s actions = %tu", (uint8_t *)&v8, 0x16u);
  }
  if (self->_currentRequestUUID)
  {
    -[SVXSession _dismiss](self, "_dismiss");
  }
  else
  {
    v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[SVXSession _handleDidHandleQuickStopWithActions:]";
      _os_log_error_impl(&dword_214934000, v7, OS_LOG_TYPE_ERROR, "%s Ignored because _currentRequestUUID is nil.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_handleWillProcessStartPlaybackWithDestination:(int64_t)a3 intent:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  os_log_t *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = (os_log_t *)MEMORY[0x24BE08FB0];
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v13 = 136315650;
    v14 = "-[SVXSession _handleWillProcessStartPlaybackWithDestination:intent:completion:]";
    v15 = 2048;
    v16 = a3;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_214934000, v11, OS_LOG_TYPE_INFO, "%s destination = %ld, intent = %@", (uint8_t *)&v13, 0x20u);
  }
  if (!self->_currentRequestUUID)
  {
    v12 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315138;
      v14 = "-[SVXSession _handleWillProcessStartPlaybackWithDestination:intent:completion:]";
      _os_log_error_impl(&dword_214934000, v12, OS_LOG_TYPE_ERROR, "%s Failing without setting flags because _currentRequestUUID is nil (mostly likely a -prepareForAudioHandoffWithCompletion: call is happening outside of a request.", (uint8_t *)&v13, 0xCu);
      if (!v9)
        goto LABEL_9;
    }
    else if (!v9)
    {
      goto LABEL_9;
    }
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
    goto LABEL_9;
  }
  self->_isMostRecentRequestStartingMediaPlaybackLocally = a3 == 1;
  if (v9)
    (*((void (**)(id, uint64_t, uint64_t))v9 + 2))(v9, 1, 1);
LABEL_9:

}

- (void)_handleDidFailStartPlaybackWithDestination:(int64_t)a3
{
  os_log_t *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[SVXSession _handleDidFailStartPlaybackWithDestination:]";
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s destination = %ld", (uint8_t *)&v8, 0x16u);
  }
  if (self->_currentRequestUUID)
  {
    self->_isMostRecentRequestStartingMediaPlaybackLocally = 0;
  }
  else
  {
    v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[SVXSession _handleDidFailStartPlaybackWithDestination:]";
      _os_log_error_impl(&dword_214934000, v7, OS_LOG_TYPE_ERROR, "%s Ignored because _currentRequestUUID is nil.", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_handleAudioSessionWillBecomeActive:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[SVXSession _handleAudioSessionWillBecomeActive:]";
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s flag = %d", (uint8_t *)&v7, 0x12u);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "session:audioSessionWillBecomeActive:activationContext:deactivationContext:", self, v3, self->_currentActivationContext, self->_currentDeactivationContext);

}

- (void)_handleAudioSessionDidBecomeActive:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[SVXSession _handleAudioSessionDidBecomeActive:]";
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s flag = %d", (uint8_t *)&v7, 0x12u);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "session:audioSessionDidBecomeActive:activationContext:deactivationContext:", self, v3, self->_currentActivationContext, self->_currentDeactivationContext);

}

- (void)_willChangeFromState:(int64_t)a3 toState:(int64_t)a4
{
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  id WeakRetained;
  int v14;
  const char *v15;
  __int16 v16;
  __CFString *v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    if ((unint64_t)a3 > 4)
      v9 = CFSTR("(unknown)");
    else
      v9 = off_24D24E7A8[a3];
    v10 = v9;
    if ((unint64_t)a4 > 4)
      v11 = CFSTR("(unknown)");
    else
      v11 = off_24D24E7A8[a4];
    v12 = v11;
    v14 = 136315650;
    v15 = "-[SVXSession _willChangeFromState:toState:]";
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s fromState = %@, toState = %@", (uint8_t *)&v14, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "session:willChangeFromState:toState:", self, a3, a4);

  if ((unint64_t)(a4 - 1) <= 3)
    -[AFAnalytics logEventWithType:context:](self->_analytics, "logEventWithType:context:", a4 + 1415, 0);
}

- (void)_didChangeFromState:(int64_t)a3 toState:(int64_t)a4
{
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  AFAnalyticsTurnBasedInstrumentationContext *currentRequestInstrumentationContext;
  uint64_t currentInstrumentationUIState;
  int64_t v16;
  id WeakRetained;
  int64_t v18;
  int64_t v19;
  NSObject *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  __CFString *v25;
  __int16 v26;
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = (os_log_t *)MEMORY[0x24BE08FB0];
  v8 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    if ((unint64_t)a3 > 4)
      v10 = CFSTR("(unknown)");
    else
      v10 = off_24D24E7A8[a3];
    v11 = v10;
    if ((unint64_t)a4 > 4)
      v12 = CFSTR("(unknown)");
    else
      v12 = off_24D24E7A8[a4];
    v13 = v12;
    v22 = 136315650;
    v23 = "-[SVXSession _didChangeFromState:toState:]";
    v24 = 2112;
    v25 = v11;
    v26 = 2112;
    v27 = v13;
    _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s fromState = %@, toState = %@", (uint8_t *)&v22, 0x20u);

  }
  if (a4 != 2)
  {
    -[SVXSession _setInputAudioPowerWrapper:](self, "_setInputAudioPowerWrapper:", 0);
    if (a4 == 3)
    {
      -[SVXSession _beginThinking](self, "_beginThinking");
    }
    else if (a4 == 1)
    {
      -[SVXSession _setOutputAudioPowerWrapper:](self, "_setOutputAudioPowerWrapper:", 0);
    }
  }
  if (a3 == 3)
  {
    -[SVXSession _endThinking](self, "_endThinking");
    currentRequestInstrumentationContext = self->_currentRequestInstrumentationContext;
    currentInstrumentationUIState = self->_currentInstrumentationUIState;
    v16 = 3;
  }
  else
  {
    currentRequestInstrumentationContext = self->_currentRequestInstrumentationContext;
    currentInstrumentationUIState = self->_currentInstrumentationUIState;
    v16 = a3;
  }
  self->_currentInstrumentationUIState = SVXInstrumentationEmitUIStateTransition(currentRequestInstrumentationContext, v16, a4, currentInstrumentationUIState);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "session:didChangeFromState:toState:", self, a3, a4);

  if (self->_isStateFeedbackEnabled)
  {
    v18 = -[SVXSession _getSRUIFSiriSessionStateFor:](self, "_getSRUIFSiriSessionStateFor:", a3);
    v19 = -[SVXSession _getSRUIFSiriSessionStateFor:](self, "_getSRUIFSiriSessionStateFor:", a4);
    v20 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      v22 = 136315650;
      v23 = "-[SVXSession _didChangeFromState:toState:]";
      v24 = 2048;
      v25 = (__CFString *)v18;
      v26 = 2048;
      v27 = (__CFString *)v19;
      _os_log_impl(&dword_214934000, v20, OS_LOG_TYPE_INFO, "%s Converted fromState: %ld, Converted toState: %ld", (uint8_t *)&v22, 0x20u);
    }
    -[SVXSession _stateFeedbackManager](self, "_stateFeedbackManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "didTransitionFromState:toState:", v18, v19);

  }
}

- (int64_t)_getSRUIFSiriSessionStateFor:(int64_t)a3
{
  int64_t result;
  void *v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  result = a3 - 1;
  if ((unint64_t)(a3 - 1) >= 4)
  {
    v5 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      if ((unint64_t)a3 > 4)
        v7 = CFSTR("(unknown)");
      else
        v7 = off_24D24E7A8[a3];
      v8 = v7;
      v9 = 136315394;
      v10 = "-[SVXSession _getSRUIFSiriSessionStateFor:]";
      v11 = 2112;
      v12 = v8;
      _os_log_error_impl(&dword_214934000, v6, OS_LOG_TYPE_ERROR, "%s Unsupported SVXSessionState: %@. Converting to SRUIFSiriSessionStateIdle", (uint8_t *)&v9, 0x16u);

    }
    return 0;
  }
  return result;
}

- (void)_beginThinking
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "-[SVXSession _beginThinking]";
    _os_log_impl(&dword_214934000, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_endThinking
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "-[SVXSession _endThinking]";
    _os_log_impl(&dword_214934000, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_handleSpeechSynthesizerWillBecomeBusy
{
  os_log_t *v3;
  NSObject *v4;
  AFSpeechRequestOptions *currentSpeechRequestOptions;
  os_log_t v6;
  AFSpeechRequestOptions *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  os_log_t v11;
  SVXPowerLevelManager *powerLevelManager;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  AFSpeechRequestOptions *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[SVXSession _handleSpeechSynthesizerWillBecomeBusy]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if ((-[AFInstanceContext supportsAudioPowerUpdate](self->_instanceContext, "supportsAudioPowerUpdate") & 1) == 0)
  {
    v11 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
      return;
    *(_DWORD *)buf = 136315138;
    v16 = "-[SVXSession _handleSpeechSynthesizerWillBecomeBusy]";
    v8 = "%s Output audio power updater not supported.";
    v9 = v11;
    v10 = 12;
    goto LABEL_10;
  }
  currentSpeechRequestOptions = self->_currentSpeechRequestOptions;
  if (currentSpeechRequestOptions
    && -[AFSpeechRequestOptions disableOutputAudioPowerUpdate](currentSpeechRequestOptions, "disableOutputAudioPowerUpdate"))
  {
    v6 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
      return;
    v7 = self->_currentSpeechRequestOptions;
    *(_DWORD *)buf = 136315394;
    v16 = "-[SVXSession _handleSpeechSynthesizerWillBecomeBusy]";
    v17 = 2112;
    v18 = v7;
    v8 = "%s Output audio power updater disabled by current speech request options %@.";
    v9 = v6;
    v10 = 22;
LABEL_10:
    _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, v8, buf, v10);
    return;
  }
  objc_initWeak((id *)buf, self);
  powerLevelManager = self->_powerLevelManager;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __52__SVXSession__handleSpeechSynthesizerWillBecomeBusy__block_invoke;
  v13[3] = &unk_24D24E330;
  objc_copyWeak(&v14, (id *)buf);
  -[SVXPowerLevelManager beginUpdateAudioPowerWithCompletion:](powerLevelManager, "beginUpdateAudioPowerWithCompletion:", v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)_handleSpeechSynthesizerDidBecomeIdle
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[SVXSession _handleSpeechSynthesizerDidBecomeIdle]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  -[SVXPowerLevelManager endUpdateAudioPower](self->_powerLevelManager, "endUpdateAudioPower");
  -[SVXSession _setOutputAudioPowerWrapper:](self, "_setOutputAudioPowerWrapper:", 0);
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SVXSession _resignActiveForReason:](self, "_resignActiveForReason:", v5);

}

- (void)_handleSpeechSynthesizerWillStartRequest:(id)a3 taskTracker:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  unint64_t v10;
  SVXTaskTrackingCenter *taskTrackingCenter;
  _QWORD v12[4];
  id v13;
  SVXSession *v14;
  id v15;
  unint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[SVXSession _handleSpeechSynthesizerWillStartRequest:taskTracker:]";
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s request = %@", buf, 0x16u);
  }
  v9 = objc_msgSend(v7, "origin");
  if (v9 <= 0xB)
  {
    v10 = v9;
    if (((1 << v9) & 0xB02) != 0)
    {
      taskTrackingCenter = self->_taskTrackingCenter;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __67__SVXSession__handleSpeechSynthesizerWillStartRequest_taskTracker___block_invoke;
      v12[3] = &unk_24D24E380;
      v13 = v7;
      v14 = self;
      v15 = v6;
      v16 = v10;
      -[SVXTaskTrackingCenter getContextsOfAllTrackedTasksUsingBlock:](taskTrackingCenter, "getContextsOfAllTrackedTasksUsingBlock:", v12);

    }
  }

}

- (void)_handleSpeechSynthesizerDidStartRequest:(id)a3 record:(id)a4 taskTracker:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  SVXTaskTrackingCenter *taskTrackingCenter;
  _QWORD v14[4];
  id v15;
  SVXSession *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[SVXSession _handleSpeechSynthesizerDidStartRequest:record:taskTracker:]";
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_214934000, v11, OS_LOG_TYPE_INFO, "%s request = %@, record = %@", buf, 0x20u);
  }
  -[SVXSession _connection:](self, "_connection:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateSpeechSynthesisRecord:", v9);

  if (objc_msgSend(v10, "origin") == 11)
  {
    taskTrackingCenter = self->_taskTrackingCenter;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __73__SVXSession__handleSpeechSynthesizerDidStartRequest_record_taskTracker___block_invoke;
    v14[3] = &unk_24D24E3A8;
    v15 = v10;
    v16 = self;
    -[SVXTaskTrackingCenter getContextsOfAllTrackedTasksUsingBlock:](taskTrackingCenter, "getContextsOfAllTrackedTasksUsingBlock:", v14);

  }
}

- (void)_handleSpeechSynthesizerDidFinishRequest:(id)a3 record:(id)a4 taskTracker:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v13 = 136315650;
    v14 = "-[SVXSession _handleSpeechSynthesizerDidFinishRequest:record:taskTracker:]";
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_214934000, v11, OS_LOG_TYPE_INFO, "%s request = %@, record = %@", (uint8_t *)&v13, 0x20u);
  }
  -[SVXSession _connection:](self, "_connection:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateSpeechSynthesisRecord:", v9);

  -[SVXSession _handleStartListenAfterSpeaking:record:taskTracker:](self, "_handleStartListenAfterSpeaking:record:taskTracker:", v8, v9, v10);
}

- (void)_handleSpeechSynthesizerDidCancelRequest:(id)a3 taskTracker:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[SVXSession _handleSpeechSynthesizerDidCancelRequest:taskTracker:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s request = %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)_handleSpeechSynthesizerDidInterruptRequest:(id)a3 taskTracker:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[SVXSession _handleSpeechSynthesizerDidInterruptRequest:taskTracker:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s request = %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)_handleSpeechSynthesizerDidFailRequest:(id)a3 taskTracker:(id)a4 error:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a5;
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v9 = 136315650;
    v10 = "-[SVXSession _handleSpeechSynthesizerDidFailRequest:taskTracker:error:]";
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s request = %@, error = %@", (uint8_t *)&v9, 0x20u);
  }

}

- (void)_handleStartListenAfterSpeaking:(id)a3 record:(id)a4 taskTracker:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  os_log_t *v13;
  NSObject *v14;
  SVXActivationContext *v15;
  void *v16;
  SVXActivationContext *v17;
  NSObject *v18;
  SVXActivationContext *v19;
  _QWORD v20[4];
  SVXActivationContext *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id location;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  SVXActivationContext *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = mach_absolute_time();
  objc_msgSend(v10, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "listensAfterSpeaking") && objc_msgSend(v12, "origin") == 11)
  {
    v13 = (os_log_t *)MEMORY[0x24BE08FB0];
    v14 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[SVXSession _handleStartListenAfterSpeaking:record:taskTracker:]";
      _os_log_impl(&dword_214934000, v14, OS_LOG_TYPE_INFO, "%s listensAfterSpeaking = YES", buf, 0xCu);
    }
    v15 = [SVXActivationContext alloc];
    SVXClientInfoGetCurrent();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SVXActivationContext initWithSource:timestamp:buttonEvent:systemEvent:clientInfo:requestInfo:userInfo:](v15, "initWithSource:timestamp:buttonEvent:systemEvent:clientInfo:requestInfo:userInfo:", 4, v11, 0, 0, v16, 0, 0);

    objc_initWeak(&location, self);
    v18 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[SVXSession _handleStartListenAfterSpeaking:record:taskTracker:]";
      v29 = 2112;
      v30 = v17;
      _os_log_impl(&dword_214934000, v18, OS_LOG_TYPE_INFO, "%s listensAfterSpeaking: Scheduled activation context %@ in request barrier.", buf, 0x16u);
    }
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __65__SVXSession__handleStartListenAfterSpeaking_record_taskTracker___block_invoke;
    v20[3] = &unk_24D24E3D0;
    v19 = v17;
    v21 = v19;
    objc_copyWeak(&v25, &location);
    v22 = v9;
    v23 = v12;
    v24 = v10;
    -[SVXSession _addRequestBarrier:](self, "_addRequestBarrier:", v20);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
}

- (void)_presentError:(id)a3 taskTracker:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  SVXDeviceProblemsState *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  unint64_t v28;
  id v29;
  const __CFString *v30;
  BOOL v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  __int16 v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  SVXSession *v44;
  id v45;
  void (**v46)(_QWORD);
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v48 = "-[SVXSession _presentError:taskTracker:completion:]";
    v49 = 2112;
    v50 = v8;
    _os_log_impl(&dword_214934000, v11, OS_LOG_TYPE_INFO, "%s error = %@", buf, 0x16u);
  }
  objc_msgSend(v8, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "code");
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("SiriVOXErrorDomain")) && v13 == 1)
  {
    objc_msgSend(v8, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BDD1398]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BE09488];
    v19 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BE09488]);

    if (v19)
    {
      v20 = v16;

      v13 = objc_msgSend(v15, "code");
      v12 = v20;
    }
    else
    {
      v13 = 1;
    }

  }
  else
  {
    v18 = *MEMORY[0x24BE09488];
  }
  v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v12, "isEqualToString:", v18))
  {
    switch(v13)
    {
      case 1:
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SIRI_VOX_TIMEOUT_ERROR_%u"), arc4random_uniform(4u));
        objc_msgSend(v21, "addObject:", v23);

        objc_msgSend(v22, "addObject:", CFSTR("client#errorTimeout"));
        v24 = self->_deviceProblemsState;
        if ((-[SVXDeviceProblemsState problems](v24, "problems") & 0x8030) != 0
          || (v25 = -[SVXDeviceProblemsState problems](v24, "problems"), (v25 & 0xE0040) != 0))
        {

LABEL_15:
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SIRI_VOX_DEVICE_PROBLEM_NETWORK_%u"), arc4random_uniform(3u));
          v27 = CFSTR("client#errorNetworkProblems");
          goto LABEL_30;
        }
        v39 = v25;

        if ((v39 & 0x4000) != 0)
          goto LABEL_15;
        break;
      case 2:
        goto LABEL_27;
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 11:
      case 12:
      case 13:
        goto LABEL_26;
      case 4:
      case 9:
      case 14:
        goto LABEL_18;
      case 6:
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SIRI_VOX_GENERIC_ERROR_%u"), arc4random_uniform(4u));
        objc_msgSend(v21, "addObject:", v32);

        objc_msgSend(v22, "addObject:", CFSTR("client#errorGeneric"));
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SIRI_VOX_DEVICE_PROBLEM_FIXING_%u"), arc4random_uniform(4u));
        v27 = CFSTR("client#errorTryAgain");
        goto LABEL_30;
      default:
        if (v13 == 22)
          goto LABEL_27;
        if (v13 == 52)
          goto LABEL_18;
LABEL_26:
        if ((unint64_t)(v13 - 200) >= 0x64)
          break;
LABEL_27:
        if (objc_msgSend(v21, "count"))
        {
          v31 = 1;
          goto LABEL_42;
        }
        v38 = *MEMORY[0x24BE08FB0];
        v31 = 1;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v48 = "-[SVXSession _presentError:taskTracker:completion:]";
          v49 = 2112;
          v50 = v8;
          _os_log_impl(&dword_214934000, v38, OS_LOG_TYPE_INFO, "%s The error %@ is not presented because it is suppressed.", buf, 0x16u);
        }
        goto LABEL_48;
    }
  }
  else if (objc_msgSend(v12, "isEqualToString:", CFSTR("SiriVOXErrorDomain")) && v13 == 2)
  {
LABEL_18:
    v28 = -[SVXDeviceProblemsState problems](self->_deviceProblemsState, "problems") & 0x8030;
    v29 = objc_alloc(MEMORY[0x24BDD17C8]);
    if (v28)
    {
      if (AFSupportsWAPI())
        v30 = CFSTR("WLAN");
      else
        v30 = CFSTR("WIFI");
      v26 = (void *)objc_msgSend(v29, "initWithFormat:", CFSTR("SIRI_VOX_%@_ERROR_%u"), v30, arc4random_uniform(2u));
      v27 = CFSTR("client#errorWiFi");
    }
    else
    {
      v26 = (void *)objc_msgSend(v29, "initWithFormat:", CFSTR("SIRI_VOX_NETWORK_ERROR_%u"), arc4random_uniform(1u));
      v27 = CFSTR("client#errorNetwork");
    }
LABEL_30:
    objc_msgSend(v21, "addObject:", v26);

    objc_msgSend(v22, "addObject:", v27);
  }
  if ((-[SVXDeviceProblemsState problems](self->_deviceProblemsState, "problems") & 0x80) != 0)
  {
    objc_msgSend(v21, "removeAllObjects");
    objc_msgSend(v22, "removeAllObjects");
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SIRI_VOX_DEVICE_PROBLEM_HARDWARE%@_%u"), &stru_24D24F378, arc4random_uniform(2u));
    v34 = CFSTR("client#errorHardwareProblems");
  }
  else if ((-[SVXDeviceProblemsState problems](self->_deviceProblemsState, "problems") & 0x200) != 0)
  {
    objc_msgSend(v21, "removeAllObjects");
    objc_msgSend(v22, "removeAllObjects");
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SIRI_VOX_DEVICE_PROBLEM_THERMAL%@_%u"), &stru_24D24F378, arc4random_uniform(3u));
    v34 = CFSTR("client#errorThermalProblems");
  }
  else
  {
    if (-[SVXDeviceProblemsState isFixingProblems](self->_deviceProblemsState, "isFixingProblems"))
    {
      objc_msgSend(v21, "removeAllObjects");
      objc_msgSend(v22, "removeAllObjects");
    }
    else if (objc_msgSend(v21, "count"))
    {
      goto LABEL_40;
    }
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SIRI_VOX_GENERIC_ERROR_%u"), arc4random_uniform(4u));
    objc_msgSend(v21, "addObject:", v35);

    objc_msgSend(v22, "addObject:", CFSTR("client#errorGeneric"));
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SIRI_VOX_DEVICE_PROBLEM_FIXING_%u"), arc4random_uniform(4u));
    v34 = CFSTR("client#errorTryAgain");
  }
  objc_msgSend(v21, "addObject:", v33);

  objc_msgSend(v22, "addObject:", v34);
LABEL_40:
  if (objc_msgSend(v21, "count"))
  {
    v31 = 0;
LABEL_42:
    v36 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[SVXSession _presentError:taskTracker:completion:]";
      _os_log_impl(&dword_214934000, v36, OS_LOG_TYPE_INFO, "%s Begin waiting for Myriad decision...", buf, 0xCu);
    }
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __51__SVXSession__presentError_taskTracker_completion___block_invoke;
    v40[3] = &unk_24D24E448;
    v41 = v8;
    v42 = v21;
    v43 = v22;
    v44 = self;
    v45 = v9;
    v46 = v10;
    -[SVXSession _waitForMyriadDecisionUsingHandler:](self, "_waitForMyriadDecisionUsingHandler:", v40);

  }
  else
  {
    v37 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[SVXSession _presentError:taskTracker:completion:]";
      v49 = 2112;
      v50 = v8;
      _os_log_error_impl(&dword_214934000, v37, OS_LOG_TYPE_ERROR, "%s The error %@ is not presented. Please take a sysdiagnose and file a radar.", buf, 0x16u);
    }
    v31 = 0;
LABEL_48:
    if (v10)
      v10[2](v10);
  }
  self->_isMostRecentRequestSuppressedError = v31;

}

- (void)_handleCommand:(id)a3 taskTracker:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_log_t *v11;
  NSObject *v12;
  NSObject *v13;
  SVXServiceCommandHandler *serviceCommandHandler;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (os_log_t *)MEMORY[0x24BE08FB0];
  v12 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "-[SVXSession _handleCommand:taskTracker:completion:]";
    v26 = 2112;
    v27 = v8;
    v28 = 2112;
    v29 = v9;
    _os_log_impl(&dword_214934000, v12, OS_LOG_TYPE_INFO, "%s command = %@, taskTracker = %@", buf, 0x20u);
  }
  if (!self->_currentRequestWillPresentUUFR
    && self->_currentRequestUUID
    && -[SVXServiceCommandHandler isCommandUUFR:](self->_serviceCommandHandler, "isCommandUUFR:", v8))
  {
    self->_currentRequestWillPresentUUFR = 1;
    v18 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[SVXSession _handleCommand:taskTracker:completion:]";
      _os_log_impl(&dword_214934000, v18, OS_LOG_TYPE_INFO, "%s UUFR PRESENT", buf, 0xCu);
    }
    -[SVXSession _connection:](self, "_connection:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "willPresentUsefulUserResultWithType:forCommand:", 1, v8);

  }
  v13 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "-[SVXSession _handleCommand:taskTracker:completion:]";
    v26 = 2112;
    v27 = v8;
    v28 = 2112;
    v29 = v9;
    _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s Begin handle command %@ with task tracker %@.", buf, 0x20u);
  }
  serviceCommandHandler = self->_serviceCommandHandler;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __52__SVXSession__handleCommand_taskTracker_completion___block_invoke;
  v20[3] = &unk_24D24E470;
  v20[4] = self;
  v21 = v8;
  v22 = v9;
  v23 = v10;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  -[SVXServiceCommandHandler handleCommand:taskTracker:completion:](serviceCommandHandler, "handleCommand:taskTracker:completion:", v17, v16, v20);

}

- (id)_stateFeedbackManager
{
  SRUIFStateFeedbackManager *stateFeedbackManager;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  SRUIFStateFeedbackManager *v8;
  SRUIFStateFeedbackManager *v9;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!self->_isStateFeedbackEnabled)
    return 0;
  stateFeedbackManager = self->_stateFeedbackManager;
  if (!stateFeedbackManager)
  {
    v4 = objc_alloc(MEMORY[0x24BEA8670]);
    -[SVXSession _connection:](self, "_connection:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithConnection:withPlaybackOptions:", v5, 0);

    v7 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v11 = 136315394;
      v12 = "-[SVXSession _stateFeedbackManager]";
      v13 = 2048;
      v14 = 0;
      _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s #svxstatefeedback create statefeedback manager with Option:%lu", (uint8_t *)&v11, 0x16u);
    }
    v8 = (SRUIFStateFeedbackManager *)objc_msgSend(objc_alloc(MEMORY[0x24BEA8678]), "initWithStateFeedbackProvider:delegate:", v6, self);
    v9 = self->_stateFeedbackManager;
    self->_stateFeedbackManager = v8;

    stateFeedbackManager = self->_stateFeedbackManager;
  }
  return stateFeedbackManager;
}

- (id)_connection:(BOOL)a3
{
  _BOOL4 v3;
  os_log_t *v5;
  NSObject *v6;
  AFConnection *connection;
  BOOL v8;
  SVXAFConnectionFactory *connectionFactory;
  void *v10;
  AFConnection *v11;
  AFConnection *v12;
  AFConnection *v13;
  void *v14;
  NSObject *v15;
  AFConnection *v16;
  int v18;
  const char *v19;
  __int16 v20;
  AFConnection *v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v18 = 136315394;
    v19 = "-[SVXSession _connection:]";
    v20 = 1024;
    LODWORD(v21) = v3;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s createIfAbsent = %d", (uint8_t *)&v18, 0x12u);
  }
  connection = self->_connection;
  if (connection)
    v8 = 1;
  else
    v8 = !v3;
  if (!v8)
  {
    connectionFactory = self->_connectionFactory;
    -[SVXPerforming queue](self->_performer, "queue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SVXAFConnectionFactory createWithDispatchQueue:instanceContext:](connectionFactory, "createWithDispatchQueue:instanceContext:", v10, self->_instanceContext);
    v11 = (AFConnection *)objc_claimAutoreleasedReturnValue();
    v12 = self->_connection;
    self->_connection = v11;

    -[AFConnection setDelegate:](self->_connection, "setDelegate:", self);
    -[AFConnection setSpeechDelegate:](self->_connection, "setSpeechDelegate:", self);
    v13 = self->_connection;
    -[SVXSession _createClientConfiguration:storeDemo:preferences:](self, "_createClientConfiguration:storeDemo:preferences:", self->_deviceSetupContext, 0, self->_preferences);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AFConnection setConfiguration:](v13, "setConfiguration:", v14);

    -[SVXSession _handleDidChangeAudioSessionID:](self, "_handleDidChangeAudioSessionID:", -[AFConnection audioSessionID](self->_connection, "audioSessionID"));
    -[SVXSession _handleShouldSpeak:](self, "_handleShouldSpeak:", -[AFConnection shouldSpeak](self->_connection, "shouldSpeak"));
    v15 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      v16 = self->_connection;
      v18 = 136315394;
      v19 = "-[SVXSession _connection:]";
      v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_214934000, v15, OS_LOG_TYPE_INFO, "%s Set up %@", (uint8_t *)&v18, 0x16u);
    }
    -[AFConnection willPresentUI](self->_connection, "willPresentUI");
    connection = self->_connection;
  }
  return connection;
}

- (void)_invalidateConnection
{
  NSObject **v3;
  NSObject *v4;
  AFConnection *connection;
  NSObject *v6;
  AFConnection *v7;
  int v8;
  const char *v9;
  __int16 v10;
  AFConnection *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (NSObject **)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[SVXSession _invalidateConnection]";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  connection = self->_connection;
  if (connection)
  {
    v6 = *v3;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = 136315394;
      v9 = "-[SVXSession _invalidateConnection]";
      v10 = 2112;
      v11 = connection;
      _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s Tear down %@", (uint8_t *)&v8, 0x16u);
      connection = self->_connection;
    }
    -[AFConnection didDismissUI](connection, "didDismissUI");
    -[AFConnection cancelRequest](self->_connection, "cancelRequest");
    -[AFConnection endSession](self->_connection, "endSession");
    -[AFConnection invalidate](self->_connection, "invalidate");
    -[AFConnection setSpeechDelegate:](self->_connection, "setSpeechDelegate:", 0);
    -[AFConnection setDelegate:](self->_connection, "setDelegate:", 0);
    v7 = self->_connection;
    self->_connection = 0;

  }
}

- (void)_startSessionIdleTimerWithTimeInterval:(double)a3
{
  SVXSessionIdleAssertion *v5;
  SVXPerforming *performer;
  SVXSessionIdleAssertion *v7;
  NSObject *v8;
  _QWORD v9[4];
  SVXSessionIdleAssertion *v10;
  id v11[2];
  id location;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  double v16;
  __int16 v17;
  SVXSessionIdleAssertion *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = -[SVXSessionIdleAssertion initWithTimestamp:session:]([SVXSessionIdleAssertion alloc], "initWithTimestamp:session:", mach_absolute_time(), self);
  -[NSMutableSet addObject:](self->_sessionIdleAssertions, "addObject:", v5);
  objc_initWeak(&location, self);
  performer = self->_performer;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__SVXSession__startSessionIdleTimerWithTimeInterval___block_invoke;
  v9[3] = &unk_24D24E498;
  objc_copyWeak(v11, &location);
  v7 = v5;
  v10 = v7;
  v11[1] = *(id *)&a3;
  -[SVXPerforming performBlock:afterDelay:](performer, "performBlock:afterDelay:", v9, a3);
  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[SVXSession _startSessionIdleTimerWithTimeInterval:]";
    v15 = 2048;
    v16 = a3;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s Started session idle timer for %f seconds (assertion = %@).", buf, 0x20u);
  }

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);

}

- (void)_stopSessionIdleTimer
{
  NSObject *v3;
  NSMutableSet *sessionIdleAssertions;
  int v5;
  const char *v6;
  __int16 v7;
  NSMutableSet *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableSet count](self->_sessionIdleAssertions, "count"))
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      sessionIdleAssertions = self->_sessionIdleAssertions;
      v5 = 136315394;
      v6 = "-[SVXSession _stopSessionIdleTimer]";
      v7 = 2112;
      v8 = sessionIdleAssertions;
      _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s Stopped all session idle timers (assertions = %@).", (uint8_t *)&v5, 0x16u);
    }
    -[NSMutableSet removeAllObjects](self->_sessionIdleAssertions, "removeAllObjects");
  }
}

- (void)_handleSessionIdleTimerFireEventWithAssertion:(id)a3 timerInterval:(double)a4
{
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  double v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315650;
    v9 = "-[SVXSession _handleSessionIdleTimerFireEventWithAssertion:timerInterval:]";
    v10 = 2048;
    v11 = a4;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s Handle session idle timer(time interval = %lf) fire event (assertion = %@).", (uint8_t *)&v8, 0x20u);
  }
  -[SVXSession _sessionIdleFiredWithAssertion:](self, "_sessionIdleFiredWithAssertion:", v6);

}

- (void)_sessionIdleFiredWithAssertion:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSMutableSet *sessionIdleAssertions;
  _QWORD v9[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  NSMutableSet *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_sessionIdleAssertions, "containsObject:", v4))
  {
    -[NSMutableSet removeObject:](self->_sessionIdleAssertions, "removeObject:", v4);
    v5 = -[NSMutableSet count](self->_sessionIdleAssertions, "count");
    v6 = *MEMORY[0x24BE08FB0];
    v7 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v7)
      {
        sessionIdleAssertions = self->_sessionIdleAssertions;
        *(_DWORD *)buf = 136315650;
        v11 = "-[SVXSession _sessionIdleFiredWithAssertion:]";
        v12 = 2112;
        v13 = v4;
        v14 = 2112;
        v15 = sessionIdleAssertions;
        _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s Fired session idle timer (assertion = %@), but there are still other active timers (assertions = %@).", buf, 0x20u);
      }
    }
    else
    {
      if (v7)
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[SVXSession _sessionIdleFiredWithAssertion:]";
        v12 = 2112;
        v13 = v4;
        _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s Fired last session idle timer (assertion = %@).", buf, 0x16u);
      }
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __45__SVXSession__sessionIdleFiredWithAssertion___block_invoke;
      v9[3] = &unk_24D24EAA8;
      v9[4] = self;
      -[SVXSession _checkIsActiveWithCompletion:](self, "_checkIsActiveWithCompletion:", v9);
    }
  }

}

- (BOOL)_isTapToRadarEnabled
{
  return _os_feature_enabled_impl() && AFIsInternalInstall() && (AFIsHorseman() & 1) != 0;
}

- (id)_tapToRadarManager
{
  return +[SVXTapToRadarManager sharedInstance](SVXTapToRadarManager, "sharedInstance");
}

- (void)_promptRadarWithReason:(id)a3 requestID:(id)a4 displayReason:(id)a5 issueTitleName:(id)a6 issueDescName:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
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
  id v27;

  v27 = a3;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_opt_new();
  -[SVXSession _tapToRadarManager](self, "_tapToRadarManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "getWebSearchIssueDialogIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v18, "containsObject:", v27);

  if ((_DWORD)self)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v17, "getRecognitionText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lowercaseString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@_%@"), v27, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setError:", v22);

  }
  else
  {
    objc_msgSend(v16, "setError:", v27);
  }
  objc_msgSend(v16, "setRequestID:", v15);
  objc_msgSend(v16, "setComponentName:", CFSTR("Siri UI"));
  objc_msgSend(v16, "setComponentVersion:", CFSTR("HomePod"));
  objc_msgSend(v16, "setComponentID:", &unk_24D26F508);
  objc_msgSend(v16, "setDisplayReason:", v14);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[AutoTTR] %@ issue %@ detected"), v13, v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setTitle:", v23);
  v24 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v17, "getRecognitionText");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("- Problem Description: %@ issue detected on HomePod. \n\n- Error: %@ \n\n- Request ID: %@\n\n- Recognized User Utterance: %@\n\n"), v12, v27, v15, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setRadarDescription:", v26);
  objc_msgSend(v17, "createProblem:extraContent:completionHandler:", v16, 0, &__block_literal_global_236);
  objc_msgSend(v17, "setRecognitionText:", &stru_24D24F378);

}

- (void)duckTTSToVolume:(float)a3 rampTime:(double)a4 completion:(id)a5
{
  id v8;
  SVXPerforming *performer;
  id v10;
  _QWORD v11[5];
  id v12;
  double v13;
  float v14;

  v8 = a5;
  performer = self->_performer;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__SVXSession_duckTTSToVolume_rampTime_completion___block_invoke;
  v11[3] = &unk_24D24E500;
  v14 = a3;
  v13 = a4;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  -[SVXPerforming performBlock:](performer, "performBlock:", v11);

}

- (id)_createClientConfiguration:(id)a3 storeDemo:(id)a4 preferences:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  SVXSession *v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x24BE09128];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __63__SVXSession__createClientConfiguration_storeDemo_preferences___block_invoke;
  v17[3] = &unk_24D24E528;
  v18 = v8;
  v19 = v9;
  v20 = self;
  v21 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  v15 = (void *)objc_msgSend(v11, "newWithBuilder:", v17);

  return v15;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_connectionFactory, 0);
  objc_storeStrong((id *)&self->_alarmAndTimerUtils, 0);
  objc_storeStrong((id *)&self->_soundUtils, 0);
  objc_storeStrong((id *)&self->_speechSynthesisUtils, 0);
  objc_storeStrong((id *)&self->_aceViewSpeakableTextExtractor, 0);
  objc_storeStrong((id *)&self->_tapToRadarManager, 0);
  objc_storeStrong((id *)&self->_stateFeedbackManager, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_modesConfiguration, 0);
  objc_storeStrong((id *)&self->_audioDuckingCoordinationAssertion, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_playbackRequestInfo, 0);
  objc_storeStrong((id *)&self->_pendingMyriadDecisionHandlers, 0);
  objc_storeStrong(&self->_myriadToken, 0);
  objc_storeStrong((id *)&self->_currentAccessoryInfo, 0);
  objc_storeStrong((id *)&self->_localDeviceContext, 0);
  objc_storeStrong((id *)&self->_deviceSetupContext, 0);
  objc_storeStrong((id *)&self->_deviceProblemsState, 0);
  objc_storeStrong((id *)&self->_setApplicationContext, 0);
  objc_storeStrong((id *)&self->_pendingRequestBarriers, 0);
  objc_storeStrong((id *)&self->_svxActivationInstrumentation, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_powerLevelManager, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_serviceCommandHandler, 0);
  objc_storeStrong((id *)&self->_performer, 0);
  objc_storeStrong((id *)&self->_audioSessionAssertions, 0);
  objc_storeStrong((id *)&self->_outputAudioPowerWrapper, 0);
  objc_storeStrong((id *)&self->_inputAudioPowerWrapper, 0);
  objc_storeStrong((id *)&self->_sessionIdleAssertions, 0);
  objc_storeStrong((id *)&self->_taskTrackingCenter, 0);
  objc_storeStrong((id *)&self->_currentRequestInstrumentationContext, 0);
  objc_storeStrong((id *)&self->_previousRequestInstrumentationContext, 0);
  objc_storeStrong((id *)&self->_currentSpeechRequestPendingBlocks, 0);
  objc_storeStrong(&self->_currentSpeechRequestDidStartBlock, 0);
  objc_storeStrong((id *)&self->_currentSpeechRequestOptions, 0);
  objc_storeStrong((id *)&self->_currentRequestUUID, 0);
  objc_storeStrong((id *)&self->_currentDeactivationContext, 0);
  objc_storeStrong((id *)&self->_currentActivationContext, 0);
  objc_storeStrong(&self->_postResignActiveBlock, 0);
  objc_storeStrong((id *)&self->_activityUUID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __63__SVXSession__createClientConfiguration_storeDemo_preferences___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "beginDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDeviceSetupFlowBeginDate:", v4);

    objc_msgSend(*(id *)(a1 + 32), "endDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDeviceSetupFlowEndDate:", v5);

  }
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    objc_msgSend(v6, "outputVolume");
    objc_msgSend(v9, "setOutputVolume:");
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 416), "createAudioPlaybackRequestFromID:preferences:", 3, *(_QWORD *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTapToSiriAudioPlaybackRequest:", v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 416), "createAudioPlaybackRequestFromID:preferences:", 1, *(_QWORD *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTwoShotAudioPlaybackRequest:", v8);

}

uint64_t __50__SVXSession_duckTTSToVolume_rampTime_completion___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 56);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "duckTTSVolumeTo:rampTime:completion:", *(_QWORD *)(a1 + 40), a2, *(double *)(a1 + 48));
}

void __90__SVXSession__promptRadarWithReason_requestID_displayReason_issueTitleName_issueDescName___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = CFSTR("failed");
    if (a2)
      v4 = CFSTR("success");
    v5 = 136315394;
    v6 = "-[SVXSession _promptRadarWithReason:requestID:displayReason:issueTitleName:issueDescName:]_block_invoke";
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s Prompt radar %@", (uint8_t *)&v5, 0x16u);
  }
}

void __45__SVXSession__sessionIdleFiredWithAssertion___block_invoke(uint64_t a1, int a2)
{
  NSObject **v3;
  NSObject *v4;
  unint64_t v5;
  NSObject *v6;
  __CFString *v7;
  _QWORD *v8;
  NSObject **v9;
  __CFString *v10;
  const char *v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  __CFString *v16;
  __CFString *v17;
  int v18;
  const char *v19;
  __int16 v20;
  __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = (NSObject **)MEMORY[0x24BE08FB0];
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v18 = 136315138;
      v19 = "-[SVXSession _sessionIdleFiredWithAssertion:]_block_invoke";
      _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s Ignored because session is active.", (uint8_t *)&v18, 0xCu);
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v6 = v4;
      if (v5 > 4)
        v7 = CFSTR("(unknown)");
      else
        v7 = off_24D24E7A8[v5];
      v12 = v7;
      v18 = 136315394;
      v19 = "-[SVXSession _sessionIdleFiredWithAssertion:]_block_invoke";
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s _currentState = %@", (uint8_t *)&v18, 0x16u);

      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v13 = *(__CFString **)(*(_QWORD *)(a1 + 32) + 80);
      v18 = 136315394;
      v19 = "-[SVXSession _sessionIdleFiredWithAssertion:]_block_invoke";
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s _currentSpeechRequestOptions = %@", (uint8_t *)&v18, 0x16u);
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      v15 = v4;
      v16 = (__CFString *)MEMORY[0x2199D950C](v14);
      v18 = 136315394;
      v19 = "-[SVXSession _sessionIdleFiredWithAssertion:]_block_invoke";
      v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_214934000, v15, OS_LOG_TYPE_INFO, "%s _currentSpeechRequestContinueBlock = %@", (uint8_t *)&v18, 0x16u);

      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v17 = *(__CFString **)(*(_QWORD *)(a1 + 32) + 96);
      v18 = 136315394;
      v19 = "-[SVXSession _sessionIdleFiredWithAssertion:]_block_invoke";
      v20 = 2112;
      v21 = v17;
      v11 = "%s _currentSpeechRequestPendingBlocks = %@";
      goto LABEL_21;
    }
  }
  else
  {
    v8 = *(_QWORD **)(a1 + 32);
    if (v8[3] == 1)
    {
      objc_msgSend(v8, "_invalidate");
      return;
    }
    v9 = (NSObject **)MEMORY[0x24BE08FB0];
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v18 = 136315138;
      v19 = "-[SVXSession _sessionIdleFiredWithAssertion:]_block_invoke";
      _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s Ignored because session is active.", (uint8_t *)&v18, 0xCu);
      v4 = *v9;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v10 = *(__CFString **)(*(_QWORD *)(a1 + 32) + 24);
      v18 = 136315394;
      v19 = "-[SVXSession _sessionIdleFiredWithAssertion:]_block_invoke";
      v20 = 2048;
      v21 = v10;
      v11 = "%s _activityState = %lu";
LABEL_21:
      _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v18, 0x16u);
    }
  }
}

void __53__SVXSession__startSessionIdleTimerWithTimeInterval___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleSessionIdleTimerFireEventWithAssertion:timerInterval:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));

}

void __52__SVXSession__handleCommand_taskTracker_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__SVXSession__handleCommand_taskTracker_completion___block_invoke_2;
  v7[3] = &unk_24D24F068;
  v8 = v4;
  v9 = *(id *)(a1 + 48);
  v10 = v3;
  v11 = *(id *)(a1 + 56);
  v6 = v3;
  objc_msgSend(v5, "performBlock:", v7);

}

uint64_t __52__SVXSession__handleCommand_taskTracker_completion___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v3 = a1[4];
    v4 = a1[5];
    v5 = a1[6];
    v7 = 136315906;
    v8 = "-[SVXSession _handleCommand:taskTracker:completion:]_block_invoke_2";
    v9 = 2112;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_214934000, v2, OS_LOG_TYPE_INFO, "%s End handle command %@ with task tracker %@ and response %@.", (uint8_t *)&v7, 0x2Au);
  }
  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, a1[6]);
  return result;
}

void __51__SVXSession__presentError_taskTracker_completion___block_invoke(uint64_t a1, int a2)
{
  NSObject **v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  SVXSpeechSynthesisRequest *v15;
  void *v16;
  SVXSpeechSynthesisRequest *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD block[5];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  _QWORD v30[4];
  NSObject *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = (NSObject **)MEMORY[0x24BE08FB0];
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[SVXSession _presentError:taskTracker:completion:]_block_invoke";
    v34 = 1024;
    LODWORD(v35) = a2;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s End waiting for Myriad decision with result %d.", buf, 0x12u);
    v5 = *v4;
  }
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v33 = "-[SVXSession _presentError:taskTracker:completion:]_block_invoke";
      v34 = 2112;
      v35 = v7;
      _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s Begin presenting error %@...", buf, 0x16u);
    }
    v8 = dispatch_group_create();
    v9 = objc_msgSend(*(id *)(a1 + 40), "count");
    v10 = objc_msgSend(*(id *)(a1 + 48), "count");
    if (v9 >= v10)
      v11 = v10;
    else
      v11 = v9;
    v12 = MEMORY[0x24BDAC760];
    if (v11)
    {
      for (i = 0; i != v11; ++i)
      {
        dispatch_group_enter(v8);
        v14 = *(void **)(*(_QWORD *)(a1 + 56) + 192);
        v15 = [SVXSpeechSynthesisRequest alloc];
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", i);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[SVXSpeechSynthesisRequest initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:](v15, "initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:", 1, 1, 0, 0, v16, 0, 0);
        v30[0] = v12;
        v30[1] = 3221225472;
        v30[2] = __51__SVXSession__presentError_taskTracker_completion___block_invoke_215;
        v30[3] = &unk_24D24E3F8;
        v31 = v8;
        v18 = *(void **)(a1 + 64);
        v27[0] = v12;
        v27[1] = 3221225472;
        v27[2] = __51__SVXSession__presentError_taskTracker_completion___block_invoke_2;
        v27[3] = &unk_24D24E420;
        v28 = *(id *)(a1 + 48);
        v29 = i;
        v19 = +[SVXTaskContext newWithBuilder:](SVXTaskContext, "newWithBuilder:", v27);
        objc_msgSend(v18, "beginChildWithContext:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "enqueueRequest:languageCode:voiceName:gender:audioSessionID:preparation:finalization:taskTracker:analyticsContext:", v17, 0, 0, 0, 0, 0, v30, v20, 0);

      }
    }
    dispatch_get_global_queue(21, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __51__SVXSession__presentError_taskTracker_completion___block_invoke_3;
    block[3] = &unk_24D24EED8;
    block[4] = *(_QWORD *)(a1 + 56);
    v25 = *(id *)(a1 + 32);
    v26 = *(id *)(a1 + 72);
    dispatch_group_notify(v8, v21, block);

  }
  else
  {
    if (v6)
    {
      v22 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v33 = "-[SVXSession _presentError:taskTracker:completion:]_block_invoke";
      v34 = 2112;
      v35 = v22;
      _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s The error %@ is not presented because of Myriad decision.", buf, 0x16u);
    }
    v23 = *(_QWORD *)(a1 + 72);
    if (v23)
      (*(void (**)(void))(v23 + 16))();
  }
}

void __51__SVXSession__presentError_taskTracker_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__SVXSession__presentError_taskTracker_completion___block_invoke_4;
  v4[3] = &unk_24D24EF28;
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "performBlock:", v4);

}

void __51__SVXSession__presentError_taskTracker_completion___block_invoke_215(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __51__SVXSession__presentError_taskTracker_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "objectAtIndex:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDialogIdentifier:", v5);

}

uint64_t __51__SVXSession__presentError_taskTracker_completion___block_invoke_4(uint64_t a1)
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
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[SVXSession _presentError:taskTracker:completion:]_block_invoke_4";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_214934000, v2, OS_LOG_TYPE_INFO, "%s End presented error %@.", (uint8_t *)&v5, 0x16u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __65__SVXSession__handleStartListenAfterSpeaking_record_taskTracker___block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *WeakRetained;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v20 = "-[SVXSession _handleStartListenAfterSpeaking:record:taskTracker:]_block_invoke";
      v21 = 2112;
      v22 = v5;
      _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s listensAfterSpeaking: Cancelled request barrier with activation context %@.", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v20 = "-[SVXSession _handleStartListenAfterSpeaking:record:taskTracker:]_block_invoke";
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s listensAfterSpeaking: Executing request barrier with activation context %@.", buf, 0x16u);
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v8 = WeakRetained;
    if (WeakRetained)
    {
      v10 = WeakRetained[35];
      v9 = WeakRetained[36];
      v11 = WeakRetained[37];
      v13 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "listenAfterSpeakingBehavior");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "startAlertSoundID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BE82848]))
          v17 = (void *)objc_msgSend(MEMORY[0x24BE09358], "newWithBuilder:", &__block_literal_global_675);
        else
          v17 = 0;

      }
      else
      {
        v17 = 0;
      }
      v18 = (id)objc_msgSend(v8, "activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:completion:", v13, 0, v9, v10, v11, v12, 1, v17, 0);

    }
  }
}

void __73__SVXSession__handleSpeechSynthesizerDidStartRequest_record_taskTracker___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (v6)
  {
    v8 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(v7 + 176);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __73__SVXSession__handleSpeechSynthesizerDidStartRequest_record_taskTracker___block_invoke_2;
    v10[3] = &unk_24D24F018;
    v10[4] = v7;
    v11 = v8;
    objc_msgSend(v9, "performBlock:", v10);

  }
}

void __73__SVXSession__handleSpeechSynthesizerDidStartRequest_record_taskTracker___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 105) && *(_QWORD *)(v2 + 72) && objc_msgSend(*(id *)(a1 + 40), "isUUFR"))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 105) = 1;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(*(id *)(a1 + 40), "dialogPhase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v5, "setObject:forKey:", v3, CFSTR("dialogPhase"));
  objc_msgSend(*(id *)(a1 + 40), "dialogIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("dialogIdentifier"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "logEventWithType:context:", 1924, v5);

}

void __67__SVXSession__handleSpeechSynthesizerWillStartRequest_taskTracker___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    v9 = *(void **)(v7 + 176);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __67__SVXSession__handleSpeechSynthesizerWillStartRequest_taskTracker___block_invoke_2;
    v12[3] = &unk_24D24E358;
    v12[4] = v7;
    v10 = v8;
    v11 = *(_QWORD *)(a1 + 56);
    v13 = v10;
    v15 = v11;
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v9, "performBlock:", v12);

  }
}

uint64_t __67__SVXSession__handleSpeechSynthesizerWillStartRequest_taskTracker___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 408), "requestHasSpeakableContents:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    if (*(_QWORD *)(a1 + 56) != 11 || (result = objc_msgSend(*(id *)(a1 + 48), "isUUFR"), (_DWORD)result))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "dispatchEvent:", 9);
      return objc_msgSend(*(id *)(a1 + 32), "_setCurrentState:", 4);
    }
  }
  return result;
}

void __52__SVXSession__handleSpeechSynthesizerWillBecomeBusy__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__SVXSession__handleSpeechSynthesizerWillBecomeBusy__block_invoke_2;
  v6[3] = &unk_24D24F0E0;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  v5 = v3;
  v7 = v5;
  objc_msgSend(WeakRetained, "performBlock:", v6);

  objc_destroyWeak(&v8);
}

void __52__SVXSession__handleSpeechSynthesizerWillBecomeBusy__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_setOutputAudioPowerWrapper:", *(_QWORD *)(a1 + 32));

}

void __48__SVXSession__handleReceivedCommand_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = objc_alloc_init(MEMORY[0x24BE811B0]);
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRefId:", v2);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __51__SVXSession__handleSpeechRecognizedPartialResult___block_invoke(uint64_t a1, void *a2)
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
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315394;
    v5 = "-[SVXSession _handleSpeechRecognizedPartialResult:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_debug_impl(&dword_214934000, v3, OS_LOG_TYPE_DEBUG, "%s response = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __76__SVXSession__handleSpeechRecordingPerformTwoShotPromptWithType_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(a2, "error");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v6 = (id)v3;
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 15, CFSTR("Failed to play phatic prompt."), v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, double, double))(v4 + 16))(v4, v5, 0.0, 0.0);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, double, double))(v4 + 16))(v4, 0, 0.0, 0.0);
    }

  }
}

uint64_t __46__SVXSession__requestDidEndWithOptions_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextPendingRequestBarrier");
}

uint64_t __47__SVXSession__requestWillBeginWithTaskTracker___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;
}

void __25__SVXSession__invalidate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "setTimestamp:", mach_absolute_time());
  NSStringFromSelector(*(SEL *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReason:", v4);

}

void __37__SVXSession__resignActiveForReason___block_invoke(uint64_t a1, int a2)
{
  NSObject **v3;
  NSObject *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  void (**v19)(_QWORD);
  uint64_t v20;
  os_log_t *v21;
  NSObject *v22;
  id WeakRetained;
  NSObject *v24;
  double v25;
  uint64_t v26;
  void *v27;
  objc_class *v28;
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  const char *v33;
  unint64_t v34;
  NSObject *v35;
  __CFString *v36;
  double v37;
  uint64_t v38;
  NSObject *v39;
  double v40;
  __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  void *v45;
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  double v50;
  _QWORD v51[5];
  id v52;
  _QWORD v53[5];
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  double v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = (NSObject **)MEMORY[0x24BE08FB0];
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v55 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s Ignored because session is still active.", buf, 0xCu);
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v34 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v35 = v4;
      if (v34 > 4)
        v36 = CFSTR("(unknown)");
      else
        v36 = off_24D24E7A8[v34];
      *(double *)&v41 = COERCE_DOUBLE(v36);
      *(_DWORD *)buf = 136315394;
      v55 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      v56 = 2112;
      v57 = *(double *)&v41;
      _os_log_debug_impl(&dword_214934000, v35, OS_LOG_TYPE_DEBUG, "%s _currentState = %@", buf, 0x16u);

      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v37 = *(double *)(*(_QWORD *)(a1 + 32) + 80);
      *(_DWORD *)buf = 136315394;
      v55 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      v56 = 2112;
      v57 = v37;
      _os_log_debug_impl(&dword_214934000, v4, OS_LOG_TYPE_DEBUG, "%s _currentSpeechRequestOptions = %@", buf, 0x16u);
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v38 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      v39 = v4;
      v40 = COERCE_DOUBLE(MEMORY[0x2199D950C](v38));
      *(_DWORD *)buf = 136315394;
      v55 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      v56 = 2112;
      v57 = v40;
      _os_log_debug_impl(&dword_214934000, v39, OS_LOG_TYPE_DEBUG, "%s _currentSpeechRequestContinueBlock = %@", buf, 0x16u);

      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(double *)(*(_QWORD *)(a1 + 32) + 96);
      *(_DWORD *)buf = 136315394;
      v55 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      v56 = 2112;
      v57 = v5;
      _os_log_debug_impl(&dword_214934000, v4, OS_LOG_TYPE_DEBUG, "%s _currentSpeechRequestPendingBlocks = %@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "dispatchEvent:", 7);
    objc_msgSend(*(id *)(a1 + 32), "_setCurrentState:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "reset");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "audioSessionDeactivationDelay");
    v8 = v7;

    if (v8 > 0.0)
    {
      v9 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v55 = "-[SVXSession _resignActiveForReason:]_block_invoke";
        v56 = 2048;
        v57 = v8;
        _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s audioSessionDeactivationDelay = %f", buf, 0x16u);
      }
    }
    v10 = MEMORY[0x24BDAC760];
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __37__SVXSession__resignActiveForReason___block_invoke_147;
    v53[3] = &unk_24D24EAA8;
    v53[4] = *(_QWORD *)(a1 + 32);
    v11 = (void *)MEMORY[0x2199D950C](v53);
    v51[0] = v10;
    v51[1] = 3221225472;
    v51[2] = __37__SVXSession__resignActiveForReason___block_invoke_148;
    v51[3] = &unk_24D24E278;
    v12 = *(void **)(a1 + 40);
    v51[4] = *(_QWORD *)(a1 + 32);
    v52 = v12;
    v13 = (void *)MEMORY[0x2199D950C](v51);
    v14 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
    v42 = v10;
    v43 = 3221225472;
    v44 = __37__SVXSession__resignActiveForReason___block_invoke_151;
    v45 = &unk_24D24E2C8;
    v50 = v8;
    v15 = v11;
    v16 = *(_QWORD *)(a1 + 32);
    v48 = v15;
    v46 = v16;
    v17 = v14;
    v47 = v17;
    v18 = v13;
    v49 = v18;
    v19 = (void (**)(_QWORD))MEMORY[0x2199D950C](&v42);
    v20 = *(_QWORD *)(a1 + 32);
    switch(*(_QWORD *)(v20 + 24))
    {
      case 0:
        v32 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v55 = "-[SVXSession _resignActiveForReason:]_block_invoke_3";
          v33 = "%s Session unspecified.";
          goto LABEL_28;
        }
        break;
      case 1:
        v32 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v55 = "-[SVXSession _resignActiveForReason:]_block_invoke";
          v33 = "%s Session is already inactive.";
          goto LABEL_28;
        }
        break;
      case 2:
        v32 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v55 = "-[SVXSession _resignActiveForReason:]_block_invoke";
          v33 = "%s Session is already resigning active.";
LABEL_28:
          _os_log_impl(&dword_214934000, v32, OS_LOG_TYPE_INFO, v33, buf, 0xCu);
        }
        break;
      case 3:
      case 4:
        v21 = (os_log_t *)MEMORY[0x24BE08FB0];
        v22 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v55 = "-[SVXSession _resignActiveForReason:]_block_invoke";
          _os_log_impl(&dword_214934000, v22, OS_LOG_TYPE_INFO, "%s Session is ready to resign active.", buf, 0xCu);
          v20 = *(_QWORD *)(a1 + 32);
        }
        *(_QWORD *)(v20 + 24) = 2;
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
        objc_msgSend(WeakRetained, "session:willResignActiveWithOptions:duration:activityUUID:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), 0.0, v42, v43, v44, v45, v46, v47, v48);

        v24 = *v21;
        if (os_log_type_enabled(*v21, OS_LOG_TYPE_INFO))
        {
          v25 = *(double *)(*(_QWORD *)(a1 + 32) + 32);
          *(_DWORD *)buf = 136315394;
          v55 = "-[SVXSession _resignActiveForReason:]_block_invoke";
          v56 = 2112;
          v57 = v25;
          _os_log_impl(&dword_214934000, v24, OS_LOG_TYPE_INFO, "%s SESSION GOING INACTIVE (%@)", buf, 0x16u);
        }
        v26 = *(_QWORD *)(a1 + 32);
        v27 = *(void **)(v26 + 120);
        if (!v27)
          v27 = *(void **)(v26 + 112);
        v28 = (objc_class *)MEMORY[0x24BE95BC8];
        v29 = v27;
        v30 = objc_alloc_init(v28);
        v31 = objc_alloc_init(MEMORY[0x24BE95BD8]);
        objc_msgSend(v31, "setExists:", 1);
        objc_msgSend(v30, "setStartedOrChanged:", v31);
        objc_msgSend(v29, "emitInstrumentation:", v30);

        v19[2](v19);
        break;
      default:
        break;
    }

  }
}

void __37__SVXSession__resignActiveForReason___block_invoke_147(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  NSObject *v24;
  id v25;
  os_log_t *v26;
  NSObject *v27;
  objc_class *v28;
  id v29;
  id v30;
  id v31;
  id WeakRetained;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __CFString *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  const __CFString *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 24);
  if (v5 == 2)
  {
    *(_QWORD *)(v4 + 24) = 1;
    v41 = (__CFString *)*(id *)(*(_QWORD *)(a1 + 32) + 32);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = 0;

    v8 = *(_QWORD **)(a1 + 32);
    v9 = (void *)v8[8];
    if (v9)
    {
      v10 = objc_msgSend(v9, "source");
      v8 = *(_QWORD **)(a1 + 32);
      v11 = v10 - 1;
    }
    else
    {
      v11 = -1;
    }
    v12 = (void *)v8[15];
    if (!v12)
      v12 = (void *)v8[14];
    v13 = v12;
    v14 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 240);
    v15 = v13;
    v16 = objc_alloc_init(MEMORY[0x24BE95C28]);
    objc_msgSend(v16, "setPresentationType:", 6);
    v17 = objc_alloc_init(MEMORY[0x24BE95C20]);
    v18 = v17;
    if (v11 > 4)
      v19 = 4;
    else
      v19 = dword_2149B5D58[v11];
    objc_msgSend(v17, "setDismissalReason:", v19);
    v20 = objc_alloc_init(MEMORY[0x24BE95C30]);
    objc_msgSend(v20, "setPresenting:", v16);
    objc_msgSend(v20, "setPreviousState:", v14);
    objc_msgSend(v20, "setCurrentState:", 4);
    objc_msgSend(v20, "setDismissed:", v18);
    v21 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      if ((v14 - 1) > 4)
        v22 = CFSTR("SIRIUISTATE_UNKNOWN_SIRI_UI_STATE");
      else
        v22 = off_24D24CA90[(v14 - 1)];
      if ((v19 - 1) > 9)
        v23 = CFSTR("DISMISSALREASON_UNKNOWN_DISMISSAL_REASON");
      else
        v23 = off_24D24CAB8[(v19 - 1)];
      *(_DWORD *)buf = 136315650;
      v43 = "SVXInstrumentationEmitDismissalUIStateTransition";
      v44 = 2112;
      v45 = v22;
      v46 = 2112;
      v47 = v23;
      v24 = v21;
      _os_log_impl(&dword_214934000, v24, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Emit state transition (dismissed) event (current: %@, dismissalReason: %@)", buf, 0x20u);

    }
    objc_msgSend(v15, "emitInstrumentation:", v20);
    v25 = objc_alloc_init(MEMORY[0x24BE95C30]);

    objc_msgSend(v25, "setPresenting:", v16);
    objc_msgSend(v25, "setPreviousState:", v14);
    objc_msgSend(v25, "setCurrentState:", 1);
    v26 = (os_log_t *)MEMORY[0x24BE08FB0];
    v27 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "SVXInstrumentationEmitDismissalUIStateTransition";
      _os_log_impl(&dword_214934000, v27, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Emit state transition (idle) event", buf, 0xCu);
    }
    objc_msgSend(v15, "emitInstrumentation:", v25);

    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 240) = 1;
    v28 = (objc_class *)MEMORY[0x24BE95BC8];
    v29 = v15;
    v30 = objc_alloc_init(v28);
    v31 = objc_alloc_init(MEMORY[0x24BE95BD0]);
    objc_msgSend(v31, "setExists:", 1);
    objc_msgSend(v30, "setEnded:", v31);
    objc_msgSend(v29, "emitInstrumentation:", v30);

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
    objc_msgSend(WeakRetained, "session:didResignActiveWithDeactivationContext:activityUUID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

    v33 = *v26;
    if (os_log_type_enabled(*v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      v44 = 2112;
      v45 = v41;
      _os_log_impl(&dword_214934000, v33, OS_LOG_TYPE_INFO, "%s SESSION IS INACTIVE (%@)", buf, 0x16u);
    }

    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 24);
  }
  if (v5 == 1)
  {
    v34 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = 0;

    if (a2)
    {
      v35 = *(_QWORD *)(a1 + 32);
      v36 = *(void **)(v35 + 64);
      *(_QWORD *)(v35 + 64) = 0;

    }
    objc_msgSend(*(id *)(a1 + 32), "_setCurrentState:", 1);
    v37 = *(_QWORD **)(a1 + 32);
    v38 = v37[5];
    if (v38)
    {
      (*(void (**)(_QWORD))(v38 + 16))(v37[5]);
      v39 = *(_QWORD *)(a1 + 32);
      v40 = *(void **)(v39 + 40);
      *(_QWORD *)(v39 + 40) = 0;

      v37 = *(_QWORD **)(a1 + 32);
    }
    if (a2)
      objc_msgSend(v37, "_startSessionIdleTimerWithTimeInterval:", 8.0);
    else
      objc_msgSend(v37, "_stopSessionIdleTimer");
  }
}

void __37__SVXSession__resignActiveForReason___block_invoke_148(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SVXSession _resignActiveForReason:]_block_invoke";
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s Force audio session inactive now...", buf, 0xCu);
  }
  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__SVXSession__resignActiveForReason___block_invoke_149;
  v8[3] = &unk_24D24EF28;
  v8[4] = v6;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "_forceAudioSessionInactiveWithReason:completion:", v5, v8);

}

void __37__SVXSession__resignActiveForReason___block_invoke_151(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (*(double *)(a1 + 64) <= 0.0)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __37__SVXSession__resignActiveForReason___block_invoke_2_154;
    v8[3] = &unk_24D24DE08;
    v7 = *(_QWORD *)(a1 + 56);
    v9 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, _QWORD *))(v7 + 16))(v7, v8);
    v6 = v9;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v2 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 136315394;
      v20 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      v21 = 2048;
      v22 = v3;
      _os_log_impl(&dword_214934000, v2, OS_LOG_TYPE_INFO, "%s Force audio session inactive in %f seconds.", buf, 0x16u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "queue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v12 = __37__SVXSession__resignActiveForReason___block_invoke_152;
    v13 = &unk_24D24E2C8;
    v5 = *(void **)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 32);
    v11 = 3221225472;
    v18 = *(_QWORD *)(a1 + 64);
    v15 = v5;
    v16 = *(id *)(a1 + 56);
    v17 = *(id *)(a1 + 48);
    AFDispatchScheduleWithDelay();

    v6 = v15;
  }

}

void __37__SVXSession__resignActiveForReason___block_invoke_152(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __37__SVXSession__resignActiveForReason___block_invoke_2;
  v3[3] = &unk_24D24E2A0;
  v8 = *(_QWORD *)(a1 + 64);
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "_checkIsActiveWithCompletion:", v3);

}

uint64_t __37__SVXSession__resignActiveForReason___block_invoke_2_154(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __37__SVXSession__resignActiveForReason___block_invoke_2(uint64_t a1, int a2)
{
  NSObject **v3;
  NSObject *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  __CFString *v16;
  uint64_t v17;
  __CFString *v18;
  unint64_t v19;
  NSObject *v20;
  __CFString *v21;
  __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  __CFString *v25;
  __CFString *v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  __CFString *v32;
  __int16 v33;
  __CFString *v34;
  __int16 v35;
  __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = (NSObject **)MEMORY[0x24BE08FB0];
    v4 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v5 = *(__CFString **)(a1 + 64);
      *(_DWORD *)buf = 136315394;
      v30 = "-[SVXSession _resignActiveForReason:]_block_invoke_2";
      v31 = 2048;
      v32 = v5;
      _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s Skipped force audio session inactive after %f seconds delay, because session is active again.", buf, 0x16u);
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v20 = v4;
      if (v19 > 4)
        v21 = CFSTR("(unknown)");
      else
        v21 = off_24D24E7A8[v19];
      v26 = v21;
      *(_DWORD *)buf = 136315394;
      v30 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      v31 = 2112;
      v32 = v26;
      _os_log_debug_impl(&dword_214934000, v20, OS_LOG_TYPE_DEBUG, "%s _currentState = %@", buf, 0x16u);

      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v22 = *(__CFString **)(*(_QWORD *)(a1 + 32) + 80);
      *(_DWORD *)buf = 136315394;
      v30 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      v31 = 2112;
      v32 = v22;
      _os_log_debug_impl(&dword_214934000, v4, OS_LOG_TYPE_DEBUG, "%s _currentSpeechRequestOptions = %@", buf, 0x16u);
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      v24 = v4;
      v25 = (__CFString *)MEMORY[0x2199D950C](v23);
      *(_DWORD *)buf = 136315394;
      v30 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      v31 = 2112;
      v32 = v25;
      _os_log_debug_impl(&dword_214934000, v24, OS_LOG_TYPE_DEBUG, "%s _currentSpeechRequestContinueBlock = %@", buf, 0x16u);

      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(__CFString **)(*(_QWORD *)(a1 + 32) + 96);
      *(_DWORD *)buf = 136315394;
      v30 = "-[SVXSession _resignActiveForReason:]_block_invoke";
      v31 = 2112;
      v32 = v6;
      _os_log_debug_impl(&dword_214934000, v4, OS_LOG_TYPE_DEBUG, "%s _currentSpeechRequestPendingBlocks = %@", buf, 0x16u);
    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v7 + 24);
    if (v8 == 1)
    {
      v9 = *(__CFString **)(a1 + 40);
      v10 = *(__CFString **)(v7 + 64);
      if (v9 == v10)
      {
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __37__SVXSession__resignActiveForReason___block_invoke_153;
        v27[3] = &unk_24D24DE08;
        v17 = *(_QWORD *)(a1 + 48);
        v28 = *(id *)(a1 + 56);
        (*(void (**)(uint64_t, _QWORD *))(v17 + 16))(v17, v27);

      }
      else
      {
        v11 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
        {
          v12 = *(__CFString **)(a1 + 64);
          *(_DWORD *)buf = 136315906;
          v30 = "-[SVXSession _resignActiveForReason:]_block_invoke";
          v31 = 2048;
          v32 = v12;
          v33 = 2112;
          v34 = v9;
          v35 = 2112;
          v36 = v10;
          _os_log_impl(&dword_214934000, v11, OS_LOG_TYPE_INFO, "%s Skipped force audio session inactive after %f seconds delay, because deactivation context changed from %@ to %@ while waiting.", buf, 0x2Au);
        }
      }
    }
    else
    {
      v13 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
      {
        v14 = *(__CFString **)(a1 + 64);
        v15 = v13;
        if (v8 > 4)
          v16 = CFSTR("(unknown)");
        else
          v16 = off_24D24D0D0[v8];
        v18 = v16;
        *(_DWORD *)buf = 136315650;
        v30 = "-[SVXSession _resignActiveForReason:]_block_invoke";
        v31 = 2048;
        v32 = v14;
        v33 = 2112;
        v34 = v18;
        _os_log_impl(&dword_214934000, v15, OS_LOG_TYPE_INFO, "%s Skipped force audio session inactive after %f seconds delay, because activity state is %@.", buf, 0x20u);

      }
    }
  }
}

uint64_t __37__SVXSession__resignActiveForReason___block_invoke_153(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __37__SVXSession__resignActiveForReason___block_invoke_149(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SVXSession _resignActiveForReason:]_block_invoke";
    _os_log_impl(&dword_214934000, v2, OS_LOG_TYPE_INFO, "%s Done force audio session inactive.", (uint8_t *)&v4, 0xCu);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    (*(void (**)(void))(result + 16))();
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "dispatchEvent:", 7);
  }
  return result;
}

uint64_t __45__SVXSession__performBlockAfterResignActive___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __43__SVXSession__checkIsActiveWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  os_log_t *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id *v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  v7 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v35 = "-[SVXSession _checkIsActiveWithCompletion:]_block_invoke";
      v36 = 2112;
      v37 = v8;
      v38 = 2048;
      v39 = v4;
      _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s %@ is active. (_taskTrackingCenter.contextsOfAllTrackedTasks.count = %tu)", buf, 0x20u);
    }
    if ((AFIsInternalInstall() & 1) != 0
      || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "shouldLogForQA"))
    {
      v24 = a1;
      v9 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[SVXSession _checkIsActiveWithCompletion:]_block_invoke";
        _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s _taskTrackingCenter.contextsOfAllTrackedTasks = (", buf, 0xCu);
      }
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v10 = v3;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v30 != v13)
              objc_enumerationMutation(v10);
            v15 = *v5;
            if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
            {
              v16 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
              *(_DWORD *)buf = 136315394;
              v35 = "-[SVXSession _checkIsActiveWithCompletion:]_block_invoke";
              v36 = 2112;
              v37 = v16;
              _os_log_impl(&dword_214934000, v15, OS_LOG_TYPE_INFO, "%s     %@", buf, 0x16u);
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v12);
      }

      v17 = *v5;
      a1 = v24;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v35 = "-[SVXSession _checkIsActiveWithCompletion:]_block_invoke";
        _os_log_impl(&dword_214934000, v17, OS_LOG_TYPE_INFO, "%s)", buf, 0xCu);
      }
    }
    v18 = *(void **)(a1 + 40);
    v19 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __43__SVXSession__checkIsActiveWithCompletion___block_invoke_143;
    v27[3] = &unk_24D24DE08;
    v20 = &v28;
    v28 = v18;
    v21 = v27;
  }
  else
  {
    if (v7)
    {
      v22 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v35 = "-[SVXSession _checkIsActiveWithCompletion:]_block_invoke_2";
      v36 = 2112;
      v37 = v22;
      _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s %@ is NOT active.", buf, 0x16u);
    }
    v23 = *(void **)(a1 + 40);
    v19 = *(void **)(*(_QWORD *)(a1 + 32) + 176);
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __43__SVXSession__checkIsActiveWithCompletion___block_invoke_145;
    v25[3] = &unk_24D24DE08;
    v20 = &v26;
    v26 = v23;
    v21 = v25;
  }
  objc_msgSend(v19, "performBlock:", v21, v24);

}

uint64_t __43__SVXSession__checkIsActiveWithCompletion___block_invoke_143(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __43__SVXSession__checkIsActiveWithCompletion___block_invoke_145(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __35__SVXSession__currentAccessoryInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[SVXSession _currentAccessoryInfo]_block_invoke";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s currentAccessoryInfo = %@", (uint8_t *)&v8, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 304);
  *(_QWORD *)(v5 + 304) = v3;
  v7 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __59__SVXSession__getAlarmAndTimerFiringContextWithCompletion___block_invoke_139(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setOrderedFiringAlarms:", v3);
  objc_msgSend(v4, "setOrderedFiringTimers:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setHasOtherRunningTimers:", *(unsigned __int8 *)(a1 + 48));

}

uint64_t __59__SVXSession__getAlarmAndTimerFiringContextWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "firedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __59__SVXSession__getAlarmAndTimerFiringContextWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "firedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __62__SVXSession__forceAudioSessionInactiveWithReason_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  mach_absolute_time();
  AFMachAbsoluteTimeGetTimeInterval();
  v3 = v2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    *(_DWORD *)buf = 136315650;
    v11 = "-[SVXSession _forceAudioSessionInactiveWithReason:completion:]_block_invoke";
    v12 = 2112;
    v13 = v5;
    v14 = 2048;
    v15 = v3;
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s END -forceAudioSessionInactive (reason = %@, duration = %f)", buf, 0x20u);
  }
  v6 = (void *)a1[6];
  v7 = *(void **)(a1[5] + 176);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__SVXSession__forceAudioSessionInactiveWithReason_completion___block_invoke_129;
  v8[3] = &unk_24D24DE08;
  v9 = v6;
  objc_msgSend(v7, "performBlock:", v8);

}

void __62__SVXSession__forceAudioSessionInactiveWithReason_completion___block_invoke_130(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "setTimestamp:", mach_absolute_time());
  NSStringFromSelector(*(SEL *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReason:", v4);

}

uint64_t __62__SVXSession__forceAudioSessionInactiveWithReason_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__SVXSession__forceAudioSessionInactiveWithReason_completion___block_invoke_129(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __68__SVXSession__forceAudioSessionActiveWithOptions_reason_completion___block_invoke(_QWORD *a1, unsigned int a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  unsigned int v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  mach_absolute_time();
  AFMachAbsoluteTimeGetTimeInterval();
  v7 = v6;
  v8 = *MEMORY[0x24BE08FB0];
  v9 = *MEMORY[0x24BE08FB0];
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = a1[7];
      v11 = a1[8];
      *(_DWORD *)buf = 136316418;
      v23 = "-[SVXSession _forceAudioSessionActiveWithOptions:reason:completion:]_block_invoke";
      v24 = 2048;
      v25 = v10;
      v26 = 2048;
      v27 = v11;
      v28 = 2048;
      v29 = v7;
      v30 = 2048;
      v31 = a2;
      v32 = 2112;
      v33 = v5;
      _os_log_error_impl(&dword_214934000, v8, OS_LOG_TYPE_ERROR, "%s END -forceAudioSessionActive (options = %lu, reason = %ld, duration = %f, audioSessionID = %lu, error = %@)", buf, 0x3Eu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v12 = a1[7];
    v13 = a1[8];
    *(_DWORD *)buf = 136316162;
    v23 = "-[SVXSession _forceAudioSessionActiveWithOptions:reason:completion:]_block_invoke";
    v24 = 2048;
    v25 = v12;
    v26 = 2048;
    v27 = v13;
    v28 = 2048;
    v29 = v7;
    v30 = 2048;
    v31 = a2;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s END -forceAudioSessionActive (options = %lu, reason = %ld, duration = %f, audioSessionID = %lu)", buf, 0x34u);
  }
  v14 = a1[4];
  v15 = (void *)a1[5];
  v16 = *(void **)(v14 + 176);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __68__SVXSession__forceAudioSessionActiveWithOptions_reason_completion___block_invoke_128;
  v18[3] = &unk_24D24E038;
  v18[4] = v14;
  v21 = a2;
  v19 = v5;
  v20 = v15;
  v17 = v5;
  objc_msgSend(v16, "performBlock:", v18);

}

uint64_t __68__SVXSession__forceAudioSessionActiveWithOptions_reason_completion___block_invoke_128(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t result;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_setAudioSessionID:", *(unsigned int *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 24) == 3)
  {
    *(_QWORD *)(v2 + 24) = 4;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 56);
    v6 = *(_QWORD *)(v4 + 32);
    objc_msgSend(*(id *)(v4 + 120), "turnIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "session:didBecomeActiveWithActivationContext:activityUUID:turnID:", v4, v5, v6, v7);

    v8 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v11 = 136315394;
      v12 = "-[SVXSession _forceAudioSessionActiveWithOptions:reason:completion:]_block_invoke";
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s SESSION IS ACTIVE (%@)", (uint8_t *)&v11, 0x16u);
    }
    SVXInstrumentationEmitViewAppearContextEnd(*(void **)(*(_QWORD *)(a1 + 32) + 120));
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __47__SVXSession__performNextPendingRequestBarrier__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextPendingRequestBarrier");
}

uint64_t __33__SVXSession__addRequestBarrier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performNextPendingRequestBarrier");
}

uint64_t __56__SVXSession__cancelRequestWithOptions_keepTaskTracker___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;
}

uint64_t __58__SVXSession_endWaitingForMyriadDecisionWithToken_result___block_invoke(uint64_t a1)
{
  uint64_t v1;

  if (*(_BYTE *)(a1 + 48))
    v1 = 2;
  else
    v1 = 3;
  return objc_msgSend(*(id *)(a1 + 32), "_endWaitingForMyriadDecisionWithToken:state:", *(_QWORD *)(a1 + 40), v1);
}

uint64_t __43__SVXSession_beginWaitingForMyriadDecision__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginWaitingForMyriadDecisionWithToken:", *(_QWORD *)(a1 + 40));
}

uint64_t __43__SVXSession_beginWaitingForMyriadDecision__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endWaitingForMyriadDecisionWithToken:state:", *(_QWORD *)(a1 + 40), 4);
}

void __76__SVXSession__startActiveAudioSessionRequestForType_taskTracker_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "setTimestamp:", mach_absolute_time());
  NSStringFromSelector(*(SEL *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setReason:", v3);

  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE09360]), "initWithActivationEvent:", 1);
  v6 = MEMORY[0x24BE08BC0];
  objc_msgSend(v4, "setObject:forKey:", v5, *MEMORY[0x24BE08BC0]);

  objc_msgSend(v4, "setObject:forKey:", &unk_24D26F4F0, *(_QWORD *)(v6 + 16));
  if (*(_QWORD *)(a1 + 40) == 1)
    objc_msgSend(v4, "setObject:forKey:", MEMORY[0x24BDBD1C8], *(_QWORD *)(v6 + 32));
  objc_msgSend(v7, "setUserInfo:", v4);

}

void __76__SVXSession__startActiveAudioSessionRequestForType_taskTracker_completion___block_invoke_124(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v6 = *MEMORY[0x24BE08FB0];
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[SVXSession _startActiveAudioSessionRequestForType:taskTracker:completion:]_block_invoke";
      v9 = 2112;
      v10 = v5;
      _os_log_error_impl(&dword_214934000, v6, OS_LOG_TYPE_ERROR, "%s Relinquished audio ducking coordination assertion with error %@.", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[SVXSession _startActiveAudioSessionRequestForType:taskTracker:completion:]_block_invoke";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s Relinquished audio ducking coordination assertion with context %@.", (uint8_t *)&v7, 0x16u);
  }

}

void __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "createAudioPlaybackRequestFromID:preferences:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_2;
  v10[3] = &unk_24D24DF70;
  v11 = v6;
  v7 = *(void **)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 40);
  v15 = v5;
  v14 = *(id *)(a1 + 56);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "performBlock:", v10);

}

void __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  int v21;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "dispatchEvent:", 9);
  objc_msgSend(*(id *)(a1 + 32), "_setCurrentState:", 4);
  v2 = *(_QWORD *)(a1 + 96);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_6;
  v11[3] = &unk_24D24DFE8;
  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(id *)(a1 + 80);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v16 = v4;
  v11[4] = v5;
  v12 = v6;
  v13 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 104);
  v14 = v7;
  v19 = v8;
  v21 = *(_DWORD *)(a1 + 120);
  v9 = *(id *)(a1 + 72);
  v10 = *(_QWORD *)(a1 + 112);
  v17 = v9;
  v20 = v10;
  v18 = *(id *)(a1 + 88);
  v15 = *(id *)(a1 + 64);
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(v3 + 16))(v3, v2, v11);

}

uint64_t __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 24) == 3)
  {
    *(_QWORD *)(v2 + 24) = 4;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 56);
    v6 = *(_QWORD *)(v4 + 32);
    objc_msgSend(*(id *)(v4 + 120), "turnIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "session:didBecomeActiveWithActivationContext:activityUUID:turnID:", v4, v5, v6, v7);

    v8 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v10 = *(_DWORD *)(a1 + 56);
      v12 = 136315650;
      v13 = "-[SVXSession _startSpeechSynthesisRequest:languageCode:voiceName:gender:audioSessionID:introductionSoundID:c"
            "onclusionSoundID:taskTracker:postActivationHandler:completion:]_block_invoke_9";
      v14 = 2112;
      v15 = v9;
      v16 = 1024;
      v17 = v10;
      _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s SESSION IS ACTIVE (%@) (with external audio session %u) ", (uint8_t *)&v12, 0x1Cu);
    }
    SVXInstrumentationEmitViewAppearContextEnd(*(void **)(*(_QWORD *)(a1 + 32) + 120));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_requestDidEndWithOptions:error:", 6, 0);
}

void __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_118(uint64_t a1, int a2, void *a3)
{
  int IsNoRoutesAvailableError;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if (!v8 || (IsNoRoutesAvailableError = SVXAudioSessionIsNoRoutesAvailableError(v8), a2) && IsNoRoutesAvailableError)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_requestDidEndWithOptions:error:", 6, 0);
    v6 = 0;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v6 = v8;
    objc_msgSend(*(id *)(a1 + 32), "_requestDidEndWithOptions:error:", 6, v6);
    v7 = *(_QWORD *)(a1 + 64);
    if (v7)
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
  }

}

void __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 96);
  v7 = *(unsigned int *)(a1 + 112);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_7;
  v10[3] = &unk_24D24DFC0;
  v8 = *(id *)(a1 + 80);
  v9 = *(_QWORD *)(a1 + 104);
  v11 = v8;
  v13 = v9;
  v12 = *(id *)(a1 + 88);
  objc_msgSend(v3, "enqueueRequest:languageCode:voiceName:gender:audioSessionID:preparation:finalization:taskTracker:analyticsContext:", v2, v4, v5, v6, v7, 0, v10, *(_QWORD *)(a1 + 64), 0);

}

void __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void (*v7)(uint64_t, uint64_t, _QWORD *);
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_8;
  v9[3] = &unk_24D24EF28;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  v10 = v3;
  v11 = v6;
  v7 = *(void (**)(uint64_t, uint64_t, _QWORD *))(v4 + 16);
  v8 = v3;
  v7(v4, v5, v9);

}

void __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_8(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

void __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_3;
    v5[3] = &unk_24D24DF48;
    v3 = *(void **)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    v8 = *(id *)(a1 + 64);
    v7 = *(id *)(a1 + 56);
    objc_msgSend(v3, "startAudioPlaybackRequest:options:completion:", v2, 3, v5);

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (v4)
      (*(void (**)(void))(v4 + 16))();
  }
}

void __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_4;
  v3[3] = &unk_24D24EF28;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "performBlock:", v3);

}

uint64_t __171__SVXSession__startSpeechSynthesisRequest_languageCode_voiceName_gender_audioSessionID_introductionSoundID_conclusionSoundID_taskTracker_postActivationHandler_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __64__SVXSession__transitSpeechToAutomaticEndpointingWithTimestamp___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSpeechEndpointerOperationMode:", 3);

}

void __47__SVXSession__transitSpeechToManualEndpointing__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSpeechEndpointerOperationMode:", 1);

}

void __25__SVXSession__stopSpeech__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_stopSpeechWithCurrentSpeechRequestOptions");

}

uint64_t __140__SVXSession__startSpeechRequestWithOptions_clearsContext_deviceSetupContext_deviceProblemsState_localDeviceContext_taskTracker_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __48__SVXSession__deactivateWithContext_completion___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 232));
  objc_msgSend(WeakRetained, "session:didDeactivateWithContext:", a1[4], a1[5]);

  objc_msgSend(*(id *)(a1[4] + 344), "invalidate");
  v3 = a1[4];
  v4 = *(void **)(v3 + 344);
  *(_QWORD *)(v3 + 344) = 0;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v16 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSynt"
          "hesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]_block_invoke";
    v17 = 1024;
    v18 = a2;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s Presenting error %d for task tracker %@", buf, 0x1Cu);
  }
  v6 = *(id **)(a1 + 40);
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_99;
    v11[3] = &unk_24D24F068;
    v11[4] = v6;
    v8 = *(_QWORD *)(a1 + 48);
    v12 = *(id *)(a1 + 56);
    v13 = *(id *)(a1 + 48);
    v14 = *(id *)(a1 + 64);
    objc_msgSend(v6, "_presentError:taskTracker:completion:", v8, v7, v11);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained(v6 + 29);
    objc_msgSend(WeakRetained, "session:didNotActivateWithContext:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

    v10 = *(_QWORD *)(a1 + 64);
    if (v10)
      (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, *(_QWORD *)(a1 + 48));
  }
}

void __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_101(_QWORD *a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 232));
  v4 = WeakRetained;
  v5 = a1[4];
  v6 = a1[5];
  if (v9)
    objc_msgSend(WeakRetained, "session:didNotActivateWithContext:error:", v5, v6);
  else
    objc_msgSend(WeakRetained, "session:didActivateWithContext:", v5, v6);

  v7 = a1[6];
  v8 = v9;
  if (v7)
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
    v8 = v9;
  }

}

void __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_102(_QWORD *a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 232));
  v4 = WeakRetained;
  v5 = a1[4];
  v6 = a1[5];
  if (v9)
    objc_msgSend(WeakRetained, "session:didNotActivateWithContext:error:", v5, v6);
  else
    objc_msgSend(WeakRetained, "session:didActivateWithContext:", v5, v6);

  v7 = a1[6];
  v8 = v9;
  if (v7)
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
    v8 = v9;
  }

}

void __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_105(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[SVXSession _activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSynt"
          "hesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:]_block_invoke";
    v21 = 2112;
    v22 = v3;
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s alarmAndTimerFiringContext = %@", buf, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(v5 + 424), "createSpeechSynthesisRequestWithContext:instanceContext:", v3, *(_QWORD *)(v5 + 208));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(unsigned int *)(a1 + 96);
  v8 = *(_QWORD *)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 80);
  v10 = *(_QWORD *)(a1 + 88);
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_106;
  v17[3] = &unk_24D24DED0;
  v12 = *(_QWORD *)(a1 + 40);
  v17[4] = *(_QWORD *)(a1 + 32);
  v14 = v3;
  v13 = *(_QWORD *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_2_107;
  v15[3] = &unk_24D24DEF8;
  v15[4] = *(_QWORD *)(a1 + 32);
  v16 = *(id *)(a1 + 64);
  objc_msgSend((id)v5, "_startSpeechSynthesisRequest:languageCode:voiceName:gender:audioSessionID:introductionSoundID:conclusionSoundID:taskTracker:postActivationHandler:completion:", v6, v12, 0, v8, v7, v9, v10, v13, v17, v15);

}

void __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_111(_QWORD *a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 232));
  v4 = WeakRetained;
  v5 = a1[4];
  v6 = a1[5];
  if (v9)
    objc_msgSend(WeakRetained, "session:didNotActivateWithContext:error:", v5, v6);
  else
    objc_msgSend(WeakRetained, "session:didActivateWithContext:", v5, v6);

  v7 = a1[6];
  v8 = v9;
  if (v7)
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
    v8 = v9;
  }

}

void __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_2_112(_QWORD *a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 232));
  v4 = WeakRetained;
  v5 = a1[4];
  v6 = a1[5];
  if (v9)
    objc_msgSend(WeakRetained, "session:didNotActivateWithContext:error:", v5, v6);
  else
    objc_msgSend(WeakRetained, "session:didActivateWithContext:", v5, v6);

  v7 = a1[6];
  v8 = v9;
  if (v7)
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
    v8 = v9;
  }

}

void __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_3_113(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
  v4 = WeakRetained;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  if (v7)
    objc_msgSend(WeakRetained, "session:didNotActivateWithContext:error:", v5, v6, v7);
  else
    objc_msgSend(WeakRetained, "session:didActivateWithContext:", v5, v6);

}

void __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_5;
  v7[3] = &unk_24D24EF28;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "_performBlockAfterResignActive:", v7);

}

uint64_t __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_106(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
  v4 = WeakRetained;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  if (v7)
    objc_msgSend(WeakRetained, "session:didNotActivateWithContext:error:", v5, v6, v7);
  else
    objc_msgSend(WeakRetained, "session:didActivateWithContext:", v5, v6);

}

void __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_2_107(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_3;
  v7[3] = &unk_24D24EF28;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "_performBlockAfterResignActive:", v7);

}

uint64_t __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_99(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  id v7;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_2;
  v3[3] = &unk_24D24F068;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v4, "_performBlockAfterResignActive:", v3);

}

uint64_t __194__SVXSession__activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_taskTracker_completion___block_invoke_2(_QWORD *a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 232));
  objc_msgSend(WeakRetained, "session:didNotActivateWithContext:error:", a1[4], a1[5], a1[6]);

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, a1[6]);
  return result;
}

void __46__SVXSession_taskTrackingCenterDidBecomeIdle___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_resignActiveForReason:", v2);

}

uint64_t __47__SVXSession_taskTrackingCenterWillBecomeBusy___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopSessionIdleTimer");
}

uint64_t __64__SVXSession_speechSynthesizerDidFailRequest_taskTracker_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechSynthesizerDidFailRequest:taskTracker:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __63__SVXSession_speechSynthesizerDidInterruptRequest_taskTracker___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechSynthesizerDidInterruptRequest:taskTracker:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __60__SVXSession_speechSynthesizerDidCancelRequest_taskTracker___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechSynthesizerDidCancelRequest:taskTracker:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __81__SVXSession_speechSynthesizerDidFinishRequest_utteranceInfo_record_taskTracker___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechSynthesizerDidFinishRequest:record:taskTracker:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __66__SVXSession_speechSynthesizerDidStartRequest_record_taskTracker___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechSynthesizerDidStartRequest:record:taskTracker:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __60__SVXSession_speechSynthesizerWillStartRequest_taskTracker___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechSynthesizerWillStartRequest:taskTracker:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __44__SVXSession_speechSynthesizerDidBecomeIdle__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechSynthesizerDidBecomeIdle");
}

uint64_t __44__SVXSession_speechSynthesizerDidBecomeBusy__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechSynthesizerWillBecomeBusy");
}

void __54__SVXSession_acquireAudioSessionForReason_completion___block_invoke(id *a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[5];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __54__SVXSession_acquireAudioSessionForReason_completion___block_invoke_2;
  v16[3] = &unk_24D24DE30;
  v16[4] = a1[4];
  v3 = (void *)objc_msgSend(MEMORY[0x24BE092A8], "newWithBuilder:", v16);
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[SVXSession acquireAudioSessionForReason:completion:]_block_invoke";
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s BEGIN -acquireAudioSession (context = %@)", buf, 0x16u);
  }
  v5 = mach_absolute_time();
  objc_msgSend(a1[4], "_connection:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __54__SVXSession_acquireAudioSessionForReason_completion___block_invoke_75;
  v9[3] = &unk_24D24DE80;
  v15 = v5;
  v7 = a1[4];
  v10 = v3;
  v11 = v7;
  v14 = a1[7];
  v12 = a1[5];
  v13 = a1[6];
  v8 = v3;
  objc_msgSend(v6, "acquireAudioSessionWithContext:completion:", v8, v9);

}

void __54__SVXSession_acquireAudioSessionForReason_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "setReason:", 3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "requestInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activationEvent");

  if (v4 == 6)
  {
    objc_msgSend(v6, "setOptions:", 2);
  }
  else if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
  {
    objc_msgSend(v6, "setSpeechRequestOptions:");
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE09360]), "initWithActivationEvent:", 0);
    objc_msgSend(v6, "setSpeechRequestOptions:", v5);

  }
}

void __54__SVXSession_acquireAudioSessionForReason_completion___block_invoke_75(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  mach_absolute_time();
  AFMachAbsoluteTimeGetTimeInterval();
  v8 = v7;
  objc_msgSend(v5, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BE08FB0];
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      v26 = "-[SVXSession acquireAudioSessionForReason:completion:]_block_invoke";
      v27 = 2112;
      v28 = v11;
      v29 = 2048;
      v30 = v8;
      v31 = 2112;
      v32 = v5;
      _os_log_error_impl(&dword_214934000, v10, OS_LOG_TYPE_ERROR, "%s END -acquireAudioSession (context = %@, duration = %f, result = %@)", buf, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315906;
    v26 = "-[SVXSession acquireAudioSessionForReason:completion:]_block_invoke";
    v27 = 2112;
    v28 = v12;
    v29 = 2048;
    v30 = v8;
    v31 = 2112;
    v32 = v5;
    _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s END -acquireAudioSession (context = %@, duration = %f, result = %@)", buf, 0x2Au);
  }
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(void **)(v13 + 176);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __54__SVXSession_acquireAudioSessionForReason_completion___block_invoke_76;
  v18[3] = &unk_24D24DE58;
  v18[4] = v13;
  v19 = v5;
  v23 = *(id *)(a1 + 64);
  v20 = v9;
  v21 = *(id *)(a1 + 48);
  v22 = *(id *)(a1 + 56);
  v24 = v6;
  v15 = v6;
  v16 = v9;
  v17 = v5;
  objc_msgSend(v14, "performBlock:", v18);

}

void __54__SVXSession_acquireAudioSessionForReason_completion___block_invoke_76(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  SVXAudioSessionAssertion *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SVXAudioSessionAssertion *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_setAudioSessionID:", objc_msgSend(*(id *)(a1 + 40), "audioSessionID"));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 24) == 3)
  {
    *(_QWORD *)(v2 + 24) = 4;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 56);
    v6 = *(_QWORD *)(v4 + 32);
    objc_msgSend(*(id *)(v4 + 120), "turnIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "session:didBecomeActiveWithActivationContext:activityUUID:turnID:", v4, v5, v6, v7);

    v8 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      *(_DWORD *)buf = 136315394;
      v19 = "-[SVXSession acquireAudioSessionForReason:completion:]_block_invoke";
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s SESSION IS ACTIVE (%@)", buf, 0x16u);
    }
    SVXInstrumentationEmitViewAppearContextEnd(*(void **)(*(_QWORD *)(a1 + 32) + 120));
  }
  v10 = *(_QWORD *)(a1 + 72);
  if (v10)
  {
    if (*(_QWORD *)(a1 + 48))
    {
      (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);
    }
    else
    {
      v11 = [SVXAudioSessionAssertion alloc];
      v12 = *(_QWORD *)(a1 + 56);
      v13 = objc_msgSend(*(id *)(a1 + 40), "audioSessionID");
      v14 = *(_QWORD *)(a1 + 64);
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __54__SVXSession_acquireAudioSessionForReason_completion___block_invoke_78;
      v16[3] = &unk_24D24DE08;
      v17 = *(id *)(a1 + 80);
      v15 = -[SVXAudioSessionAssertion initWithReason:audioSessionID:taskTracker:relinquishHandler:](v11, "initWithReason:audioSessionID:taskTracker:relinquishHandler:", v12, v13, v14, v16);
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

    }
  }
}

uint64_t __54__SVXSession_acquireAudioSessionForReason_completion___block_invoke_78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__SVXSession_assistantConnection_appLaunchFailedWithBundleIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
  objc_msgSend(WeakRetained, "session:didFailAppLaunchWithBundleIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __75__SVXSession_assistantConnection_willProcessAppLaunchWithBundleIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 232));
  objc_msgSend(WeakRetained, "session:willProcessAppLaunchWithBundleIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __68__SVXSession_assistantConnection_startUIRequestWithInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __68__SVXSession_assistantConnection_startUIRequestWithText_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "dispatchEvent:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "dispatchEvent:", 5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "dispatchEvent:", 6);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __62__SVXSession_assistantConnection_audioSessionDidBecomeActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAudioSessionDidBecomeActive:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __63__SVXSession_assistantConnection_audioSessionWillBecomeActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAudioSessionWillBecomeActive:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __55__SVXSession_assistantConnection_startPlaybackDidFail___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidFailStartPlaybackWithDestination:", *(_QWORD *)(a1 + 40));
}

uint64_t __77__SVXSession_assistantConnection_willProcessStartPlayback_intent_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleWillProcessStartPlaybackWithDestination:intent:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __63__SVXSession_assistantConnection_didHandleQuickStopWithAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidHandleQuickStopWithActions:", *(_QWORD *)(a1 + 40));
}

uint64_t __68__SVXSession_assistantConnection_didStopAudioPlaybackRequest_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidStopAudioPlaybackRequest:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __63__SVXSession_assistantConnection_didStartAudioPlaybackRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidStartAudioPlaybackRequest:", *(_QWORD *)(a1 + 40));
}

uint64_t __64__SVXSession_assistantConnection_willStartAudioPlaybackRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleWillStartAudioPlaybackRequest:", *(_QWORD *)(a1 + 40));
}

uint64_t __79__SVXSession_assistantConnection_setUserActivtiyInfoAndMakeCurrent_webpageURL___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1[4] + 344), "resignCurrent");
  objc_msgSend(*(id *)(a1[4] + 344), "invalidate");
  v2 = objc_alloc(MEMORY[0x24BDD1960]);
  getUAUserActivityTypeSiri();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithActivityType:", v3);
  v5 = a1[4];
  v6 = *(void **)(v5 + 344);
  *(_QWORD *)(v5 + 344) = v4;

  if (a1[5])
    objc_msgSend(*(id *)(a1[4] + 344), "setWebpageURL:");
  if (a1[6])
    objc_msgSend(*(id *)(a1[4] + 344), "setUserInfo:");
  return objc_msgSend(*(id *)(a1[4] + 344), "becomeCurrent");
}

uint64_t __77__SVXSession_assistantConnectionAudioSessionDidEndInterruption_shouldResume___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAudioSessionDidEndInterruption:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __66__SVXSession_assistantConnectionAudioSessionDidBeginInterruption___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAudioSessionDidBeginInterruption");
}

uint64_t __58__SVXSession_assistantConnection_didChangeAudioSessionID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidChangeAudioSessionID:", *(unsigned int *)(a1 + 40));
}

uint64_t __46__SVXSession_assistantConnection_shouldSpeak___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleShouldSpeak:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __70__SVXSession_assistantConnection_requestFailedWithError_requestClass___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRequestFailedWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __61__SVXSession_assistantConnection_receivedCommand_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleReceivedCommand:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __49__SVXSession_assistantConnectionRequestFinished___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRequestFinished");
}

uint64_t __50__SVXSession_assistantConnectionDismissAssistant___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDismissAssistant");
}

uint64_t __50__SVXSession_assistantConnectionRequestWillStart___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRequestWillStart");
}

uint64_t __64__SVXSession_assistantConnection_speechRecognizedPartialResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechRecognizedPartialResult:", *(_QWORD *)(a1 + 40));
}

uint64_t __51__SVXSession_assistantConnection_speechRecognized___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechRecognized:", *(_QWORD *)(a1 + 40));
}

uint64_t __59__SVXSession_assistantConnection_speechRecognitionDidFail___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechRecognitionDidFailWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __57__SVXSession_assistantConnection_speechRecordingDidFail___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechRecordingDidFailWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__SVXSession_assistantConnectionSpeechRecordingDidCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechRecordingDidCancel");
}

uint64_t __55__SVXSession_assistantConnectionSpeechRecordingDidEnd___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechRecordingDidEnd");
}

uint64_t __89__SVXSession_assistantConnection_speechRecordingPerformTwoShotPromptWithType_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechRecordingPerformTwoShotPromptWithType:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __68__SVXSession_assistantConnectionSpeechRecordingDidDetectStartpoint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechRecordingDidDetectStartpoint");
}

uint64_t __72__SVXSession_assistantConnection_speechRecordingDidChangeAVRecordRoute___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechRecordingDidChangeAVRecordRoute:", *(_QWORD *)(a1 + 40));
}

uint64_t __88__SVXSession_assistantConnection_speechRecordingDidBeginOnAVRecordRoute_audioSessionID___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setAudioSessionID:", *(unsigned int *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechRecordingDidBeginOnAVRecordRoute:", *(_QWORD *)(a1 + 40));
}

uint64_t __88__SVXSession_assistantConnection_speechRecordingWillBeginWithInputAudioPowerXPCWrapper___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__SVXSession_assistantConnectionSpeechRecordingWillBegin___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSpeechRecordingWillBeginWithInputAudioPowerXPCWrapper:", 0);
}

uint64_t __124__SVXSession_activateWithSpeechRequestOptions_options_deviceSetupContext_deviceProblemsState_localDeviceContext_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startSpeechRequestWithOptions:clearsContext:deviceSetupContext:deviceProblemsState:localDeviceContext:taskTracker:completion:", *(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 80) & 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 72));
}

void __39__SVXSession_updateLocalDeviceContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 296);
  *(_QWORD *)(v3 + 296) = v2;

}

void __39__SVXSession_updateDeviceSetupContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 288);
  *(_QWORD *)(v3 + 288) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_connection:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createClientConfiguration:storeDemo:preferences:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288), 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setConfiguration:", v5);

  }
}

void __40__SVXSession_updateDeviceProblemsState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 280);
  *(_QWORD *)(v3 + 280) = v2;

}

uint64_t __24__SVXSession_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __40__SVXSession_handleCommand_taskTracker___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCommand:taskTracker:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

uint64_t __32__SVXSession_addRequestBarrier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addRequestBarrier:", *(_QWORD *)(a1 + 40));
}

void __51__SVXSession_stopAudioPlaybackRequest_immediately___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_connection:", 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAudioPlaybackRequest:immediately:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

void __59__SVXSession_startAudioPlaybackRequest_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  int8x16_t v10;
  _QWORD v11[4];
  int8x16_t v12;
  id v13;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 40) + 336);
    if (!v2)
    {
      v3 = objc_opt_new();
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(void **)(v4 + 336);
      *(_QWORD *)(v4 + 336) = v3;

      v2 = *(void **)(*(_QWORD *)(a1 + 40) + 336);
    }
    v6 = (void *)objc_opt_new();
    objc_msgSend(v2, "setObject:forKey:", v6, *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 40), "_connection:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 56);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__SVXSession_startAudioPlaybackRequest_options_completion___block_invoke_2;
  v11[3] = &unk_24D24DF48;
  v10 = *(int8x16_t *)(a1 + 32);
  v9 = (id)v10.i64[0];
  v12 = vextq_s8(v10, v10, 8uLL);
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v7, "startAudioPlaybackRequest:options:completion:", v9, v8, v11);

}

void __59__SVXSession_startAudioPlaybackRequest_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(v4 + 176);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__SVXSession_startAudioPlaybackRequest_options_completion___block_invoke_3;
  v9[3] = &unk_24D24F068;
  v9[4] = v4;
  v10 = v5;
  v7 = *(id *)(a1 + 48);
  v11 = v3;
  v12 = v7;
  v8 = v3;
  objc_msgSend(v6, "performBlock:", v9);

}

void __59__SVXSession_startAudioPlaybackRequest_options_completion___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1[4] + 336), "objectForKey:", a1[5]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 336), "removeObjectForKey:", a1[5]);
  if (!objc_msgSend(*(id *)(a1[4] + 336), "count"))
  {
    v2 = a1[4];
    v3 = *(void **)(v2 + 336);
    *(_QWORD *)(v2 + 336) = 0;

  }
  v4 = a1[7];
  v5 = v6;
  if (v4)
  {
    objc_msgSend(v6, "duration");
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, a1[6]);
    v5 = v6;
  }

}

void __58__SVXSession_getAlarmAndTimerFiringContextWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__SVXSession_getAlarmAndTimerFiringContextWithCompletion___block_invoke_2;
  v4[3] = &unk_24D24DD18;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v2, "_getAlarmAndTimerFiringContextWithCompletion:", v4);

}

void __58__SVXSession_getAlarmAndTimerFiringContextWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_resignActiveForReason:", v3);

}

void __47__SVXSession_getAudioPowerWithType_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = a1[6];
  if (v2 == 1)
  {
    v3 = 144;
  }
  else
  {
    if (v2 != 2)
    {
      v4 = 0;
      goto LABEL_7;
    }
    v3 = 152;
  }
  v4 = *(id *)(a1[4] + v3);
LABEL_7:
  v5 = v4;
  (*(void (**)(void))(a1[5] + 16))();

}

uint64_t __45__SVXSession_getActivityStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __37__SVXSession_getStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

uint64_t __21__SVXSession_dismiss__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss");
}

uint64_t __27__SVXSession_cancelRequest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelRequestWithOptions:keepTaskTracker:", 6, 0);
}

uint64_t __46__SVXSession_transitSpeechToManualEndpointing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transitSpeechToManualEndpointing");
}

uint64_t __63__SVXSession_transitSpeechToAutomaticEndpointingWithTimestamp___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transitSpeechToAutomaticEndpointingWithTimestamp:", *(_QWORD *)(a1 + 40));
}

uint64_t __24__SVXSession_stopSpeech__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopSpeech");
}

uint64_t __31__SVXSession_preheatWithStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_preheatWithStyle:", *(_QWORD *)(a1 + 40));
}

void __47__SVXSession_deactivateWithContext_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v2 = objc_alloc(MEMORY[0x24BE09290]);
  v3 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__SVXSession_deactivateWithContext_completion___block_invoke_2;
  v10[3] = &unk_24D24E950;
  v11 = *(id *)(a1 + 48);
  v4 = (void *)objc_msgSend(v2, "initWithBlock:", v10);
  v6 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __47__SVXSession_deactivateWithContext_completion___block_invoke_3;
  v8[3] = &unk_24D24EFF0;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "_deactivateWithContext:completion:", v5, v8);

}

uint64_t __47__SVXSession_deactivateWithContext_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __47__SVXSession_deactivateWithContext_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithSignal:", 0);
}

void __181__SVXSession_activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v2 = objc_alloc(MEMORY[0x24BE09258]);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __181__SVXSession_activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_completion___block_invoke_2;
  v18[3] = &unk_24D24DCA0;
  v19 = *(id *)(a1 + 96);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SiriVOXErrorDomain"), 5, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithBlock:defaultValue:", v18, v3);

  v5 = *(_QWORD *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 80);
  v10 = *(_QWORD *)(a1 + 104);
  v11 = *(_QWORD *)(a1 + 112);
  v12 = *(_QWORD *)(a1 + 88);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __181__SVXSession_activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_completion___block_invoke_3;
  v16[3] = &unk_24D24DCC8;
  v17 = v4;
  v13 = v4;
  objc_msgSend(v15, "_activateWithContext:options:deviceSetupContext:deviceProblemsState:localDeviceContext:speechSynthesisRecord:speechSynthesisState:speechRecordingAlertPolicy:taskTracker:completion:", v14, v10, v5, v6, v7, v9, v11, v8, v12, v16);

}

uint64_t __181__SVXSession_activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __181__SVXSession_activateWithContext_options_deviceSetupContext_deviceProblemsState_localDeviceContext_speechSynthesisRecord_speechSynthesisState_speechRecordingAlertPolicy_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithValue:", a2);
}

uint64_t __44__SVXSession_prewarmWithContext_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  SVXSpeechSynthesisRequest *v7;
  void *v8;
  int v9;
  uint64_t v10;
  SVXSpeechSynthesisRequest *v11;
  uint64_t result;

  switch(objc_msgSend(*(id *)(a1 + 32), "source"))
  {
    case 1:
    case 2:
    case 4:
    case 8:
    case 9:
      v2 = *(void **)(a1 + 40);
      v3 = 0;
      goto LABEL_3;
    case 5:
      objc_msgSend(*(id *)(a1 + 32), "systemEvent");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "type");
      if (v5 == 2)
      {
        v6 = *(void **)(*(_QWORD *)(a1 + 40) + 192);
        v7 = -[SVXSpeechSynthesisRequest initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:]([SVXSpeechSynthesisRequest alloc], "initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:", 3, 1, 0, 0, CFSTR("SIRI_VOX_SYSTEM_FACTORY_RESET_CONFIRMATION"), 0, 0);
      }
      else
      {
        if (v5 != 1)
          goto LABEL_15;
        v6 = *(void **)(*(_QWORD *)(a1 + 40) + 192);
        v7 = -[SVXSpeechSynthesisRequest initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:]([SVXSpeechSynthesisRequest alloc], "initWithPriority:options:speakableText:speakableContext:localizationKey:presynthesizedAudio:streamID:", 3, 1, 0, 0, CFSTR("SIRI_VOX_SYSTEM_DEVICE_SETUP_COMPLETION"), 0, 0);
      }
      v11 = v7;
      objc_msgSend(v6, "synthesizeRequest:audioChunkHandler:taskTracker:analyticsContext:completion:", v7, 0, 0, 0, 0);

LABEL_15:
LABEL_16:
      result = *(_QWORD *)(a1 + 48);
      if (result)
        return (*(uint64_t (**)(void))(result + 16))();
      return result;
    case 6:
      v2 = *(void **)(a1 + 40);
      v3 = 2;
LABEL_3:
      objc_msgSend(v2, "_preheatWithStyle:", v3);
      goto LABEL_16;
    case 7:
      objc_msgSend(*(id *)(a1 + 32), "requestInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isSpeechRequest"))
      {
        objc_msgSend(v4, "speechRequestOptions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isVoiceTrigger");

        if (v9)
          v10 = 2;
        else
          v10 = 0;
        objc_msgSend(*(id *)(a1 + 40), "_preheatWithStyle:", v10);
      }
      goto LABEL_15;
    default:
      goto LABEL_16;
  }
}

@end
