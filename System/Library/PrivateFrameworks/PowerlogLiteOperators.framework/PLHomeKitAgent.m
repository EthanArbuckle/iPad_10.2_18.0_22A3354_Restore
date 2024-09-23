@implementation PLHomeKitAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLHomeKitAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return &unk_1E864B158;
}

+ (id)entryEventPointDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("HomeKitBTLE");
  objc_msgSend(a1, "entryEventPointDefinitionHomeKitAdvt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("HomeKitEvents");
  objc_msgSend(a1, "entryEventPointDefinitionHomeKitEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("HomeKitSummary");
  objc_msgSend(a1, "entryEventPointDefinitionHomeKitSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("HomeKitRegistration");
  objc_msgSend(a1, "entryEventPointDefinitionHomeKitRegistration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionHomeKitEvents
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v15[0] = *MEMORY[0x1E0D80318];
  v15[1] = v2;
  v16[0] = &unk_1E8652870;
  v16[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("eventType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("kHMFPowerLogDeviceIdentiferKey");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("accessoryCategory");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitionHomeKitAdvt
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8652870;
  v14[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("kHMFPowerLogEventType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("kHMFPowerLogDeviceIdentiferKey");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventPointDefinitionHomeKitRegistration
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v15[0] = *MEMORY[0x1E0D80318];
  v15[1] = v2;
  v16[0] = &unk_1E8652880;
  v16[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("Enabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat_withBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("RegistrationType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitionHomeKitSummary
{
  uint64_t v2;
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
  _QWORD v29[11];
  _QWORD v30[11];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  v33[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v31[0] = *MEMORY[0x1E0D80318];
  v31[1] = v2;
  v32[0] = &unk_1E8652880;
  v32[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v28;
  v33[1] = *MEMORY[0x1E0D802F0];
  v29[0] = CFSTR("numBTPushes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v26;
  v29[1] = CFSTR("numConnections");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v24;
  v29[2] = CFSTR("numBTConnections");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v22;
  v29[3] = CFSTR("numIPConnections");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v20;
  v29[4] = CFSTR("numIPEvents");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v18;
  v29[5] = CFSTR("numIDSPushes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v16;
  v29[6] = CFSTR("numCloudPushes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v14;
  v29[7] = CFSTR("numBonjour");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v4;
  v29[8] = CFSTR("numBTWakeAdvt");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v6;
  v29[9] = CFSTR("numBTWakes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v8;
  v29[10] = CFSTR("Reason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("HomeConfiguration");
  objc_msgSend(a1, "entryEventForwardDefinitionHomeConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("CameraConfiguration");
  v8[0] = v3;
  objc_msgSend(a1, "entryEventForwardDefinitionCameraConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryEventForwardDefinitionHomeConfiguration
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
  v23 = &unk_1E8652890;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  v24[1] = *MEMORY[0x1E0D802F0];
  v20[0] = CFSTR("numHomes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  v20[1] = CFSTR("numNonEmptyHomes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v15;
  v20[2] = CFSTR("numUsers");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v13;
  v20[3] = CFSTR("numHAPAccessories");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v3;
  v20[4] = CFSTR("numEnabledResidents");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v5;
  v20[5] = CFSTR("isCurrentDevicePrimaryResident");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v7;
  v20[6] = CFSTR("HomeHubVersion");
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

+ (id)entryEventForwardDefinitionCameraConfiguration
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
  _QWORD v18[6];
  _QWORD v19[6];
  uint64_t v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[4];

  v23[2] = *MEMORY[0x1E0C80C00];
  v22[0] = *MEMORY[0x1E0D80298];
  v20 = *MEMORY[0x1E0D80318];
  v21 = &unk_1E8652870;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E0D802F0];
  v18[0] = CFSTR("numCameras");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v18[1] = CFSTR("numCamerasRecordingEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  v18[2] = CFSTR("numCamerasSmartBulletinNotificationEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v3;
  v18[3] = CFSTR("numCamerasReachabilityNotificationEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v5;
  v18[4] = CFSTR("numCamerasAnyMotionEventEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v7;
  v18[5] = CFSTR("numCamerasHSVMotionEventEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryAggregateDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("IDSPushMessageTypes");
  objc_msgSend(a1, "entryAggregateDefinitionIDSPushMessageTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryAggregateDefinitionIDSPushMessageTypes
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
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  _QWORD v23[6];

  v23[4] = *MEMORY[0x1E0C80C00];
  v22[0] = *MEMORY[0x1E0D80298];
  v20 = *MEMORY[0x1E0D80318];
  v21 = &unk_1E8652880;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v2;
  v22[1] = *MEMORY[0x1E0D802F0];
  v18[0] = CFSTR("MessageType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = CFSTR("Count");
  v19[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v7;
  v22[2] = *MEMORY[0x1E0D80228];
  v16 = &unk_1E86528A0;
  v14 = *MEMORY[0x1E0D80220];
  v15 = &unk_1E86528B0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v9;
  v22[3] = *MEMORY[0x1E0D80238];
  v13 = CFSTR("Count");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (PLHomeKitAgent)init
{
  PLHomeKitAgent *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLHomeKitAgent;
  result = -[PLAgent init](&v3, sel_init);
  if (result)
  {
    result->_numBTPushes = 0;
    result->_numConnections = 0;
    result->_numPrevBTPushes = 0;
    result->_numPrevConnections = 0;
    result->_numBTConnections = 0;
    result->_numIPConnections = 0;
    result->_numBonjour = 0;
    result->_numIPEvents = 0;
    result->_numIDSPushes = 0;
    result->_numCloudPushes = 0;
    result->_numBTWakeAdvt = 0;
    result->_numBTWakes = 0;
    result->_lastapwake = 0.0;
    result->_enablelog = 0;
    result->_numaggregatelines = 0;
    result->_numBTlines = 0;
  }
  return result;
}

- (void)initOperatorDependancies
{
  id v3;
  uint64_t v4;
  PLXPCListenerOperatorComposition *v5;
  PLXPCListenerOperatorComposition *homeKitEventsListener;
  PLXPCListenerOperatorComposition *v7;
  PLXPCListenerOperatorComposition *homeConfigurationListener;
  PLXPCListenerOperatorComposition *v9;
  PLXPCListenerOperatorComposition *cameraConfigurationListener;
  PLXPCListenerOperatorComposition *v11;
  PLXPCListenerOperatorComposition *homeKitRegistrationListener;
  PLEntryNotificationOperatorComposition *v13;
  PLEntryNotificationOperatorComposition *sbcLevelChanged;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  PLTimer *v21;
  PLTimer *runTimeAggregatorTimer;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];

  v3 = objc_alloc(MEMORY[0x1E0D80090]);
  v4 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __42__PLHomeKitAgent_initOperatorDependancies__block_invoke;
  v29[3] = &unk_1E8578610;
  v29[4] = self;
  v5 = (PLXPCListenerOperatorComposition *)objc_msgSend(v3, "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B180, v29);
  homeKitEventsListener = self->_homeKitEventsListener;
  self->_homeKitEventsListener = v5;

  v28[0] = v4;
  v28[1] = 3221225472;
  v28[2] = __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_209;
  v28[3] = &unk_1E8578610;
  v28[4] = self;
  v7 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B1A8, v28);
  homeConfigurationListener = self->_homeConfigurationListener;
  self->_homeConfigurationListener = v7;

  v27[0] = v4;
  v27[1] = 3221225472;
  v27[2] = __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_213;
  v27[3] = &unk_1E8578610;
  v27[4] = self;
  v9 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B1D0, v27);
  cameraConfigurationListener = self->_cameraConfigurationListener;
  self->_cameraConfigurationListener = v9;

  v26[0] = v4;
  v26[1] = 3221225472;
  v26[2] = __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_217;
  v26[3] = &unk_1E8578610;
  v26[4] = self;
  v11 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B1F8, v26);
  homeKitRegistrationListener = self->_homeKitRegistrationListener;
  self->_homeKitRegistrationListener = v11;

  v25[0] = v4;
  v25[1] = 3221225472;
  v25[2] = __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_219;
  v25[3] = &unk_1E8577F48;
  v25[4] = self;
  objc_msgSend(MEMORY[0x1E0D7FFC8], "significantBatteryChangeNotificationWithOperator:withBlock:", self, v25);
  v13 = (PLEntryNotificationOperatorComposition *)objc_claimAutoreleasedReturnValue();
  sbcLevelChanged = self->_sbcLevelChanged;
  self->_sbcLevelChanged = v13;

  v24[0] = v4;
  v24[1] = 3221225472;
  v24[2] = __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_2;
  v24[3] = &unk_1E8577F48;
  v24[4] = self;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFC8]), "initWithOperator:forEntryKey:withBlock:", self, CFSTR("PLSleepWakeAgent_EventForward_PowerState"), v24);
  -[PLHomeKitAgent setDeviceWake:](self, "setDeviceWake:", v15);
  -[PLOperator defaultDoubleForKey:](self, "defaultDoubleForKey:", CFSTR("RunTimeAggregatorTimerCadence"));
  v17 = v16;
  v18 = objc_alloc(MEMORY[0x1E0D80070]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator workQueue](self, "workQueue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v4;
  v23[1] = 3221225472;
  v23[2] = __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_239;
  v23[3] = &unk_1E8578078;
  v23[4] = self;
  v21 = (PLTimer *)objc_msgSend(v18, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v19, 1, 0, v20, v23, v17, 0.0);
  runTimeAggregatorTimer = self->_runTimeAggregatorTimer;
  self->_runTimeAggregatorTimer = v21;

}

void __42__PLHomeKitAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogHomeKit();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLHomeKitAgent_EventPoint_HomeKitEvents: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointHomeKitEvents:", v6);
}

void __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_209(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogHomeKit();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "HomeConfiguration payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardHomeConfiguration:", v6);
}

void __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_213(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogHomeKit();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "CameraConfiguration payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardCameraConfiguration:", v6);
}

void __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_217(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogHomeKit();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "HomeKitRegistration payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventPointHomeKitRegistration:", v6);
}

uint64_t __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_219(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeAggregateCounters:", CFSTR("sbc"));
}

void __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(a2, "objectForKey:", CFSTR("entry"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Reason"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Reason"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "containsObject:", CFSTR("bluetooth")))
        {
          ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
          objc_msgSend(v4, "entryDate");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "timeIntervalSince1970");
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) = v8;

          objc_msgSend(*(id *)(a1 + 32), "writeAggregateCounters:", CFSTR("btwake"));
        }

      }
    }
    else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v9 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_3;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v9;
      if (qword_1ED882408 != -1)
        dispatch_once(&qword_1ED882408, block);
      if (_MergedGlobals_1_4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: No entry object associated with SleepWake entry"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLHomeKitAgent.m");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLHomeKitAgent initOperatorDependancies]_block_invoke_2");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 450);

        PLLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v10;
          _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }

  }
}

uint64_t __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_4 = result;
  return result;
}

uint64_t __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_239(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 216) = 0;
  *(_QWORD *)(*(_QWORD *)(result + 32) + 224) = 0;
  return result;
}

- (int64_t)eventTypeStringToEnum:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKit BLE Advertisement")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKit Connection")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKit IDS Push")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKit Cloud Push")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKit IP Event")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKit Loxy Event")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKit Bonjour")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKit Disconnection")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)registrationTypeStringToEnum:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKit Remote Reachability Registration Event")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKit Characteristic Registration Event")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isAllowedMessageType:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  objc_msgSend(v3, "setWithObjects:", CFSTR("HMDFetchHomeDataMessage"), CFSTR("RemoteEventRouterRequestMessage"), CFSTR("kModifyCharacterisiticNotificationsRequestKey"), CFSTR("HMDHouseholdMetricsHomeDataLogEventRequest"), CFSTR("kEnableAccessoryReachabilityNotificationRequestKey"), CFSTR("kDisableAccessoryReachabilityNotificationRequestKey"), CFSTR("kPingInternalRequestKey"), CFSTR("RemoteEventRouterUpdateMessageName"), CFSTR("primaryResidentDiscovery"), CFSTR("kMultipleCharacteristicReadRequestKey"), CFSTR("kCharacterisiticsChangedInternalNotificationKey"), CFSTR("kRemoteReachabilityChangedNotificationKey"), CFSTR("kDeviceMeshUpdateKey"), CFSTR("kMultipleCharacteristicWriteRequestKey"), CFSTR("kDeviceMeshUpdateRequestKey"), CFSTR("mesh.requestCapabilities"), CFSTR("kHomeLocationUpdatedNotificationKey"),
    CFSTR("kElectDeviceForIDSSessionKey"),
    CFSTR("kEventTriggerUserPermissionRemoveDialogKey"),
    CFSTR("mesh.currentPrimaryUpdate"),
    CFSTR("kTakeSnapshotRemoteRequestKey"),
    CFSTR("kCurrentHomeChangedNotificationKey"),
    CFSTR("mesh.meshInformationRequest"),
    CFSTR("HMDRemotePersonDataMessengerPerformCloudPullMessage"),
    CFSTR("kTakeSnapshotRemoteReceivedKey"),
    CFSTR("HMDMAR.RouteMediaAction"),
    CFSTR("HMDUCM.rRepr"),
    CFSTR("kStartRecordingSessionRequestKey"),
    CFSTR("HMDRemoteCameraReachabilityDidChangeMessage"),
    CFSTR("kNegotitateRemoteStreamRequestKey"),
    CFSTR("kStopRemoteStreamRequestKey"),
    CFSTR("HMAccessoryFetchManagedConfigurationProfilesMessage"),
    CFSTR("kStreamStoppedRemoteNotificationKey"),
    CFSTR("HMDCloudShareInviteMessage"),
    CFSTR("HMDCloudShareRequestInviteMessage"),
    CFSTR("kStartRemoteStreamRequestKey"),
    CFSTR("HMDMediaProfileSetPowerRequestKey"),
    CFSTR("HMDCameraAnalysisStatePublisherStateUpdateMessage"),
    CFSTR("kSetAppDataRequestKey"),
    CFSTR("kTakeSnapshotSendFailedNotificationKey"),
    CFSTR("kRenameAccessoryRequestKey"),
    CFSTR("kUpdateRoomForAccessoryRequestKey"),
    CFSTR("kMediaPropertiesReadRequestKey"),
    CFSTR("kPredicateEvaluatePredicateRequestKey"),
    CFSTR("HMDUCM.rsr"),
    CFSTR("kReconfigureRemoteStreamRequestKey"),
    CFSTR("kRenameServiceRequestKey"),
    CFSTR("HMAccessorySettingsUpdateRequestMessage"),
    CFSTR("kRemoveAccessoryRequestKey"),
    CFSTR("kHomeDataFragmentedSyncRequestKey"),
    CFSTR("kSecureClientIDSMessageRequestKey"),
    CFSTR("kAssistantTeamIdentifierChangeInternalNotificationKey"),
    CFSTR("kRemoveTriggerRequestKey"),
    CFSTR("HMDHomeQueryResidentReachabilityForAccessoriesMessageKey"),
    CFSTR("kRequestForCompanionKeysSyncInternalRequestKey"),
    CFSTR("HMDHomeCHIPSendReportMessage"),
    CFSTR("HMAccessoryFetchCHIPPairingsMessage"),
    CFSTR("kAddRoomRequestKey"),
    CFSTR("kSetAssociatedServiceTypeRequestKey"),
    CFSTR("HMAccessorySettingsFetchRequestMessage"),
    CFSTR("HMDHomeResolveLockNotificationContextIdentifierMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)logEventPointHomeKitEvents:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  NSObject *v23;
  __CFString *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  unint64_t v31;
  uint64_t v32;
  int *v33;
  uint64_t block;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  void *v37;
  uint64_t v38;
  _QWORD v39[2];
  _QWORD v40[2];
  uint8_t buf[4];
  __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kHMFPowerLogEventType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLHomeKitAgent eventTypeStringToEnum:](self, "eventTypeStringToEnum:", v5);
  if (v6 == 2)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kHMFPowerLogLinkTypeKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("HomeKitLinkTypeBluetoothLE")) & 1) != 0)
    {
      v6 = 8;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("HomeKitLinkTypeIP")))
    {
      v6 = 9;
    }
    else
    {
      v6 = 2;
    }

  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = __45__PLHomeKitAgent_logEventPointHomeKitEvents___block_invoke;
    v37 = &__block_descriptor_40_e5_v8__0lu32l8;
    v38 = v8;
    if (qword_1ED882410 != -1)
      dispatch_once(&qword_1ED882410, &block);
    if (byte_1ED8823F1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Logging for type HomeKit %@\n"), v5, block, v35, v36, v37, v38);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLHomeKitAgent.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLHomeKitAgent logEventPointHomeKitEvents:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 643);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v9;
        _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (!self->_enablelog)
    self->_enablelog = 1;
  v15 = *MEMORY[0x1E0D80390];
  +[PLOperator entryKeyForType:andName:](PLHomeKitAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("HomeKitEvents"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v16);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accessoryCategory"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("accessoryCategory"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kHMFPowerLogDeviceIdentiferKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("kHMFPowerLogDeviceIdentiferKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("eventType"));

  if (v6 == 3)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kHMFPowerLogMessageTypeKey"));
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (__CFString *)v21;
      if (!-[PLHomeKitAgent isAllowedMessageType:](self, "isAllowedMessageType:", v21))
      {
        PLLogHomeKit();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v22;
          _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@ is not an allowed Message Type, changing to 'Unknown'", buf, 0xCu);
        }

        v22 = CFSTR("Unknown");
      }
      v39[0] = CFSTR("MessageType");
      v39[1] = CFSTR("Count");
      v40[0] = v22;
      v40[1] = &unk_1E862F010;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      PLLogHomeKit();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v24;
        _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "Got callback for IDSPushMessageTypes: %@", buf, 0xCu);
      }

      -[PLHomeKitAgent logAggregateIDSPushMessageTypes:](self, "logAggregateIDSPushMessageTypes:", v24);
    }
  }
  -[PLOperator logEntry:](self, "logEntry:", v17);
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("HomeKit BLE Advertisement")))
  {
    +[PLOperator entryKeyForType:andName:](PLHomeKitAgent, "entryKeyForType:andName:", v15, CFSTR("HomeKitBTLE"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v26, v4);
    objc_msgSend(v27, "entryDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "timeIntervalSince1970");
    v30 = v29;

    ++self->_numBTPushes;
    if (self->_lastapwake + 2.0 >= v30)
      ++self->_numBTWakeAdvt;
    v31 = self->_numBTlines + 1;
    self->_numBTlines = v31;
    if (v31 <= 0xA)
      -[PLOperator logEntry:](self, "logEntry:", v27);

    goto LABEL_32;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("HomeKit IP Event")))
  {
    v32 = 144;
    goto LABEL_46;
  }
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("HomeKit Connection")))
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("HomeKit Cloud Push")))
    {
      v32 = 160;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("HomeKit IDS Push")))
    {
      v32 = 152;
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("HomeKit Bonjour")))
        goto LABEL_47;
      v32 = 136;
    }
