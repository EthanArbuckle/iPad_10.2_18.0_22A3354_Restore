@implementation SASRequestOptions

- (SASRequestOptions)initWithRequestSource:(int64_t)a3
{
  return -[SASRequestOptions initWithRequestSource:uiPresentationIdentifier:](self, "initWithRequestSource:uiPresentationIdentifier:", a3, CFSTR("com.apple.siri.Compact"));
}

- (SASRequestOptions)initWithRequestSource:(int64_t)a3 uiPresentationIdentifier:(id)a4
{
  return -[SASRequestOptions initWithRequestSource:uiPresentationIdentifier:systemState:](self, "initWithRequestSource:uiPresentationIdentifier:systemState:", a3, a4, 0);
}

- (SASRequestOptions)initWithRequestSource:(int64_t)a3 uiPresentationIdentifier:(id)a4 systemState:(id)a5
{
  id v9;
  id v10;
  SASRequestOptions *v11;
  SASRequestOptions *v12;
  void *v13;
  double v14;
  NSMutableArray *v15;
  NSMutableArray *instrumentationEvents;
  objc_super v18;

  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SASRequestOptions;
  v11 = -[SASRequestOptions init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_requestSource = a3;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "systemUptime");
    v12->_timestamp = v14;

    v12->_useAutomaticEndpointing = 1;
    v12->_acousticIdEnabled = 0;
    objc_storeStrong((id *)&v12->_uiPresentationIdentifier, a4);
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    instrumentationEvents = v12->_instrumentationEvents;
    v12->_instrumentationEvents = v15;

    -[SASRequestOptions _configureStreamingDictationForSource:](v12, "_configureStreamingDictationForSource:", a3);
    v12->_longPressBehavior = -1;
    if (v10)
      -[SASRequestOptions _updateWithSystemState:forcefully:](v12, "_updateWithSystemState:forcefully:", v10, 1);
  }

  return v12;
}

