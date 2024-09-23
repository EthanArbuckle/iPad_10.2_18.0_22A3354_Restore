@implementation SOSEmergencyCallVoiceLoopManager

- (SOSEmergencyCallVoiceLoopManager)initWithReason:(int64_t)a3
{
  SOSEmergencyCallVoiceLoopManager *v4;
  SOSEmergencyCallVoiceLoopManager *v5;
  id v6;
  void *v7;
  uint64_t v8;
  CLLocationManager *locationManager;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SOSEmergencyCallVoiceLoopManager;
  v4 = -[SOSEmergencyCallVoiceLoopManager init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_reason = a3;
    v6 = objc_alloc(MEMORY[0x1E0C9E3C8]);
    +[SOSUtilities sosLocationBundle](SOSUtilities, "sosLocationBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithEffectiveBundle:delegate:onQueue:", v7, v5, MEMORY[0x1E0C80D38]);
    locationManager = v5->_locationManager;
    v5->_locationManager = (CLLocationManager *)v8;

    -[CLLocationManager setDesiredAccuracy:](v5->_locationManager, "setDesiredAccuracy:", -1.0);
    -[CLLocationManager startUpdatingLocation](v5->_locationManager, "startUpdatingLocation");
    -[CLLocationManager location](v5->_locationManager, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOSEmergencyCallVoiceLoopManager _updateLocation:](v5, "_updateLocation:", v10);

    -[SOSEmergencyCallVoiceLoopManager _startListeningForRemoteControl](v5, "_startListeningForRemoteControl");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SOSEmergencyCallVoiceLoopManager invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SOSEmergencyCallVoiceLoopManager;
  -[SOSEmergencyCallVoiceLoopManager dealloc](&v3, sel_dealloc);
}

- (void)startLoopPlayback
{
  NSObject *v3;
  uint64_t v4;
  SOSVoiceLoopAnalyticsReporter *v5;
  int64_t reason;
  void *v7;
  SOSVoiceLoopAnalyticsReporter *v8;
  SOSVoiceLoopAnalyticsReporter *loopAnalyticsReporter;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  sos_voiceloop_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SOSEmergencyCallVoiceLoopManager startLoopPlayback]";
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  v4 = objc_msgSend((id)objc_opt_class(), "_activeCallSupportsDTMF");
  v5 = [SOSVoiceLoopAnalyticsReporter alloc];
  reason = self->_reason;
  -[SOSEmergencyCallVoiceLoopManager voiceLanguage](self, "voiceLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SOSVoiceLoopAnalyticsReporter initWithReason:language:dtmfAvailable:](v5, "initWithReason:language:dtmfAvailable:", reason, v7, v4);
  loopAnalyticsReporter = self->_loopAnalyticsReporter;
  self->_loopAnalyticsReporter = v8;

  -[SOSEmergencyCallVoiceLoopManager _startLoopPlayback](self, "_startLoopPlayback");
}

- (void)stopLoopPlayback
{
  OUTLINED_FUNCTION_6(&dword_1AF4DC000, a1, a3, "Asked to stopLoopPlayback when not looping", a5, a6, a7, a8, 0);
}

- (void)invalidate
{
  NSObject *v3;
  SOSVoiceLoopAnalyticsReporter *loopAnalyticsReporter;
  CLLocationManager *locationManager;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  sos_voiceloop_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SOSEmergencyCallVoiceLoopManager invalidate]";
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[SOSVoiceLoopAnalyticsReporter reportVoiceLoopWillTerminate](self->_loopAnalyticsReporter, "reportVoiceLoopWillTerminate");
  loopAnalyticsReporter = self->_loopAnalyticsReporter;
  self->_loopAnalyticsReporter = 0;

  -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
  locationManager = self->_locationManager;
  self->_locationManager = 0;

  -[SOSEmergencyCallVoiceLoopManager _stopMessagePlayback](self, "_stopMessagePlayback");
  -[SOSEmergencyCallVoiceLoopManager _stopListeningForRemoteControl](self, "_stopListeningForRemoteControl");
}

- (SOSEmergencyCallVoiceLoopManager)initWithReason:(int64_t)a3 playbackMode:(int64_t)a4
{
  SOSEmergencyCallVoiceLoopManager *v5;
  SOSEmergencyCallVoiceLoopManager *v6;

  v5 = -[SOSEmergencyCallVoiceLoopManager initWithReason:](self, "initWithReason:", a3);
  v6 = v5;
  if (v5)
    -[SOSEmergencyCallVoiceLoopManager setTestMode:](v5, "setTestMode:", a4 == 1);
  return v6;
}

- (void)startMessagePlayback
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sos_voiceloop_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SOSEmergencyCallVoiceLoopManager startMessagePlayback]";
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[SOSEmergencyCallVoiceLoopManager startLoopPlayback](self, "startLoopPlayback");
}

- (void)stopMessagePlayback
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sos_voiceloop_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SOSEmergencyCallVoiceLoopManager stopMessagePlayback]";
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[SOSEmergencyCallVoiceLoopManager stopLoopPlayback](self, "stopLoopPlayback");
}

- (SOSVoiceUtterer)uplinkVoiceUtterer
{
  SOSVoiceUtterer *v3;
  SOSVoiceUtterer *uplinkVoiceUtterer;

  if (!self->_uplinkVoiceUtterer
    && -[SOSEmergencyCallVoiceLoopManager outputToTelephonyUplink](self, "outputToTelephonyUplink"))
  {
    v3 = objc_alloc_init(SOSVoiceUtterer);
    uplinkVoiceUtterer = self->_uplinkVoiceUtterer;
    self->_uplinkVoiceUtterer = v3;

    -[SOSVoiceUtterer setDelegate:](self->_uplinkVoiceUtterer, "setDelegate:", self);
    -[SOSVoiceUtterer setMixToTelephonyUplink:](self->_uplinkVoiceUtterer, "setMixToTelephonyUplink:", 1);
  }
  return self->_uplinkVoiceUtterer;
}

- (BOOL)outputToTelephonyUplink
{
  _BOOL4 v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = -[SOSEmergencyCallVoiceLoopManager testMode](self, "testMode");
  if (v2)
  {
    sos_voiceloop_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "SOSEmergencyCallVoiceLoopManager testMode == YES, => outputToTelephonyUplink = NO", v5, 2u);
    }

  }
  return !v2;
}

- (SOSVoiceUtterer)localVoiceUtterer
{
  SOSVoiceUtterer *v3;
  SOSVoiceUtterer *localVoiceUtterer;

  if (!self->_localVoiceUtterer
    && -[SOSEmergencyCallVoiceLoopManager outputToTelephonyUplink](self, "outputToTelephonyUplink"))
  {
    v3 = objc_alloc_init(SOSVoiceUtterer);
    localVoiceUtterer = self->_localVoiceUtterer;
    self->_localVoiceUtterer = v3;

    -[SOSVoiceUtterer setDelegate:](self->_localVoiceUtterer, "setDelegate:", self);
    -[SOSVoiceUtterer setMixToTelephonyUplink:](self->_localVoiceUtterer, "setMixToTelephonyUplink:", 0);
  }
  return self->_localVoiceUtterer;
}

