@implementation PLSleepWakeAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSleepWakeAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)railDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventNoneDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("PowerNapConfig");
  objc_msgSend((id)objc_opt_class(), "entryEventNoneDefinitionPowerNapConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventNoneDefinitionPowerNapConfig
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "isMac"))
    return MEMORY[0x1E0C9AA70];
  v14[0] = *MEMORY[0x1E0D80298];
  v12 = *MEMORY[0x1E0D80318];
  v13 = &unk_1E8652C60;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("BatteryPower");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("ACPower");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  v9[0] = CFSTR("WakeGesture");
  objc_msgSend(a1, "entryEventPointDefinitionWakeGesture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("CurrentMachWakeTime");
  objc_msgSend(a1, "entryEventPointDefinitionCurrentMachWakeTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("KernelState");
  objc_msgSend(a1, "entryEventPointDefinitionKernelState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("ScheduledWake");
  objc_msgSend(a1, "entryEventPointDefinitionScheduledWake");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventPointDefinitionWakeGesture
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
  v16[0] = &unk_1E8652C60;
  v16[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("Mode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("Event");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("Display");
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

+ (id)entryEventPointDefinitionCurrentKernelWakeTime
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventPointDefinitionCurrentMachWakeTime
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0D80298];
  v12 = *MEMORY[0x1E0D80318];
  v13 = &unk_1E8652C60;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("CurrentMachWakeTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("WakeReasons");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventPointDefinitionKernelState
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "hasAOT"))
    return MEMORY[0x1E0C9AA70];
  v16[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80308];
  v14[0] = *MEMORY[0x1E0D80318];
  v14[1] = v2;
  v15[0] = &unk_1E8652C60;
  v15[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  v16[1] = *MEMORY[0x1E0D802F0];
  v12[0] = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("Reason");
  v13[0] = v5;
  v10 = *MEMORY[0x1E0D80358];
  v11 = &unk_1E8632868;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = *MEMORY[0x1E0D80260];
  v17[1] = v7;
  v17[2] = &unk_1E864FDA8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventPointDefinitionScheduledWake
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
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[4];

  v24[2] = *MEMORY[0x1E0C80C00];
  v23[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v21[0] = *MEMORY[0x1E0D80318];
  v21[1] = v2;
  v22[0] = &unk_1E8652C70;
  v22[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E0D802F0];
  v19[0] = CFSTR("EventTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_DateFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v19[1] = CFSTR("Type");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  v19[2] = CFSTR("PID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v4;
  v19[3] = CFSTR("SleepWakeUUID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v6;
  v19[4] = CFSTR("WakeInfo");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v8;
  v19[5] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat_withProcessName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
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
  v7[0] = CFSTR("PowerState");
  objc_msgSend(a1, "entryEventForwardDefinitionPowerState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("UserIdle");
  v8[0] = v3;
  objc_msgSend(a1, "entryEventForwardDefinitionUserIdle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryEventForwardDefinitionUserIdle
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitionPowerState
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  uint64_t v33;
  void *v34;
  _QWORD v35[6];
  _QWORD v36[6];
  _QWORD v37[6];
  _QWORD v38[6];
  _QWORD v39[5];
  _QWORD v40[7];

  v40[5] = *MEMORY[0x1E0C80C00];
  v39[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80320];
  v37[0] = *MEMORY[0x1E0D80318];
  v37[1] = v2;
  v38[0] = &unk_1E8652C80;
  v38[1] = MEMORY[0x1E0C9AA60];
  v3 = *MEMORY[0x1E0D80308];
  v37[2] = *MEMORY[0x1E0D80300];
  v37[3] = v3;
  v38[2] = MEMORY[0x1E0C9AAA0];
  v38[3] = MEMORY[0x1E0C9AAB0];
  v4 = *MEMORY[0x1E0D80250];
  v37[4] = *MEMORY[0x1E0D802A8];
  v37[5] = v4;
  v38[4] = MEMORY[0x1E0C9AAB0];
  v38[5] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v28;
  v39[1] = *MEMORY[0x1E0D802F0];
  v35[0] = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v26;
  v35[1] = CFSTR("Event");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v24;
  v35[2] = CFSTR("Reason");
  v33 = *MEMORY[0x1E0D80358];
  v34 = &unk_1E8632868;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v23;
  v35[3] = CFSTR("UUID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_StringFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v21;
  v35[4] = CFSTR("CurrentMachWakeTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v19;
  v35[5] = CFSTR("KernelSleepDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_DateFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v5;
  v40[2] = &unk_1E864FDC0;
  v6 = *MEMORY[0x1E0D802D8];
  v39[2] = *MEMORY[0x1E0D80260];
  v39[3] = v6;
  v40[3] = &unk_1E864FDD8;
  v39[4] = *MEMORY[0x1E0D802B0];
  v31[0] = CFSTR("key");
  v29[0] = CFSTR("PID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = CFSTR("AppName");
  v30[0] = v8;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat_withAppName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = CFSTR("value");
  v32[0] = v11;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "commonTypeDict_StringFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLSleepWakeAgent)init
{
  PLSleepWakeAgent *v2;
  PLSleepWakeAgent *v3;
  PLEventForwardPowerStateEntry *lastSleepEntry;
  PLEventForwardPowerStateEntry *lastWakeEntry;
  uint64_t v6;
  PLSemaphore *canSleepSemaphore;
  IONotificationPort *systemPowerPortRef;
  NSObject *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v11;
  __CFNotificationCenter *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PLSleepWakeAgent;
  v2 = -[PLAgent init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    lastSleepEntry = v2->_lastSleepEntry;
    v2->_lastSleepEntry = 0;

    lastWakeEntry = v3->_lastWakeEntry;
    v3->_lastWakeEntry = 0;

    v3->_systemPowerPortRef = 0;
    v3->_rootDomainConnect = IORegisterForSystemPower(v3, &v3->_systemPowerPortRef, (IOServiceInterestCallback)PowerChangedCallback, &v3->_pmNotifier);
    objc_msgSend(MEMORY[0x1E0D80030], "sharedSemaphoreForKey:", *MEMORY[0x1E0D80218]);
    v6 = objc_claimAutoreleasedReturnValue();
    canSleepSemaphore = v3->_canSleepSemaphore;
    v3->_canSleepSemaphore = (PLSemaphore *)v6;

    if (v3->_rootDomainConnect)
    {
      systemPowerPortRef = v3->_systemPowerPortRef;
      if (systemPowerPortRef)
      {
        -[PLOperator workQueue](v3, "workQueue");
        v9 = objc_claimAutoreleasedReturnValue();
        IONotificationPortSetDispatchQueue(systemPowerPortRef, v9);

      }
    }
    -[PLSleepWakeAgent registerForCapabilitiesChange](v3, "registerForCapabilitiesChange");
    if (-[PLOperator isDebugEnabled](v3, "isDebugEnabled"))
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)fakeSleep, CFSTR("com.apple.powerlogd.PLSleepWakeAgent.fakeSleep"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v11 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v11, v3, (CFNotificationCallback)fakeWakeBB, CFSTR("com.apple.powerlogd.PLSleepWakeAgent.fakeWakeBB"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v12 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v12, v3, (CFNotificationCallback)fakeWakeWiFi, CFSTR("com.apple.powerlogd.PLSleepWakeAgent.fakeWakeWiFi"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
  return v3;
}

- (void)initOperatorDependancies
{
  PLEventForwardPowerStateEntry *v3;
  PLEventForwardPowerStateEntry *lastSleepEntry;
  PLEventForwardPowerStateEntry *v5;
  PLEventForwardPowerStateEntry *lastWakeEntry;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];

  -[PLSleepWakeAgent getLastSleepEntry](self, "getLastSleepEntry");
  v3 = (PLEventForwardPowerStateEntry *)objc_claimAutoreleasedReturnValue();
  lastSleepEntry = self->_lastSleepEntry;
  self->_lastSleepEntry = v3;

  -[PLSleepWakeAgent getLastWakeEntry](self, "getLastWakeEntry");
  v5 = (PLEventForwardPowerStateEntry *)objc_claimAutoreleasedReturnValue();
  lastWakeEntry = self->_lastWakeEntry;
  self->_lastWakeEntry = v5;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D80078], "powerModelForOperatorName:", CFSTR("Processor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(MEMORY[0x1E0D80020], "kPLSoCClassOfDevice");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    -[PLSleepWakeAgent setApSOCBasePower:](self, "setApSOCBasePower:");

    -[PLSleepWakeAgent apSOCBasePower](self, "apSOCBasePower");
    if (v11 <= 0.0)
      -[PLSleepWakeAgent setApSOCBasePower:](self, "setApSOCBasePower:", 30.0);

  }
  -[PLOperator storage](self, "storage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLSleepWakeAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("PowerState"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastEntryForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    -[PLSleepWakeAgent systemPoweredOn](self, "systemPoweredOn");
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    v15 = objc_alloc(MEMORY[0x1E0D80090]);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __44__PLSleepWakeAgent_initOperatorDependancies__block_invoke;
    v20[3] = &unk_1E8578610;
    v20[4] = self;
    v16 = (void *)objc_msgSend(v15, "initWithOperator:withRegistration:withBlock:", self, &unk_1E864BBA8, v20);
    -[PLSleepWakeAgent setWakeGestureXPCListener:](self, "setWakeGestureXPCListener:", v16);
    if ((int)objc_msgSend(MEMORY[0x1E0D80020], "kPLSoCClassOfDevice") <= 1001002)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSleepWakeAgent apSOCBasePower](self, "apSOCBasePower");
      objc_msgSend(v18, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 52, v17);

      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 8, &unk_1E864FDF0, v17);

    }
  }
  -[PLSleepWakeAgent registerForUserIdleNotification](self, "registerForUserIdleNotification");
  -[PLSleepWakeAgent logEventForwardUserIdle:](self, "logEventForwardUserIdle:", IOPMUserIsActive() ^ 1);

}

void __44__PLSleepWakeAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __44__PLSleepWakeAgent_initOperatorDependancies__block_invoke_2;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (qword_1ED882DC8 != -1)
      dispatch_once(&qword_1ED882DC8, &block);
    if (_MergedGlobals_1_24)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Lift to Wake! %@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 363);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventPointWakeGesture:", v6);

}

uint64_t __44__PLSleepWakeAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_24 = result;
  return result;
}

- (void)logEventPointWakeGesture:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLSleepWakeAgent, "entryKeyForType:andName:", v4, CFSTR("WakeGesture"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("Mode"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("event"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("Event"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("display"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("Display"));
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

- (void)logEventPointKernelState
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t *v16;
  unint64_t v17;
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
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  PLSleepWakeAgent *v34;
  _QWORD block[5];
  _QWORD v36[5];
  size_t v37;
  _OWORD v38[98];
  uint64_t v39;
  NSObject *v40;
  void *v41;
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  memset(v38, 0, 512);
  v37 = 1960;
  v3 = sysctlbyname("kern.aotmetrics", v38, &v37, 0, 0);
  if ((_DWORD)v3)
  {
    v4 = v3;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v5 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __44__PLSleepWakeAgent_logEventPointKernelState__block_invoke_122;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v5;
      if (qword_1ED882DD8 != -1)
        dispatch_once(&qword_1ED882DD8, block);
      if (byte_1ED882DAA)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to query kernel metrics (%d)"), v4);
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent logEventPointKernelState]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 448);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v12 = (void *)v6;
LABEL_28:

          return;
        }
        *(_DWORD *)buf = 138412290;
        v12 = (void *)v6;
        v43 = v6;
        goto LABEL_27;
      }
    }
  }
  else
  {
    if (LODWORD(v38[0]))
    {
      v34 = self;
      if (LODWORD(v38[0]) >= 0x18)
        v13 = 24;
      else
        v13 = LODWORD(v38[0]);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLOperator entryKeyForType:andName:](PLSleepWakeAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("KernelState"));
      v11 = objc_claimAutoreleasedReturnValue();
      v14 = 0;
      v15 = (char *)&v38[2] + 8;
      v16 = &v39;
      v17 = 0x1E0C99000uLL;
      do
      {
        if (v14)
        {
          objc_msgSend(*(id *)(v17 + 3432), "dateWithTimeIntervalSince1970:", (double)(*v16 & 0x3FF) / 1000.0 + (double)((unint64_t)*v16 >> 10));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "convertFromSystemToMonotonic");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v11, v19);
          objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_1E8632898, CFSTR("State"));
          objc_msgSend(v12, "addObject:", v20);

        }
        if (v14 < (v13 - 1))
        {
          objc_msgSend(*(id *)(v17 + 3432), "dateWithTimeIntervalSince1970:", (double)(v16[24] & 0x3FF) / 1000.0 + (double)((unint64_t)v16[24] >> 10));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "convertFromSystemToMonotonic");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "tokenizedByString:", CFSTR(" "));
          v24 = v12;
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v11, v22);
          objc_msgSend(v26, "setObject:forKeyedSubscript:", &unk_1E8632868, CFSTR("State"));
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, CFSTR("Reason"));
          objc_msgSend(v24, "addObject:", v26);

          v12 = v24;
          v17 = 0x1E0C99000;

        }
        ++v14;
        v15 += 64;
        ++v16;
      }
      while (v13 != v14);
      if (objc_msgSend(v12, "count"))
      {
        v40 = v11;
        v41 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLOperator logEntries:withGroupID:](v34, "logEntries:withGroupID:", v27, v11);

      }
      goto LABEL_28;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v28 = objc_opt_class();
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __44__PLSleepWakeAgent_logEventPointKernelState__block_invoke;
      v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v36[4] = v28;
      if (qword_1ED882DD0 != -1)
        dispatch_once(&qword_1ED882DD0, v36);
      if (byte_1ED882DA9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No kernel sleep in after last reading"));
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "lastPathComponent");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent logEventPointKernelState]");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v32, v33, 410);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v12 = (void *)v29;
          goto LABEL_28;
        }
        *(_DWORD *)buf = 138412290;
        v12 = (void *)v29;
        v43 = v29;