- (SASRequestOptions)initWithRequestSource:(int64_t)a3 uiPresentationIdentifier:(id)a4 buttonContext:(id)a5
{
  id v8;
  SASRequestOptions *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v8 = a5;
  v9 = -[SASRequestOptions initWithRequestSource:uiPresentationIdentifier:systemState:](self, "initWithRequestSource:uiPresentationIdentifier:systemState:", a3, a4, 0);
  if (objc_msgSend(MEMORY[0x1E0CFE8B8], "isTVPushToTalkEnabled"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v8;
      v11 = objc_msgSend(v10, "remoteType");
      if ((unint64_t)(v11 - 1) >= 6)
        v12 = 0;
      else
        v12 = v11;
      -[SASRequestOptions setTvRemoteType:](v9, "setTvRemoteType:", v12);
      v13 = objc_msgSend(v10, "isPTTEligible");

      -[SASRequestOptions setIsTVRemoteSourcePTTEligible:](v9, "setIsTVRemoteSourcePTTEligible:", v13);
    }
  }
  objc_msgSend(v8, "activationEventInstrumentationIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASRequestOptions setActivationEventInstrumentationIdenifier:](v9, "setActivationEventInstrumentationIdenifier:", v14);

  return v9;
}

- (SASRequestOptions)init
{
  return -[SASRequestOptions initWithRequestSource:uiPresentationIdentifier:](self, "initWithRequestSource:uiPresentationIdentifier:", 0, CFSTR("com.apple.siri.Compact"));
}

- (int64_t)requestSource
{
  return self->_requestSource;
}

- (void)setRequestSource:(int64_t)a3
{
  NSObject *v4;

  if (a3 == 23)
  {
    if ((AFPreferencesTypeToSiriEnabled() & 1) != 0)
    {
      a3 = 23;
    }
    else
    {
      v4 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
        -[SASRequestOptions setRequestSource:].cold.1(v4);
      a3 = 0;
    }
  }
  self->_requestSource = a3;
}

- (void)_configureStreamingDictationForSource:(int64_t)a3
{
  int v5;
  unint64_t v6;
  uint64_t v7;

  v5 = AFPreferencesStreamingDictationEnabled();
  v6 = (0x1014105E03FEuLL >> a3) & 1;
  if ((unint64_t)a3 > 0x2C)
    LODWORD(v6) = 0;
  if (v5)
    v7 = v6;
  else
    v7 = 0;
  -[SASRequestOptions setUseStreamingDictation:](self, "setUseStreamingDictation:", v7);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  int64_t v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = -[SASRequestOptions requestSource](self, "requestSource");
  -[SASRequestOptions uiPresentationIdentifier](self, "uiPresentationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithRequestSource:uiPresentationIdentifier:", v5, v6);

  -[SASRequestOptions activationDeviceIdentifier](self, "activationDeviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActivationDeviceIdentifier:", v8);

  -[SASRequestOptions bulletin](self, "bulletin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBulletin:", v9);

  -[SASRequestOptions appBundleIdentifier](self, "appBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAppBundleIdentifier:", v10);

  objc_msgSend(v7, "setDirectActionEvent:", -[SASRequestOptions directActionEvent](self, "directActionEvent"));
  -[SASRequestOptions directActionApplicationContext](self, "directActionApplicationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDirectActionApplicationContext:", v11);

  -[SASRequestOptions serverCommandId](self, "serverCommandId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServerCommandId:", v12);

  objc_msgSend(v7, "setPronunciationRequest:", -[SASRequestOptions isPronunciationRequest](self, "isPronunciationRequest"));
  -[SASRequestOptions pronunciationContext](self, "pronunciationContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPronunciationContext:", v13);

  -[SASRequestOptions text](self, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v14);

  -[SASRequestOptions speechFileURL](self, "speechFileURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSpeechFileURL:", v15);

  -[SASRequestOptions timestamp](self, "timestamp");
  objc_msgSend(v7, "setTimestamp:");
  -[SASRequestOptions expectedTimestamp](self, "expectedTimestamp");
  objc_msgSend(v7, "setExpectedTimestamp:");
  -[SASRequestOptions buttonDownTimestamp](self, "buttonDownTimestamp");
  objc_msgSend(v7, "setButtonDownTimestamp:");
  -[SASRequestOptions computedActivationTime](self, "computedActivationTime");
  objc_msgSend(v7, "setComputedActivationTime:");
  objc_msgSend(v7, "setInitialBringUp:", -[SASRequestOptions isInitialBringUp](self, "isInitialBringUp"));
  objc_msgSend(v7, "setUseAutomaticEndpointing:", -[SASRequestOptions useAutomaticEndpointing](self, "useAutomaticEndpointing"));
  objc_msgSend(v7, "setUseStreamingDictation:", -[SASRequestOptions useStreamingDictation](self, "useStreamingDictation"));
  -[SASRequestOptions homeButtonUpFromBeep](self, "homeButtonUpFromBeep");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHomeButtonUpFromBeep:", v16);

  -[SASRequestOptions continuityInfo](self, "continuityInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContinuityInfo:", v17);

  -[SASRequestOptions requestInfo](self, "requestInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRequestInfo:", v18);

  -[SASRequestOptions speechRequestOptions](self, "speechRequestOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSpeechRequestOptions:", v19);

  objc_msgSend(v7, "setAcousticIdEnabled:", -[SASRequestOptions acousticIdEnabled](self, "acousticIdEnabled"));
  objc_msgSend(v7, "setReleaseAudioSessionOnRecordingCompletion:", -[SASRequestOptions releaseAudioSessionOnRecordingCompletion](self, "releaseAudioSessionOnRecordingCompletion"));
  objc_msgSend(v7, "setPredictedRecordRouteIsZLL:", -[SASRequestOptions predictedRecordRouteIsZLL](self, "predictedRecordRouteIsZLL"));
  -[SASRequestOptions testingContext](self, "testingContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTestingContext:", v20);

  objc_msgSend(v7, "setIsConnectedToCarPlay:", -[SASRequestOptions isConnectedToCarPlay](self, "isConnectedToCarPlay"));
  objc_msgSend(v7, "setIsForCarDND:", -[SASRequestOptions isForCarDND](self, "isForCarDND"));
  objc_msgSend(v7, "setCarDNDStatus:", -[SASRequestOptions carDNDStatus](self, "carDNDStatus"));
  objc_msgSend(v7, "setCurrentLockState:", -[SASRequestOptions currentLockState](self, "currentLockState"));
  objc_msgSend(v7, "setPreviousInteractionInputType:", -[SASRequestOptions previousInteractionInputType](self, "previousInteractionInputType"));
  objc_msgSend(v7, "setIsForBluetoothCar:", -[SASRequestOptions isForBluetoothCar](self, "isForBluetoothCar"));
  -[SASRequestOptions currentCarPlaySupportedOEMAppIdList](self, "currentCarPlaySupportedOEMAppIdList");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentCarPlaySupportedOEMAppIdList:", v21);

  objc_msgSend(v7, "setShortButtonPressAction:", -[SASRequestOptions isShortButtonPressAction](self, "isShortButtonPressAction"));
  -[SASRequestOptions instrumentationEvents](self, "instrumentationEvents");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInstrumentationEvents:", v22);

  -[SASRequestOptions startRecordingSoundId](self, "startRecordingSoundId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStartRecordingSoundId:", v23);

  -[SASRequestOptions originalRequestOptions](self, "originalRequestOptions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOriginalRequestOptions:", v24);

  objc_msgSend(v7, "setPresentationMode:", -[SASRequestOptions presentationMode](self, "presentationMode"));
  objc_msgSend(v7, "setRightHandDrive:", -[SASRequestOptions isRightHandDrive](self, "isRightHandDrive"));
  objc_msgSend(v7, "setTvRemoteType:", -[SASRequestOptions tvRemoteType](self, "tvRemoteType"));
  objc_msgSend(v7, "setIsTVRemoteSourcePTTEligible:", -[SASRequestOptions isTVRemoteSourcePTTEligible](self, "isTVRemoteSourcePTTEligible"));
  objc_msgSend(v7, "setLongPressBehavior:", -[SASRequestOptions longPressBehavior](self, "longPressBehavior"));
  -[SASRequestOptions activationEventInstrumentationIdenifier](self, "activationEventInstrumentationIdenifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActivationEventInstrumentationIdenifier:", v25);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASRequestOptions)initWithCoder:(id)a3
{
  id v4;
  SASRequestOptions *v5;
  void *v6;
  uint64_t v7;
  NSString *activationDeviceIdentifier;
  uint64_t v9;
  AFBulletin *bulletin;
  void *v11;
  uint64_t v12;
  NSString *appBundleIdentifier;
  uint64_t v14;
  AFApplicationContext *directActionApplicationContext;
  void *v16;
  uint64_t v17;
  NSString *serverCommandId;
  uint64_t v19;
  SASPronunciationContext *pronunciationContext;
  void *v21;
  uint64_t v22;
  NSString *text;
  void *v24;
  uint64_t v25;
  NSURL *speechFileURL;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  NSNumber *homeButtonUpFromBeep;
  uint64_t v33;
  NSDictionary *continuityInfo;
  uint64_t v35;
  AFRequestInfo *requestInfo;
  uint64_t v37;
  AFSpeechRequestOptions *speechRequestOptions;
  void *v39;
  uint64_t v40;
  NSString *uiPresentationIdentifier;
  uint64_t v42;
  NSDictionary *testingContext;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  NSMutableArray *instrumentationEvents;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  NSArray *currentCarPlaySupportedOEMAppIdList;
  uint64_t v56;
  NSString *startRecordingSoundId;
  uint64_t v58;
  SASRequestOptions *originalRequestOptions;
  uint64_t v60;
  NSUUID *previousTurnIdentifier;
  uint64_t v62;
  NSUUID *activationEventInstrumentationIdenifier;
  objc_super v65;

  v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)SASRequestOptions;
  v5 = -[SASRequestOptions init](&v65, sel_init);
  if (v5)
  {
    v5->_requestSource = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SASRequestOptionsSourceCodingKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASRequestOptionsActivationDeviceIdentifierCodingKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    activationDeviceIdentifier = v5->_activationDeviceIdentifier;
    v5->_activationDeviceIdentifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASRequestOptionsBulletinCodingKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    bulletin = v5->_bulletin;
    v5->_bulletin = (AFBulletin *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASRequestOptionsAppBundleIdentifierCodingKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    appBundleIdentifier = v5->_appBundleIdentifier;
    v5->_appBundleIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASRequestOptionsMessagesDirectActionApplicationContextCodingKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    directActionApplicationContext = v5->_directActionApplicationContext;
    v5->_directActionApplicationContext = (AFApplicationContext *)v14;

    v5->_directActionEvent = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SASRequestOptionsDirectActionEventCodingKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASRequestOptionsServerCommandAceIdentifierCodingKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    serverCommandId = v5->_serverCommandId;
    v5->_serverCommandId = (NSString *)v17;

    v5->_pronunciationRequest = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SASRequestOptionsPronunciationRequestCodingKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASRequestOptionsPronunciationContextCodingKey"));
    v19 = objc_claimAutoreleasedReturnValue();
    pronunciationContext = v5->_pronunciationContext;
    v5->_pronunciationContext = (SASPronunciationContext *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASRequestOptionsTextCodingKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    text = v5->_text;
    v5->_text = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASRequestOptionsSpeechFileURLCodingKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    speechFileURL = v5->_speechFileURL;
    v5->_speechFileURL = (NSURL *)v25;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SASRequestOptionsTimestampCodingKey"));
    v5->_timestamp = v27;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SASRequestOptionsExpectedTimestampCodingKey"));
    v5->_expectedTimestamp = v28;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SASRequestOptionsButtonDownTimestampCodingKey"));
    v5->_buttonDownTimestamp = v29;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SASRequestOptionsComputedActivationTimestampCodingKey"));
    v5->_computedActivationTime = v30;
    v5->_initialBringUp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SASRequestOptionsIsInitialBringUpKey"));
    v5->_useAutomaticEndpointing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SASRequestOptionsUseAutomaticEndpointingKey"));
    v5->_useStreamingDictation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SASRequestOptionsUseStreamingDictationKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASRequestHomeButtonUpFromBeepKey"));
    v31 = objc_claimAutoreleasedReturnValue();
    homeButtonUpFromBeep = v5->_homeButtonUpFromBeep;
    v5->_homeButtonUpFromBeep = (NSNumber *)v31;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("SASRequestContinuityDataKey"));
    v33 = objc_claimAutoreleasedReturnValue();
    continuityInfo = v5->_continuityInfo;
    v5->_continuityInfo = (NSDictionary *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASRequestRequestInfoKey"));
    v35 = objc_claimAutoreleasedReturnValue();
    requestInfo = v5->_requestInfo;
    v5->_requestInfo = (AFRequestInfo *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASRequestSpeechRequestOptionsKey"));
    v37 = objc_claimAutoreleasedReturnValue();
    speechRequestOptions = v5->_speechRequestOptions;
    v5->_speechRequestOptions = (AFSpeechRequestOptions *)v37;

    v5->_acousticIdEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SASRequestOptionsAcousticIdEnabledKey"));
    v5->_releaseAudioSessionOnRecordingCompletion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SASRequestOptionsReleaseAudioSessionOnRecordingCompletionKey"));
    v5->_predictedRecordRouteIsZLL = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SASRequestPredictedRecordRouteIsZLL"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASRequestOptionsUIPresentationIdentifierCodingKey"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "copy");
    uiPresentationIdentifier = v5->_uiPresentationIdentifier;
    v5->_uiPresentationIdentifier = (NSString *)v40;

    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("SASRequestOptionsTestingContextKey"));
    v42 = objc_claimAutoreleasedReturnValue();
    testingContext = v5->_testingContext;
    v5->_testingContext = (NSDictionary *)v42;

    v5->_isConnectedToCarPlay = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SASRequestOptionsIsConnectedToCarPlayCodingKey"));
    v5->_supportsCarPlayVehicleData = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SASRequestOptionsSupportsCarPlayVehicleData"));
    v5->_isForCarDND = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SASRequestOptionsIsForCarDNDCodingKey"));
    v5->_carDNDStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SASRequestOptionsCarDNDStatusCodingKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASRequestOptionsCurrentLockStateCodingKey"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_currentLockState = objc_msgSend(v44, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASRequestOptionsPreviousInteractionInputTypeCodingKey"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_previousInteractionInputType = objc_msgSend(v45, "unsignedIntegerValue");

    v5->_isForBluetoothCar = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SASRequestOptionsBluetoothCarCodingKey"));
    v46 = (void *)MEMORY[0x1E0C99E60];
    v47 = objc_opt_class();
    objc_msgSend(v46, "setWithObjects:", v47, objc_opt_class(), 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v48, CFSTR("SASRequestOptionsInstrumentationEventsCodingKey"));
    v49 = objc_claimAutoreleasedReturnValue();
    instrumentationEvents = v5->_instrumentationEvents;
    v5->_instrumentationEvents = (NSMutableArray *)v49;

    v51 = (void *)MEMORY[0x1E0C99E60];
    v52 = objc_opt_class();
    objc_msgSend(v51, "setWithObjects:", v52, objc_opt_class(), 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v53, CFSTR("SASRequestOptionsCurrentCarPlaySupportedOEMAppIdListKey"));
    v54 = objc_claimAutoreleasedReturnValue();
    currentCarPlaySupportedOEMAppIdList = v5->_currentCarPlaySupportedOEMAppIdList;
    v5->_currentCarPlaySupportedOEMAppIdList = (NSArray *)v54;

    v5->_shortButtonPressAction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SASRequestOptionsIsTVShortButtonPressAction"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASRequestOptionsStartRecordingSoundIDCodingKey"));
    v56 = objc_claimAutoreleasedReturnValue();
    startRecordingSoundId = v5->_startRecordingSoundId;
    v5->_startRecordingSoundId = (NSString *)v56;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASRequestOptionsOriginalOptionsCodingKey"));
    v58 = objc_claimAutoreleasedReturnValue();
    originalRequestOptions = v5->_originalRequestOptions;
    v5->_originalRequestOptions = (SASRequestOptions *)v58;

    v5->_presentationMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SASRequestOptionsPresentationModeCodingKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASRequestOptionsPreviousTurnIdentifierCodingKey"));
    v60 = objc_claimAutoreleasedReturnValue();
    previousTurnIdentifier = v5->_previousTurnIdentifier;
    v5->_previousTurnIdentifier = (NSUUID *)v60;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SASRequestOptionsActivationEventIdentifierCodingKey"));
    v62 = objc_claimAutoreleasedReturnValue();
    activationEventInstrumentationIdenifier = v5->_activationEventInstrumentationIdenifier;
    v5->_activationEventInstrumentationIdenifier = (NSUUID *)v62;

    v5->_rightHandDrive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SASRequestOptionsIsRightHandDriveKey"));
    v5->_tvRemoteType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SASRequestOptionsTVRemoteType"));
    v5->_isRemotePresentationBringUp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SASRequestOptionsIsRemotePresentationBringUpCodingKey"));
    v5->_isTVRemoteSourcePTTEligible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SASRequestOptionsIsTVRemoteSourcePTTEligibleCodingKey"));
    v5->_longPressBehavior = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SASRequestOptionsLongPressBehavior"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  objc_msgSend(v26, "encodeInteger:forKey:", -[SASRequestOptions requestSource](self, "requestSource"), CFSTR("SASRequestOptionsSourceCodingKey"));
  -[SASRequestOptions activationDeviceIdentifier](self, "activationDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v4, CFSTR("SASRequestOptionsActivationDeviceIdentifierCodingKey"));

  -[SASRequestOptions bulletin](self, "bulletin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v5, CFSTR("SASRequestOptionsBulletinCodingKey"));

  -[SASRequestOptions appBundleIdentifier](self, "appBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v6, CFSTR("SASRequestOptionsAppBundleIdentifierCodingKey"));

  -[SASRequestOptions directActionApplicationContext](self, "directActionApplicationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v7, CFSTR("SASRequestOptionsMessagesDirectActionApplicationContextCodingKey"));

  objc_msgSend(v26, "encodeInteger:forKey:", -[SASRequestOptions directActionEvent](self, "directActionEvent"), CFSTR("SASRequestOptionsDirectActionEventCodingKey"));
  -[SASRequestOptions serverCommandId](self, "serverCommandId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v8, CFSTR("SASRequestOptionsServerCommandAceIdentifierCodingKey"));

  objc_msgSend(v26, "encodeBool:forKey:", -[SASRequestOptions isPronunciationRequest](self, "isPronunciationRequest"), CFSTR("SASRequestOptionsPronunciationRequestCodingKey"));
  -[SASRequestOptions pronunciationContext](self, "pronunciationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v9, CFSTR("SASRequestOptionsPronunciationContextCodingKey"));

  -[SASRequestOptions text](self, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v10, CFSTR("SASRequestOptionsTextCodingKey"));

  -[SASRequestOptions speechFileURL](self, "speechFileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v11, CFSTR("SASRequestOptionsSpeechFileURLCodingKey"));

  -[SASRequestOptions timestamp](self, "timestamp");
  objc_msgSend(v26, "encodeDouble:forKey:", CFSTR("SASRequestOptionsTimestampCodingKey"));
  -[SASRequestOptions expectedTimestamp](self, "expectedTimestamp");
  objc_msgSend(v26, "encodeDouble:forKey:", CFSTR("SASRequestOptionsExpectedTimestampCodingKey"));
  -[SASRequestOptions buttonDownTimestamp](self, "buttonDownTimestamp");
  objc_msgSend(v26, "encodeDouble:forKey:", CFSTR("SASRequestOptionsButtonDownTimestampCodingKey"));
  -[SASRequestOptions computedActivationTime](self, "computedActivationTime");
  objc_msgSend(v26, "encodeDouble:forKey:", CFSTR("SASRequestOptionsComputedActivationTimestampCodingKey"));
  objc_msgSend(v26, "encodeBool:forKey:", -[SASRequestOptions isInitialBringUp](self, "isInitialBringUp"), CFSTR("SASRequestOptionsIsInitialBringUpKey"));
  objc_msgSend(v26, "encodeBool:forKey:", -[SASRequestOptions useStreamingDictation](self, "useStreamingDictation"), CFSTR("SASRequestOptionsUseStreamingDictationKey"));
  -[SASRequestOptions homeButtonUpFromBeep](self, "homeButtonUpFromBeep");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v12, CFSTR("SASRequestHomeButtonUpFromBeepKey"));

  -[SASRequestOptions continuityInfo](self, "continuityInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v13, CFSTR("SASRequestContinuityDataKey"));

  -[SASRequestOptions requestInfo](self, "requestInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v14, CFSTR("SASRequestRequestInfoKey"));

  objc_msgSend(v26, "encodeBool:forKey:", -[SASRequestOptions useAutomaticEndpointing](self, "useAutomaticEndpointing"), CFSTR("SASRequestOptionsUseAutomaticEndpointingKey"));
  -[SASRequestOptions speechRequestOptions](self, "speechRequestOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v15, CFSTR("SASRequestSpeechRequestOptionsKey"));

  objc_msgSend(v26, "encodeBool:forKey:", -[SASRequestOptions acousticIdEnabled](self, "acousticIdEnabled"), CFSTR("SASRequestOptionsAcousticIdEnabledKey"));
  objc_msgSend(v26, "encodeBool:forKey:", -[SASRequestOptions releaseAudioSessionOnRecordingCompletion](self, "releaseAudioSessionOnRecordingCompletion"), CFSTR("SASRequestOptionsReleaseAudioSessionOnRecordingCompletionKey"));
  objc_msgSend(v26, "encodeBool:forKey:", -[SASRequestOptions predictedRecordRouteIsZLL](self, "predictedRecordRouteIsZLL"), CFSTR("SASRequestPredictedRecordRouteIsZLL"));
  -[SASRequestOptions uiPresentationIdentifier](self, "uiPresentationIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v16, CFSTR("SASRequestOptionsUIPresentationIdentifierCodingKey"));

  -[SASRequestOptions testingContext](self, "testingContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v17, CFSTR("SASRequestOptionsTestingContextKey"));

  objc_msgSend(v26, "encodeBool:forKey:", -[SASRequestOptions isConnectedToCarPlay](self, "isConnectedToCarPlay"), CFSTR("SASRequestOptionsIsConnectedToCarPlayCodingKey"));
  objc_msgSend(v26, "encodeBool:forKey:", -[SASRequestOptions supportsCarPlayVehicleData](self, "supportsCarPlayVehicleData"), CFSTR("SASRequestOptionsSupportsCarPlayVehicleData"));
  objc_msgSend(v26, "encodeBool:forKey:", -[SASRequestOptions isForCarDND](self, "isForCarDND"), CFSTR("SASRequestOptionsIsForCarDNDCodingKey"));
  objc_msgSend(v26, "encodeInteger:forKey:", -[SASRequestOptions carDNDStatus](self, "carDNDStatus"), CFSTR("SASRequestOptionsCarDNDStatusCodingKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SASRequestOptions currentLockState](self, "currentLockState"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v18, CFSTR("SASRequestOptionsCurrentLockStateCodingKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SASRequestOptions previousInteractionInputType](self, "previousInteractionInputType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v19, CFSTR("SASRequestOptionsPreviousInteractionInputTypeCodingKey"));

  objc_msgSend(v26, "encodeBool:forKey:", -[SASRequestOptions isForBluetoothCar](self, "isForBluetoothCar"), CFSTR("SASRequestOptionsBluetoothCarCodingKey"));
  -[SASRequestOptions instrumentationEvents](self, "instrumentationEvents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v20, CFSTR("SASRequestOptionsInstrumentationEventsCodingKey"));

  -[SASRequestOptions currentCarPlaySupportedOEMAppIdList](self, "currentCarPlaySupportedOEMAppIdList");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v21, CFSTR("SASRequestOptionsCurrentCarPlaySupportedOEMAppIdListKey"));

  objc_msgSend(v26, "encodeBool:forKey:", -[SASRequestOptions isShortButtonPressAction](self, "isShortButtonPressAction"), CFSTR("SASRequestOptionsIsTVShortButtonPressAction"));
  -[SASRequestOptions startRecordingSoundId](self, "startRecordingSoundId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v22, CFSTR("SASRequestOptionsStartRecordingSoundIDCodingKey"));

  -[SASRequestOptions originalRequestOptions](self, "originalRequestOptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v23, CFSTR("SASRequestOptionsOriginalOptionsCodingKey"));

  objc_msgSend(v26, "encodeInteger:forKey:", -[SASRequestOptions presentationMode](self, "presentationMode"), CFSTR("SASRequestOptionsPresentationModeCodingKey"));
  -[SASRequestOptions previousTurnIdentifier](self, "previousTurnIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v24, CFSTR("SASRequestOptionsPreviousTurnIdentifierCodingKey"));

  -[SASRequestOptions activationEventInstrumentationIdenifier](self, "activationEventInstrumentationIdenifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "encodeObject:forKey:", v25, CFSTR("SASRequestOptionsActivationEventIdentifierCodingKey"));

  objc_msgSend(v26, "encodeBool:forKey:", -[SASRequestOptions isRightHandDrive](self, "isRightHandDrive"), CFSTR("SASRequestOptionsIsRightHandDriveKey"));
  objc_msgSend(v26, "encodeInteger:forKey:", -[SASRequestOptions tvRemoteType](self, "tvRemoteType"), CFSTR("SASRequestOptionsTVRemoteType"));
  objc_msgSend(v26, "encodeBool:forKey:", -[SASRequestOptions isRemotePresentationBringUp](self, "isRemotePresentationBringUp"), CFSTR("SASRequestOptionsIsRemotePresentationBringUpCodingKey"));
  objc_msgSend(v26, "encodeBool:forKey:", -[SASRequestOptions isTVRemoteSourcePTTEligible](self, "isTVRemoteSourcePTTEligible"), CFSTR("SASRequestOptionsIsTVRemoteSourcePTTEligibleCodingKey"));
  objc_msgSend(v26, "encodeInteger:forKey:", -[SASRequestOptions longPressBehavior](self, "longPressBehavior"), CFSTR("SASRequestOptionsLongPressBehavior"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  _BOOL4 v34;
  _BOOL4 v35;
  _BOOL4 v36;
  _BOOL4 v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int64_t v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _BOOL8 v60;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = objc_opt_class();
  SASRequestSourceGetName(-[SASRequestOptions requestSource](self, "requestSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; requestSource=%@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SASRequestOptions activationDeviceIdentifier](self, "activationDeviceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SASRequestOptions activationDeviceIdentifier](self, "activationDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(";activationDeviceIdentifier=%@"), v8);

  }
  -[SASRequestOptions bulletin](self, "bulletin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SASRequestOptions bulletin](self, "bulletin");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(";bulletin=%@"), v10);

  }
  -[SASRequestOptions appBundleIdentifier](self, "appBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SASRequestOptions appBundleIdentifier](self, "appBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(";appBundleIdentifier=%@"), v12);

  }
  -[SASRequestOptions directActionEvent](self, "directActionEvent");
  AFDirectActionEventGetName();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(";directActionEvent=%@"), v13);

  -[SASRequestOptions serverCommandId](self, "serverCommandId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SASRequestOptions serverCommandId](self, "serverCommandId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(";serverCommandId=%@"), v15);

  }
  objc_msgSend(v6, "appendFormat:", CFSTR(";isPronunciationRequest=%i"),
    -[SASRequestOptions isPronunciationRequest](self, "isPronunciationRequest"));
  -[SASRequestOptions pronunciationContext](self, "pronunciationContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SASRequestOptions pronunciationContext](self, "pronunciationContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(";pronunciationContext=%@"), v17);

  }
  -[SASRequestOptions text](self, "text");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[SASRequestOptions text](self, "text");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(";text=%@"), v19);

  }
  -[SASRequestOptions speechFileURL](self, "speechFileURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[SASRequestOptions speechFileURL](self, "speechFileURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(";speechFileURL=%@"), v21);

  }
  -[SASRequestOptions expectedTimestamp](self, "expectedTimestamp");
  v23 = v22;
  -[SASRequestOptions timestamp](self, "timestamp");
  v25 = v24;
  -[SASRequestOptions buttonDownTimestamp](self, "buttonDownTimestamp");
  v27 = v26;
  -[SASRequestOptions computedActivationTime](self, "computedActivationTime");
  objc_msgSend(v6, "appendFormat:", CFSTR(";expectedTimestamp=%0.1f;timestamp=%0.1f;buttonDownTimestamp=%0.1f;computedActivationTime=%0.1f;isInitialBringUp=%i;useAutomaticEndpointing=%i;useStreamingDictation=%i;acousticId=%i;releaseAudioSessionORC=%i;predictedZLL=%i"),
    v23,
    v25,
    v27,
    v28,
    -[SASRequestOptions isInitialBringUp](self, "isInitialBringUp"),
    -[SASRequestOptions useAutomaticEndpointing](self, "useAutomaticEndpointing"),
    -[SASRequestOptions useStreamingDictation](self, "useStreamingDictation"),
    -[SASRequestOptions acousticIdEnabled](self, "acousticIdEnabled"),
    -[SASRequestOptions releaseAudioSessionOnRecordingCompletion](self, "releaseAudioSessionOnRecordingCompletion"),
    -[SASRequestOptions predictedRecordRouteIsZLL](self, "predictedRecordRouteIsZLL"));
  -[SASRequestOptions uiPresentationIdentifier](self, "uiPresentationIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[SASRequestOptions uiPresentationIdentifier](self, "uiPresentationIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(";uiPresentationIdentifier=%@"), v30);

  }
  -[SASRequestOptions testingContext](self, "testingContext");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[SASRequestOptions testingContext](self, "testingContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(";testingContext=%@"), v32);

  }
  v60 = -[SASRequestOptions inputType](self, "inputType") == 2;
  v33 = -[SASRequestOptions inputType](self, "inputType") == 1;
  v34 = -[SASRequestOptions isForStark](self, "isForStark");
  v35 = -[SASRequestOptions isConnectedToCarPlay](self, "isConnectedToCarPlay");
  v36 = -[SASRequestOptions isForCarDND](self, "isForCarDND");
  v37 = -[SASRequestOptions isRightHandDrive](self, "isRightHandDrive");
  v38 = -[SASRequestOptions isForBluetoothCar](self, "isForBluetoothCar");
  CARAutomaticFeatureStateGetName(-[SASRequestOptions carDNDStatus](self, "carDNDStatus"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(";is(speech=%i; textInput=%i;stark=%i;CPconnected=%i;dnd=%i;rightHandDrive=%i;isForBluetoothCar=%i);carDNDStatus=%@;remotePresentationBringUp=%i;supportsCarPlayVehicleData=%i"),
    v60,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39,
    -[SASRequestOptions isRemotePresentationBringUp](self, "isRemotePresentationBringUp"),
    -[SASRequestOptions supportsCarPlayVehicleData](self, "supportsCarPlayVehicleData"));

  -[SASRequestOptions homeButtonUpFromBeep](self, "homeButtonUpFromBeep");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[SASRequestOptions homeButtonUpFromBeep](self, "homeButtonUpFromBeep");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(";homeButtonUpFromBeep=%@"), v41);

  }
  -[SASRequestOptions continuityInfo](self, "continuityInfo");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[SASRequestOptions continuityInfo](self, "continuityInfo");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(";continuityInfo=%@"), v43);

  }
  -[SASRequestOptions requestInfo](self, "requestInfo");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[SASRequestOptions requestInfo](self, "requestInfo");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(";requestInfo=%@"), v45);

  }
  SASLockStateGetName(-[SASRequestOptions currentLockState](self, "currentLockState"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(";currentLockState=%@"), v46);

  v47 = -[SASRequestOptions previousInteractionInputType](self, "previousInteractionInputType");
  v48 = CFSTR("SASRequestInputTypeNone");
  if (v47 == 1)
    v48 = CFSTR("SASRequestInputTypeText");
  if (v47 == 2)
    v48 = CFSTR("SASRequestInputTypeSpeech");
  objc_msgSend(v6, "appendFormat:", CFSTR(";previousInteractionInputType=%@"), v48);
  -[SASRequestOptions directActionApplicationContext](self, "directActionApplicationContext");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    -[SASRequestOptions directActionApplicationContext](self, "directActionApplicationContext");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(";directActionApplicationContext=%@"), v50);

  }
  -[SASRequestOptions currentCarPlaySupportedOEMAppIdList](self, "currentCarPlaySupportedOEMAppIdList");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    -[SASRequestOptions currentCarPlaySupportedOEMAppIdList](self, "currentCarPlaySupportedOEMAppIdList");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(";carPlayOEMList=%@"), v52);

  }
  objc_msgSend(v6, "appendFormat:", CFSTR(";isShortButtonPressAction=%i"),
    -[SASRequestOptions isShortButtonPressAction](self, "isShortButtonPressAction"));
  -[SASRequestOptions startRecordingSoundId](self, "startRecordingSoundId");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    -[SASRequestOptions startRecordingSoundId](self, "startRecordingSoundId");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(";startRecordingSoundId=%@"), v54);

  }
  -[SASRequestOptions originalRequestOptions](self, "originalRequestOptions");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    -[SASRequestOptions originalRequestOptions](self, "originalRequestOptions");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    SASRequestSourceGetName(objc_msgSend(v56, "requestSource"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(";originalRequestOptions.requestSource=%@"), v57);

  }
  if (-[SASRequestOptions presentationMode](self, "presentationMode"))
    objc_msgSend(v6, "appendFormat:", CFSTR(";presentationMode=%zd"),
      -[SASRequestOptions presentationMode](self, "presentationMode"));
  if (-[SASRequestOptions tvRemoteType](self, "tvRemoteType"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SASRequestOptions tvRemoteType](self, "tvRemoteType"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(";tvRemoteType=%@"), v58);

  }
  objc_msgSend(v6, "appendFormat:", CFSTR(";isTVRemoteSourcePTTEligible=%i"),
    -[SASRequestOptions isTVRemoteSourcePTTEligible](self, "isTVRemoteSourcePTTEligible"));
  objc_msgSend(v6, "appendFormat:", CFSTR(";longPressBehavior=%ld>"),
    -[SASRequestOptions longPressBehavior](self, "longPressBehavior"));
  return v6;
}

- (int64_t)inputType
{
  if (-[SASRequestOptions _isTypeToSiriPermittedAndEnabledForRequestOptions](self, "_isTypeToSiriPermittedAndEnabledForRequestOptions")|| AFDeviceSupportsSystemAssistantExperience()&& -[SASRequestOptions requestSource](self, "requestSource") == 32)
  {
    return 1;
  }
  if (-[SASRequestOptions _isForSpeechRequest](self, "_isForSpeechRequest"))
    return 2;
  return 0;
}

- (BOOL)_isForSpeechRequest
{
  unint64_t v3;
  BOOL v4;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[SASRequestOptions requestSource](self, "requestSource") - 13;
  if (v3 < 0x1E && ((0x39000003u >> v3) & 1) != 0
    || -[SASRequestOptions requestSource](self, "requestSource") == 18
    && !-[SASRequestOptions isH1Activation](self, "isH1Activation")
    || -[SASRequestOptions requestSource](self, "requestSource") == 20
    || -[SASRequestOptions requestSource](self, "requestSource") == 21)
  {
    v4 = 1;
  }
  else
  {
    -[SASRequestOptions text](self, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v4 = 1;
    }
    else
    {
      -[SASRequestOptions speechFileURL](self, "speechFileURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v8, "length")
        || -[SASRequestOptions requestSource](self, "requestSource") == 23
        || -[SASRequestOptions _isTypeToSiriPermittedAndEnabledForRequestOptions](self, "_isTypeToSiriPermittedAndEnabledForRequestOptions")|| -[SASRequestOptions requestSource](self, "requestSource") == 35|| -[SASRequestOptions requestSource](self, "requestSource") == 39;

    }
  }
  return !v4;
}

- (BOOL)isForAppleTV
{
  void *v2;
  char v3;

  -[SASRequestOptions uiPresentationIdentifier](self, "uiPresentationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.siri.SiriTVPresentation"));

  return v3;
}

- (BOOL)isSuggestionSourceWithTextInput
{
  return -[SASRequestOptions requestSource](self, "requestSource") == 50
      && -[SASRequestOptions previousInteractionInputType](self, "previousInteractionInputType") == 1;
}

- (BOOL)isForStark
{
  void *v3;
  char v4;
  void *v5;

  -[SASRequestOptions uiPresentationIdentifier](self, "uiPresentationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.CarDisplay")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[SASRequestOptions uiPresentationIdentifier](self, "uiPresentationIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.siri.CarDisplay.UIFree"));

  }
  return v4;
}

