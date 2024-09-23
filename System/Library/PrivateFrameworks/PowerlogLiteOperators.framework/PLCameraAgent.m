@implementation PLCameraAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLCameraAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("Camera");
  +[PLCameraAgent entryEventForwardDefinitionCamera](PLCameraAgent, "entryEventForwardDefinitionCamera");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("Torch");
  v7[0] = v2;
  +[PLCameraAgent entryEventForwardDefinitionTorch](PLCameraAgent, "entryEventForwardDefinitionTorch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)entryEventForwardDefinitionCamera
{
  uint64_t v2;
  uint64_t v3;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[16];
  _QWORD v51[16];
  _QWORD v52[4];
  _QWORD v53[4];
  _QWORD v54[3];
  _QWORD v55[5];

  v55[3] = *MEMORY[0x1E0C80C00];
  v54[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v52[0] = *MEMORY[0x1E0D80318];
  v52[1] = v2;
  v53[0] = &unk_1E8652930;
  v53[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D802A8];
  v52[2] = *MEMORY[0x1E0D80250];
  v52[3] = v3;
  v53[2] = MEMORY[0x1E0C9AAB0];
  v53[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v45;
  v54[1] = *MEMORY[0x1E0D802F0];
  v50[0] = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "commonTypeDict_BoolFormat");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v43;
  v50[1] = CFSTR("BundleId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "commonTypeDict_StringFormat_withBundleID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v41;
  v50[2] = CFSTR("PixelFormatIsTenBit");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "commonTypeDict_BoolFormat");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v39;
  v50[3] = CFSTR("MaximumSupportedFrameRate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "commonTypeDict_RealFormat");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v37;
  v50[4] = CFSTR("SecondaryInterFrameReferenceEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "commonTypeDict_BoolFormat");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v51[4] = v35;
  v50[5] = CFSTR("SensorWidth");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v51[5] = v33;
  v50[6] = CFSTR("SensorHeight");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_IntegerFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v51[6] = v31;
  v50[7] = CFSTR("VideoCaptureWidth");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v51[7] = v29;
  v50[8] = CFSTR("VideoCaptureHeight");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v51[8] = v27;
  v50[9] = CFSTR("BackgroundBlurEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_BoolFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v51[9] = v25;
  v50[10] = CFSTR("DeferredCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v51[10] = v23;
  v50[11] = CFSTR("CameraType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v51[11] = v21;
  v50[12] = CFSTR("ContinuityCameraType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v51[12] = v19;
  v50[13] = CFSTR("IsWired");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_BoolFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v51[13] = v17;
  v50[14] = CFSTR("AverageFramerate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_RealFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51[14] = v15;
  v50[15] = CFSTR("CenterStageEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v51[15] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v6;
  v54[2] = *MEMORY[0x1E0D802B0];
  v48[0] = CFSTR("key");
  v46 = CFSTR("CaptureCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = CFSTR("value");
  v49[0] = v9;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryEventForwardDefinitionTorch
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8652940;
  v18[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80250];
  v18[2] = MEMORY[0x1E0C9AAB0];
  v4 = *MEMORY[0x1E0D802A0];
  v17[2] = v3;
  v17[3] = v4;
  v16[0] = CFSTR("BundleId");
  v16[1] = CFSTR("Level");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  v19[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("Level");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_BoolFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = CFSTR("BundleId");
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat_withBundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventIntervalDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("SmartCamDetection");
  +[PLCameraAgent entryEventIntervalDefinitionSmartCamDetection](PLCameraAgent, "entryEventIntervalDefinitionSmartCamDetection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventIntervalDefinitionSmartCamDetection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[7];
  _QWORD v21[7];
  uint64_t v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[4];

  v25[2] = *MEMORY[0x1E0C80C00];
  v24[0] = *MEMORY[0x1E0D80298];
  v22 = *MEMORY[0x1E0D80318];
  v23 = &unk_1E8652950;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  v24[1] = *MEMORY[0x1E0D802F0];
  v20[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_DateFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  v20[1] = CFSTR("GateID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v15;
  v20[2] = CFSTR("NumTrackedRegions");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v13;
  v20[3] = CFSTR("NumBoxesPresented");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v3;
  v20[4] = CFSTR("NumFrames");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v5;
  v20[5] = CFSTR("NumEmptyFrames");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v7;
  v20[6] = CFSTR("NumClosingFrames");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLCameraAgent)init
{
  PLCameraAgent *v3;
  objc_super v5;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLCameraAgent;
    self = -[PLAgent init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  uint64_t v3;
  void *v4;
  NSDictionary *v5;
  NSDictionary *torchPowerModel;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  PLXPCListenerOperatorComposition *v24;
  PLXPCListenerOperatorComposition *cameraNotification;
  id v26;
  id v27;
  PLXPCListenerOperatorComposition *v28;
  PLXPCListenerOperatorComposition *torchNotification;
  id v30;
  void *v31;
  PLXPCListenerOperatorComposition *v32;
  PLXPCListenerOperatorComposition *smartCamDetectionNotification;
  PLNSNotificationOperatorComposition *v34;
  PLNSNotificationOperatorComposition *thermalMonitorListener;
  void *v36;
  _QWORD v37[5];
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[4];

  v45[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D80078], "torchTypeString");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D80078], "powerModelForOperatorName:", CFSTR("Torch"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    torchPowerModel = self->_torchPowerModel;
    self->_torchPowerModel = v5;

  }
  v36 = (void *)v3;
  self->_frontCameraIsOn = 0;
  self->_backCameraIsOn = 0;
  v7 = (void *)objc_opt_new();
  -[PLCameraAgent setCameraState:](self, "setCameraState:", v7);

  v8 = (void *)objc_opt_new();
  -[PLCameraAgent setBackgroundBlurState:](self, "setBackgroundBlurState:", v8);

  v9 = *MEMORY[0x1E0D80378];
  +[PLOperator entryKeyForType:andName:](PLCameraAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Camera"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCameraAgent closeOpenCameraEventsAtDate:withEntryKey:](self, "closeOpenCameraEventsAtDate:withEntryKey:", v11, v10);

  +[PLOperator entryKeyForType:andName:](PLCameraAgent, "entryKeyForType:andName:", v9, CFSTR("Torch"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastEntryForKey:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Level"), v36);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    if (v17 > 0.0)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v12);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_1E8631FC8, CFSTR("Level"));
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BundleId"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("BundleId"));

      -[PLOperator logEntry:](self, "logEntry:", v18);
      -[PLCameraAgent modelTorchPowerWithEntry:](self, "modelTorchPowerWithEntry:", v18);

    }
  }
  v20 = objc_alloc(MEMORY[0x1E0D80090]);
  v44[0] = CFSTR("clientID");
  v44[1] = CFSTR("event");
  v45[0] = &unk_1E8631FE0;
  v45[1] = CFSTR("CameraStreaming");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __41__PLCameraAgent_initOperatorDependancies__block_invoke;
  v40[3] = &unk_1E8578EF0;
  v40[4] = self;
  v41 = v10;
  v23 = v10;
  v24 = (PLXPCListenerOperatorComposition *)objc_msgSend(v20, "initWithOperator:withRegistration:withBlock:", self, v21, v40);
  cameraNotification = self->_cameraNotification;
  self->_cameraNotification = v24;

  v26 = objc_alloc(MEMORY[0x1E0D80090]);
  v38[0] = v22;
  v38[1] = 3221225472;
  v38[2] = __41__PLCameraAgent_initOperatorDependancies__block_invoke_116;
  v38[3] = &unk_1E8578EF0;
  v38[4] = self;
  v39 = v12;
  v27 = v12;
  v28 = (PLXPCListenerOperatorComposition *)objc_msgSend(v26, "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B270, v38);
  torchNotification = self->_torchNotification;
  self->_torchNotification = v28;

  v30 = objc_alloc(MEMORY[0x1E0D80090]);
  v42[0] = CFSTR("clientID");
  v42[1] = CFSTR("event");
  v43[0] = &unk_1E8631FE0;
  v43[1] = CFSTR("SmartCamDetection");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v22;
  v37[1] = 3221225472;
  v37[2] = __41__PLCameraAgent_initOperatorDependancies__block_invoke_117;
  v37[3] = &unk_1E8578610;
  v37[4] = self;
  v32 = (PLXPCListenerOperatorComposition *)objc_msgSend(v30, "initWithOperator:withRegistration:withBlock:", self, v31, v37);
  smartCamDetectionNotification = self->_smartCamDetectionNotification;
  self->_smartCamDetectionNotification = v32;

  v34 = (PLNSNotificationOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80010]), "initWithOperator:forNotification:withBlock:", self, CFSTR("PLThermalMonitorNotification"), &__block_literal_global_123);
  thermalMonitorListener = self->_thermalMonitorListener;
  self->_thermalMonitorListener = v34;

}

void __41__PLCameraAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogCamera();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Camera payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "handleCameraEvent:withEntryKey:", v6, *(_QWORD *)(a1 + 40));
}

void __41__PLCameraAgent_initOperatorDependancies__block_invoke_116(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogCamera();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Torch payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "handleTorchEvent:withEntryKey:", v6, *(_QWORD *)(a1 + 40));
}

void __41__PLCameraAgent_initOperatorDependancies__block_invoke_117(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogCamera();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "SmartCamDetection payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalSmartCamDetection:", v6);
}

void __41__PLCameraAgent_initOperatorDependancies__block_invoke_121(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLLogCamera();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "Notification from ThermalMonitor: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)closeOpenCameraEventsAtDate:(id)a3 withEntryKey:(id)a4
{
  id v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  PLCameraAgent *v18;
  id v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = CFSTR("CameraType");
  v9 = CFSTR("%@ = %d");
  v10 = 0x1E0CB3000uLL;
  v11 = 0x1E0C99000uLL;
  do
  {
    objc_msgSend(*(id *)(v10 + 2368), "stringWithFormat:", v9, v8, v7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v11 + 3360), "arrayWithObject:");
    v12 = objc_claimAutoreleasedReturnValue();
    -[PLOperator storage](self, "storage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)v12;
    objc_msgSend(v13, "lastEntryForKey:withFilters:", v6, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("State"));
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("State"));
        v17 = v10;
        v18 = self;
        v19 = v6;
        v20 = v9;
        v21 = v8;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "BOOLValue");

        v8 = v21;
        v9 = v20;
        v6 = v19;
        self = v18;
        v10 = v17;
        v11 = 0x1E0C99000;

        if (v23)
        {
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v6, v28);
          objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("State"));
          objc_msgSend(v24, "setObject:forKeyedSubscript:", CFSTR("init"), CFSTR("BundleId"));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, v8);

          objc_msgSend(v27, "addObject:", v24);
          if ((_DWORD)v7)
          {
            if ((_DWORD)v7 == 2)
            {
              -[PLCameraAgent closeFrontCameraAtDate:](self, "closeFrontCameraAtDate:", v28);
              -[PLCameraAgent modelFrontCameraPowerWithEntry:](self, "modelFrontCameraPowerWithEntry:", v24);
            }
          }
          else
          {
            -[PLCameraAgent closeBackCameraAtDate:](self, "closeBackCameraAtDate:", v28);
            -[PLCameraAgent modelBackCameraPowerWithEntry:](self, "modelBackCameraPowerWithEntry:", v24);
          }

        }
      }
    }
    v7 = (v7 + 1);

  }
  while ((_DWORD)v7 != 8);
  if (objc_msgSend(v27, "count"))
  {
    v31 = v6;
    v32[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v26, v6);

  }
}

- (void)handleCameraEvent:(id)a3 withEntryKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unsigned int v26;
  void *v27;
  char v28;
  PLCameraAgent *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
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
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  id v101;
  PLCameraAgent *v102;
  void *v103;
  id v104;
  void *v105;
  unsigned int v106;
  void *v107;
  void *v108;
  uint64_t v109;
  unsigned int v110;
  unsigned int v111;
  NSObject *v112;
  uint64_t v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  id v122;
  void *v123;
  const __CFString *v124;
  uint64_t v125;
  uint8_t v126[128];
  uint8_t buf[4];
  void *v128;
  _BYTE v129[128];
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v104 = a4;
  if (!v6)
    goto LABEL_68;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Events"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_68;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v101 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Events"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v118, v129, 16);
  if (!v9)
    goto LABEL_65;
  v10 = v9;
  v11 = *(_QWORD *)v119;
  v102 = self;
  v105 = v8;
  v113 = *(_QWORD *)v119;
  do
  {
    v12 = 0;
    v109 = v10;
    do
    {
      if (*(_QWORD *)v119 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * v12);
      PLLogCamera();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v128 = v13;
        _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "Camera payload event: %@", buf, 0xCu);
      }

      if (v13)
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Timestamp"));
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = v15;
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Streaming"));
          v17 = objc_claimAutoreleasedReturnValue();
          if (!v17)
            goto LABEL_59;
          v18 = (void *)v17;
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CameraType"));
          v19 = v16;
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20)
            goto LABEL_60;
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CameraType"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = +[PLCameraAgent checkCameraType:](PLCameraAgent, "checkCameraType:", objc_msgSend(v21, "intValue"));

          if ((_DWORD)v22 == -1)
          {
            PLLogCamera();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CameraType"));
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v128 = v98;
              _os_log_error_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_ERROR, "Unknown camera type: %@", buf, 0xCu);

            }
            v11 = v113;
            goto LABEL_59;
          }
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Streaming"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "BOOLValue");

          if ((_DWORD)v24)
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("BackgroundBlurEnabled"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "BOOLValue");

          }
          else
          {
            v26 = 0;
          }
          v11 = v113;
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PID"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27 ? 0 : v24;

          if ((v28 & 1) == 0)
          {
            v106 = v26;
            v29 = self;
            -[PLCameraAgent cameraState](self, "cameraState");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v24;
            v110 = v22;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKeyedSubscript:", v32);
            v33 = objc_claimAutoreleasedReturnValue();

            v112 = v33;
            v111 = v24;
            if (v33 && (_DWORD)v24 == -[NSObject BOOLValue](v33, "BOOLValue"))
            {
              if ((_DWORD)v24)
              {
                v34 = v10;
                self = v29;
                -[PLCameraAgent backgroundBlurState](v29, "backgroundBlurState");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v110);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "objectForKeyedSubscript:", v36);
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v37 || v106 != objc_msgSend(v37, "BOOLValue"))
                {

                  v11 = v113;
                  v31 = v24;
                  goto LABEL_31;
                }
                v8 = v105;
                v10 = v34;
                v16 = v33;
                v11 = v113;
