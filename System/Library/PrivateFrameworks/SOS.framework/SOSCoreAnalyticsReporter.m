@implementation SOSCoreAnalyticsReporter

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SOSCoreAnalyticsReporter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, block);
  return (id)sharedInstance_sosCoreAnalyticsReporter;
}

void __42__SOSCoreAnalyticsReporter_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sosCoreAnalyticsReporter;
  sharedInstance_sosCoreAnalyticsReporter = (uint64_t)v1;

}

- (void)reportSOSTriggered:(int64_t)a3
{
  void *v3;
  char v4;
  NSObject *v5;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSafetyDataSubmissionAllowed");

  if ((v4 & 1) != 0)
  {
    AnalyticsSendEventLazy();
  }
  else
  {
    sos_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "SOSCoreAnalyticsReport, not reporting SOS trigger because Safety data collection is OFF", buf, 2u);
    }

  }
}

id __47__SOSCoreAnalyticsReporter_reportSOSTriggered___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("triggerMechanism");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)reportSOSUserCancelled:(int64_t)a3 lastFlowState:(int64_t)a4 countdownValue:(int64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("triggerMechanism");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v11[1] = CFSTR("lastFlowState2");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  v11[2] = CFSTR("lastCountdownValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOSCoreAnalyticsReporter _AnalyticsSendEventLazy:data:](SOSCoreAnalyticsReporter, "_AnalyticsSendEventLazy:data:", CFSTR("com.apple.sos.user_canceled"), v10);

}

- (void)reportSOSTriggerHandoff:(int64_t)a3 source:(int64_t)a4 destination:(int64_t)a5 result:(int64_t)a6
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("triggerMechanism");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v14[1] = CFSTR("handoffSourceDescription");
  +[SOSCoreAnalyticsReporter SOSCoordinationDeviceString:](SOSCoreAnalyticsReporter, "SOSCoordinationDeviceString:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  v14[2] = CFSTR("handoffDestinationDescription");
  +[SOSCoreAnalyticsReporter SOSCoordinationDeviceString:](SOSCoreAnalyticsReporter, "SOSCoordinationDeviceString:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v11;
  v14[3] = CFSTR("handoffResult");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOSCoreAnalyticsReporter _AnalyticsSendEventLazy:data:](SOSCoreAnalyticsReporter, "_AnalyticsSendEventLazy:data:", CFSTR("com.apple.sos.trigger.handoff"), v13);

}

- (void)reportSOSRejectedWithTrigger:(int64_t)a3 currentTriggerMechanism:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("currentTriggerMechanism");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("rejectedTriggerMechanism");
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOSCoreAnalyticsReporter _AnalyticsSendEventLazy:data:](SOSCoreAnalyticsReporter, "_AnalyticsSendEventLazy:data:", CFSTR("com.apple.sos.trigger.already_active"), v7);

}

- (void)reportSOSRestingResponse:(int64_t)a3 restingResponse:(int64_t)a4 hasMedicalID:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v5 = a5;
  v12[3] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("triggerMechanism");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v11[1] = CFSTR("restingResponse");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  v11[2] = CFSTR("hasMedicalID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOSCoreAnalyticsReporter _AnalyticsSendEventLazy:data:](SOSCoreAnalyticsReporter, "_AnalyticsSendEventLazy:data:", CFSTR("com.apple.sos.trigger.resting_response"), v10);

}

- (void)reportSOSCancelationTimeout:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("triggerMechanism");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOSCoreAnalyticsReporter _AnalyticsSendEventLazy:data:](SOSCoreAnalyticsReporter, "_AnalyticsSendEventLazy:data:", CFSTR("com.apple.sos.user_cancelation_timeout"), v4);

}

