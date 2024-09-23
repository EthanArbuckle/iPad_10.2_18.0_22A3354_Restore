@implementation SASRequestOptionsBuilder

- (id)buildOptionsWithRequest:(id)a3 presentationIdentifier:(int64_t)a4 dataSource:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a5;
  if (-[SASRequestOptionsBuilder _siriIsEnabled](self, "_siriIsEnabled"))
  {
    -[SASRequestOptionsBuilder setPresentationIdentifier:](self, "setPresentationIdentifier:", a4);
    -[SASRequestOptionsBuilder _createRequestOptionsForRequest:withDataSource:](self, "_createRequestOptionsForRequest:withDataSource:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_createRequestOptionsForRequest:(id)a3 withDataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SASRequestOptions *v9;
  uint64_t v10;
  void *v11;
  SASRequestOptions *v12;
  double v13;
  NSObject *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  char v21;
  uint64_t v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  SASRequestOptions *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  char v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  int v88;
  void *v89;
  void *v90;
  SASRequestOptions *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v103;
  id v104;
  _QWORD v105[4];
  SASRequestOptions *v106;
  id v107;
  uint8_t buf[4];
  const char *v109;
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "requestOptionsBuilder:uiPresentationIdentifierWithActivation:activationPresentation:", self, v6, -[SASRequestOptionsBuilder presentationIdentifier](self, "presentationIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [SASRequestOptions alloc];
  v10 = objc_msgSend(v6, "requestSource");
  -[SASRequestOptionsBuilder systemState](self, "systemState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SASRequestOptions initWithRequestSource:uiPresentationIdentifier:systemState:](v9, "initWithRequestSource:uiPresentationIdentifier:systemState:", v10, v8, v11);

  -[SASRequestOptions setPredictedRecordRouteIsZLL:](v12, "setPredictedRecordRouteIsZLL:", objc_msgSend(v7, "requestOptionsBuilder:isPredictedRecordRouteIsZLLWithActiviation:", self, v6));
  if (objc_msgSend(v6, "isButtonRequest"))
  {
    objc_msgSend(v6, "buttonDownTimestamp");
    if (v13 == 0.0)
    {
      v14 = *MEMORY[0x1E0CFE6A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v109 = "-[SASRequestOptionsBuilder _createRequestOptionsForRequest:withDataSource:]";
        _os_log_impl(&dword_1D132F000, v14, OS_LOG_TYPE_DEFAULT, "%s Button Down Event absent. Artificially update timestamp.", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "systemUptime");
      v17 = v16;

      -[SASRequestOptionsBuilder systemState](self, "systemState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "accessibilityShortcutEnabled")
        && (objc_msgSend(v6, "requestSource") == 1
         || objc_msgSend(v6, "requestSource") == 2
         || objc_msgSend(v6, "requestSource") == 28))
      {
        v19 = -[SASRequestOptions isForStark](v12, "isForStark");

        if (!v19)
          v17 = v17 + -0.3;
      }
      else
      {

      }
    }
    else
    {
      v17 = v13;
    }
    -[SASRequestOptions setButtonDownTimestamp:](v12, "setButtonDownTimestamp:", v17);
    -[SASRequestOptions setLongPressBehavior:](v12, "setLongPressBehavior:", objc_msgSend(v6, "longPressBehavior"));
  }
  objc_msgSend(v6, "computedActivationTime");
  -[SASRequestOptions setComputedActivationTime:](v12, "setComputedActivationTime:");
  objc_msgSend(v6, "context");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = objc_msgSend(v6, "isButtonRequest");

    if ((v21 & 1) != 0)
    {
      v22 = 1;
      goto LABEL_20;
    }
  }
  else
  {

  }
  v22 = 0;
LABEL_20:
  -[SASRequestOptions setShortButtonPressAction:](v12, "setShortButtonPressAction:", v22);
  objc_msgSend(v6, "context");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASRequestOptions setTvRemoteType:](v12, "setTvRemoteType:", SASRemoteTypeFromSiriTVRemoteType(objc_msgSend(v25, "remoteType")));
    -[SASRequestOptions setIsTVRemoteSourcePTTEligible:](v12, "setIsTVRemoteSourcePTTEligible:", objc_msgSend(v25, "isPTTEligible"));

  }
  if (objc_msgSend(v6, "isButtonRequest") && objc_msgSend(v6, "buttonIdentifier") == 6)
    -[SASRequestOptions buttonDownTimestamp](v12, "buttonDownTimestamp");
  else
    -[SASRequestOptions computedActivationTime](v12, "computedActivationTime");
  -[SASRequestOptions setTimestamp:](v12, "setTimestamp:");
  -[SASRequestOptions setInitialBringUp:](v12, "setInitialBringUp:", objc_msgSend(v7, "requestOptionsBuilder:isRequestInitialWithActiviation:", self, v6));
  -[SASRequestOptions setUseAutomaticEndpointing:](v12, "setUseAutomaticEndpointing:", objc_msgSend(v7, "requestOptionsBuilder:shouldRequestUseAutomaticEndpointingWithActiviation:", self, v6));
  -[SASRequestOptions setAcousticIdEnabled:](v12, "setAcousticIdEnabled:", objc_msgSend(v7, "requestOptionsBuilder:isAcousticIdAllowedWithActiviation:", self, v6));
  objc_msgSend(v6, "context");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v27 = objc_opt_isKindOfClass();

  if ((v27 & 1) != 0)
  {
    objc_msgSend(v6, "context");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activationEventInstrumentationIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASRequestOptions setActivationEventInstrumentationIdenifier:](v12, "setActivationEventInstrumentationIdenifier:", v29);

  }
  if (objc_msgSend(v6, "isDirectActionRequest"))
  {
    v103 = v8;
    v104 = v7;
    objc_msgSend(v6, "context");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASRequestOptions setDirectActionEvent:](v12, "setDirectActionEvent:", objc_msgSend(v30, "directActionEvent"));
    objc_msgSend(v30, "payload");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "mutableCopy");

    objc_msgSend(v32, "allKeys");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "containsObject:", CFSTR("__supportsCarFullScreen"));

    if (v34)
      objc_msgSend(v32, "removeObjectForKey:", CFSTR("__supportsCarFullScreen"));
    objc_msgSend(v32, "allKeys");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "containsObject:", CFSTR("__bundleId"));

    if (v36)
    {
      objc_msgSend(v32, "objectForKey:", CFSTR("__bundleId"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASRequestOptions setAppBundleIdentifier:](v12, "setAppBundleIdentifier:", v37);

      objc_msgSend(v32, "removeObjectForKey:", CFSTR("__bundleId"));
    }
    objc_msgSend(v32, "allKeys");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "containsObject:", CFSTR("AssistantDirectActionEventKey"));

    if (v39)
      objc_msgSend(v32, "removeObjectForKey:", CFSTR("AssistantDirectActionEventKey"));
    objc_msgSend(v30, "bulletin");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      v41 = objc_alloc_init(MEMORY[0x1E0CFE838]);
      objc_msgSend(v30, "bulletin");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setBulletin:", v42);

      -[SASRequestOptions setBulletin:](v12, "setBulletin:", v41);
      objc_msgSend(v30, "bundleId");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASRequestOptions setAppBundleIdentifier:](v12, "setAppBundleIdentifier:", v43);

    }
    objc_msgSend(v30, "notification");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      v45 = objc_alloc_init(MEMORY[0x1E0CFE838]);
      objc_msgSend(v30, "notification");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "bundleId");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setNotification:fromSourceApp:", v46, v47);

      -[SASRequestOptions setBulletin:](v12, "setBulletin:", v45);
      objc_msgSend(v30, "bundleId");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASRequestOptions setAppBundleIdentifier:](v12, "setAppBundleIdentifier:", v48);

    }
    objc_msgSend(v30, "bundleId");
    v49 = objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      v50 = (void *)v49;
      -[SASRequestOptions appBundleIdentifier](v12, "appBundleIdentifier");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v51)
      {
        objc_msgSend(v30, "bundleId");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[SASRequestOptions setAppBundleIdentifier:](v12, "setAppBundleIdentifier:", v52);

      }
    }
    v53 = (void *)MEMORY[0x1E0CFE7F0];
    v105[0] = MEMORY[0x1E0C809B0];
    v105[1] = 3221225472;
    v105[2] = __75__SASRequestOptionsBuilder__createRequestOptionsForRequest_withDataSource___block_invoke;
    v105[3] = &unk_1E91FBE20;
    v54 = v12;
    v106 = v54;
    v107 = v32;
    v55 = v32;
    v56 = (void *)objc_msgSend(v53, "newWithBuilder:", v105);
    -[SASRequestOptions setDirectActionApplicationContext:](v54, "setDirectActionApplicationContext:", v56);
    AFDirectActionSourceFromSASRequestSource(-[SASRequestOptions requestSource](v54, "requestSource"));
    -[SASRequestOptions directActionEvent](v54, "directActionEvent");
    -[SASRequestOptions directActionApplicationContext](v54, "directActionApplicationContext");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    AFDirectActionCreateRequestInfo();
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    -[SASRequestOptions setRequestInfo:](v54, "setRequestInfo:", v58);
    v8 = v103;
    v7 = v104;
  }
  objc_msgSend(v6, "context");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v60 = objc_opt_isKindOfClass();

  if ((v60 & 1) != 0)
  {
    objc_msgSend(v6, "context");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "testingRequestInfo");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
      -[SASRequestOptions setRequestInfo:](v12, "setRequestInfo:", v62);

  }
  if (objc_msgSend(v6, "isBluetoothRequest"))
  {
    objc_msgSend(v6, "context");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "address");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASRequestOptions setActivationDeviceIdentifier:](v12, "setActivationDeviceIdentifier:", v64);

  }
  if (objc_msgSend(v6, "isContinuousConversationRequest"))
  {
    objc_msgSend(v6, "context");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v66 = objc_opt_isKindOfClass();

    if ((v66 & 1) != 0)
    {
      objc_msgSend(v6, "context");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "speechRequestOptions");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "activationDeviceIdentifier");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASRequestOptions setActivationDeviceIdentifier:](v12, "setActivationDeviceIdentifier:", v69);

    }
  }
  objc_msgSend(v6, "context");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v71 = objc_opt_isKindOfClass();

  if ((v71 & 1) != 0)
  {
    objc_msgSend(v6, "context");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "activeDeviceBluetoothIdentifier");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v73, "length"))
      -[SASRequestOptions setActivationDeviceIdentifier:](v12, "setActivationDeviceIdentifier:", v73);

  }
  if (objc_msgSend(v6, "isVoiceRequest"))
  {
    objc_msgSend(v6, "context");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "requestInfo");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASRequestOptions setRequestInfo:](v12, "setRequestInfo:", v75);

  }
  if (objc_msgSend(v6, "isContinuityRequest"))
  {
    objc_msgSend(v6, "context");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "requestInfo");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASRequestOptions setRequestInfo:](v12, "setRequestInfo:", v77);

    objc_msgSend(v76, "userActivity");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASRequestOptions setContinuityInfo:](v12, "setContinuityInfo:", v78);

    -[SASRequestOptions requestInfo](v12, "requestInfo");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v79, "activationEvent");

    if (v80 == 6)
    {
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.siri.CarDisplay.UIFree")))
        v81 = 37;
      else
        v81 = 40;
    }
    else
    {
      -[SASRequestOptions requestInfo](v12, "requestInfo");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend(v82, "activationEvent");

      if (v83 == 9)
      {
        v81 = 41;
      }
      else
      {
        -[SASRequestOptions requestInfo](v12, "requestInfo");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v84, "activationEvent");

        if (v85 != 10)
        {
LABEL_68:

          goto LABEL_69;
        }
        v81 = 42;
      }
    }
    -[SASRequestOptions setRequestSource:](v12, "setRequestSource:", v81);
    goto LABEL_68;
  }