LABEL_58:

              }
              else
              {
                v8 = v105;
                v16 = v33;
                self = v29;
              }
LABEL_59:

              goto LABEL_60;
            }
LABEL_31:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v31);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            self = v29;
            -[PLCameraAgent cameraState](v29, "cameraState");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v110;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v110);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v38, v41);

            v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v104);
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Timestamp"));
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "convertFromSystemToMonotonic");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setEntryDate:", v42);

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ApplicationID"));
            v43 = objc_claimAutoreleasedReturnValue();
            v107 = (void *)v43;
            if (v43)
            {
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v43, CFSTR("BundleId"));
            }
            else
            {
              PLLogCamera();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_debug_impl(&dword_1CAF47000, v44, OS_LOG_TYPE_DEBUG, "Using pid to lookup bundleID", buf, 2u);
              }

              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PID"));
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v45, "intValue");

              objc_msgSend(MEMORY[0x1E0D80078], "bundleIDFromPid:", v46);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v47, CFSTR("BundleId"));

            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v24);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v48, CFSTR("State"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v110);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v49, CFSTR("CameraType"));

            v50 = (void *)MEMORY[0x1E0CB37E8];
            if ((_DWORD)v24)
            {
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PixelFormatIsTenBit"));
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "numberWithBool:", objc_msgSend(v51, "BOOLValue"));
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v52, CFSTR("PixelFormatIsTenBit"));

              v53 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MaximumSupportedFrameRate"));
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "doubleValue");
              objc_msgSend(v53, "numberWithDouble:");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v55, CFSTR("MaximumSupportedFrameRate"));

              v56 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SecondaryInterFrameReferenceEnabled"));
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "numberWithBool:", objc_msgSend(v57, "BOOLValue"));
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v58, CFSTR("SecondaryInterFrameReferenceEnabled"));

              v59 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SensorWidth"));
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "numberWithInteger:", objc_msgSend(v60, "integerValue"));
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v61, CFSTR("SensorWidth"));

              v62 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SensorHeight"));
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "numberWithInteger:", objc_msgSend(v63, "integerValue"));
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v64, CFSTR("SensorHeight"));

              v65 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("VideoCaptureWidth"));
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "numberWithInteger:", objc_msgSend(v66, "integerValue"));
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v67, CFSTR("VideoCaptureWidth"));

              v68 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("VideoCaptureHeight"));
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "numberWithInteger:", objc_msgSend(v69, "integerValue"));
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v70, CFSTR("VideoCaptureHeight"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v106);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v71, CFSTR("BackgroundBlurEnabled"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v106);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLCameraAgent backgroundBlurState](v29, "backgroundBlurState");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v110);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "setObject:forKeyedSubscript:", v72, v74);

              v75 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ContinuityCameraIsWired"));
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "numberWithBool:", objc_msgSend(v76, "BOOLValue"));
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v77, CFSTR("IsWired"));

              v78 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CenterStageEnabled"));
              v79 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "numberWithBool:", -[NSObject BOOLValue](v79, "BOOLValue"));
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v80, CFSTR("CenterStageEnabled"));

              v10 = v109;
              goto LABEL_51;
            }
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AverageFramerate"));
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "doubleValue");
            objc_msgSend(v50, "numberWithDouble:");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v82, CFSTR("AverageFramerate"));

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("StillImageDeferredProcessingCount"));
            v83 = (void *)objc_claimAutoreleasedReturnValue();

            v10 = v109;
            if (v83)
            {
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("StillImageDeferredProcessingCount"));
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v84, CFSTR("DeferredCount"));

            }
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("StillImageCaptureCounts"));
            v85 = (void *)objc_claimAutoreleasedReturnValue();

            if (v85)
            {
              v116 = 0u;
              v117 = 0u;
              v114 = 0u;
              v115 = 0u;
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("StillImageCaptureCounts"));
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v114, v126, 16);
              if (v87)
              {
                v88 = v87;
                v89 = *(_QWORD *)v115;
                do
                {
                  for (i = 0; i != v88; ++i)
                  {
                    if (*(_QWORD *)v115 != v89)
                      objc_enumerationMutation(v86);
                    v91 = *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * i);
                    v124 = CFSTR("CaptureCount");
                    v125 = v91;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v125, &v124, 1);
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("StillImageCaptureCounts"));
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v93, "objectForKeyedSubscript:", v91);
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "setObject:forKeyedSubscript:", v94, v92);

                  }
                  v88 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v114, v126, 16);
                }
                while (v88);
              }

              PLLogCamera();
              v79 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v128 = v37;
                _os_log_debug_impl(&dword_1CAF47000, v79, OS_LOG_TYPE_DEBUG, "dynamic table entry: %@", buf, 0xCu);
              }
              self = v102;
              v10 = v109;
              v11 = v113;
              v40 = v110;