- (void)speakUtteranceVariants:(id)a3 withPlaybackState:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  sos_voiceloop_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v17 = 136315650;
    v18 = "-[SOSEmergencyCallVoiceLoopManager speakUtteranceVariants:withPlaybackState:]";
    v19 = 2048;
    v20 = a4;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_INFO, "%s - newPlaybackState:%tu, utteranceVariants:%@", (uint8_t *)&v17, 0x20u);
  }

  v8 = +[SOSUtilities BOOLOverrideForDefaultsKey:defaultValue:](SOSUtilities, "BOOLOverrideForDefaultsKey:defaultValue:", CFSTR("debug.voiceloop.audio.playRemoteAsLocal"), 0);
  v9 = +[SOSUtilities BOOLOverrideForDefaultsKey:defaultValue:](SOSUtilities, "BOOLOverrideForDefaultsKey:defaultValue:", CFSTR("debug.voiceloop.audio.playLocalAsRemote"), 0);
  if (v8)
    objc_msgSend(v6, "remoteUtterances");
  else
    objc_msgSend(v6, "localUtterances");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v6, "localUtterances");
  else
    objc_msgSend(v6, "remoteUtterances");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "count");
  if (-[SOSEmergencyCallVoiceLoopManager outputToTelephonyUplink](self, "outputToTelephonyUplink"))
    v13 = objc_msgSend(v11, "count") != 0;
  else
    v13 = 0;
  sos_voiceloop_log();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v12 && !v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SOSEmergencyCallVoiceLoopManager speakUtteranceVariants:withPlaybackState:].cold.1();
    goto LABEL_22;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 134217984;
    v18 = (const char *)a4;
    _os_log_impl(&dword_1AF4DC000, v15, OS_LOG_TYPE_DEFAULT, "speakUtteranceVariants - setting newPlaybackState:%tu", (uint8_t *)&v17, 0xCu);
  }

  -[SOSEmergencyCallVoiceLoopManager setPlaybackState:](self, "setPlaybackState:", a4);
  if (v12)
  {
    -[SOSEmergencyCallVoiceLoopManager localVoiceUtterer](self, "localVoiceUtterer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "speakUtterances:", v10);

  }
  if (v13)
  {
    -[SOSEmergencyCallVoiceLoopManager uplinkVoiceUtterer](self, "uplinkVoiceUtterer");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject speakUtterances:](v15, "speakUtterances:", v11);
LABEL_22:

  }
}

- (BOOL)_isSpeaking
{
  return -[SOSVoiceUtterer isSpeaking](self->_localVoiceUtterer, "isSpeaking")
      || -[SOSVoiceUtterer isSpeaking](self->_uplinkVoiceUtterer, "isSpeaking");
}

- (void)_stopMessagePlayback
{
  NSObject *v3;
  NSTimer *messageRepeatTimer;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  sos_voiceloop_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SOSEmergencyCallVoiceLoopManager _stopMessagePlayback]";
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[SOSVoiceUtterer stopSpeaking](self->_localVoiceUtterer, "stopSpeaking");
  -[SOSVoiceUtterer stopSpeaking](self->_uplinkVoiceUtterer, "stopSpeaking");
  -[SOSEmergencyCallVoiceLoopManager setPlaybackState:](self, "setPlaybackState:", 200);
  -[NSTimer invalidate](self->_messageRepeatTimer, "invalidate");
  messageRepeatTimer = self->_messageRepeatTimer;
  self->_messageRepeatTimer = 0;

}

- (void)setPlaybackState:(unint64_t)a3
{
  NSObject *v5;
  unint64_t playbackState;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_playbackState != a3)
  {
    sos_voiceloop_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      playbackState = self->_playbackState;
      v10 = 134218240;
      v11 = playbackState;
      v12 = 2048;
      v13 = a3;
      _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "setPlaybackState: %tu => %tu", (uint8_t *)&v10, 0x16u);
    }

    v7 = self->_playbackState;
    self->_playbackState = a3;
    -[SOSEmergencyCallVoiceLoopManager loopAnalyticsReporter](self, "loopAnalyticsReporter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reportVoiceLoopPlaybackStateChanged:", a3);

    if (a3 == 100)
    {
      -[SOSEmergencyCallVoiceLoopManager delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "voiceLoopManagerDidStartLoopPlayback:", self);
    }
    else
    {
      if (v7 != 100)
        return;
      -[SOSEmergencyCallVoiceLoopManager delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "voiceLoopManagerDidStopLoopPlayback:", self);
    }

  }
}

- (void)setPlayingLoopIndex:(unint64_t)a3
{
  void *v5;

  -[SOSEmergencyCallVoiceLoopManager loopAnalyticsReporter](self, "loopAnalyticsReporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportVoiceLoopIndexChanged:", a3);

  if (self->_playingLoopIndex != a3)
    self->_playingLoopIndex = a3;
}

- (void)_startLoopPlayback
{
  double v2;

  LODWORD(v2) = 1.0;
  -[SOSEmergencyCallVoiceLoopManager setLoopVolume:](self, "setLoopVolume:", v2);
  -[SOSEmergencyCallVoiceLoopManager setPlayingLoopIndex:](self, "setPlayingLoopIndex:", 0);
  -[SOSEmergencyCallVoiceLoopManager _speakLoopMessage](self, "_speakLoopMessage");
}

- (void)_speakLoopMessage
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[SOSEmergencyCallVoiceLoopManager setPlayingLoopIndex:](self, "setPlayingLoopIndex:", -[SOSEmergencyCallVoiceLoopManager playingLoopIndex](self, "playingLoopIndex") + 1);
  sos_voiceloop_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[SOSEmergencyCallVoiceLoopManager _speakLoopMessage]";
    v7 = 2048;
    v8 = -[SOSEmergencyCallVoiceLoopManager playingLoopIndex](self, "playingLoopIndex");
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "%s - Playing SOS loop #: %lu", (uint8_t *)&v5, 0x16u);
  }

  -[SOSEmergencyCallVoiceLoopManager emergencyDescriptorUtteranceVariantsForRepeatVariant:](self, "emergencyDescriptorUtteranceVariantsForRepeatVariant:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSEmergencyCallVoiceLoopManager speakUtteranceVariants:withPlaybackState:](self, "speakUtteranceVariants:withPlaybackState:", v4, 100);

}

