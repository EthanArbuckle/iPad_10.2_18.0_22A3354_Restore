@implementation SCDAGoodnessScoreEvaluator

- (SCDAGoodnessScoreEvaluator)initWithDeviceInstanceContext:(id)a3 queue:(id)a4
{
  return -[SCDAGoodnessScoreEvaluator initWithDeviceInstanceContext:preferences:queue:instrumentation:](self, "initWithDeviceInstanceContext:preferences:queue:instrumentation:", a3, 0, a4, 0);
}

- (SCDAGoodnessScoreEvaluator)initWithDeviceInstanceContext:(id)a3 preferences:(id)a4 queue:(id)a5
{
  return -[SCDAGoodnessScoreEvaluator initWithDeviceInstanceContext:preferences:queue:instrumentation:](self, "initWithDeviceInstanceContext:preferences:queue:instrumentation:", a3, a4, a5, 0);
}

- (SCDAGoodnessScoreEvaluator)initWithDeviceInstanceContext:(id)a3 preferences:(id)a4 queue:(id)a5 instrumentation:(id)a6
{
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  SCDAGoodnessScoreEvaluator *v15;
  SCDAGoodnessScoreEvaluator *v16;
  SCDAAssistantPreferences *v17;
  SCDAAssistantPreferences *pref;
  NSString *endpointModelName;
  SCDAGoodnessScoreEvaluator *v20;
  void *v21;
  _QWORD block[4];
  SCDAGoodnessScoreEvaluator *v24;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)SCDAGoodnessScoreEvaluator;
  v15 = -[SCDAGoodnessScoreEvaluator init](&v25, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deviceInstanceContext, a3);
    if (v12)
      v17 = (SCDAAssistantPreferences *)v12;
    else
      v17 = -[SCDAAssistantPreferences initWithInstanceContext:]([SCDAAssistantPreferences alloc], "initWithInstanceContext:", v16->_deviceInstanceContext);
    pref = v16->_pref;
    v16->_pref = v17;

    v16->_platformBiasAcquisitionState = 0;
    objc_storeStrong((id *)&v16->_queue, a5);
    v16->_evaluateForAudioAccessory = 0;
    v16->_scoreEvaluationLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v16->_myriadInstrumentation, a6);
    *(_WORD *)&v16->_mediaPlaybackBoost = 5127;
    v16->_isSpeakerEndpoint = 0;
    endpointModelName = v16->_endpointModelName;
    v16->_endpointModelName = 0;

    *(_WORD *)&v16->_isRecentSiriBoostTrialEnabled = 0;
    v16->_isExponentialBoostDefined = 0;
    *(_OWORD *)&v16->_recentSiriSecondDegreeCoefficient = 0u;
    *(_OWORD *)&v16->_recentSiriIntercept = 0u;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __94__SCDAGoodnessScoreEvaluator_initWithDeviceInstanceContext_preferences_queue_instrumentation___block_invoke;
    block[3] = &unk_25174AD68;
    v20 = v16;
    v24 = v20;
    dispatch_async(v13, block);
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", v20, sel_myriadTrialBoostsUpdated_, *MEMORY[0x24BE08E30], 0);

  }
  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SCDAGoodnessScoreEvaluator;
  -[SCDAGoodnessScoreEvaluator dealloc](&v4, sel_dealloc);
}

- (void)myriadTrialBoostsUpdated:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SCDAGoodnessScoreEvaluator_myriadTrialBoostsUpdated___block_invoke;
  block[3] = &unk_25174AD68;
  block[4] = self;
  dispatch_async(queue, block);
}

