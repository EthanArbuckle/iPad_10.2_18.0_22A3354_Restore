@implementation SBAmbientTelemetryEmitter

- (SBAmbientTelemetryEmitter)initWithAmbientDefaults:(id)a3
{
  id v5;
  SBAmbientTelemetryEmitter *v6;
  SBAmbientTelemetryEmitter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBAmbientTelemetryEmitter;
  v6 = -[SBAmbientTelemetryEmitter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ambientDefaults, a3);
    -[SBAmbientTelemetryEmitter _setupAmbientEnabledLogging](v7, "_setupAmbientEnabledLogging");
    -[SBAmbientTelemetryEmitter _setupUserSettingUpdateLogging](v7, "_setupUserSettingUpdateLogging");
    objc_msgSend((id)objc_opt_class(), "_ambientPowerLogLifetimePresentationCounterUpdate:", -[AMAmbientDefaults lifetimePresentationCounter](v7->_ambientDefaults, "lifetimePresentationCounter"));
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_ambientEnabledDailyTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBAmbientTelemetryEmitter;
  -[SBAmbientTelemetryEmitter dealloc](&v3, sel_dealloc);
}

- (void)logTelemetryForAmbientPresented:(BOOL)a3 displayStyle:(int64_t)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  PRSPosterConfiguration *activePosterConfiguration;
  NSDate *ambientActiveFaceTimestamp;
  id v15;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_ambientPowerLogAmbientPresented:displayStyle:", a3, a4);
  -[NSUUID UUIDString](self->_sessionId, "UUIDString");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[SBAmbientTelemetryEmitter _updateSessionIdForAmbientPresented:](self, "_updateSessionIdForAmbientPresented:", v4);
  if (v4)
  {
    -[NSUUID UUIDString](self->_sessionId, "UUIDString");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend((id)objc_opt_class(), "_ambientTimeOfDay");
    objc_msgSend((id)objc_opt_class(), "_ambientCoreAnalyticsConfigurationUpdateForEventType:activeFace:metadata:sessionIdString:timeOfDay:", 1, 0, 0, v6, v7);
    v8 = (void *)objc_opt_class();
    if (AMUIAmbientDisplayStyleIsRedMode())
      v9 = 4;
    else
      v9 = 3;
    objc_msgSend(v8, "_ambientCoreAnalyticsConfigurationUpdateForEventType:activeFace:metadata:sessionIdString:timeOfDay:", v9, 0, 0, v6, v7);
    -[SBAmbientTelemetryEmitter _updateTotalDurationLoggingForAmbientPresented:sessionIdString:](self, "_updateTotalDurationLoggingForAmbientPresented:sessionIdString:", 1, v6);
    objc_msgSend((id)objc_opt_class(), "_ambientPowerLogLifetimePresentationCounterUpdate:", -[AMAmbientDefaults lifetimePresentationCounter](self->_ambientDefaults, "lifetimePresentationCounter"));
  }
  else
  {
    v6 = v15;
    v10 = objc_msgSend((id)objc_opt_class(), "_ambientTimeOfDay");
    objc_msgSend((id)objc_opt_class(), "_ambientCoreAnalyticsConfigurationUpdateForEventType:activeFace:metadata:sessionIdString:timeOfDay:", 0, 0, 0, v6, v10);
    v11 = (void *)objc_opt_class();
    if (AMUIAmbientDisplayStyleIsRedMode())
      v12 = 4;
    else
      v12 = 3;
    objc_msgSend(v11, "_ambientCoreAnalyticsConfigurationUpdateForEventType:activeFace:metadata:sessionIdString:timeOfDay:", v12, 0, 0, v6, v10);
    -[SBAmbientTelemetryEmitter _updateTotalDurationLoggingForAmbientPresented:sessionIdString:](self, "_updateTotalDurationLoggingForAmbientPresented:sessionIdString:", 0, v6);
    -[SBAmbientTelemetryEmitter _updateActiveFaceDurationForPreviousConfiguration:currentConfiguration:sessionIdString:](self, "_updateActiveFaceDurationForPreviousConfiguration:currentConfiguration:sessionIdString:", self->_activePosterConfiguration, 0, v6);
    activePosterConfiguration = self->_activePosterConfiguration;
    self->_activePosterConfiguration = 0;

    ambientActiveFaceTimestamp = self->_ambientActiveFaceTimestamp;
    self->_ambientActiveFaceTimestamp = 0;

  }
}