- (id)emergencyDescriptorUtteranceVariantsForRepeatVariant:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  -[SOSEmergencyCallVoiceLoopManager _emergencyDescriptorUtterancesForRemoteVariant:repeatVariant:](self, "_emergencyDescriptorUtterancesForRemoteVariant:repeatVariant:", 0, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSEmergencyCallVoiceLoopManager _emergencyDescriptorUtterancesForRemoteVariant:repeatVariant:](self, "_emergencyDescriptorUtterancesForRemoteVariant:repeatVariant:", 1, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOSVoiceUtteranceVariants utteranceVariantsWithLocalUtterances:remoteUtterances:](SOSVoiceUtteranceVariants, "utteranceVariantsWithLocalUtterances:remoteUtterances:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_emergencyDescriptorUtterancesForRemoteVariant:(BOOL)a3 repeatVariant:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  float v9;
  float v10;
  void *v11;
  SOSVoiceUtterance *v12;
  double v13;
  double v14;
  SOSVoiceUtterance *v15;
  void *v16;
  void *v17;
  SOSVoiceUtterance *v18;
  double v19;
  double v20;
  NSObject *v21;
  _BOOL4 v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  SOSVoiceUtterance *v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint8_t buf[4];
  _BYTE v37[10];
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  void *v41;
  _QWORD v42[2];

  v4 = a4;
  v5 = a3;
  v42[1] = *MEMORY[0x1E0C80C00];
  if (a4
    && !a3
    && !+[SOSUtilities BOOLOverrideForDefaultsKey:defaultValue:](SOSUtilities, "BOOLOverrideForDefaultsKey:defaultValue:", CFSTR("debug.voiceloop.config.repeat.playLocally"), 0))
  {
    +[SOSVoiceUtterance silentUtterance](SOSVoiceUtterance, "silentUtterance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  -[SOSEmergencyCallVoiceLoopManager voiceLanguage](self, "voiceLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 1.0;
  if (!v4)
  {
    -[SOSEmergencyCallVoiceLoopManager loopVolume](self, "loopVolume");
    v9 = v10;
  }
  objc_msgSend((id)objc_opt_class(), "_messageKeyForReason:shortVersion:", -[SOSEmergencyCallVoiceLoopManager reason](self, "reason"), v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [SOSVoiceUtterance alloc];
  LODWORD(v13) = 1.0;
  *(float *)&v14 = v9;
  v15 = -[SOSVoiceUtterance initWithMessageKey:voiceLanguage:volume:rateMultiplier:](v12, "initWithMessageKey:voiceLanguage:volume:rateMultiplier:", v11, v8, v14, v13);
  objc_msgSend(v7, "addObject:", v15);

  -[SOSEmergencyCallVoiceLoopManager locationToSynthesize](self, "locationToSynthesize");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[SOSEmergencyCallVoiceLoopManager _coordinatesStringFromLocation:shortVersion:](self, "_coordinatesStringFromLocation:shortVersion:", v16, v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = [SOSVoiceUtterance alloc];
      LODWORD(v19) = 1061997773;
      *(float *)&v20 = v9;
      v21 = -[SOSVoiceUtterance initWithLocalizedMessageString:voiceLanguage:volume:rateMultiplier:](v18, "initWithLocalizedMessageString:voiceLanguage:volume:rateMultiplier:", v17, v8, v20, v19);
      objc_msgSend(v7, "addObject:", v21);
    }
    else
    {
      sos_voiceloop_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[SOSEmergencyCallVoiceLoopManager _emergencyDescriptorUtterancesForRemoteVariant:repeatVariant:].cold.1();
    }

  }
  v22 = -[SOSEmergencyCallVoiceLoopManager callSupportsRemoteControl](self, "callSupportsRemoteControl");
  v23 = v22;
  if (!v4)
  {
    v24 = (void *)MEMORY[0x1E0CB3940];
    if (v22 && v5)
    {
      -[SOSEmergencyCallVoiceLoopManager localizedStringForKey:](self, "localizedStringForKey:", CFSTR("SOS_VOICELOOP_SPEECH_LOOP_HOW_TO_STOP"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 48;
    }
    else
    {
      -[SOSEmergencyCallVoiceLoopManager localizedStringForKey:](self, "localizedStringForKey:", CFSTR("SOS_VOICELOOP_SPEECH_LOOP_REPEAT"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 5;
    }
    goto LABEL_20;
  }
  if (v5)
  {
    v24 = (void *)MEMORY[0x1E0CB3940];
    -[SOSEmergencyCallVoiceLoopManager localizedStringForKey:](self, "localizedStringForKey:", CFSTR("SOS_VOICELOOP_SPEECH_BRIEF_HOW_TO_REPEAT"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 49;
LABEL_20:
    objc_msgSend(v24, "stringWithFormat:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  v27 = 0;
LABEL_21:
  sos_voiceloop_log();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v37 = v5;
    *(_WORD *)&v37[4] = 1024;
    *(_DWORD *)&v37[6] = v4;
    v38 = 1024;
    v39 = v23;
    v40 = 2114;
    v41 = v27;
    _os_log_impl(&dword_1AF4DC000, v28, OS_LOG_TYPE_DEFAULT, "remoteVariant:%{BOOL}d repeatVariant:%{BOOL}d, callSupportsRemoteControl: %{BOOL}d => %{public}@", buf, 0x1Eu);
  }

  if (objc_msgSend(v27, "length"))
  {
    v29 = [SOSVoiceUtterance alloc];
    LODWORD(v30) = 1.0;
    *(float *)&v31 = v9;
    v32 = -[SOSVoiceUtterance initWithLocalizedMessageString:voiceLanguage:volume:rateMultiplier:](v29, "initWithLocalizedMessageString:voiceLanguage:volume:rateMultiplier:", v27, v8, v31, v30);
  }
  else
  {
    +[SOSVoiceUtterance silentUtterance](SOSVoiceUtterance, "silentUtterance");
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v32;
  objc_msgSend(v7, "addObject:", v32);

  sos_voiceloop_log();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v37 = v7;
    _os_log_impl(&dword_1AF4DC000, v34, OS_LOG_TYPE_DEFAULT, "Generated loop utterances: %@", buf, 0xCu);
  }

LABEL_29:
  return v7;
}

- (unint64_t)_loopPhaseFromUtteranceIndex:(unint64_t)a3
{
  NSObject *v4;

  if (a3 < 3)
    return 100 * a3 + 100;
  sos_voiceloop_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[SOSEmergencyCallVoiceLoopManager _loopPhaseFromUtteranceIndex:].cold.1();

  return 0;
}

+ (id)_messageKeyForReason:(int64_t)a3 shortVersion:(BOOL)a4
{
  _BOOL4 v4;
  const __CFString *v5;
  NSObject *v6;
  const __CFString *v7;

  v4 = a4;
  if (a3 == 1)
  {
    v5 = CFSTR("NEWTON_WATCH");
  }
  else if (a3 == 2)
  {
    v5 = CFSTR("KAPPA_PHONE");
  }
  else
  {
    sos_voiceloop_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[SOSEmergencyCallVoiceLoopManager _messageKeyForReason:shortVersion:].cold.1();

    v5 = 0;
  }
  v7 = CFSTR("LOOP");
  if (v4)
    v7 = CFSTR("BRIEF");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SOS_VOICELOOP_SPEECH_%@_INTRO_%@"), v7, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)voiceUtterer:(id)a3 willStartSpeakingUtteranceAtIndex:(unint64_t)a4 fromUtterances:(id)a5
{
  unint64_t v7;
  unint64_t v8;
  id v9;

  v7 = -[SOSEmergencyCallVoiceLoopManager playbackState](self, "playbackState", a3, a4, a5);
  -[SOSEmergencyCallVoiceLoopManager loopAnalyticsReporter](self, "loopAnalyticsReporter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == 100)
    v8 = -[SOSEmergencyCallVoiceLoopManager _loopPhaseFromUtteranceIndex:](self, "_loopPhaseFromUtteranceIndex:", a4);
  else
    v8 = 0;
  objc_msgSend(v9, "reportVoiceLoopLoopPhaseChanged:", v8);

}

- (void)voiceUtterer:(id)a3 didFinishSpeakingUtterances:(id)a4
{
  SOSVoiceUtterer *v5;
  NSObject *v6;
  SOSVoiceUtterer *localVoiceUtterer;
  _BOOL4 v8;
  _BOOL4 v9;
  SOSVoiceUtterer *uplinkVoiceUtterer;
  unint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  NSObject *v15;
  NSTimer *v16;
  NSTimer *messageRepeatTimer;
  void *v18;
  int v19;
  _BYTE v20[10];
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (SOSVoiceUtterer *)a3;
  if (-[SOSEmergencyCallVoiceLoopManager _isSpeaking](self, "_isSpeaking"))
  {
    sos_voiceloop_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      localVoiceUtterer = self->_localVoiceUtterer;
      v8 = localVoiceUtterer == v5;
      v9 = -[SOSVoiceUtterer isSpeaking](localVoiceUtterer, "isSpeaking");
      uplinkVoiceUtterer = self->_uplinkVoiceUtterer;
      v19 = 67109888;
      *(_DWORD *)v20 = v8;
      *(_WORD *)&v20[4] = 1024;
      *(_DWORD *)&v20[6] = v9;
      v21 = 1024;
      v22 = uplinkVoiceUtterer == v5;
      v23 = 1024;
      v24 = -[SOSVoiceUtterer isSpeaking](uplinkVoiceUtterer, "isSpeaking");
      _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "didFinishSpeakingUtterances - !doneSpeaking; NOP until notified after doneSpeaking (isLocalUtterer:%{BOOL}d loca"
        "lUttererSpeaking:%{BOOL}d isRemoteUtterer:%{BOOL}d remoteUttererSpeaking:%{BOOL}d",
        (uint8_t *)&v19,
        0x1Au);
    }
LABEL_10:

    goto LABEL_14;
  }
  v11 = -[SOSEmergencyCallVoiceLoopManager playbackState](self, "playbackState");
  sos_voiceloop_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11 == 100)
  {
    if (v13)
    {
      v19 = 134217984;
      *(_QWORD *)v20 = -[SOSEmergencyCallVoiceLoopManager playingLoopIndex](self, "playingLoopIndex");
      _os_log_impl(&dword_1AF4DC000, v12, OS_LOG_TYPE_DEFAULT, "didFinishSpeakingUtterances - Finished spoken portion of loop: %lu", (uint8_t *)&v19, 0xCu);
    }

    -[SOSEmergencyCallVoiceLoopManager loopAnalyticsReporter](self, "loopAnalyticsReporter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "reportVoiceLoopLoopPhaseChanged:", 10000);

    sos_voiceloop_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1AF4DC000, v15, OS_LOG_TYPE_DEFAULT, "didFinishSpeakingUtterances - More loops to come; Creating new timer",
        (uint8_t *)&v19,
        2u);
    }

    objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__speakLoopMessage, 0, 0, 5.0);
    v16 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    messageRepeatTimer = self->_messageRepeatTimer;
    self->_messageRepeatTimer = v16;

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addTimer:forMode:", self->_messageRepeatTimer, *MEMORY[0x1E0C99860]);

    +[SOSUtilities numberOverrideForDefaultsKey:defaultValue:](SOSUtilities, "numberOverrideForDefaultsKey:defaultValue:", CFSTR("debug.voiceloop.loop.subsequent.volume"), &unk_1E5F831F0);
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject floatValue](v6, "floatValue");
    -[SOSEmergencyCallVoiceLoopManager setLoopVolume:](self, "setLoopVolume:");
    goto LABEL_10;
  }
  if (v13)
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_1AF4DC000, v12, OS_LOG_TYPE_DEFAULT, "didFinishSpeakingUtterances - !VoiceLoopPlaybackStatePlayingLoop - Done playing", (uint8_t *)&v19, 2u);
  }

  -[SOSEmergencyCallVoiceLoopManager setPlaybackState:](self, "setPlaybackState:", 200);
LABEL_14:

}

- (void)shiftedLocationIfApplicable:(id)a3 withcompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE buf[24];
  void *v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2050000000;
  v8 = (void *)get_MKLocationShifterClass_softClass_0;
  v26 = get_MKLocationShifterClass_softClass_0;
  if (!get_MKLocationShifterClass_softClass_0)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __get_MKLocationShifterClass_block_invoke_0;
    v28 = &unk_1E5F75CA8;
    v29 = &v23;
    __get_MKLocationShifterClass_block_invoke_0((uint64_t)buf);
    v8 = (void *)v24[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v23, 8);
  v10 = objc_alloc_init(v9);
  -[SOSEmergencyCallVoiceLoopManager setLocationShifter:](self, "setLocationShifter:", v10);

  sos_voiceloop_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[SOSEmergencyCallVoiceLoopManager locationShifter](self, "locationShifter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOSEmergencyCallVoiceLoopManager locationShifter](self, "locationShifter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend((id)objc_opt_class(), "isLocationShiftRequiredForLocation:", v6);
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v14;
    _os_log_impl(&dword_1AF4DC000, v11, OS_LOG_TYPE_DEFAULT, "Location shifter: %@ - isLocationShiftRequiredForLocation: %{BOOL}d", buf, 0x12u);

  }
  if (v6
    && (-[SOSEmergencyCallVoiceLoopManager locationShifter](self, "locationShifter"),
        (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (-[SOSEmergencyCallVoiceLoopManager locationShifter](self, "locationShifter"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend((id)objc_opt_class(), "isLocationShiftRequiredForLocation:", v6),
        v16,
        v15,
        v17))
  {
    objc_initWeak((id *)buf, self);
    dispatch_get_global_queue(0, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__SOSEmergencyCallVoiceLoopManager_shiftedLocationIfApplicable_withcompletion___block_invoke;
    block[3] = &unk_1E5F76B98;
    v21 = v7;
    objc_copyWeak(&v22, (id *)buf);
    v20 = v6;
    dispatch_async(v18, block);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v6);
  }

}

void __79__SOSEmergencyCallVoiceLoopManager_shiftedLocationIfApplicable_withcompletion___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  dispatch_time_t v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  NSObject *v17;
  id v18;
  uint8_t buf[16];
  _QWORD v20[4];
  id v21;
  _QWORD *v22;
  _QWORD v23[3];
  char v24;

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v2 = dispatch_semaphore_create(0);
  v3 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __79__SOSEmergencyCallVoiceLoopManager_shiftedLocationIfApplicable_withcompletion___block_invoke_2;
  v20[3] = &unk_1E5F76890;
  v22 = v23;
  v21 = *(id *)(a1 + 40);
  v4 = (void *)MEMORY[0x1B5DF84EC](v20);
  sos_voiceloop_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "SOS location shift started", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "locationShifter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __79__SOSEmergencyCallVoiceLoopManager_shiftedLocationIfApplicable_withcompletion___block_invoke_76;
  v15[3] = &unk_1E5F768B8;
  v16 = v8;
  v9 = v4;
  v18 = v9;
  v10 = v2;
  v17 = v10;
  v11 = MEMORY[0x1E0C80D38];
  v12 = MEMORY[0x1E0C80D38];
  objc_msgSend(v7, "shiftLocation:withCompletionHandler:callbackQueue:", v16, v15, v11);

  v13 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v10, v13))
  {
    sos_voiceloop_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v14, OS_LOG_TYPE_DEFAULT, "SOS location shift timed out.", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v9 + 2))(v9, *(_QWORD *)(a1 + 32));
  }

  _Block_object_dispose(v23, 8);
}

