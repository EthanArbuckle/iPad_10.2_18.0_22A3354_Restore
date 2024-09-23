@implementation SASActivationDecision

+ (BOOL)canActivateForCondition:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  char v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  __CFString *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  const char *v32;
  int v33;
  _BOOL4 v34;
  void *v35;
  int v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  char isKindOfClass;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  char v48;
  void *v49;
  os_log_t *v50;
  void *v51;
  NSObject *v52;
  int v53;
  NSObject *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  __CFString *v61;
  int v62;
  NSObject *v63;
  const __CFString *v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  uint64_t v69;
  NSObject *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  const __CFString *v74;
  int v75;
  int v76;
  BOOL v77;
  NSObject *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  __CFString *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  int v90;
  char v91;
  int v93;
  void *v94;
  void *v95;
  void *v96;
  uint8_t buf[4];
  const char *v98;
  __int16 v99;
  const __CFString *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  void *v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "request");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "buttonTriggerStateActive");
  objc_msgSend(v4, "systemState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pocketStateManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyticsContext");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "requestState");
  objc_msgSend(v4, "assetUtilities");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiPresentationIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "alwaysAllowVoiceActivation");

  if ((objc_msgSend(v6, "siriIsEnabled") & 1) == 0)
  {
    v16 = objc_msgSend(a1, "_shouldSiriActivateForSiriSetupWithSystemState:", v6);
    goto LABEL_9;
  }
  if ((objc_msgSend(v6, "siriIsSupported") & 1) == 0)
  {
    v13 = v7;
    if (v96)
    {
      +[SASAnalytics analytics](SASAnalytics, "analytics");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "enqueueCurrentAnalyticsEventWithType:context:", 1405, v96);

    }
    v20 = (void *)*MEMORY[0x1E0CFE6A0];
    v16 = 0;
    v17 = v8;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      goto LABEL_203;
    v21 = v20;
    objc_msgSend(v6, "currentSpokenLanguageCode");
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v98 = "+[SASActivationDecision canActivateForCondition:]";
    v99 = 2112;
    v100 = v22;
    v23 = "%s #activation NO: Siri is not supported. Language code: %@";
    v24 = v21;
    v25 = 22;
    goto LABEL_14;
  }
  v13 = v7;
  if (objc_msgSend(v6, "siriIsRestricted"))
  {
    if (v96)
    {
      +[SASAnalytics analytics](SASAnalytics, "analytics");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "enqueueCurrentAnalyticsEventWithType:context:", 1405, v96);

    }
    v15 = *MEMORY[0x1E0CFE6A0];
    v16 = 0;
    v17 = v8;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "+[SASActivationDecision canActivateForCondition:]";
      v18 = "%s #activation NO: Siri is restricted by profile";