- (unsigned)_getRecentBump:(double)a3 ignoreAdjustedBoost:(BOOL)a4 recentlyWonBySmallAmount:(BOOL)a5
{
  NSObject *v5;
  int v6;
  _BOOL4 v7;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unsigned int v19;
  NSObject *v20;
  NSObject *v21;
  double v22;
  double v23;
  SCDAInstrumentation *myriadInstrumentation;
  uint64_t v25;
  uint64_t v26;
  int v28;
  const char *v29;
  __int16 v30;
  double v31;
  __int16 v32;
  _BYTE v33[28];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v5 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v28 = 136315138;
      v29 = "-[SCDAGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
      _os_log_impl(&dword_246211000, v5, OS_LOG_TYPE_INFO, "%s #scda ignoring recent event bump", (uint8_t *)&v28, 0xCu);
    }
    LOBYTE(v6) = 0;
  }
  else
  {
    v7 = a5;
    v10 = 0.0;
    v11 = 0.0;
    if (+[SCDAUtilities isIOS](SCDAUtilities, "isIOS"))
    {
      if (+[SCDAUtilities isDeviceUnlocked](SCDAUtilities, "isDeviceUnlocked"))
      {
        if (!+[SCDAUtilities accessibilitySupportsAttentionAwareFeatures](SCDAUtilities, "accessibilitySupportsAttentionAwareFeatures"))
        {
          v12 = SCDALogContextCore;
          v11 = 4.0;
          if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
          {
            v28 = 136315138;
            v29 = "-[SCDAGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
            _os_log_impl(&dword_246211000, v12, OS_LOG_TYPE_INFO, "%s #scda device is unlocked and doesn't support attention, apply +4 bump", (uint8_t *)&v28, 0xCu);
          }
        }
      }
    }
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "systemUptime");
    v15 = v14;

    v16 = v15 - a3;
    v17 = v15 - a3 + -15.0;
    if (v17 < 0.0)
      v17 = 0.0;
    v18 = v17 * -0.0444444455 + 8.0;
    if (v18 >= 0.0)
      v10 = v18;
    if (self->_isRecentSiriBoostTrialEnabled && self->_isExponentialBoostDefined)
    {
      v19 = SCDAGoodnessComputeExponentialBoost(a3, v15, self->_recentSiriSecondDegreeCoefficient, self->_recentSiriFirstDegreeCoefficient, self->_recentSiriIntercept);
      v20 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        v28 = 136315650;
        v29 = "-[SCDAGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
        v30 = 2048;
        v31 = v10;
        v32 = 1024;
        *(_DWORD *)v33 = v19;
        _os_log_impl(&dword_246211000, v20, OS_LOG_TYPE_INFO, "%s #scda trial exponential boost configured, replacing %f with %du", (uint8_t *)&v28, 0x1Cu);
      }
      v10 = (double)v19;
    }
    v21 = SCDALogContextCore;
    if (v7 && v10 > v11)
    {
      v22 = 0.0;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      {
        v28 = 136316162;
        v29 = "-[SCDAGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
        v30 = 2048;
        v31 = v16;
        v32 = 2048;
        *(double *)v33 = v11;
        *(_WORD *)&v33[8] = 2048;
        *(double *)&v33[10] = v11;
        *(_WORD *)&v33[18] = 2048;
        *(double *)&v33[20] = v10;
        _os_log_impl(&dword_246211000, v21, OS_LOG_TYPE_INFO, "%s #scda previous close win: canceling recency bump from secsAgo=%f yields %f = %f(act) + %f(siri)", (uint8_t *)&v28, 0x34u);
        v21 = SCDALogContextCore;
      }
    }
    else
    {
      v22 = v10;
    }
    if (v11 >= v22)
      v23 = v11;
    else
      v23 = v22;
    v6 = (int)v23;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v28 = 136316162;
      v29 = "-[SCDAGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
      v30 = 2048;
      v31 = v16;
      v32 = 1024;
      *(_DWORD *)v33 = v6;
      *(_WORD *)&v33[4] = 2048;
      *(double *)&v33[6] = v11;
      *(_WORD *)&v33[14] = 2048;
      *(double *)&v33[16] = v22;
      _os_log_impl(&dword_246211000, v21, OS_LOG_TYPE_INFO, "%s #scda bumptoGoodness secsAgo=%f yields %d = %f(act) + %f(siri)", (uint8_t *)&v28, 0x30u);
    }
    myriadInstrumentation = self->_myriadInstrumentation;
    if (myriadInstrumentation && v6)
    {
      if (v11 <= v22)
      {
        v25 = v22;
        v26 = 4;
      }
      else
      {
        v25 = v11;
        v26 = 2;
      }
      -[SCDAInstrumentation updateBoost:value:](myriadInstrumentation, "updateBoost:value:", v26, v25);
    }
  }
  return v6;
}

- (unsigned)getPlatformBias
{
  NSObject *v3;
  int myriadPlatformBias;
  SCDAInstrumentation *myriadInstrumentation;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    myriadPlatformBias = self->_myriadPlatformBias;
    v7 = 136315394;
    v8 = "-[SCDAGoodnessScoreEvaluator getPlatformBias]";
    v9 = 1024;
    v10 = myriadPlatformBias;
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s #scda bumping goodness score (reason: platform bias, adjusted bias: %d)", (uint8_t *)&v7, 0x12u);
  }
  myriadInstrumentation = self->_myriadInstrumentation;
  if (myriadInstrumentation)
    -[SCDAInstrumentation updateBoost:value:](myriadInstrumentation, "updateBoost:value:", 1, self->_myriadPlatformBias);
  return self->_myriadPlatformBias;
}