void __79__SOSEmergencyCallVoiceLoopManager_shiftedLocationIfApplicable_withcompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  __int128 v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__SOSEmergencyCallVoiceLoopManager_shiftedLocationIfApplicable_withcompletion___block_invoke_3;
  block[3] = &unk_1E5F76868;
  v6 = *(_OWORD *)(a1 + 32);
  v4 = (id)v6;
  v9 = v6;
  v8 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

_QWORD *__79__SOSEmergencyCallVoiceLoopManager_shiftedLocationIfApplicable_withcompletion___block_invoke_3(_QWORD *result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result[6] + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD))(result[5] + 16))(result[5], result[4]);
  }
  return result;
}

void __79__SOSEmergencyCallVoiceLoopManager_shiftedLocationIfApplicable_withcompletion___block_invoke_76(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  sos_voiceloop_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOS location shift completed. Shifted from %@ to %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v5 = a4;
  sos_voiceloop_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "Received location update", v8, 2u);
  }

  objc_msgSend(v5, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SOSEmergencyCallVoiceLoopManager _updateLocation:](self, "_updateLocation:", v7);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  sos_voiceloop_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "locationManager:didFailWithError:%{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (CLLocation)locationToSynthesize
{
  CLLocation *v3;

  if (+[SOSUtilities BOOLOverrideForDefaultsKey:defaultValue:](SOSUtilities, "BOOLOverrideForDefaultsKey:defaultValue:", CFSTR("debug.voiceloop.demo.fakeLocation"), 0))
  {
    -[SOSEmergencyCallVoiceLoopManager _overrideLocation](self, "_overrideLocation");
    v3 = (CLLocation *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_locationToSynthesize;
  }
  return v3;
}

- (void)_updateLocation:(id)a3
{
  id v4;
  CLLocation *locationToSynthesize;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id location;

  v4 = a3;
  if (!v4)
  {
    sos_voiceloop_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SOSEmergencyCallVoiceLoopManager _updateLocation:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
    goto LABEL_11;
  }
  locationToSynthesize = self->_locationToSynthesize;
  if (locationToSynthesize)
  {
    -[CLLocation horizontalAccuracy](locationToSynthesize, "horizontalAccuracy");
    v7 = v6;
    objc_msgSend(v4, "horizontalAccuracy");
    if (v7 <= v8 || (objc_msgSend(v4, "horizontalAccuracy"), v9 <= 0.0))
    {
      objc_msgSend(v4, "timestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLLocation timestamp](self->_locationToSynthesize, "timestamp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", v11);
      v13 = v12;

      if (v13 <= 5.0)
      {
        sos_voiceloop_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[SOSEmergencyCallVoiceLoopManager _updateLocation:].cold.2();
LABEL_11:

        goto LABEL_12;
      }
    }
  }
  objc_initWeak(&location, self);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __52__SOSEmergencyCallVoiceLoopManager__updateLocation___block_invoke;
  v22[3] = &unk_1E5F76BC0;
  objc_copyWeak(&v23, &location);
  -[SOSEmergencyCallVoiceLoopManager shiftedLocationIfApplicable:withcompletion:](self, "shiftedLocationIfApplicable:withcompletion:", v4, v22);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
LABEL_12:

}

void __52__SOSEmergencyCallVoiceLoopManager__updateLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  sos_voiceloop_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "Updating location: %@", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setLocationToSynthesize:", v3);

}

- (id)_coordinatesStringFromLocation:(id)a3 shortVersion:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  sos_voiceloop_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v31 = v6;
    v32 = 1024;
    v33 = v4;
    _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, "Creating location string from location:%@ shortVersion:%{BOOL}d", buf, 0x12u);
  }

  if (v6)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v8, "setNumberStyle:", 1);
    objc_msgSend(v8, "setMaximumFractionDigits:", 4);
    -[SOSEmergencyCallVoiceLoopManager voiceLanguage](self, "voiceLanguage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v9);
    else
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLocale:", v11);
    sos_voiceloop_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v11;
      _os_log_impl(&dword_1AF4DC000, v12, OS_LOG_TYPE_DEFAULT, "Setting locale %{public}@ for number formatter", buf, 0xCu);
    }

    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "coordinate");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromNumber:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "coordinate");
    objc_msgSend(v16, "numberWithDouble:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromNumber:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "horizontalAccuracy");
    LODWORD(v22) = vcvtpd_s64_f64(v21);
    objc_msgSend(v20, "numberWithInt:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromNumber:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v25 = CFSTR("SOS_VOICELOOP_SPEECH_BRIEF_LOCATION");
    else
      v25 = CFSTR("SOS_VOICELOOP_SPEECH_LOOP_LOCATION");
    v26 = (void *)MEMORY[0x1E0CB3940];
    -[SOSEmergencyCallVoiceLoopManager localizedStringForKey:](self, "localizedStringForKey:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", v27, v15, v19, v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  sos_voiceloop_log();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v10;
    _os_log_impl(&dword_1AF4DC000, v28, OS_LOG_TYPE_DEFAULT, "New location string: %@", buf, 0xCu);
  }

  return v10;
}

- (id)voiceLanguage
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSString *v9;
  NSString *voiceLanguage;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!-[NSString length](self->_voiceLanguage, "length"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.SOS"));
    objc_msgSend(v3, "valueForKey:", CFSTR("SimulateActiveCountry"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      sos_voiceloop_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138543362;
        v13 = v4;
        _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "Setting to TEST country code: %{public}@", (uint8_t *)&v12, 0xCu);
      }

      v6 = v4;
    }
    else
    {
      v6 = (id)CPPhoneNumberCopyNetworkCountryCode();
    }
    v7 = v6;
    sos_voiceloop_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v7;
      _os_log_impl(&dword_1AF4DC000, v8, OS_LOG_TYPE_DEFAULT, "Active country code: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    -[SOSEmergencyCallVoiceLoopManager _languageToUseInVoiceLoopForCountryCode:](self, "_languageToUseInVoiceLoopForCountryCode:", v7);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    voiceLanguage = self->_voiceLanguage;
    self->_voiceLanguage = v9;

  }
  return self->_voiceLanguage;
}

