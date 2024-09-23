@implementation VMAudioService

+ (VMAudioService)sharedInstance
{
  if (qword_1001ED910 != -1)
    dispatch_once(&qword_1001ED910, &stru_1001AC710);
  return (VMAudioService *)(id)qword_1001ED918;
}

- (void)_registerAudioSessionNotificationsIfNeeded
{
  void *v3;
  id v4;

  if (!self->_audioSessionNotificationsAreRegistered)
  {
    self->_audioSessionNotificationsAreRegistered = 1;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "_handleAudioSessionNotification:", AVAudioSessionInterruptionNotification, v3);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "_handleAudioSessionNotification:", AVAudioSessionMediaServicesWereResetNotification, v3);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "_handleAudioSessionNotification:", AVAudioSessionSilenceSecondaryAudioHintNotification, v3);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "_handleSecondaryQueueAudioSessionNotification:", AVAudioSessionRouteChangeNotification, v3);

  }
}

- (id)_observeUserDefaultsForAudioSettingsChanges
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100064F1C;
  v7[3] = &unk_1001AC1B0;
  objc_copyWeak(&v8, &location);
  v4 = RCObserveChangesToKeyPath(v3, CFSTR("RCVoiceMemosAudioQualityKey"), v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

- (BOOL)isRecording
{
  if (-[VMAudioService mode](self, "mode") == 2)
    return -[VMRecordingEngine isRunning](self->_recordingEngine, "isRunning");
  else
    return 0;
}

- (int)mode
{
  return self->_mode;
}

- (BOOL)isPlaying
{
  return -[VMPlayer playing](self->_player, "playing");
}

- (VMAudioService)init
{
  VMAudioService *v2;
  VMAudioService *v3;
  uint64_t v4;
  RCApplicationModel *recordings;
  dispatch_queue_t v6;
  OS_dispatch_queue *callCenterQueue;
  NSObject *v8;
  VMAudioService *v9;
  uint64_t v10;
  _TtC10VoiceMemos8VMPlayer *player;
  RCRegulatoryLogger *v12;
  RCRegulatoryLogger *regulatoryLogger;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *audioSessionQueue;
  id v18;
  _TtC10VoiceMemos25StereoOrientationProvider *v19;
  _TtP10VoiceMemos27RCStereoOrientationProvider_ *stereoOrientationProvider;
  _QWORD block[4];
  VMAudioService *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)VMAudioService;
  v2 = -[VMAudioService init](&v24, "init");
  v3 = v2;
  if (v2)
  {
    v2->_mode = 0;
    v4 = objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
    recordings = v3->_recordings;
    v3->_recordings = (RCApplicationModel *)v4;

    v6 = dispatch_queue_create("com.apple.VoiceMemos.CallCenterQueue", 0);
    callCenterQueue = v3->_callCenterQueue;
    v3->_callCenterQueue = (OS_dispatch_queue *)v6;

    v8 = v3->_callCenterQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001B78C;
    block[3] = &unk_1001AB588;
    v9 = v3;
    v23 = v9;
    dispatch_async(v8, block);
    v10 = objc_claimAutoreleasedReturnValue(-[VMAudioService _createAndConfigurePlayer](v9, "_createAndConfigurePlayer"));
    player = v9->_player;
    v9->_player = (_TtC10VoiceMemos8VMPlayer *)v10;

    v12 = objc_opt_new(RCRegulatoryLogger);
    regulatoryLogger = v9->_regulatoryLogger;
    v9->_regulatoryLogger = v12;

    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create("com.apple.VoiceMemos.AudioServiceQueue", v15);
    audioSessionQueue = v9->_audioSessionQueue;
    v9->_audioSessionQueue = (OS_dispatch_queue *)v16;

    v18 = -[VMAudioService _observeUserDefaultsForAudioSettingsChanges](v9, "_observeUserDefaultsForAudioSettingsChanges");
    v19 = objc_alloc_init(_TtC10VoiceMemos25StereoOrientationProvider);
    stereoOrientationProvider = v9->_stereoOrientationProvider;
    v9->_stereoOrientationProvider = (_TtP10VoiceMemos27RCStereoOrientationProvider_ *)v19;

  }
  return v3;
}

- (void)_configureAudioSettings
{
  void *v3;
  NSDictionary *v4;
  NSDictionary *audioSettings;
  void *v6;
  unsigned int v7;
  unint64_t v8;
  unint64_t v9;
  UInt32 *v10;
  NSArray *v11;
  uint64_t v12;
  double v13;
  void *v14;
  NSArray *allowedSampleRates;
  NSArray *v16;
  UInt32 outPropertyDataSize;
  unsigned int inSpecifier;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (objc_msgSend(v3, "rc_audioQuality"))
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[VMAudioService losslessAudioSettings](VMAudioService, "losslessAudioSettings"));
  else
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[VMAudioService compressedAudioSettings](VMAudioService, "compressedAudioSettings"));
  audioSettings = self->_audioSettings;
  self->_audioSettings = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_audioSettings, "objectForKeyedSubscript:", AVFormatIDKey));
  v7 = objc_msgSend(v6, "intValue");

  inSpecifier = v7;
  if (v7 == 1633772320)
  {
    outPropertyDataSize = 0;
    if (!AudioFormatGetPropertyInfo(0x61657372u, 4u, &inSpecifier, &outPropertyDataSize))
    {
      v8 = outPropertyDataSize;
      v9 = (unint64_t)outPropertyDataSize >> 4;
      v10 = &outPropertyDataSize - 4 * (outPropertyDataSize >> 4);
      if (!AudioFormatGetProperty(0x61657372u, 4u, &inSpecifier, &outPropertyDataSize, v10))
      {
        v11 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v8 >> 4);
        if (v8 >= 0x10)
        {
          if (v9 <= 1)
            v12 = 1;
          else
            v12 = v9;
          do
          {
            v13 = *(double *)v10;
            v10 += 4;
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13));
            -[NSArray addObject:](v11, "addObject:", v14);

            --v12;
          }
          while (v12);
        }
        allowedSampleRates = self->_allowedSampleRates;
        self->_allowedSampleRates = v11;

      }
    }
  }
  else
  {
    v16 = self->_allowedSampleRates;
    self->_allowedSampleRates = 0;

  }
}

- (void)prepareService
{
  NSObject *audioSessionQueue;
  _QWORD block[5];

  audioSessionQueue = self->_audioSessionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B73C;
  block[3] = &unk_1001AB588;
  block[4] = self;
  dispatch_async(audioSessionQueue, block);
}

- (id)_createAndConfigurePlayer
{
  _TtC10VoiceMemos8VMPlayer *v3;

  v3 = objc_opt_new(_TtC10VoiceMemos8VMPlayer);
  -[VMPlayer setDelegate:](v3, "setDelegate:", self);
  return v3;
}

+ (NSDictionary)compressedAudioSettings
{
  _QWORD v3[2];
  _QWORD v4[2];

  v3[0] = AVFormatIDKey;
  v3[1] = AVEncoderAudioQualityKey;
  v4[0] = &off_1001B72B8;
  v4[1] = &off_1001B72D0;
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2));
}

+ (NSDictionary)losslessAudioSettings
{
  _QWORD v3[2];
  _QWORD v4[2];

  v3[0] = AVFormatIDKey;
  v3[1] = AVEncoderBitDepthHintKey;
  v4[0] = &off_1001B7288;
  v4[1] = &off_1001B72A0;
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2));
}

- (void)vmPlayerError:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = OSLogForCategory(kVMLogCategoryService);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10010C52C();

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayer currentItem](self->_player, "currentItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "controller"));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setPlaybackError:", v4);
    -[VMAudioService stopPlaying:](self, "stopPlaying:", v9);
  }

}