- (BOOL)isForEyesFree
{
  void *v2;
  char v3;

  -[SASRequestOptions uiPresentationIdentifier](self, "uiPresentationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.siri.EyesFree"));

  return v3;
}

- (BOOL)isForUIFree
{
  void *v3;
  char v4;
  void *v5;

  -[SASRequestOptions uiPresentationIdentifier](self, "uiPresentationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.siri.UIFree")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[SASRequestOptions uiPresentationIdentifier](self, "uiPresentationIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.siri.CarDisplay.UIFree"));

  }
  return v4;
}

- (BOOL)isRequestMadeWithPhysicalDeviceInteraction
{
  unint64_t v2;

  v2 = -[SASRequestOptions requestSource](self, "requestSource");
  return (v2 > 0x33) | (0x7880F1890000EuLL >> v2) & 1;
}

- (BOOL)userTypedInSiri
{
  return -[SASRequestOptions requestSource](self, "requestSource") == 32
      || -[SASRequestOptions requestSource](self, "requestSource") == 23;
}

- (BOOL)isVoiceTriggerRequest
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[SASRequestOptions requestInfo](self, "requestInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "speechRequestOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "activationEvent");

  if (-[SASRequestOptions requestSource](self, "requestSource") == 8)
    return 1;
  return -[SASRequestOptions requestSource](self, "requestSource") == 18 && v5 == 15;
}