- (id)_languageToUseInVoiceLoopForCountryCode:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  sos_voiceloop_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v4;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "_languageToUseInVoiceLoopForCountryCode:%{public}@", (uint8_t *)&v11, 0xCu);
  }

  if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("IN")))
  {
    sos_voiceloop_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = CFSTR("en_GB");
      _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "Forcing language to: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    v7 = CFSTR("en_GB");
  }
  else
  {
    -[SOSEmergencyCallVoiceLoopManager _preferredVoiceLanguageForCountryCode:](self, "_preferredVoiceLanguageForCountryCode:", v4);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (v7)
    v8 = v7;
  else
    v8 = CFSTR("en_GB");
  v9 = v8;

  return v9;
}

- (id)_preferredVoiceLanguageForCountryCode:(id)a3
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  __int128 v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint8_t v35[128];
  __int128 buf;
  Class (*v37)(uint64_t);
  void *v38;
  uint64_t *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  sos_voiceloop_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v25;
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "_preferredVoiceLanguageForCountryCode:%{public}@", (uint8_t *)&buf, 0xCu);
  }

  v30 = 0;
  v31 = &v30;
  v32 = 0x2050000000;
  v4 = (void *)getIntlUtilityClass_softClass;
  v33 = getIntlUtilityClass_softClass;
  if (!getIntlUtilityClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v37 = __getIntlUtilityClass_block_invoke;
    v38 = &unk_1E5F75CA8;
    v39 = &v30;
    __getIntlUtilityClass_block_invoke((uint64_t)&buf);
    v4 = (void *)v31[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v30, 8);
  objc_msgSend(v5, "preferredLanguagesForRegion:", v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sos_voiceloop_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, "Preferred filtered languages retrieved: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v10)
  {
    v12 = *(_QWORD *)v27;
    *(_QWORD *)&v11 = 138543362;
    v23 = v11;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x1E0C99DC8], "languageFromLanguage:byReplacingRegion:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13), v25, v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        sos_voiceloop_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = v23;
          *(_QWORD *)((char *)&buf + 4) = v14;
          _os_log_impl(&dword_1AF4DC000, v15, OS_LOG_TYPE_DEFAULT, "Language with region: %{public}@", (uint8_t *)&buf, 0xCu);
        }

        v16 = (void *)MEMORY[0x1E0CB34D0];
        v34 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "preferredLocalizationsFromArray:forPreferences:", v9, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C89B88], "voiceWithLanguage:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19 && v20)
        {
          sos_voiceloop_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = v23;
            *(_QWORD *)((char *)&buf + 4) = v19;
            _os_log_impl(&dword_1AF4DC000, v21, OS_LOG_TYPE_DEFAULT, "Language selected for speaking: %{public}@", (uint8_t *)&buf, 0xCu);
          }

          goto LABEL_22;
        }

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      if (v10)
        continue;
      break;
    }
  }
  v19 = 0;