LABEL_46:
    ++*(Class *)((char *)&self->super.super.super.isa + v32);
    goto LABEL_47;
  }
  v33 = &OBJC_IVAR___PLHomeKitAgent__numBTConnections;
  ++self->_numConnections;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kHMFPowerLogLinkTypeKey"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v26, "isEqualToString:", CFSTR("HomeKitLinkTypeBluetoothLE")) & 1) != 0)
    goto LABEL_39;
  if (objc_msgSend(v26, "isEqualToString:", CFSTR("HomeKitLinkTypeIP")))
  {
    v33 = &OBJC_IVAR___PLHomeKitAgent__numIPConnections;
LABEL_39:
    ++*(Class *)((char *)&self->super.super.super.isa + *v33);
  }
LABEL_32:

LABEL_47:
}

uint64_t __45__PLHomeKitAgent_logEventPointHomeKitEvents___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8823F1 = result;
  return result;
}

- (void)logEventPointHomeKitRegistration:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kHMFPowerLogEventType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLHomeKitAgent registrationTypeStringToEnum:](self, "registrationTypeStringToEnum:", v5);

  +[PLOperator entryKeyForType:andName:](PLHomeKitAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("HomeKitRegistration"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v11, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("RegistrationType"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kHMFPowerLogClientIdentifierKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("BundleID"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kHMFPowerLogEnabledKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("Enabled"));
  -[PLOperator logEntry:](self, "logEntry:", v7);

}

- (void)writeAggregateCounters:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[11];
  _QWORD v27[13];

  v27[11] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLHomeKitAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("HomeKitSummary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_enablelog)
  {
    v18 = objc_msgSend(v4, "isEqualToString:", CFSTR("btwake"));
    v24 = v5;
    v25 = v4;
    if ((v18 & 1) != 0)
    {
      v19 = 0;
      v6 = 1;
    }
    else
    {
      v19 = objc_msgSend(v4, "isEqualToString:", CFSTR("sbc"));
      if (v19)
        v6 = 2;
      else
        v6 = 0;
    }
    v26[0] = CFSTR("numBTPushes");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numBTPushes, 88);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v23;
    v26[1] = CFSTR("numConnections");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numConnections);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v22;
    v26[2] = CFSTR("numBTConnections");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numBTConnections);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v21;
    v26[3] = CFSTR("numIPConnections");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numIPConnections);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[3] = v20;
    v26[4] = CFSTR("numIPEvents");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numIPEvents);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27[4] = v7;
    v26[5] = CFSTR("numIDSPushes");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numIDSPushes);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27[5] = v8;
    v26[6] = CFSTR("numCloudPushes");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numCloudPushes);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[6] = v9;
    v26[7] = CFSTR("numBonjour");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numBonjour);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[7] = v10;
    v26[8] = CFSTR("numBTWakeAdvt");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numBTWakeAdvt);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[8] = v11;
    v26[9] = CFSTR("numBTWakes");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numBTWakes);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[9] = v12;
    v26[10] = CFSTR("Reason");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[10] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v24;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v24, v14);
    v16 = self->_numaggregatelines + 1;
    self->_numaggregatelines = v16;
    if (v16 <= 0x1D)
    {
      if (v19)
      {
        -[PLOperator logEntry:](self, "logEntry:", v15);
      }
      else if (v18 && *(Class *)((char *)&self->super.super.super.isa + v17) > (Class)self->_numPrevBTPushes)
      {
        -[PLOperator logEntry:](self, "logEntry:", v15);
        self->_numPrevBTPushes = *(unint64_t *)((char *)&self->super.super.super.isa + v17);
      }
    }

    v4 = v25;
  }

}