LABEL_201:
      _os_log_impl(&dword_1D132F000, v15, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
      goto LABEL_202;
    }
    goto LABEL_203;
  }
  if ((objc_msgSend(v6, "hasUnlockedSinceBoot") & 1) == 0 && objc_msgSend(v95, "isVoiceRequest"))
  {
    if (v96)
    {
      +[SASAnalytics analytics](SASAnalytics, "analytics");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "enqueueCurrentAnalyticsEventWithType:context:", 1405, v96);

    }
    v15 = *MEMORY[0x1E0CFE6A0];
    v16 = 0;
    v17 = v8;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "+[SASActivationDecision canActivateForCondition:]";
      v18 = "%s #activation NO: Siri voice activation is disabled until first unlock.";
      goto LABEL_201;
    }
    goto LABEL_203;
  }
  if (objc_msgSend(v95, "isVoiceRequest")
    && objc_msgSend(v7, "pocketStateShouldPreventVoiceTriggerForActivationRequest:", v95)
    && (objc_msgSend(v6, "isConnectedToCarPlay") & 1) == 0)
  {
    if (objc_msgSend(v95, "isRemoteDisplayVoiceRequest"))
    {
      v27 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v98 = "+[SASActivationDecision canActivateForCondition:]";
        v28 = "%s #activation: Ignoring pocket state for connected remote display voice activation";
LABEL_31:
        _os_log_impl(&dword_1D132F000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
      }
    }
    else
    {
      if (!v12)
      {
        if (v96)
        {
          +[SASAnalytics analytics](SASAnalytics, "analytics");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "enqueueCurrentAnalyticsEventWithType:context:", 1405, v96);

        }
        v15 = *MEMORY[0x1E0CFE6A0];
        v16 = 0;
        v17 = v8;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v98 = "+[SASActivationDecision canActivateForCondition:]";
          v18 = "%s #activation NO: Pocket state prevents voice trigger activation";
          goto LABEL_201;
        }
        goto LABEL_203;
      }
      v27 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v98 = "+[SASActivationDecision canActivateForCondition:]";
        v28 = "%s #activation: Pocket state would normally prevent voice trigger, but the user default to always allow vo"
              "ice activation is set, so ignoring pocket state";
        goto LABEL_31;
      }
    }
  }
  if (v5 && objc_msgSend(v95, "isHoldToTalkSource"))
  {
    if (v96)
    {
      +[SASAnalytics analytics](SASAnalytics, "analytics");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "enqueueCurrentAnalyticsEventWithType:context:", 1405, v96);

    }
    v15 = *MEMORY[0x1E0CFE6A0];
    v16 = 0;
    v17 = v8;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "+[SASActivationDecision canActivateForCondition:]";
      v18 = "%s #activation NO: There is an existing HoldToTalk trigger.";
      goto LABEL_201;
    }
    goto LABEL_203;
  }
  if (objc_msgSend(v6, "isAssessmentModeActive"))
  {
    if (v96)
    {
      +[SASAnalytics analytics](SASAnalytics, "analytics");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "enqueueCurrentAnalyticsEventWithType:context:", 1405, v96);

    }
    v15 = *MEMORY[0x1E0CFE6A0];
    v16 = 0;
    v17 = v8;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "+[SASActivationDecision canActivateForCondition:]";
      v18 = "%s #activation NO: assessment mode is active.";
      goto LABEL_201;
    }
    goto LABEL_203;
  }
  if (objc_msgSend(v6, "smartCoverClosed")
    && objc_msgSend(v6, "isPad")
    && ((objc_msgSend(v95, "isDeviceButtonRequest") & 1) != 0 || objc_msgSend(v95, "isVoiceRequest")))
  {
    if (objc_msgSend(v95, "isRemoteDisplayVoiceRequest"))
    {
      v31 = *MEMORY[0x1E0CFE6A0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
        goto LABEL_54;
      *(_DWORD *)buf = 136315138;
      v98 = "+[SASActivationDecision canActivateForCondition:]";
      v32 = "%s #activation: Ignoring Smart cover state for connected remote display voice activation";
      goto LABEL_53;
    }
    v33 = objc_msgSend(v95, "isVoiceRequest") & v12;
    v31 = *MEMORY[0x1E0CFE6A0];
    v34 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT);
    if (v33 != 1)
    {
      if (v34)
      {
        *(_DWORD *)buf = 136315138;
        v98 = "+[SASActivationDecision canActivateForCondition:]";
        _os_log_impl(&dword_1D132F000, v31, OS_LOG_TYPE_DEFAULT, "%s #activation NO: Siri is disabled because an iPad Smart Cover is closed which blocks home button or Hey Siri", buf, 0xCu);
      }
      v16 = 0;
      v17 = v8;
      goto LABEL_203;
    }
    if (v34)
    {
      *(_DWORD *)buf = 136315138;
      v98 = "+[SASActivationDecision canActivateForCondition:]";
      v32 = "%s #activation: Smart Cover is closed, which would normally prevent voice trigger, but the user default to a"
            "lways allow voice activation is set, so ignoring Smart Cover state";
LABEL_53:
      _os_log_impl(&dword_1D132F000, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 0xCu);
    }
  }