LABEL_22:

  return v19;
}

- (id)localizedStringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SOSEmergencyCallVoiceLoopManager voiceLanguage](self, "voiceLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOSVoiceUtterance localizedStringForKey:forLocalization:](SOSVoiceUtterance, "localizedStringForKey:forLocalization:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)callCenter:(id)a3 reportedCall:(id)a4 receivedDTMFUpdate:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  sos_voiceloop_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "receivedDTMFUpdate:%{public}@ call:%@", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend(v8, "digits");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSEmergencyCallVoiceLoopManager _handleRemoteDTMFDigits:](self, "_handleRemoteDTMFDigits:", v10);

}

- (BOOL)callSupportsRemoteControl
{
  uint64_t v3;

  v3 = objc_msgSend((id)objc_opt_class(), "_activeCallSupportsDTMF");
  -[SOSVoiceLoopAnalyticsReporter reportVoiceLoopSupportsDTMF:](self->_loopAnalyticsReporter, "reportVoiceLoopSupportsDTMF:", v3);
  return +[SOSUtilities BOOLOverrideForDefaultsKey:defaultValue:](SOSUtilities, "BOOLOverrideForDefaultsKey:defaultValue:", CFSTR("debug.voiceloop.call.supportsDTMF"), v3);
}

+ (BOOL)_activeCallSupportsDTMF
{
  void *v2;
  char v3;

  objc_msgSend((id)objc_opt_class(), "_activeCallPreferringEmergencyOrSOS");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsDTMFUpdates");

  return v3;
}

+ (id)_activeCallPreferringEmergencyOrSOS
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentCalls");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithArray:", v4);

  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callsOnDefaultPairedDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (v14)
        {
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "isEmergency", (_QWORD)v17) & 1) != 0
            || objc_msgSend(v14, "isSOS"))
          {
            v15 = v14;

            v11 = v15;
            goto LABEL_16;
          }
          if (!v11)
            v11 = v14;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_16:

  return v11;
}

- (void)_startListeningForRemoteControl
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addDelegate:queue:", self, MEMORY[0x1E0C80D38]);

}

- (void)_stopListeningForRemoteControl
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeDelegate:", self);

}

+ (id)_validDTMFDigits
{
  if (_validDTMFDigits_onceToken != -1)
    dispatch_once(&_validDTMFDigits_onceToken, &__block_literal_global_6);
  return (id)_validDTMFDigits_validDTMFDigits;
}

void __52__SOSEmergencyCallVoiceLoopManager__validDTMFDigits__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789#*"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_validDTMFDigits_validDTMFDigits;
  _validDTMFDigits_validDTMFDigits = v0;

}

- (void)_handleRemoteDTMFDigits:(id)a3
{
  id v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;

  v4 = a3;
  if (objc_msgSend(v4, "length") == 1)
  {
    v5 = objc_msgSend(v4, "characterAtIndex:", 0);
    objc_msgSend((id)objc_opt_class(), "_validDTMFDigits");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v6);

    if (!v7)
    {
      -[SOSEmergencyCallVoiceLoopManager _handleDTMFDigit:](self, "_handleDTMFDigit:", v5);
      goto LABEL_7;
    }
    -[SOSEmergencyCallVoiceLoopManager loopAnalyticsReporter](self, "loopAnalyticsReporter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v5;
    objc_msgSend(v8, "reportVoiceLoopDidStartHandlingDTMFDigitReceived:", v9);

    -[SOSEmergencyCallVoiceLoopManager loopAnalyticsReporter](self, "loopAnalyticsReporter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reportVoiceLoopDidFinishHandlingDTMFDigitReceived:", v9);

  }
  sos_voiceloop_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[SOSEmergencyCallVoiceLoopManager _handleRemoteDTMFDigits:].cold.1();

LABEL_7:
}

