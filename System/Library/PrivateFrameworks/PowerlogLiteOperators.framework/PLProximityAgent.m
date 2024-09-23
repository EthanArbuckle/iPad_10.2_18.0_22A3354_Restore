@implementation PLProximityAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLProximityAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return &unk_1E864D7C8;
}

+ (id)entryEventPointDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("TimerState");
  +[PLProximityAgent entryEventPointDefinitionTimerState](PLProximityAgent, "entryEventPointDefinitionTimerState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v2;
  v8[1] = CFSTR("MaintainedDevices");
  +[PLProximityAgent entryEventPointDefinitionMaintainedDevices](PLProximityAgent, "entryEventPointDefinitionMaintainedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v8[2] = CFSTR("DeviceConnection");
  +[PLProximityAgent entryEventPointDefinitionDeviceConnection](PLProximityAgent, "entryEventPointDefinitionDeviceConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v4;
  v8[3] = CFSTR("RadioHeartbeat");
  +[PLProximityAgent entryEventPointDefinitionRadioHeartbeat](PLProximityAgent, "entryEventPointDefinitionRadioHeartbeat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventPointDefinitionTimerState
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
  _QWORD v12[3];
  _QWORD v13[3];
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = *MEMORY[0x1E0D80298];
  v14 = *MEMORY[0x1E0D80318];
  v15 = &unk_1E8653730;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E0D802F0];
  v12[0] = CFSTR("targetInterval");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("actualInterval");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("earlypct");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventPointDefinitionMaintainedDevices
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
  v13 = &unk_1E8653730;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("numDevices");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventPointDefinitionDeviceConnection
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
  _QWORD v12[3];
  _QWORD v13[3];
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = *MEMORY[0x1E0D80298];
  v14 = *MEMORY[0x1E0D80318];
  v15 = &unk_1E8653730;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E0D802F0];
  v12[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("firmwareVersion");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventPointDefinitionRadioHeartbeat
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1E8653730;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventForwardDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("State");
  +[PLProximityAgent entryEventForwardDefinitionRadioState](PLProximityAgent, "entryEventForwardDefinitionRadioState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("ClientState");
  v7[0] = v2;
  +[PLProximityAgent entryEventForwardDefinitionClientState](PLProximityAgent, "entryEventForwardDefinitionClientState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)entryEventForwardDefinitionRadioState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "isProximityLiteSupported"))
    return MEMORY[0x1E0C9AA70];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1E8653740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventForwardDefinitionClientState
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
  _QWORD v13[3];
  _QWORD v14[3];
  uint64_t v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "isProximitySupported") & 1) == 0
    && !objc_msgSend(a1, "isProximityLiteSupported"))
  {
    return MEMORY[0x1E0C9AA70];
  }
  v17[0] = *MEMORY[0x1E0D80298];
  v15 = *MEMORY[0x1E0D80318];
  v16 = &unk_1E8653750;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("EventID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("ClientName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_BoolFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventBackwardDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("PowerStatistics");
  +[PLProximityAgent entryEventBackwardDefinitionRadioPower](PLProximityAgent, "entryEventBackwardDefinitionRadioPower");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventBackwardDefinitionRadioPower
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
  _QWORD v31[12];
  _QWORD v32[12];
  uint64_t v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[4];

  v36[2] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "isProximitySupported") & 1) == 0
    && !objc_msgSend(a1, "isProximityLiteSupported"))
  {
    return MEMORY[0x1E0C9AA70];
  }
  v35[0] = *MEMORY[0x1E0D80298];
  v33 = *MEMORY[0x1E0D80318];
  v34 = &unk_1E8653750;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v30;
  v35[1] = *MEMORY[0x1E0D802F0];
  v31[0] = CFSTR("SleepDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v28;
  v31[1] = CFSTR("WakeDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v26;
  v31[2] = CFSTR("SingleAntennaSearchDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v24;
  v31[3] = CFSTR("DoubleAntennaSearchDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v22;
  v31[4] = CFSTR("SingleChainRxPacketDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[4] = v20;
  v31[5] = CFSTR("DoubleChainRxPacketDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[5] = v18;
  v31[6] = CFSTR("TripleChainRxPacketDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[6] = v16;
  v31[7] = CFSTR("DSPProcessingDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[7] = v14;
  v31[8] = CFSTR("TxDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32[8] = v4;
  v31[9] = CFSTR("ReceivedPacketsCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[9] = v6;
  v31[10] = CFSTR("TransmittedPacketsCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[10] = v8;
  v31[11] = CFSTR("DeepSleepDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32[11] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventIntervalDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("BinnedDeviceConnection");
  objc_msgSend(a1, "entryEventIntervalDefinitionBinnedDeviceConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventIntervalDefinitionBinnedDeviceConnection
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
  _QWORD v12[3];
  _QWORD v13[3];
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v16[0] = *MEMORY[0x1E0D80298];
  v14 = *MEMORY[0x1E0D80318];
  v15 = &unk_1E8653730;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E0D802F0];
  v12[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_DateFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("connects");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("disconnects");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (BOOL)isProximitySupported
{
  if (qword_1ED885278 != -1)
    dispatch_once(&qword_1ED885278, &__block_literal_global_45);
  return _MergedGlobals_1_57;
}

uint64_t __40__PLProximityAgent_isProximitySupported__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D80020], "kPLDeviceClassIsOneOf:", 102030, 102031, 102032, 102034, 102035, 102036, 102037, 102038, 102039, 102040, 102041, 102043, 102044, 102045, 102046, 102047, 102048,
             102049,
             102050,
             0);
  if ((_DWORD)result)
    _MergedGlobals_1_57 = 1;
  return result;
}

+ (BOOL)isProximityLiteSupported
{
  if (qword_1ED885280 != -1)
    dispatch_once(&qword_1ED885280, &__block_literal_global_87);
  return byte_1ED885261;
}

uint64_t __44__PLProximityAgent_isProximityLiteSupported__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D80020], "kPLSoCClassOfDevice");
  if ((int)result >= 1001205)
  {
    result = objc_msgSend(MEMORY[0x1E0D80020], "isWatch");
    if ((_DWORD)result)
      byte_1ED885261 = 1;
  }
  return result;
}

- (PLProximityAgent)init
{
  PLProximityAgent *v2;
  PLProximityAgent *v3;
  uint64_t v4;
  NSDate *lastSBCTimestamp;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLProximityAgent;
  v2 = -[PLAgent init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_numBTLines = 0;
    v2->_numConnects = 0;
    v2->_numDisconnects = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v4 = objc_claimAutoreleasedReturnValue();
    lastSBCTimestamp = v3->_lastSBCTimestamp;
    v3->_lastSBCTimestamp = (NSDate *)v4;

  }
  return v3;
}

- (void)initOperatorDependancies
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  PLEntryNotificationOperatorComposition *v8;
  PLEntryNotificationOperatorComposition *batteryLevelChanged;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  PLTimer *v15;
  PLTimer *runTimeAggregatorTimer;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];

  v3 = +[PLProximityAgent isProximityLiteSupported](PLProximityAgent, "isProximityLiteSupported");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke;
    v29[3] = &unk_1E8578610;
    v29[4] = self;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D7F0, v29);
    -[PLProximityAgent setRadioStateListener:](self, "setRadioStateListener:", v5);

  }
  if (+[PLProximityAgent isProximitySupported](PLProximityAgent, "isProximitySupported")
    || +[PLProximityAgent isProximityLiteSupported](PLProximityAgent, "isProximityLiteSupported"))
  {
    v28[0] = v4;
    v28[1] = 3221225472;
    v28[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_113;
    v28[3] = &unk_1E8578610;
    v28[4] = self;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D818, v28);
    -[PLProximityAgent setClientStateListener:](self, "setClientStateListener:", v6);

    v27[0] = v4;
    v27[1] = 3221225472;
    v27[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_120;
    v27[3] = &unk_1E8578610;
    v27[4] = self;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D840, v27);
    -[PLProximityAgent setRadioPowerListener:](self, "setRadioPowerListener:", v7);

  }
  v26[0] = v4;
  v26[1] = 3221225472;
  v26[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_125;
  v26[3] = &unk_1E8577F48;
  v26[4] = self;
  objc_msgSend(MEMORY[0x1E0D7FFC8], "significantBatteryChangeNotificationWithOperator:withBlock:", self, v26);
  v8 = (PLEntryNotificationOperatorComposition *)objc_claimAutoreleasedReturnValue();
  batteryLevelChanged = self->_batteryLevelChanged;
  self->_batteryLevelChanged = v8;

  -[PLOperator defaultDoubleForKey:](self, "defaultDoubleForKey:", CFSTR("RunTimeAggregatorTimerCadence"));
  v11 = v10;
  v12 = objc_alloc(MEMORY[0x1E0D80070]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator workQueue](self, "workQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v4;
  v25[1] = 3221225472;
  v25[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_128;
  v25[3] = &unk_1E8578078;
  v25[4] = self;
  v15 = (PLTimer *)objc_msgSend(v12, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v13, 1, 0, v14, v25, v11, 0.0);
  runTimeAggregatorTimer = self->_runTimeAggregatorTimer;
  self->_runTimeAggregatorTimer = v15;

  v24[0] = v4;
  v24[1] = 3221225472;
  v24[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_137;
  v24[3] = &unk_1E8578610;
  v24[4] = self;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D868, v24);
  -[PLProximityAgent setTimerStateListener:](self, "setTimerStateListener:", v17);

  v23[0] = v4;
  v23[1] = 3221225472;
  v23[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_146;
  v23[3] = &unk_1E8578610;
  v23[4] = self;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D890, v23);
  -[PLProximityAgent setMaintenanceListener:](self, "setMaintenanceListener:", v18);

  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_153;
  v22[3] = &unk_1E8578610;
  v22[4] = self;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D8B8, v22);
  -[PLProximityAgent setDeviceConnectionListener:](self, "setDeviceConnectionListener:", v19);

  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_169;
  v21[3] = &unk_1E8578610;
  v21[4] = self;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D8E0, v21);
  -[PLProximityAgent setRadioHeartbeatListener:](self, "setRadioHeartbeatListener:", v20);

}

void __44__PLProximityAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
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
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1ED885288 != -1)
      dispatch_once(&qword_1ED885288, block);
    if (byte_1ED885262)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLProximityAgent:: radio state with payload=%@ for %@"), v8, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProximityAgent initOperatorDependancies]_block_invoke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 320);

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
  objc_msgSend(*(id *)(a1 + 32), "logEventForwardRadioState:", v8);

}

uint64_t __44__PLProximityAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885262 = result;
  return result;
}

void __44__PLProximityAgent_initOperatorDependancies__block_invoke_113(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
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
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_114;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1ED885290 != -1)
      dispatch_once(&qword_1ED885290, block);
    if (byte_1ED885263)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLProximityAgent:: client state with payload=%@ for %@"), v8, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProximityAgent initOperatorDependancies]_block_invoke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 327);

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
  objc_msgSend(*(id *)(a1 + 32), "logEventForwardClientState:", v8);

}