- (BOOL)activateAudioSessionForPlaybackAndReturnError:(id *)a3
{
  NSObject *audioSessionQueue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  audioSessionQueue = self->_audioSessionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064D2C;
  block[3] = &unk_1001AC738;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(audioSessionQueue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)audioEngineOutputNodeAccessQueue
{
  return self->_audioSessionQueue;
}

- (void)isPlayingDidChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[VMPlayer currentItem](self->_player, "currentItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "controller"));
  v5 = v4;
  if (v3)
    v6 = 3;
  else
    v6 = 4;
  objc_msgSend(v4, "setCurrentState:", v6);

}

- (id)_newRecordingEngine
{
  NSObject *audioSessionQueue;
  id v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100064E9C;
  v10 = sub_100064EAC;
  v11 = 0;
  audioSessionQueue = self->_audioSessionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064EB4;
  block[3] = &unk_1001AC760;
  block[4] = &v6;
  dispatch_sync(audioSessionQueue, block);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_configureAudioSettingsIfNeeded
{
  if (!self->_audioSettings)
    -[VMAudioService _configureAudioSettings](self, "_configureAudioSettings");
}

- (void)_updateIsAudioSessionActiveForInterruption:(unint64_t)a3
{
  self->_isAudioSessionActive = a3 != 1;
}

- (void)_activateAudioSessionForPlaybackWithCompletion:(id)a3
{
  -[VMAudioService _activateAudioSessionForRecording:completion:](self, "_activateAudioSessionForRecording:completion:", 0, a3);
}

- (void)_activateAudioSessionForRecordingWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD v14[4];
  NSObject *v15;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[3];
  char v21;
  _QWORD v22[5];
  id v23;

  v4 = a3;
  -[VMAudioService _shutdownPlaybackEngine](self, "_shutdownPlaybackEngine");
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_100064E9C;
  v22[4] = sub_100064EAC;
  v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000651A8;
  v16[3] = &unk_1001AC788;
  v18 = v20;
  v19 = v22;
  v6 = v5;
  v17 = v6;
  -[VMAudioService _activateAudioSessionForRecording:completion:](self, "_activateAudioSessionForRecording:completion:", 1, v16);
  dispatch_group_enter(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingTranscriptionService sharedInstance](RCRecordingTranscriptionService, "sharedInstance"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100065204;
  v14[3] = &unk_1001AB588;
  v8 = v6;
  v15 = v8;
  objc_msgSend(v7, "cancelFileTranscriptionWithCompletionHandler:", v14);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006520C;
  block[3] = &unk_1001AC7B0;
  v11 = v4;
  v12 = v20;
  v13 = v22;
  v9 = v4;
  dispatch_group_notify(v8, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);

}

- (void)_activateAudioSessionForRecording:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *audioSessionQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  audioSessionQueue = self->_audioSessionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000652BC;
  block[3] = &unk_1001AC800;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(audioSessionQueue, block);

}

- (BOOL)__activateAudioSessionOnQueue:(id)a3 recording:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  id *v10;
  id v11;
  id v12;
  id v13;
  unsigned __int8 v14;

  v6 = a4;
  v8 = a3;
  -[VMAudioService _registerAudioSessionNotificationsIfNeeded](self, "_registerAudioSessionNotificationsIfNeeded");
  if (v6)
    v9 = 12;
  else
    v9 = 0x10000;
  v10 = (id *)&AVAudioSessionCategoryPlayAndRecord;
  if (!v6)
    v10 = (id *)&AVAudioSessionCategoryPlayback;
  v11 = *v10;
  if (objc_msgSend(v8, "categoryOptions") == (id)v9)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "category"));
    if (v12 == v11)
    {
      v13 = objc_msgSend(v8, "routeSharingPolicy");

      if (v13 == (id)(v6 ^ 1))
        goto LABEL_14;
    }
    else
    {

    }
  }
  if (self->_isAudioSessionActive)
  {
    self->_isAudioSessionActive = 0;
    objc_msgSend(v8, "setActive:error:", 0, 0);
  }
  if (!objc_msgSend(v8, "setCategory:mode:routeSharingPolicy:options:error:", v11, AVAudioSessionModeDefault, v6 ^ 1, v9, a5))
  {
    v14 = 0;
    goto LABEL_18;
  }
  -[VMAudioService _configureAudioSessionPrefersNoInterruptionsFromSystemAlerts:isRecording:](self, "_configureAudioSessionPrefersNoInterruptionsFromSystemAlerts:isRecording:", v8, v6);
  -[VMAudioService _configureAudioSessionForBTSmartRoutingConsideration:isRecording:](self, "_configureAudioSessionForBTSmartRoutingConsideration:isRecording:", v8, v6);
  -[VMAudioService _configureAudioSessionStereoInput:isRecording:](self, "_configureAudioSessionStereoInput:isRecording:", v8, v6);
LABEL_14:
  if (self->_isAudioSessionActive)
  {
    v14 = 1;
  }
  else
  {
    v14 = objc_msgSend(v8, "setActive:withOptions:error:", 1, 0, a5);
    self->_isAudioSessionActive = v14;
  }
LABEL_18:

  return v14;
}

- (void)_configureAudioSessionPrefersNoInterruptionsFromSystemAlerts:(id)a3 isRecording:(BOOL)a4
{
  unsigned __int8 v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;

  v8 = 0;
  v4 = objc_msgSend(a3, "setPrefersNoInterruptionsFromSystemAlerts:error:", a4, &v8);
  v5 = v8;
  if ((v4 & 1) == 0)
  {
    v6 = OSLogForCategory(kVMLogCategoryDefault);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10010C598();

  }
}

- (void)_configureAudioSessionForBTSmartRoutingConsideration:(id)a3 isRecording:(BOOL)a4
{
  unsigned __int8 v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;

  v8 = 0;
  v4 = objc_msgSend(a3, "setEligibleForBTSmartRoutingConsideration:error:", !a4, &v8);
  v5 = v8;
  if ((v4 & 1) == 0)
  {
    v6 = OSLogForCategory(kVMLogCategoryDefault);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10010C604();

  }
}

- (void)_configureAudioSessionStereoInput:(id)a3 isRecording:(BOOL)a4
{
  unsigned __int8 v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;

  if (a4)
  {
    v8 = 0;
    v4 = -[VMAudioService _updateStereoOrientation:](self, "_updateStereoOrientation:", &v8);
    v5 = v8;
    if ((v4 & 1) == 0)
    {
      v6 = OSLogForCategory(kVMLogCategoryDefault);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_10010C670();

    }
  }
}

- (BOOL)_updateStereoOrientation:(id *)a3
{
  void *v5;
  unsigned int v6;

  if (!RCStereoRecordingIsAvailable(self, a2))
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("RCVoiceMemosStereoRecordingKey"));

  if (v6)
    return -[VMAudioService _enableStereo:](self, "_enableStereo:", a3);
  else
    return -[VMAudioService _disableStereo:](self, "_disableStereo:", a3);
}

- (id)_dataSourceSupportingStereo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "availableInputs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_firstObjectPassingTest:", &stru_1001AC840));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataSources"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "na_filter:", &stru_1001AC880));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RCStereoOrientationProvider preferredDataSourceOrientation](self->_stereoOrientationProvider, "preferredDataSourceOrientation"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000658F8;
  v15[3] = &unk_1001AC8A8;
  v16 = v8;
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "na_firstObjectPassingTest:", v15));
  v11 = v10;
  if (v10)
    v12 = v10;
  else
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  v13 = v12;

  return v13;
}

- (BOOL)_disableStereo:(id *)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioService _dataSourceSupportingStereo](self, "_dataSourceSupportingStereo"));
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "setPreferredPolarPattern:error:", 0, a3);
  else
    v6 = 1;

  return v6;
}

- (BOOL)_enableStereo:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSErrorUserInfoKey v11;
  const __CFString *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioService _dataSourceSupportingStereo](self, "_dataSourceSupportingStereo"));
  if (!v5)
  {
    if (!a3)
      goto LABEL_7;
    v8 = RCVoiceMemosErrorDomain;
    v11 = NSLocalizedDescriptionKey;
    v12 = CFSTR("Built in mic does not support stereo");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v8, 1, v9));

LABEL_6:
    LOBYTE(a3) = 0;
    goto LABEL_7;
  }
  v6 = -[RCStereoOrientationProvider preferredInputOrientationFor:](self->_stereoOrientationProvider, "preferredInputOrientationFor:", v5);
  if (!objc_msgSend(v5, "setPreferredPolarPattern:error:", AVAudioSessionPolarPatternStereo, a3))
    goto LABEL_6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  LOBYTE(a3) = objc_msgSend(v7, "setPreferredInputOrientation:error:", v6, a3);

LABEL_7:
  return (char)a3;
}

- (void)_deactivateAudioSessionAsync:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  NSObject *audioSessionQueue;
  _QWORD v10[5];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayer currentItem](self->_player, "currentItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "controller"));
  v7 = v6;
  if (v6 && objc_msgSend(v6, "currentState") == 3)
    -[VMAudioService pausePlaying:](self, "pausePlaying:", v7);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100065BA4;
  v10[3] = &unk_1001AB588;
  v10[4] = self;
  v8 = objc_retainBlock(v10);
  audioSessionQueue = self->_audioSessionQueue;
  if (v3)
    dispatch_async(audioSessionQueue, v8);
  else
    dispatch_sync(audioSessionQueue, v8);

}

- (void)deactivateAudioSession
{
  -[VMAudioService _deactivateAudioSessionAsync:](self, "_deactivateAudioSessionAsync:", 0);
}

- (void)_handleSecondaryQueueAudioSessionNotification:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100065C80;
  v4[3] = &unk_1001AB6E8;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)_handleAudioSessionNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  VMAudioEngine *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  unsigned int v20;
  VMAudioEngine *v21;
  void *v22;
  unsigned __int8 v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  _TtC10VoiceMemos8VMPlayer *player;
  _TtC10VoiceMemos8VMPlayer *v28;
  _TtC10VoiceMemos8VMPlayer *v29;
  void *v30;
  unsigned __int8 v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  id v35;
  uint64_t v36;
  NSObject *v37;
  id v38;
  id v39;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v7 = kVMLogCategoryRoute;
  v8 = OSLogForCategory(kVMLogCategoryRoute);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10010C890();

  if (objc_msgSend(v5, "isEqualToString:", AVAudioSessionRouteChangeNotification))
  {
    v10 = (VMAudioEngine *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", AVAudioSessionRouteChangeReasonKey));
    v12 = objc_msgSend(v11, "integerValue");

    v13 = OSLogForCategory(v7);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sub_10010C6DC((uint64_t)v12, v10, v14);

    if (-[VMAudioService mode](self, "mode") == 2
      && -[VMRecordingEngine isRunning](self->_recordingEngine, "isRunning"))
    {
      if ((unint64_t)v12 > 2)
      {
LABEL_46:

        goto LABEL_47;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[VMRecordingEngine controller](self->_recordingEngine, "controller"));
      if (v15)
        -[VMAudioService stopRecordingWithController:error:](self, "stopRecordingWithController:error:", v15, 0);

    }
    if (v12 != (id)2 || !-[VMPlayer playing](self->_player, "playing"))
      goto LABEL_46;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayer currentItem](self->_player, "currentItem"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "controller"));
    -[VMAudioService pausePlaying:](self, "pausePlaying:", v17);
LABEL_15:

LABEL_45:
    goto LABEL_46;
  }
  if (objc_msgSend(v5, "isEqualToString:", AVAudioSessionInterruptionNotification))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", AVAudioSessionInterruptionTypeKey));
    v19 = objc_msgSend(v18, "integerValue");

    -[VMAudioService _updateIsAudioSessionActiveForInterruption:](self, "_updateIsAudioSessionActiveForInterruption:", v19);
    if (v19 == (id)1)
    {
      v20 = -[VMAudioService mode](self, "mode");
      v21 = (VMAudioEngine *)objc_claimAutoreleasedReturnValue(-[VMPlayer currentItem](self->_player, "currentItem"));
      v10 = v21;
      if (v21)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioEngine controller](v21, "controller"));
        self->_lastInterruptionStoppedPlayer = objc_msgSend(v22, "targetState") == 3;

      }
      else
      {
        self->_lastInterruptionStoppedPlayer = 0;
      }
      if (-[VMPlayer playing](self->_player, "playing"))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayer currentItem](self->_player, "currentItem"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "controller"));
        -[VMAudioService pausePlaying:](self, "pausePlaying:", v33);

      }
      if (v20 != 2)
        goto LABEL_46;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[VMRecordingEngine controller](self->_recordingEngine, "controller"));
      if (v16)
      {
        v39 = 0;
        v34 = -[VMAudioService stopRecordingWithController:error:](self, "stopRecordingWithController:error:", v16, &v39);
        v35 = v39;
        if ((v34 & 1) == 0)
        {
          v36 = OSLogForCategory(kVMLogCategoryService);
          v37 = objc_claimAutoreleasedReturnValue(v36);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            sub_10010C7B8();

        }
      }
      goto LABEL_45;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", AVAudioSessionInterruptionOptionKey));
    v31 = objc_msgSend(v30, "integerValue");

    if ((v31 & 1) != 0 && self->_lastInterruptionStoppedPlayer)
    {
      v10 = (VMAudioEngine *)objc_claimAutoreleasedReturnValue(-[VMPlayer currentItem](self->_player, "currentItem"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioEngine controller](v10, "controller"));
      objc_msgSend(v16, "targetRate");
      -[VMAudioService _startPlaybackAtRate:immediately:](self, "_startPlaybackAtRate:immediately:", 0);
      goto LABEL_45;
    }
  }
  else if (objc_msgSend(v5, "isEqualToString:", AVAudioSessionMediaServicesWereResetNotification))
  {
    -[VMAudioService _deactivateAudioSessionAsync:](self, "_deactivateAudioSessionAsync:", 0);
    v10 = self->_currentEngine;
    if (v10 && -[VMAudioService mode](self, "mode") == 1)
    {
      v38 = 0;
      v23 = -[VMAudioEngine startAndReturnError:](v10, "startAndReturnError:", &v38);
      v24 = v38;
      if ((v23 & 1) == 0)
      {
        v25 = OSLogForCategory(v7);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          sub_10010C824();

      }
    }
    player = self->_player;
    if (!player)
      goto LABEL_46;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayer currentItem](player, "currentItem"));
    v28 = (_TtC10VoiceMemos8VMPlayer *)objc_claimAutoreleasedReturnValue(-[VMAudioService _createAndConfigurePlayer](self, "_createAndConfigurePlayer"));
    v29 = self->_player;
    self->_player = v28;

    if (!v16 || -[VMAudioService mode](self, "mode") != 1)
      goto LABEL_45;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "controller"));
    objc_msgSend(v17, "setPlayerItem:", 0);
    -[VMAudioService startPlaying:](self, "startPlaying:", v17);
    goto LABEL_15;
  }
LABEL_47:

}

- (BOOL)_switchEngine:(id)a3 audioSettings:(id)a4 error:(id *)a5
{
  VMAudioEngine *v9;
  id v10;
  VMAudioEngine *v11;
  VMAudioEngine *v12;
  void *v13;
  VMAudioEngine *v14;
  unsigned int v15;

  v9 = (VMAudioEngine *)a3;
  v10 = a4;
  v11 = self->_currentEngine;
  if (v11 == v9)
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    if (v12)
    {
      -[VMAudioEngine stop](v12, "stop");
      -[VMAudioEngine shutdown](v12, "shutdown");
      objc_msgSend(v13, "removeObserver:name:object:", self, AVAudioEngineConfigurationChangeNotification, v12);
    }
    objc_storeStrong((id *)&self->_currentEngine, a3);
    v14 = v9;

    v15 = -[VMAudioEngine configureWithAudioSettings:error:](v14, "configureWithAudioSettings:error:", v10, a5);
    if (v15)
      objc_msgSend(v13, "addObserver:selector:name:object:", v14, "handleConfigurationChangeNotification:", AVAudioEngineConfigurationChangeNotification, v14);

  }
  return v15;
}

- (void)_shutdownEngine
{
  void *v3;
  VMAudioEngine *currentEngine;
  VMAudioEngine *v5;

  v5 = self->_currentEngine;
  if (v5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:name:object:", v5, AVAudioEngineConfigurationChangeNotification, v5);
    -[VMAudioEngine stop](v5, "stop");
    -[VMAudioEngine shutdown](v5, "shutdown");

  }
  currentEngine = self->_currentEngine;
  self->_currentEngine = 0;

}

- (void)_schedulePlayback:(id)a3
{
  id v4;
  void *v5;
  _TtC10VoiceMemos8VMPlayer *v6;
  RCKeyPathObservance *recordingEnhancedObservance;
  RCKeyPathObservance *v8;
  RCApplicationModel *recordings;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  RCKeyPathObservance *v14;
  RCKeyPathObservance *v15;
  double v16;
  id v17;
  _TtC10VoiceMemos8VMPlayer *v18;
  _QWORD v19[5];
  id v20;
  _TtC10VoiceMemos8VMPlayer *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  _TtC10VoiceMemos8VMPlayer *v25;
  id v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playerItem"));
  if (v5)
  {
    v6 = self->_player;
    recordingEnhancedObservance = self->_recordingEnhancedObservance;
    if (recordingEnhancedObservance)
    {
      -[RCKeyPathObservance remove](recordingEnhancedObservance, "remove");
      v8 = self->_recordingEnhancedObservance;
      self->_recordingEnhancedObservance = 0;

    }
    recordings = self->_recordings;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordingID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel recordingWithUniqueID:](recordings, "recordingWithUniqueID:", v10));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "enhanced"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100066488;
      v24[3] = &unk_1001AC8D0;
      v25 = v6;
      v26 = v11;
      v13 = RCObserveChangesToKeyPath(v26, v12, v24);
      v14 = (RCKeyPathObservance *)objc_claimAutoreleasedReturnValue(v13);
      v15 = self->_recordingEnhancedObservance;
      self->_recordingEnhancedObservance = v14;

    }
    objc_msgSend(v4, "playableRange");
    objc_msgSend(v5, "setPlayableRangeEndTime:", v16);
    objc_msgSend(v4, "setCurrentState:", 2);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000664B4;
    v19[3] = &unk_1001AC920;
    v19[4] = self;
    v20 = v4;
    v21 = v6;
    v22 = v5;
    v23 = v11;
    v17 = v11;
    v18 = v6;
    -[VMPlayer prepareItem:withCompletionHandler:](v18, "prepareItem:withCompletionHandler:", v22, v19);

  }
}

- (void)_shutdownPlaybackEngine
{
  _TtC10VoiceMemos8VMPlayer *player;
  void *v4;
  void *v5;
  VMPlaybackController *preparingToPlayController;
  VMPlaybackController *v7;
  id v8;

  player = self->_player;
  if (player)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayer currentItem](player, "currentItem"));
    v8 = v4;
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "controller"));
      -[VMAudioService stopPlaying:](self, "stopPlaying:", v5);

      v4 = v8;
    }
    preparingToPlayController = self->_preparingToPlayController;
    if (preparingToPlayController)
    {
      self->_preparingToPlayController = 0;
      v7 = preparingToPlayController;

      -[VMAudioService stopPlaying:](self, "stopPlaying:", v7);
      v4 = v8;
    }

  }
}

- (id)playerForRecordingID:(id)a3
{
  id v4;
  VMAudioPlayerImp *v5;

  v4 = a3;
  v5 = objc_opt_new(VMAudioPlayerImp);
  -[VMAudioPlayerImp setRecordingID:](v5, "setRecordingID:", v4);
  -[VMAudioPlayerImp setService:](v5, "setService:", self);
  -[VMAudioPlayerImp setTargetState:](v5, "setTargetState:", 4);
  -[VMAudioService _updateNewVMAudioPlayer:withPropertiesForRecordingID:](self, "_updateNewVMAudioPlayer:withPropertiesForRecordingID:", v5, v4);

  -[VMAudioService startPlaying:](self, "startPlaying:", v5);
  return v5;
}

- (void)_updateNewVMAudioPlayer:(id)a3 withPropertiesForRecordingID:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000668C0;
  v10[3] = &unk_1001ABD30;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
  v12 = v6;
  v13 = v5;
  v7 = v5;
  v8 = v6;
  v9 = v11;
  objc_msgSend(v9, "performBlockAndWait:", v10);

}

- (id)newRecorderWithTitleBase:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[VMAudioRecorderImp _initWithRecordingID:model:]([VMAudioRecorderImp alloc], "_initWithRecordingID:model:", 0, self->_recordings);
  objc_msgSend(v5, "setIsNewRecording:", 1);
  objc_msgSend(v5, "setService:", self);
  objc_msgSend(v5, "setTitleBase:", v4);

  return v5;
}