LABEL_51:

            }
            v95 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ContinuityCameraType"));
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "numberWithInteger:", objc_msgSend(v96, "integerValue"));
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v97, CFSTR("ContinuityCameraType"));

            v8 = v105;
            v16 = v112;
            if (v40 <= 6)
            {
              if (((1 << v40) & 0x33) != 0)
              {
                -[PLCameraAgent setBackCameraIsOn:](self, "setBackCameraIsOn:", v111);
                -[PLCameraAgent modelBackCameraPowerWithEntry:](self, "modelBackCameraPowerWithEntry:", v37);
              }
              else if (((1 << v40) & 0x44) != 0)
              {
                -[PLCameraAgent setFrontCameraIsOn:](self, "setFrontCameraIsOn:", v111);
                -[PLCameraAgent modelFrontCameraPowerWithEntry:](self, "modelFrontCameraPowerWithEntry:", v37);
              }
            }
            objc_msgSend(v103, "addObject:", v37);

            goto LABEL_58;
          }
        }
      }
LABEL_60:
      ++v12;
    }
    while (v12 != v10);
    v99 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v118, v129, 16);
    v10 = v99;
  }
  while (v99);
LABEL_65:

  if (objc_msgSend(v103, "count"))
  {
    v122 = v104;
    v123 = v103;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v123, &v122, 1);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v100, v104);

  }
  v6 = v101;