- (BOOL)deviceAdjustTrialEnabled
{
  NSObject *v3;
  _BOOL4 isDeviceAdjustTrialEnabled;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    isDeviceAdjustTrialEnabled = self->_isDeviceAdjustTrialEnabled;
    v6 = 136315394;
    v7 = "-[SCDAGoodnessScoreEvaluator deviceAdjustTrialEnabled]";
    v8 = 1024;
    v9 = isDeviceAdjustTrialEnabled;
    _os_log_debug_impl(&dword_246211000, v3, OS_LOG_TYPE_DEBUG, "%s #scda device adjust trial enabled: %du", (uint8_t *)&v6, 0x12u);
  }
  return self->_isDeviceAdjustTrialEnabled;
}

- (int64_t)deviceAdjustTrialValue
{
  NSObject *v3;
  int64_t deviceAdjust;
  int v6;
  const char *v7;
  __int16 v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    deviceAdjust = self->_deviceAdjust;
    v6 = 136315394;
    v7 = "-[SCDAGoodnessScoreEvaluator deviceAdjustTrialValue]";
    v8 = 2048;
    v9 = deviceAdjust;
    _os_log_debug_impl(&dword_246211000, v3, OS_LOG_TYPE_DEBUG, "%s #scda device adjust value: %ld", (uint8_t *)&v6, 0x16u);
  }
  return self->_deviceAdjust;
}

- (unsigned)_bumpGoodnessScore:(id)a3 lastActivationTime:(double)a4 mediaPlaybackInterruptedTime:(double)a5 ignoreAdjustedBoost:(BOOL)a6 recentlyWonBySmallAmount:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  void *v13;
  uint64_t alarmTimerBoost;
  unsigned __int8 v15;
  NSObject *v17;
  SCDAInstrumentation *myriadInstrumentation;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  SCDAInstrumentation *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  _BYTE v29[24];
  uint64_t v30;
  uint64_t v31;

  v7 = a7;
  v8 = a6;
  v31 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = v12;
  if (!v12 || (objc_msgSend(v12, "containsObject:", &unk_251755398) & 1) != 0)
  {
    LOBYTE(alarmTimerBoost) = 0;
    goto LABEL_4;
  }
  if (objc_msgSend(v13, "containsObject:", &unk_2517553B0))
  {
    alarmTimerBoost = self->_alarmTimerBoost;
    v17 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v29 = 136315394;
      *(_QWORD *)&v29[4] = "-[SCDAGoodnessScoreEvaluator _bumpGoodnessScore:lastActivationTime:mediaPlaybackInterruptedTi"
                           "me:ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
      *(_WORD *)&v29[12] = 1024;
      *(_DWORD *)&v29[14] = alarmTimerBoost;
      _os_log_impl(&dword_246211000, v17, OS_LOG_TYPE_INFO, "%s #scda bumping goodness score (reason: alarm/timer firing, adjusted score: %d)", v29, 0x12u);
    }
    myriadInstrumentation = self->_myriadInstrumentation;
    if (myriadInstrumentation)
      -[SCDAInstrumentation updateBoost:value:](myriadInstrumentation, "updateBoost:value:", 7, alarmTimerBoost);
  }
  else
  {
    LOBYTE(alarmTimerBoost) = 0;
  }
  if (objc_msgSend(v13, "containsObject:", &unk_2517553C8))
  {
    if (!+[SCDAUtilities isCommunal](SCDAUtilities, "isCommunal"))
      goto LABEL_4;
    LOBYTE(alarmTimerBoost) = self->_mediaPlaybackBoost + alarmTimerBoost;
    v19 = SCDALogContextCore;
    if (!os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    *(_DWORD *)v29 = 136315394;
    *(_QWORD *)&v29[4] = "-[SCDAGoodnessScoreEvaluator _bumpGoodnessScore:lastActivationTime:mediaPlaybackInterruptedTime"
                         ":ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
    *(_WORD *)&v29[12] = 1024;
    *(_DWORD *)&v29[14] = alarmTimerBoost;
    v20 = "%s #scda bumping goodness score (reason: media playback active, bump: %d)";
    v21 = v19;
    v22 = 18;
    goto LABEL_15;
  }
  if (!objc_msgSend(v13, "containsObject:", &unk_2517553E0))
    goto LABEL_4;
  if (!+[SCDAUtilities isCommunal](SCDAUtilities, "isCommunal"))
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "systemUptime");
  v26 = v25;

  if (v26 <= a5)
    goto LABEL_4;
  v27 = v26 - a5;
  if (v27 > 60.0)
    goto LABEL_4;
  LOBYTE(alarmTimerBoost) = self->_mediaPlaybackBoost + alarmTimerBoost;
  v28 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v29 = 136315650;
    *(_QWORD *)&v29[4] = "-[SCDAGoodnessScoreEvaluator _bumpGoodnessScore:lastActivationTime:mediaPlaybackInterruptedTime"
                         ":ignoreAdjustedBoost:recentlyWonBySmallAmount:]";
    *(_WORD *)&v29[12] = 2048;
    *(double *)&v29[14] = v27;
    *(_WORD *)&v29[22] = 1024;
    LODWORD(v30) = alarmTimerBoost;
    v20 = "%s #scda bumping goodness score (reason: media playback interrupted, last playback time: %f seconds ago, bump: %d)";
    v21 = v28;
    v22 = 28;