- (BOOL)isInAutoPrompt
{
  return -[SASRequestOptions requestSource](self, "requestSource") == 9;
}

- (BOOL)isFlexibleFollowupRequest
{
  return -[SASRequestOptions requestSource](self, "requestSource") == 38;
}

- (id)nullableProperties
{
  return -[SASRequestOptionsNullableAccess initWithActivationDeviceIdentifier:requestInfo:]([SASRequestOptionsNullableAccess alloc], "initWithActivationDeviceIdentifier:requestInfo:", self->_activationDeviceIdentifier, self->_requestInfo);
}

- (BOOL)isWiredMicOrBTHeadsetOrWx
{
  unint64_t v3;
  _BOOL4 v4;

  v3 = -[SASRequestOptions requestSource](self, "requestSource");
  v4 = v3 == 18 && -[SASRequestOptions isH1Activation](self, "isH1Activation");
  return (v3 < 0x2E) & (0x240000000030uLL >> v3) | v4;
}

- (BOOL)isH1Activation
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[SASRequestOptions requestInfo](self, "requestInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speechRequestOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activationEvent");

  return (v4 < 0x23) & (0x40002C000uLL >> v4);
}

- (BOOL)isHTTRequestSource
{
  unint64_t v2;

  v2 = -[SASRequestOptions requestSource](self, "requestSource");
  return (v2 < 0x2C) & (0x810F0430C06uLL >> v2);
}