- (void)logTelemetryForAmbientPresented:(BOOL)a3 withBacklightState:(int64_t)a4 screenOffWithConfiguration:(id)a5
{
  NSUUID *sessionId;
  id v8;
  id v9;

  if (a3)
  {
    sessionId = self->_sessionId;
    v8 = a5;
    -[NSUUID UUIDString](sessionId, "UUIDString");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[SBAmbientTelemetryEmitter _updateActiveFaceScreenOffForBacklightState:forConfiguration:sessionIdString:](self, "_updateActiveFaceScreenOffForBacklightState:forConfiguration:sessionIdString:", a4, v8, v9);

  }
}

- (void)logTelemetryForAmbientConfigurationUpdate:(id)a3 metadata:(id)a4
{
  PRSPosterConfiguration *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  PRSPosterConfiguration *activePosterConfiguration;
  void *v15;
  PRSPosterConfiguration *v16;
  id v17;

  v6 = (PRSPosterConfiguration *)a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "_faceDescriptionFromConfiguration:", v6);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend((id)objc_opt_class(), "_ambientActiveFaceTypeForConfiguration:", v6);
  v9 = v8;
  if (v8 == 1)
  {
    v10 = objc_msgSend((id)objc_opt_class(), "_ambientPhotosFaceDescriptorForConfiguration:", v6);
  }
  else
  {
    if (v8 != 2)
    {
      v11 = 0;
      goto LABEL_7;
    }
    v10 = objc_msgSend((id)objc_opt_class(), "_ambientClockFaceDescriptorForConfiguration:", v6);
  }
  v11 = v10;
LABEL_7:
  objc_msgSend((id)objc_opt_class(), "_ambientPowerLogActiveFaceUpdateWithFaceType:activeFaceDescriptor:", v9, v11);
  v12 = (void *)objc_opt_class();
  -[NSUUID UUIDString](self->_sessionId, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_ambientCoreAnalyticsConfigurationUpdateForEventType:activeFace:metadata:sessionIdString:timeOfDay:", 2, v17, v7, v13, objc_msgSend((id)objc_opt_class(), "_ambientTimeOfDay"));

  activePosterConfiguration = self->_activePosterConfiguration;
  -[NSUUID UUIDString](self->_sessionId, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAmbientTelemetryEmitter _updateActiveFaceDurationForPreviousConfiguration:currentConfiguration:sessionIdString:](self, "_updateActiveFaceDurationForPreviousConfiguration:currentConfiguration:sessionIdString:", activePosterConfiguration, v6, v15);

  v16 = self->_activePosterConfiguration;
  self->_activePosterConfiguration = v6;

}

- (void)logTelemetryForMotionToWakeEnabled:(BOOL)a3
{
  objc_msgSend((id)objc_opt_class(), "_ambientPowerLogAmbientMotionToWakeEnabled:", a3);
}

- (void)logTelemetryForBumpEventIgnored:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v5 = (void *)objc_opt_class();
  -[NSUUID UUIDString](self->_sessionId, "UUIDString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ambientCoreAnalyticsSystemEventForBumpIgnored:sessionIdString:", v3, v6);

}

- (void)logTelemetryForSleepSuppressionActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v5 = (void *)objc_opt_class();
  -[NSUUID UUIDString](self->_sessionId, "UUIDString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ambientCoreAnalyticsSystemEventForSleepSuppressionActive:sessionIdString:", v3, v6);

}