LABEL_15:
    _os_log_impl(&dword_246211000, v21, OS_LOG_TYPE_INFO, v20, v29, v22);
  }
LABEL_16:
  v23 = self->_myriadInstrumentation;
  if (v23)
    -[SCDAInstrumentation updateBoost:value:](v23, "updateBoost:value:", 6, alarmTimerBoost);
LABEL_4:
  v15 = -[SCDAGoodnessScoreEvaluator _getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:](self, "_getRecentBump:ignoreAdjustedBoost:recentlyWonBySmallAmount:", v8, v7, a4, *(_OWORD *)v29, *(_QWORD *)&v29[16], v30);

  return v15 + alarmTimerBoost;
}

- (void)_updatePlatformBias:(unsigned __int8)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_scoreEvaluationLock;
  SCDAInstrumentation *myriadInstrumentation;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  self->_myriadPlatformBias = v3;
  myriadInstrumentation = self->_myriadInstrumentation;
  if (myriadInstrumentation)
    -[SCDAInstrumentation updateBoost:value:](myriadInstrumentation, "updateBoost:value:", 1, v3);
  os_unfair_lock_unlock(p_scoreEvaluationLock);
  v7 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[SCDAGoodnessScoreEvaluator _updatePlatformBias:]";
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_246211000, v7, OS_LOG_TYPE_INFO, "%s #scda updated platform bias to %d", (uint8_t *)&v8, 0x12u);
  }
}

- (void)_updateMediaPlaybackBoost:(unsigned __int8)a3
{
  os_unfair_lock_s *p_scoreEvaluationLock;
  NSObject *v6;
  int mediaPlaybackBoost;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  self->_mediaPlaybackBoost = a3;
  os_unfair_lock_unlock(p_scoreEvaluationLock);
  v6 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    mediaPlaybackBoost = self->_mediaPlaybackBoost;
    v8 = 136315394;
    v9 = "-[SCDAGoodnessScoreEvaluator _updateMediaPlaybackBoost:]";
    v10 = 1024;
    v11 = mediaPlaybackBoost;
    _os_log_impl(&dword_246211000, v6, OS_LOG_TYPE_INFO, "%s #scda updated _mediaPlaybackBoost to %d", (uint8_t *)&v8, 0x12u);
  }
}

- (void)_updateRecentSiriBoostTrialEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_scoreEvaluationLock;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  self->_isRecentSiriBoostTrialEnabled = a3;
  os_unfair_lock_unlock(p_scoreEvaluationLock);
  v6 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("YES");
    if (!self->_isRecentSiriBoostTrialEnabled)
      v7 = CFSTR("NO");
    v8 = 136315394;
    v9 = "-[SCDAGoodnessScoreEvaluator _updateRecentSiriBoostTrialEnabled:]";
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_246211000, v6, OS_LOG_TYPE_INFO, "%s #scda updated _isRecentSiriBoostTrialEnabled to %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_updateDeviceAdjustTrialEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_scoreEvaluationLock;
  NSObject *v6;
  const __CFString *v7;
  int64_t deviceAdjust;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  self->_isDeviceAdjustTrialEnabled = a3;
  os_unfair_lock_unlock(p_scoreEvaluationLock);
  v6 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("YES");
    deviceAdjust = self->_deviceAdjust;
    if (!self->_isDeviceAdjustTrialEnabled)
      v7 = CFSTR("NO");
    v9 = 136315650;
    v10 = "-[SCDAGoodnessScoreEvaluator _updateDeviceAdjustTrialEnabled:]";
    v11 = 2112;
    v12 = v7;
    v13 = 2048;
    v14 = deviceAdjust;
    _os_log_impl(&dword_246211000, v6, OS_LOG_TYPE_INFO, "%s #scda updated isDeviceAdjustTrialEnabled to Enabled: %@ (Value: %ld)", (uint8_t *)&v9, 0x20u);
  }
}