- (BOOL)isATVRemotePTTEligible
{
  int v3;
  unint64_t v4;

  if (-[SASRequestOptions requestSource](self, "requestSource") != 22
    && -[SASRequestOptions requestSource](self, "requestSource") != 30
    && -[SASRequestOptions requestSource](self, "requestSource") != 31)
  {
    goto LABEL_10;
  }
  v3 = objc_msgSend(MEMORY[0x1E0CFE8B8], "isTVPushToTalkEnabled");
  if (v3)
  {
    v4 = -[SASRequestOptions tvRemoteType](self, "tvRemoteType");
    if (v4 - 5 < 2)
    {
      v3 = _os_feature_enabled_impl();
      if (!v3)
        return v3;
      goto LABEL_9;
    }
    if (v4 == 1)
    {
LABEL_9:
      LOBYTE(v3) = self->_isTVRemoteSourcePTTEligible;
      return v3;
    }
LABEL_10:
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)updateIfNeededWithSystemState:(id)a3
{
  -[SASRequestOptions _updateWithSystemState:forcefully:](self, "_updateWithSystemState:forcefully:", a3, 0);
}

- (void)_updateWithSystemState:(id)a3 forcefully:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isConnectedToCarPlay");
  if (a4)
  {
    -[SASRequestOptions setIsConnectedToCarPlay:](self, "setIsConnectedToCarPlay:", v8);
    -[SASRequestOptions setSupportsCarPlayVehicleData:](self, "setSupportsCarPlayVehicleData:", objc_msgSend(v6, "supportsCarPlayVehicleData"));
    -[SASRequestOptions setRightHandDrive:](self, "setRightHandDrive:", objc_msgSend(v6, "isRightHandDrive"));
    -[SASRequestOptions setIsForCarDND:](self, "setIsForCarDND:", objc_msgSend(v6, "carDNDActive"));
    -[SASRequestOptions setCarDNDStatus:](self, "setCarDNDStatus:", objc_msgSend(v6, "carDNDStatus"));
    objc_msgSend(v6, "currentCarPlaySupportedOEMAppIdList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASRequestOptions setCurrentCarPlaySupportedOEMAppIdList:](self, "setCurrentCarPlaySupportedOEMAppIdList:", v9);
  }
  else
  {
    if ((_DWORD)v8 != -[SASRequestOptions isConnectedToCarPlay](self, "isConnectedToCarPlay"))
    {
      -[SASRequestOptions setIsConnectedToCarPlay:](self, "setIsConnectedToCarPlay:", v8);
      objc_msgSend(v7, "addObject:", CFSTR("isConnectedToCarPlay"));
    }
    v10 = objc_msgSend(v6, "supportsCarPlayVehicleData");
    if ((_DWORD)v10 != -[SASRequestOptions supportsCarPlayVehicleData](self, "supportsCarPlayVehicleData"))
    {
      -[SASRequestOptions setSupportsCarPlayVehicleData:](self, "setSupportsCarPlayVehicleData:", v10);
      objc_msgSend(v7, "addObject:", CFSTR("supportsCarPlayVehicleData"));
    }
    v11 = objc_msgSend(v6, "isRightHandDrive");
    if ((_DWORD)v11 != -[SASRequestOptions isRightHandDrive](self, "isRightHandDrive"))
    {
      -[SASRequestOptions setRightHandDrive:](self, "setRightHandDrive:", v11);
      objc_msgSend(v7, "addObject:", CFSTR("rightHandDrive"));
    }
    v12 = objc_msgSend(v6, "carDNDActive");
    if ((_DWORD)v12 != -[SASRequestOptions isForCarDND](self, "isForCarDND"))
    {
      -[SASRequestOptions setIsForCarDND:](self, "setIsForCarDND:", v12);
      objc_msgSend(v7, "addObject:", CFSTR("isForCarDND"));
    }
    v13 = objc_msgSend(v6, "carDNDStatus");
    if (-[SASRequestOptions carDNDStatus](self, "carDNDStatus") != v13)
    {
      -[SASRequestOptions setCarDNDStatus:](self, "setCarDNDStatus:", v13);
      objc_msgSend(v7, "addObject:", CFSTR("carDNDStatus"));
    }
    objc_msgSend(v6, "currentCarPlaySupportedOEMAppIdList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASRequestOptions currentCarPlaySupportedOEMAppIdList](self, "currentCarPlaySupportedOEMAppIdList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToArray:", v9);

    if ((v15 & 1) == 0)
    {
      -[SASRequestOptions setCurrentCarPlaySupportedOEMAppIdList:](self, "setCurrentCarPlaySupportedOEMAppIdList:", v9);
      objc_msgSend(v7, "addObject:", CFSTR("currentCarPlaySupportedOEMAppIdList"));
    }
  }
  if (objc_msgSend(v7, "count"))
  {
    v16 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315394;
      v18 = "-[SASRequestOptions _updateWithSystemState:forcefully:]";
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1D132F000, v16, OS_LOG_TYPE_DEFAULT, "%s #activation Updated properties from system state: %@", (uint8_t *)&v17, 0x16u);
    }
  }

}