LABEL_68:

}

- (void)handleTorchEvent:(id)a3 withEntryKey:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[16];

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0D7FFB0];
  v8 = a4;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithEntryKey:withRawData:", v8, v6);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ApplicationID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("BundleId"));
  }
  else
  {
    PLLogCamera();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v19 = 0;
      _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "Using pid to lookup bundleID", v19, 2u);
    }

    v12 = (void *)MEMORY[0x1E0D80078];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIDFromPid:", objc_msgSend(v13, "intValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("BundleId"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("State"));
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Level"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("State"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("Level"));

    }
  }
  -[PLOperator logEntry:](self, "logEntry:", v9);
  -[PLCameraAgent modelTorchPowerWithEntry:](self, "modelTorchPowerWithEntry:", v9);

}

- (void)logEventIntervalSmartCamDetection:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = *MEMORY[0x1E0D80380];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLCameraAgent, "entryKeyForType:andName:", v4, CFSTR("SmartCamDetection"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v13, v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertFromSystemToMonotonic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEntryDate:", v8);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "convertFromSystemToMonotonic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("timestampEnd"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("timestampEnd"));

  }
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

- (void)closeFrontCameraAtDate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[PLCameraAgent frontCameraIsOn](self, "frontCameraIsOn"))
  {
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 17, v5, 0.0);

    -[PLCameraAgent setFrontCameraIsOn:](self, "setFrontCameraIsOn:", 0);
  }

}