- (void)logEventForwardHomeConfiguration:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLHomeKitAgent, "entryKeyForType:andName:", v4, CFSTR("HomeConfiguration"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v9, v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isCurrentDeviceHH2Enabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v7, "isEqual:", MEMORY[0x1E0C9AAB0]);
  if ((_DWORD)v5)
    v8 = &unk_1E862F028;
  else
    v8 = &unk_1E862F010;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("HomeHubVersion"));
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

- (void)logEventForwardCameraConfiguration:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLHomeKitAgent, "entryKeyForType:andName:", v4, CFSTR("CameraConfiguration"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logAggregateIDSPushMessageTypes:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80368];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLHomeKitAgent, "entryKeyForType:andName:", v4, CFSTR("IDSPushMessageTypes"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (PLXPCListenerOperatorComposition)homeKitEventsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHomeKitEventsListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLXPCListenerOperatorComposition)homeConfigurationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHomeConfigurationListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLXPCListenerOperatorComposition)cameraConfigurationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCameraConfigurationListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLXPCListenerOperatorComposition)homeKitRegistrationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHomeKitRegistrationListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (unint64_t)numBTPushes
{
  return self->_numBTPushes;
}

- (void)setNumBTPushes:(unint64_t)a3
{
  self->_numBTPushes = a3;
}