- (BOOL)_isTypeToSiriPermittedAndEnabledForRequestOptions
{
  char v3;
  BOOL v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;
  int64_t v8;
  _BOOL4 v9;

  v3 = AFPreferencesTypeToSiriEnabled();
  v4 = -[SASRequestOptions requestSource](self, "requestSource") == 47
    || -[SASRequestOptions requestSource](self, "requestSource") == 23
    || -[SASRequestOptions requestSource](self, "requestSource") == 49
    || -[SASRequestOptions isSuggestionSourceWithTextInput](self, "isSuggestionSourceWithTextInput");
  v5 = -[SASRequestOptions isForStark](self, "isForStark");
  v6 = -[SASRequestOptions requestSource](self, "requestSource") == 8
    || -[SASRequestOptions requestSource](self, "requestSource") == 9;
  v7 = -[SASRequestOptions isH1Activation](self, "isH1Activation")
    || -[SASRequestOptions requestSource](self, "requestSource") == 5;
  v8 = -[SASRequestOptions requestSource](self, "requestSource");
  v9 = !-[SASRequestOptions isForEyesFree](self, "isForEyesFree");
  if (v8 == 4)
    LOBYTE(v9) = 0;
  if (v7)
    LOBYTE(v9) = 0;
  return (((v3 | v4) ^ 1 | (v5 || v6)) & 1) == 0 && v9;
}