LABEL_69:
  if (objc_msgSend(v6, "isSpotlightRequest"))
  {
    objc_msgSend(v6, "context");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "utteranceText");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASRequestOptions setText:](v12, "setText:", v87);

  }
  v88 = objc_msgSend(v6, "isTestingRequest");
  if (v7 && v88)
  {
    objc_msgSend(v7, "requestOptionsBuilder:optionsForOverriding:withActiviation:", self, v12, v6);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v89;
    if (v89)
    {
      v91 = v89;

      v12 = v91;
    }

  }
  if (objc_msgSend(v6, "isVocalShortcutRequest"))
  {
    objc_msgSend(v6, "context");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "utteranceText");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASRequestOptions setText:](v12, "setText:", v93);

  }
  if (objc_msgSend(v6, "requestSource") == 44)
  {
    objc_msgSend(v6, "context");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "speechRequestOptions");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "activationDeviceIdentifier");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASRequestOptions setActivationDeviceIdentifier:](v12, "setActivationDeviceIdentifier:", v96);

  }
  -[SASRequestOptions setCurrentLockState:](v12, "setCurrentLockState:", objc_msgSend(v7, "requestOptionsBuilder:currentLockStateForActivation:", self, v6));
  -[SASRequestOptions setIsForBluetoothCar:](v12, "setIsForBluetoothCar:", objc_msgSend(v7, "requestOptionsBuilder:isSiriCarBluetoothRequest:", self, v6));
  objc_msgSend(v6, "context");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "speechRequestOptions");
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  if (v98)
  {
    objc_msgSend(v6, "context");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "speechRequestOptions");
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    -[SASRequestOptions setSpeechRequestOptions:](v12, "setSpeechRequestOptions:", v100);
    if (objc_msgSend(v100, "activationEvent") == 31)
    {
      objc_msgSend(v100, "activationDeviceIdentifier");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASRequestOptions setActivationDeviceIdentifier:](v12, "setActivationDeviceIdentifier:", v101);

    }
  }

  return v12;
}

void __75__SASRequestOptionsBuilder__createRequestOptionsForRequest_withDataSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "appBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAssociatedBundleIdentifier:", v4);

  objc_msgSend(*(id *)(a1 + 32), "bulletin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBulletin:", v5);

  objc_msgSend(v6, "setContextDictionary:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_siriIsEnabled
{
  void *v3;
  void *v4;
  int v5;

  -[SASRequestOptionsBuilder systemState](self, "systemState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "siriIsEnabled"))
  {
    -[SASRequestOptionsBuilder systemState](self, "systemState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "siriIsRestricted") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (SASSystemState)systemState
{
  return (SASSystemState *)+[SASSystemState sharedSystemState](SASSystemState, "sharedSystemState");
}

- (void)setSystemState:(id)a3
{
  objc_storeStrong((id *)&self->_systemState, a3);
}

- (int64_t)presentationIdentifier
{
  return self->_presentationIdentifier;
}

- (void)setPresentationIdentifier:(int64_t)a3
{
  self->_presentationIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemState, 0);
}

@end
