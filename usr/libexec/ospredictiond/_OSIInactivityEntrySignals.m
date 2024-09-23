@implementation _OSIInactivityEntrySignals

- (_OSIInactivityEntrySignals)init
{
  _OSIInactivityEntrySignals *v2;
  OSIAmbientLightMonitor *v3;
  OSIAmbientLightMonitor *lightMonitor;
  OSIMotionMonitor *v5;
  OSIMotionMonitor *motionMonitor;
  OSIMediaPlaybackMonitor *v7;
  OSIMediaPlaybackMonitor *mediaPlaybackMonitor;
  OSISleepScheduleMonitor *v9;
  OSISleepScheduleMonitor *sleepScheduleMonitor;
  OSIBLSStateMonitor *v11;
  OSIBLSStateMonitor *blsStateMonitor;
  uint64_t v13;
  TRIClient *trialClient;
  TRIClient *v15;
  id v16;
  os_log_t v17;
  OS_os_log *log;
  _QWORD v20[4];
  id v21;
  id location;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)_OSIInactivityEntrySignals;
  v2 = -[_OSIInactivityEntrySignals init](&v23, "init");
  if (v2)
  {
    v3 = objc_alloc_init(OSIAmbientLightMonitor);
    lightMonitor = v2->_lightMonitor;
    v2->_lightMonitor = v3;

    v5 = objc_alloc_init(OSIMotionMonitor);
    motionMonitor = v2->_motionMonitor;
    v2->_motionMonitor = v5;

    v7 = objc_alloc_init(OSIMediaPlaybackMonitor);
    mediaPlaybackMonitor = v2->_mediaPlaybackMonitor;
    v2->_mediaPlaybackMonitor = v7;

    v9 = objc_alloc_init(OSISleepScheduleMonitor);
    sleepScheduleMonitor = v2->_sleepScheduleMonitor;
    v2->_sleepScheduleMonitor = v9;

    v11 = objc_alloc_init(OSIBLSStateMonitor);
    blsStateMonitor = v2->_blsStateMonitor;
    v2->_blsStateMonitor = v11;

    v13 = objc_claimAutoreleasedReturnValue(+[TRIClient clientWithIdentifier:](TRIClient, "clientWithIdentifier:", 293));
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v13;

    -[_OSIInactivityEntrySignals updateTrialParameters](v2, "updateTrialParameters");
    objc_initWeak(&location, v2);
    v15 = v2->_trialClient;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000CEFC;
    v20[3] = &unk_1000608F0;
    objc_copyWeak(&v21, &location);
    v16 = -[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](v15, "addUpdateHandlerForNamespaceName:usingBlock:", CFSTR("COREOS_PREDICTION_INACTIVITY"), v20);
    v17 = os_log_create("com.apple.osintelligence", "sleep.signals");
    log = v2->_log;
    v2->_log = (OS_os_log *)v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)updateTrialParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("requeryDelta"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  self->_requeryDelta = objc_msgSend(v3, "longValue");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("darkLuxThreshold"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  self->_maxDarkLuxThreshold = objc_msgSend(v4, "longValue");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("signalsNegativeLuxPreventsEngagement"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  self->_excludeNegativeLux = objc_msgSend(v5, "BOOLeanValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("immediateDarkLuxThreshold"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  self->_immediateMaxDarkLuxThreshold = objc_msgSend(v6, "longValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("initialDarkLuxThreshold"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  self->_initialMaxDarkLuxThreshold = objc_msgSend(v7, "longValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("pctStationary"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  objc_msgSend(v8, "doubleValue");
  self->_minPctStationaryThreshold = v9;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("stationaryLookback"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  objc_msgSend(v10, "doubleValue");
  self->_stationaryLookbackSeconds = v11;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("immediatePctStationary"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  objc_msgSend(v12, "doubleValue");
  self->_immediateMinPctStationaryThreshold = v13;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("initialPctStationary"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  objc_msgSend(v14, "doubleValue");
  self->_initialMinPctStationaryThreshold = v15;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("playbackThreshold"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  objc_msgSend(v16, "doubleValue");
  self->_maxPlaybackThreshold = v17;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("playbackLookback"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  objc_msgSend(v18, "doubleValue");
  self->_playbackLookbackSeconds = v19;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("useSleep"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  self->_useSleep = objc_msgSend(v20, "BOOLeanValue");

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("bedtimeOffset"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  objc_msgSend(v21, "doubleValue");
  self->_bedtimeOffset = v22;

  v24 = (id)objc_claimAutoreleasedReturnValue(-[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("wakeOffset"), CFSTR("COREOS_PREDICTION_INACTIVITY")));
  objc_msgSend(v24, "doubleValue");
  self->_wakeOffset = v23;

}

- (BOOL)checkSleepSignalsWithTimeSinceInactive:(double)a3 andPredictorType:(id)a4
{
  id v6;
  void *v7;
  signed int v8;
  int v9;
  int lux;
  int v11;
  OS_os_log *log;
  int v13;
  _BOOL4 v14;
  OS_os_log *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  _BOOL4 v21;
  _BOOL4 v22;
  OS_os_log *v23;
  double v24;
  BOOL v25;
  OS_os_log *v26;
  double pctStationary;
  _BOOL4 inCar;
  BOOL v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  BOOL areSleepHeuristicsMet;
  OS_os_log *v36;
  int v37;
  _BYTE v38[10];
  double v39;
  __int16 v40;
  _BOOL4 v41;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = -[_OSIInactivityEntrySignals dynamicMaxDarkLuxThresholdSinceWait:](self, "dynamicMaxDarkLuxThresholdSinceWait:", a3);
  self->_lux = -[OSIAmbientLightMonitor currentAmbientLightLevel](self->_lightMonitor, "currentAmbientLightLevel");
  v9 = MGGetBoolAnswer(CFSTR("j8/Omm6s1lsmTDFsXjsBfA"));
  self->_canAlwaysReadLux = v9;
  if (v9)
  {
    lux = self->_lux;
    if (lux >= v8 || (v11 = 1, lux < 0) && self->_excludeNegativeLux)
    {
      log = self->_log;
      v11 = 0;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        v13 = self->_lux;
        v37 = 67109376;
        *(_DWORD *)v38 = v13;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Restricting entry because lux is %d (>= %d)", (uint8_t *)&v37, 0xEu);
        v11 = 0;
      }
    }
  }
  else
  {
    v11 = 1;
  }
  v14 = -[OSIBLSStateMonitor aodOffOrSuppressed](self->_blsStateMonitor, "aodOffOrSuppressed");
  self->_aodAlreadySuppressedOrOff = v14;
  if (v14)
  {
    v15 = self->_log;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v37) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_DEFAULT, "Restricting entry because already suppressed", (uint8_t *)&v37, 2u);
    }
    -[_OSIInactivityEntrySignals dynamicMinPctStationaryThresholdSinceWait:](self, "dynamicMinPctStationaryThresholdSinceWait:", a3);
    v17 = v16;
    goto LABEL_14;
  }
  -[_OSIInactivityEntrySignals dynamicMinPctStationaryThresholdSinceWait:](self, "dynamicMinPctStationaryThresholdSinceWait:", a3);
  v17 = v18;
  if (!v11)
  {
LABEL_14:
    v20 = 0;
    v19 = 1.0;
    goto LABEL_15;
  }
  -[OSIMotionMonitor percentStationaryOverDuration:](self->_motionMonitor, "percentStationaryOverDuration:", self->_stationaryLookbackSeconds);
  v20 = 1;
LABEL_15:
  self->_pctStationary = v19;
  v21 = -[OSIMotionMonitor currentlyInCar](self->_motionMonitor, "currentlyInCar");
  self->_inCar = v21;
  if (self->_pctStationary < v17 || v21)
  {
    v26 = self->_log;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
    {
      pctStationary = self->_pctStationary;
      inCar = self->_inCar;
      v37 = 134218496;
      *(double *)v38 = pctStationary;
      *(_WORD *)&v38[8] = 2048;
      v39 = v17;
      v40 = 1024;
      v41 = inCar;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v26, OS_LOG_TYPE_DEFAULT, "Restricting entry because stationary for only %.2f (< %.2f) or Auto=%u", (uint8_t *)&v37, 0x1Cu);
    }
    goto LABEL_24;
  }
  if (!v20)
  {
LABEL_24:
    v25 = 0;
    self->_hasRecentPlaybackChange = 0;
LABEL_25:
    v29 = 1;
    goto LABEL_26;
  }
  v22 = -[OSIMediaPlaybackMonitor hasPlaybackStateChangeRecently:](self->_mediaPlaybackMonitor, "hasPlaybackStateChangeRecently:", self->_playbackLookbackSeconds);
  self->_hasRecentPlaybackChange = v22;
  if (v22)
  {
    v23 = self->_log;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_playbackLookbackSeconds / 60.0;
      v37 = 134217984;
      *(double *)v38 = v24;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, "Restricting entry because of recent playback state change in the last %.1f minutes", (uint8_t *)&v37, 0xCu);
    }
    v25 = 0;
    goto LABEL_25;
  }
  v29 = -[OSISleepScheduleMonitor date:inSleepWindowWithSecondsBeforeStart:secondsBeforeEnd:](self->_sleepScheduleMonitor, "date:inSleepWindowWithSecondsBeforeStart:secondsBeforeEnd:", v7, self->_bedtimeOffset, self->_wakeOffset);
  v25 = 1;
LABEL_26:
  self->_inSleepWindow = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
  self->_pluggedIn = +[OSIntelligenceUtilities isPluggedInWithContext:](OSIntelligenceUtilities, "isPluggedInWithContext:", v30);

  if (self->_useSleep
    && !self->_inSleepWindow
    && ((objc_msgSend(v6, "isEqualToString:", CFSTR("ruleBased")) & 1) != 0
     || objc_msgSend(v6, "isEqualToString:", CFSTR("backup"))))
  {
    v36 = self->_log;
    v25 = 0;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v37) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v36, OS_LOG_TYPE_DEFAULT, "Restricting entry because not in scheduled sleep window", (uint8_t *)&v37, 2u);
      v25 = 0;
    }
  }
  self->_areSleepHeuristicsMet = v25;
  v31 = self->_log;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = v31;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIInactivityEntrySignals description](self, "description"));
    v37 = 138412290;
    *(_QWORD *)v38 = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v37, 0xCu);

  }
  areSleepHeuristicsMet = self->_areSleepHeuristicsMet;

  return areSleepHeuristicsMet;
}