- (NSString)activationDeviceIdentifier
{
  return self->_activationDeviceIdentifier;
}

- (void)setActivationDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (AFBulletin)bulletin
{
  return self->_bulletin;
}

- (void)setBulletin:(id)a3
{
  objc_storeStrong((id *)&self->_bulletin, a3);
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (AFApplicationContext)directActionApplicationContext
{
  return self->_directActionApplicationContext;
}

- (void)setDirectActionApplicationContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)directActionEvent
{
  return self->_directActionEvent;
}

- (void)setDirectActionEvent:(int64_t)a3
{
  self->_directActionEvent = a3;
}

- (NSString)serverCommandId
{
  return self->_serverCommandId;
}

- (void)setServerCommandId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)isPronunciationRequest
{
  return self->_pronunciationRequest;
}

- (void)setPronunciationRequest:(BOOL)a3
{
  self->_pronunciationRequest = a3;
}

- (SASPronunciationContext)pronunciationContext
{
  return self->_pronunciationContext;
}

- (void)setPronunciationContext:(id)a3
{
  objc_storeStrong((id *)&self->_pronunciationContext, a3);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSURL)speechFileURL
{
  return self->_speechFileURL;
}

- (void)setSpeechFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (double)expectedTimestamp
{
  return self->_expectedTimestamp;
}

- (void)setExpectedTimestamp:(double)a3
{
  self->_expectedTimestamp = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)buttonDownTimestamp
{
  return self->_buttonDownTimestamp;
}

- (void)setButtonDownTimestamp:(double)a3
{
  self->_buttonDownTimestamp = a3;
}

- (double)computedActivationTime
{
  return self->_computedActivationTime;
}

- (void)setComputedActivationTime:(double)a3
{
  self->_computedActivationTime = a3;
}

- (BOOL)isForBluetoothCar
{
  return self->_isForBluetoothCar;
}

- (void)setIsForBluetoothCar:(BOOL)a3
{
  self->_isForBluetoothCar = a3;
}

- (int64_t)longPressBehavior
{
  return self->_longPressBehavior;
}

- (void)setLongPressBehavior:(int64_t)a3
{
  self->_longPressBehavior = a3;
}

- (NSArray)currentCarPlaySupportedOEMAppIdList
{
  return self->_currentCarPlaySupportedOEMAppIdList;
}

- (void)setCurrentCarPlaySupportedOEMAppIdList:(id)a3
{
  objc_storeStrong((id *)&self->_currentCarPlaySupportedOEMAppIdList, a3);
}