- (void)_handleDTMFDigit:(char)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  sos_voiceloop_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 67109376;
    v11 = v3;
    v12 = 2048;
    v13 = -[SOSEmergencyCallVoiceLoopManager playbackState](self, "playbackState");
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "_handleDTMFDigit:%c; current playbackState: %tu",
      (uint8_t *)&v10,
      0x12u);
  }

  -[SOSEmergencyCallVoiceLoopManager loopAnalyticsReporter](self, "loopAnalyticsReporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportVoiceLoopDidStartHandlingDTMFDigitReceived:", v3);

  switch((_DWORD)v3)
  {
    case '*':
      if (+[SOSUtilities BOOLOverrideForDefaultsKey:defaultValue:](SOSUtilities, "BOOLOverrideForDefaultsKey:defaultValue:", CFSTR("debug.voiceloop.demo.allowResume"), 0))
      {
        -[SOSEmergencyCallVoiceLoopManager _handleDTMFMessageResumeCommand](self, "_handleDTMFMessageResumeCommand");
        goto LABEL_13;
      }
      break;
    case '1':
      -[SOSEmergencyCallVoiceLoopManager _handleDTMFMessageRepeatCommand](self, "_handleDTMFMessageRepeatCommand");
      goto LABEL_13;
    case '0':
      -[SOSEmergencyCallVoiceLoopManager _handleDTMFMessageStopCommand](self, "_handleDTMFMessageStopCommand");
      goto LABEL_13;
  }
  sos_voiceloop_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 67109120;
    v11 = v3;
    _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, "_handleDTMFDigit %c - Unknown command; ignoring",
      (uint8_t *)&v10,
      8u);
  }

  -[SOSEmergencyCallVoiceLoopManager loopAnalyticsReporter](self, "loopAnalyticsReporter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reportVoiceLoopDidReceiveCommand:", 10000);

LABEL_13:
  -[SOSEmergencyCallVoiceLoopManager loopAnalyticsReporter](self, "loopAnalyticsReporter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reportVoiceLoopDidFinishHandlingDTMFDigitReceived:", v3);

}

- (void)_handleDTMFMessageStopCommand
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint8_t buf[4];
  unint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[SOSEmergencyCallVoiceLoopManager loopAnalyticsReporter](self, "loopAnalyticsReporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportVoiceLoopDidReceiveCommand:", 100);

  v10 = 10000;
  v4 = -[SOSEmergencyCallVoiceLoopManager playbackState](self, "playbackState");
  -[SOSEmergencyCallVoiceLoopManager stopConfirmationUtterancesForPlaybackState:remoteVariant:verbalizedActionOut:](self, "stopConfirmationUtterancesForPlaybackState:remoteVariant:verbalizedActionOut:", v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOSEmergencyCallVoiceLoopManager stopConfirmationUtterancesForPlaybackState:remoteVariant:verbalizedActionOut:](self, "stopConfirmationUtterancesForPlaybackState:remoteVariant:verbalizedActionOut:", v4, 1, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOSVoiceUtteranceVariants utteranceVariantsWithLocalUtterances:remoteUtterances:](SOSVoiceUtteranceVariants, "utteranceVariantsWithLocalUtterances:remoteUtterances:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  sos_voiceloop_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v12 = v4;
    v13 = 2048;
    v14 = v10;
    _os_log_impl(&dword_1AF4DC000, v8, OS_LOG_TYPE_DEFAULT, "_handleDTMFMessageStopCommand -- Stopping from playbackState: %tu (action: %tu)", buf, 0x16u);
  }

  -[SOSEmergencyCallVoiceLoopManager loopAnalyticsReporter](self, "loopAnalyticsReporter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reportVoiceLoopWillPerformAction:", v10);

  -[SOSEmergencyCallVoiceLoopManager speakResponseUtteranceVariants:](self, "speakResponseUtteranceVariants:", v7);
}

- (void)_handleDTMFMessageRepeatCommand
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  -[SOSEmergencyCallVoiceLoopManager loopAnalyticsReporter](self, "loopAnalyticsReporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportVoiceLoopDidReceiveCommand:", 200);

  v4 = -[SOSEmergencyCallVoiceLoopManager playbackState](self, "playbackState");
  sos_voiceloop_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4 == 100)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "_handleDTMFMessageRepeatCommand - Received repeat, but not stopped; ignoring",
        buf,
        2u);
    }

    -[SOSEmergencyCallVoiceLoopManager loopAnalyticsReporter](self, "loopAnalyticsReporter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reportVoiceLoopWillPerformAction:", 10000);
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "_handleDTMFMessageRepeatCommand - Repeating", v9, 2u);
    }

    -[SOSEmergencyCallVoiceLoopManager loopAnalyticsReporter](self, "loopAnalyticsReporter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reportVoiceLoopWillPerformAction:", 200);

    -[SOSEmergencyCallVoiceLoopManager _stopMessagePlayback](self, "_stopMessagePlayback");
    -[SOSEmergencyCallVoiceLoopManager emergencyDescriptorUtteranceVariantsForRepeatVariant:](self, "emergencyDescriptorUtteranceVariantsForRepeatVariant:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOSEmergencyCallVoiceLoopManager speakUtteranceVariants:withPlaybackState:](self, "speakUtteranceVariants:withPlaybackState:", v7, 400);
  }

}

- (void)_handleDTMFMessageResumeCommand
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  -[SOSEmergencyCallVoiceLoopManager loopAnalyticsReporter](self, "loopAnalyticsReporter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportVoiceLoopDidReceiveCommand:", 5000);

  v4 = -[SOSEmergencyCallVoiceLoopManager playbackState](self, "playbackState");
  sos_voiceloop_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4 == 100)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "_handleDTMFMessageResumeCommand - Received resume, but not stopped; ignoring",
        buf,
        2u);
    }

    -[SOSEmergencyCallVoiceLoopManager loopAnalyticsReporter](self, "loopAnalyticsReporter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reportVoiceLoopWillPerformAction:", 10000);

  }
  else
  {
    if (v6)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "_handleDTMFMessageResumeCommand - Resuming", v9, 2u);
    }

    -[SOSEmergencyCallVoiceLoopManager loopAnalyticsReporter](self, "loopAnalyticsReporter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reportVoiceLoopWillPerformAction:", 5000);

    -[SOSEmergencyCallVoiceLoopManager _stopMessagePlayback](self, "_stopMessagePlayback");
    -[SOSEmergencyCallVoiceLoopManager _startLoopPlayback](self, "_startLoopPlayback");
  }
}

