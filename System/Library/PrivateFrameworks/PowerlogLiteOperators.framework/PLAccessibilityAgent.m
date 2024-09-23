@implementation PLAccessibilityAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccessibilityAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  _QWORD v16[11];
  _QWORD v17[13];

  v17[11] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("ReduceMotion");
  objc_msgSend(a1, "entryEventForwardNameReduceMotion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v15;
  v16[1] = CFSTR("BackgroundContrast");
  objc_msgSend(a1, "entryEventForwardNameBackgroundContrast");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v14;
  v16[2] = CFSTR("AssistiveTouch");
  objc_msgSend(a1, "entryEventForwardNameAssistiveTouch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v3;
  v16[3] = CFSTR("HandGestures");
  objc_msgSend(a1, "entryEventForwardNameHandGestures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v4;
  v16[4] = CFSTR("VoiceControl");
  objc_msgSend(a1, "entryEventForwardNameVoiceControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v5;
  v16[5] = CFSTR("BackTap");
  objc_msgSend(a1, "entryEventForwardNameBackTap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v6;
  v16[6] = CFSTR("SoundRecognition");
  objc_msgSend(a1, "entryEventForwardNameSoundRecognition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v7;
  v16[7] = CFSTR("SpeakSelection");
  objc_msgSend(a1, "entryEventForwardNameSpeakSelection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v8;
  v16[8] = CFSTR("SpeakScreen");
  objc_msgSend(a1, "entryEventForwardNameSpeakScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[8] = v9;
  v16[9] = CFSTR("SystemCaptioning");
  objc_msgSend(a1, "entryEventForwardNameSystemCaptioning");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[9] = v10;
  v16[10] = CFSTR("FacetimeCaptioning");
  objc_msgSend(a1, "entryEventForwardNameFacetimeCaptioning");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[10] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardNameReduceMotion
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80330];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653110;
  v12[1] = MEMORY[0x1E0C9AAB0];
  v11[2] = *MEMORY[0x1E0D802B8];
  v12[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("ReduceMotionEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventForwardNameBackgroundContrast
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80330];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653110;
  v12[1] = MEMORY[0x1E0C9AAB0];
  v11[2] = *MEMORY[0x1E0D802B8];
  v12[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("BackgroundContrastEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventForwardNameVoiceControl
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653120;
  v12[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("VoiceControlEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventForwardNameBackTap
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653120;
  v12[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("BackTapEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventForwardNameSoundRecognition
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653130;
  v12[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("SoundRecognitionEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventForwardNameSpeakSelection
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653120;
  v12[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("SpeakSelectionEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventForwardNameSpeakScreen
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653120;
  v12[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("SpeakScreenEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventForwardNameSystemCaptioning
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653120;
  v12[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("SystemCaptioningEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventForwardNameFacetimeCaptioning
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653110;
  v12[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("FacetimeCaptioningEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventForwardNameAssistiveTouch
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardNameHandGestures
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLAccessibilityAgent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLAccessibilityAgent;
  return -[PLAgent init](&v3, sel_init);
}

- (void)initOperatorDependancies
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  PLCFNotificationOperatorComposition *v6;
  PLCFNotificationOperatorComposition *notificationVoiceControlChanged;
  id v8;
  uint64_t v9;
  PLCFNotificationOperatorComposition *v10;
  PLCFNotificationOperatorComposition *notificationBackTapChanged;
  id v12;
  uint64_t v13;
  PLCFNotificationOperatorComposition *v14;
  PLCFNotificationOperatorComposition *notificationEyeTrackingChanged;
  PLCFNotificationOperatorComposition *v16;
  PLCFNotificationOperatorComposition *notificationMotionCuesStart;
  PLCFNotificationOperatorComposition *v18;
  PLCFNotificationOperatorComposition *notificationMotionCuesStop;
  id v20;
  uint64_t v21;
  PLCFNotificationOperatorComposition *v22;
  PLCFNotificationOperatorComposition *notificationSoundRecognitionDisabled;
  id v24;
  uint64_t v25;
  PLCFNotificationOperatorComposition *v26;
  PLCFNotificationOperatorComposition *notificationSoundRecognitionReady;
  id v28;
  uint64_t v29;
  PLCFNotificationOperatorComposition *v30;
  PLCFNotificationOperatorComposition *notificationSoundRecognitionRunning;
  id v32;
  uint64_t v33;
  PLCFNotificationOperatorComposition *v34;
  PLCFNotificationOperatorComposition *notificationSpeakSelectionChanged;
  id v36;
  uint64_t v37;
  PLCFNotificationOperatorComposition *v38;
  PLCFNotificationOperatorComposition *notificationSpeakScreenChanged;
  id v40;
  uint64_t v41;
  PLCFNotificationOperatorComposition *v42;
  PLCFNotificationOperatorComposition *notificationSystemCaptioningChanged;
  id v44;
  uint64_t v45;
  PLCFNotificationOperatorComposition *v46;
  PLCFNotificationOperatorComposition *notificationFacetimeCaptioningChanged;
  id v48;
  uint64_t v49;
  PLCFNotificationOperatorComposition *v50;
  PLCFNotificationOperatorComposition *notificationZoomChanged;
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD v56[5];
  _QWORD v57[5];
  _QWORD v58[5];
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[5];
  _QWORD v62[5];
  _QWORD v63[5];
  _QWORD v64[5];

  v3 = objc_alloc(MEMORY[0x1E0D7FF80]);
  v4 = MEMORY[0x1E0C809B0];
  v5 = *MEMORY[0x1E0DDE070];
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke;
  v64[3] = &unk_1E8577F48;
  v64[4] = self;
  v6 = (PLCFNotificationOperatorComposition *)objc_msgSend(v3, "initWithOperator:forNotification:requireState:withBlock:", self, v5, 0, v64);
  notificationVoiceControlChanged = self->_notificationVoiceControlChanged;
  self->_notificationVoiceControlChanged = v6;

  v8 = objc_alloc(MEMORY[0x1E0D7FF80]);
  v9 = *MEMORY[0x1E0DDE040];
  v63[0] = v4;
  v63[1] = 3221225472;
  v63[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_53;
  v63[3] = &unk_1E8577F48;
  v63[4] = self;
  v10 = (PLCFNotificationOperatorComposition *)objc_msgSend(v8, "initWithOperator:forNotification:requireState:withBlock:", self, v9, 0, v63);
  notificationBackTapChanged = self->_notificationBackTapChanged;
  self->_notificationBackTapChanged = v10;

  v12 = objc_alloc(MEMORY[0x1E0D7FF80]);
  v13 = *MEMORY[0x1E0DDE1A0];
  v62[0] = v4;
  v62[1] = 3221225472;
  v62[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_54;
  v62[3] = &unk_1E8577F48;
  v62[4] = self;
  v14 = (PLCFNotificationOperatorComposition *)objc_msgSend(v12, "initWithOperator:forNotification:requireState:withBlock:", self, v13, 0, v62);
  notificationEyeTrackingChanged = self->_notificationEyeTrackingChanged;
  self->_notificationEyeTrackingChanged = v14;

  v61[0] = v4;
  v61[1] = 3221225472;
  v61[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_57;
  v61[3] = &unk_1E8577F48;
  v61[4] = self;
  v16 = (PLCFNotificationOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FF80]), "initWithOperator:forNotification:requireState:withBlock:", self, CFSTR("com.apple.accessibility.motion.cues.start"), 0, v61);
  notificationMotionCuesStart = self->_notificationMotionCuesStart;
  self->_notificationMotionCuesStart = v16;

  v60[0] = v4;
  v60[1] = 3221225472;
  v60[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_60;
  v60[3] = &unk_1E8577F48;
  v60[4] = self;
  v18 = (PLCFNotificationOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FF80]), "initWithOperator:forNotification:requireState:withBlock:", self, CFSTR("com.apple.accessibility.motion.cues.stop"), 0, v60);
  notificationMotionCuesStop = self->_notificationMotionCuesStop;
  self->_notificationMotionCuesStop = v18;

  v20 = objc_alloc(MEMORY[0x1E0D7FF80]);
  v21 = *MEMORY[0x1E0DDE260];
  v59[0] = v4;
  v59[1] = 3221225472;
  v59[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_61;
  v59[3] = &unk_1E8577F48;
  v59[4] = self;
  v22 = (PLCFNotificationOperatorComposition *)objc_msgSend(v20, "initWithOperator:forNotification:requireState:withBlock:", self, v21, 0, v59);
  notificationSoundRecognitionDisabled = self->_notificationSoundRecognitionDisabled;
  self->_notificationSoundRecognitionDisabled = v22;

  v24 = objc_alloc(MEMORY[0x1E0D7FF80]);
  v25 = *MEMORY[0x1E0DDE258];
  v58[0] = v4;
  v58[1] = 3221225472;
  v58[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_62;
  v58[3] = &unk_1E8577F48;
  v58[4] = self;
  v26 = (PLCFNotificationOperatorComposition *)objc_msgSend(v24, "initWithOperator:forNotification:requireState:withBlock:", self, v25, 0, v58);
  notificationSoundRecognitionReady = self->_notificationSoundRecognitionReady;
  self->_notificationSoundRecognitionReady = v26;

  v28 = objc_alloc(MEMORY[0x1E0D7FF80]);
  v29 = *MEMORY[0x1E0DDE268];
  v57[0] = v4;
  v57[1] = 3221225472;
  v57[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_63;
  v57[3] = &unk_1E8577F48;
  v57[4] = self;
  v30 = (PLCFNotificationOperatorComposition *)objc_msgSend(v28, "initWithOperator:forNotification:requireState:withBlock:", self, v29, 0, v57);
  notificationSoundRecognitionRunning = self->_notificationSoundRecognitionRunning;
  self->_notificationSoundRecognitionRunning = v30;

  v32 = objc_alloc(MEMORY[0x1E0D7FF80]);
  v33 = *MEMORY[0x1E0DDE1D8];
  v56[0] = v4;
  v56[1] = 3221225472;
  v56[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_64;
  v56[3] = &unk_1E8577F48;
  v56[4] = self;
  v34 = (PLCFNotificationOperatorComposition *)objc_msgSend(v32, "initWithOperator:forNotification:requireState:withBlock:", self, v33, 0, v56);
  notificationSpeakSelectionChanged = self->_notificationSpeakSelectionChanged;
  self->_notificationSpeakSelectionChanged = v34;

  v36 = objc_alloc(MEMORY[0x1E0D7FF80]);
  v37 = *MEMORY[0x1E0DDE278];
  v55[0] = v4;
  v55[1] = 3221225472;
  v55[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_65;
  v55[3] = &unk_1E8577F48;
  v55[4] = self;
  v38 = (PLCFNotificationOperatorComposition *)objc_msgSend(v36, "initWithOperator:forNotification:requireState:withBlock:", self, v37, 0, v55);
  notificationSpeakScreenChanged = self->_notificationSpeakScreenChanged;
  self->_notificationSpeakScreenChanged = v38;

  v40 = objc_alloc(MEMORY[0x1E0D7FF80]);
  v41 = *MEMORY[0x1E0DDE178];
  v54[0] = v4;
  v54[1] = 3221225472;
  v54[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_66;
  v54[3] = &unk_1E8577F48;
  v54[4] = self;
  v42 = (PLCFNotificationOperatorComposition *)objc_msgSend(v40, "initWithOperator:forNotification:requireState:withBlock:", self, v41, 0, v54);
  notificationSystemCaptioningChanged = self->_notificationSystemCaptioningChanged;
  self->_notificationSystemCaptioningChanged = v42;

  v44 = objc_alloc(MEMORY[0x1E0D7FF80]);
  v45 = *MEMORY[0x1E0DDDF28];
  v53[0] = v4;
  v53[1] = 3221225472;
  v53[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_67;
  v53[3] = &unk_1E8577F48;
  v53[4] = self;
  v46 = (PLCFNotificationOperatorComposition *)objc_msgSend(v44, "initWithOperator:forNotification:requireState:withBlock:", self, v45, 0, v53);
  notificationFacetimeCaptioningChanged = self->_notificationFacetimeCaptioningChanged;
  self->_notificationFacetimeCaptioningChanged = v46;

  v48 = objc_alloc(MEMORY[0x1E0D7FF80]);
  v49 = *MEMORY[0x1E0DDE338];
  v52[0] = v4;
  v52[1] = 3221225472;
  v52[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_68;
  v52[3] = &unk_1E8577F48;
  v52[4] = self;
  v50 = (PLCFNotificationOperatorComposition *)objc_msgSend(v48, "initWithOperator:forNotification:requireState:withBlock:", self, v49, 0, v52);
  notificationZoomChanged = self->_notificationZoomChanged;
  self->_notificationZoomChanged = v50;

}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Voice Control Changed: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardVoiceControl");
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_53(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Back Tap changed: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardBackTap");
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_54(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Eye Tracking changed: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardEyeTracking");
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_57(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Motion Cues Started: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardMotionCues:", 1);
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_60(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Motion Cues Stopped: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardMotionCues:", 0);
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_61(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Sound Recognition is disabled: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardSoundRecognition:", 0);
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_62(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Sound Recognition is ready: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardSoundRecognition:", 1);
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_63(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Sound Recognition is running: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardSoundRecognition:", 2);
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_64(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Speak Selection changed: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardSpeakSelection");
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_65(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Speak Screen changed: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardSpeakScreen");
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_66(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "System Captioning changed: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardSystemCaptioning");
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_67(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Facetime Captioning changed: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardFacetimeCaptioning");
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_68(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Zoom changed: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardZoom");
}

- (void)initTaskOperatorDependancies
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  PLCFNotificationOperatorComposition *v6;
  PLCFNotificationOperatorComposition *notificationReduceMotionChanged;
  id v8;
  uint64_t v9;
  PLCFNotificationOperatorComposition *v10;
  PLCFNotificationOperatorComposition *notificationBackgroundContrastChanged;
  _QWORD v12[5];
  _QWORD v13[5];

  v3 = objc_alloc(MEMORY[0x1E0D7FF80]);
  v4 = MEMORY[0x1E0C809B0];
  v5 = *MEMORY[0x1E0DDE210];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__PLAccessibilityAgent_initTaskOperatorDependancies__block_invoke;
  v13[3] = &unk_1E8577F48;
  v13[4] = self;
  v6 = (PLCFNotificationOperatorComposition *)objc_msgSend(v3, "initWithOperator:forNotification:requireState:withBlock:", self, v5, 0, v13);
  notificationReduceMotionChanged = self->_notificationReduceMotionChanged;
  self->_notificationReduceMotionChanged = v6;

  v8 = objc_alloc(MEMORY[0x1E0D7FF80]);
  v9 = *MEMORY[0x1E0DDE088];
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __52__PLAccessibilityAgent_initTaskOperatorDependancies__block_invoke_76;
  v12[3] = &unk_1E8577F48;
  v12[4] = self;
  v10 = (PLCFNotificationOperatorComposition *)objc_msgSend(v8, "initWithOperator:forNotification:requireState:withBlock:", self, v9, 0, v12);
  notificationBackgroundContrastChanged = self->_notificationBackgroundContrastChanged;
  self->_notificationBackgroundContrastChanged = v10;

}

void __52__PLAccessibilityAgent_initTaskOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __52__PLAccessibilityAgent_initTaskOperatorDependancies__block_invoke_2;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v5;
    if (qword_1ED883550 != -1)
      dispatch_once(&qword_1ED883550, &block);
    if (_MergedGlobals_1_35)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reduce Motion changed: %@"), v4, block, v13, v14, v15, v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLAccessibilityAgent.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccessibilityAgent initTaskOperatorDependancies]_block_invoke");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 360);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventForwardReduceMotion");

}

uint64_t __52__PLAccessibilityAgent_initTaskOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_35 = result;
  return result;
}

void __52__PLAccessibilityAgent_initTaskOperatorDependancies__block_invoke_76(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __52__PLAccessibilityAgent_initTaskOperatorDependancies__block_invoke_2_77;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v5;
    if (qword_1ED883558 != -1)
      dispatch_once(&qword_1ED883558, &block);
    if (byte_1ED883549)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Background Contrast changed: %@"), v4, block, v13, v14, v15, v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLAccessibilityAgent.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccessibilityAgent initTaskOperatorDependancies]_block_invoke");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 364);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventForwardBackgroundContrast");

}

uint64_t __52__PLAccessibilityAgent_initTaskOperatorDependancies__block_invoke_2_77(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883549 = result;
  return result;
}

- (void)log
{
  -[PLAccessibilityAgent logEventForwardVoiceControl](self, "logEventForwardVoiceControl");
  -[PLAccessibilityAgent logEventForwardBackTap](self, "logEventForwardBackTap");
  -[PLAccessibilityAgent logEventForwardEyeTracking](self, "logEventForwardEyeTracking");
  -[PLAccessibilityAgent logEventForwardSoundRecognition:](self, "logEventForwardSoundRecognition:", _AXSSoundDetectionRunning());
  -[PLAccessibilityAgent logEventForwardSpeakSelection](self, "logEventForwardSpeakSelection");
  -[PLAccessibilityAgent logEventForwardSpeakScreen](self, "logEventForwardSpeakScreen");
  -[PLAccessibilityAgent logEventForwardSystemCaptioning](self, "logEventForwardSystemCaptioning");
  -[PLAccessibilityAgent logEventForwardFacetimeCaptioning](self, "logEventForwardFacetimeCaptioning");
  -[PLAccessibilityAgent logEventForwardZoom](self, "logEventForwardZoom");
  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
  {
    -[PLAccessibilityAgent logEventForwardReduceMotion](self, "logEventForwardReduceMotion");
    -[PLAccessibilityAgent logEventForwardBackgroundContrast](self, "logEventForwardBackgroundContrast");
  }
}

- (void)logEventForwardReduceMotion
{
  void *v3;
  void *v4;
  id v5;

  +[PLOperator entryKeyForType:andName:](PLAccessibilityAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ReduceMotion"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", _AXSReduceMotionEnabled());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ReduceMotionEnabled"));

  -[PLOperator logEntry:](self, "logEntry:", v3);
}

- (void)logEventForwardBackgroundContrast
{
  void *v3;
  void *v4;
  id v5;

  +[PLOperator entryKeyForType:andName:](PLAccessibilityAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("BackgroundContrast"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", _AXSEnhanceBackgroundContrastEnabled());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("BackgroundContrastEnabled"));

  -[PLOperator logEntry:](self, "logEntry:", v3);
}

- (void)logEventForwardVoiceControl
{
  void *v3;
  void *v4;
  id v5;

  +[PLOperator entryKeyForType:andName:](PLAccessibilityAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("VoiceControl"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", _AXSCommandAndControlEnabled());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("VoiceControlEnabled"));

  -[PLOperator logEntry:](self, "logEntry:", v3);
}

- (void)logEventForwardBackTap
{
  void *v3;
  void *v4;
  id v5;

  +[PLOperator entryKeyForType:andName:](PLAccessibilityAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("BackTap"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", _AXSBackTapEnabled());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("BackTapEnabled"));

  -[PLOperator logEntry:](self, "logEntry:", v3);
}

- (void)logEventForwardEyeTracking
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    v9 = _AXSOnDeviceEyeTrackingEnabled();
    _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "Eye Tracking state: %d", buf, 8u);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", _AXSOnDeviceEyeTrackingEnabled(), CFSTR("Enabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("AccessibilityMetrics"), CFSTR("EyeTracking"), v5);
}

- (void)logEventForwardMotionCues:(BOOL)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = CFSTR("Enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("AccessibilityMetrics"), CFSTR("MotionCuesEnabled"), v5);
}

- (void)logEventForwardSoundRecognition:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _DWORD v13[2];
  uint64_t v14;

  v3 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x1E0C80C00];
  +[PLOperator entryKeyForType:andName:](PLAccessibilityAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("SoundRecognition"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("SoundRecognitionEnabled"));

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v13[0] = 67109120;
    v13[1] = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "Logging Sound Recognition state: %d", (uint8_t *)v13, 8u);
  }

  if (!(_DWORD)v3)
  {
    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13[0]) = 0;
      _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "Logging Sound Recognition remove distribution event", (uint8_t *)v13, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entryDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 51, CFSTR("SoundRecognition"), v11);
    goto LABEL_11;
  }
  if ((_DWORD)v3 == 2)
  {
    PLLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13[0]) = 0;
      _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "Logging Sound Recognition create distribution event", (uint8_t *)v13, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entryDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 51, CFSTR("SoundRecognition"), v11);
LABEL_11:

  }
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

- (void)logEventForwardSpeakSelection
{
  void *v3;
  void *v4;
  id v5;

  +[PLOperator entryKeyForType:andName:](PLAccessibilityAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("SpeakSelection"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", _AXSQuickSpeakEnabled());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("SpeakSelectionEnabled"));

  -[PLOperator logEntry:](self, "logEntry:", v3);
}

- (void)logEventForwardSpeakScreen
{
  void *v3;
  void *v4;
  id v5;

  +[PLOperator entryKeyForType:andName:](PLAccessibilityAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("SpeakScreen"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", _AXSSpeakThisEnabled());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("SpeakScreenEnabled"));

  -[PLOperator logEntry:](self, "logEntry:", v3);
}

- (void)logEventForwardSystemCaptioning
{
  void *v3;
  void *v4;
  id v5;

  +[PLOperator entryKeyForType:andName:](PLAccessibilityAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("SystemCaptioning"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", _AXSLiveTranscriptionEnabled());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("SystemCaptioningEnabled"));

  -[PLOperator logEntry:](self, "logEntry:", v3);
}

- (void)logEventForwardFacetimeCaptioning
{
  void *v3;
  void *v4;
  id v5;

  +[PLOperator entryKeyForType:andName:](PLAccessibilityAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("FacetimeCaptioning"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", _AXSFaceTimeCaptionsEnabled());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("FacetimeCaptioningEnabled"));

  -[PLOperator logEntry:](self, "logEntry:", v3);
}

- (void)logEventForwardZoom
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("Enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", _AXSZoomTouchEnabled());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("AccessibilityMetrics"), CFSTR("ZoomEnabled"), v4);
}

- (PLCFNotificationOperatorComposition)notificationReduceMotionChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (PLCFNotificationOperatorComposition)notificationBackgroundContrastChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (PLCFNotificationOperatorComposition)notificationBackTapChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (PLCFNotificationOperatorComposition)notificationEyeTrackingChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (PLCFNotificationOperatorComposition)notificationFacetimeCaptioningChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (PLCFNotificationOperatorComposition)notificationMotionCuesStart
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (PLCFNotificationOperatorComposition)notificationMotionCuesStop
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (PLCFNotificationOperatorComposition)notificationSpeakSelectionChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (PLCFNotificationOperatorComposition)notificationSpeakScreenChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (PLCFNotificationOperatorComposition)notificationSoundRecognitionDisabled
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (PLCFNotificationOperatorComposition)notificationSoundRecognitionReady
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (PLCFNotificationOperatorComposition)notificationSoundRecognitionRunning
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (PLCFNotificationOperatorComposition)notificationSystemCaptioningChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (PLCFNotificationOperatorComposition)notificationVoiceControlChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (PLCFNotificationOperatorComposition)notificationZoomChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationZoomChanged, 0);
  objc_storeStrong((id *)&self->_notificationVoiceControlChanged, 0);
  objc_storeStrong((id *)&self->_notificationSystemCaptioningChanged, 0);
  objc_storeStrong((id *)&self->_notificationSoundRecognitionRunning, 0);
  objc_storeStrong((id *)&self->_notificationSoundRecognitionReady, 0);
  objc_storeStrong((id *)&self->_notificationSoundRecognitionDisabled, 0);
  objc_storeStrong((id *)&self->_notificationSpeakScreenChanged, 0);
  objc_storeStrong((id *)&self->_notificationSpeakSelectionChanged, 0);
  objc_storeStrong((id *)&self->_notificationMotionCuesStop, 0);
  objc_storeStrong((id *)&self->_notificationMotionCuesStart, 0);
  objc_storeStrong((id *)&self->_notificationFacetimeCaptioningChanged, 0);
  objc_storeStrong((id *)&self->_notificationEyeTrackingChanged, 0);
  objc_storeStrong((id *)&self->_notificationBackTapChanged, 0);
  objc_storeStrong((id *)&self->_notificationBackgroundContrastChanged, 0);
  objc_storeStrong((id *)&self->_notificationReduceMotionChanged, 0);
}

@end