LABEL_27:
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        goto LABEL_28;
      }
    }
  }
}

uint64_t __44__PLSleepWakeAgent_logEventPointKernelState__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882DA9 = result;
  return result;
}

uint64_t __44__PLSleepWakeAgent_logEventPointKernelState__block_invoke_122(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882DAA = result;
  return result;
}

- (void)logEventForwardUserIdle:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  +[PLOperator entryKeyForType:andName:](PLSleepWakeAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("UserIdle"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("Idle"));

  -[PLOperator logEntry:](self, "logEntry:", v5);
}

- (signed)getSleepState
{
  return 1;
}

- (void)systemPoweredOn
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1D179C2E0](self, a2);
  v4 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSleepWakeAgent logSleepEntries:](self, "logSleepEntries:", v5);
  -[PLSleepWakeAgent logWakeEntries:withCurrentTime:](self, "logWakeEntries:withCurrentTime:", v5, v4);
  if (objc_msgSend(MEMORY[0x1E0D80020], "hasAOT"))
    -[PLSleepWakeAgent logEventPointKernelState](self, "logEventPointKernelState");
  -[PLSleepWakeAgent logEventPointCurrentScheduledWake](self, "logEventPointCurrentScheduledWake");

  objc_autoreleasePoolPop(v3);
}