- (void)_setupAmbientEnabledLogging
{
  AMAmbientDefaults **p_ambientDefaults;
  AMAmbientDefaults *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  p_ambientDefaults = &self->_ambientDefaults;
  -[SBAmbientTelemetryEmitter _logAmbientEnabled:userTriggered:](self, "_logAmbientEnabled:userTriggered:", -[AMAmbientDefaults enableAmbientMode](self->_ambientDefaults, "enableAmbientMode"), 0);
  objc_initWeak(&location, self);
  v4 = *p_ambientDefaults;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enableAmbientMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C80D38];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __56__SBAmbientTelemetryEmitter__setupAmbientEnabledLogging__block_invoke;
  v12 = &unk_1E8E9DF28;
  objc_copyWeak(&v13, &location);
  v8 = (id)-[AMAmbientDefaults observeDefaults:onQueue:withBlock:](v4, "observeDefaults:onQueue:withBlock:", v6, MEMORY[0x1E0C80D38], &v9);

  -[SBAmbientTelemetryEmitter _setupAmbientEnabledDailyTimerForLogging](self, "_setupAmbientEnabledDailyTimerForLogging", v9, v10, v11, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __56__SBAmbientTelemetryEmitter__setupAmbientEnabledLogging__block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_logAmbientEnabled:userTriggered:", objc_msgSend(WeakRetained[2], "enableAmbientMode"), 1);

}

- (void)_setupUserSettingUpdateLogging
{
  AMAmbientDefaults *ambientDefaults;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  -[SBAmbientTelemetryEmitter _logAmbientUserSettingsUserTriggered:](self, "_logAmbientUserSettingsUserTriggered:", 0);
  objc_initWeak(&location, self);
  ambientDefaults = self->_ambientDefaults;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enableAmbientMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "alwaysOnMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nightModeEnabled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "motionToWakeEnabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C80D38];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__SBAmbientTelemetryEmitter__setupUserSettingUpdateLogging__block_invoke;
  v11[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v12, &location);
  v10 = (id)-[AMAmbientDefaults observeDefaults:onQueue:withBlock:](ambientDefaults, "observeDefaults:onQueue:withBlock:", v8, MEMORY[0x1E0C80D38], v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __59__SBAmbientTelemetryEmitter__setupUserSettingUpdateLogging__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_logAmbientUserSettingsUserTriggered:", 1);

}

- (void)_logAmbientEnabled:(BOOL)a3 userTriggered:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;

  v4 = a4;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_ambientPowerLogAmbientModeEnabled:", a3);
  objc_msgSend((id)objc_opt_class(), "_ambientCoreAnalyticsAmbientEnabled:userTriggered:", v5, v4);
}

- (void)_logAmbientUserSettingsUserTriggered:(BOOL)a3
{
  objc_msgSend((id)objc_opt_class(), "_ambientCoreAnalyticsUserSettingsForAmbientDefaults:userTriggered:", self->_ambientDefaults, a3);
}

- (void)_setupAmbientEnabledDailyTimerForLogging
{
  void *v3;
  void *v4;
  id v5;
  NSTimer *v6;
  NSTimer *ambientEnabledDailyTimer;
  _QWORD v8[4];
  id v9;
  id location;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", 5.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0C99E88]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__SBAmbientTelemetryEmitter__setupAmbientEnabledDailyTimerForLogging__block_invoke;
  v8[3] = &unk_1E8E9FA90;
  objc_copyWeak(&v9, &location);
  v6 = (NSTimer *)objc_msgSend(v5, "initWithFireDate:interval:repeats:block:", v4, 1, v8, 86400.0);
  ambientEnabledDailyTimer = self->_ambientEnabledDailyTimer;
  self->_ambientEnabledDailyTimer = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __69__SBAmbientTelemetryEmitter__setupAmbientEnabledDailyTimerForLogging__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend((id)objc_opt_class(), "_ambientCoreAnalyticsAmbientEnabled:userTriggered:", objc_msgSend(WeakRetained[2], "enableAmbientMode"), 0);
    objc_msgSend((id)objc_opt_class(), "_ambientCoreAnalyticsUserSettingsForAmbientDefaults:userTriggered:", v2[2], 0);
    WeakRetained = v2;
  }

}

- (void)_updateSessionIdForAmbientPresented:(BOOL)a3
{
  NSUUID *sessionId;
  NSUUID *v5;

  sessionId = self->_sessionId;
  if (a3)
  {
    if (sessionId)
      return;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    sessionId = self->_sessionId;
  }
  else
  {
    if (!sessionId)
      return;
    v5 = 0;
  }
  self->_sessionId = v5;

}