uint64_t __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_114(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885263 = result;
  return result;
}

void __44__PLProximityAgent_initOperatorDependancies__block_invoke_120(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
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
  v7 = a3;
  v8 = a5;
  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardPowerStats:", v8);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_121;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1ED885298 != -1)
      dispatch_once(&qword_1ED885298, block);
    if (byte_1ED885264)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLProximityAgent:: Radio power stats with payload=%@ for %@"), v8, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProximityAgent initOperatorDependancies]_block_invoke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 335);

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

uint64_t __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_121(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885264 = result;
  return result;
}

void __44__PLProximityAgent_initOperatorDependancies__block_invoke_125(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "numConnects") || objc_msgSend(*(id *)(a1 + 32), "numDisconnects"))
  {
    if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled") & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "logEventIntervalBinnedDeviceConnection");
    }
    objc_msgSend(*(id *)(a1 + 32), "setNumConnects:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setNumDisconnects:", 0);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLastSBCTimestamp:", v2);

}

void __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_128(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t block;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = 0;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __44__PLProximityAgent_initOperatorDependancies__block_invoke_3;
    v12 = &__block_descriptor_40_e5_v8__0lu32l8;
    v13 = v2;
    if (qword_1ED8852A0 != -1)
      dispatch_once(&qword_1ED8852A0, &block);
    if (byte_1ED885265)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLProximityAgent:: Device connection credit refreshed %lu"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), block, v10, v11, v12, v13);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProximityAgent initOperatorDependancies]_block_invoke_2");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 358);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v3;
        _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
}