- (id)recorderForRecordingID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[VMAudioRecorderImp _initWithRecordingID:model:]([VMAudioRecorderImp alloc], "_initWithRecordingID:model:", v4, self->_recordings);

  objc_msgSend(v5, "setService:", self);
  return v5;
}

- (VMAudioRecorder)activeAudioRecorder
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioService recordingController](self, "recordingController"));
  v3 = v2;
  if (v2 && objc_msgSend(v2, "conformsToProtocol:", &OBJC_PROTOCOL___VMAudioRecorder))
    v4 = v3;
  else
    v4 = 0;

  return (VMAudioRecorder *)v4;
}

- (id)_assetForRecording:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCComposition compositionLoadedForSavedRecording:](RCComposition, "compositionLoadedForSavedRecording:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playableAsset:", a4));

  return v6;
}

- (BOOL)shouldWaitForAccessTokenBeforeStartingRecording:(id)a3
{
  VMPlaybackController *preparingToPlayController;
  id v4;
  void *v5;
  void *v6;

  preparingToPlayController = self->_preparingToPlayController;
  if (preparingToPlayController)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlaybackController recordingID](preparingToPlayController, "recordingID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordingID"));

    LOBYTE(preparingToPlayController) = v5 == v6;
  }
  return (char)preparingToPlayController;
}

- (void)startPlaying:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id location;
  _QWORD v23[5];
  id v24;
  const __CFString *v25;
  void *v26;

  v5 = a3;
  if (-[VMAudioService mode](self, "mode") == 2)
  {
    v25 = CFSTR("VMAudioErrorModeKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[VMAudioService mode](self, "mode")));
    v26 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("VMAudioServiceErrorDomain"), 1, v7));

    objc_msgSend(v5, "setPlaybackError:", v8);
  }
  else
  {
    if (objc_msgSend(v5, "targetState") == 3)
    {
      objc_msgSend(v5, "targetRate");
      if (v9 > 0.0)
        -[VMAudioService _activateAudioSessionForPlaybackWithCompletion:](self, "_activateAudioSessionForPlaybackWithCompletion:", 0);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playerItem"));
    if (v10)
    {
      v11 = objc_msgSend(v5, "currentState");
      if (v11 == 4)
      {
        objc_msgSend(v5, "targetTime");
        v16 = v15;
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100066E68;
        v23[3] = &unk_1001ABD08;
        v23[4] = self;
        v24 = v5;
        objc_msgSend(v10, "seekToTime:completionHandler:", v23, v16);

      }
      else if (v11 == 2)
      {
        objc_msgSend(v5, "targetState");
      }
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel recordingWithUniqueID:](self->_recordings, "recordingWithUniqueID:", v8));
      if (v12)
      {
        if (objc_msgSend(v5, "currentState") != 1)
        {
          objc_msgSend(v5, "setCurrentState:", 1);
          objc_initWeak(&location, v5);
          objc_storeStrong((id *)&self->_preparingToPlayController, a3);
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[RCSSavedRecordingService sharedService](RCSSavedRecordingService, "sharedService"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "url"));
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_100066E98;
          v19[3] = &unk_1001AC948;
          objc_copyWeak(&v21, &location);
          v19[4] = self;
          v20 = v12;
          objc_msgSend(v13, "prepareToPreviewCompositionAVURL:accessRequestHandler:", v14, v19);

          objc_destroyWeak(&v21);
          objc_destroyWeak(&location);
        }
      }
      else
      {
        v17 = OSLogForCategory(kVMLogCategoryService);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_10010C908();

      }
    }

  }
}

- (BOOL)pausePlaying:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playerItem"));
  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayer currentItem](self->_player, "currentItem")),
        v6,
        v6 == v5))
  {
    -[VMPlayer pause](self->_player, "pause");
  }
  else
  {
    objc_msgSend(v4, "setCurrentState:", 4);
  }

  return 1;
}

- (BOOL)stopPlaying:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playerItem"));
  if (v5)
  {
    objc_msgSend(v4, "setTargetState:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayer currentItem](self->_player, "currentItem"));

    if (v5 == v6)
      -[VMPlayer replaceCurrentItemWithPlayerItem:](self->_player, "replaceCurrentItemWithPlayerItem:", 0);
    objc_msgSend(v4, "setPlayerItem:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playbackToken"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[RCSSavedRecordingService sharedService](RCSSavedRecordingService, "sharedService"));
    v14 = 0;
    v9 = objc_msgSend(v8, "endAccessSessionWithToken:error:", v7, &v14);
    v10 = v14;

    if ((v9 & 1) == 0)
    {
      v11 = OSLogForCategory(kVMLogCategoryService);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10010C974();

    }
    objc_msgSend(v4, "setPlaybackToken:", 0);

  }
  objc_msgSend(v4, "setCurrentState:", 0);

  return 0;
}

- (BOOL)setTargetRate:(float)a3 controller:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  _QWORD v12[4];
  float v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordingID"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000672FC;
  v12[3] = &unk_1001AC968;
  v13 = a3;
  -[VMAudioService _updateRecordingWithUniqueID:updateBlock:](self, "_updateRecordingWithUniqueID:updateBlock:", v7, v12);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playerItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayer currentItem](self->_player, "currentItem"));

  if (v9 == v8)
  {
    *(float *)&v10 = a3;
    -[VMPlayer setTargetRate:](self->_player, "setTargetRate:", v10);
  }

  return v9 == v8;
}

- (BOOL)setSilenceRemoverEnabled:(BOOL)a3 controller:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  BOOL v12;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordingID"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000673DC;
  v11[3] = &unk_1001AC988;
  v12 = v4;
  -[VMAudioService _updateRecordingWithUniqueID:updateBlock:](self, "_updateRecordingWithUniqueID:updateBlock:", v7, v11);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playerItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayer currentItem](self->_player, "currentItem"));

  if (v9 == v8)
    -[VMPlayer setSilenceRemoverEnabled:](self->_player, "setSilenceRemoverEnabled:", v4);

  return v9 == v8;
}

- (void)_updateRecordingWithUniqueID:(id)a3 updateBlock:(id)a4
{
  id v6;
  id v7;
  RCApplicationModel *recordings;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  recordings = self->_recordings;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100067490;
  v11[3] = &unk_1001AC270;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[RCApplicationModel performBlockAndWait:](recordings, "performBlockAndWait:", v11);

}

- (void)_startPlaybackAtRate:(float)a3 immediately:(BOOL)a4
{
  _TtC10VoiceMemos8VMPlayer *player;
  RCRegulatoryLogger *regulatoryLogger;
  double v7;
  _TtC10VoiceMemos8VMPlayer *v8;

  player = self->_player;
  if (player)
  {
    regulatoryLogger = self->_regulatoryLogger;
    v8 = player;
    -[RCRegulatoryLogger readingAudioData](regulatoryLogger, "readingAudioData");
    *(float *)&v7 = a3;
    -[VMPlayer setTargetRate:](v8, "setTargetRate:", v7);
    -[VMPlayer play](v8, "play");

  }
}

- (BOOL)setTime:(double)a3 controller:(id)a4
{
  id v6;
  void *v7;
  _TtC10VoiceMemos8VMPlayer *v8;
  _TtC10VoiceMemos8VMPlayer *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[4];
  _TtC10VoiceMemos8VMPlayer *v14;
  id v15;
  id v16;
  double v17;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "playerItem"));
  v8 = self->_player;
  v9 = v8;
  if (v7
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayer currentItem](v8, "currentItem")),
        v10,
        v10 == v7))
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100067668;
    v13[3] = &unk_1001AC9B0;
    v14 = v9;
    v15 = v7;
    v16 = v6;
    v17 = a3;
    objc_msgSend(v15, "seekToTime:completionHandler:", v13, a3);

    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_closestAllowedSampleRate:(double)a3 allowedSampleRates:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _UNKNOWN **v9;
  uint64_t v10;
  double v11;
  void *i;
  void *v13;
  double v14;
  double v15;
  _UNKNOWN **v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v19;
      v11 = 1.79769313e308;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v13, "doubleValue");
          v15 = vabdd_f64(a3, v14);
          if (v15 < v11)
          {
            v16 = v13;

            v11 = v15;
            v9 = v16;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
  }
  else if (a3 <= 384000.0)
  {
    v9 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  }
  else
  {
    v9 = &off_1001B75F8;
  }

  return v9;
}

- (id)_recordingSettingsForAudioEngine:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *audioSessionQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100064E9C;
  v25 = sub_100064EAC;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100064E9C;
  v19 = sub_100064EAC;
  v20 = 0;
  audioSessionQueue = self->_audioSessionQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100067984;
  v11[3] = &unk_1001AC9D8;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v13 = &v21;
  v14 = &v15;
  dispatch_sync(audioSessionQueue, v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (void)_prepareWithRecordingEngine:(id)a3 controller:(id)a4 assetWriter:(id)a5
{
  VMRecordingEngine *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  VMRecordingEngine *recordingEngine;
  VMRecordingEngine *v16;
  id v17;

  v8 = (VMRecordingEngine *)a3;
  v17 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "waveformDataSource"));

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "url"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[RCWaveform waveformURLForAVURL:](RCWaveform, "waveformURLForAVURL:", v11));

    v13 = objc_msgSend(objc_alloc((Class)RCWaveformGenerator), "initWithSegmentFlushInterval:", 0.0);
    v14 = objc_msgSend(objc_alloc((Class)RCWaveformDataSource), "initWithWaveformGenerator:generatedWaveformOutputURL:", v13, v12);
    objc_msgSend(v14, "beginLoading");
    objc_msgSend(v17, "setWaveformDataSource:", v14);

  }
  recordingEngine = self->_recordingEngine;
  self->_recordingEngine = v8;
  v16 = v8;

  -[VMRecordingEngine setAssetWriter:](self->_recordingEngine, "setAssetWriter:", v9);
  -[VMRecordingEngine setController:](self->_recordingEngine, "setController:", v17);

}