- (void)_updateTotalDurationLoggingForAmbientPresented:(BOOL)a3 sessionIdString:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSDate *ambientPresentationTimestamp;
  NSDate *v8;
  void *v9;
  double v10;
  double v11;
  NSDate *v12;
  id v13;

  v4 = a3;
  v6 = a4;
  ambientPresentationTimestamp = self->_ambientPresentationTimestamp;
  if (v4)
  {
    if (!ambientPresentationTimestamp)
    {
      v13 = v6;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v12 = self->_ambientPresentationTimestamp;
      self->_ambientPresentationTimestamp = v8;

      v6 = v13;
    }
  }
  else if (ambientPresentationTimestamp)
  {
    v13 = v6;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", self->_ambientPresentationTimestamp);
    v11 = v10;

    objc_msgSend((id)objc_opt_class(), "_ambientCoreAnalyticsTotalAmbientDuration:sessionIdString:", v13, v11);
    v8 = 0;
    goto LABEL_6;
  }

}

- (void)_updateActiveFaceDurationForPreviousConfiguration:(id)a3 currentConfiguration:(id)a4 sessionIdString:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  NSDate *v15;
  NSDate *ambientActiveFaceTimestamp;
  id v17;

  v17 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "_faceDescriptionFromConfiguration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_faceDescriptionFromConfiguration:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) == 0)
  {
    if (self->_ambientActiveFaceTimestamp)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", self->_ambientActiveFaceTimestamp);
      v14 = v13;

      objc_msgSend((id)objc_opt_class(), "_ambientCoreAnalyticsActiveFaceDescription:duration:sessionIdString:", v10, v17, v14);
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
    ambientActiveFaceTimestamp = self->_ambientActiveFaceTimestamp;
    self->_ambientActiveFaceTimestamp = v15;

  }
}

- (void)_updateActiveFaceScreenOffForBacklightState:(int64_t)a3 forConfiguration:(id)a4 sessionIdString:(id)a5
{
  id v8;
  void *v9;
  NSDate *v10;
  NSDate *ambientActiveFaceSceenOffTimestamp;
  void *v12;
  double v13;
  double v14;
  id v15;

  v15 = a5;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "_faceDescriptionFromConfiguration:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
    ambientActiveFaceSceenOffTimestamp = self->_ambientActiveFaceSceenOffTimestamp;
    self->_ambientActiveFaceSceenOffTimestamp = v10;
  }
  else
  {
    ambientActiveFaceSceenOffTimestamp = self->_ambientActiveFaceSceenOffTimestamp;
    if (ambientActiveFaceSceenOffTimestamp)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", self->_ambientActiveFaceSceenOffTimestamp);
      v14 = v13;

      objc_msgSend((id)objc_opt_class(), "_ambientCoreAnalyticsActiveFaceDescription:screenOffDuration:sessionIdString:", v9, v15, v14);
      ambientActiveFaceSceenOffTimestamp = self->_ambientActiveFaceSceenOffTimestamp;
    }
    self->_ambientActiveFaceSceenOffTimestamp = 0;
  }

}

+ (id)_faceDescriptionFromConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;

  v3 = a3;
  objc_msgSend(v3, "providerBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = CFSTR("Unknown");
  objc_msgSend(v3, "descriptorIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v8;
  }
  v9 = v6;

  return v9;
}

+ (void)_ambientPowerLogWithEventName:(id)a3 dictionary:(id)a4
{
  PLLogRegisteredEvent();
}

+ (void)_ambientPowerLogAmbientPresented:(BOOL)a3 displayStyle:(int64_t)a4
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("Enabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("Mode"));

  objc_msgSend((id)objc_opt_class(), "_ambientPowerLogWithEventName:dictionary:", CFSTR("AmbientMode"), v8);
}

+ (void)_ambientPowerLogAmbientModeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("Enabled"));

  objc_msgSend((id)objc_opt_class(), "_ambientPowerLogWithEventName:dictionary:", CFSTR("AmbientModeEnabled"), v5);
}

+ (void)_ambientPowerLogAmbientMotionToWakeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, CFSTR("Enabled"));

  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("Timestamp"));

  objc_msgSend((id)objc_opt_class(), "_ambientPowerLogWithEventName:dictionary:", CFSTR("AmbientModeMotionToWake"), v8);
}