- (unint64_t)numConnections
{
  return self->_numConnections;
}

- (void)setNumConnections:(unint64_t)a3
{
  self->_numConnections = a3;
}

- (unint64_t)numPrevBTPushes
{
  return self->_numPrevBTPushes;
}

- (void)setNumPrevBTPushes:(unint64_t)a3
{
  self->_numPrevBTPushes = a3;
}

- (unint64_t)numPrevConnections
{
  return self->_numPrevConnections;
}

- (void)setNumPrevConnections:(unint64_t)a3
{
  self->_numPrevConnections = a3;
}

- (unint64_t)numBTConnections
{
  return self->_numBTConnections;
}

- (void)setNumBTConnections:(unint64_t)a3
{
  self->_numBTConnections = a3;
}

- (unint64_t)numIPConnections
{
  return self->_numIPConnections;
}

- (void)setNumIPConnections:(unint64_t)a3
{
  self->_numIPConnections = a3;
}

- (unint64_t)numBonjour
{
  return self->_numBonjour;
}

- (void)setNumBonjour:(unint64_t)a3
{
  self->_numBonjour = a3;
}

- (unint64_t)numIPEvents
{
  return self->_numIPEvents;
}

- (void)setNumIPEvents:(unint64_t)a3
{
  self->_numIPEvents = a3;
}