- (void)_shutdownRecordingEngine
{
  VMRecordingEngine *recordingEngine;

  recordingEngine = self->_recordingEngine;
  if (recordingEngine)
  {
    if ((VMRecordingEngine *)self->_currentEngine == recordingEngine)
    {
      -[VMAudioService _shutdownEngine](self, "_shutdownEngine");
      recordingEngine = self->_recordingEngine;
    }
    self->_recordingEngine = 0;

  }
}

- (void)_playStartRecordingSoundEffectThenStartRecording:(id)a3 controller:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  VMAudioService *v11;
  id v12;

  v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100067DB0;
  v9[3] = &unk_1001ABD30;
  v10 = a4;
  v11 = self;
  v12 = v6;
  v7 = v6;
  v8 = v10;
  +[VMAudioService playStartRecordingSoundEffect:](VMAudioService, "playStartRecordingSoundEffect:", v9);

}

- (void)startRecordingWithController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  RCActivityWaveformProcessor *v10;
  _QWORD v11[5];
  id v12;
  const __CFString *v13;
  void *v14;

  v4 = a3;
  if (-[VMAudioService mode](self, "mode") == 2)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[VMRecordingEngine controller](self->_recordingEngine, "controller"));

    if (v5 == v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("VMAudioServiceErrorDomain"), 4, 0));
    }
    else
    {
      v13 = CFSTR("VMAudioErrorModeKey");
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[VMAudioService mode](self, "mode")));
      v14 = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("VMAudioServiceErrorDomain"), 1, v7));

    }
    objc_msgSend(v4, "setRecordingError:", v8);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    objc_msgSend(v4, "setRecordingID:", v9);
    v10 = objc_alloc_init(RCActivityWaveformProcessor);
    objc_msgSend(v4, "setActivityWaveformProcessor:", v10);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100068084;
    v11[3] = &unk_1001ACA00;
    v11[4] = self;
    v12 = v4;
    -[VMAudioService _activateAudioSessionForRecordingWithCompletion:](self, "_activateAudioSessionForRecordingWithCompletion:", v11);

  }
}

- (BOOL)_startRecordingWithController:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v20;
  _QWORD *v21;
  id v22;
  _QWORD block[4];
  id v24;
  VMAudioService *v25;
  id v26;
  _QWORD *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[2];
  _QWORD v31[2];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RCSavedRecordingsModel standardURLForRecordingWithCreationDate:](RCSavedRecordingsModel, "standardURLForRecordingWithCreationDate:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCSSavedRecordingService sharedService](RCSSavedRecordingService, "sharedService"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "prepareToCaptureToCompositionAVURL:error:", v8, a4));
  if (v10)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000684C4;
    v28[3] = &unk_1001ACA28;
    v11 = v9;
    v29 = v11;
    v21 = objc_retainBlock(v28);
    v22 = -[VMAudioService _newRecordingEngine](self, "_newRecordingEngine");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioService _recordingSettingsForAudioEngine:error:](self, "_recordingSettingsForAudioEngine:error:"));
    if (v12)
    {
      v31[0] = v7;
      v30[0] = CFSTR("date");
      v30[1] = CFSTR("uniqueID");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordingID"));
      v31[1] = v13;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 2));

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "openAudioFile:settings:metadata:error:", v8, v12, v20, a4));
      if (v14)
      {
        objc_msgSend(v6, "setRecordingURL:", v8);
        objc_msgSend(v6, "setRecordingDate:", v7);
        -[VMAudioService _prepareWithRecordingEngine:controller:assetWriter:](self, "_prepareWithRecordingEngine:controller:assetWriter:", v22, v6, v14);
        if (-[VMAudioService _switchEngine:audioSettings:error:](self, "_switchEngine:audioSettings:error:", self->_recordingEngine, v12, a4))
        {
          -[VMAudioService setMode:](self, "setMode:", 2);
          objc_msgSend(v6, "setCurrentState:", 2);
          objc_msgSend(v6, "setRecordingToken:", v10);

          v15 = objc_claimAutoreleasedReturnValue(-[VMRecordingEngine group](self->_recordingEngine, "group"));
          dispatch_group_enter(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "waveformDataSource"));
          v17 = v16 == 0;

          if (!v17)
            dispatch_group_enter(v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordingID", v20));
          -[VMAudioService _playStartRecordingSoundEffectThenStartRecording:controller:](self, "_playStartRecordingSoundEffectThenStartRecording:controller:", v18, v6);

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10006854C;
          block[3] = &unk_1001ACA50;
          v27 = v21;
          v24 = v6;
          v25 = self;
          v26 = v14;
          dispatch_group_notify(v15, (dispatch_queue_t)&_dispatch_main_q, block);

          v10 = 0;
        }
      }

    }
    ((void (*)(_QWORD *, void *))v21[2])(v21, v10);

  }
  return 0;
}

- (BOOL)stopRecording:(id)a3 error:(id *)a4
{
  id v6;

  v6 = a3;
  RCCurrentMediaTime();
  LOBYTE(a4) = -[VMAudioService stopRecording:atTime:error:](self, "stopRecording:atTime:error:", v6, a4);

  return (char)a4;
}

- (BOOL)stopRecording:(id)a3 atTime:(double)a4 error:(id *)a5
{
  id v8;
  VMRecordingEngine *v9;
  VMRecordingEngine *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  unsigned int v14;
  BOOL v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  VMRecordingEngine *v20;
  VMAudioService *v21;
  id v22;
  id v23;
  const __CFString *v24;
  VMRecordingEngine *v25;

  v8 = a3;
  if (-[VMAudioService mode](self, "mode") == 2)
  {
    v9 = self->_recordingEngine;
    v10 = v9;
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[VMRecordingEngine controller](v9, "controller"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordingID"));
      v13 = objc_msgSend(v12, "isEqualToString:", v8);

      if ((v13 & 1) != 0)
      {
        v14 = objc_msgSend(v11, "currentState");
        v15 = 1;
        if (v14 && v14 != 3)
        {
          objc_msgSend(v11, "setCurrentState:", 3);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[VMRecordingEngine assetWriter](v10, "assetWriter"));
          v15 = v16 != 0;
          if (v16)
          {
            v19[0] = _NSConcreteStackBlock;
            v19[1] = 3221225472;
            v19[2] = sub_100068A38;
            v19[3] = &unk_1001AB900;
            v20 = v10;
            v21 = self;
            v22 = v16;
            v23 = v11;
            -[VMRecordingEngine stopRecordingAtTime:completion:](v20, "stopRecordingAtTime:completion:", v19, a4);

          }
        }
      }
      else
      {
        v15 = 0;
        if (a5)
          *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("VMAudioServiceErrorDomain"), 4, 0));
      }

      goto LABEL_18;
    }
    if (a5)
    {
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("VMAudioServiceErrorDomain"), 3, 0));
      goto LABEL_18;
    }
LABEL_11:
    v15 = 0;
LABEL_18:

    goto LABEL_19;
  }
  if (a5)
  {
    v24 = CFSTR("VMAudioErrorModeKey");
    v10 = (VMRecordingEngine *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", -[VMAudioService mode](self, "mode")));
    v25 = v10;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("VMAudioServiceErrorDomain"), 1, v17));

    goto LABEL_11;
  }
  v15 = 0;
LABEL_19:

  return v15;
}

- (BOOL)stopRecordingWithController:(id)a3 error:(id *)a4
{
  id v6;

  v6 = a3;
  RCCurrentMediaTime();
  LOBYTE(a4) = -[VMAudioService stopRecordingWithController:atTime:error:](self, "stopRecordingWithController:atTime:error:", v6, a4);

  return (char)a4;
}

- (BOOL)stopRecordingWithController:(id)a3 atTime:(double)a4 error:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;
  void *v11;

  v8 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[VMRecordingEngine controller](self->_recordingEngine, "controller"));

  if (v9 == v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordingID"));
    v10 = -[VMAudioService stopRecording:atTime:error:](self, "stopRecording:atTime:error:", v11, a5, a4);

  }
  else
  {
    v10 = 0;
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("VMAudioServiceErrorDomain"), 4, 0));
  }

  return v10;
}

- (void)simulateRecordingError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMRecordingEngine group](self->_recordingEngine, "group"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMRecordingEngine controller](self->_recordingEngine, "controller"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordingID"));
  objc_msgSend(v4, "setRecordingID:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCSSavedRecordingService sharedService](RCSSavedRecordingService, "sharedService"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMRecordingEngine assetWriter](self->_recordingEngine, "assetWriter"));
  v14 = 0;
  v8 = objc_msgSend(v6, "closeAudioFile:error:", v7, &v14);
  v9 = v14;

  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel recordingWithUniqueID:](self->_recordings, "recordingWithUniqueID:", v5));
    if (v10)
      -[RCApplicationModel eraseRecording:](self->_recordings, "eraseRecording:", v10);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100069020;
    v12[3] = &unk_1001ACAC8;
    v12[4] = self;
    v13 = v3;
    v11 = +[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 1, v12, 1.0);

  }
}