LABEL_54:
  v35 = v95;
  if (objc_msgSend(v6, "smartCoverClosed")
    && (objc_msgSend(v6, "isPad") & 1) == 0
    && ((objc_msgSend(v95, "isDeviceButtonRequest") & 1) != 0 || objc_msgSend(v95, "isVoiceRequest"))
    && (objc_msgSend(v6, "isConnectedToCarPlay") & 1) == 0)
  {
    v36 = objc_msgSend(v95, "isVoiceRequest");
    v15 = *MEMORY[0x1E0CFE6A0];
    if ((v36 & v12) != 1)
    {
      v16 = 0;
      v17 = v8;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v98 = "+[SASActivationDecision canActivateForCondition:]";
        v18 = "%s #activation NO: Siri is disabled because an iPhone Smart Cover is closed which blocks home button or Hey Siri";
        goto LABEL_201;
      }
      goto LABEL_203;
    }
    v37 = v15;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "+[SASActivationDecision canActivateForCondition:]";
      _os_log_impl(&dword_1D132F000, v37, OS_LOG_TYPE_DEFAULT, "%s #activation: Smart Cover is closed, which would normally prevent voice trigger, but the user default to always allow voice activation is set, so ignoring Smart Cover state", buf, 0xCu);
    }

    v35 = v95;
  }
  if (objc_msgSend(v35, "isDeviceButtonRequest") && _AXSHomeButtonAssistant())
  {
    v15 = *MEMORY[0x1E0CFE6A0];
    v16 = 0;
    v17 = v8;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "+[SASActivationDecision canActivateForCondition:]";
      v18 = "%s #activation NO: \"Press Home/Side For Siri\" is disabled in Settings";
      goto LABEL_201;
    }
    goto LABEL_203;
  }
  v17 = v8;
  if (v9 && v9 != 3)
  {
    v44 = (void *)*MEMORY[0x1E0CFE6A0];
    v16 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      goto LABEL_203;
    v21 = v44;
    SASRequestStateGetName(v9);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v98 = "+[SASActivationDecision canActivateForCondition:]";
    v99 = 2112;
    v100 = v22;
    v101 = 2112;
    v102 = v95;
    v23 = "%s #activation NO: Siri state is %@. Ignoring activationRequest %@.";
    v24 = v21;
    v25 = 32;
LABEL_14:
    _os_log_impl(&dword_1D132F000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
    goto LABEL_15;
  }
  if (!objc_msgSend(v6, "deviceIsPasscodeLocked"))
    goto LABEL_119;
  objc_msgSend(v35, "context");
  v38 = v35;
  v39 = objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    objc_msgSend(v38, "context");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v38, "context");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "requestInfo");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v39) = objc_msgSend(v43, "requiresUserInteraction");

    }
    else
    {
      LOBYTE(v39) = 0;
    }
    v13 = v7;
  }
  if (objc_msgSend(v8, "disableAssistantWhilePasscodeLocked")
    && (v39 & 1) == 0
    && (objc_msgSend(v6, "isConnectedToTrustedCarPlay") & 1) == 0)
  {
    if (v96)
    {
      +[SASAnalytics analytics](SASAnalytics, "analytics");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "enqueueCurrentAnalyticsEventWithType:context:", 1405, v96);

    }
    v15 = *MEMORY[0x1E0CFE6A0];
    v16 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "+[SASActivationDecision canActivateForCondition:]";
      v18 = "%s #activation NO: Siri is disabled while passcode locked";
      goto LABEL_201;
    }
    goto LABEL_203;
  }
  v35 = v95;
  v46 = objc_msgSend(v95, "requestSource");
  if (v46 == 18)
  {
    objc_msgSend(v95, "context");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v57 = objc_opt_isKindOfClass();

    v35 = v95;
    if ((v57 & 1) == 0)
      goto LABEL_119;
    objc_msgSend(v95, "context");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "speechRequestOptions");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "activationEvent");
    v60 = (id)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      AFSpeechEventGetDescription();
      v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v49, "isTemporaryDevice");
      *(_DWORD *)buf = 136315650;
      v98 = "+[SASActivationDecision canActivateForCondition:]";
      v99 = 2112;
      v100 = v61;
      v101 = 1024;
      LODWORD(v102) = v62;
      _os_log_impl(&dword_1D132F000, v60, OS_LOG_TYPE_DEFAULT, "%s event:%@ isTemporaryDevice:%i", buf, 0x1Cu);

      v13 = v7;
    }

    if ((v59 & 0xFFFFFFFFFFFFFFFELL) != 0xE
      || !objc_msgSend(v49, "isTemporaryDevice")
      || (objc_msgSend(v6, "isWirelessSplitterOn") & 1) != 0
      || !objc_msgSend(v6, "isGuestConnected"))
    {

      v17 = v8;
      goto LABEL_117;
    }
    v63 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v64 = CFSTR("Double-Tap");
      if (v59 == 15)
        v64 = CFSTR("Hey Siri");
      *(_DWORD *)buf = 136315394;
      v98 = "+[SASActivationDecision canActivateForCondition:]";
      v99 = 2112;
      v100 = v64;
      _os_log_impl(&dword_1D132F000, v63, OS_LOG_TYPE_DEFAULT, "%s #activation NO: Blocking wireless splitter guest that's using B288 %@", buf, 0x16u);
    }

    v16 = 0;