- (void)reportSOSEvent:(id)a3 callDuration:(int64_t)a4 isHandoffTrigger:(BOOL)a5 onWristState:(int64_t)a6
{
  id v8;
  _BOOL8 v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  _QWORD v28[8];
  _QWORD v29[10];

  v27 = a5;
  v29[8] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = +[SOSCoreAnalyticsReporter _firstPartyEnablementForTrigger:](SOSCoreAnalyticsReporter, "_firstPartyEnablementForTrigger:", objc_msgSend(v8, "trigger"));
  v10 = +[SOSCoreAnalyticsReporter _thirdPartyEnablementForTrigger:](SOSCoreAnalyticsReporter, "_thirdPartyEnablementForTrigger:", objc_msgSend(v8, "trigger"));
  objc_msgSend(v8, "timeOfResolution");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeOfDetection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v12);
  v14 = (int)v13;

  v15 = a6 == 1;
  v28[0] = CFSTR("triggerMechanism");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "trigger"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v16;
  v28[1] = CFSTR("3rdPartyFeatureEnablement");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v17;
  v28[2] = CFSTR("callDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v18;
  v28[3] = CFSTR("eventDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v19;
  v28[4] = CFSTR("eventResolution");
  v20 = (void *)MEMORY[0x1E0CB37E8];
  v21 = objc_msgSend(v8, "resolution");

  objc_msgSend(v20, "numberWithInteger:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v22;
  v28[5] = CFSTR("featureEnablement");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v23;
  v28[6] = CFSTR("wasHandoffTrigger");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v24;
  v28[7] = CFSTR("watchOnWrist");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOSCoreAnalyticsReporter _AnalyticsSendEventLazy:data:](SOSCoreAnalyticsReporter, "_AnalyticsSendEventLazy:data:", CFSTR("com.apple.sos.event"), v26);

}

+ (void)reportSOSShouldPlayAudioDuringCountdown:(BOOL)a3
{
  AnalyticsSendEventLazy();
}

id __68__SOSCoreAnalyticsReporter_reportSOSShouldPlayAudioDuringCountdown___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("shouldPlayAudioDuringCountdown");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (void)reportSOSAutomaticCallCountdownEnabled:(BOOL)a3
{
  AnalyticsSendEventLazy();
}

id __67__SOSCoreAnalyticsReporter_reportSOSAutomaticCallCountdownEnabled___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("automaticCallCountdownEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (void)reportSOSLongPressTriggersEmergencySOS:(BOOL)a3
{
  AnalyticsSendEventLazy();
}

id __67__SOSCoreAnalyticsReporter_reportSOSLongPressTriggersEmergencySOS___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("longPressTriggersEmergencySOS");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (void)reportSOSAutomaticNewtonEnabled:(BOOL)a3
{
  AnalyticsSendEventLazy();
}

id __60__SOSCoreAnalyticsReporter_reportSOSAutomaticNewtonEnabled___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("fallDetectionEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (void)reportSOSNumberOfVoiceLoops:(int64_t)a3
{
  AnalyticsSendEventLazy();
}

id __56__SOSCoreAnalyticsReporter_reportSOSNumberOfVoiceLoops___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("numberOfVoiceLoops");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (BOOL)isSensitiveTrigger:(int64_t)a3
{
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((unint64_t)a3 >= 0xA)
  {
    sos_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[SOSCoreAnalyticsReporter isSensitiveTrigger:].cold.1(a3, v5, v6, v7, v8, v9, v10, v11);

    LOBYTE(v4) = 1;
  }
  else
  {
    return (0xA0u >> a3) & 1;
  }
  return v4;
}

+ (void)_AnalyticsSendEventLazy:(id)a3 data:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("triggerMechanism"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[SOSCoreAnalyticsReporter isSensitiveTrigger:](SOSCoreAnalyticsReporter, "isSensitiveTrigger:", objc_msgSend(v7, "integerValue")))
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isSafetyDataSubmissionAllowed");

    if ((v9 & 1) == 0)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v10, "addEntriesFromDictionary:", v6);
      objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E5F82FB8, CFSTR("triggerMechanism"));
      v11 = objc_msgSend(v10, "copy");

      v6 = (id)v11;
    }
  }
  v13 = v6;
  v12 = v6;
  AnalyticsSendEventLazy();

}

id __57__SOSCoreAnalyticsReporter__AnalyticsSendEventLazy_data___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (BOOL)_firstPartyEnablementForTrigger:(int64_t)a3
{
  BOOL result;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = 0;
  switch(a3)
  {
    case 0:
    case 9:
      return result;
    case 1:
    case 2:
      result = +[SOSUtilities isCallWithSideButtonPressesEnabled](SOSUtilities, "isCallWithSideButtonPressesEnabled");
      break;
    case 3:
      result = +[SOSUtilities isCallWithVolumeLockHoldEnabled](SOSUtilities, "isCallWithVolumeLockHoldEnabled");
      break;
    case 4:
      result = +[SOSUtilities longPressTriggersEmergencySOS](SOSUtilities, "longPressTriggersEmergencySOS");
      break;
    case 5:
      result = +[SOSUtilities newtonTriggersEmergencySOS](SOSUtilities, "newtonTriggersEmergencySOS");
      break;
    case 6:
    case 8:
      result = 1;
      break;
    case 7:
      result = +[SOSUtilities kappaTriggersEmergencySOS](SOSUtilities, "kappaTriggersEmergencySOS");
      break;
    default:
      sos_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        +[SOSCoreAnalyticsReporter _firstPartyEnablementForTrigger:].cold.1(a3, v5, v6, v7, v8, v9, v10, v11);

      result = 0;
      break;
  }
  return result;
}

+ (BOOL)_thirdPartyEnablementForTrigger:(int64_t)a3
{
  BOOL v4;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if ((unint64_t)a3 > 9)
  {
    sos_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[SOSCoreAnalyticsReporter _thirdPartyEnablementForTrigger:].cold.1(a3, v7, v8, v9, v10, v11, v12, v13);

    return 0;
  }
  if (((1 << a3) & 0x35F) != 0)
    return 0;
  if (a3 != 5)
    return +[SOSUtilities getKappaThirdPartyActiveAppBundle](SOSUtilities, "getKappaThirdPartyActiveAppBundle") != 0;
  v6 = (void *)TCCAccessCopyBundleIdentifiersForService();
  v4 = objc_msgSend(v6, "count") != 0;

  return v4;
}

+ (id)SOSCoordinationDeviceString:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("none");
  if (a3 == 1)
    v3 = CFSTR("watch");
  if (a3 == 2)
    return CFSTR("phone");
  else
    return (id)v3;
}

+ (void)isSensitiveTrigger:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1AF4DC000, a2, a3, "SOSCoreAnalyticsReporter,isSensitiveTrigger,unrecognized SOSTriggerMechanism %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

+ (void)_firstPartyEnablementForTrigger:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1AF4DC000, a2, a3, "SOSCoreAnalyticsReporter,_firstPartyEnablementForTrigger,unrecognized SOSTriggerMechanism %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

+ (void)_thirdPartyEnablementForTrigger:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1AF4DC000, a2, a3, "SOSCoreAnalyticsReporter,_thirdPartyEnablementForTrigger,unrecognized SOSTriggerMechanism %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