uint64_t __44__PLProximityAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885265 = result;
  return result;
}

void __44__PLProximityAgent_initOperatorDependancies__block_invoke_137(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
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
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_138;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1ED8852A8 != -1)
      dispatch_once(&qword_1ED8852A8, block);
    if (byte_1ED885266)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLProximityAgent:: Timer state with payload=%@ for %@"), v8, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProximityAgent initOperatorDependancies]_block_invoke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 363);

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
  objc_msgSend(*(id *)(a1 + 32), "logEventPointTimerState:", v8);

}

uint64_t __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_138(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885266 = result;
  return result;
}

void __44__PLProximityAgent_initOperatorDependancies__block_invoke_146(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
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
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_147;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1ED8852B0 != -1)
      dispatch_once(&qword_1ED8852B0, block);
    if (byte_1ED885267)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLProximityAgent:: Maintenance with payload=%@ for %@"), v8, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProximityAgent initOperatorDependancies]_block_invoke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 369);

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
  objc_msgSend(*(id *)(a1 + 32), "logEventPointMaintenance:", v8);

}

uint64_t __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_147(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885267 = result;
  return result;
}

void __44__PLProximityAgent_initOperatorDependancies__block_invoke_153(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  uint64_t v33;
  _QWORD block[5];
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v10 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_154;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED8852B8 != -1)
      dispatch_once(&qword_1ED8852B8, block);
    if (byte_1ED885268)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLProximityAgent:: Device connection with payload=%@ for %@"), v8, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProximityAgent initOperatorDependancies]_block_invoke");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 374);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v11;
        _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqual:", CFSTR("BtConnect"));

  v19 = *(void **)(a1 + 32);
  if (v18)
    objc_msgSend(v19, "setNumConnects:", objc_msgSend(v19, "numConnects") + 1);
  else
    objc_msgSend(v19, "setNumDisconnects:", objc_msgSend(v19, "numDisconnects") + 1);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v29 = v10;
    v30 = 3221225472;
    v31 = __44__PLProximityAgent_initOperatorDependancies__block_invoke_161;
    v32 = &__block_descriptor_40_e5_v8__0lu32l8;
    v33 = objc_opt_class();
    if (qword_1ED8852C0 != -1)
      dispatch_once(&qword_1ED8852C0, &v29);
    if (byte_1ED885269)
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = objc_msgSend(*(id *)(a1 + 32), "numConnects");
      v22 = objc_msgSend(*(id *)(a1 + 32), "numDisconnects");
      objc_msgSend(v20, "stringWithFormat:", CFSTR("PLProximityAgent:: Updated Connects %lu disconnects %lu"), v21, v22, v29, v30, v31, v32, v33);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProximityAgent initOperatorDependancies]_block_invoke_2");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 380);

      PLLogCommon();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v23;
        _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
    objc_msgSend(*(id *)(a1 + 32), "logEventPointDeviceConnection:", v8);

}