LABEL_9:
    v17 = v8;
    v13 = v7;
    goto LABEL_203;
  }
  if (v46 == 5)
  {
    objc_msgSend(v95, "context");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v48 = objc_opt_isKindOfClass();

    v35 = v95;
    if ((v48 & 1) != 0)
    {
      objc_msgSend(v95, "context");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (os_log_t *)MEMORY[0x1E0CFE6A0];
      v51 = (void *)*MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        v52 = v51;
        v53 = objc_msgSend(v49, "isTemporaryDevice");
        *(_DWORD *)buf = 136315394;
        v98 = "+[SASActivationDecision canActivateForCondition:]";
        v99 = 1024;
        LODWORD(v100) = v53;
        _os_log_impl(&dword_1D132F000, v52, OS_LOG_TYPE_DEFAULT, "%s requestSource:SASRequestSourceBluetoothHeadset isTemporaryDevice:%i", buf, 0x12u);

      }
      if (objc_msgSend(v49, "isTemporaryDevice"))
      {
        v35 = v95;
        if ((objc_msgSend(v6, "isWirelessSplitterOn") & 1) == 0 && objc_msgSend(v6, "isGuestConnected"))
        {
          v54 = *v50;
          if (os_log_type_enabled(*v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v98 = "+[SASActivationDecision canActivateForCondition:]";
            _os_log_impl(&dword_1D132F000, v54, OS_LOG_TYPE_DEFAULT, "%s #activation NO: Blocking wireless splitter guest that's using B188 / bluetooth device", buf, 0xCu);
          }

          goto LABEL_202;
        }
        goto LABEL_118;
      }
LABEL_117:
      v35 = v95;
LABEL_118:

    }
  }
LABEL_119:
  if (objc_msgSend(v6, "deviceIsBlocked"))
  {
    if (v96)
    {
      +[SASAnalytics analytics](SASAnalytics, "analytics");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "enqueueCurrentAnalyticsEventWithType:context:", 1405, v96);

    }
    v15 = *MEMORY[0x1E0CFE6A0];
    v16 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "+[SASActivationDecision canActivateForCondition:]";
      v18 = "%s #activation NO: Siri is disabled because the device is blocked";
      goto LABEL_201;
    }
    goto LABEL_203;
  }
  if (!objc_msgSend(v6, "isInActiveCall"))
    goto LABEL_156;
  if (objc_msgSend(v6, "isConnectedToCarPlay"))
  {
    v15 = *MEMORY[0x1E0CFE6A0];
    v16 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "+[SASActivationDecision canActivateForCondition:]";
      v18 = "%s #activation NO: active call while connected to CarPlay";
      goto LABEL_201;
    }
    goto LABEL_203;
  }
  if ((objc_msgSend(v6, "isCallAudioRouteAllowed") & 1) == 0)
  {
    v15 = *MEMORY[0x1E0CFE6A0];
    v16 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v98 = "+[SASActivationDecision canActivateForCondition:]";
      v18 = "%s #activation NO: call on an unsupported audio route";
      goto LABEL_201;
    }
    goto LABEL_203;
  }
  v66 = _os_feature_enabled_impl();
  if ((objc_msgSend(v6, "hasRingingCall") & 1) == 0)
  {
    if (_os_feature_enabled_impl())
    {
      v70 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v98 = "+[SASActivationDecision canActivateForCondition:]";
        _os_log_impl(&dword_1D132F000, v70, OS_LOG_TYPE_DEFAULT, "%s #activation in-call checks disabled", buf, 0xCu);
      }
      goto LABEL_130;
    }
    v75 = objc_msgSend(v6, "siriInCallEnabled");
    if (((v75 | objc_msgSend(v6, "callHangUpEnabled") | v66) & 1) != 0)
    {
      v76 = v66;
      if (objc_msgSend(v95, "requestSource") == 8)
      {
        v77 = 1;
      }
      else
      {
        objc_msgSend(v95, "context");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "speechRequestOptions");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = objc_msgSend(v88, "activationEvent") == 15;

      }
      v89 = objc_msgSend(v95, "requestSource");
      v90 = objc_msgSend(v6, "callHangUpEnabled");
      v66 = v76;
      if (v89 == 47)
        v91 = v76;
      else
        v91 = 0;
      if (v90 && !v77 && (v91 & 1) == 0)
      {
        v15 = *MEMORY[0x1E0CFE6A0];
        v16 = 0;
        v17 = v8;
        v13 = v7;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v98 = "+[SASActivationDecision canActivateForCondition:]";
          v18 = "%s #activation NO: Siri only supports VT on a connected call for Call Hang Up device";
          goto LABEL_201;
        }
        goto LABEL_203;
      }
      if ((objc_msgSend(v94, "understandingOnDeviceAssetsAvailable") & 1) == 0)
      {
        v17 = v8;
        v13 = v7;
        v15 = *MEMORY[0x1E0CFE6A0];
        v16 = 0;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v98 = "+[SASActivationDecision canActivateForCondition:]";
          v18 = "%s #activation NO: uod assets unavailable during a voice call";
          goto LABEL_201;
        }
        goto LABEL_203;
      }
      goto LABEL_130;
    }
    v80 = (void *)*MEMORY[0x1E0CFE6A0];
    v16 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      goto LABEL_203;
    v81 = (void *)MEMORY[0x1E0CB37E8];
    v21 = v80;
    objc_msgSend(v81, "numberWithBool:", 0);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v98 = "+[SASActivationDecision canActivateForCondition:]";
    v99 = 2112;
    v100 = v22;
    v101 = 2112;
    v102 = v82;
    v103 = 2112;
    v104 = v83;
    _os_log_impl(&dword_1D132F000, v21, OS_LOG_TYPE_DEFAULT, "%s #activation NO: Siri is disabled in connected calls: inCallEnabled: %@, callHangUpEnabled: %@, typeToSiriInCallEnabled: %@", buf, 0x2Au);

    v13 = v7;