- (void)_updateDeviceAdjust:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  const __CFString *v7;
  int64_t deviceAdjust;
  int v9;
  const char *v10;
  __int16 v11;
  int64_t v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a3 - 129) > 0xFFFFFFFFFFFFFEFELL)
  {
    os_unfair_lock_lock(&self->_scoreEvaluationLock);
    self->_deviceAdjust = a3;
    os_unfair_lock_unlock(&self->_scoreEvaluationLock);
    v6 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("YES");
      deviceAdjust = self->_deviceAdjust;
      if (!self->_isDeviceAdjustTrialEnabled)
        v7 = CFSTR("NO");
      v9 = 136315650;
      v10 = "-[SCDAGoodnessScoreEvaluator _updateDeviceAdjust:]";
      v11 = 2112;
      v12 = (int64_t)v7;
      v13 = 2048;
      v14 = deviceAdjust;
      _os_log_impl(&dword_246211000, v6, OS_LOG_TYPE_INFO, "%s #scda updated Trial Device Adjust to (Enabled: %@) Value %ld", (uint8_t *)&v9, 0x20u);
    }
  }
  else
  {
    v5 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[SCDAGoodnessScoreEvaluator _updateDeviceAdjust:]";
      v11 = 2048;
      v12 = a3;
      _os_log_error_impl(&dword_246211000, v5, OS_LOG_TYPE_ERROR, "%s #scda Error: Attempting to assign out of bounds device adjust: %ld", (uint8_t *)&v9, 0x16u);
    }
    os_unfair_lock_lock(&self->_scoreEvaluationLock);
    self->_deviceAdjust = 0;
    os_unfair_lock_unlock(&self->_scoreEvaluationLock);
  }
}

- (void)_updateRecentSiriExponentialBoostDefined:(BOOL)a3 withSecondDegree:(double)a4 andFirstDegree:(double)a5 andIntercept:(double)a6
{
  os_unfair_lock_s *p_scoreEvaluationLock;
  NSObject *v12;
  _BOOL4 isExponentialBoostDefined;
  double recentSiriSecondDegreeCoefficient;
  double recentSiriFirstDegreeCoefficient;
  double recentSiriIntercept;
  int v17;
  const char *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  self->_isExponentialBoostDefined = a3;
  self->_recentSiriSecondDegreeCoefficient = a4;
  self->_recentSiriFirstDegreeCoefficient = a5;
  self->_recentSiriIntercept = a6;
  os_unfair_lock_unlock(p_scoreEvaluationLock);
  v12 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    isExponentialBoostDefined = self->_isExponentialBoostDefined;
    recentSiriSecondDegreeCoefficient = self->_recentSiriSecondDegreeCoefficient;
    recentSiriFirstDegreeCoefficient = self->_recentSiriFirstDegreeCoefficient;
    recentSiriIntercept = self->_recentSiriIntercept;
    v17 = 136316162;
    v18 = "-[SCDAGoodnessScoreEvaluator _updateRecentSiriExponentialBoostDefined:withSecondDegree:andFirstDegree:andIntercept:]";
    v19 = 1024;
    v20 = isExponentialBoostDefined;
    v21 = 2048;
    v22 = recentSiriSecondDegreeCoefficient;
    v23 = 2048;
    v24 = recentSiriFirstDegreeCoefficient;
    v25 = 2048;
    v26 = recentSiriIntercept;
    _os_log_impl(&dword_246211000, v12, OS_LOG_TYPE_INFO, "%s #scda updated Trial recent Siri exponential boost to %du %.12f %.12f %.12f", (uint8_t *)&v17, 0x30u);
  }
}

- (void)_updateSidekickBoosts:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[SCDAGoodnessScoreEvaluator _updateSidekickBoosts:]";
    _os_log_error_impl(&dword_246211000, v3, OS_LOG_TYPE_ERROR, "%s #scda Error updating sidekick boosts: unsupported platform", (uint8_t *)&v4, 0xCu);
  }
}

- (id)_createSettingsConnectionIfRequired
{
  AFSettingsConnection *settingsConnection;
  AFSettingsConnection *v4;
  AFSettingsConnection *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  settingsConnection = self->_settingsConnection;
  if (!settingsConnection)
  {
    v4 = (AFSettingsConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BE092B8]), "initWithInstanceContext:", self->_deviceInstanceContext);
    v5 = self->_settingsConnection;
    self->_settingsConnection = v4;

    -[AFSettingsConnection setXPCConnectionManagementQueue:](self->_settingsConnection, "setXPCConnectionManagementQueue:", self->_queue);
    settingsConnection = self->_settingsConnection;
  }
  return settingsConnection;
}

- (void)_fetchDevicePlatformBiasIfRequired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_platformBiasAcquisitionState != 2)
  {
    if (+[SCDAUtilities isHorseman](SCDAUtilities, "isHorseman"))
      -[SCDAGoodnessScoreEvaluator _updatePlatformBias:](self, "_updatePlatformBias:", 40);
    self->_platformBiasAcquisitionState = 2;
  }
}