- (BOOL)isForCarDND
{
  return self->_isForCarDND;
}

- (void)setIsForCarDND:(BOOL)a3
{
  self->_isForCarDND = a3;
}

- (BOOL)isConnectedToCarPlay
{
  return self->_isConnectedToCarPlay;
}

- (void)setIsConnectedToCarPlay:(BOOL)a3
{
  self->_isConnectedToCarPlay = a3;
}

- (unint64_t)carDNDStatus
{
  return self->_carDNDStatus;
}

- (void)setCarDNDStatus:(unint64_t)a3
{
  self->_carDNDStatus = a3;
}

- (BOOL)supportsCarPlayVehicleData
{
  return self->_supportsCarPlayVehicleData;
}

- (void)setSupportsCarPlayVehicleData:(BOOL)a3
{
  self->_supportsCarPlayVehicleData = a3;
}

- (BOOL)isRightHandDrive
{
  return self->_rightHandDrive;
}

- (void)setRightHandDrive:(BOOL)a3
{
  self->_rightHandDrive = a3;
}

- (BOOL)isInitialBringUp
{
  return self->_initialBringUp;
}

- (void)setInitialBringUp:(BOOL)a3
{
  self->_initialBringUp = a3;
}

- (BOOL)useAutomaticEndpointing
{
  return self->_useAutomaticEndpointing;
}

- (void)setUseAutomaticEndpointing:(BOOL)a3
{
  self->_useAutomaticEndpointing = a3;
}

- (BOOL)useStreamingDictation
{
  return self->_useStreamingDictation;
}

- (void)setUseStreamingDictation:(BOOL)a3
{
  self->_useStreamingDictation = a3;
}

- (NSNumber)homeButtonUpFromBeep
{
  return self->_homeButtonUpFromBeep;
}

- (void)setHomeButtonUpFromBeep:(id)a3
{
  objc_storeStrong((id *)&self->_homeButtonUpFromBeep, a3);
}

- (NSDictionary)continuityInfo
{
  return self->_continuityInfo;
}

- (void)setContinuityInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (AFRequestInfo)requestInfo
{
  return self->_requestInfo;
}

- (void)setRequestInfo:(id)a3
{
  objc_storeStrong((id *)&self->_requestInfo, a3);
}

- (AFSpeechRequestOptions)speechRequestOptions
{
  return self->_speechRequestOptions;
}

- (void)setSpeechRequestOptions:(id)a3
{
  objc_storeStrong((id *)&self->_speechRequestOptions, a3);
}

- (BOOL)acousticIdEnabled
{
  return self->_acousticIdEnabled;
}

- (void)setAcousticIdEnabled:(BOOL)a3
{
  self->_acousticIdEnabled = a3;
}

- (BOOL)releaseAudioSessionOnRecordingCompletion
{
  return self->_releaseAudioSessionOnRecordingCompletion;
}

- (void)setReleaseAudioSessionOnRecordingCompletion:(BOOL)a3
{
  self->_releaseAudioSessionOnRecordingCompletion = a3;
}

- (BOOL)predictedRecordRouteIsZLL
{
  return self->_predictedRecordRouteIsZLL;
}

- (void)setPredictedRecordRouteIsZLL:(BOOL)a3
{
  self->_predictedRecordRouteIsZLL = a3;
}

- (BOOL)isRemotePresentationBringUp
{
  return self->_isRemotePresentationBringUp;
}

- (NSString)uiPresentationIdentifier
{
  return self->_uiPresentationIdentifier;
}

- (void)setUiPresentationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uiPresentationIdentifier, a3);
}

- (NSMutableArray)instrumentationEvents
{
  return self->_instrumentationEvents;
}

- (void)setInstrumentationEvents:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentationEvents, a3);
}

- (NSUUID)previousTurnIdentifier
{
  return self->_previousTurnIdentifier;
}

- (void)setPreviousTurnIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_previousTurnIdentifier, a3);
}

- (NSArray)contextAppInfosForSiriViewController
{
  return self->_contextAppInfosForSiriViewController;
}

- (void)setContextAppInfosForSiriViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contextAppInfosForSiriViewController, a3);
}

- (NSDictionary)testingContext
{
  return self->_testingContext;
}

- (void)setTestingContext:(id)a3
{
  objc_storeStrong((id *)&self->_testingContext, a3);
}

- (unint64_t)currentLockState
{
  return self->_currentLockState;
}

- (void)setCurrentLockState:(unint64_t)a3
{
  self->_currentLockState = a3;
}

- (int64_t)previousInteractionInputType
{
  return self->_previousInteractionInputType;
}

- (void)setPreviousInteractionInputType:(int64_t)a3
{
  self->_previousInteractionInputType = a3;
}

- (NSUUID)activationEventInstrumentationIdenifier
{
  return self->_activationEventInstrumentationIdenifier;
}

- (void)setActivationEventInstrumentationIdenifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSString)startRecordingSoundId
{
  return self->_startRecordingSoundId;
}

- (void)setStartRecordingSoundId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (BOOL)isShortButtonPressAction
{
  return self->_shortButtonPressAction;
}

- (void)setShortButtonPressAction:(BOOL)a3
{
  self->_shortButtonPressAction = a3;
}

- (SASRequestOptions)originalRequestOptions
{
  return self->_originalRequestOptions;
}

- (void)setOriginalRequestOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (int64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(int64_t)a3
{
  self->_presentationMode = a3;
}

- (unint64_t)tvRemoteType
{
  return self->_tvRemoteType;
}

- (void)setTvRemoteType:(unint64_t)a3
{
  self->_tvRemoteType = a3;
}

- (BOOL)isTVRemoteSourcePTTEligible
{
  return self->_isTVRemoteSourcePTTEligible;
}

- (void)setIsTVRemoteSourcePTTEligible:(BOOL)a3
{
  self->_isTVRemoteSourcePTTEligible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRequestOptions, 0);
  objc_storeStrong((id *)&self->_startRecordingSoundId, 0);
  objc_storeStrong((id *)&self->_activationEventInstrumentationIdenifier, 0);
  objc_storeStrong((id *)&self->_testingContext, 0);
  objc_storeStrong((id *)&self->_contextAppInfosForSiriViewController, 0);
  objc_storeStrong((id *)&self->_previousTurnIdentifier, 0);
  objc_storeStrong((id *)&self->_instrumentationEvents, 0);
  objc_storeStrong((id *)&self->_uiPresentationIdentifier, 0);
  objc_storeStrong((id *)&self->_speechRequestOptions, 0);
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_continuityInfo, 0);
  objc_storeStrong((id *)&self->_homeButtonUpFromBeep, 0);
  objc_storeStrong((id *)&self->_currentCarPlaySupportedOEMAppIdList, 0);
  objc_storeStrong((id *)&self->_speechFileURL, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_pronunciationContext, 0);
  objc_storeStrong((id *)&self->_serverCommandId, 0);
  objc_storeStrong((id *)&self->_directActionApplicationContext, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bulletin, 0);
  objc_storeStrong((id *)&self->_activationDeviceIdentifier, 0);
}

- (void)setRequestSource:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[SASRequestOptions setRequestSource:]";
  _os_log_error_impl(&dword_1D132F000, log, OS_LOG_TYPE_ERROR, "%s #activation Cannot set requestSource to SASRequestSourceKeyboard when keyboard input is disabled", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