LABEL_15:

LABEL_202:
    v16 = 0;
    goto LABEL_203;
  }
LABEL_130:
  v93 = v66;
  if (objc_msgSend(v95, "isContinuityRequest"))
  {
    objc_msgSend(v95, "context");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "requestInfo");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "activationEvent");

  }
  else
  {
    v69 = 0;
  }
  objc_msgSend(v95, "context");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "speechRequestOptions");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "activationEvent");

  if (v73 != 15)
  {
    v13 = v7;
    if (objc_msgSend(v95, "requestSource") == 8)
    {
      v74 = CFSTR("Voice Request during a call");
    }
    else
    {
      if (objc_msgSend(v95, "requestSource") != 26)
      {
        if (v69 == 9)
        {
          v74 = CFSTR("announce call on headphones request during a call");
        }
        else if (v69 == 10)
        {
          v74 = CFSTR("gesture request during a call");
        }
        else if ((_os_feature_enabled_impl() & 1) != 0)
        {
          v74 = CFSTR("all invocations allowed during a call");
        }
        else
        {
          if (!v93 || objc_msgSend(v95, "requestSource") != 47)
          {
            v15 = *MEMORY[0x1E0CFE6A0];
            v16 = 0;
            v17 = v8;
            v13 = v7;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v98 = "+[SASActivationDecision canActivateForCondition:]";
              v18 = "%s #activation NO: request type unsupported during a call";
              goto LABEL_201;
            }
            goto LABEL_203;
          }
          v74 = CFSTR("Type to Siri during a call");
        }
        goto LABEL_140;
      }
      v74 = CFSTR("triggerless reply to announce call during a call");
    }
    v17 = v8;
    goto LABEL_149;
  }
  v74 = CFSTR("W2 HS activation event during a call");
LABEL_140:
  v17 = v8;
  v13 = v7;
LABEL_149:
  if (canActivateForCondition__once != -1)
    dispatch_once(&canActivateForCondition__once, &__block_literal_global_18);
  v78 = (id)*MEMORY[0x1E0CFE6A0];
  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v98 = "+[SASActivationDecision canActivateForCondition:]";
    v99 = 2112;
    v100 = v74;
    _os_log_impl(&dword_1D132F000, v78, OS_LOG_TYPE_DEFAULT, "%s #activation continue: %@", buf, 0x16u);
  }

  v79 = (id)canActivateForCondition__log;
  if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v98 = (const char *)v74;
    _os_log_impl(&dword_1D132F000, v79, OS_LOG_TYPE_INFO, "AnnounceTelephony: %@", buf, 0xCu);
  }

  v35 = v95;