- (id)_readSidekickBoostsFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "fileExistsAtPath:", v3) & 1) == 0)
    {
      v11 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[SCDAGoodnessScoreEvaluator _readSidekickBoostsFile:]";
        v21 = 2112;
        v22 = v3;
        _os_log_error_impl(&dword_246211000, v11, OS_LOG_TYPE_ERROR, "%s Unable to find sidekick boosts plist at path %@.", buf, 0x16u);
      }
      v10 = 0;
      goto LABEL_23;
    }
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:", v3);
    if (!v5)
    {
      v12 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[SCDAGoodnessScoreEvaluator _readSidekickBoostsFile:]";
        v21 = 2112;
        v22 = v3;
        _os_log_error_impl(&dword_246211000, v12, OS_LOG_TYPE_ERROR, "%s Unable to read sidekick boosts plist file at path %@.", buf, 0x16u);
      }
      v10 = 0;
      goto LABEL_22;
    }
    v18 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v5, 0, 0, &v18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v18;
    if (v7)
    {
      v8 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v20 = "-[SCDAGoodnessScoreEvaluator _readSidekickBoostsFile:]";
        v21 = 2112;
        v22 = v3;
        v23 = 2112;
        v24 = v7;
        _os_log_error_impl(&dword_246211000, v8, OS_LOG_TYPE_ERROR, "%s Unable to initialize sidekick boosts from plist file at path %@ due to error %@", buf, 0x20u);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v6;
LABEL_21:

LABEL_22:
LABEL_23:

        goto LABEL_24;
      }
      v13 = (void *)SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
      {
        v15 = v13;
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v20 = "-[SCDAGoodnessScoreEvaluator _readSidekickBoostsFile:]";
        v21 = 2112;
        v22 = v17;
        _os_log_error_impl(&dword_246211000, v15, OS_LOG_TYPE_ERROR, "%s Unexpected type of initialized sidekick boosts plist %@.", buf, 0x16u);

      }
    }
    v10 = 0;
    goto LABEL_21;
  }
  v9 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[SCDAGoodnessScoreEvaluator _readSidekickBoostsFile:]";
    _os_log_error_impl(&dword_246211000, v9, OS_LOG_TYPE_ERROR, "%s _readSidekickBoostsFile: called with empty filepath", buf, 0xCu);
  }
  v10 = 0;
LABEL_24:

  return v10;
}

- (unint64_t)_findSidekickBoost:(id)a3 isSpeaker:(BOOL)a4 model:(id)a5
{
  return 0;
}

- (void)_reloadTrialConfiguredBoostValues
{
  OS_dispatch_queue **p_queue;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  _QWORD v16[6];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  p_queue = &self->_queue;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1644;
  v14 = __Block_byref_object_dispose__1645;
  v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE092B8]), "initWithInstanceContext:", self->_deviceInstanceContext);
  objc_msgSend((id)v11[5], "setXPCConnectionManagementQueue:", *p_queue);
  objc_initWeak(&location, self);
  v4 = (void *)v11[5];
  v17[0] = CFSTR("RECENT_SIRI_BOOST_TRIAL_ENABLE");
  v17[1] = CFSTR("DEVICE_ADJUST_ENABLE");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("RECENT_PLAYBACK_BOOST");
  v16[1] = CFSTR("HOMEPOD_BOOST");
  v16[2] = CFSTR("RECENT_SIRI_BOOST_SECOND_DEGREE_COEFF");
  v16[3] = CFSTR("RECENT_SIRI_BOOST_FIRST_DEGREE_COEFF");
  v16[4] = CFSTR("RECENT_SIRI_BOOST_INTERCEPT");
  v16[5] = CFSTR("DEVICE_ADJUST");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__SCDAGoodnessScoreEvaluator__reloadTrialConfiguredBoostValues__block_invoke;
  v7[3] = &unk_25174A490;
  objc_copyWeak(&v8, &location);
  v7[4] = &v10;
  objc_msgSend(v4, "getTrialEnables:doubleFactors:withCompletion:", v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v10, 8);

}

- (void)preheat
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__SCDAGoodnessScoreEvaluator_preheat__block_invoke;
  block[3] = &unk_25174AD68;
  block[4] = self;
  dispatch_async(queue, block);
}