- (void)capabilitiesChanged:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  unint64_t v9;
  _UNKNOWN **v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  PLEventForwardPowerStateEntry *lastWakeEntry;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  PLEventForwardPowerStateEntry *v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  _QWORD block[5];
  _QWORD v78[5];
  size_t v79;
  _QWORD v80[5];
  void *v81;
  uint8_t buf[4];
  void *v83;
  uint8_t v84[24];
  uint64_t v85;

  v3 = *(_QWORD *)&a3;
  v85 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D179C2E0](self, a2);
  v6 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = IOPMIsADarkWake();
  v9 = 0x1E0CB3000;
  v10 = &off_1E8575000;
  if ((v3 & 0x8000) != 0 || !v8)
    goto LABEL_31;
  v75 = v5;
  v11 = -[PLSleepWakeAgent getCurrentWakeTime](self, "getCurrentWakeTime");
  v12 = 0x1E0D80000uLL;
  v73 = v6;
  objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v6);
  v14 = v13;
  objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v11);
  objc_msgSend(v7, "dateByAddingTimeInterval:", -(v14 - v15));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSleepWakeAgent getCurrentWakeTimeKey](self, "getCurrentWakeTimeKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  lastWakeEntry = self->_lastWakeEntry;
  if (!lastWakeEntry)
    goto LABEL_12;
  -[PLEntry dictionary](lastWakeEntry, "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v16);
  v19 = v16;
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqual:", v21);

  v16 = v19;
  v12 = 0x1E0D80000;

  if (v22)
  {
    v9 = 0x1E0CB3000;
    v10 = &off_1E8575000;
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_30;
    v23 = objc_opt_class();
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __40__PLSleepWakeAgent_capabilitiesChanged___block_invoke;
    v80[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v80[4] = v23;
    if (qword_1ED882DE0 != -1)
      dispatch_once(&qword_1ED882DE0, v80);
    if (!byte_1ED882DAB)
      goto LABEL_30;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DidNotSleep with capabilities change"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "lastPathComponent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent capabilitiesChanged:]");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 531);

    PLLogCommon();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v84 = 138412290;
      *(_QWORD *)&v84[4] = v24;
      _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", v84, 0xCu);
    }

    v9 = 0x1E0CB3000;
  }
  else
  {
LABEL_12:
    v74 = v16;
    *(_OWORD *)v84 = 0uLL;
    v79 = 16;
    if (!sysctlbyname("kern.sleeptime", v84, &v79, 0, 0))
    {
      objc_msgSend(*(id *)(v12 + 120), "dateFromTimeval:", *(_OWORD *)v84);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v12 + 120), "dateFromTimevalSystemTime:", *(_OWORD *)v84);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = -[PLSleepWakeAgent getSleepState](self, "getSleepState");
      v33 = [PLEventForwardPowerStateEntry alloc];
      v34 = v32;
      v35 = (void *)v31;
      v36 = -[PLEventForwardPowerStateEntry initEntryWithState:withEvent:withReason:withKernelSleepDate:withDate:](v33, "initEntryWithState:withEvent:withReason:withKernelSleepDate:withDate:", v34, 4, 0, v31, v30);
      objc_storeStrong((id *)&self->_lastSleepEntry, v36);
      -[PLOperator logEntry:](self, "logEntry:", v36);
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v37 = objc_opt_class();
        v78[0] = MEMORY[0x1E0C809B0];
        v78[1] = 3221225472;
        v78[2] = __40__PLSleepWakeAgent_capabilitiesChanged___block_invoke_132;
        v78[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v78[4] = v37;
        if (qword_1ED882DE8 != -1)
          dispatch_once(&qword_1ED882DE8, v78);
        if (byte_1ED882DAC)
        {
          v38 = v30;
          v68 = *(_QWORD *)v84;
          v70 = (void *)MEMORY[0x1E0CB3940];
          v39 = *(unsigned int *)&v84[8];
          v72 = v38;
          objc_msgSend(v38, "timeIntervalSince1970");
          objc_msgSend(v70, "stringWithFormat:", CFSTR("Ker_sleep_time.sec=%ld,kern_sleep_time.usec=%d,sleepDate=%f,kernelSleepDate=%@,lastsleep=%@,thissleep=%@"), v68, v39, v40, v35, self->_lastSleepEntry, v36);
          v41 = objc_claimAutoreleasedReturnValue();
          v67 = (void *)MEMORY[0x1E0D7FF98];
          v69 = (void *)v41;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "lastPathComponent");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent capabilitiesChanged:]");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "logMessage:fromFile:fromFunction:fromLineNumber:", v69, v42, v43, 548);

          PLLogCommon();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v83 = v69;
            _os_log_debug_impl(&dword_1CAF47000, v44, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v30 = v72;
        }
      }

    }
    -[PLSleepWakeAgent getThisWakeEntry:withCurrentWakeTime:withIsDarkwake:withDidSleep:](self, "getThisWakeEntry:withCurrentWakeTime:withIsDarkwake:withDidSleep:", v76, v11, 1, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0x1E0CB3000uLL;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setObject:forKeyedSubscript:", v46, CFSTR("Capabilities"));

    objc_storeStrong((id *)&self->_lastWakeEntry, v45);
    -[PLOperator logEntry:](self, "logEntry:", v45);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v47 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40__PLSleepWakeAgent_capabilitiesChanged___block_invoke_139;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v47;
      if (qword_1ED882DF0 != -1)
        dispatch_once(&qword_1ED882DF0, block);
      if (byte_1ED882DAD)
      {
        v48 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "timeIntervalSince1970");
        v50 = v49;
        objc_msgSend(v76, "timeIntervalSince1970");
        v52 = v51;
        objc_msgSend(*(id *)(v12 + 120), "secondsFromMachTime:", v11);
        v54 = v53;
        objc_msgSend(*(id *)(v12 + 120), "secondsFromMachTime:", v73);
        objc_msgSend(v48, "stringWithFormat:", CFSTR("now=%f wakeDate=%f currentWakeTime=%f currentTime=%f lastWake=%@ thisWake=%@"), v50, v52, v54, v55, self->_lastWakeEntry, v45);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "lastPathComponent");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent capabilitiesChanged:]");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "logMessage:fromFile:fromFunction:fromLineNumber:", v56, v59, v60, 556);

        PLLogCommon();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v83 = v56;
          _os_log_debug_impl(&dword_1CAF47000, v61, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v9 = 0x1E0CB3000uLL;
      }
    }
    -[PLSleepWakeAgent getPostWakeEntry:](self, "getPostWakeEntry:", v11);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v62;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator postEntries:](self, "postEntries:", v63);

    -[PLSleepWakeAgent logEventPointCurrentScheduledWake](self, "logEventPointCurrentScheduledWake");
    v16 = v74;
    v5 = v75;
  }
  v10 = &off_1E8575000;