- (BOOL)checkInactivitySignalsWithTimeSinceInactive:(double)a3
{
  double v5;
  double v6;
  double v7;
  OS_os_log *log;
  _BOOL4 v9;
  double pctStationary;
  _BOOL4 inCar;
  OS_os_log *v12;
  double v13;
  OS_os_log *v14;
  double v15;
  _BOOL4 hasRecentPlaybackChange;
  int v18;
  double v19;
  __int16 v20;
  _BYTE v21[10];
  _BOOL4 v22;

  -[OSIMotionMonitor percentStationaryOverDuration:](self->_motionMonitor, "percentStationaryOverDuration:", self->_stationaryLookbackSeconds);
  self->_pctStationary = v5;
  self->_inCar = -[OSIMotionMonitor currentlyInCar](self->_motionMonitor, "currentlyInCar");
  self->_hasRecentPlaybackChange = -[OSIMediaPlaybackMonitor hasPlaybackStateChangeRecently:](self->_mediaPlaybackMonitor, "hasPlaybackStateChangeRecently:", self->_playbackLookbackSeconds);
  -[_OSIInactivityEntrySignals dynamicMinPctStationaryThresholdSinceWait:](self, "dynamicMinPctStationaryThresholdSinceWait:", a3);
  v7 = v6;
  if (self->_pctStationary < v6 || self->_inCar)
  {
    log = self->_log;
    v9 = 0;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      pctStationary = self->_pctStationary;
      inCar = self->_inCar;
      v18 = 134218496;
      v19 = pctStationary;
      v20 = 2048;
      *(double *)v21 = v7;
      *(_WORD *)&v21[8] = 1024;
      v22 = inCar;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Restricting inactivity entry because stationary for only %.2f (< %.2f) or Auto=%u", (uint8_t *)&v18, 0x1Cu);
      v9 = 0;
    }
  }
  else
  {
    v9 = 1;
  }
  if (self->_hasRecentPlaybackChange)
  {
    v12 = self->_log;
    v9 = 0;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_playbackLookbackSeconds / 60.0;
      v18 = 134217984;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12, OS_LOG_TYPE_DEFAULT, "Restricting inactivity entry because of recent playback state change in the last %.1f minutes", (uint8_t *)&v18, 0xCu);
      v9 = 0;
    }
  }
  self->_areInactiveHeuristicsMet = v9;
  v14 = self->_log;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = self->_pctStationary;
    hasRecentPlaybackChange = self->_hasRecentPlaybackChange;
    v18 = 134218496;
    v19 = v15;
    v20 = 1024;
    *(_DWORD *)v21 = hasRecentPlaybackChange;
    *(_WORD *)&v21[4] = 1024;
    *(_DWORD *)&v21[6] = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "Stationary = %.2f. Recent Playback Change = %u. | Heuristics Met = %u", (uint8_t *)&v18, 0x18u);
  }
  return self->_areInactiveHeuristicsMet;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Lux = %d. Stationary = %.2f. Recent Playback Change = %u. In Sleep Window: %u. Suppressed = %u. | Heuristics Met = %u, Plugged In = %u"), self->_lux, *(_QWORD *)&self->_pctStationary, self->_hasRecentPlaybackChange, self->_inSleepWindow, self->_aodAlreadySuppressedOrOff, self->_areSleepHeuristicsMet, self->_pluggedIn);
}