- (unint64_t)numIDSPushes
{
  return self->_numIDSPushes;
}

- (void)setNumIDSPushes:(unint64_t)a3
{
  self->_numIDSPushes = a3;
}

- (unint64_t)numCloudPushes
{
  return self->_numCloudPushes;
}

- (void)setNumCloudPushes:(unint64_t)a3
{
  self->_numCloudPushes = a3;
}

- (unint64_t)numBTWakeAdvt
{
  return self->_numBTWakeAdvt;
}

- (void)setNumBTWakeAdvt:(unint64_t)a3
{
  self->_numBTWakeAdvt = a3;
}

- (unint64_t)numBTWakes
{
  return self->_numBTWakes;
}

- (void)setNumBTWakes:(unint64_t)a3
{
  self->_numBTWakes = a3;
}

- (double)lastapwake
{
  return self->_lastapwake;
}

- (void)setLastapwake:(double)a3
{
  self->_lastapwake = a3;
}

- (BOOL)enablelog
{
  return self->_enablelog;
}

- (void)setEnablelog:(BOOL)a3
{
  self->_enablelog = a3;
}

- (PLEntryNotificationOperatorComposition)sbcLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 192, 1);
}

- (void)setSbcLevelChanged:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (PLEntryNotificationOperatorComposition)deviceWake
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 200, 1);
}

- (void)setDeviceWake:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (PLTimer)runTimeAggregatorTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 208, 1);
}

- (void)setRunTimeAggregatorTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (unint64_t)numaggregatelines
{
  return self->_numaggregatelines;
}

- (void)setNumaggregatelines:(unint64_t)a3
{
  self->_numaggregatelines = a3;
}

- (unint64_t)numBTlines
{
  return self->_numBTlines;
}

- (void)setNumBTlines:(unint64_t)a3
{
  self->_numBTlines = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runTimeAggregatorTimer, 0);
  objc_storeStrong((id *)&self->_deviceWake, 0);
  objc_storeStrong((id *)&self->_sbcLevelChanged, 0);
  objc_storeStrong((id *)&self->_homeKitRegistrationListener, 0);
  objc_storeStrong((id *)&self->_cameraConfigurationListener, 0);
  objc_storeStrong((id *)&self->_homeConfigurationListener, 0);
  objc_storeStrong((id *)&self->_homeKitEventsListener, 0);
}

@end