LABEL_30:

LABEL_31:
  if ((IOPMIsASleep() & 1) != 0)
  {
    v64 = 1;
  }
  else if ((IOPMIsADarkWake() & 1) != 0)
  {
    v64 = 5;
  }
  else
  {
    v64 = IOPMIsAUserWake() - 1;
  }
  v65 = (void *)objc_msgSend(objc_alloc((Class)v10[385]), "initEntryWithState:withEvent:withReason:withDate:", v64, 6, 0, v7);
  objc_msgSend(*(id *)(v9 + 2024), "numberWithUnsignedInt:", v3);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v66, CFSTR("Capabilities"));

  -[PLOperator logEntry:](self, "logEntry:", v65);
  objc_autoreleasePoolPop(v5);
}

uint64_t __40__PLSleepWakeAgent_capabilitiesChanged___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882DAB = result;
  return result;
}

uint64_t __40__PLSleepWakeAgent_capabilitiesChanged___block_invoke_132(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882DAC = result;
  return result;
}

uint64_t __40__PLSleepWakeAgent_capabilitiesChanged___block_invoke_139(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882DAD = result;
  return result;
}

- (void)logSleepEntries:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  PLEventForwardPowerStateEntry **p_lastSleepEntry;
  PLEventForwardPowerStateEntry *lastSleepEntry;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  PLSleepWakeAgent *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  PLEventForwardPowerStateEntry **v50;
  void *v51;
  void *v52;
  void *v53;
  PLSleepWakeAgent *v54;
  id obj;
  id v56;
  _QWORD block[5];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[5];
  _QWORD v63[5];
  size_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[2];
  _QWORD v68[2];
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D179C2E0]();
  v65 = 0;
  v66 = 0;
  v64 = 16;
  if (!sysctlbyname("kern.sleeptime", &v65, &v64, 0, 0))
  {
    v52 = v5;
    objc_msgSend(MEMORY[0x1E0D80078], "dateFromTimeval:", v65, v66);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80078], "dateFromTimevalSystemTime:", v65, v66);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    p_lastSleepEntry = &self->_lastSleepEntry;
    lastSleepEntry = self->_lastSleepEntry;
    v53 = v7;
    v50 = &self->_lastSleepEntry;
    v51 = (void *)v6;
    if (lastSleepEntry
      && (-[PLEntry dictionary](lastSleepEntry, "dictionary"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("KernelSleepDate")),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v7, "isEqualToDate:", v11),
          v11,
          v10,
          v12))
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v13 = objc_opt_class();
        v63[0] = MEMORY[0x1E0C809B0];
        v63[1] = 3221225472;
        v63[2] = __36__PLSleepWakeAgent_logSleepEntries___block_invoke;
        v63[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v63[4] = v13;
        if (qword_1ED882DF8 != -1)
          dispatch_once(&qword_1ED882DF8, v63);
        if (byte_1ED882DAE)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DidNotSleep"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "lastPathComponent");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent logSleepEntries:]");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 610);

          PLLogCommon();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v71 = v14;
            _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      v56 = -[PLEventForwardPowerStateEntry initEntryWithState:withEvent:withReason:withKernelSleepDate:withDate:]([PLEventForwardPowerStateEntry alloc], "initEntryWithState:withEvent:withReason:withKernelSleepDate:withDate:", 1, 5, 0, v7, v4);
    }
    else
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v20 = objc_opt_class();
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __36__PLSleepWakeAgent_logSleepEntries___block_invoke_147;
        v62[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v62[4] = v20;
        if (qword_1ED882E00 != -1)
          dispatch_once(&qword_1ED882E00, v62);
        if (byte_1ED882DAF)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DidSleep"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "lastPathComponent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent logSleepEntries:]");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 615);

          PLLogCommon();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v71 = v21;
            _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          p_lastSleepEntry = &self->_lastSleepEntry;
        }
      }
      v56 = -[PLEventForwardPowerStateEntry initEntryWithState:withEvent:withReason:withKernelSleepDate:withDate:]([PLEventForwardPowerStateEntry alloc], "initEntryWithState:withEvent:withReason:withKernelSleepDate:withDate:", -[PLSleepWakeAgent getSleepState](self, "getSleepState"), 4, 0, v7, v6);
      objc_storeStrong((id *)p_lastSleepEntry, v56);
      if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
      {
        if ((int)objc_msgSend(MEMORY[0x1E0D80020], "kPLSoCClassOfDevice") <= 1001002)
        {
          objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 52, v6, 0.0);

        }
        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 8, MEMORY[0x1E0C9AA60], v6);

      }
    }
    v54 = self;
    -[PLSleepWakeAgent getSleepStatisticsApps](self, "getSleepStatisticsApps");
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v59 != v31)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          v67[0] = CFSTR("PID");
          objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("PID"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v67[1] = CFSTR("AppName");
          v68[0] = v34;
          objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("AppName"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v68[1] = v35;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("ResponseType"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v37, v36);

        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
      }
      while (v30);
    }
    v5 = v52;
    v38 = v54;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v39 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__PLSleepWakeAgent_logSleepEntries___block_invoke_154;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v39;
      if (qword_1ED882E08 != -1)
        dispatch_once(&qword_1ED882E08, block);
      if (byte_1ED882DB0)
      {
        v40 = (void *)MEMORY[0x1E0CB3940];
        v41 = v65;
        v42 = v66;
        objc_msgSend(v51, "timeIntervalSince1970");
        objc_msgSend(v40, "stringWithFormat:", CFSTR("Ker_sleep_time.sec=%ld,kern_sleep_time.usec=%d,sleepDate=%f,kernelSleepDate=%@,lastsleep=%@,thissleep=%@"), v41, v42, v43, v53, *v50, v56);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "lastPathComponent");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent logSleepEntries:]");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "logMessage:fromFile:fromFunction:fromLineNumber:", v44, v47, v48, 646);

        PLLogCommon();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v71 = v44;
          _os_log_debug_impl(&dword_1CAF47000, v49, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v38 = v54;
      }
    }
    -[PLOperator logEntry:](v38, "logEntry:", v56);

  }
  objc_autoreleasePoolPop(v5);

}