- (id)deviceSampleRates:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioDevice defaultInputAndReturnError:](VMAudioDevice, "defaultInputAndReturnError:"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioDevice defaultOutputAndReturnError:](VMAudioDevice, "defaultOutputAndReturnError:", a3));
    if (v5)
    {
      v10[0] = CFSTR("input");
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sampleRates"));
      v10[1] = CFSTR("output");
      v11[0] = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sampleRates"));
      v11[1] = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)configureInputSampleRate:(double)a3 outputSampleRate:(double)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  BOOL v14;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioDevice defaultInputAndReturnError:](VMAudioDevice, "defaultInputAndReturnError:"));
  v9 = v8;
  if (v8
    && ((objc_msgSend(v8, "sampleRate"), v10 == a3) || objc_msgSend(v9, "setSampleRate:error:", a5, a3)))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioDevice defaultOutputAndReturnError:](VMAudioDevice, "defaultOutputAndReturnError:", a5));
    v12 = v11;
    v14 = 0;
    if (v11)
    {
      objc_msgSend(v11, "sampleRate");
      if (v13 == a4 || objc_msgSend(v12, "setSampleRate:error:", a5, a4))
        v14 = 1;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (VMRecordingController)recordingController
{
  return -[VMRecordingEngine controller](self->_recordingEngine, "controller");
}

- (id)_fetchRecording:(id)a3 recordingController:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  RCApplicationModel *recordings;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[RCApplicationModel recordingWithUniqueID:](self->_recordings, "recordingWithUniqueID:", v6));
  v9 = (void *)v8;
  if (v7 && !v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordingID"));
    v11 = objc_msgSend(v10, "isEqualToString:", v6);

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordingURL"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordingDate"));
      objc_msgSend(v7, "currentDuration");
      v15 = v14;
      recordings = self->_recordings;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleBase"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel insertRecordingWithAudioFile:duration:date:customTitleBase:uniqueID:](recordings, "insertRecordingWithAudioFile:duration:date:customTitleBase:uniqueID:", v17, v13, v18, v6, v15));

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)fetchRecording:(id)a3
{
  VMRecordingEngine *recordingEngine;
  id v5;
  void *v6;
  void *v7;

  recordingEngine = self->_recordingEngine;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMRecordingEngine controller](recordingEngine, "controller"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioService _fetchRecording:recordingController:](self, "_fetchRecording:recordingController:", v5, v6));

  return v7;
}

- (BOOL)isRecordingEnabled:(id *)a3
{
  NSObject *callCenterQueue;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  callCenterQueue = self->_callCenterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000695E4;
  block[3] = &unk_1001AC6E8;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(callCenterQueue, block);
  v5 = v14[3];
  if (v5)
  {
    v17[0] = NSLocalizedFailureReasonErrorKey;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("UNABLE_TO_RECORD_WITH_ACTIVE_PHONE_CALL_TITLE"), &stru_1001B2BC0, 0));
    v18[0] = v7;
    v17[1] = NSLocalizedRecoverySuggestionErrorKey;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("UNABLE_TO_RECORD_WITH_ACTIVE_PHONE_CALL_BODY"), &stru_1001B2BC0, 0));
    v18[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));

    if (a3)
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("VMAudioServiceErrorDomain"), 5, v10));

  }
  _Block_object_dispose(&v13, 8);
  return v5 == 0;
}

+ (void)playStartRecordingSoundEffect:(id)a3
{
  id v3;
  _QWORD inCompletionBlock[4];
  id v5;

  inCompletionBlock[0] = _NSConcreteStackBlock;
  inCompletionBlock[1] = 3221225472;
  inCompletionBlock[2] = sub_10006968C;
  inCompletionBlock[3] = &unk_1001AC298;
  v5 = a3;
  v3 = v5;
  AudioServicesPlaySystemSoundWithCompletion(0x459u, inCompletionBlock);

}

- (double)recordingDuration
{
  double result;
  double v3;

  v3 = 0.0;
  result = 0.0;
  if (self->_mode == 2)
  {
    -[VMRecordingEngine sampleRecordingTime:](self->_recordingEngine, "sampleRecordingTime:", &v3, 0.0);
    return v3;
  }
  return result;
}

- (BOOL)sampleRecordingTime:(double *)a3
{
  if (self->_mode == 2)
    return -[VMRecordingEngine sampleRecordingTime:](self->_recordingEngine, "sampleRecordingTime:", a3);
  else
    return 0;
}

- (id)_pushFileVersion:(id)a3 error:(id *)a4
{
  return +[NSFileVersion _addVersionOfItemAtURL:withContentsOfURL:options:temporaryStorageIdentifier:error:](NSFileVersion, "_addVersionOfItemAtURL:withContentsOfURL:options:temporaryStorageIdentifier:error:", a3, a3, 0, 0, a4);
}

- (BOOL)_popFileVersion:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileVersion otherVersionsOfItemAtURL:](NSFileVersion, "otherVersionsOfItemAtURL:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "replaceItemAtURL:options:error:", v5, 1, a4));
    v10 = v9;
    if (v9)
      v11 = objc_msgSend(v9, "isEqual:", v5);
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)__refreshRecording:(id)a3 composition:(id)a4 controller:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  RCApplicationModel *recordings;
  unsigned __int8 v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "composedDuration");
  v12 = v11;
  objc_msgSend(v10, "setRecordingComposition:", v9);
  objc_msgSend(v10, "setCurrentDuration:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "composedWaveformURL"));
  objc_msgSend(v13, "removeItemAtURL:error:", v14, 0);

  objc_msgSend(v8, "setLength:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "composedFragments"));
  v16 = objc_msgSend(v15, "count");

  if (!v16)
    objc_msgSend(v8, "setPlayable:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "liveTranscription"));
  objc_msgSend(v17, "refreshWithComposition:", v9);

  recordings = self->_recordings;
  v24 = 0;
  v19 = -[RCApplicationModel saveIfNecessary:](recordings, "saveIfNecessary:", &v24);
  v20 = v24;
  if ((v19 & 1) != 0)
  {
    +[RCAnalyticsUtilities sendNewRecordingDuration:](RCAnalyticsUtilities, "sendNewRecordingDuration:", v12);
  }
  else
  {
    v21 = OSLogForCategory(kVMLogCategoryDefault);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_10010CBFC();

    objc_msgSend(v10, "setRecordingError:", v20);
  }

  return v19;
}

- (BOOL)refreshRecording:(id)a3 controller:(id)a4
{
  id v6;
  void *v7;
  _TtC10VoiceMemos8VMPlayer *player;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioService fetchRecording:](self, "fetchRecording:", a3));
  if (!v7)
    goto LABEL_9;
  player = self->_player;
  if (player)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMPlayer currentItem](player, "currentItem"));
    v10 = v9;
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "asset"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rc_composedAVURL"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "url"));
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "controller"));
        -[VMAudioService stopPlaying:](self, "stopPlaying:", v15);

      }
    }

  }
  v16 = objc_claimAutoreleasedReturnValue(+[RCComposition compositionLoadedForSavedRecording:](RCComposition, "compositionLoadedForSavedRecording:", v7));
  if (v16)
  {
    v17 = (void *)v16;
    v18 = -[VMAudioService __refreshRecording:composition:controller:](self, "__refreshRecording:composition:controller:", v7, v16, v6);

  }
  else
  {
LABEL_9:
    v18 = 0;
  }

  return v18;
}