- (void)closeBackCameraAtDate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[PLCameraAgent backCameraIsOn](self, "backCameraIsOn"))
  {
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 18, v5, 0.0);

    -[PLCameraAgent setBackCameraIsOn:](self, "setBackCameraIsOn:", 0);
  }

}

- (double)getCameraPower:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D80078], "powerModelForOperatorName:", CFSTR("camera"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(MEMORY[0x1E0D80020], "kPLCameraClassOfDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsString:", v6);

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

  }
  else
  {
    PLLogCamera();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_error_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_ERROR, "No camera power model exists for camera class: %@", buf, 0xCu);
    }

    v13 = 0.0;
  }

  return v13;
}

- (void)modelFrontCameraPowerWithEntry:(id)a3
{
  id v4;
  double v5;
  double v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  uint8_t buf[4];
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 0.0;
  if (-[PLCameraAgent frontCameraIsOn](self, "frontCameraIsOn"))
  {
    -[PLCameraAgent getCameraPower:](self, "getCameraPower:", 2);
    v5 = v6;
    PLLogCamera();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v24 = v5;
      _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Power value for front camera: %f", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 17, v9, v5);

  if (-[PLCameraAgent frontCameraIsOn](self, "frontCameraIsOn"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleId"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("com.apple.deadcanary");
    if (v10)
      v12 = (__CFString *)v10;
    v13 = v12;

    if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("com.apple.avconferenced")))
    {

      v13 = CFSTR("avconferenced");
    }
    v21 = v13;
    v22 = &unk_1E8652950;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entryDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 13, v14, v16);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entryDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 43, v14, v18);

  }
  else
  {
    if (!-[PLCameraAgent allCamerasAreOff](self, "allCamerasAreOff"))
    {
      v14 = (void *)MEMORY[0x1E0C9AA70];
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entryDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0C9AA70];
    objc_msgSend(v19, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 13, MEMORY[0x1E0C9AA70], v20);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entryDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:](v13, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 43, v14, v17);
  }