uint64_t __36__PLSleepWakeAgent_logSleepEntries___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882DAE = result;
  return result;
}

uint64_t __36__PLSleepWakeAgent_logSleepEntries___block_invoke_147(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882DAF = result;
  return result;
}

uint64_t __36__PLSleepWakeAgent_logSleepEntries___block_invoke_154(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882DB0 = result;
  return result;
}

- (unint64_t)getCurrentWakeTime
{
  size_t v3;
  unint64_t v4;

  v3 = 8;
  v4 = 0;
  if (sysctlbyname("machdep.wake_abstime", &v4, &v3, 0, 0))
    return -1;
  else
    return v4;
}

- (id)getCurrentWakeTimeKey
{
  return CFSTR("CurrentMachWakeTime");
}

- (id)getThisWakeEntry:(id)a3 withCurrentWakeTime:(unint64_t)a4 withIsDarkwake:(BOOL)a5 withDidSleep:(BOOL)a6
{
  _BOOL4 v6;
  unsigned int v9;
  unsigned int v10;
  id v11;
  void *v12;
  PLEventForwardPowerStateEntry *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v6 = a6;
  if (a5)
    v9 = 5;
  else
    v9 = 0;
  if (a5)
    v10 = 6;
  else
    v10 = 2;
  v11 = a3;
  -[PLSleepWakeAgent getCurrentWakeTimeKey](self, "getCurrentWakeTimeKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [PLEventForwardPowerStateEntry alloc];
  -[PLSleepWakeAgent wakeReasons](self, "wakeReasons");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v15 = v9;
  else
    v15 = v10;
  if (v6)
    v16 = 0;
  else
    v16 = 5;
  v17 = -[PLEventForwardPowerStateEntry initEntryWithState:withEvent:withReason:withCurrentWakeTime:withCurrentWakeTimeKey:withDate:](v13, "initEntryWithState:withEvent:withReason:withCurrentWakeTime:withCurrentWakeTimeKey:withDate:", v15, v16, v14, a4, v12, v11);

  return v17;
}

- (id)getPostWakeEntry:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[PLOperator entryKeyForType:andName:](PLSleepWakeAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("CurrentMachWakeTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("CurrentMachWakeTime"));

  -[PLSleepWakeAgent wakeReasonsAsNSString](self, "wakeReasonsAsNSString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("WakeReasons"));

  return v6;
}

- (void)logWakeEntries:(id)a3 withCurrentTime:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  PLEventForwardPowerStateEntry *lastWakeEntry;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  unint64_t v47;
  void *context;
  _QWORD block[5];
  _QWORD v50[5];
  void *v51;
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  context = (void *)MEMORY[0x1D179C2E0]();
  v7 = -[PLSleepWakeAgent getCurrentWakeTime](self, "getCurrentWakeTime");
  v47 = a4;
  objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", a4);
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v7);
  objc_msgSend(v6, "dateByAddingTimeInterval:", -(v9 - v10));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSleepWakeAgent getCurrentWakeTimeKey](self, "getCurrentWakeTimeKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  lastWakeEntry = self->_lastWakeEntry;
  if (!lastWakeEntry)
    goto LABEL_11;
  -[PLEntry dictionary](lastWakeEntry, "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v12);
  v15 = v12;
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqual:", v17);

  v12 = v15;
  if (v18)
  {
    v19 = 0x1E0D7F000uLL;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v20 = objc_opt_class();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __51__PLSleepWakeAgent_logWakeEntries_withCurrentTime___block_invoke;
      v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v50[4] = v20;
      if (qword_1ED882E10 != -1)
        dispatch_once(&qword_1ED882E10, v50);
      if (byte_1ED882DB1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DidNotSleep"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lastPathComponent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent logWakeEntries:withCurrentTime:]");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v46, v23, v24, 736);

        PLLogCommon();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v53 = v46;
          _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v12 = v15;
        v19 = 0x1E0D7F000;
      }
    }
    -[PLSleepWakeAgent getThisWakeEntry:withCurrentWakeTime:withIsDarkwake:withDidSleep:](self, "getThisWakeEntry:withCurrentWakeTime:withIsDarkwake:withDidSleep:", v6, v7, 0, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    -[PLSleepWakeAgent getThisWakeEntry:withCurrentWakeTime:withIsDarkwake:withDidSleep:](self, "getThisWakeEntry:withCurrentWakeTime:withIsDarkwake:withDidSleep:", v11, v7, 0, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_lastWakeEntry, v26);
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
    {
      if ((int)objc_msgSend(MEMORY[0x1E0D80020], "kPLSoCClassOfDevice") <= 1001002)
      {
        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLSleepWakeAgent apSOCBasePower](self, "apSOCBasePower");
        objc_msgSend(v27, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 52, v11);

      }
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 8, &unk_1E864FE08, v11);

    }
    -[PLSleepWakeAgent getPostWakeEntry:](self, "getPostWakeEntry:", v7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator postEntries:](self, "postEntries:", v30);

    v19 = 0x1E0D7F000uLL;
  }
  if (objc_msgSend(*(id *)(v19 + 4000), "debugEnabled"))
  {
    v31 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PLSleepWakeAgent_logWakeEntries_withCurrentTime___block_invoke_160;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v31;
    if (qword_1ED882E18 != -1)
      dispatch_once(&qword_1ED882E18, block);
    if (byte_1ED882DB2)
    {
      v32 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "timeIntervalSince1970");
      v34 = v33;
      objc_msgSend(v11, "timeIntervalSince1970");
      v36 = v35;
      objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v7);
      v38 = v37;
      objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v47);
      objc_msgSend(v32, "stringWithFormat:", CFSTR("now=%f wakeDate=%f currentWakeTime=%f currentTime=%f lastWake=%@ thisWake=%@"), v34, v36, v38, v39, self->_lastWakeEntry, v26);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "lastPathComponent");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent logWakeEntries:withCurrentTime:]");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "logMessage:fromFile:fromFunction:fromLineNumber:", v40, v43, v44, 762);

      PLLogCommon();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v40;
        _os_log_debug_impl(&dword_1CAF47000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLOperator logEntry:](self, "logEntry:", v26);

  objc_autoreleasePoolPop(context);
}