- (int)dynamicMaxDarkLuxThresholdSinceWait:(double)a3
{
  BOOL v3;
  uint64_t v4;

  v3 = (double)self->_requeryDelta < a3 || a3 < 0.0;
  v4 = 36;
  if (v3)
    v4 = 28;
  return *(_DWORD *)((char *)&self->super.isa + v4);
}

- (double)dynamicMinPctStationaryThresholdSinceWait:(double)a3
{
  uint64_t v3;

  if (a3 >= 0.0)
  {
    if (a3 >= 15.0)
    {
      v3 = 80;
      if ((double)self->_requeryDelta > a3)
        v3 = 104;
    }
    else
    {
      v3 = 96;
    }
  }
  else
  {
    v3 = 80;
  }
  return *(double *)((char *)&self->super.isa + v3);
}

- (BOOL)areSleepHeuristicsMet
{
  return self->_areSleepHeuristicsMet;
}

- (void)setAreSleepHeuristicsMet:(BOOL)a3
{
  self->_areSleepHeuristicsMet = a3;
}

- (BOOL)areInactiveHeuristicsMet
{
  return self->_areInactiveHeuristicsMet;
}

- (void)setAreInactiveHeuristicsMet:(BOOL)a3
{
  self->_areInactiveHeuristicsMet = a3;
}