LABEL_15:
}

- (void)modelBackCameraPowerWithEntry:(id)a3
{
  id v4;
  double v5;
  double v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  uint8_t buf[4];
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 0.0;
  if (-[PLCameraAgent backCameraIsOn](self, "backCameraIsOn"))
  {
    -[PLCameraAgent getCameraPower:](self, "getCameraPower:", 0);
    v5 = v6;
    PLLogCamera();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v24 = v5;
      _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Power value for rear camera: %f", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 18, v9, v5);

  if (-[PLCameraAgent backCameraIsOn](self, "backCameraIsOn"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleId"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = CFSTR("com.apple.deadcanary");
    if (v10)
      v12 = (__CFString *)v10;
    v13 = v12;

    if (-[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("com.apple.avconferenced")))
    {

      v13 = CFSTR("avconferenced");
    }
    v21 = v13;
    v22 = &unk_1E8652950;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entryDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 13, v14, v16);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entryDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 43, v14, v18);

  }
  else
  {
    if (!-[PLCameraAgent allCamerasAreOff](self, "allCamerasAreOff"))
    {
      v14 = (void *)MEMORY[0x1E0C9AA70];
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entryDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0C9AA70];
    objc_msgSend(v19, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 13, MEMORY[0x1E0C9AA70], v20);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entryDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:](v13, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 43, v14, v17);
  }