uint64_t __51__PLSleepWakeAgent_logWakeEntries_withCurrentTime___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882DB1 = result;
  return result;
}

uint64_t __51__PLSleepWakeAgent_logWakeEntries_withCurrentTime___block_invoke_160(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882DB2 = result;
  return result;
}

- (id)wakeReasons
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  size_t v12;
  uint8_t buf[4];
  void *v14;
  _OWORD v15[16];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 256;
  memset(v15, 0, sizeof(v15));
  if (sysctlbyname("kern.wakereason", v15, &v12, 0, 0) < 0)
  {
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_11;
    v4 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__PLSleepWakeAgent_wakeReasons__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (qword_1ED882E20 != -1)
      dispatch_once(&qword_1ED882E20, block);
    if (!byte_1ED882DB3)
    {
LABEL_11:
      v3 = (void *)MEMORY[0x1E0C9AA60];
      return v3;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not get wake reason (errno: %d)"), *__error());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent wakeReasons]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v7, v8, 781);

    PLLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v2;
      _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "tokenizedByString:", CFSTR(" "));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

uint64_t __31__PLSleepWakeAgent_wakeReasons__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882DB3 = result;
  return result;
}

- (id)wakeReasonsAsNSString
{
  void *v2;
  NSObject *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD block[5];
  size_t v12;
  uint8_t buf[4];
  void *v14;
  _OWORD v15[16];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 256;
  memset(v15, 0, sizeof(v15));
  if (sysctlbyname("kern.wakereason", v15, &v12, 0, 0) < 0)
  {
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_11;
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__PLSleepWakeAgent_wakeReasonsAsNSString__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED882E28 != -1)
      dispatch_once(&qword_1ED882E28, block);
    if (!byte_1ED882DB4)
    {
LABEL_11:
      v4 = &stru_1E8587D00;
      return v4;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not get wake reason (errno: %d)"), *__error());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent wakeReasonsAsNSString]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v8, v9, 803);

    PLLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v2;
      _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    v4 = &stru_1E8587D00;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v3 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

uint64_t __41__PLSleepWakeAgent_wakeReasonsAsNSString__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882DB4 = result;
  return result;
}

- (unsigned)getIOPMRootDomain
{
  unsigned int result;

  result = getIOPMRootDomain_gRoot;
  if (!getIOPMRootDomain_gRoot)
  {
    result = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAB8], "IOPower:/IOPowerConnection/IOPMrootDomain");
    getIOPMRootDomain_gRoot = result;
  }
  return result;
}