- (BOOL)_mergeRecording:(id)a3 atTime:(double)a4 controller:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  VMRecordingAssetsBackup *v17;
  VMRecordingAssetsBackup *v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  double v23;
  double v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  void *v34;
  id v35;
  unsigned int v36;
  id v37;
  NSObject *v38;
  int v39;
  BOOL v40;
  uint64_t v41;
  NSObject *v42;
  void *v44;
  _QWORD *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  _QWORD block[5];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  _QWORD *v60;
  double v61;
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  VMAudioService *v66;
  id v67;
  _QWORD v68[3];
  _QWORD v69[3];
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  id v73;

  v10 = a3;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioService fetchRecording:](self, "fetchRecording:", v10));
  v13 = v12;
  if (v12)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "url"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[RCSSavedRecordingService sharedService](RCSSavedRecordingService, "sharedService"));
    v67 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "prepareToTrimCompositionAVURL:error:", v51, &v67));
    v50 = v67;
    if (v14)
    {
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_10006A224;
      v64[3] = &unk_1001ACAF0;
      v15 = v52;
      v65 = v15;
      v66 = self;
      v45 = objc_retainBlock(v64);
      v49 = -[VMAudioService _newRecordingEngine](self, "_newRecordingEngine");
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioService _recordingSettingsForAudioEngine:error:](self, "_recordingSettingsForAudioEngine:error:"));
      if (!v48)
        goto LABEL_24;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordingComposition"));
      if (v16)
        goto LABEL_10;
      v17 = [VMRecordingAssetsBackup alloc];
      objc_msgSend(v13, "length");
      v63 = 0;
      v18 = -[VMRecordingAssetsBackup initWithComposedAVURL:duration:error:](v17, "initWithComposedAVURL:duration:error:", v51, &v63);
      v19 = v63;
      objc_msgSend(v11, "setAssetBackup:", v18);

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetBackup"));
      LODWORD(v18) = v20 == 0;

      if ((_DWORD)v18)
      {
        v21 = OSLogForCategory(kVMLogCategoryService);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          sub_10010CC68();

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[RCComposition compositionLoadedForEditingSavedRecording:error:](RCComposition, "compositionLoadedForEditingSavedRecording:error:", v13, a6));
      objc_msgSend(v11, "setRecordingComposition:", v16);

      if (v16)
      {
LABEL_10:
        objc_msgSend(v16, "composedDuration");
        v24 = v23;
        objc_msgSend(v11, "setCurrentDuration:");
        if (v24 < a4)
          a4 = v24;
        objc_msgSend(v11, "setRecordingURL:", v51);
        v25 = objc_msgSend(v16, "newRandomFragmentWithInsertionTimeRangeInComposition:pathExtension:", CFSTR("m4a"), RCTimeRangeMake(a4, 1.79769313e308));
        v47 = objc_msgSend(v25, "mutableCopy");

        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "AVOutputURL"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        objc_msgSend(v26, "removeItemAtURL:error:", v46, 0);

        v68[0] = RCSSavedRecordingServiceAudioFileMetadataKey_Composition;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dictionaryPListRepresentation"));
        v69[0] = v27;
        v68[1] = RCSSavedRecordingServiceAudioFileMetadataKey_OutputFragment;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "dictionaryPListRepresentation"));
        v68[2] = RCSSavedRecordingServiceAudioFileMetadataKey_UniqueID;
        v69[1] = v28;
        v69[2] = v10;
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v69, v68, 3));

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "openAudioFile:settings:metadata:error:", v46, v48, v44, a6));
        if (v29)
        {
          -[VMAudioService setMode:](self, "setMode:", 3);
          objc_msgSend(v11, "setRecordingToken:", v14);

          v30 = &_dispatch_main_q;
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "waveformDataSource"));
          if (v31)
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "waveformDataSource"));
            v33 = objc_msgSend(v32, "finished");

            if ((v33 & 1) == 0)
            {
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "waveformDataSource"));
              objc_msgSend(v34, "cancelLoading");

            }
          }
          v35 = objc_msgSend(objc_alloc((Class)RCCaptureInputWaveformDataSource), "initWithDestinationComposition:destinationFragment:", v16, v47);
          objc_msgSend(v11, "setWaveformDataSource:", v35);
          objc_msgSend(v35, "beginLoading");
          -[VMAudioService _prepareWithRecordingEngine:controller:assetWriter:](self, "_prepareWithRecordingEngine:controller:assetWriter:", v49, v11, v29);
          objc_msgSend(v49, "setInternalRecording:", 1);
          objc_msgSend(v11, "setCurrentTime:", a4);
          v62 = 0;
          v36 = -[VMAudioService _switchEngine:audioSettings:error:](self, "_switchEngine:audioSettings:error:", v49, v48, &v62);
          v37 = v62;
          if (v36)
          {
            v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "group"));
            dispatch_group_enter(v38);
            -[VMAudioService setMode:](self, "setMode:", 2);
            objc_msgSend(v11, "setRecordingID:", v10);
            objc_msgSend(v11, "setCurrentState:", 2);
            objc_msgSend(v49, "setPunchInTime:", a4);
            -[VMAudioService _playStartRecordingSoundEffectThenStartRecording:controller:](self, "_playStartRecordingSoundEffectThenStartRecording:controller:", v10, v11);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10006A2C4;
            block[3] = &unk_1001ACB18;
            block[4] = self;
            v54 = v46;
            v61 = a4;
            v55 = v47;
            v56 = v51;
            v57 = v16;
            v58 = v11;
            v59 = v13;
            v60 = v45;
            dispatch_group_notify(v38, (dispatch_queue_t)&_dispatch_main_q, block);

          }
          v14 = 0;
          v39 = 0;
        }
        else
        {
          v39 = 1;
        }

      }
      else
      {
LABEL_24:
        v39 = 1;
      }

      ((void (*)(_QWORD *, void *))v45[2])(v45, v14);
      v40 = v39 == 0;

    }
    else
    {
      v41 = OSLogForCategory(kVMLogCategoryService);
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v71 = "-[VMAudioService _mergeRecording:atTime:controller:error:]";
        v72 = 2112;
        v73 = v50;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%s -- accessError = %@", buf, 0x16u);
      }

      v40 = 0;
      if (a6)
        *a6 = objc_retainAutorelease(v50);
    }

  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (void)replaceRecording:(id)a3 atTime:(double)a4 controller:(id)a5
{
  id v8;
  id v9;
  RCActivityWaveformProcessor *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  double v16;

  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(RCActivityWaveformProcessor);
  objc_msgSend(v9, "setActivityWaveformProcessor:", v10);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10006A678;
  v13[3] = &unk_1001ACB40;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  -[VMAudioService _activateAudioSessionForRecordingWithCompletion:](self, "_activateAudioSessionForRecordingWithCompletion:", v13);

}

- (void)_cancelFileTranscription
{
  dispatch_semaphore_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  dispatch_semaphore_t v6;

  v2 = dispatch_semaphore_create(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingTranscriptionService sharedInstance](RCRecordingTranscriptionService, "sharedInstance"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006A79C;
  v5[3] = &unk_1001AB588;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "cancelFileTranscriptionWithCompletionHandler:", v5);

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

- (BOOL)_editRecording:(id)a3 editBlock:(id)a4 controller:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  VMRecordingAssetsBackup *v17;
  VMRecordingAssetsBackup *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  BOOL v26;
  uint64_t v27;
  NSObject *v28;
  id v30;
  id v31;
  void *v32;
  uint64_t (**v33)(id, void *, void *, id *);
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  id v41;

  v10 = a3;
  v33 = (uint64_t (**)(id, void *, void *, id *))a4;
  v11 = a5;
  -[VMAudioService _shutdownPlaybackEngine](self, "_shutdownPlaybackEngine");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioService fetchRecording:](self, "fetchRecording:", v10));
  if (v12)
  {
    -[VMAudioService _cancelFileTranscription](self, "_cancelFileTranscription");
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "url"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[RCSSavedRecordingService sharedService](RCSSavedRecordingService, "sharedService"));
    v37 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "prepareToTrimCompositionAVURL:error:", v32, &v37));
    v31 = v37;
    if (!v14)
    {
      v27 = OSLogForCategory(kVMLogCategoryService);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v39 = "-[VMAudioService _editRecording:editBlock:controller:error:]";
        v40 = 2112;
        v41 = v31;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s -- accessError = %@", buf, 0x16u);
      }

      v26 = 0;
      if (a6)
        *a6 = objc_retainAutorelease(v31);
      goto LABEL_23;
    }
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10006ABE0;
    v35[3] = &unk_1001ACA28;
    v36 = v13;
    v15 = objc_retainBlock(v35);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordingComposition"));
    if (!v16)
    {
      v17 = [VMRecordingAssetsBackup alloc];
      objc_msgSend(v12, "length");
      v34 = 0;
      v18 = -[VMRecordingAssetsBackup initWithComposedAVURL:duration:error:](v17, "initWithComposedAVURL:duration:error:", v32, &v34);
      v30 = v34;
      objc_msgSend(v11, "setAssetBackup:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetBackup"));
      LODWORD(v18) = v19 == 0;

      if ((_DWORD)v18)
      {
        v20 = OSLogForCategory(kVMLogCategoryService);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_10010CD40();

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[RCComposition compositionLoadedForEditingSavedRecording:error:](RCComposition, "compositionLoadedForEditingSavedRecording:error:", v12, a6));
      if (!v16)
      {

        v23 = 0;
        goto LABEL_21;
      }
      objc_msgSend(v11, "setRecordingComposition:", v16);

    }
    v22 = v33[2](v33, v16, v12, a6);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[RCComposition compositionMetadataURLForComposedAVURL:](RCComposition, "compositionMetadataURLForComposedAVURL:", v32));
      v25 = -[VMAudioService _pushFileVersion:error:](self, "_pushFileVersion:error:", v24, a6);

      objc_msgSend(v23, "saveMetadataToDefaultLocation");
      v26 = -[VMAudioService __refreshRecording:composition:controller:](self, "__refreshRecording:composition:controller:", v12, v23, v11);
LABEL_22:

      ((void (*)(_QWORD *, void *))v15[2])(v15, v14);
LABEL_23:

      goto LABEL_24;
    }
LABEL_21:
    v26 = 0;
    goto LABEL_22;
  }
  v26 = 0;
  if (a6)
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("VMAudioServiceErrorDomain"), 4, 0));
LABEL_24:

  return v26;
}

- (BOOL)trimRecording:(id)a3 timeRange:(id)a4 controller:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void ***v11;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *);
  void *v16;
  $F24F406B2B787EFB06265DBA3D28CBD5 v17;

  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10006AD1C;
  v16 = &unk_1001ACB60;
  v17 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_retainBlock(&v13);
  LOBYTE(a6) = -[VMAudioService _editRecording:editBlock:controller:error:](self, "_editRecording:editBlock:controller:error:", v10, v11, v9, a6, v13, v14, v15, v16, *(_QWORD *)&v17.var0, *(_QWORD *)&v17.var1);

  return (char)a6;
}

- (BOOL)cutRecording:(id)a3 timeRange:(id)a4 controller:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void ***v11;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *);
  void *v16;
  $F24F406B2B787EFB06265DBA3D28CBD5 v17;

  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_10006ADDC;
  v16 = &unk_1001ACB60;
  v17 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_retainBlock(&v13);
  LOBYTE(a6) = -[VMAudioService _editRecording:editBlock:controller:error:](self, "_editRecording:editBlock:controller:error:", v10, v11, v9, a6, v13, v14, v15, v16, *(_QWORD *)&v17.var0, *(_QWORD *)&v17.var1);

  return (char)a6;
}

- (BOOL)finalizeRecording:(id)a3 controller:(id)a4
{
  return -[VMAudioService finalizeRecording:controller:saveAsNew:](self, "finalizeRecording:controller:saveAsNew:", a3, a4, 0);
}