- (id)stopConfirmationUtterancesForPlaybackState:(unint64_t)a3 remoteVariant:(BOOL)a4 verbalizedActionOut:(unint64_t *)a5
{
  _BOOL4 v6;
  void *v8;
  unint64_t v9;
  SOSVoiceUtterance *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SOSVoiceUtterance *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  SOSVoiceUtterance *v21;
  uint8_t buf[4];
  unint64_t v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  SOSVoiceUtterance *v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v6 = a4;
  v8 = 0;
  v30 = *MEMORY[0x1E0C80C00];
  v9 = 10000;
  if ((uint64_t)a3 > 299)
  {
    if (a3 == 300 || (v11 = 0, a3 == 400))
    {
      v8 = 0;
      v11 = 0;
      v9 = 300;
    }
  }
  else
  {
    if (a3 == 100)
    {
      if (a4)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        -[SOSEmergencyCallVoiceLoopManager localizedStringForKey:](self, "localizedStringForKey:", CFSTR("SOS_VOICELOOP_SPEECH_LOOP_STOPPED_HOW_TO_REPEAT"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", v15, 49);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[SOSEmergencyCallVoiceLoopManager localizedStringForKey:](self, "localizedStringForKey:", CFSTR("SOS_VOICELOOP_SPEECH_LOOP_STOPPED_REMOTELY"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v9 = 100;
      if (!v8)
        goto LABEL_6;
    }
    else
    {
      v11 = 0;
      if (a3 != 200)
        goto LABEL_16;
      if (!a4)
      {
        v8 = 0;
        v11 = 0;
        v9 = 400;
        goto LABEL_16;
      }
      v12 = (void *)MEMORY[0x1E0CB3940];
      -[SOSEmergencyCallVoiceLoopManager localizedStringForKey:](self, "localizedStringForKey:", CFSTR("SOS_VOICELOOP_SPEECH_LOOP_STOPPED_HOW_TO_REPEAT"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v13, 49);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = 400;
      if (!v8)
      {
LABEL_6:
        v11 = 0;
        goto LABEL_16;
      }
    }
    v16 = [SOSVoiceUtterance alloc];
    -[SOSEmergencyCallVoiceLoopManager voiceLanguage](self, "voiceLanguage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SOSVoiceUtterance initWithLocalizedMessageString:voiceLanguage:](v16, "initWithLocalizedMessageString:voiceLanguage:", v8, v17);

  }
LABEL_16:
  sos_voiceloop_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218754;
    v23 = a3;
    v24 = 1024;
    v25 = v6;
    v26 = 2114;
    v27 = v11;
    v28 = 2048;
    v29 = v9;
    _os_log_impl(&dword_1AF4DC000, v18, OS_LOG_TYPE_INFO, "stopConfirmationUtterancesForPlaybackState:%tu remoteVariant:%{BOOL}d => %{public}@ (action: %tu)", buf, 0x26u);
  }

  if (a5)
    *a5 = v9;
  if (v11)
  {
    v21 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)speakResponseUtteranceVariants:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sos_voiceloop_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "speakResponseUtteranceVariants:%{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[SOSEmergencyCallVoiceLoopManager _stopMessagePlayback](self, "_stopMessagePlayback");
  -[SOSEmergencyCallVoiceLoopManager speakUtteranceVariants:withPlaybackState:](self, "speakUtteranceVariants:withPlaybackState:", v4, 300);

}

- (id)_overrideLocation
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  const __CFString *v16;
  void *v17;
  double v18;
  int v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  void *v24;

  +[SOSUtilities numberOverrideForDefaultsKey:defaultValue:](SOSUtilities, "numberOverrideForDefaultsKey:defaultValue:", CFSTR("debug.voiceloop.demo.fakeLocation.lat"), &unk_1E5F82F88);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  +[SOSUtilities numberOverrideForDefaultsKey:defaultValue:](SOSUtilities, "numberOverrideForDefaultsKey:defaultValue:", CFSTR("debug.voiceloop.demo.fakeLocation.long"), &unk_1E5F82F88);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  +[SOSUtilities numberOverrideForDefaultsKey:defaultValue:](SOSUtilities, "numberOverrideForDefaultsKey:defaultValue:", CFSTR("debug.voiceloop.demo.fakeLocation.elev"), &unk_1E5F82F88);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  +[SOSUtilities numberOverrideForDefaultsKey:defaultValue:](SOSUtilities, "numberOverrideForDefaultsKey:defaultValue:", CFSTR("debug.voiceloop.demo.fakeLocation.accuracy"), &unk_1E5F82FA0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  if (v10 == 0.0 && v7 == 0.0 && v4 == 0.0)
    v16 = CFSTR("ApplePark");
  else
    v16 = &stru_1E5F76FF8;
  +[SOSUtilities stringOverrideForDefaultsKey:defaultValue:](SOSUtilities, "stringOverrideForDefaultsKey:defaultValue:", CFSTR("debug.voiceloop.demo.fakeLocation.poi"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isEqualToIgnoringCase:", CFSTR("ApplePark")))
  {
    v7 = -122.01;
    v18 = 37.3353;
  }
  else
  {
    v18 = v4;
  }
  v19 = objc_msgSend(v17, "isEqualToIgnoringCase:", CFSTR("NENA2024"));
  if (v19)
    v20 = -81.52789;
  else
    v20 = v7;
  if (v19)
    v21 = 28.34244;
  else
    v21 = v18;
  if (v21 == 0.0 && v20 == 0.0 && v10 == 0.0)
  {
    v22 = 0;
  }
  else
  {
    if (v19)
      v13 = 30.0;
    v23 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v23, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v24, v21, v20, v10, v13, v13);

  }
  return v22;
}

- (SOSEmergencyCallVoiceLoopManagerDelegate)delegate
{
  return (SOSEmergencyCallVoiceLoopManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (void)setTestMode:(BOOL)a3
{
  self->_testMode = a3;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (void)setUplinkVoiceUtterer:(id)a3
{
  objc_storeStrong((id *)&self->_uplinkVoiceUtterer, a3);
}

- (void)setLocalVoiceUtterer:(id)a3
{
  objc_storeStrong((id *)&self->_localVoiceUtterer, a3);
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (NSTimer)messageRepeatTimer
{
  return self->_messageRepeatTimer;
}

- (void)setMessageRepeatTimer:(id)a3
{
  objc_storeStrong((id *)&self->_messageRepeatTimer, a3);
}

- (float)loopVolume
{
  return self->_loopVolume;
}

- (void)setLoopVolume:(float)a3
{
  self->_loopVolume = a3;
}

- (_MKLocationShifter)locationShifter
{
  return self->_locationShifter;
}

- (void)setLocationShifter:(id)a3
{
  objc_storeStrong((id *)&self->_locationShifter, a3);
}

- (void)setLocationToSynthesize:(id)a3
{
  objc_storeStrong((id *)&self->_locationToSynthesize, a3);
}

- (unint64_t)playingLoopIndex
{
  return self->_playingLoopIndex;
}

- (unint64_t)playbackState
{
  return self->_playbackState;
}

- (SOSVoiceLoopAnalyticsReporter)loopAnalyticsReporter
{
  return self->_loopAnalyticsReporter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loopAnalyticsReporter, 0);
  objc_storeStrong((id *)&self->_locationToSynthesize, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_messageRepeatTimer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_localVoiceUtterer, 0);
  objc_storeStrong((id *)&self->_uplinkVoiceUtterer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_voiceLanguage, 0);
}

- (void)speakUtteranceVariants:withPlaybackState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, v0, v1, "speakUtteranceVariants - nothing to speak for utteranceVariants:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_emergencyDescriptorUtterancesForRemoteVariant:repeatVariant:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, v0, v1, "Location but no locationString; location: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_loopPhaseFromUtteranceIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, v0, v1, "_loopPhaseFromUtteranceIndex - Unexpected index:%tu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)_messageKeyForReason:shortVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, v0, v1, "_messageKeyForReason - Unexpected reason:%ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_updateLocation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1AF4DC000, a1, a3, "[SOSEmergencyCallVoiceLoopManager _updateLocation] was called with an empty location", a5, a6, a7, a8, 0);
}

- (void)_updateLocation:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1AF4DC000, v0, OS_LOG_TYPE_DEBUG, "Ignoring location: %@", v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)_handleRemoteDTMFDigits:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, v0, v1, "Unexpected dtmfUpdateDigits:%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