LABEL_156:
  if (!objc_msgSend(v6, "isRemoteWebcamMode"))
  {
    if (AFDeviceSupportsSystemAssistantExperience())
    {
      if (objc_msgSend(v6, "isInAAAGame"))
      {
        v15 = *MEMORY[0x1E0CFE6A0];
        v16 = 0;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v98 = "+[SASActivationDecision canActivateForCondition:]";
          v18 = "%s #activation NO: siri disabled when playing AAA game";
          goto LABEL_201;
        }
        goto LABEL_203;
      }
      if (objc_msgSend(v35, "requestSource") == 47)
      {
        if (objc_msgSend(v6, "isConnectedToCarPlay"))
        {
          v15 = *MEMORY[0x1E0CFE6A0];
          v16 = 0;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v98 = "+[SASActivationDecision canActivateForCondition:]";
            v18 = "%s #activation NO: type to siri disabled when connected to CarPlay";
            goto LABEL_201;
          }
          goto LABEL_203;
        }
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.siri.EyesFree")))
        {
          v15 = *MEMORY[0x1E0CFE6A0];
          v16 = 0;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v98 = "+[SASActivationDecision canActivateForCondition:]";
            v18 = "%s #activation NO: type to siri disabled when in eyesfree mode";
            goto LABEL_201;
          }
          goto LABEL_203;
        }
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.siri.BluetoothCar")))
        {
          v15 = *MEMORY[0x1E0CFE6A0];
          v16 = 0;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v98 = "+[SASActivationDecision canActivateForCondition:]";
            v18 = "%s #activation NO: type to siri disabled when connected to bluetooth car";
            goto LABEL_201;
          }
          goto LABEL_203;
        }
      }
    }
    v84 = (void *)*MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v85 = v84;
      SASRequestSourceGetName(objc_msgSend(v95, "requestSource"));
      v86 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v98 = "+[SASActivationDecision canActivateForCondition:]";
      v99 = 2112;
      v100 = v86;
      _os_log_impl(&dword_1D132F000, v85, OS_LOG_TYPE_DEFAULT, "%s #activation YES: source:%@", buf, 0x16u);

    }
    v16 = 1;
    goto LABEL_203;
  }
  v15 = *MEMORY[0x1E0CFE6A0];
  v16 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v98 = "+[SASActivationDecision canActivateForCondition:]";
    v18 = "%s #activation NO: in remote webcam mode";
    goto LABEL_201;
  }
LABEL_203:

  return v16;
}

void __49__SASActivationDecision_canActivateForCondition___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.siri", "AnnounceTelephony");
  v1 = (void *)canActivateForCondition__log;
  canActivateForCondition__log = (uint64_t)v0;

}

+ (BOOL)_shouldSiriActivateForSiriSetupWithSystemState:(id)a3
{
  id v3;
  NSObject *v4;
  BOOL v5;
  const char *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "siriIsRestricted"))
  {
    v4 = *MEMORY[0x1E0CFE6A0];
    v5 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "+[SASActivationDecision _shouldSiriActivateForSiriSetupWithSystemState:]";
      v6 = "%s #activation NO: Siri is restricted by profile.";
LABEL_13:
      _os_log_impl(&dword_1D132F000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
      v5 = 0;
    }
  }
  else if (objc_msgSend(v3, "isInActiveCall"))
  {
    v4 = *MEMORY[0x1E0CFE6A0];
    v5 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "+[SASActivationDecision _shouldSiriActivateForSiriSetupWithSystemState:]";
      v6 = "%s #activation NO: Siri is in an active call.";
      goto LABEL_13;
    }
  }
  else if (objc_msgSend(v3, "deviceIsPasscodeLocked"))
  {
    v4 = *MEMORY[0x1E0CFE6A0];
    v5 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "+[SASActivationDecision _shouldSiriActivateForSiriSetupWithSystemState:]";
      v6 = "%s #activation NO: Siri Setup is disabled while passcode locked";
      goto LABEL_13;
    }
  }
  else
  {
    if (!objc_msgSend(v3, "isAssessmentModeActive"))
    {
      v5 = 1;
      goto LABEL_14;
    }
    v4 = *MEMORY[0x1E0CFE6A0];
    v5 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "+[SASActivationDecision _shouldSiriActivateForSiriSetupWithSystemState:]";
      v6 = "%s #activation NO: Siri Setup is disabled while assessment session is active";
      goto LABEL_13;
    }
  }
LABEL_14:

  return v5;
}

@end