- (double)secondsSinceWait
{
  return self->_secondsSinceWait;
}

- (void)setSecondsSinceWait:(double)a3
{
  self->_secondsSinceWait = a3;
}

- (int)requeryDelta
{
  return self->_requeryDelta;
}

- (void)setRequeryDelta:(int)a3
{
  self->_requeryDelta = a3;
}

- (int)lux
{
  return self->_lux;
}

- (void)setLux:(int)a3
{
  self->_lux = a3;
}

- (BOOL)canAlwaysReadLux
{
  return self->_canAlwaysReadLux;
}

- (void)setCanAlwaysReadLux:(BOOL)a3
{
  self->_canAlwaysReadLux = a3;
}

- (OSIAmbientLightMonitor)lightMonitor
{
  return self->_lightMonitor;
}

- (void)setLightMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_lightMonitor, a3);
}

- (int)maxDarkLuxThreshold
{
  return self->_maxDarkLuxThreshold;
}

- (void)setMaxDarkLuxThreshold:(int)a3
{
  self->_maxDarkLuxThreshold = a3;
}

- (BOOL)excludeNegativeLux
{
  return self->_excludeNegativeLux;
}

- (void)setExcludeNegativeLux:(BOOL)a3
{
  self->_excludeNegativeLux = a3;
}

- (int)immediateMaxDarkLuxThreshold
{
  return self->_immediateMaxDarkLuxThreshold;
}

- (void)setImmediateMaxDarkLuxThreshold:(int)a3
{
  self->_immediateMaxDarkLuxThreshold = a3;
}

- (int)initialMaxDarkLuxThreshold
{
  return self->_initialMaxDarkLuxThreshold;
}

- (void)setInitialMaxDarkLuxThreshold:(int)a3
{
  self->_initialMaxDarkLuxThreshold = a3;
}