uint64_t __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_154(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885268 = result;
  return result;
}

uint64_t __44__PLProximityAgent_initOperatorDependancies__block_invoke_161(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885269 = result;
  return result;
}

void __44__PLProximityAgent_initOperatorDependancies__block_invoke_169(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(*(id *)(a1 + 32), "logEventPointRadioHeartbeat:", v8);
  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v7;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "PLProximityAgent:: Radio Heartbeat with payload=%@ for %@", (uint8_t *)&v10, 0x16u);
  }

}

- (void)logEventForwardRadioState:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLProximityAgent, "entryKeyForType:andName:", v4, CFSTR("State"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardClientState:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    +[PLOperator entryKeyForType:andName:](PLProximityAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ClientState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v5);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TicketID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v7, CFSTR("EventID"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ClientName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v8, CFSTR("ClientName"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("State"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, CFSTR("State"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Timestamp"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Timestamp"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 != v13)
      {
        v14 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
        v15 = MEMORY[0x1E0C809B0];
        if (v14)
        {
          v47[0] = MEMORY[0x1E0C809B0];
          v47[1] = 3221225472;
          v47[2] = __47__PLProximityAgent_logEventForwardClientState___block_invoke_176;
          v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v47[4] = objc_opt_class();
          if (qword_1ED8852D0 != -1)
            dispatch_once(&qword_1ED8852D0, v47);
          if (byte_1ED88526B)
          {
            v16 = (void *)MEMORY[0x1E0CB3940];
            -[NSObject entryDate](v6, "entryDate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "timeIntervalSince1970");
            objc_msgSend(v16, "stringWithFormat:", CFSTR("Previous TS: %f "), v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "lastPathComponent");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProximityAgent logEventForwardClientState:]");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 418);

            PLLogCommon();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v19;
              _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v15 = MEMORY[0x1E0C809B0];
          }
        }
        v25 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Timestamp"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "doubleValue");
        objc_msgSend(v25, "dateWithTimeIntervalSinceReferenceDate:");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v27, CFSTR("entryDate"));

        v28 = (void *)MEMORY[0x1E0CB37E8];
        -[NSObject entryDate](v6, "entryDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "timeIntervalSince1970");
        objc_msgSend(v28, "numberWithDouble:");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v30, CFSTR("timestamp"));

        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v46[0] = v15;
          v46[1] = 3221225472;
          v46[2] = __47__PLProximityAgent_logEventForwardClientState___block_invoke_186;
          v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v46[4] = objc_opt_class();
          if (qword_1ED8852D8 != -1)
            dispatch_once(&qword_1ED8852D8, v46);
          if (byte_1ED88526C)
          {
            v31 = (void *)MEMORY[0x1E0CB3940];
            -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("timestamp"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Timestamp"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "doubleValue");
            objc_msgSend(v31, "stringWithFormat:", CFSTR("Corrected TS :%@ with %f\n"), v32, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            v36 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "lastPathComponent");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProximityAgent logEventForwardClientState:]");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 421);

            PLLogCommon();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v35;
              _os_log_debug_impl(&dword_1CAF47000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
      }
    }
    -[PLOperator logEntry:](self, "logEntry:", v6);
LABEL_19:

    goto LABEL_26;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v41 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLProximityAgent_logEventForwardClientState___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v41;
    if (qword_1ED8852C8 != -1)
      dispatch_once(&qword_1ED8852C8, block);
    if (byte_1ED88526A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received nil payload for logEventForwardClientState"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "lastPathComponent");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProximityAgent logEventForwardClientState:]");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v44, v45, 408);

      PLLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_19;
    }
  }
LABEL_26:

}