- (unint64_t)getSleepSubclassKey
{
  io_registry_entry_t v2;
  unint64_t result;
  const __CFNumber *v4;
  CFIndex ByteSize;
  unint64_t v6;
  unsigned int valuePtr;

  v2 = -[PLSleepWakeAgent getIOPMRootDomain](self, "getIOPMRootDomain");
  result = (unint64_t)IORegistryEntryCreateCFProperty(v2, CFSTR("IOPMSystemSleepType"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  valuePtr = 0;
  v6 = 0;
  if (result)
  {
    v4 = (const __CFNumber *)result;
    ByteSize = CFNumberGetByteSize((CFNumberRef)result);
    if (ByteSize == 8)
    {
      CFNumberGetValue(v4, kCFNumberSInt64Type, &v6);
    }
    else if (ByteSize == 4)
    {
      if (CFNumberGetValue(v4, kCFNumberSInt32Type, &valuePtr))
        v6 = valuePtr;
    }
    CFRelease(v4);
    return v6;
  }
  return result;
}

- (id)sleepTriggers
{
  io_registry_entry_t v2;
  const __CFString *CFProperty;
  const __CFString *v4;
  int CString;
  __CFString *v6;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = -[PLSleepWakeAgent getIOPMRootDomain](self, "getIOPMRootDomain", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v2, CFSTR("Last Sleep Reason"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (CFProperty
    && (v4 = CFProperty, CString = CFStringGetCString(CFProperty, (char *)&v8, 128, 0x8000100u),
                         CFRelease(v4),
                         CString))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v8);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E8587D00;
  }
  return v6;
}

- (id)wakeType
{
  io_registry_entry_t v2;
  const __CFString *CFProperty;
  const __CFString *v4;
  int CString;
  void *v6;
  void *v7;
  void *v9;
  char buffer[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  *(_OWORD *)buffer = 0u;
  v11 = 0u;
  v2 = -[PLSleepWakeAgent getIOPMRootDomain](self, "getIOPMRootDomain");
  CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v2, CFSTR("Wake Type"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (!CFProperty)
    return MEMORY[0x1E0C9AA60];
  v4 = CFProperty;
  CString = CFStringGetCString(CFProperty, buffer, 128, 0x8000100u);
  CFRelease(v4);
  if (!CString)
    return MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)driverWakeReasons
{
  void *v3;
  io_registry_entry_t v4;
  const __CFArray *CFProperty;
  const __CFArray *v6;
  CFTypeID v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  char v11;
  const void *ValueAtIndex;
  CFTypeID v13;
  const __CFString *Value;
  CFTypeID v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD block[5];
  uint8_t buf[4];
  void *v28;
  char buffer[16];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  *(_OWORD *)buffer = 0u;
  v4 = -[PLSleepWakeAgent getIOPMRootDomain](self, "getIOPMRootDomain");
  CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty(v4, CFSTR("IOPMDriverWakeEvents"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (CFProperty)
  {
    v6 = CFProperty;
    v7 = CFGetTypeID(CFProperty);
    if (v7 == CFArrayGetTypeID() && (Count = CFArrayGetCount(v6), Count >= 1))
    {
      v9 = Count;
      v10 = 0;
      v11 = 0;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v6, v10);
        v13 = CFGetTypeID(ValueAtIndex);
        if (v13 == CFDictionaryGetTypeID())
        {
          Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("Reason"));
          v15 = CFGetTypeID(Value);
          if (v15 == CFStringGetTypeID())
          {
            if (!CFStringGetCString(Value, buffer, 128, 0x8000100u))
              goto LABEL_12;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v16);

            v11 = 1;
          }
        }
        ++v10;
      }
      while (v9 != v10);
      CFRelease(v6);
      if ((v11 & 1) != 0)
      {
        v17 = v3;
        goto LABEL_21;
      }
    }
    else
    {
LABEL_12:
      CFRelease(v6);
    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v18 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__PLSleepWakeAgent_driverWakeReasons__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v18;
    if (qword_1ED882E30 != -1)
      dispatch_once(&qword_1ED882E30, block);
    if (byte_1ED882DB5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error when get kIOPMDriverWakeEventsKey"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent driverWakeReasons]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 998);

      PLLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v19;
        _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v17 = (id)MEMORY[0x1E0C9AA60];
LABEL_21:

  return v17;
}

uint64_t __37__PLSleepWakeAgent_driverWakeReasons__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882DB5 = result;
  return result;
}

- (id)wakeReasonFromIORegistry
{
  io_registry_entry_t v2;
  const __CFString *CFProperty;
  const __CFString *v4;
  int CString;
  void *v6;
  void *v7;
  void *v9;
  char buffer[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  *(_OWORD *)buffer = 0u;
  v11 = 0u;
  v2 = -[PLSleepWakeAgent getIOPMRootDomain](self, "getIOPMRootDomain");
  CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v2, CFSTR("Wake Reason"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (!CFProperty)
    return MEMORY[0x1E0C9AA60];
  v4 = CFProperty;
  CString = CFStringGetCString(CFProperty, buffer, 128, 0x8000100u);
  CFRelease(v4);
  if (!CString)
    return MEMORY[0x1E0C9AA60];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)getLastSleepEntry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("Event"), &unk_1E86328B0, 0);
  objc_msgSend(v3, "addObject:", v4);
  -[PLOperator storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLEventForwardPowerStateEntry entryKey](PLEventForwardPowerStateEntry, "entryKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastEntryForKey:withComparisons:isSingleton:", v6, v3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)getLastWakeEntry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("Event"), &unk_1E8632868, 0);
  -[PLOperator storage](self, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLEventForwardPowerStateEntry entryKey](PLEventForwardPowerStateEntry, "entryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastEntryForKey:withComparisons:isSingleton:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)getSleepStatisticsApps
{
  id v3;
  io_registry_entry_t v4;
  void *CFProperty;
  id v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = -[PLSleepWakeAgent getIOPMRootDomain](self, "getIOPMRootDomain");
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v4, CFSTR("AppStatistics"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = CFProperty;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = CFSTR("ResponseType");
    v10 = CFSTR("ResponseTimedOut");
    v11 = *(_QWORD *)v30;
    v28 = *(_QWORD *)v30;
    do
    {
      v12 = 0;
      v27 = v8;
      do
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v12);
        objc_msgSend(v13, "objectForKeyedSubscript:", v9, v27);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14
          && ((objc_msgSend(v14, "isEqualToString:", v10) & 1) != 0
           || objc_msgSend(v15, "isEqualToString:", CFSTR("ResponseCancel"))))
        {
          v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v9);
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Name"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("AppName"));
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v18 = v10;
            v19 = v9;
            v20 = v6;
            v21 = v3;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("AppName"));

            v3 = v21;
            v6 = v20;
            v9 = v19;
            v10 = v18;
            v8 = v27;
          }

          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Pid"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v23)
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v23, "unsignedIntValue"));
          else
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, CFSTR("PID"));

          objc_msgSend(v3, "addObject:", v16);
          v11 = v28;
        }

        ++v12;
      }
      while (v8 != v12);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v8);
  }

  return v3;
}

- (void)logEventNonePowerNapConfig
{
  io_registry_entry_t v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  CFTypeID v6;
  void *v7;
  void *v8;
  const __CFDictionary *Value;
  const __CFDictionary *v10;
  CFTypeID v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  const __CFBoolean *v19;
  const __CFBoolean *v20;
  CFTypeID v21;
  void *v22;
  const __CFDictionary *v23;
  const __CFDictionary *v24;
  CFTypeID v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  const __CFBoolean *v33;
  const __CFBoolean *v34;
  CFTypeID v35;
  void *v36;
  _QWORD v37[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D80020], "isMac"))
  {
    v3 = -[PLSleepWakeAgent getIOPMRootDomain](self, "getIOPMRootDomain");
    v4 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(v3, "IOService", CFSTR("SystemPowerProfileOverrideDict"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1u);
    if (v4)
    {
      v5 = v4;
      v6 = CFGetTypeID(v4);
      if (v6 == CFDictionaryGetTypeID())
      {
        +[PLOperator entryKeyForType:andName:](PLSleepWakeAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("PowerNapConfig"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v7);
        Value = (const __CFDictionary *)CFDictionaryGetValue(v5, CFSTR("Battery Power"));
        if (Value)
        {
          v10 = Value;
          v11 = CFGetTypeID(Value);
          if (v11 == CFDictionaryGetTypeID())
          {
            if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
            {
              v12 = objc_opt_class();
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __46__PLSleepWakeAgent_logEventNonePowerNapConfig__block_invoke;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              block[4] = v12;
              if (qword_1ED882E38 != -1)
                dispatch_once(&qword_1ED882E38, block);
              if (byte_1ED882DB6)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Battery Power = %@\n"), v10);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "lastPathComponent");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent logEventNonePowerNapConfig]");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 1193);

                PLLogCommon();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v40 = v13;
                  _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

              }
            }
            v19 = (const __CFBoolean *)CFDictionaryGetValue(v10, CFSTR("DarkWakeBackgroundTasks"));
            if (v19)
            {
              v20 = v19;
              v21 = CFGetTypeID(v19);
              if (v21 == CFBooleanGetTypeID())
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", CFBooleanGetValue(v20) != 0);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("BatteryPower"));

              }
            }
          }
        }
        v23 = (const __CFDictionary *)CFDictionaryGetValue(v5, CFSTR("AC Power"));
        if (v23)
        {
          v24 = v23;
          v25 = CFGetTypeID(v23);
          if (v25 == CFDictionaryGetTypeID())
          {
            if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
            {
              v26 = objc_opt_class();
              v37[0] = MEMORY[0x1E0C809B0];
              v37[1] = 3221225472;
              v37[2] = __46__PLSleepWakeAgent_logEventNonePowerNapConfig__block_invoke_207;
              v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v37[4] = v26;
              if (qword_1ED882E40 != -1)
                dispatch_once(&qword_1ED882E40, v37);
              if (byte_1ED882DB7)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AC Power = %@\n"), v24);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "lastPathComponent");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent logEventNonePowerNapConfig]");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 1203);

                PLLogCommon();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v40 = v27;
                  _os_log_debug_impl(&dword_1CAF47000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

              }
            }
            v33 = (const __CFBoolean *)CFDictionaryGetValue(v24, CFSTR("DarkWakeBackgroundTasks"));
            if (v33)
            {
              v34 = v33;
              v35 = CFGetTypeID(v33);
              if (v35 == CFBooleanGetTypeID())
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", CFBooleanGetValue(v34) != 0);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v36, CFSTR("ACPower"));

              }
            }
          }
        }
        -[PLOperator logEntry:](self, "logEntry:", v8);

      }
      CFRelease(v5);
    }
  }
}