- (BOOL)finalizeRecording:(id)a3 controller:(id)a4 saveAsNew:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[VMAudioService _deactivateAudioSessionAsync:](self, "_deactivateAudioSessionAsync:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordingComposition"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioService fetchRecording:](self, "fetchRecording:", v8));
    v12 = v11 != 0;
    if (v11)
    {
      if (!v5
        && -[VMAudioService attemptSingleFragmentFinalization:recording:controller:](self, "attemptSingleFragmentFinalization:recording:controller:", v10, v11, v9))
      {
        goto LABEL_23;
      }
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "url"));
      v14 = v9;
      v15 = v14;
      if (v5)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "assetBackup"));
        if (v16)
        {
          v46 = 0;
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioService _saveAsNew:withAssetBackup:editedComposition:error:](self, "_saveAsNew:withAssetBackup:editedComposition:error:", v11, v16, v10, &v46));
          v41 = v16;
          v42 = v46;
          if (v17)
          {
            v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "url"));

            v18 = v17;
            v19 = objc_claimAutoreleasedReturnValue(+[RCComposition compositionLoadedForSavedRecording:](RCComposition, "compositionLoadedForSavedRecording:", v11));
            -[VMAudioService __refreshRecording:composition:controller:](self, "__refreshRecording:composition:controller:", v11, v19, v15);
            v15 = 0;
            v13 = v40;
          }
          else
          {
            v37 = OSLogForCategory(kVMLogCategoryService);
            v19 = objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              sub_10010CE88();
            v18 = 0;
          }

          v16 = v41;
          v29 = v42;
        }
        else
        {
          v28 = OSLogForCategory(kVMLogCategoryService);
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            sub_10010CE18(v29, v30, v31, v32, v33, v34, v35, v36);
        }

      }
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_10006B0A0;
      v43[3] = &unk_1001ACB88;
      v44 = v8;
      v45 = v15;
      v38 = v15;
      -[VMAudioService _mixDownEditedRecording:completion:](self, "_mixDownEditedRecording:completion:", v13, v43);

    }
    else
    {
      v20 = OSLogForCategory(kVMLogCategoryService);
      v13 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10010CEF4(v13, v21, v22, v23, v24, v25, v26, v27);
    }

LABEL_23:
    goto LABEL_24;
  }
  if (v5)
    -[VMAudioService _duplicateRecordingWithID:](self, "_duplicateRecordingWithID:", v8);
  v12 = 1;
LABEL_24:

  return v12;
}

- (void)_duplicateRecordingWithID:(id)a3
{
  void *v4;
  RCApplicationModel *recordings;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioService fetchRecording:](self, "fetchRecording:", a3));
  if (!v4)
  {
    v16 = OSLogForCategory(kVMLogCategoryService);
    v8 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10010CF64(v8, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_7;
  }
  recordings = self->_recordings;
  v24 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel duplicateRecording:error:](recordings, "duplicateRecording:error:", v4, &v24));

  if (!v6)
  {
    v7 = OSLogForCategory(kVMLogCategoryService);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10010CFD4(v8, v9, v10, v11, v12, v13, v14, v15);
LABEL_7:

  }
}

- (void)_restoreOriginalRecording:(id)a3 andComposition:(id)a4 forFailedRecording:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
    -[RCApplicationModel eraseRecording:](self->_recordings, "eraseRecording:", v10);
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "url"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
    v17 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "moveTo:recordingID:error:", v11, v12, &v17));
    v14 = v17;

    if (!v13)
    {
      v15 = OSLogForCategory(kVMLogCategoryService);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_10010D044();

    }
  }

}

- (id)_saveAsNew:(id)a3 withAssetBackup:(id)a4 editedComposition:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  RCApplicationModel *recordings;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  unsigned int v30;
  id v31;
  void *v32;
  id *p_isa;
  void *v34;
  id v35;
  id v36;
  void *v37;
  BOOL v38;
  id v39;
  BOOL v40;
  void *v41;
  id v43;
  VMAudioService *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  recordings = self->_recordings;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v48 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RCApplicationModel duplicateRecording:copyingResources:creationDate:error:](recordings, "duplicateRecording:copyingResources:creationDate:error:", v10, 0, v14, &v48));
  v16 = v48;

  if (v15)
  {
    v44 = self;
    v46 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "creationDate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uuid"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[RCSavedRecordingsModel standardPathForRecordingWithCreationDate:uniqueID:](RCSavedRecordingsModel, "standardPathForRecordingWithCreationDate:uniqueID:", v17, v18));
    v20 = a6;
    v21 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v19));

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uuid"));
    v47 = v12;
    v45 = (void *)v21;
    v23 = v21;
    v24 = v20;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "moveTo:recordingID:error:", v23, v22, v20));

    if (!v25)
    {
      -[VMAudioService _restoreOriginalRecording:andComposition:forFailedRecording:](v44, "_restoreOriginalRecording:andComposition:forFailedRecording:", v10, 0, v15);
      v35 = 0;
      v34 = v45;
      v16 = v46;
LABEL_16:

      v12 = v47;
      goto LABEL_17;
    }
    v43 = v11;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "composedAVURLBackup"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "url"));
    v28 = v26;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v49 = 0;
    v30 = objc_msgSend(v29, "moveItemAtURL:toURL:error:", v28, v27, &v49);

    v31 = v49;
    v32 = v31;
    if (v30)
    {

      v11 = v43;
      p_isa = (id *)&v44->super.isa;
      v34 = v45;
      v16 = v46;
LABEL_14:
      objc_msgSend(v11, "originalDuration");
      objc_msgSend(v10, "setLength:");
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "lastPathComponent"));
      objc_msgSend(v15, "setFileName:", v41);

      objc_msgSend(p_isa[1], "saveIfNecessary");
      v35 = v15;
      goto LABEL_16;
    }
    v36 = v31;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "domain"));
    if (objc_msgSend(v37, "isEqualToString:", NSCocoaErrorDomain))
      v38 = objc_msgSend(v36, "code") == (id)516;
    else
      v38 = 0;

    if (!v24 || v38)
    {

      v34 = v45;
      v16 = v46;
      v40 = v38;
      v11 = v43;
      p_isa = (id *)&v44->super.isa;
      if (v40)
        goto LABEL_14;
    }
    else
    {
      v39 = objc_retainAutorelease(v36);
      *v24 = v39;

      v11 = v43;
      p_isa = (id *)&v44->super.isa;
      v34 = v45;
      v16 = v46;
    }
    objc_msgSend(p_isa, "_restoreOriginalRecording:andComposition:forFailedRecording:", v10, v25, v15);
    v35 = 0;
    goto LABEL_16;
  }
  v35 = 0;
LABEL_17:

  return v35;
}

- (BOOL)attemptSingleFragmentFinalization:(id)a3 recording:(id)a4 controller:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  BOOL v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  id v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "composedFragments"));
  if (objc_msgSend(v11, "count") == (id)1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    objc_msgSend(v12, "contentDuration");
    v14 = v13;
    v15 = objc_msgSend(v12, "timeRangeInComposition");
    if (v14 == RCTimeRangeDeltaWithExactPrecision(v15, v16, v17))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "AVOutputURL"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "composedAVURL"));
      v29 = 0;
      v21 = objc_msgSend(v18, "moveItemAtURL:toURL:error:", v19, v20, &v29);
      v28 = v29;

      if ((v21 & 1) != 0)
      {
        v22 = objc_msgSend(v8, "mutableCopy");
        objc_msgSend(v22, "setDecomposedFragments:", &__NSArray0__struct);
        objc_msgSend(v22, "saveMetadataToDefaultLocation");
        v23 = -[VMAudioService __refreshRecording:composition:controller:](self, "__refreshRecording:composition:controller:", v9, v22, v10);

        v24 = v28;
      }
      else
      {
        v25 = OSLogForCategory(kVMLogCategoryService);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        v24 = v28;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          sub_10010D0B0();

        objc_msgSend(v10, "setRecordingError:", v28);
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)_mixDownEditedRecording:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  VMAudioService *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[VMAudioService setEditingStatus:](self, "setEditingStatus:", 1);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006B8B0;
  v10[3] = &unk_1001ACBB0;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[RCSSavedRecordingService sharedService](RCSSavedRecordingService, "sharedService"));
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v11;
  objc_msgSend(v9, "prepareToExportCompositionAVURL:accessRequestHandler:", v7, v10);

}

- (void)interfaceOrientationDidUpdate:(int64_t)a3
{
  -[RCStereoOrientationProvider interfaceOrientationDidUpdate:](self->_stereoOrientationProvider, "interfaceOrientationDidUpdate:", a3);
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (NSError)recordingError
{
  return self->_recordingError;
}

- (void)setRecordingError:(id)a3
{
  objc_storeStrong((id *)&self->_recordingError, a3);
}

- (int)editingStatus
{
  return self->_editingStatus;
}

- (void)setEditingStatus:(int)a3
{
  self->_editingStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingError, 0);
  objc_storeStrong((id *)&self->_stereoOrientationProvider, 0);
  objc_storeStrong((id *)&self->_preparingToPlayController, 0);
  objc_storeStrong((id *)&self->_audioSessionQueue, 0);
  objc_storeStrong((id *)&self->_regulatoryLogger, 0);
  objc_storeStrong((id *)&self->_recordingEnhancedObservance, 0);
  objc_destroyWeak((id *)&self->_monitoringObservance);
  objc_storeStrong((id *)&self->_allowedSampleRates, 0);
  objc_storeStrong((id *)&self->_audioSettings, 0);
  objc_storeStrong((id *)&self->_currentEngine, 0);
  objc_storeStrong((id *)&self->_recordingEngine, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_callCenterQueue, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_recordings, 0);
}

@end