- (unsigned)getMyriadAdjustedBoostForGoodnessScoreContext:(id)a3
{
  id v4;
  NSObject *v5;
  os_unfair_lock_s *p_scoreEvaluationLock;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  unsigned int v10;
  void *v11;
  double lastActivationTime;
  double v13;
  NSObject *v14;
  unsigned __int8 v15;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v17 = 136315138;
    v18 = "-[SCDAGoodnessScoreEvaluator getMyriadAdjustedBoostForGoodnessScoreContext:]";
    _os_log_impl(&dword_246211000, v5, OS_LOG_TYPE_INFO, "%s #scda", (uint8_t *)&v17, 0xCu);
  }
  p_scoreEvaluationLock = &self->_scoreEvaluationLock;
  os_unfair_lock_lock(&self->_scoreEvaluationLock);
  v7 = -[SCDAAssistantPreferences myriadShouldIgnoreAdjustedBoost](self->_pref, "myriadShouldIgnoreAdjustedBoost");
  v8 = -[SCDAAssistantPreferences ignoreMyriadPlatformBias](self->_pref, "ignoreMyriadPlatformBias");
  v9 = v8;
  if (v7 && v8)
  {
    v10 = 0;
  }
  else if (v7)
  {
    v10 = -[SCDAGoodnessScoreEvaluator getPlatformBias](self, "getPlatformBias");
  }
  else
  {
    objc_msgSend(v4, "reasons");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    lastActivationTime = self->_lastActivationTime;
    objc_msgSend(v4, "mediaPlaybackInterruptedTime");
    v10 = -[SCDAGoodnessScoreEvaluator _bumpGoodnessScore:lastActivationTime:mediaPlaybackInterruptedTime:ignoreAdjustedBoost:recentlyWonBySmallAmount:](self, "_bumpGoodnessScore:lastActivationTime:mediaPlaybackInterruptedTime:ignoreAdjustedBoost:recentlyWonBySmallAmount:", v11, 0, objc_msgSend(v4, "recentlyWonBySmallAmount"), lastActivationTime, v13);

    if (!v9)
      v10 += -[SCDAGoodnessScoreEvaluator getPlatformBias](self, "getPlatformBias");
  }
  v14 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v17 = 136315394;
    v18 = "-[SCDAGoodnessScoreEvaluator getMyriadAdjustedBoostForGoodnessScoreContext:]";
    v19 = 2048;
    v20 = v10;
    _os_log_impl(&dword_246211000, v14, OS_LOG_TYPE_INFO, "%s #scda adjusted score: %ld", (uint8_t *)&v17, 0x16u);
  }
  if (v10 >= 0xFF)
    v15 = -1;
  else
    v15 = v10;
  os_unfair_lock_unlock(p_scoreEvaluationLock);

  return v15;
}

- (BOOL)evaluateForAudioAccessory
{
  return self->_evaluateForAudioAccessory;
}

- (double)lastActivationTime
{
  return self->_lastActivationTime;
}