uint64_t __47__PLProximityAgent_logEventForwardClientState___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88526A = result;
  return result;
}

uint64_t __47__PLProximityAgent_logEventForwardClientState___block_invoke_176(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88526B = result;
  return result;
}

uint64_t __47__PLProximityAgent_logEventForwardClientState___block_invoke_186(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88526C = result;
  return result;
}

- (void)logEventBackwardPowerStats:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLProximityAgent, "entryKeyForType:andName:", v4, CFSTR("PowerStatistics"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointTimerState:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLProximityAgent, "entryKeyForType:andName:", v4, CFSTR("TimerState"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventPointDeviceConnection:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  uint64_t v30;
  _QWORD v31[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLProximityAgent, "entryKeyForType:andName:", v4, CFSTR("DeviceConnection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v6, v5);

  v8 = self->_numBTLines + 1;
  self->_numBTLines = v8;
  if (v8 > 0x13)
  {
    if (v8 == 20)
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("RateLimit"), CFSTR("reason"));
      -[PLOperator logEntry:](self, "logEntry:", v7);
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v16 = objc_opt_class();
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __50__PLProximityAgent_logEventPointDeviceConnection___block_invoke_195;
        v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v31[4] = v16;
        if (qword_1ED8852E8 != -1)
          dispatch_once(&qword_1ED8852E8, v31);
        if (byte_1ED88526E)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ProxDevice:At credit in DeviceConnection %lu"), self->_numBTLines);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "lastPathComponent");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProximityAgent logEventPointDeviceConnection:]");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v19, v20, 448);

          PLLogCommon();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v10;
            goto LABEL_23;
          }
LABEL_20:

        }
      }
    }
    else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v21 = objc_opt_class();
      v26 = MEMORY[0x1E0C809B0];
      v27 = 3221225472;
      v28 = __50__PLProximityAgent_logEventPointDeviceConnection___block_invoke_200;
      v29 = &__block_descriptor_40_e5_v8__0lu32l8;
      v30 = v21;
      if (qword_1ED8852F0 != -1)
        dispatch_once(&qword_1ED8852F0, &v26);
      if (byte_1ED88526F)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ProxDevice:Exceeded credit in DeviceConnection %lu"), self->_numBTLines, v26, v27, v28, v29, v30);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lastPathComponent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProximityAgent logEventPointDeviceConnection:]");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v24, v25, 450);

        PLLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v10;
          goto LABEL_23;
        }
        goto LABEL_20;
      }
    }
  }
  else
  {
    -[PLOperator logEntry:](self, "logEntry:", v7);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v9 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__PLProximityAgent_logEventPointDeviceConnection___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v9;
      if (qword_1ED8852E0 != -1)
        dispatch_once(&qword_1ED8852E0, block);
      if (byte_1ED88526D)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ProxDevice: Below credit in DeviceConnection %lu"), self->_numBTLines);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProximityAgent logEventPointDeviceConnection:]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 444);

        PLLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v10;
LABEL_23:
          _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          goto LABEL_20;
        }
        goto LABEL_20;
      }
    }
  }

}

uint64_t __50__PLProximityAgent_logEventPointDeviceConnection___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88526D = result;
  return result;
}