uint64_t __46__PLSleepWakeAgent_logEventNonePowerNapConfig__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882DB6 = result;
  return result;
}

uint64_t __46__PLSleepWakeAgent_logEventNonePowerNapConfig__block_invoke_207(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882DB7 = result;
  return result;
}

- (void)logEventPointCurrentScheduledWake
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[10];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PLOperator workQueue](self, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  block[5] = MEMORY[0x1E0C809B0];
  block[6] = 3221225472;
  block[7] = __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke;
  block[8] = &unk_1E857AAF8;
  block[9] = self;
  v5 = IOPMCopyCurrentScheduledWake();

  if ((_DWORD)v5 && objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke_243;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED882E68 != -1)
      dispatch_once(&qword_1ED882E68, block);
    if (byte_1ED882DBC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IOPMCopyCurrentScheduledWake Error: %x"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent logEventPointCurrentScheduledWake]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 1247);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
}

void __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke(uint64_t a1, void *a2)
{
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
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
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  if (a2)
  {
    if (v4)
    {
      v5 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v5;
      if (qword_1ED882E48 != -1)
        dispatch_once(&qword_1ED882E48, block);
      if (byte_1ED882DB8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IOPMCopyCurrentScheduledWake payload=%@"), a2);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent logEventPointCurrentScheduledWake]_block_invoke");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 1223);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v6;
          _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("returnCode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    if (!v13)
    {
      +[PLOperator entryKeyForType:andName:](PLSleepWakeAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("ScheduledWake"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v17);
      objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("wakeData"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
      {
        v30 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("time"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "doubleValue");
        objc_msgSend(v30, "dateWithTimeIntervalSinceReferenceDate:");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v32, CFSTR("EventTime"));

        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("eventtype"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v33, CFSTR("Type"));

        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("appPID"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v34, CFSTR("PID"));

        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("SleepWakeUUID"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v35, CFSTR("SleepWakeUUID"));

        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("wakeInfo"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v36, CFSTR("WakeInfo"));

        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("scheduledby"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v37, CFSTR("ProcessName"));

        objc_msgSend(*(id *)(a1 + 32), "logEntry:", v22);
      }
      else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v38 = objc_opt_class();
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke_224;
        v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v46[4] = v38;
        if (qword_1ED882E58 != -1)
          dispatch_once(&qword_1ED882E58, v46);
        if (byte_1ED882DBA)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IOPMCopyCurrentScheduledWake payload[kPLIOKitWakeData] is nil"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "lastPathComponent");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent logEventPointCurrentScheduledWake]_block_invoke_2");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v42, v43, 1231);

          PLLogCommon();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v50 = v39;
            _os_log_debug_impl(&dword_1CAF47000, v44, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }

      goto LABEL_33;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v14 = objc_opt_class();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke_216;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v14;
      if (qword_1ED882E50 != -1)
        dispatch_once(&qword_1ED882E50, v47);
      if (byte_1ED882DB9)
      {
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("returnCode"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("Current wake is not a RTC wake. Return code: %@"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent logEventPointCurrentScheduledWake]_block_invoke_2");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 1225);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v17;
LABEL_22:
          _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          goto LABEL_33;
        }
        goto LABEL_33;
      }
    }
  }
  else if (v4)
  {
    v23 = objc_opt_class();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke_239;
    v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v45[4] = v23;
    if (qword_1ED882E60 != -1)
      dispatch_once(&qword_1ED882E60, v45);
    if (byte_1ED882DBB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("IOPMCopyCurrentScheduledWake payload is nil"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSleepWakeAgent logEventPointCurrentScheduledWake]_block_invoke_2");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v26, v27, 1243);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v17;
        goto LABEL_22;
      }
LABEL_33:

    }
  }

}

uint64_t __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882DB8 = result;
  return result;
}

uint64_t __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke_216(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882DB9 = result;
  return result;
}

uint64_t __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke_224(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882DBA = result;
  return result;
}

uint64_t __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke_239(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882DBB = result;
  return result;
}

uint64_t __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke_243(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882DBC = result;
  return result;
}

- (unsigned)rootDomainConnect
{
  return self->_rootDomainConnect;
}

- (void)setRootDomainConnect:(unsigned int)a3
{
  self->_rootDomainConnect = a3;
}

- (unsigned)pmNotifier
{
  return self->_pmNotifier;
}

- (void)setPmNotifier:(unsigned int)a3
{
  self->_pmNotifier = a3;
}

- (IONotificationPort)systemPowerPortRef
{
  return self->_systemPowerPortRef;
}

- (void)setSystemPowerPortRef:(IONotificationPort *)a3
{
  self->_systemPowerPortRef = a3;
}

- (PLSemaphore)canSleepSemaphore
{
  return (PLSemaphore *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCanSleepSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (double)apSOCBasePower
{
  return self->_apSOCBasePower;
}

- (void)setApSOCBasePower:(double)a3
{
  self->_apSOCBasePower = a3;
}

- (PLXPCListenerOperatorComposition)wakeGestureXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWakeGestureXPCListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (__IOPMConnection)pmConnection
{
  return self->_pmConnection;
}

- (void)setPmConnection:(__IOPMConnection *)a3
{
  self->_pmConnection = a3;
}

- (PLEventForwardPowerStateEntry)lastSleepEntry
{
  return (PLEventForwardPowerStateEntry *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastSleepEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PLEventForwardPowerStateEntry)lastWakeEntry
{
  return (PLEventForwardPowerStateEntry *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLastWakeEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastWakeEntry, 0);
  objc_storeStrong((id *)&self->_lastSleepEntry, 0);
  objc_storeStrong((id *)&self->_wakeGestureXPCListener, 0);
  objc_storeStrong((id *)&self->_canSleepSemaphore, 0);
}

@end