+ (int64_t)_ambientActiveFaceTypeForConfiguration:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "providerBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ambient.AmbientUI.InfographPoster")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.ClockPoster.ClockPosterExtension")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.PhotosUIPrivate.PhotosAmbientPosterProvider")))
  {
    v4 = 1;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

+ (int64_t)_ambientClockFaceDescriptorForConfiguration:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "descriptorIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("digital")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("analog")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("play")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("solar")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("world")))
  {
    v4 = 2;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

+ (int64_t)_ambientPhotosFaceDescriptorForConfiguration:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "descriptorIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("featured")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("pets")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("people")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("nature")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("cities")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("album")))
  {
    v4 = 5;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

+ (void)_ambientPowerLogActiveFaceUpdateWithFaceType:(unint64_t)a3 activeFaceDescriptor:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("ActiveFaceType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("ActiveFaceDescriptor"));

  objc_msgSend((id)objc_opt_class(), "_ambientPowerLogWithEventName:dictionary:", CFSTR("AmbientModeActiveFace"), v8);
}

+ (void)_ambientPowerLogLifetimePresentationCounterUpdate:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("LifetimePresentationCounter"));

  objc_msgSend((id)objc_opt_class(), "_ambientPowerLogWithEventName:dictionary:", CFSTR("AmbientModeLifetimePresentationCounter"), v5);
}

+ (void)_ambientCoreAnalyticsAmbientEnabled:(BOOL)a3 userTriggered:(BOOL)a4
{
  AnalyticsSendEventLazy();
}

id __79__SBAmbientTelemetryEmitter__ambientCoreAnalyticsAmbientEnabled_userTriggered___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("enabledSetting");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("userTriggered");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 33));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)_ambientCoreAnalyticsActiveFaceDescription:(id)a3 duration:(double)a4 sessionIdString:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;

  v8 = a3;
  v9 = a5;
  v6 = v9;
  v7 = v8;
  AnalyticsSendEventLazy();

}

id __97__SBAmbientTelemetryEmitter__ambientCoreAnalyticsActiveFaceDescription_duration_sessionIdString___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v7[0] = *(_QWORD *)(a1 + 32);
  v6[0] = CFSTR("activeFaceType");
  v6[1] = CFSTR("activeFaceDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = CFSTR("sessionId");
  v3 = *(_QWORD *)(a1 + 40);
  v7[1] = v2;
  v7[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)_ambientCoreAnalyticsActiveFaceDescription:(id)a3 screenOffDuration:(double)a4 sessionIdString:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;

  v8 = a3;
  v9 = a5;
  v6 = v9;
  v7 = v8;
  AnalyticsSendEventLazy();

}

id __106__SBAmbientTelemetryEmitter__ambientCoreAnalyticsActiveFaceDescription_screenOffDuration_sessionIdString___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v7[0] = *(_QWORD *)(a1 + 32);
  v6[0] = CFSTR("activeFaceType");
  v6[1] = CFSTR("activeFaceScreenOffDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = CFSTR("sessionId");
  v3 = *(_QWORD *)(a1 + 40);
  v7[1] = v2;
  v7[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)_ambientCoreAnalyticsTotalAmbientDuration:(double)a3 sessionIdString:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  AnalyticsSendEventLazy();

}

id __87__SBAmbientTelemetryEmitter__ambientCoreAnalyticsTotalAmbientDuration_sessionIdString___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("totalDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = CFSTR("sessionId");
  v6[0] = v2;
  v6[1] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)_ambientCoreAnalyticsConfigurationUpdateForEventType:(int64_t)a3 activeFace:(id)a4 metadata:(id)a5 sessionIdString:(id)a6 timeOfDay:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  id (*v24)(_QWORD *);
  void *v25;
  id v26;
  id v27;
  int64_t v28;
  int64_t v29;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __128__SBAmbientTelemetryEmitter__ambientCoreAnalyticsConfigurationUpdateForEventType_activeFace_metadata_sessionIdString_timeOfDay___block_invoke;
  v25 = &unk_1E8EA7B60;
  v28 = a3;
  v15 = v13;
  v26 = v15;
  v16 = v11;
  v27 = v16;
  v29 = a7;
  AnalyticsSendEventLazy();
  if (a3 == 2 && v12)
  {
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __128__SBAmbientTelemetryEmitter__ambientCoreAnalyticsConfigurationUpdateForEventType_activeFace_metadata_sessionIdString_timeOfDay___block_invoke_2;
    v17[3] = &unk_1E8EA7BB0;
    v20 = 2;
    v18 = v16;
    v19 = v15;
    v21 = a7;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v17);

  }
}