uint64_t __50__PLProximityAgent_logEventPointDeviceConnection___block_invoke_195(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88526E = result;
  return result;
}

uint64_t __50__PLProximityAgent_logEventPointDeviceConnection___block_invoke_200(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88526F = result;
  return result;
}

- (void)logEventIntervalBinnedDeviceConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t block;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[PLOperator entryKeyForType:andName:](PLProximityAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("BinnedDeviceConnection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v3);
  objc_msgSend(v4, "entryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEntryDate:", self->_lastSBCTimestamp);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("timestampEnd"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numConnects);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("connects"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_numDisconnects);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("disconnects"));

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __58__PLProximityAgent_logEventIntervalBinnedDeviceConnection__block_invoke;
    v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    v19 = v8;
    if (qword_1ED8852F8 != -1)
      dispatch_once(&qword_1ED8852F8, &block);
    if (byte_1ED885270)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ProxDevice:Logging ts:%@ %lu %lu"), self->_lastSBCTimestamp, self->_numConnects, self->_numDisconnects, block, v16, v17, v18, v19);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProximityAgent logEventIntervalBinnedDeviceConnection]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 461);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v9;
        _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLOperator logEntry:](self, "logEntry:", v4);

}

uint64_t __58__PLProximityAgent_logEventIntervalBinnedDeviceConnection__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885270 = result;
  return result;
}

- (void)logEventPointMaintenance:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t block;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLProximityAgent, "entryKeyForType:andName:", v4, CFSTR("MaintainedDevices"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v6, v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("numDevices"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "intValue");
  if (v9 >= 20)
    v10 = 20;
  else
    v10 = v9;
  if ((v9 - 10) >= 0xA)
    v11 = v10;
  else
    v11 = 10;
  if ((v9 - 5) >= 5)
    v12 = v11;
  else
    v12 = 5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("numDevices"));

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v14 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __45__PLProximityAgent_logEventPointMaintenance___block_invoke;
    v24 = &__block_descriptor_40_e5_v8__0lu32l8;
    v25 = v14;
    if (qword_1ED885300 != -1)
      dispatch_once(&qword_1ED885300, &block);
    if (byte_1ED885271)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Number of devices %d"), v12, block, v22, v23, v24, v25);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProximityAgent logEventPointMaintenance:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 480);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v15;
        _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLOperator logEntry:](self, "logEntry:", v7);

}

uint64_t __45__PLProximityAgent_logEventPointMaintenance___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885271 = result;
  return result;
}

- (void)logEventPointRadioHeartbeat:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLProximityAgent, "entryKeyForType:andName:", v4, CFSTR("RadioHeartbeat"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (PLXPCListenerOperatorComposition)radioStateListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRadioStateListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLXPCListenerOperatorComposition)clientStateListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setClientStateListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLXPCListenerOperatorComposition)radioPowerListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRadioPowerListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLXPCListenerOperatorComposition)timerStateListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTimerStateListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLXPCListenerOperatorComposition)maintenanceListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMaintenanceListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLXPCListenerOperatorComposition)deviceConnectionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDeviceConnectionListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLXPCListenerOperatorComposition)radioHeartbeatListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRadioHeartbeatListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PLTimer)runTimeAggregatorTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRunTimeAggregatorTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (unint64_t)numBTLines
{
  return self->_numBTLines;
}

- (void)setNumBTLines:(unint64_t)a3
{
  self->_numBTLines = a3;
}

- (unint64_t)numConnects
{
  return self->_numConnects;
}

- (void)setNumConnects:(unint64_t)a3
{
  self->_numConnects = a3;
}

- (unint64_t)numDisconnects
{
  return self->_numDisconnects;
}

- (void)setNumDisconnects:(unint64_t)a3
{
  self->_numDisconnects = a3;
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSDate)lastSBCTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLastSBCTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSBCTimestamp, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
  objc_storeStrong((id *)&self->_runTimeAggregatorTimer, 0);
  objc_storeStrong((id *)&self->_radioHeartbeatListener, 0);
  objc_storeStrong((id *)&self->_deviceConnectionListener, 0);
  objc_storeStrong((id *)&self->_maintenanceListener, 0);
  objc_storeStrong((id *)&self->_timerStateListener, 0);
  objc_storeStrong((id *)&self->_radioPowerListener, 0);
  objc_storeStrong((id *)&self->_clientStateListener, 0);
  objc_storeStrong((id *)&self->_radioStateListener, 0);
}

@end