- (void)setLastActivationTime:(double)a3
{
  self->_lastActivationTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointModelName, 0);
  objc_storeStrong((id *)&self->_myriadInstrumentation, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
  objc_storeStrong((id *)&self->_pref, 0);
  objc_storeStrong((id *)&self->_deviceInstanceContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __37__SCDAGoodnessScoreEvaluator_preheat__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchDevicePlatformBiasIfRequired");
}

void __63__SCDAGoodnessScoreEvaluator__reloadTrialConfiguredBoostValues__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  double v33;
  double v34;
  NSObject *v35;
  void *v36;
  unsigned int v37;
  NSObject *v38;
  void *v39;
  void *v40;
  int v41;
  unsigned int v42;
  unsigned __int8 v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v9)
    {
      v11 = SCDALogContextCore;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v55 = "-[SCDAGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
        v56 = 2112;
        v57 = v9;
        _os_log_debug_impl(&dword_246211000, v11, OS_LOG_TYPE_DEBUG, "%s #scda Error loading Trial factors: %@", buf, 0x16u);
      }
    }
    else
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("RECENT_SIRI_BOOST_TRIAL_ENABLE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");
      if (v12)
      {
        objc_msgSend(WeakRetained, "_updateRecentSiriBoostTrialEnabled:", v13);
      }
      else
      {
        v14 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v55 = "-[SCDAGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
          _os_log_debug_impl(&dword_246211000, v14, OS_LOG_TYPE_DEBUG, "%s #scda Recent Siri Boost Trial Enable Not Loaded", buf, 0xCu);
        }
      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("DEVICE_ADJUST_ENABLE"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "BOOLValue");
      if (v15)
      {
        objc_msgSend(WeakRetained, "_updateDeviceAdjustTrialEnabled:", v16);
      }
      else
      {
        v17 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v55 = "-[SCDAGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
          _os_log_debug_impl(&dword_246211000, v17, OS_LOG_TYPE_DEBUG, "%s #scda Device Adjust Trial Enable not loaded", buf, 0xCu);
        }
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DEVICE_ADJUST"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v18;
      if (v18)
      {
        objc_msgSend(WeakRetained, "_updateDeviceAdjust:", objc_msgSend(v18, "integerValue"));
      }
      else
      {
        v19 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v55 = "-[SCDAGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
          _os_log_debug_impl(&dword_246211000, v19, OS_LOG_TYPE_DEBUG, "%s #scda Device Adjust Trial Value not loaded", buf, 0xCu);
        }
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RECENT_SIRI_BOOST_SECOND_DEGREE_COEFF"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RECENT_SIRI_BOOST_FIRST_DEGREE_COEFF"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RECENT_SIRI_BOOST_INTERCEPT"));
      v22 = objc_claimAutoreleasedReturnValue();
      if (v20)
        v23 = v13;
      else
        v23 = 0;
      v52 = (void *)v22;
      v53 = v21;
      if (v23 == 1 && v21 && v22)
      {
        v24 = (void *)v22;
        objc_msgSend(v20, "doubleValue");
        v26 = v25;
        objc_msgSend(v21, "doubleValue");
        v28 = v27;
        objc_msgSend(v24, "doubleValue");
        v30 = v29;
        v31 = WeakRetained;
        v32 = 1;
        v33 = v26;
        v34 = v28;
      }
      else
      {
        v35 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v55 = "-[SCDAGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
          v56 = 2112;
          v57 = v20;
          v58 = 2112;
          v59 = v53;
          v60 = 2112;
          v61 = v52;
          _os_log_debug_impl(&dword_246211000, v35, OS_LOG_TYPE_DEBUG, "%s #scda Recent Siri exponential factors not loaded: %@ %@ %@", buf, 0x2Au);
        }
        v33 = 0.0;
        v34 = 0.0;
        v30 = 0.0;
        v31 = WeakRetained;
        v32 = 0;
      }
      objc_msgSend(v31, "_updateRecentSiriExponentialBoostDefined:withSecondDegree:andFirstDegree:andIntercept:", v32, v33, v34, v30);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RECENT_PLAYBACK_BOOST"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "unsignedIntValue");
      if (v36 && v37 <= 0xFF)
      {
        objc_msgSend(WeakRetained, "_updateMediaPlaybackBoost:", v37);
      }
      else
      {
        v38 = SCDALogContextCore;
        if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v55 = "-[SCDAGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
          v56 = 2112;
          v57 = v36;
          _os_log_debug_impl(&dword_246211000, v38, OS_LOG_TYPE_DEBUG, "%s #scda Trial Playback Boost not loaded: %@", buf, 0x16u);
        }
      }
      if (+[SCDAUtilities isCommunal](SCDAUtilities, "isCommunal"))
      {
        v49 = v12;
        v50 = v15;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HOMEPOD_BOOST"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MULTI_DEVICE_TRIAL_TREATMENT_CONSENSUS"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "BOOLValue");

        v42 = objc_msgSend(v39, "unsignedIntValue");
        if (v39 && (v43 = v42, v42 <= 0xFF))
        {
          if (SCDAIsInternalInstall_onceToken != -1)
            dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1256);
          if (SCDAIsInternalInstall_isInternal && !v41)
          {
            v45 = WeakRetained;
            v44 = 40;
          }
          else
          {
            v44 = v43;
            v45 = WeakRetained;
          }
          objc_msgSend(v45, "_updatePlatformBias:", v44);
          v12 = v49;
        }
        else
        {
          v46 = SCDALogContextCore;
          v12 = v49;
          if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v55 = "-[SCDAGoodnessScoreEvaluator _reloadTrialConfiguredBoostValues]_block_invoke";
            v56 = 2112;
            v57 = v39;
            _os_log_debug_impl(&dword_246211000, v46, OS_LOG_TYPE_DEBUG, "%s #scda Trial HomePod Boost not loaded: %@", buf, 0x16u);
          }
        }

        v15 = v50;
      }
      v47 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v48 = *(void **)(v47 + 40);
      *(_QWORD *)(v47 + 40) = 0;

    }
  }

}

uint64_t __55__SCDAGoodnessScoreEvaluator_myriadTrialBoostsUpdated___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SCDAGoodnessScoreEvaluator myriadTrialBoostsUpdated:]_block_invoke";
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s Trial Boosts Updated Notification", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_reloadTrialConfiguredBoostValues");
}

uint64_t __94__SCDAGoodnessScoreEvaluator_initWithDeviceInstanceContext_preferences_queue_instrumentation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_fetchDevicePlatformBiasIfRequired");
  return objc_msgSend(*(id *)(a1 + 32), "_reloadTrialConfiguredBoostValues");
}

@end