- (BOOL)aodAlreadySuppressedOrOff
{
  return self->_aodAlreadySuppressedOrOff;
}

- (void)setAodAlreadySuppressedOrOff:(BOOL)a3
{
  self->_aodAlreadySuppressedOrOff = a3;
}

- (OSIBLSStateMonitor)blsStateMonitor
{
  return self->_blsStateMonitor;
}

- (void)setBlsStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_blsStateMonitor, a3);
}

- (double)pctStationary
{
  return self->_pctStationary;
}

- (void)setPctStationary:(double)a3
{
  self->_pctStationary = a3;
}

- (BOOL)inCar
{
  return self->_inCar;
}

- (void)setInCar:(BOOL)a3
{
  self->_inCar = a3;
}

- (OSIMotionMonitor)motionMonitor
{
  return self->_motionMonitor;
}

- (void)setMotionMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_motionMonitor, a3);
}

- (double)minPctStationaryThreshold
{
  return self->_minPctStationaryThreshold;
}

- (void)setMinPctStationaryThreshold:(double)a3
{
  self->_minPctStationaryThreshold = a3;
}

- (double)stationaryLookbackSeconds
{
  return self->_stationaryLookbackSeconds;
}

- (void)setStationaryLookbackSeconds:(double)a3
{
  self->_stationaryLookbackSeconds = a3;
}

- (double)immediateMinPctStationaryThreshold
{
  return self->_immediateMinPctStationaryThreshold;
}

- (void)setImmediateMinPctStationaryThreshold:(double)a3
{
  self->_immediateMinPctStationaryThreshold = a3;
}

- (double)initialMinPctStationaryThreshold
{
  return self->_initialMinPctStationaryThreshold;
}

- (void)setInitialMinPctStationaryThreshold:(double)a3
{
  self->_initialMinPctStationaryThreshold = a3;
}

- (BOOL)hasRecentPlaybackChange
{
  return self->_hasRecentPlaybackChange;
}

- (void)setHasRecentPlaybackChange:(BOOL)a3
{
  self->_hasRecentPlaybackChange = a3;
}

- (OSIMediaPlaybackMonitor)mediaPlaybackMonitor
{
  return self->_mediaPlaybackMonitor;
}

- (void)setMediaPlaybackMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_mediaPlaybackMonitor, a3);
}

- (double)maxPlaybackThreshold
{
  return self->_maxPlaybackThreshold;
}

- (void)setMaxPlaybackThreshold:(double)a3
{
  self->_maxPlaybackThreshold = a3;
}

- (double)playbackLookbackSeconds
{
  return self->_playbackLookbackSeconds;
}

- (void)setPlaybackLookbackSeconds:(double)a3
{
  self->_playbackLookbackSeconds = a3;
}

- (BOOL)inSleepWindow
{
  return self->_inSleepWindow;
}

- (void)setInSleepWindow:(BOOL)a3
{
  self->_inSleepWindow = a3;
}

- (OSISleepScheduleMonitor)sleepScheduleMonitor
{
  return self->_sleepScheduleMonitor;
}

- (void)setSleepScheduleMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_sleepScheduleMonitor, a3);
}

- (BOOL)useSleep
{
  return self->_useSleep;
}

- (void)setUseSleep:(BOOL)a3
{
  self->_useSleep = a3;
}

- (double)bedtimeOffset
{
  return self->_bedtimeOffset;
}

- (void)setBedtimeOffset:(double)a3
{
  self->_bedtimeOffset = a3;
}

- (double)wakeOffset
{
  return self->_wakeOffset;
}

- (void)setWakeOffset:(double)a3
{
  self->_wakeOffset = a3;
}

- (BOOL)pluggedIn
{
  return self->_pluggedIn;
}

- (void)setPluggedIn:(BOOL)a3
{
  self->_pluggedIn = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
  objc_storeStrong((id *)&self->_trialClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_sleepScheduleMonitor, 0);
  objc_storeStrong((id *)&self->_mediaPlaybackMonitor, 0);
  objc_storeStrong((id *)&self->_motionMonitor, 0);
  objc_storeStrong((id *)&self->_blsStateMonitor, 0);
  objc_storeStrong((id *)&self->_lightMonitor, 0);
}

@end