id __128__SBAmbientTelemetryEmitter__ambientCoreAnalyticsConfigurationUpdateForEventType_activeFace_metadata_sessionIdString_timeOfDay___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("eventType"));

  objc_msgSend(v2, "setObject:forKeyedSubscript:", a1[4], CFSTR("sessionId"));
  v4 = a1[5];
  if (v4)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("activeFaceType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[7]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("timeOfDay"));

  return v2;
}

void __128__SBAmbientTelemetryEmitter__ambientCoreAnalyticsConfigurationUpdateForEventType_activeFace_metadata_sessionIdString_timeOfDay___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v9 = *(id *)(a1 + 32);
  v10 = v6;
  v11 = *(id *)(a1 + 40);
  v7 = v6;
  v8 = v5;
  AnalyticsSendEventLazy();

}

id __128__SBAmbientTelemetryEmitter__ambientCoreAnalyticsConfigurationUpdateForEventType_activeFace_metadata_sessionIdString_timeOfDay___block_invoke_3(_QWORD *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("eventType"));

  v4 = a1[4];
  if (v4)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("activeFaceType"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", a1[5], CFSTR("activeFacePropertyAttribute"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", a1[6], CFSTR("activeFacePropertyValue"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", a1[7], CFSTR("sessionId"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[9]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("timeOfDay"));

  return v2;
}

+ (void)_ambientCoreAnalyticsUserSettingsForAmbientDefaults:(id)a3 userTriggered:(BOOL)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  AnalyticsSendEventLazy();

}

id __95__SBAmbientTelemetryEmitter__ambientCoreAnalyticsUserSettingsForAmbientDefaults_userTriggered___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("ambientEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enableAmbientMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v10[1] = CFSTR("alwaysOnEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "alwaysOnMode") != 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  v10[2] = CFSTR("alwaysOnMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "alwaysOnMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  v10[3] = CFSTR("nightModeEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "nightModeEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  v10[4] = CFSTR("motionToWakeEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "motionToWakeEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v6;
  v10[5] = CFSTR("userTriggered");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)_ambientCoreAnalyticsSystemEventForBumpIgnored:(BOOL)a3 sessionIdString:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  AnalyticsSendEventLazy();

}

id __92__SBAmbientTelemetryEmitter__ambientCoreAnalyticsSystemEventForBumpIgnored_sessionIdString___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("eventType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = CFSTR("sessionId");
  v6[0] = v2;
  v6[1] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)_ambientCoreAnalyticsSystemEventForSleepSuppressionActive:(BOOL)a3 sessionIdString:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  AnalyticsSendEventLazy();

}

id __103__SBAmbientTelemetryEmitter__ambientCoreAnalyticsSystemEventForSleepSuppressionActive_sessionIdString___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("eventType");
  if (*(_BYTE *)(a1 + 40))
    v2 = 2;
  else
    v2 = 3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("sessionId");
  v7[0] = v3;
  v7[1] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (int64_t)_ambientTimeOfDay
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 32, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "hour");
  v6 = 2;
  if (v5 - 18 >= 6)
    v6 = -1;
  if (v5 - 12 >= 6)
    v7 = v6;
  else
    v7 = 1;
  if (v5 - 5 >= 7)
    v8 = v7;
  else
    v8 = 0;
  if (v5 >= 5)
    v9 = v8;
  else
    v9 = 3;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_ambientEnabledDailyTimer, 0);
  objc_storeStrong((id *)&self->_ambientActiveFaceSceenOffTimestamp, 0);
  objc_storeStrong((id *)&self->_ambientActiveFaceTimestamp, 0);
  objc_storeStrong((id *)&self->_ambientPresentationTimestamp, 0);
  objc_storeStrong((id *)&self->_ambientDefaults, 0);
  objc_storeStrong((id *)&self->_activePosterConfiguration, 0);
}

@end