LABEL_15:
}

- (void)modelTorchPowerWithEntry:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Level"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  v8 = (void *)MEMORY[0x1E0D80078];
  -[PLCameraAgent torchPowerModel](self, "torchPowerModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scaledPowerBasedOnPoint:withPowerModel:", v9, v7);
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 19, v13, v11);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleId"));
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = CFSTR("Flashlight");
  if (v14
    && -[__CFString rangeOfString:](v14, "rangeOfString:", CFSTR("com.apple.springboard")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = v15;
  }
  v17 = v16;

  if (v7 == 0.0)
  {
    v18 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    v23 = v17;
    v24[0] = &unk_1E8652950;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 16, v18, v20);

  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 13, v18, v22);

}

- (BOOL)allCamerasAreOff
{
  if (-[PLCameraAgent frontCameraIsOn](self, "frontCameraIsOn"))
    return 0;
  else
    return !-[PLCameraAgent backCameraIsOn](self, "backCameraIsOn");
}

+ (id)distributionFromCameraType:(int)a3
{
  unsigned int v3;

  v3 = +[PLCameraAgent checkCameraType:](PLCameraAgent, "checkCameraType:", *(_QWORD *)&a3);
  if (v3 > 7)
    return 0;
  else
    return off_1E8578F50[v3];
}

+ (BOOL)isFrontFacingCamera:(int)a3
{
  return a3 == 2;
}

+ (BOOL)isBackFacingCamera:(int)a3
{
  return a3 == 0;
}

+ (int)checkCameraType:(int)a3
{
  int v3;
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  if (a3 >= 8)
  {
    PLLogCamera();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_error_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_ERROR, "PLCameraAgent checkCameraType undefined camera type: %d", (uint8_t *)v6, 8u);
    }

    return -1;
  }
  return v3;
}

- (NSMutableDictionary)cameraState
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCameraState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLXPCListenerOperatorComposition)cameraNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (PLXPCListenerOperatorComposition)torchNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (PLXPCListenerOperatorComposition)smartCamDetectionNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (PLNSNotificationOperatorComposition)thermalMonitorListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setThermalMonitorListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (BOOL)frontCameraIsOn
{
  return self->_frontCameraIsOn;
}

- (void)setFrontCameraIsOn:(BOOL)a3
{
  self->_frontCameraIsOn = a3;
}

- (BOOL)backCameraIsOn
{
  return self->_backCameraIsOn;
}

- (void)setBackCameraIsOn:(BOOL)a3
{
  self->_backCameraIsOn = a3;
}

- (NSMutableDictionary)backgroundBlurState
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBackgroundBlurState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSDictionary)torchPowerModel
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torchPowerModel, 0);
  objc_storeStrong((id *)&self->_backgroundBlurState, 0);
  objc_storeStrong((id *)&self->_thermalMonitorListener, 0);
  objc_storeStrong((id *)&self->_smartCamDetectionNotification, 0);
  objc_storeStrong((id *)&self->_torchNotification, 0);
  objc_storeStrong((id *)&self->_cameraNotification, 0);
  objc_storeStrong((id *)&self->_cameraState, 0);
}

@end
