@implementation PLWifiAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLWifiAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitionWifiInstantPower
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
  if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
    return MEMORY[0x1E0C9AA70];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1EA1DAA88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("WifiPower");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventPointDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("Wake");
  +[PLWifiAgent entryEventPointDefinitionWake](PLWifiAgent, "entryEventPointDefinitionWake");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v9[1] = CFSTR("AWDLServicesAndPorts");
  +[PLWifiAgent entryEventPointDefinitionAWDLServicesAndPorts](PLWifiAgent, "entryEventPointDefinitionAWDLServicesAndPorts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  v9[2] = CFSTR("Join");
  +[PLWifiAgent entryEventPointDefinitionJoin](PLWifiAgent, "entryEventPointDefinitionJoin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  v9[3] = CFSTR("RemoteControlSession");
  +[PLWifiAgent entryEventPointDefinitionRemoteControlSession](PLWifiAgent, "entryEventPointDefinitionRemoteControlSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  v9[4] = CFSTR("MetricMonitorInstantKeys");
  +[PLWifiAgent entryEventPointDefinitionWifiInstantPower](PLWifiAgent, "entryEventPointDefinitionWifiInstantPower");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)logEventPointMetricMonitorInstantKeys
{
  -[PLWifiAgent logEventBackwardWifiProperties:](self, "logEventBackwardWifiProperties:", 1);
}

+ (id)entryEventPointDefinitionWake
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
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
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[8];
  _QWORD v34[8];
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[3];
  _QWORD v38[5];

  v38[3] = *MEMORY[0x1E0C80C00];
  if (+[PLWifiAgent isNonUDMMac](PLWifiAgent, "isNonUDMMac"))
    return MEMORY[0x1E0C9AA70];
  v37[0] = *MEMORY[0x1E0D80298];
  v3 = *MEMORY[0x1E0D802A8];
  v35[0] = *MEMORY[0x1E0D80318];
  v35[1] = v3;
  v36[0] = &unk_1EA1DAA98;
  v36[1] = MEMORY[0x1E0C9AAB0];
  v4 = *MEMORY[0x1E0D80250];
  v35[2] = *MEMORY[0x1E0D80300];
  v35[3] = v4;
  v36[2] = MEMORY[0x1E0C9AAA0];
  v36[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v28;
  v37[1] = *MEMORY[0x1E0D802F0];
  v33[0] = CFSTR("WakeReason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_StringFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v26;
  v33[1] = CFSTR("WakeTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_RealFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v24;
  v33[2] = CFSTR("PID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v22;
  v33[3] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_StringFormat_withProcessName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v20;
  v33[4] = CFSTR("WakeLen");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v18;
  v33[5] = CFSTR("spi");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v16;
  v33[6] = CFSTR("seqNo");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[6] = v6;
  v33[7] = CFSTR("TCPKAWakeReason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[7] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v9;
  v37[2] = *MEMORY[0x1E0D802B0];
  v31[0] = CFSTR("value");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_StringFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = CFSTR("unit");
  v32[0] = v11;
  v12 = *MEMORY[0x1E0D80360];
  v29[0] = *MEMORY[0x1E0D80358];
  v29[1] = v12;
  v30[0] = &unk_1EA1C0908;
  v30[1] = CFSTR("s");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)entryEventPointDefinitionJoin
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
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[2];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  v33[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802A8];
  v31[0] = *MEMORY[0x1E0D80318];
  v31[1] = v2;
  v32[0] = &unk_1EA1DAAA8;
  v32[1] = MEMORY[0x1E0C9AAA0];
  v31[2] = *MEMORY[0x1E0D80300];
  v32[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v28;
  v33[1] = *MEMORY[0x1E0D802F0];
  v29[0] = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v26;
  v29[1] = CFSTR("Reason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v24;
  v29[2] = CFSTR("LPM_LPAS_POWER_BUDGET_REMAINING");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v22;
  v29[3] = CFSTR("LPM_POWER_CONSUMPTION_DUE_TO_FRTS");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v20;
  v29[4] = CFSTR("LPM_POWER_CONSUMPTION_DUE_TO_MAC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v18;
  v29[5] = CFSTR("LPM_POWER_CONSUMPTION_DUE_TO_RF");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v16;
  v29[6] = CFSTR("LPM_POWER_CONSUMPTION_DUE_TO_ROAM_SCAN");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v14;
  v29[7] = CFSTR("LPM_POWER_CONSUMPTION_DUE_TO_USER_SCAN");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v4;
  v29[8] = CFSTR("LPM_POWER_CONSUMPTION_IN_SELF_MANAGED_LPAS");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v6;
  v29[9] = CFSTR("LPM_TOTAL_LPAS_DURATION");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v8;
  v29[10] = CFSTR("LPM_TOTAL_LPAS_POWER_PERIOD_REMAINING");
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

+ (id)entryEventPointDefinitionRemoteControlSession
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
  v21 = &unk_1EA1DAA88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E0D802F0];
  v18[0] = CFSTR("Active");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_BoolFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v18[1] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_StringFormat_withBundleID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  v18[2] = CFSTR("ConnectionID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_StringFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v3;
  v18[3] = CFSTR("DeviceType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v5;
  v18[4] = CFSTR("Reason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v7;
  v18[5] = CFSTR("TransportType");
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

+ (id)entryEventPointDefinitionAWDLServicesAndPorts
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
  void *v20;
  void *v21;
  _QWORD v22[8];
  _QWORD v23[8];
  uint64_t v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[4];

  v27[2] = *MEMORY[0x1E0C80C00];
  v26[0] = *MEMORY[0x1E0D80298];
  v24 = *MEMORY[0x1E0D80318];
  v25 = &unk_1EA1DAA88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  v26[1] = *MEMORY[0x1E0D802F0];
  v22[0] = CFSTR("port_1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  v22[1] = CFSTR("port_2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  v22[2] = CFSTR("port_3");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v15;
  v22[3] = CFSTR("port_4");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v13;
  v22[4] = CFSTR("service_1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_StringFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v3;
  v22[5] = CFSTR("service_2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v5;
  v22[6] = CFSTR("service_3");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v7;
  v22[7] = CFSTR("service_4");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventForwardDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("AWDLState");
  +[PLWifiAgent entryEventForwardDefinitionAWDLState](PLWifiAgent, "entryEventForwardDefinitionAWDLState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v9[1] = CFSTR("HotspotState");
  +[PLWifiAgent entryEventForwardDefinitionHotspotState](PLWifiAgent, "entryEventForwardDefinitionHotspotState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  v9[2] = CFSTR("ModuleInfo");
  +[PLWifiAgent entryEventForwardDefinitionModuleInfo](PLWifiAgent, "entryEventForwardDefinitionModuleInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  v9[3] = CFSTR("WifiAssist");
  +[PLWifiAgent entryEventForwardDefinitionWifiAssist](PLWifiAgent, "entryEventForwardDefinitionWifiAssist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  v9[4] = CFSTR("RSSI");
  +[PLWifiAgent entryEventForwardDefinitionRSSI](PLWifiAgent, "entryEventForwardDefinitionRSSI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventForwardDefinitionModuleInfo
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
  void *v13;
  _QWORD v14[4];
  _QWORD v15[4];
  uint64_t v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (+[PLWifiAgent isNonUDMMac](PLWifiAgent, "isNonUDMMac"))
    return MEMORY[0x1E0C9AA70];
  v18[0] = *MEMORY[0x1E0D80298];
  v16 = *MEMORY[0x1E0D80318];
  v17 = &unk_1EA1DAA88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("ChipInfo");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v14[1] = CFSTR("ManufacturerId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  v14[2] = CFSTR("ModuleInfo");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v8;
  v14[3] = CFSTR("ProductId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardDefinitionRSSI
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v26[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v24[0] = *MEMORY[0x1E0D80318];
  v24[1] = v2;
  v25[0] = &unk_1EA1DAA88;
  v25[1] = MEMORY[0x1E0C9AAA0];
  v24[2] = *MEMORY[0x1E0D802B8];
  v3 = MEMORY[0x1E0C9AAB0];
  v25[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v4;
  v26[1] = *MEMORY[0x1E0D802F0];
  v22[0] = CFSTR("RSSI");
  v5 = *MEMORY[0x1E0D80358];
  v21[0] = &unk_1EA1C0920;
  v6 = *MEMORY[0x1E0D802D0];
  v20[0] = v5;
  v20[1] = v6;
  v18 = *MEMORY[0x1E0D802C8];
  v19 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = CFSTR("ScaledRSSI");
  v23[0] = v8;
  v16[1] = v6;
  v17[0] = &unk_1EA1C0920;
  v16[0] = v5;
  v14 = *MEMORY[0x1E0D802C0];
  v15 = &unk_1EA1DAAB8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardDefinitionWifiAssist
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
  v11 = &unk_1EA1DAA88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("WifiAssistFallback");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventForwardDefinitionHotspotState
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
  v14[0] = &unk_1EA1DAA88;
  v14[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("HotSpotOn");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("ADHS");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventForwardDefinitionAWDLState
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (+[PLWifiAgent isNonUDMMac](PLWifiAgent, "isNonUDMMac"))
    return MEMORY[0x1E0C9AA70];
  v15[0] = *MEMORY[0x1E0D80298];
  v3 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v3;
  v14[0] = &unk_1EA1DAAC8;
  v14[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("AWDLDown");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("AWDLRanging");
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventForwardDefinitionPowerState
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
  v11 = &unk_1EA1DAA88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("PowerOn");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventBackwardDefinitions
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
  _QWORD v12[8];
  _QWORD v13[9];

  v13[8] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("BeaconProfile");
  +[PLWifiAgent entryEventBackwardDefinitionBeaconProfile](PLWifiAgent, "entryEventBackwardDefinitionBeaconProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = CFSTR("CumulativeProperties");
  +[PLWifiAgent entryEventBackwardDefinitionCumulativeBasic](PLWifiAgent, "entryEventBackwardDefinitionCumulativeBasic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  v12[2] = CFSTR("DiffProperties");
  +[PLWifiAgent entryEventBackwardDefinitionDiffBasic](PLWifiAgent, "entryEventBackwardDefinitionDiffBasic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v4;
  v12[3] = CFSTR("CumulativeUserScanDurations");
  +[PLWifiAgent entryEventBackwardDefinitionUserScan](PLWifiAgent, "entryEventBackwardDefinitionUserScan");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v5;
  v12[4] = CFSTR("HotspotPowerStats");
  +[PLWifiAgent entryEventBackwardDefinitionHotspotPowerStats](PLWifiAgent, "entryEventBackwardDefinitionHotspotPowerStats");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v6;
  v12[5] = CFSTR("AutoJoin");
  +[PLWifiAgent entryEventBackwardDefinitionAutoJoin](PLWifiAgent, "entryEventBackwardDefinitionAutoJoin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v7;
  v12[6] = CFSTR("Scans");
  +[PLWifiAgent entryEventBackwardDefinitionScans](PLWifiAgent, "entryEventBackwardDefinitionScans");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v8;
  v12[7] = CFSTR("ScanForwardStats");
  +[PLWifiAgent entryEventBackwardDefinitionScanForwardStats](PLWifiAgent, "entryEventBackwardDefinitionScanForwardStats");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[7] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventBackwardDefinitionAutoJoin
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
  void *v46;
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
  _QWORD v71[32];
  _QWORD v72[32];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[4];

  v76[2] = *MEMORY[0x1E0C80C00];
  v75[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v73[0] = *MEMORY[0x1E0D80318];
  v73[1] = v2;
  v74[0] = &unk_1EA1DAAD8;
  v74[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 2);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v70;
  v75[1] = *MEMORY[0x1E0D802F0];
  v71[0] = CFSTR("AutoJoinAbortedCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "commonTypeDict_IntegerFormat");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v68;
  v71[1] = CFSTR("AutoJoinCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "commonTypeDict_IntegerFormat");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v66;
  v71[2] = CFSTR("AutoJoinDidFindCandidateCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "commonTypeDict_IntegerFormat");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v64;
  v71[3] = CFSTR("AutoJoinRetryCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "commonTypeDict_IntegerFormat");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v72[3] = v62;
  v71[4] = CFSTR("CombinedScanChannelCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "commonTypeDict_IntegerFormat");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v72[4] = v60;
  v71[5] = CFSTR("CombinedScanChannelCount2ghz");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v72[5] = v58;
  v71[6] = CFSTR("CombinedScanChannelCount5ghz");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "commonTypeDict_IntegerFormat");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v72[6] = v56;
  v71[7] = CFSTR("GasQueryCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "commonTypeDict_IntegerFormat");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v72[7] = v54;
  v71[8] = CFSTR("AutoHotspotCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v72[8] = v52;
  v71[9] = CFSTR("Unlocked");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v72[9] = v50;
  v71[10] = CFSTR("CountryCodeChanged");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "commonTypeDict_IntegerFormat");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v72[10] = v48;
  v71[11] = CFSTR("KnownNetworkAdded");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v72[11] = v46;
  v71[12] = CFSTR("LinkDown");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v72[12] = v44;
  v71[13] = CFSTR("AssocFailure");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v72[13] = v42;
  v71[14] = CFSTR("Retry");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v72[14] = v40;
  v71[15] = CFSTR("PowerOn");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v72[15] = v38;
  v71[16] = CFSTR("AjEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v72[16] = v36;
  v71[17] = CFSTR("Manual");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v72[17] = v34;
  v71[18] = CFSTR("DarkWake");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v72[18] = v32;
  v71[19] = CFSTR("UserWake");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v72[19] = v30;
  v71[20] = CFSTR("CallEnded");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v72[20] = v28;
  v71[21] = CFSTR("PlaybackEnded");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v72[21] = v26;
  v71[22] = CFSTR("DeviceUnlocked");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v72[22] = v24;
  v71[23] = CFSTR("Registration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v72[23] = v22;
  v71[24] = CFSTR("AppState");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v72[24] = v20;
  v71[25] = CFSTR("MaintWake");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v72[25] = v18;
  v71[26] = CFSTR("NetServiceInactive");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v72[26] = v16;
  v71[27] = CFSTR("BssidChanged");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v72[27] = v14;
  v71[28] = CFSTR("Retry(fg)");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v72[28] = v4;
  v71[29] = CFSTR("Retry(inactive)");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v72[29] = v6;
  v71[30] = CFSTR("CombinedScanChannelCount6ghz");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v72[30] = v8;
  v71[31] = CFSTR("Followup6ghzScanChannelCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v72[31] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)isScanLoggingEnabled
{
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004015) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004016) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017);
  }
}

+ (id)entryEventBackwardDefinitionScans
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
  if (!objc_msgSend(a1, "isScanLoggingEnabled"))
    return MEMORY[0x1E0C9AA70];
  v33[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v31[0] = *MEMORY[0x1E0D80318];
  v31[1] = v2;
  v32[0] = &unk_1EA1DAA88;
  v32[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v28;
  v33[1] = *MEMORY[0x1E0D802F0];
  v29[0] = CFSTR("Duration2G");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat_withUnit_ms");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v26;
  v29[1] = CFSTR("Duration5G");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat_withUnit_ms");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v24;
  v29[2] = CFSTR("Duration6G");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat_withUnit_ms");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v22;
  v29[3] = CFSTR("Count2G");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v20;
  v29[4] = CFSTR("Count5G");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v18;
  v29[5] = CFSTR("Count6G");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v16;
  v29[6] = CFSTR("CountActive");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v14;
  v29[7] = CFSTR("CountPassive");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v4;
  v29[8] = CFSTR("Count2GSC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v6;
  v29[9] = CFSTR("Count5GSC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v8;
  v29[10] = CFSTR("Count6GSC");
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

+ (BOOL)isScanForwardLoggingEnabled
{
  return objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017);
}

+ (id)entryEventBackwardDefinitionScanForwardStats
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
  if (!objc_msgSend(a1, "isScanForwardLoggingEnabled"))
    return MEMORY[0x1E0C9AA70];
  v16[0] = *MEMORY[0x1E0D80298];
  v14 = *MEMORY[0x1E0D80318];
  v15 = &unk_1EA1DAA88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E0D802F0];
  v12[0] = CFSTR("ScanForwardCurrentBSSS");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat_withUnit_ms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("ScanForwardForwardedBSSS");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat_withUnit_ms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("ScanForwardTotalSPMIMSGS");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat_withUnit_ms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventBackwardDefinitionHotspotPowerStats
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
  _QWORD v27[10];
  _QWORD v28[10];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[4];

  v32[2] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004010) & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004013) & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004014) & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004015) & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004016) & 1) == 0
    && !objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017))
  {
    return MEMORY[0x1E0C9AA70];
  }
  v31[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v29[0] = *MEMORY[0x1E0D80318];
  v29[1] = v2;
  v30[0] = &unk_1EA1DAA88;
  v30[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v26;
  v31[1] = *MEMORY[0x1E0D802F0];
  v27[0] = CFSTR("ADHSActiveStateCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v24;
  v27[1] = CFSTR("ADHSDynamicStateCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v22;
  v27[2] = CFSTR("ADHSLowPowerStateCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v20;
  v27[3] = CFSTR("ADHSOffStateCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v18;
  v27[4] = CFSTR("ADHSTXPackets");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v16;
  v27[5] = CFSTR("ADHSRXPackets");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v14;
  v27[6] = CFSTR("ADHSActiveStateDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat_withUnit_ms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[6] = v4;
  v27[7] = CFSTR("ADHSDynamicStateDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat_withUnit_ms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[7] = v6;
  v27[8] = CFSTR("ADHSLowPowerStateDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat_withUnit_ms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[8] = v8;
  v27[9] = CFSTR("ADHSOffStateDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat_withUnit_ms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)isBeaconLoggingEnabled
{
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004010) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004013) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004014) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004011) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004012) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004015) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004016) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017);
  }
}

+ (id)entryEventBackwardDefinitionBeaconProfile
{
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
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[4];

  v23[2] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isMac") & 1) != 0
    || !objc_msgSend(a1, "isBeaconLoggingEnabled"))
  {
    return MEMORY[0x1E0C9AA70];
  }
  v22[0] = *MEMORY[0x1E0D80298];
  v3 = *MEMORY[0x1E0D80300];
  v20[0] = *MEMORY[0x1E0D80318];
  v20[1] = v3;
  v21[0] = &unk_1EA1DAA88;
  v21[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E0D802F0];
  v18[0] = CFSTR("ScheduleBeacon");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v18[1] = CFSTR("MissedBeacon");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v5;
  v18[2] = CFSTR("ReceivedBeacon");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v7;
  v18[3] = CFSTR("TrimmedBeacon");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v9;
  v18[4] = CFSTR("WifiTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryEventBackwardDefinitionUserScan
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
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1EA1DAA88;
  v20[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("AutojoinScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat_withUnit_ms");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("LocationScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat_withUnit_ms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("PipelineScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat_withUnit_ms");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("SetupScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat_withUnit_ms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("UnknownScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat_withUnit_ms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionCumulativeMultiCore
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  void *v46;
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
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
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
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  id v188;
  void *v189;
  uint64_t v190;
  void *v191;
  _QWORD v192[2];
  _QWORD v193[2];
  uint64_t v194;
  void *v195;
  _QWORD v196[2];
  _QWORD v197[2];
  _QWORD v198[33];
  _QWORD v199[33];
  _QWORD v200[57];
  _QWORD v201[59];

  v201[57] = *MEMORY[0x1E0C80C00];
  v188 = objc_alloc(MEMORY[0x1E0C99E08]);
  v200[0] = CFSTR("WifiTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "commonTypeDict_IntegerFormat_withUnit_s");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  v201[0] = v184;
  v200[1] = CFSTR("PMDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v182, "commonTypeDict_IntegerFormat_withUnit_s");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v201[1] = v180;
  v200[2] = CFSTR("MPCDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v178, "commonTypeDict_IntegerFormat_withUnit_s");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  v201[2] = v176;
  v200[3] = CFSTR("TXDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v174, "commonTypeDict_IntegerFormat_withUnit_ms");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v201[3] = v172;
  v200[4] = CFSTR("RXDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v170, "commonTypeDict_IntegerFormat_withUnit_ms");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v201[4] = v168;
  v200[5] = CFSTR("HSICSuspendDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v166, "commonTypeDict_IntegerFormat_withUnit_s");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v201[5] = v164;
  v200[6] = CFSTR("HSICActiveDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v162, "commonTypeDict_IntegerFormat_withUnit_s");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v201[6] = v160;
  v200[7] = CFSTR("PNOScanSSIDDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v201[7] = v156;
  v200[8] = CFSTR("PNOBSSIDDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_s");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v201[8] = v152;
  v200[9] = CFSTR("RoamScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v201[9] = v148;
  v200[10] = CFSTR("AssociatedScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v201[10] = v144;
  v200[11] = CFSTR("OtherScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_s");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v201[11] = v140;
  v200[12] = CFSTR("UserScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_s");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v201[12] = v136;
  v200[13] = CFSTR("FRTSDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_ms");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v201[13] = v132;
  v200[14] = CFSTR("PCIESuspendDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_us");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v201[14] = v128;
  v200[15] = CFSTR("PCIEActiveDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_us");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v201[15] = v124;
  v200[16] = CFSTR("PCIEPERSTDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_us");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v201[16] = v120;
  v200[17] = CFSTR("PCIEL0Count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "commonTypeDict_IntegerFormat");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v201[17] = v116;
  v200[18] = CFSTR("PCIEL0Duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "commonTypeDict_IntegerFormat_withUnit_us");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v201[18] = v112;
  v200[19] = CFSTR("PCIEL2Count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "commonTypeDict_IntegerFormat");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v201[19] = v108;
  v200[20] = CFSTR("PCIEL2Duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "commonTypeDict_IntegerFormat_withUnit_us");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v201[20] = v104;
  v200[21] = CFSTR("PCIEL1Count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "commonTypeDict_IntegerFormat");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v201[21] = v100;
  v200[22] = CFSTR("PCIEL1Duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "commonTypeDict_IntegerFormat_withUnit_us");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v201[22] = v96;
  v200[23] = CFSTR("PCIEL11Count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "commonTypeDict_IntegerFormat");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v201[23] = v92;
  v200[24] = CFSTR("PCIEL11Duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "commonTypeDict_IntegerFormat_withUnit_us");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v201[24] = v88;
  v200[25] = CFSTR("PCIEL12Count");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "commonTypeDict_IntegerFormat");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v201[25] = v84;
  v200[26] = CFSTR("PCIEL12Duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "commonTypeDict_IntegerFormat_withUnit_us");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v201[26] = v80;
  v200[27] = CFSTR("AWDLTXDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "commonTypeDict_IntegerFormat_withUnit_ms");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v201[27] = v76;
  v200[28] = CFSTR("AWDLRXDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "commonTypeDict_IntegerFormat_withUnit_ms");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v201[28] = v72;
  v200[29] = CFSTR("AWDLAWDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "commonTypeDict_IntegerFormat_withUnit_s");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v201[29] = v70;
  v200[30] = CFSTR("AWDLScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "commonTypeDict_IntegerFormat_withUnit_s");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v201[30] = v68;
  v200[31] = CFSTR("AutojoinScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "commonTypeDict_IntegerFormat_withUnit_ms");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v201[31] = v66;
  v200[32] = CFSTR("LocationScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "commonTypeDict_IntegerFormat_withUnit_ms");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v201[32] = v64;
  v200[33] = CFSTR("PipelineScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "commonTypeDict_IntegerFormat_withUnit_ms");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v201[33] = v62;
  v200[34] = CFSTR("SetupScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "commonTypeDict_IntegerFormat_withUnit_ms");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v201[34] = v60;
  v200[35] = CFSTR("UnknownScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "commonTypeDict_IntegerFormat_withUnit_ms");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v201[35] = v58;
  v200[36] = CFSTR("CurrentChannel");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "commonTypeDict_IntegerFormat");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v201[36] = v56;
  v200[37] = CFSTR("CurrentSSID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "commonTypeDict_StringFormat");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v201[37] = v54;
  v200[38] = CFSTR("CurrentBandwidth");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v201[38] = v52;
  v200[39] = CFSTR("WifiPowered");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "commonTypeDict_BoolFormat");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v201[39] = v50;
  v200[40] = CFSTR("WowEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "commonTypeDict_BoolFormat");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v201[40] = v48;
  v200[41] = CFSTR("Carplay");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "commonTypeDict_BoolFormat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v201[41] = v46;
  v200[42] = CFSTR("SISOTXDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "commonTypeDict_IntegerFormat_withUnit_ms");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v201[42] = v44;
  v200[43] = CFSTR("MIMOTXDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commonTypeDict_IntegerFormat_withUnit_ms");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v201[43] = v42;
  v200[44] = CFSTR("MIMORXDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_IntegerFormat_withUnit_ms");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v201[44] = v40;
  v200[45] = CFSTR("SISORXDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "commonTypeDict_IntegerFormat_withUnit_ms");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v201[45] = v38;
  v200[46] = CFSTR("MIMOCSDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "commonTypeDict_IntegerFormat_withUnit_ms");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v201[46] = v36;
  v200[47] = CFSTR("SISOCSDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_IntegerFormat_withUnit_ms");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v201[47] = v34;
  v200[48] = CFSTR("OCLRXDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_IntegerFormat_withUnit_ms");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v201[48] = v32;
  v200[49] = CFSTR("OCLCSDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_IntegerFormat_withUnit_ms");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v201[49] = v30;
  v200[50] = CFSTR("READINGTYPE");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v201[50] = v28;
  v200[51] = CFSTR("isADHSConnected");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v201[51] = v26;
  v200[52] = CFSTR("AutoHotspotBTScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat_withUnit_s");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v201[52] = v24;
  v200[53] = CFSTR("AutoHotspotBTScanCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v201[53] = v3;
  v200[54] = CFSTR("OPSFullDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat_withUnit_ms");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v201[54] = v5;
  v200[55] = CFSTR("OPSPartialDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat_withUnit_ms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v201[55] = v7;
  v200[56] = CFSTR("PSBWDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat_withUnit_ms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v201[56] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v201, v200, 57);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = (void *)objc_msgSend(v188, "initWithDictionary:", v10);

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004015) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004016) & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017))
  {
    v198[0] = CFSTR("SCAssocScanCount");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "commonTypeDict_IntegerFormat");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    v199[0] = v185;
    v198[1] = CFSTR("SCAssocScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "commonTypeDict_IntegerFormat");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v199[1] = v181;
    v198[2] = CFSTR("SCBlankedScanCount");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v179, "commonTypeDict_IntegerFormat");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v199[2] = v177;
    v198[3] = CFSTR("SCIdleDurationSISO");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v175 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v175, "commonTypeDict_IntegerFormat");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v199[3] = v173;
    v198[4] = CFSTR("SCPMDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v171, "commonTypeDict_IntegerFormat");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v199[4] = v169;
    v198[5] = CFSTR("SCPNOScanCount");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "commonTypeDict_IntegerFormat");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v199[5] = v165;
    v198[6] = CFSTR("SCPNOScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v163, "commonTypeDict_IntegerFormat");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v199[6] = v161;
    v198[7] = CFSTR("SCRoamScanCount");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "commonTypeDict_IntegerFormat");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v199[7] = v157;
    v198[8] = CFSTR("SCRoamScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "commonTypeDict_IntegerFormat");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v199[8] = v153;
    v198[9] = CFSTR("SCRXDurationSISO");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "commonTypeDict_IntegerFormat");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v199[9] = v149;
    v198[10] = CFSTR("SCRXMPCDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "commonTypeDict_IntegerFormat");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v199[10] = v145;
    v198[11] = CFSTR("SCTimestamp");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "commonTypeDict_IntegerFormat");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v199[11] = v141;
    v198[12] = CFSTR("SCUserScanCount");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "commonTypeDict_IntegerFormat");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v199[12] = v137;
    v198[13] = CFSTR("SCUserScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "commonTypeDict_IntegerFormat");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v199[13] = v133;
    v198[14] = CFSTR("InactivityDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "commonTypeDict_IntegerFormat");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v199[14] = v129;
    v198[15] = CFSTR("InactivityLPBeaconsMissed");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "commonTypeDict_IntegerFormat");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v199[15] = v125;
    v198[16] = CFSTR("InactivityLPBeaconsReceived");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "commonTypeDict_IntegerFormat");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v199[16] = v121;
    v198[17] = CFSTR("InactivityLPBeaconsScheduled");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "commonTypeDict_IntegerFormat");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v199[17] = v117;
    v198[18] = CFSTR("InactivityLPEarlyBeaconsTerminated");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "commonTypeDict_IntegerFormat");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v199[18] = v113;
    v198[19] = CFSTR("InactivityLPWakeDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "commonTypeDict_IntegerFormat");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v199[19] = v109;
    v198[20] = CFSTR("InactivityMPCBeaconsMissed");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "commonTypeDict_IntegerFormat");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v199[20] = v105;
    v198[21] = CFSTR("InactivityMPCBeaconsReceived");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "commonTypeDict_IntegerFormat");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v199[21] = v101;
    v198[22] = CFSTR("InactivityMPCBeaconsScheduled");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "commonTypeDict_IntegerFormat");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v199[22] = v97;
    v198[23] = CFSTR("InactivityMPEarlyBeaconsTerminated");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "commonTypeDict_IntegerFormat");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v199[23] = v93;
    v198[24] = CFSTR("InactivityMPWakeDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "commonTypeDict_IntegerFormat");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v199[24] = v89;
    v198[25] = CFSTR("MulticastRXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "commonTypeDict_IntegerFormat_withUnit_ms");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v199[25] = v85;
    v198[26] = CFSTR("BroadcastRXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "commonTypeDict_IntegerFormat_withUnit_ms");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v199[26] = v81;
    v198[27] = CFSTR("IBSSRXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "commonTypeDict_IntegerFormat_withUnit_ms");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v199[27] = v77;
    v198[28] = CFSTR("MBSSRXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "commonTypeDict_IntegerFormat_withUnit_ms");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v199[28] = v73;
    v198[29] = CFSTR("OBSSRXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "commonTypeDict_IntegerFormat_withUnit_ms");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v199[29] = v12;
    v198[30] = CFSTR("MulticastRxBytes");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "commonTypeDict_IntegerFormat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v199[30] = v14;
    v198[31] = CFSTR("MulticastRxPkts");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v199[31] = v16;
    v198[32] = CFSTR("MulticastRxTotal");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v199[32] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v199, v198, 33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v189;
    objc_msgSend(v189, "addEntriesFromDictionary:", v19);
    v196[0] = *MEMORY[0x1E0D80298];
    v194 = *MEMORY[0x1E0D80318];
    v195 = &unk_1EA1DAAE8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v195, &v194, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v196[1] = *MEMORY[0x1E0D802F0];
    v197[0] = v21;
    v197[1] = v189;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v197, v196, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004013) & 1) == 0
      && !objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004014))
    {
      v22 = (void *)MEMORY[0x1E0C9AA70];
      v20 = v189;
      goto LABEL_6;
    }
    v192[0] = *MEMORY[0x1E0D80298];
    v190 = *MEMORY[0x1E0D80318];
    v191 = &unk_1EA1DAA98;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v191, &v190, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v192[1] = *MEMORY[0x1E0D802F0];
    v193[0] = v19;
    v20 = v189;
    v193[1] = v189;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v193, v192, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  return v22;
}

+ (id)entryEventBackwardDefinitionCumulativeBasicMac
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventBackwardDefinitionCumulativeBasic
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v46;
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
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
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
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  _QWORD v164[43];
  _QWORD v165[43];
  uint64_t v166;
  void *v167;
  _QWORD v168[2];
  _QWORD v169[2];
  _QWORD v170[52];
  _QWORD v171[52];
  uint64_t v172;
  void *v173;
  _QWORD v174[2];
  _QWORD v175[2];
  _QWORD v176[46];
  _QWORD v177[46];
  uint64_t v178;
  void *v179;
  _QWORD v180[2];
  _QWORD v181[2];
  _QWORD v182[49];
  _QWORD v183[49];
  uint64_t v184;
  void *v185;
  _QWORD v186[2];
  _QWORD v187[2];
  _QWORD v188[51];
  _QWORD v189[51];
  uint64_t v190;
  void *v191;
  _QWORD v192[2];
  _QWORD v193[2];
  _QWORD v194[56];
  _QWORD v195[56];
  uint64_t v196;
  void *v197;
  _QWORD v198[2];
  _QWORD v199[4];

  v199[2] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004013) & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004014) & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004015) & 1) == 0
    && (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004016) & 1) == 0
    && !objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017))
  {
    if (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004010))
    {
      v198[0] = *MEMORY[0x1E0D80298];
      v196 = *MEMORY[0x1E0D80318];
      v197 = &unk_1EA1DAA98;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v197, &v196, 1);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      v199[0] = v163;
      v198[1] = *MEMORY[0x1E0D802F0];
      v194[0] = CFSTR("WifiTimestamp");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "commonTypeDict_IntegerFormat_withUnit_s");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      v195[0] = v161;
      v194[1] = CFSTR("PMDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_s");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      v195[1] = v159;
      v194[2] = CFSTR("MPCDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v195[2] = v157;
      v194[3] = CFSTR("TXDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_ms");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      v195[3] = v155;
      v194[4] = CFSTR("RXDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_ms");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v195[4] = v153;
      v194[5] = CFSTR("HSICSuspendDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      v195[5] = v151;
      v194[6] = CFSTR("HSICActiveDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v195[6] = v149;
      v194[7] = CFSTR("PNOScanSSIDDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v195[7] = v147;
      v194[8] = CFSTR("PNOBSSIDDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v195[8] = v145;
      v194[9] = CFSTR("RoamScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v195[9] = v143;
      v194[10] = CFSTR("AssociatedScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_s");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v195[10] = v141;
      v194[11] = CFSTR("OtherScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_s");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v195[11] = v139;
      v194[12] = CFSTR("UserScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_s");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      v195[12] = v137;
      v194[13] = CFSTR("FRTSDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_ms");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      v195[13] = v135;
      v194[14] = CFSTR("PCIESuspendDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_us");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v195[14] = v133;
      v194[15] = CFSTR("PCIEActiveDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_us");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v195[15] = v131;
      v194[16] = CFSTR("PCIEPERSTDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_us");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v195[16] = v129;
      v194[17] = CFSTR("PCIEL0Count");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "commonTypeDict_IntegerFormat");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v195[17] = v127;
      v194[18] = CFSTR("PCIEL0Duration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_us");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v195[18] = v125;
      v194[19] = CFSTR("PCIEL2Count");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "commonTypeDict_IntegerFormat");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v195[19] = v123;
      v194[20] = CFSTR("PCIEL2Duration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_us");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v195[20] = v121;
      v194[21] = CFSTR("PCIEL1Count");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "commonTypeDict_IntegerFormat");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v195[21] = v119;
      v194[22] = CFSTR("PCIEL1Duration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_us");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v195[22] = v117;
      v194[23] = CFSTR("PCIEL11Count");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "commonTypeDict_IntegerFormat");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v195[23] = v115;
      v194[24] = CFSTR("PCIEL11Duration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "commonTypeDict_IntegerFormat_withUnit_us");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v195[24] = v113;
      v194[25] = CFSTR("PCIEL12Count");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "commonTypeDict_IntegerFormat");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v195[25] = v111;
      v194[26] = CFSTR("PCIEL12Duration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "commonTypeDict_IntegerFormat_withUnit_us");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v195[26] = v109;
      v194[27] = CFSTR("AWDLTXDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "commonTypeDict_IntegerFormat_withUnit_ms");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v195[27] = v107;
      v194[28] = CFSTR("AWDLRXDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "commonTypeDict_IntegerFormat_withUnit_ms");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v195[28] = v105;
      v194[29] = CFSTR("AWDLAWDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "commonTypeDict_IntegerFormat_withUnit_s");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v195[29] = v103;
      v194[30] = CFSTR("AWDLScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "commonTypeDict_IntegerFormat_withUnit_s");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v195[30] = v101;
      v194[31] = CFSTR("AutojoinScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "commonTypeDict_IntegerFormat_withUnit_ms");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v195[31] = v99;
      v194[32] = CFSTR("LocationScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "commonTypeDict_IntegerFormat_withUnit_ms");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v195[32] = v97;
      v194[33] = CFSTR("PipelineScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "commonTypeDict_IntegerFormat_withUnit_ms");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v195[33] = v95;
      v194[34] = CFSTR("SetupScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "commonTypeDict_IntegerFormat_withUnit_ms");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v195[34] = v93;
      v194[35] = CFSTR("UnknownScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "commonTypeDict_IntegerFormat_withUnit_ms");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v195[35] = v91;
      v194[36] = CFSTR("CurrentChannel");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "commonTypeDict_IntegerFormat");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v195[36] = v89;
      v194[37] = CFSTR("CurrentSSID");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "commonTypeDict_StringFormat");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v195[37] = v87;
      v194[38] = CFSTR("CurrentBandwidth");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "commonTypeDict_IntegerFormat");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v195[38] = v85;
      v194[39] = CFSTR("WifiPowered");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "commonTypeDict_BoolFormat");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v195[39] = v83;
      v194[40] = CFSTR("WowEnabled");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "commonTypeDict_BoolFormat");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v195[40] = v81;
      v194[41] = CFSTR("Carplay");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "commonTypeDict_BoolFormat");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v195[41] = v79;
      v194[42] = CFSTR("SISOTXDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "commonTypeDict_IntegerFormat_withUnit_ms");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v195[42] = v77;
      v194[43] = CFSTR("MIMOTXDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "commonTypeDict_IntegerFormat_withUnit_ms");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v195[43] = v75;
      v194[44] = CFSTR("MIMORXDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "commonTypeDict_IntegerFormat_withUnit_ms");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v195[44] = v73;
      v194[45] = CFSTR("SISORXDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "commonTypeDict_IntegerFormat_withUnit_ms");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v195[45] = v71;
      v194[46] = CFSTR("MIMOCSDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "commonTypeDict_IntegerFormat_withUnit_ms");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v195[46] = v69;
      v194[47] = CFSTR("SISOCSDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "commonTypeDict_IntegerFormat_withUnit_ms");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v195[47] = v67;
      v194[48] = CFSTR("OCLRXDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "commonTypeDict_IntegerFormat_withUnit_ms");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v195[48] = v65;
      v194[49] = CFSTR("OCLCSDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "commonTypeDict_IntegerFormat_withUnit_ms");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v195[49] = v63;
      v194[50] = CFSTR("READINGTYPE");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "commonTypeDict_IntegerFormat");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v195[50] = v61;
      v194[51] = CFSTR("isADHSConnected");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "commonTypeDict_IntegerFormat");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v195[51] = v59;
      v194[52] = CFSTR("AutoHotspotBTScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "commonTypeDict_IntegerFormat_withUnit_ms");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v195[52] = v6;
      v194[53] = CFSTR("AutoHotspotBTScanCount");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "commonTypeDict_IntegerFormat");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v195[53] = v8;
      v194[54] = CFSTR("OPSFullDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "commonTypeDict_IntegerFormat_withUnit_ms");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v195[54] = v10;
      v194[55] = CFSTR("OPSPartialDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "commonTypeDict_IntegerFormat_withUnit_ms");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v195[55] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v195, v194, 56);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v199[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v199, v198, 2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004007))
      {
        v192[0] = *MEMORY[0x1E0D80298];
        v190 = *MEMORY[0x1E0D80318];
        v191 = &unk_1EA1DAA98;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v191, &v190, 1);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        v193[0] = v163;
        v192[1] = *MEMORY[0x1E0D802F0];
        v188[0] = CFSTR("WifiTimestamp");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v162, "commonTypeDict_IntegerFormat_withUnit_s");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        v189[0] = v161;
        v188[1] = CFSTR("PMDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_s");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        v189[1] = v159;
        v188[2] = CFSTR("MPCDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        v189[2] = v157;
        v188[3] = CFSTR("TXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_ms");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v189[3] = v155;
        v188[4] = CFSTR("RXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_ms");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v189[4] = v153;
        v188[5] = CFSTR("HSICSuspendDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        v189[5] = v151;
        v188[6] = CFSTR("HSICActiveDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        v189[6] = v149;
        v188[7] = CFSTR("PNOScanSSIDDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        v189[7] = v147;
        v188[8] = CFSTR("PNOBSSIDDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v189[8] = v145;
        v188[9] = CFSTR("RoamScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        v189[9] = v143;
        v188[10] = CFSTR("AssociatedScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_s");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        v189[10] = v141;
        v188[11] = CFSTR("OtherScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_s");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        v189[11] = v139;
        v188[12] = CFSTR("UserScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_s");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        v189[12] = v137;
        v188[13] = CFSTR("FRTSDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_ms");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        v189[13] = v135;
        v188[14] = CFSTR("PCIESuspendDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_us");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v189[14] = v133;
        v188[15] = CFSTR("PCIEActiveDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_us");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        v189[15] = v131;
        v188[16] = CFSTR("PCIEPERSTDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_us");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        v189[16] = v129;
        v188[17] = CFSTR("PCIEL0Count");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "commonTypeDict_IntegerFormat");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v189[17] = v127;
        v188[18] = CFSTR("PCIEL0Duration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_us");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v189[18] = v125;
        v188[19] = CFSTR("PCIEL2Count");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "commonTypeDict_IntegerFormat");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v189[19] = v123;
        v188[20] = CFSTR("PCIEL2Duration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_us");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        v189[20] = v121;
        v188[21] = CFSTR("PCIEL1Count");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "commonTypeDict_IntegerFormat");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        v189[21] = v119;
        v188[22] = CFSTR("PCIEL1Duration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_us");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v189[22] = v117;
        v188[23] = CFSTR("PCIEL11Count");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "commonTypeDict_IntegerFormat");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v189[23] = v115;
        v188[24] = CFSTR("PCIEL11Duration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "commonTypeDict_IntegerFormat_withUnit_us");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v189[24] = v113;
        v188[25] = CFSTR("PCIEL12Count");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "commonTypeDict_IntegerFormat");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v189[25] = v111;
        v188[26] = CFSTR("PCIEL12Duration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "commonTypeDict_IntegerFormat_withUnit_us");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v189[26] = v109;
        v188[27] = CFSTR("AWDLTXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "commonTypeDict_IntegerFormat_withUnit_ms");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v189[27] = v107;
        v188[28] = CFSTR("AWDLRXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "commonTypeDict_IntegerFormat_withUnit_ms");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v189[28] = v105;
        v188[29] = CFSTR("AWDLAWDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "commonTypeDict_IntegerFormat_withUnit_s");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v189[29] = v103;
        v188[30] = CFSTR("AWDLScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "commonTypeDict_IntegerFormat_withUnit_s");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v189[30] = v101;
        v188[31] = CFSTR("AutojoinScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "commonTypeDict_IntegerFormat_withUnit_ms");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v189[31] = v99;
        v188[32] = CFSTR("LocationScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "commonTypeDict_IntegerFormat_withUnit_ms");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v189[32] = v97;
        v188[33] = CFSTR("PipelineScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "commonTypeDict_IntegerFormat_withUnit_ms");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v189[33] = v95;
        v188[34] = CFSTR("SetupScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "commonTypeDict_IntegerFormat_withUnit_ms");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v189[34] = v93;
        v188[35] = CFSTR("UnknownScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "commonTypeDict_IntegerFormat_withUnit_ms");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v189[35] = v91;
        v188[36] = CFSTR("CurrentChannel");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "commonTypeDict_IntegerFormat");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v189[36] = v89;
        v188[37] = CFSTR("CurrentSSID");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "commonTypeDict_StringFormat");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v189[37] = v87;
        v188[38] = CFSTR("CurrentBandwidth");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "commonTypeDict_IntegerFormat");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v189[38] = v85;
        v188[39] = CFSTR("WifiPowered");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "commonTypeDict_BoolFormat");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v189[39] = v83;
        v188[40] = CFSTR("WowEnabled");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "commonTypeDict_BoolFormat");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v189[40] = v81;
        v188[41] = CFSTR("Carplay");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "commonTypeDict_BoolFormat");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v189[41] = v79;
        v188[42] = CFSTR("SISOTXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "commonTypeDict_IntegerFormat_withUnit_ms");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v189[42] = v77;
        v188[43] = CFSTR("MIMOTXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "commonTypeDict_IntegerFormat_withUnit_ms");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v189[43] = v75;
        v188[44] = CFSTR("MIMORXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "commonTypeDict_IntegerFormat_withUnit_ms");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v189[44] = v73;
        v188[45] = CFSTR("SISORXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "commonTypeDict_IntegerFormat_withUnit_ms");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v189[45] = v71;
        v188[46] = CFSTR("MIMOCSDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "commonTypeDict_IntegerFormat_withUnit_ms");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v189[46] = v69;
        v188[47] = CFSTR("SISOCSDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "commonTypeDict_IntegerFormat_withUnit_ms");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v189[47] = v15;
        v188[48] = CFSTR("OCLRXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "commonTypeDict_IntegerFormat_withUnit_ms");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v189[48] = v17;
        v188[49] = CFSTR("OCLCSDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "commonTypeDict_IntegerFormat_withUnit_ms");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v189[49] = v19;
        v188[50] = CFSTR("READINGTYPE");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "commonTypeDict_IntegerFormat");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v189[50] = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v189, v188, 51);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v193[1] = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v193, v192, 2);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
      if (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004005))
      {
        v186[0] = *MEMORY[0x1E0D80298];
        v184 = *MEMORY[0x1E0D80318];
        v185 = &unk_1EA1DAAF8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v185, &v184, 1);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        v187[0] = v163;
        v186[1] = *MEMORY[0x1E0D802F0];
        v182[0] = CFSTR("WifiTimestamp");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v162, "commonTypeDict_IntegerFormat_withUnit_s");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        v183[0] = v161;
        v182[1] = CFSTR("PMDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_s");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        v183[1] = v159;
        v182[2] = CFSTR("MPCDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        v183[2] = v157;
        v182[3] = CFSTR("TXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_ms");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v183[3] = v155;
        v182[4] = CFSTR("RXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_ms");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v183[4] = v153;
        v182[5] = CFSTR("HSICSuspendDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        v183[5] = v151;
        v182[6] = CFSTR("HSICActiveDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        v183[6] = v149;
        v182[7] = CFSTR("PNOScanSSIDDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        v183[7] = v147;
        v182[8] = CFSTR("PNOBSSIDDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v183[8] = v145;
        v182[9] = CFSTR("RoamScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        v183[9] = v143;
        v182[10] = CFSTR("AssociatedScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_s");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        v183[10] = v141;
        v182[11] = CFSTR("OtherScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_s");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        v183[11] = v139;
        v182[12] = CFSTR("UserScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_s");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        v183[12] = v137;
        v182[13] = CFSTR("FRTSDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_ms");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        v183[13] = v135;
        v182[14] = CFSTR("PCIESuspendDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_us");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v183[14] = v133;
        v182[15] = CFSTR("PCIEActiveDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_us");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        v183[15] = v131;
        v182[16] = CFSTR("PCIEPERSTDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_us");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        v183[16] = v129;
        v182[17] = CFSTR("PCIEL0Count");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "commonTypeDict_IntegerFormat");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v183[17] = v127;
        v182[18] = CFSTR("PCIEL0Duration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_us");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v183[18] = v125;
        v182[19] = CFSTR("PCIEL2Count");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "commonTypeDict_IntegerFormat");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v183[19] = v123;
        v182[20] = CFSTR("PCIEL2Duration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_us");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        v183[20] = v121;
        v182[21] = CFSTR("PCIEL1Count");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "commonTypeDict_IntegerFormat");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        v183[21] = v119;
        v182[22] = CFSTR("PCIEL1Duration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_us");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v183[22] = v117;
        v182[23] = CFSTR("PCIEL11Count");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "commonTypeDict_IntegerFormat");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v183[23] = v115;
        v182[24] = CFSTR("PCIEL11Duration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "commonTypeDict_IntegerFormat_withUnit_us");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v183[24] = v113;
        v182[25] = CFSTR("PCIEL12Count");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "commonTypeDict_IntegerFormat");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v183[25] = v111;
        v182[26] = CFSTR("PCIEL12Duration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "commonTypeDict_IntegerFormat_withUnit_us");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v183[26] = v109;
        v182[27] = CFSTR("AWDLTXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "commonTypeDict_IntegerFormat_withUnit_ms");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v183[27] = v107;
        v182[28] = CFSTR("AWDLRXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "commonTypeDict_IntegerFormat_withUnit_ms");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v183[28] = v105;
        v182[29] = CFSTR("AWDLAWDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "commonTypeDict_IntegerFormat_withUnit_s");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v183[29] = v103;
        v182[30] = CFSTR("AWDLScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "commonTypeDict_IntegerFormat_withUnit_s");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v183[30] = v101;
        v182[31] = CFSTR("AutojoinScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "commonTypeDict_IntegerFormat_withUnit_ms");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v183[31] = v99;
        v182[32] = CFSTR("LocationScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "commonTypeDict_IntegerFormat_withUnit_ms");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v183[32] = v97;
        v182[33] = CFSTR("PipelineScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "commonTypeDict_IntegerFormat_withUnit_ms");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v183[33] = v95;
        v182[34] = CFSTR("SetupScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "commonTypeDict_IntegerFormat_withUnit_ms");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v183[34] = v93;
        v182[35] = CFSTR("UnknownScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "commonTypeDict_IntegerFormat_withUnit_ms");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v183[35] = v91;
        v182[36] = CFSTR("CurrentChannel");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "commonTypeDict_IntegerFormat");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v183[36] = v89;
        v182[37] = CFSTR("CurrentSSID");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "commonTypeDict_StringFormat");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v183[37] = v87;
        v182[38] = CFSTR("CurrentBandwidth");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "commonTypeDict_IntegerFormat");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v183[38] = v85;
        v182[39] = CFSTR("WifiPowered");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "commonTypeDict_BoolFormat");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v183[39] = v83;
        v182[40] = CFSTR("WowEnabled");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "commonTypeDict_BoolFormat");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v183[40] = v81;
        v182[41] = CFSTR("Carplay");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "commonTypeDict_BoolFormat");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v183[41] = v79;
        v182[42] = CFSTR("SISOTXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "commonTypeDict_IntegerFormat_withUnit_ms");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v183[42] = v77;
        v182[43] = CFSTR("MIMOTXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "commonTypeDict_IntegerFormat_withUnit_ms");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v183[43] = v75;
        v182[44] = CFSTR("MIMORXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "commonTypeDict_IntegerFormat_withUnit_ms");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v183[44] = v73;
        v182[45] = CFSTR("SISORXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "commonTypeDict_IntegerFormat_withUnit_ms");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v183[45] = v24;
        v182[46] = CFSTR("MIMOCSDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "commonTypeDict_IntegerFormat_withUnit_ms");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v183[46] = v26;
        v182[47] = CFSTR("SISOCSDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "commonTypeDict_IntegerFormat_withUnit_ms");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v183[47] = v28;
        v182[48] = CFSTR("READINGTYPE");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "commonTypeDict_IntegerFormat");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v183[48] = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v183, v182, 49);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v187[1] = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v187, v186, 2);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_14;
      }
      if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004011) & 1) != 0
        || objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004012)
        && (int)objc_msgSend(MEMORY[0x1E0D80020], "kPLSoCClassOfDevice") < 1001205)
      {
        v180[0] = *MEMORY[0x1E0D80298];
        v178 = *MEMORY[0x1E0D80318];
        v179 = &unk_1EA1DAB08;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v179, &v178, 1);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        v181[0] = v163;
        v180[1] = *MEMORY[0x1E0D802F0];
        v176[0] = CFSTR("WifiTimestamp");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v162, "commonTypeDict_IntegerFormat_withUnit_s");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        v177[0] = v161;
        v176[1] = CFSTR("PMDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_s");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        v177[1] = v159;
        v176[2] = CFSTR("MPCDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        v177[2] = v157;
        v176[3] = CFSTR("TXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_ms");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v177[3] = v155;
        v176[4] = CFSTR("RXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_ms");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v177[4] = v153;
        v176[5] = CFSTR("HSICSuspendDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        v177[5] = v151;
        v176[6] = CFSTR("HSICActiveDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        v177[6] = v149;
        v176[7] = CFSTR("PNOScanSSIDDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        v177[7] = v147;
        v176[8] = CFSTR("PNOBSSIDDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v177[8] = v145;
        v176[9] = CFSTR("RoamScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        v177[9] = v143;
        v176[10] = CFSTR("AssociatedScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_s");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        v177[10] = v141;
        v176[11] = CFSTR("OtherScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_s");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        v177[11] = v139;
        v176[12] = CFSTR("UserScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_s");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        v177[12] = v137;
        v176[13] = CFSTR("FRTSDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_ms");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        v177[13] = v135;
        v176[14] = CFSTR("PCIESuspendDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_us");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v177[14] = v133;
        v176[15] = CFSTR("PCIEActiveDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_us");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        v177[15] = v131;
        v176[16] = CFSTR("PCIEPERSTDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_us");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        v177[16] = v129;
        v176[17] = CFSTR("PCIEL0Count");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "commonTypeDict_IntegerFormat");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v177[17] = v127;
        v176[18] = CFSTR("PCIEL0Duration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_us");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v177[18] = v125;
        v176[19] = CFSTR("PCIEL2Count");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "commonTypeDict_IntegerFormat");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v177[19] = v123;
        v176[20] = CFSTR("PCIEL2Duration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_us");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        v177[20] = v121;
        v176[21] = CFSTR("PCIEL1Count");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "commonTypeDict_IntegerFormat");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        v177[21] = v119;
        v176[22] = CFSTR("PCIEL1Duration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_us");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v177[22] = v117;
        v176[23] = CFSTR("PCIEL11Count");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "commonTypeDict_IntegerFormat");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v177[23] = v115;
        v176[24] = CFSTR("PCIEL11Duration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "commonTypeDict_IntegerFormat_withUnit_us");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v177[24] = v113;
        v176[25] = CFSTR("PCIEL12Count");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "commonTypeDict_IntegerFormat");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v177[25] = v111;
        v176[26] = CFSTR("PCIEL12Duration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "commonTypeDict_IntegerFormat_withUnit_us");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v177[26] = v109;
        v176[27] = CFSTR("AWDLTXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "commonTypeDict_IntegerFormat_withUnit_ms");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v177[27] = v107;
        v176[28] = CFSTR("AWDLRXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "commonTypeDict_IntegerFormat_withUnit_ms");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v177[28] = v105;
        v176[29] = CFSTR("AWDLAWDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "commonTypeDict_IntegerFormat_withUnit_s");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v177[29] = v103;
        v176[30] = CFSTR("AWDLScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "commonTypeDict_IntegerFormat_withUnit_s");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v177[30] = v101;
        v176[31] = CFSTR("AutojoinScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "commonTypeDict_IntegerFormat_withUnit_ms");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v177[31] = v99;
        v176[32] = CFSTR("LocationScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "commonTypeDict_IntegerFormat_withUnit_ms");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v177[32] = v97;
        v176[33] = CFSTR("PipelineScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "commonTypeDict_IntegerFormat_withUnit_ms");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v177[33] = v95;
        v176[34] = CFSTR("SetupScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "commonTypeDict_IntegerFormat_withUnit_ms");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v177[34] = v93;
        v176[35] = CFSTR("UnknownScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "commonTypeDict_IntegerFormat_withUnit_ms");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v177[35] = v91;
        v176[36] = CFSTR("CurrentChannel");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "commonTypeDict_IntegerFormat");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v177[36] = v89;
        v176[37] = CFSTR("CurrentSSID");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "commonTypeDict_StringFormat");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v177[37] = v87;
        v176[38] = CFSTR("CurrentBandwidth");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "commonTypeDict_IntegerFormat");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v177[38] = v85;
        v176[39] = CFSTR("WifiPowered");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "commonTypeDict_BoolFormat");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v177[39] = v83;
        v176[40] = CFSTR("WowEnabled");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "commonTypeDict_BoolFormat");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v177[40] = v81;
        v176[41] = CFSTR("Carplay");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "commonTypeDict_BoolFormat");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v177[41] = v79;
        v176[42] = CFSTR("READINGTYPE");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "commonTypeDict_IntegerFormat");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v177[42] = v33;
        v176[43] = CFSTR("PhyOfflineDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "commonTypeDict_IntegerFormat");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v177[43] = v35;
        v176[44] = CFSTR("PhyCalibrationDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "commonTypeDict_IntegerFormat");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v177[44] = v37;
        v176[45] = CFSTR("PhyCalibrationCount");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "commonTypeDict_IntegerFormat");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v177[45] = v39;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v177, v176, 46);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v181[1] = v40;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v181, v180, 2);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
      if (!objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004012)
        || (int)objc_msgSend(MEMORY[0x1E0D80020], "kPLSoCClassOfDevice") <= 1001204)
      {
        v168[0] = *MEMORY[0x1E0D80298];
        v166 = *MEMORY[0x1E0D80318];
        v167 = &unk_1EA1DAB18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v167, &v166, 1);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        v169[0] = v163;
        v168[1] = *MEMORY[0x1E0D802F0];
        v164[0] = CFSTR("WifiTimestamp");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v162, "commonTypeDict_IntegerFormat_withUnit_s");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        v165[0] = v161;
        v164[1] = CFSTR("PMDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_s");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        v165[1] = v159;
        v164[2] = CFSTR("MPCDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        v165[2] = v157;
        v164[3] = CFSTR("TXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_ms");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v165[3] = v155;
        v164[4] = CFSTR("RXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_ms");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        v165[4] = v153;
        v164[5] = CFSTR("HSICSuspendDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        v165[5] = v151;
        v164[6] = CFSTR("HSICActiveDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        v165[6] = v149;
        v164[7] = CFSTR("PNOScanSSIDDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        v165[7] = v147;
        v164[8] = CFSTR("PNOBSSIDDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v165[8] = v145;
        v164[9] = CFSTR("RoamScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        v165[9] = v143;
        v164[10] = CFSTR("AssociatedScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_s");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        v165[10] = v141;
        v164[11] = CFSTR("OtherScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_s");
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        v165[11] = v139;
        v164[12] = CFSTR("UserScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_s");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        v165[12] = v137;
        v164[13] = CFSTR("FRTSDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_ms");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        v165[13] = v135;
        v164[14] = CFSTR("PCIESuspendDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_us");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v165[14] = v133;
        v164[15] = CFSTR("PCIEActiveDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_us");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        v165[15] = v131;
        v164[16] = CFSTR("PCIEPERSTDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_us");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        v165[16] = v129;
        v164[17] = CFSTR("PCIEL0Count");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "commonTypeDict_IntegerFormat");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v165[17] = v127;
        v164[18] = CFSTR("PCIEL0Duration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_us");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v165[18] = v125;
        v164[19] = CFSTR("PCIEL2Count");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v124, "commonTypeDict_IntegerFormat");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v165[19] = v123;
        v164[20] = CFSTR("PCIEL2Duration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_us");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        v165[20] = v121;
        v164[21] = CFSTR("PCIEL1Count");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v120, "commonTypeDict_IntegerFormat");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        v165[21] = v119;
        v164[22] = CFSTR("PCIEL1Duration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_us");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v165[22] = v117;
        v164[23] = CFSTR("PCIEL11Count");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "commonTypeDict_IntegerFormat");
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v165[23] = v115;
        v164[24] = CFSTR("PCIEL11Duration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "commonTypeDict_IntegerFormat_withUnit_us");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        v165[24] = v113;
        v164[25] = CFSTR("PCIEL12Count");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "commonTypeDict_IntegerFormat");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v165[25] = v111;
        v164[26] = CFSTR("PCIEL12Duration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "commonTypeDict_IntegerFormat_withUnit_us");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v165[26] = v109;
        v164[27] = CFSTR("AWDLTXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "commonTypeDict_IntegerFormat_withUnit_ms");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v165[27] = v107;
        v164[28] = CFSTR("AWDLRXDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "commonTypeDict_IntegerFormat_withUnit_ms");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v165[28] = v105;
        v164[29] = CFSTR("AWDLAWDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "commonTypeDict_IntegerFormat_withUnit_s");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v165[29] = v103;
        v164[30] = CFSTR("AWDLScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "commonTypeDict_IntegerFormat_withUnit_s");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v165[30] = v101;
        v164[31] = CFSTR("AutojoinScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "commonTypeDict_IntegerFormat_withUnit_ms");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v165[31] = v99;
        v164[32] = CFSTR("LocationScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "commonTypeDict_IntegerFormat_withUnit_ms");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v165[32] = v97;
        v164[33] = CFSTR("PipelineScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "commonTypeDict_IntegerFormat_withUnit_ms");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v165[33] = v95;
        v164[34] = CFSTR("SetupScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "commonTypeDict_IntegerFormat_withUnit_ms");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v165[34] = v93;
        v164[35] = CFSTR("UnknownScanDuration");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "commonTypeDict_IntegerFormat_withUnit_ms");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v165[35] = v91;
        v164[36] = CFSTR("CurrentChannel");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "commonTypeDict_IntegerFormat");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v165[36] = v89;
        v164[37] = CFSTR("CurrentSSID");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "commonTypeDict_StringFormat");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v165[37] = v87;
        v164[38] = CFSTR("CurrentBandwidth");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "commonTypeDict_IntegerFormat");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v165[38] = v85;
        v164[39] = CFSTR("WifiPowered");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "commonTypeDict_BoolFormat");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v165[39] = v51;
        v164[40] = CFSTR("WowEnabled");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "commonTypeDict_BoolFormat");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v165[40] = v53;
        v164[41] = CFSTR("Carplay");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "commonTypeDict_BoolFormat");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v165[41] = v55;
        v164[42] = CFSTR("READINGTYPE");
        objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "commonTypeDict_IntegerFormat");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v165[42] = v57;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v165, v164, 43);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v169[1] = v58;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v169, v168, 2);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      }
      v174[0] = *MEMORY[0x1E0D80298];
      v172 = *MEMORY[0x1E0D80318];
      v173 = &unk_1EA1DAA98;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v173, &v172, 1);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      v175[0] = v163;
      v174[1] = *MEMORY[0x1E0D802F0];
      v170[0] = CFSTR("WifiTimestamp");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "commonTypeDict_IntegerFormat_withUnit_s");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      v171[0] = v161;
      v170[1] = CFSTR("PMDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_s");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      v171[1] = v159;
      v170[2] = CFSTR("MPCDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v171[2] = v157;
      v170[3] = CFSTR("TXDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_ms");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      v171[3] = v155;
      v170[4] = CFSTR("RXDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_ms");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v171[4] = v153;
      v170[5] = CFSTR("HSICSuspendDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      v171[5] = v151;
      v170[6] = CFSTR("HSICActiveDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v171[6] = v149;
      v170[7] = CFSTR("PNOScanSSIDDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v171[7] = v147;
      v170[8] = CFSTR("PNOBSSIDDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v171[8] = v145;
      v170[9] = CFSTR("RoamScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v171[9] = v143;
      v170[10] = CFSTR("AssociatedScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_s");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      v171[10] = v141;
      v170[11] = CFSTR("OtherScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_s");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v171[11] = v139;
      v170[12] = CFSTR("UserScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_s");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      v171[12] = v137;
      v170[13] = CFSTR("FRTSDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_ms");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      v171[13] = v135;
      v170[14] = CFSTR("PCIESuspendDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_us");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v171[14] = v133;
      v170[15] = CFSTR("PCIEActiveDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_us");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v171[15] = v131;
      v170[16] = CFSTR("PCIEPERSTDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_us");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v171[16] = v129;
      v170[17] = CFSTR("PCIEL0Count");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "commonTypeDict_IntegerFormat");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v171[17] = v127;
      v170[18] = CFSTR("PCIEL0Duration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_us");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v171[18] = v125;
      v170[19] = CFSTR("PCIEL2Count");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "commonTypeDict_IntegerFormat");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v171[19] = v123;
      v170[20] = CFSTR("PCIEL2Duration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_us");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v171[20] = v121;
      v170[21] = CFSTR("PCIEL1Count");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "commonTypeDict_IntegerFormat");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v171[21] = v119;
      v170[22] = CFSTR("PCIEL1Duration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_us");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v171[22] = v117;
      v170[23] = CFSTR("PCIEL11Count");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "commonTypeDict_IntegerFormat");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v171[23] = v115;
      v170[24] = CFSTR("PCIEL11Duration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "commonTypeDict_IntegerFormat_withUnit_us");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v171[24] = v113;
      v170[25] = CFSTR("PCIEL12Count");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "commonTypeDict_IntegerFormat");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v171[25] = v111;
      v170[26] = CFSTR("PCIEL12Duration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "commonTypeDict_IntegerFormat_withUnit_us");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v171[26] = v109;
      v170[27] = CFSTR("AWDLTXDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "commonTypeDict_IntegerFormat_withUnit_ms");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v171[27] = v107;
      v170[28] = CFSTR("AWDLRXDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "commonTypeDict_IntegerFormat_withUnit_ms");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v171[28] = v105;
      v170[29] = CFSTR("AWDLAWDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "commonTypeDict_IntegerFormat_withUnit_s");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v171[29] = v103;
      v170[30] = CFSTR("AWDLScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "commonTypeDict_IntegerFormat_withUnit_s");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v171[30] = v101;
      v170[31] = CFSTR("AutojoinScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "commonTypeDict_IntegerFormat_withUnit_ms");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v171[31] = v99;
      v170[32] = CFSTR("LocationScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "commonTypeDict_IntegerFormat_withUnit_ms");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v171[32] = v97;
      v170[33] = CFSTR("PipelineScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "commonTypeDict_IntegerFormat_withUnit_ms");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v171[33] = v95;
      v170[34] = CFSTR("SetupScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "commonTypeDict_IntegerFormat_withUnit_ms");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v171[34] = v93;
      v170[35] = CFSTR("UnknownScanDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "commonTypeDict_IntegerFormat_withUnit_ms");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v171[35] = v91;
      v170[36] = CFSTR("CurrentChannel");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "commonTypeDict_IntegerFormat");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v171[36] = v89;
      v170[37] = CFSTR("CurrentSSID");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "commonTypeDict_StringFormat");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v171[37] = v87;
      v170[38] = CFSTR("CurrentBandwidth");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "commonTypeDict_IntegerFormat");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v171[38] = v85;
      v170[39] = CFSTR("WifiPowered");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "commonTypeDict_BoolFormat");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v171[39] = v83;
      v170[40] = CFSTR("WowEnabled");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "commonTypeDict_BoolFormat");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v171[40] = v81;
      v170[41] = CFSTR("Carplay");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "commonTypeDict_BoolFormat");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v171[41] = v79;
      v170[42] = CFSTR("READINGTYPE");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "commonTypeDict_IntegerFormat");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v171[42] = v77;
      v170[43] = CFSTR("PhyOfflineDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "commonTypeDict_IntegerFormat");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v171[43] = v75;
      v170[44] = CFSTR("PhyCalibrationDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "commonTypeDict_IntegerFormat");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v171[44] = v73;
      v170[45] = CFSTR("PhyCalibrationCount");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "commonTypeDict_IntegerFormat");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v171[45] = v71;
      v170[46] = CFSTR("PNOScanSSID5GDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "commonTypeDict_IntegerFormat_withUnit_s");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v171[46] = v69;
      v170[47] = CFSTR("PNOBSSID5GDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "commonTypeDict_IntegerFormat_withUnit_s");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v171[47] = v67;
      v170[48] = CFSTR("RoamScan5GDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "commonTypeDict_IntegerFormat_withUnit_s");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v171[48] = v42;
      v170[49] = CFSTR("AssociatedScan5GDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "commonTypeDict_IntegerFormat_withUnit_s");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v171[49] = v44;
      v170[50] = CFSTR("OtherScan5GDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "commonTypeDict_IntegerFormat_withUnit_s");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v171[50] = v46;
      v170[51] = CFSTR("UserScan5GDuration");
      objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "commonTypeDict_IntegerFormat_withUnit_s");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v171[51] = v48;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v171, v170, 52);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v175[1] = v49;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v175, v174, 2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_13:

LABEL_14:
LABEL_15:

LABEL_16:
    return v3;
  }
  objc_msgSend(a1, "entryEventBackwardDefinitionCumulativeMultiCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

+ (id)entryEventBackwardDefinitionDiffBasic
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
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
  void *v46;
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
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  _QWORD v162[31];
  _QWORD v163[31];
  uint64_t v164;
  void *v165;
  _QWORD v166[2];
  _QWORD v167[2];
  _QWORD v168[37];
  _QWORD v169[37];
  uint64_t v170;
  void *v171;
  _QWORD v172[2];
  _QWORD v173[2];
  _QWORD v174[39];
  _QWORD v175[39];
  uint64_t v176;
  void *v177;
  _QWORD v178[2];
  _QWORD v179[2];
  _QWORD v180[44];
  _QWORD v181[44];
  uint64_t v182;
  void *v183;
  _QWORD v184[2];
  _QWORD v185[2];
  _QWORD v186[45];
  _QWORD v187[45];
  uint64_t v188;
  void *v189;
  _QWORD v190[2];
  _QWORD v191[4];

  v191[2] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004013) & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004014))
  {
    v190[0] = *MEMORY[0x1E0D80298];
    v188 = *MEMORY[0x1E0D80318];
    v189 = &unk_1EA1DAAE8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v189, &v188, 1);
    v102 = objc_claimAutoreleasedReturnValue();
    v191[0] = v102;
    v190[1] = *MEMORY[0x1E0D802F0];
    v186[0] = CFSTR("TimeDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "commonTypeDict_IntegerFormat_withUnit_s");
    v86 = objc_claimAutoreleasedReturnValue();
    v187[0] = v86;
    v186[1] = CFSTR("PMDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "commonTypeDict_IntegerFormat_withUnit_s");
    v90 = objc_claimAutoreleasedReturnValue();
    v187[1] = v90;
    v186[2] = CFSTR("MPCDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "commonTypeDict_IntegerFormat_withUnit_s");
    v78 = objc_claimAutoreleasedReturnValue();
    v187[2] = v78;
    v186[3] = CFSTR("TXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "commonTypeDict_IntegerFormat_withUnit_ms");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v187[3] = v161;
    v186[4] = CFSTR("RXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_ms");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v187[4] = v159;
    v186[5] = CFSTR("HSICSuspendDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v187[5] = v157;
    v186[6] = CFSTR("HSICActiveDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_s");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v187[6] = v155;
    v186[7] = CFSTR("PNOScanSSIDDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_s");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v187[7] = v153;
    v186[8] = CFSTR("PNOBSSIDDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v187[8] = v151;
    v186[9] = CFSTR("RoamScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v187[9] = v149;
    v186[10] = CFSTR("AssociatedScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v187[10] = v147;
    v186[11] = CFSTR("OtherScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v187[11] = v145;
    v186[12] = CFSTR("UserScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v187[12] = v143;
    v186[13] = CFSTR("FRTSDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_ms");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v187[13] = v141;
    v186[14] = CFSTR("PCIESuspendDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_us");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v187[14] = v139;
    v186[15] = CFSTR("PCIEActiveDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_us");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v187[15] = v137;
    v186[16] = CFSTR("PCIEPERSTDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_us");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v187[16] = v135;
    v186[17] = CFSTR("AWDLTXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_ms");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v187[17] = v133;
    v186[18] = CFSTR("AWDLRXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_ms");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v187[18] = v131;
    v186[19] = CFSTR("AWDLAWDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_s");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v187[19] = v129;
    v186[20] = CFSTR("AWDLScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "commonTypeDict_IntegerFormat_withUnit_s");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v187[20] = v127;
    v186[21] = CFSTR("AutojoinScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_ms");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v187[21] = v125;
    v186[22] = CFSTR("LocationScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "commonTypeDict_IntegerFormat_withUnit_ms");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v187[22] = v123;
    v186[23] = CFSTR("PipelineScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_ms");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v187[23] = v121;
    v186[24] = CFSTR("SetupScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "commonTypeDict_IntegerFormat_withUnit_ms");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v187[24] = v119;
    v186[25] = CFSTR("UnknownScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_ms");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v187[25] = v117;
    v186[26] = CFSTR("CurrentChannel");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "commonTypeDict_IntegerFormat");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v187[26] = v115;
    v186[27] = CFSTR("CurrentSSID");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "commonTypeDict_StringFormat");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v187[27] = v113;
    v186[28] = CFSTR("CurrentBandwidth");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "commonTypeDict_IntegerFormat");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v187[28] = v111;
    v186[29] = CFSTR("WifiPowered");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "commonTypeDict_BoolFormat");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v187[29] = v109;
    v186[30] = CFSTR("WowEnabled");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "commonTypeDict_BoolFormat");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v187[30] = v108;
    v186[31] = CFSTR("SISOTXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "commonTypeDict_IntegerFormat_withUnit_ms");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v187[31] = v69;
    v186[32] = CFSTR("MIMOTXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "commonTypeDict_IntegerFormat_withUnit_ms");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v187[32] = v66;
    v186[33] = CFSTR("MIMORXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "commonTypeDict_IntegerFormat_withUnit_ms");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v187[33] = v64;
    v186[34] = CFSTR("SISORXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "commonTypeDict_IntegerFormat_withUnit_ms");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v187[34] = v61;
    v186[35] = CFSTR("MIMOCSDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "commonTypeDict_IntegerFormat_withUnit_ms");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v187[35] = v59;
    v186[36] = CFSTR("SISOCSDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "commonTypeDict_IntegerFormat_withUnit_ms");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v187[36] = v57;
    v186[37] = CFSTR("OCLRXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "commonTypeDict_IntegerFormat_withUnit_ms");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v187[37] = v55;
    v186[38] = CFSTR("OCLCSDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "commonTypeDict_IntegerFormat_withUnit_ms");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v187[38] = v53;
    v186[39] = CFSTR("OPSFullDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "commonTypeDict_IntegerFormat_withUnit_ms");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v187[39] = v50;
    v186[40] = CFSTR("OPSPartialDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "commonTypeDict_IntegerFormat_withUnit_ms");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v187[40] = v48;
    v186[41] = CFSTR("PSBWDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "commonTypeDict_IntegerFormat_withUnit_ms");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v187[41] = v3;
    v186[42] = CFSTR("isADHSConnected");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v187[42] = v5;
    v186[43] = CFSTR("AutoHotspotBTScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "commonTypeDict_IntegerFormat_withUnit_s");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v187[43] = v7;
    v186[44] = CFSTR("AutoHotspotBTScanCount");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v187[44] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v187, v186, 45);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v191[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v191, v190, 2);
    v106 = (id)objc_claimAutoreleasedReturnValue();

    v11 = v70;
    v12 = (void *)v86;

    v13 = v74;
    v14 = (void *)v78;

    v15 = v82;
    v16 = (void *)v90;

    v17 = v94;
    v18 = v98;

    v19 = (void *)v102;
LABEL_4:

LABEL_5:
    goto LABEL_6;
  }
  if (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004010))
  {
    v184[0] = *MEMORY[0x1E0D80298];
    v182 = *MEMORY[0x1E0D80318];
    v183 = &unk_1EA1DAAE8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v183, &v182, 1);
    v103 = objc_claimAutoreleasedReturnValue();
    v185[0] = v103;
    v184[1] = *MEMORY[0x1E0D802F0];
    v180[0] = CFSTR("TimeDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "commonTypeDict_IntegerFormat_withUnit_s");
    v87 = objc_claimAutoreleasedReturnValue();
    v181[0] = v87;
    v180[1] = CFSTR("PMDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "commonTypeDict_IntegerFormat_withUnit_s");
    v91 = objc_claimAutoreleasedReturnValue();
    v181[1] = v91;
    v180[2] = CFSTR("MPCDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "commonTypeDict_IntegerFormat_withUnit_s");
    v79 = objc_claimAutoreleasedReturnValue();
    v181[2] = v79;
    v180[3] = CFSTR("TXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "commonTypeDict_IntegerFormat_withUnit_ms");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v181[3] = v161;
    v180[4] = CFSTR("RXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_ms");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v181[4] = v159;
    v180[5] = CFSTR("HSICSuspendDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v181[5] = v157;
    v180[6] = CFSTR("HSICActiveDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_s");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v181[6] = v155;
    v180[7] = CFSTR("PNOScanSSIDDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_s");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v181[7] = v153;
    v180[8] = CFSTR("PNOBSSIDDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v181[8] = v151;
    v180[9] = CFSTR("RoamScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v181[9] = v149;
    v180[10] = CFSTR("AssociatedScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v181[10] = v147;
    v180[11] = CFSTR("OtherScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v181[11] = v145;
    v180[12] = CFSTR("UserScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v181[12] = v143;
    v180[13] = CFSTR("FRTSDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_ms");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v181[13] = v141;
    v180[14] = CFSTR("PCIESuspendDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_us");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v181[14] = v139;
    v180[15] = CFSTR("PCIEActiveDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_us");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v181[15] = v137;
    v180[16] = CFSTR("PCIEPERSTDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_us");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v181[16] = v135;
    v180[17] = CFSTR("AWDLTXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_ms");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v181[17] = v133;
    v180[18] = CFSTR("AWDLRXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_ms");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v181[18] = v131;
    v180[19] = CFSTR("AWDLAWDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_s");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v181[19] = v129;
    v180[20] = CFSTR("AWDLScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "commonTypeDict_IntegerFormat_withUnit_s");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v181[20] = v127;
    v180[21] = CFSTR("AutojoinScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_ms");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v181[21] = v125;
    v180[22] = CFSTR("LocationScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "commonTypeDict_IntegerFormat_withUnit_ms");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v181[22] = v123;
    v180[23] = CFSTR("PipelineScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_ms");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v181[23] = v121;
    v180[24] = CFSTR("SetupScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "commonTypeDict_IntegerFormat_withUnit_ms");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v181[24] = v119;
    v180[25] = CFSTR("UnknownScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_ms");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v181[25] = v117;
    v180[26] = CFSTR("CurrentChannel");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "commonTypeDict_IntegerFormat");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v181[26] = v115;
    v180[27] = CFSTR("CurrentSSID");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "commonTypeDict_StringFormat");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v181[27] = v113;
    v180[28] = CFSTR("CurrentBandwidth");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "commonTypeDict_IntegerFormat");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v181[28] = v111;
    v180[29] = CFSTR("WifiPowered");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "commonTypeDict_BoolFormat");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v181[29] = v109;
    v180[30] = CFSTR("WowEnabled");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "commonTypeDict_BoolFormat");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v181[30] = v108;
    v180[31] = CFSTR("SISOTXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "commonTypeDict_IntegerFormat_withUnit_ms");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v181[31] = v69;
    v180[32] = CFSTR("MIMOTXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "commonTypeDict_IntegerFormat_withUnit_ms");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v181[32] = v66;
    v180[33] = CFSTR("MIMORXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "commonTypeDict_IntegerFormat_withUnit_ms");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v181[33] = v64;
    v180[34] = CFSTR("SISORXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "commonTypeDict_IntegerFormat_withUnit_ms");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v181[34] = v61;
    v180[35] = CFSTR("MIMOCSDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "commonTypeDict_IntegerFormat_withUnit_ms");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v181[35] = v59;
    v180[36] = CFSTR("SISOCSDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "commonTypeDict_IntegerFormat_withUnit_ms");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v181[36] = v57;
    v180[37] = CFSTR("OCLRXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "commonTypeDict_IntegerFormat_withUnit_ms");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v181[37] = v55;
    v180[38] = CFSTR("OCLCSDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "commonTypeDict_IntegerFormat_withUnit_ms");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v181[38] = v53;
    v180[39] = CFSTR("OPSFullDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "commonTypeDict_IntegerFormat_withUnit_ms");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v181[39] = v51;
    v180[40] = CFSTR("OPSPartialDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "commonTypeDict_IntegerFormat_withUnit_ms");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v181[40] = v22;
    v180[41] = CFSTR("isADHSConnected");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v181[41] = v24;
    v180[42] = CFSTR("AutoHotspotBTScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "commonTypeDict_IntegerFormat_withUnit_s");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v181[42] = v26;
    v180[43] = CFSTR("AutoHotspotBTScanCount");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v181[43] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v181, v180, 44);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v185[1] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v185, v184, 2);
    v106 = (id)objc_claimAutoreleasedReturnValue();

    v12 = (void *)v87;
    v14 = (void *)v79;

    v15 = v83;
    v16 = (void *)v91;

    v17 = v95;
    v13 = v75;

    v18 = v99;
    v19 = (void *)v103;

    v11 = v71;
    goto LABEL_4;
  }
  if (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004007))
  {
    v178[0] = *MEMORY[0x1E0D80298];
    v176 = *MEMORY[0x1E0D80318];
    v177 = &unk_1EA1DAAE8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v177, &v176, 1);
    v104 = objc_claimAutoreleasedReturnValue();
    v179[0] = v104;
    v178[1] = *MEMORY[0x1E0D802F0];
    v174[0] = CFSTR("TimeDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "commonTypeDict_IntegerFormat_withUnit_s");
    v88 = objc_claimAutoreleasedReturnValue();
    v175[0] = v88;
    v174[1] = CFSTR("PMDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "commonTypeDict_IntegerFormat_withUnit_s");
    v92 = objc_claimAutoreleasedReturnValue();
    v175[1] = v92;
    v174[2] = CFSTR("MPCDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "commonTypeDict_IntegerFormat_withUnit_s");
    v80 = objc_claimAutoreleasedReturnValue();
    v175[2] = v80;
    v174[3] = CFSTR("TXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "commonTypeDict_IntegerFormat_withUnit_ms");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v175[3] = v161;
    v174[4] = CFSTR("RXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_ms");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v175[4] = v159;
    v174[5] = CFSTR("HSICSuspendDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v175[5] = v157;
    v174[6] = CFSTR("HSICActiveDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_s");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v175[6] = v155;
    v174[7] = CFSTR("PNOScanSSIDDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_s");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v175[7] = v153;
    v174[8] = CFSTR("PNOBSSIDDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v175[8] = v151;
    v174[9] = CFSTR("RoamScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v175[9] = v149;
    v174[10] = CFSTR("AssociatedScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v175[10] = v147;
    v174[11] = CFSTR("OtherScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v175[11] = v145;
    v174[12] = CFSTR("UserScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v175[12] = v143;
    v174[13] = CFSTR("FRTSDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_ms");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v175[13] = v141;
    v174[14] = CFSTR("PCIESuspendDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_us");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v175[14] = v139;
    v174[15] = CFSTR("PCIEActiveDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_us");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v175[15] = v137;
    v174[16] = CFSTR("PCIEPERSTDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_us");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v175[16] = v135;
    v174[17] = CFSTR("AWDLTXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_ms");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v175[17] = v133;
    v174[18] = CFSTR("AWDLRXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_ms");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v175[18] = v131;
    v174[19] = CFSTR("AWDLAWDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_s");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v175[19] = v129;
    v174[20] = CFSTR("AWDLScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "commonTypeDict_IntegerFormat_withUnit_s");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v175[20] = v127;
    v174[21] = CFSTR("AutojoinScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_ms");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v175[21] = v125;
    v174[22] = CFSTR("LocationScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "commonTypeDict_IntegerFormat_withUnit_ms");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v175[22] = v123;
    v174[23] = CFSTR("PipelineScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_ms");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v175[23] = v121;
    v174[24] = CFSTR("SetupScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "commonTypeDict_IntegerFormat_withUnit_ms");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v175[24] = v119;
    v174[25] = CFSTR("UnknownScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_ms");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v175[25] = v117;
    v174[26] = CFSTR("CurrentChannel");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "commonTypeDict_IntegerFormat");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v175[26] = v115;
    v174[27] = CFSTR("CurrentSSID");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "commonTypeDict_StringFormat");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v175[27] = v113;
    v174[28] = CFSTR("CurrentBandwidth");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "commonTypeDict_IntegerFormat");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v175[28] = v111;
    v174[29] = CFSTR("WifiPowered");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "commonTypeDict_BoolFormat");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v175[29] = v109;
    v174[30] = CFSTR("WowEnabled");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "commonTypeDict_BoolFormat");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v175[30] = v108;
    v174[31] = CFSTR("SISOTXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v107, "commonTypeDict_IntegerFormat_withUnit_ms");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v175[31] = v69;
    v174[32] = CFSTR("MIMOTXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "commonTypeDict_IntegerFormat_withUnit_ms");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v175[32] = v66;
    v174[33] = CFSTR("MIMORXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "commonTypeDict_IntegerFormat_withUnit_ms");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v175[33] = v64;
    v174[34] = CFSTR("SISORXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "commonTypeDict_IntegerFormat_withUnit_ms");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v175[34] = v62;
    v174[35] = CFSTR("MIMOCSDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "commonTypeDict_IntegerFormat_withUnit_ms");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v175[35] = v31;
    v174[36] = CFSTR("SISOCSDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "commonTypeDict_IntegerFormat_withUnit_ms");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v175[36] = v33;
    v174[37] = CFSTR("OCLRXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "commonTypeDict_IntegerFormat_withUnit_ms");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v175[37] = v35;
    v174[38] = CFSTR("OCLCSDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "commonTypeDict_IntegerFormat_withUnit_ms");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v175[38] = v37;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v175, v174, 39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v179[1] = v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v179, v178, 2);
    v106 = (id)objc_claimAutoreleasedReturnValue();

    v17 = v96;
    v12 = (void *)v88;

    v18 = v100;
    v19 = (void *)v104;

    v11 = v72;
    v13 = v76;

    v14 = (void *)v80;
    v15 = v84;

    v16 = (void *)v92;
    goto LABEL_5;
  }
  if (!objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004005))
  {
    v166[0] = *MEMORY[0x1E0D80298];
    v164 = *MEMORY[0x1E0D80318];
    v165 = &unk_1EA1DAAC8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v165, &v164, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v167[0] = v19;
    v166[1] = *MEMORY[0x1E0D802F0];
    v162[0] = CFSTR("TimeDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "commonTypeDict_IntegerFormat_withUnit_s");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v163[0] = v12;
    v162[1] = CFSTR("PMDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "commonTypeDict_IntegerFormat_withUnit_s");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v163[1] = v16;
    v162[2] = CFSTR("MPCDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "commonTypeDict_IntegerFormat_withUnit_s");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v163[2] = v14;
    v162[3] = CFSTR("TXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "commonTypeDict_IntegerFormat_withUnit_s");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v163[3] = v161;
    v162[4] = CFSTR("RXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_s");
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v163[4] = v159;
    v162[5] = CFSTR("HSICSuspendDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v163[5] = v157;
    v162[6] = CFSTR("HSICActiveDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_s");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v163[6] = v155;
    v162[7] = CFSTR("PNOScanSSIDDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_s");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v163[7] = v153;
    v162[8] = CFSTR("PNOBSSIDDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v163[8] = v151;
    v162[9] = CFSTR("RoamScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v163[9] = v149;
    v162[10] = CFSTR("AssociatedScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v163[10] = v147;
    v162[11] = CFSTR("OtherScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v163[11] = v145;
    v162[12] = CFSTR("UserScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v163[12] = v143;
    v162[13] = CFSTR("FRTSDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_ms");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v163[13] = v141;
    v162[14] = CFSTR("PCIESuspendDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_us");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v163[14] = v139;
    v162[15] = CFSTR("PCIEActiveDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_us");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v163[15] = v137;
    v162[16] = CFSTR("PCIEPERSTDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_us");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v163[16] = v135;
    v162[17] = CFSTR("AutojoinScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_ms");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v163[17] = v133;
    v162[18] = CFSTR("LocationScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_ms");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v163[18] = v131;
    v162[19] = CFSTR("PipelineScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_ms");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v163[19] = v129;
    v162[20] = CFSTR("SetupScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v128, "commonTypeDict_IntegerFormat_withUnit_ms");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v163[20] = v127;
    v162[21] = CFSTR("UnknownScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_ms");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v163[21] = v125;
    v162[22] = CFSTR("AWDLTXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "commonTypeDict_IntegerFormat_withUnit_ms");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v163[22] = v123;
    v162[23] = CFSTR("AWDLRXDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_ms");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v163[23] = v121;
    v162[24] = CFSTR("AWDLAWDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "commonTypeDict_IntegerFormat_withUnit_s");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v163[24] = v119;
    v162[25] = CFSTR("AWDLScanDuration");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_s");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v163[25] = v117;
    v162[26] = CFSTR("CurrentChannel");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "commonTypeDict_IntegerFormat");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v163[26] = v115;
    v162[27] = CFSTR("CurrentSSID");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "commonTypeDict_StringFormat");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v163[27] = v113;
    v162[28] = CFSTR("CurrentBandwidth");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "commonTypeDict_IntegerFormat");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v163[28] = v111;
    v162[29] = CFSTR("WifiPowered");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "commonTypeDict_BoolFormat");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v163[29] = v109;
    v162[30] = CFSTR("WowEnabled");
    objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "commonTypeDict_BoolFormat");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v163[30] = v108;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v163, v162, 31);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v167[1] = v107;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v167, v166, 2);
    v106 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v172[0] = *MEMORY[0x1E0D80298];
  v170 = *MEMORY[0x1E0D80318];
  v171 = &unk_1EA1DAAD8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v171, &v170, 1);
  v105 = objc_claimAutoreleasedReturnValue();
  v173[0] = v105;
  v172[1] = *MEMORY[0x1E0D802F0];
  v168[0] = CFSTR("TimeDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "commonTypeDict_IntegerFormat_withUnit_s");
  v89 = objc_claimAutoreleasedReturnValue();
  v169[0] = v89;
  v168[1] = CFSTR("PMDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "commonTypeDict_IntegerFormat_withUnit_s");
  v93 = objc_claimAutoreleasedReturnValue();
  v169[1] = v93;
  v168[2] = CFSTR("MPCDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "commonTypeDict_IntegerFormat_withUnit_s");
  v81 = objc_claimAutoreleasedReturnValue();
  v169[2] = v81;
  v168[3] = CFSTR("TXDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "commonTypeDict_IntegerFormat_withUnit_s");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v169[3] = v161;
  v168[4] = CFSTR("RXDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "commonTypeDict_IntegerFormat_withUnit_s");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v169[4] = v159;
  v168[5] = CFSTR("HSICSuspendDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v158, "commonTypeDict_IntegerFormat_withUnit_s");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v169[5] = v157;
  v168[6] = CFSTR("HSICActiveDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "commonTypeDict_IntegerFormat_withUnit_s");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v169[6] = v155;
  v168[7] = CFSTR("PNOScanSSIDDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "commonTypeDict_IntegerFormat_withUnit_s");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v169[7] = v153;
  v168[8] = CFSTR("PNOBSSIDDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "commonTypeDict_IntegerFormat_withUnit_s");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v169[8] = v151;
  v168[9] = CFSTR("RoamScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "commonTypeDict_IntegerFormat_withUnit_s");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v169[9] = v149;
  v168[10] = CFSTR("AssociatedScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v148, "commonTypeDict_IntegerFormat_withUnit_s");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v169[10] = v147;
  v168[11] = CFSTR("OtherScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v146, "commonTypeDict_IntegerFormat_withUnit_s");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v169[11] = v145;
  v168[12] = CFSTR("UserScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "commonTypeDict_IntegerFormat_withUnit_s");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v169[12] = v143;
  v168[13] = CFSTR("FRTSDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v142, "commonTypeDict_IntegerFormat_withUnit_ms");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v169[13] = v141;
  v168[14] = CFSTR("PCIESuspendDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "commonTypeDict_IntegerFormat_withUnit_us");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v169[14] = v139;
  v168[15] = CFSTR("PCIEActiveDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "commonTypeDict_IntegerFormat_withUnit_us");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v169[15] = v137;
  v168[16] = CFSTR("PCIEPERSTDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v136, "commonTypeDict_IntegerFormat_withUnit_us");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v169[16] = v135;
  v168[17] = CFSTR("AutojoinScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "commonTypeDict_IntegerFormat_withUnit_ms");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v169[17] = v133;
  v168[18] = CFSTR("LocationScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "commonTypeDict_IntegerFormat_withUnit_ms");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v169[18] = v131;
  v168[19] = CFSTR("PipelineScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "commonTypeDict_IntegerFormat_withUnit_ms");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v169[19] = v129;
  v168[20] = CFSTR("SetupScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "commonTypeDict_IntegerFormat_withUnit_ms");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v169[20] = v127;
  v168[21] = CFSTR("UnknownScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "commonTypeDict_IntegerFormat_withUnit_ms");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v169[21] = v125;
  v168[22] = CFSTR("AWDLTXDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v124, "commonTypeDict_IntegerFormat_withUnit_ms");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v169[22] = v123;
  v168[23] = CFSTR("AWDLRXDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "commonTypeDict_IntegerFormat_withUnit_ms");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v169[23] = v121;
  v168[24] = CFSTR("AWDLAWDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "commonTypeDict_IntegerFormat_withUnit_s");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v169[24] = v119;
  v168[25] = CFSTR("AWDLScanDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "commonTypeDict_IntegerFormat_withUnit_s");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v169[25] = v117;
  v168[26] = CFSTR("CurrentChannel");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "commonTypeDict_IntegerFormat");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v169[26] = v115;
  v168[27] = CFSTR("CurrentSSID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "commonTypeDict_StringFormat");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v169[27] = v113;
  v168[28] = CFSTR("CurrentBandwidth");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "commonTypeDict_IntegerFormat");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v169[28] = v111;
  v168[29] = CFSTR("WifiPowered");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "commonTypeDict_BoolFormat");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v169[29] = v109;
  v168[30] = CFSTR("WowEnabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "commonTypeDict_BoolFormat");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v169[30] = v108;
  v168[31] = CFSTR("SISOTXDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "commonTypeDict_IntegerFormat_withUnit_ms");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v169[31] = v69;
  v168[32] = CFSTR("MIMOTXDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "commonTypeDict_IntegerFormat_withUnit_ms");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v169[32] = v67;
  v168[33] = CFSTR("MIMORXDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "commonTypeDict_IntegerFormat_withUnit_ms");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v169[33] = v40;
  v168[34] = CFSTR("SISORXDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_IntegerFormat_withUnit_ms");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v169[34] = v42;
  v168[35] = CFSTR("MIMOCSDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commonTypeDict_IntegerFormat_withUnit_ms");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v169[35] = v44;
  v168[36] = CFSTR("SISOCSDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "commonTypeDict_IntegerFormat_withUnit_ms");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v169[36] = v46;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v169, v168, 37);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v173[1] = v47;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v173, v172, 2);
  v106 = (id)objc_claimAutoreleasedReturnValue();

  v11 = v73;
  v13 = v77;

  v14 = (void *)v81;
  v15 = v85;

  v16 = (void *)v93;
  v17 = v97;

  v12 = (void *)v89;
  v18 = v101;

  v19 = (void *)v105;
LABEL_6:

LABEL_7:
  return v106;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (void)setWifiManager:(__WiFiManagerClient *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];

  if (-[PLWifiAgent wifiManager](self, "wifiManager") != a3)
  {
    if (-[PLWifiAgent wifiManager](self, "wifiManager"))
    {
      -[PLWifiAgent wifiManager](self, "wifiManager");
      WiFiManagerClientRegisterDeviceAttachmentCallback();
      -[PLWifiAgent wifiManager](self, "wifiManager");
      CFRunLoopGetMain();
      WiFiManagerClientUnscheduleFromRunLoop();
    }
    self->_wifiManager = a3;
    if (-[PLWifiAgent wifiManager](self, "wifiManager"))
    {
      -[PLWifiAgent wifiManager](self, "wifiManager");
      CFRunLoopGetMain();
      WiFiManagerClientScheduleWithRunLoop();
      -[PLWifiAgent wifiManager](self, "wifiManager");
      WiFiManagerClientRegisterDeviceAttachmentCallback();
      -[PLWifiAgent findWifiDevice](self, "findWifiDevice");
    }
    else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v5 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __30__PLWifiAgent_setWifiManager___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v5;
      if (setWifiManager__defaultOnce != -1)
        dispatch_once(&setWifiManager__defaultOnce, block);
      if (setWifiManager__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: Was passed an invalid wifi manager reference"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent setWifiManager:]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 2231);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
  }
}

uint64_t __30__PLWifiAgent_setWifiManager___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  setWifiManager__classDebugEnabled = result;
  return result;
}

- (void)setWiFiHotspotDevice:(__WiFiDeviceClient *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  uint64_t v21;
  _QWORD block[5];

  if (-[PLWifiAgent wifiHotspotDevice](self, "wifiHotspotDevice") != a3)
  {
    if (-[PLWifiAgent wifiHotspotDevice](self, "wifiHotspotDevice"))
    {
      -[PLWifiAgent wifiHotspotDevice](self, "wifiHotspotDevice");
      WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback();
    }
    self->_wifiHotspotDevice = a3;
    if (-[PLWifiAgent wifiHotspotDevice](self, "wifiHotspotDevice"))
    {
      -[PLWifiAgent wifiHotspotDevice](self, "wifiHotspotDevice");
      WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback();
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v5 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __36__PLWifiAgent_setWiFiHotspotDevice___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v5;
        if (setWiFiHotspotDevice__defaultOnce != -1)
          dispatch_once(&setWiFiHotspotDevice__defaultOnce, block);
        if (setWiFiHotspotDevice__classDebugEnabled)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: set wifi hotspot device reference"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "lastPathComponent");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent setWiFiHotspotDevice:]");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 2252);

          PLLogCommon();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
LABEL_17:

        }
      }
    }
    else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v12 = objc_opt_class();
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __36__PLWifiAgent_setWiFiHotspotDevice___block_invoke_486;
      v20 = &__block_descriptor_40_e5_v8__0lu32l8;
      v21 = v12;
      if (setWiFiHotspotDevice__defaultOnce_484 != -1)
        dispatch_once(&setWiFiHotspotDevice__defaultOnce_484, &v17);
      if (setWiFiHotspotDevice__classDebugEnabled_485)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: Was passed an invalid wifi hotspot device reference"), v17, v18, v19, v20, v21);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent setWiFiHotspotDevice:]");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v15, v16, 2254);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        goto LABEL_17;
      }
    }
  }
}

uint64_t __36__PLWifiAgent_setWiFiHotspotDevice___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  setWiFiHotspotDevice__classDebugEnabled = result;
  return result;
}

uint64_t __36__PLWifiAgent_setWiFiHotspotDevice___block_invoke_486(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  setWiFiHotspotDevice__classDebugEnabled_485 = result;
  return result;
}

- (void)setWiFiAWDLDevice:(__WiFiDeviceClient *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  uint64_t v21;
  _QWORD block[5];

  if (-[PLWifiAgent wifiAwdlDevice](self, "wifiAwdlDevice") != a3)
  {
    if (-[PLWifiAgent wifiAwdlDevice](self, "wifiAwdlDevice"))
    {
      -[PLWifiAgent wifiAwdlDevice](self, "wifiAwdlDevice");
      WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback();
    }
    self->_wifiAwdlDevice = a3;
    if (-[PLWifiAgent wifiAwdlDevice](self, "wifiAwdlDevice"))
    {
      -[PLWifiAgent wifiAwdlDevice](self, "wifiAwdlDevice");
      WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback();
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v5 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __33__PLWifiAgent_setWiFiAWDLDevice___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v5;
        if (setWiFiAWDLDevice__defaultOnce != -1)
          dispatch_once(&setWiFiAWDLDevice__defaultOnce, block);
        if (setWiFiAWDLDevice__classDebugEnabled)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: set wifi awdl device reference"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "lastPathComponent");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent setWiFiAWDLDevice:]");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 2274);

          PLLogCommon();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
LABEL_17:

        }
      }
    }
    else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v12 = objc_opt_class();
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __33__PLWifiAgent_setWiFiAWDLDevice___block_invoke_493;
      v20 = &__block_descriptor_40_e5_v8__0lu32l8;
      v21 = v12;
      if (setWiFiAWDLDevice__defaultOnce_491 != -1)
        dispatch_once(&setWiFiAWDLDevice__defaultOnce_491, &v17);
      if (setWiFiAWDLDevice__classDebugEnabled_492)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: Was passed an invalid wifi awdl device reference"), v17, v18, v19, v20, v21);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent setWiFiAWDLDevice:]");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v15, v16, 2276);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        goto LABEL_17;
      }
    }
  }
}

uint64_t __33__PLWifiAgent_setWiFiAWDLDevice___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  setWiFiAWDLDevice__classDebugEnabled = result;
  return result;
}

uint64_t __33__PLWifiAgent_setWiFiAWDLDevice___block_invoke_493(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  setWiFiAWDLDevice__classDebugEnabled_492 = result;
  return result;
}

- (void)setWifiDevice:(__WiFiDeviceClient *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];

  if (-[PLWifiAgent wifiDevice](self, "wifiDevice") != a3)
  {
    if (-[PLWifiAgent wifiDevice](self, "wifiDevice"))
    {
      -[PLWifiAgent wifiDevice](self, "wifiDevice");
      WiFiDeviceClientRegisterPowerCallback();
      -[PLWifiAgent wifiDevice](self, "wifiDevice");
      WiFiDeviceClientRegisterExtendedLinkCallback();
      -[PLWifiAgent wifiDevice](self, "wifiDevice");
      WiFiDeviceClientRegisterDeviceAvailableCallback();
      -[PLWifiAgent wifiDevice](self, "wifiDevice");
      WiFiDeviceClientRegisterScanUpdateCallback();
      if (-[PLWifiAgent wifiManager](self, "wifiManager"))
      {
        -[PLWifiAgent wifiManager](self, "wifiManager");
        WiFiManagerClientRegisterUserAutoJoinStateChangedCallback();
      }
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
      {
        -[PLWifiAgent wifiDevice](self, "wifiDevice");
        WiFiDeviceClientRegisterLQMCallback();
      }
    }
    self->_wifiDevice = a3;
    if (-[PLWifiAgent wifiDevice](self, "wifiDevice"))
    {
      -[PLWifiAgent wifiDevice](self, "wifiDevice");
      WiFiDeviceClientRegisterPowerCallback();
      -[PLWifiAgent wifiDevice](self, "wifiDevice");
      WiFiDeviceClientRegisterExtendedLinkCallback();
      -[PLWifiAgent wifiDevice](self, "wifiDevice");
      WiFiDeviceClientRegisterDeviceAvailableCallback();
      if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode") & 1) != 0
        || objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
      {
        -[PLWifiAgent wifiDevice](self, "wifiDevice");
        WiFiDeviceClientRegisterScanUpdateCallback();
      }
      if (-[PLWifiAgent wifiManager](self, "wifiManager"))
      {
        -[PLWifiAgent wifiManager](self, "wifiManager");
        WiFiManagerClientRegisterUserAutoJoinStateChangedCallback();
      }
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
      {
        -[PLWifiAgent wifiDevice](self, "wifiDevice");
        WiFiDeviceClientRegisterLQMCallback();
      }
      -[PLWifiAgent logEventForwardModuleInfo](self, "logEventForwardModuleInfo");
    }
    else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v5 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __29__PLWifiAgent_setWifiDevice___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v5;
      if (setWifiDevice__defaultOnce != -1)
        dispatch_once(&setWifiDevice__defaultOnce, block);
      if (setWifiDevice__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: Was passed an invalid wifi device reference"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent setWifiDevice:]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 2333);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
  }
}

uint64_t __29__PLWifiAgent_setWifiDevice___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  setWifiDevice__classDebugEnabled = result;
  return result;
}

- (void)findWifiDevice
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  unint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD block[5];
  _QWORD v56[5];
  _QWORD v57[5];
  uint8_t buf[4];
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0D7F000uLL;
  if (!-[PLWifiAgent wifiManager](self, "wifiManager"))
  {
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_58;
    v46 = objc_opt_class();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __29__PLWifiAgent_findWifiDevice__block_invoke_522;
    v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v52[4] = v46;
    if (findWifiDevice_defaultOnce_520 != -1)
      dispatch_once(&findWifiDevice_defaultOnce_520, v52);
    if (!findWifiDevice_classDebugEnabled_521)
    {
LABEL_58:
      v13 = 0;
      goto LABEL_59;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: No wifi manager set--this method should not be getting called"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "lastPathComponent");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent findWifiDevice]");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "logMessage:fromFile:fromFunction:fromLineNumber:", v40, v49, v50, 2393);

    PLLogCommon();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    v13 = 0;
    goto LABEL_57;
  }
  -[PLWifiAgent wifiManager](self, "wifiManager");
  v4 = (void *)WiFiManagerClientCopyDevices();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    -[PLWifiAgent setWifiDevice:](self, "setWifiDevice:", objc_msgSend(v5, "objectAtIndex:", 0));
  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __29__PLWifiAgent_findWifiDevice__block_invoke;
    v57[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v57[4] = v6;
    if (findWifiDevice_defaultOnce != -1)
      dispatch_once(&findWifiDevice_defaultOnce, v57);
    if (findWifiDevice_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: No wifi devices found"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent findWifiDevice]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 2350);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  -[PLWifiAgent wifiManager](self, "wifiManager");
  v13 = (void *)WiFiManagerClientCopyInterfaces();

  if (v13 && objc_msgSend(v13, "count"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v14 = objc_opt_class();
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __29__PLWifiAgent_findWifiDevice__block_invoke_502;
      v56[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v56[4] = v14;
      if (findWifiDevice_defaultOnce_500 != -1)
        dispatch_once(&findWifiDevice_defaultOnce_500, v56);
      if (findWifiDevice_classDebugEnabled_501)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: wifi devices found count: %lu"), objc_msgSend(v13, "count"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent findWifiDevice]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 2358);

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    if (objc_msgSend(v13, "count"))
    {
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v51 = v13;
      do
      {
        v24 = objc_msgSend(v13, "objectAtIndex:", v21);
        if (WiFiDeviceClientIsInterfaceAWDL())
        {
          if (objc_msgSend(*(id *)(v3 + 4000), "debugEnabled"))
          {
            v25 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __29__PLWifiAgent_findWifiDevice__block_invoke_507;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v25;
            if (findWifiDevice_defaultOnce_505 != -1)
              dispatch_once(&findWifiDevice_defaultOnce_505, block);
            if (findWifiDevice_classDebugEnabled_506)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: wifi devices found: %@"), WiFiDeviceClientGetInterfaceName());
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "lastPathComponent");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent findWifiDevice]");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v29, v30, 2366);

              PLLogCommon();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v59 = v26;
                _os_log_debug_impl(&dword_1DA9D6000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v3 = 0x1E0D7F000uLL;
              v13 = v51;
            }
          }
          -[PLWifiAgent setWiFiAWDLDevice:](self, "setWiFiAWDLDevice:", v24);
          v22 = 1;
        }
        if (WiFiDeviceClientIsInterfaceHostAp())
        {
          if (objc_msgSend(*(id *)(v3 + 4000), "debugEnabled"))
          {
            v32 = objc_opt_class();
            v54[0] = MEMORY[0x1E0C809B0];
            v54[1] = 3221225472;
            v54[2] = __29__PLWifiAgent_findWifiDevice__block_invoke_512;
            v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v54[4] = v32;
            if (findWifiDevice_defaultOnce_510 != -1)
              dispatch_once(&findWifiDevice_defaultOnce_510, v54);
            if (findWifiDevice_classDebugEnabled_511)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: wifi hs devices found: %@"), WiFiDeviceClientGetInterfaceName());
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "lastPathComponent");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent findWifiDevice]");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v36, v37, 2374);

              PLLogCommon();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v59 = v33;
                _os_log_debug_impl(&dword_1DA9D6000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v3 = 0x1E0D7F000;
              v13 = v51;
            }
          }
          -[PLWifiAgent setWiFiHotspotDevice:](self, "setWiFiHotspotDevice:", v24);
          v23 = 1;
        }
        if ((v22 & v23 & 1) != 0)
          break;
        ++v21;
      }
      while (objc_msgSend(v13, "count") > v21);
    }
    goto LABEL_59;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v39 = objc_opt_class();
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __29__PLWifiAgent_findWifiDevice__block_invoke_517;
    v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v53[4] = v39;
    if (findWifiDevice_defaultOnce_515 != -1)
      dispatch_once(&findWifiDevice_defaultOnce_515, v53);
    if (findWifiDevice_classDebugEnabled_516)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: No wifi interfaces found"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "lastPathComponent");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent findWifiDevice]");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "logMessage:fromFile:fromFunction:fromLineNumber:", v40, v43, v44, 2389);

      PLLogCommon();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
LABEL_57:

    }
  }
LABEL_59:

}

uint64_t __29__PLWifiAgent_findWifiDevice__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  findWifiDevice_classDebugEnabled = result;
  return result;
}

uint64_t __29__PLWifiAgent_findWifiDevice__block_invoke_502(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  findWifiDevice_classDebugEnabled_501 = result;
  return result;
}

uint64_t __29__PLWifiAgent_findWifiDevice__block_invoke_507(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  findWifiDevice_classDebugEnabled_506 = result;
  return result;
}

uint64_t __29__PLWifiAgent_findWifiDevice__block_invoke_512(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  findWifiDevice_classDebugEnabled_511 = result;
  return result;
}

uint64_t __29__PLWifiAgent_findWifiDevice__block_invoke_517(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  findWifiDevice_classDebugEnabled_516 = result;
  return result;
}

uint64_t __29__PLWifiAgent_findWifiDevice__block_invoke_522(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  findWifiDevice_classDebugEnabled_521 = result;
  return result;
}

- (PLWifiAgent)init
{
  PLWifiAgent *v2;
  PLWifiAgent *v3;
  NSString *wifiChipset;
  NSString *wifiManufacturer;
  id v6;
  PLWifiAgent *v7;
  void *v8;
  _QWORD v10[4];
  PLWifiAgent *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PLWifiAgent;
  v2 = -[PLAgent init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lastLoggedTimestamp = 0;
    v2->_autoJoinScanDuration = 0;
    v2->_locationScanDuration = 0;
    v2->_pipelineScanDuration = 0;
    v2->_setupScanDuration = 0;
    v2->_unknownScanDuration = 0;
    wifiChipset = v2->_wifiChipset;
    v2->_wifiChipset = 0;

    wifiManufacturer = v3->_wifiManufacturer;
    v3->_wifiManufacturer = 0;

    v3->_remainingAllowedRSSIEntryCount = 0;
    v6 = objc_alloc(MEMORY[0x1E0D7FFC8]);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __19__PLWifiAgent_init__block_invoke;
    v10[3] = &unk_1EA16D158;
    v7 = v3;
    v11 = v7;
    v8 = (void *)objc_msgSend(v6, "initWithOperator:forEntryKey:withBlock:", v7, CFSTR("ApplicationMetrics_RemoteControlSession_1_2"), v10);
    -[PLWifiAgent setRemoteSessionCallback:](v7, "setRemoteSessionCallback:", v8);

  }
  return v3;
}

uint64_t __19__PLWifiAgent_init__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleRemoteSessionCallbackWithUserInfo:", a2);
  return result;
}

- (void)initOperatorDependancies
{
  id v3;
  uint64_t v4;
  PLCFNotificationOperatorComposition *v5;
  PLCFNotificationOperatorComposition *notificationWiFiChanged;
  id v7;
  void *v8;
  void *v9;
  PLEntryNotificationOperatorComposition *v10;
  PLEntryNotificationOperatorComposition *batteryLevelChanged;
  PLEntryNotificationOperatorComposition *v12;
  PLEntryNotificationOperatorComposition *sbcLevelChanged;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  PLNSNotificationOperatorComposition *v21;
  PLNSNotificationOperatorComposition *thermalMonitorListener;
  PLXPCListenerOperatorComposition *v23;
  PLXPCListenerOperatorComposition *remoteControlSessionListener;
  WiFiP2PAWDLStateMonitor *v25;
  WiFiP2PAWDLStateMonitor *monitor;
  _QWORD v27[5];
  _QWORD block[11];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[2];
  _QWORD v34[2];
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  -[PLWifiAgent setWifiManager:](self, "setWifiManager:", WiFiManagerClientCreate());
  v3 = objc_alloc(MEMORY[0x1E0D7FF80]);
  v4 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __39__PLWifiAgent_initOperatorDependancies__block_invoke;
  v32[3] = &unk_1EA16D158;
  v32[4] = self;
  v5 = (PLCFNotificationOperatorComposition *)objc_msgSend(v3, "initWithOperator:forNotification:requireState:withBlock:", self, CFSTR("com.apple.airport.userNotification"), 1, v32);
  notificationWiFiChanged = self->_notificationWiFiChanged;
  self->_notificationWiFiChanged = v5;

  if (-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
  {
    v7 = objc_alloc(MEMORY[0x1E0D7FFC8]);
    v33[0] = &unk_1EA1C0938;
    v33[1] = &unk_1EA1C0950;
    v34[0] = &unk_1EA1DAA88;
    v34[1] = &unk_1EA1C0968;
    v35 = CFSTR("Level");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v4;
    v31[1] = 3221225472;
    v31[2] = __39__PLWifiAgent_initOperatorDependancies__block_invoke_545;
    v31[3] = &unk_1EA16D158;
    v31[4] = self;
    v10 = (PLEntryNotificationOperatorComposition *)objc_msgSend(v7, "initWithOperator:forEntryKey:withFilter:withBlock:", self, CFSTR("PLBatteryAgent_EventBackward_Battery"), v9, v31);
    batteryLevelChanged = self->_batteryLevelChanged;
    self->_batteryLevelChanged = v10;

  }
  v30[0] = v4;
  v30[1] = 3221225472;
  v30[2] = __39__PLWifiAgent_initOperatorDependancies__block_invoke_2_546;
  v30[3] = &unk_1EA16D158;
  v30[4] = self;
  objc_msgSend(MEMORY[0x1E0D7FFC8], "significantBatteryChangeNotificationWithOperator:withBlock:", self, v30);
  v12 = (PLEntryNotificationOperatorComposition *)objc_claimAutoreleasedReturnValue();
  sbcLevelChanged = self->_sbcLevelChanged;
  self->_sbcLevelChanged = v12;

  v29[0] = v4;
  v29[1] = 3221225472;
  v29[2] = __39__PLWifiAgent_initOperatorDependancies__block_invoke_551;
  v29[3] = &unk_1EA16D158;
  v29[4] = self;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFC8]), "initWithOperator:forEntryKey:withBlock:", self, CFSTR("PLSleepWakeAgent_EventForward_PowerState"), v29);
  -[PLWifiAgent setDeviceWake:](self, "setDeviceWake:", v14);
  block[5] = v4;
  block[6] = 3221225472;
  block[7] = __39__PLWifiAgent_initOperatorDependancies__block_invoke_557;
  block[8] = &unk_1EA16D9E8;
  block[9] = self;
  block[10] = 0;
  if (!tcp_connection_fallback_watcher_create() && objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __39__PLWifiAgent_initOperatorDependancies__block_invoke_558;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (initOperatorDependancies_defaultOnce_0 != -1)
      dispatch_once(&initOperatorDependancies_defaultOnce_0, block);
    if (initOperatorDependancies_classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to create cell fallback observer"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent initOperatorDependancies]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 2548);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  v21 = (PLNSNotificationOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80010]), "initWithOperator:forNotification:withBlock:", self, CFSTR("PLThermalMonitorNotification"), &__block_literal_global_565_0);
  thermalMonitorListener = self->_thermalMonitorListener;
  self->_thermalMonitorListener = v21;

  v27[0] = v4;
  v27[1] = 3221225472;
  v27[2] = __39__PLWifiAgent_initOperatorDependancies__block_invoke_573;
  v27[3] = &unk_1EA16CF18;
  v27[4] = self;
  v23 = (PLXPCListenerOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D8328, v27);
  remoteControlSessionListener = self->_remoteControlSessionListener;
  self->_remoteControlSessionListener = v23;

  if (-[PLWifiAgent hasWiFi](self, "hasWiFi"))
  {
    v25 = (WiFiP2PAWDLStateMonitor *)objc_alloc_init(MEMORY[0x1E0DD9A00]);
    monitor = self->_monitor;
    self->_monitor = v25;

  }
}

void __39__PLWifiAgent_initOperatorDependancies__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__PLWifiAgent_initOperatorDependancies__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (kPLWifiAgentEventForwardWifiAssist_block_invoke_defaultOnce != -1)
      dispatch_once(&kPLWifiAgentEventForwardWifiAssist_block_invoke_defaultOnce, block);
    if (kPLWifiAgentEventForwardWifiAssist_block_invoke_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wifi Application Key Logger: %@ = %@"), v5, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent initOperatorDependancies]_block_invoke");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 2478);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

uint64_t __39__PLWifiAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLWifiAgentEventForwardWifiAssist_block_invoke_classDebugEnabled = result;
  return result;
}

uint64_t __39__PLWifiAgent_initOperatorDependancies__block_invoke_545(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "log");
  result = objc_msgSend(MEMORY[0x1E0D80020], "isHomePod");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "writeModeledPower");
  return result;
}

uint64_t __39__PLWifiAgent_initOperatorDependancies__block_invoke_2_546(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t result;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "setRemainingAllowedRSSIEntryCount:", 3);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__PLWifiAgent_initOperatorDependancies__block_invoke_3;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (kPLWifiAgentEventForwardWifiAssist_block_invoke_2_defaultOnce != -1)
      dispatch_once(&kPLWifiAgentEventForwardWifiAssist_block_invoke_2_defaultOnce, block);
    if (kPLWifiAgentEventForwardWifiAssist_block_invoke_2_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Logging on mac"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent initOperatorDependancies]_block_invoke_2");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 2497);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "log");
  result = objc_msgSend(MEMORY[0x1E0D80020], "isHomePod");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "writeModeledPower");
  return result;
}

uint64_t __39__PLWifiAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLWifiAgentEventForwardWifiAssist_block_invoke_2_classDebugEnabled = result;
  return result;
}

void __39__PLWifiAgent_initOperatorDependancies__block_invoke_551(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];

  if (a2)
  {
    objc_msgSend(a2, "objectForKey:", CFSTR("entry"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Reason"));

    }
    else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v4 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39__PLWifiAgent_initOperatorDependancies__block_invoke_2_554;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (kPLWifiAgentEventForwardWifiAssist_block_invoke_3_defaultOnce != -1)
        dispatch_once(&kPLWifiAgentEventForwardWifiAssist_block_invoke_3_defaultOnce, block);
      if (kPLWifiAgentEventForwardWifiAssist_block_invoke_3_classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: No entry object associated with SleepWake entry"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent initOperatorDependancies]_block_invoke");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 2511);

        PLLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }

  }
}

uint64_t __39__PLWifiAgent_initOperatorDependancies__block_invoke_2_554(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLWifiAgentEventForwardWifiAssist_block_invoke_3_classDebugEnabled = result;
  return result;
}

void __39__PLWifiAgent_initOperatorDependancies__block_invoke_557(uint64_t a1)
{
  NSObject *v1;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "logEventForwardWifiAssist:", tcp_fallback_watcher_fallback_inuse());
  }
  else
  {
    PLLogCommon();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __39__PLWifiAgent_initOperatorDependancies__block_invoke_557_cold_1();

  }
}

uint64_t __39__PLWifiAgent_initOperatorDependancies__block_invoke_558(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  initOperatorDependancies_classDebugEnabled_0 = result;
  return result;
}

void __39__PLWifiAgent_initOperatorDependancies__block_invoke_564(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __41__PLCameraAgent_initOperatorDependancies__block_invoke_121_cold_1();

}

void __39__PLWifiAgent_initOperatorDependancies__block_invoke_573(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogWifi();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __39__PLWifiAgent_initOperatorDependancies__block_invoke_573_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventPointRemoteControlSession:", v6);
}

- (BOOL)isWiFiPowered
{
  _BOOL4 v3;

  v3 = -[PLWifiAgent hasWiFi](self, "hasWiFi");
  if (v3)
  {
    -[PLWifiAgent wifiDevice](self, "wifiDevice");
    LOBYTE(v3) = WiFiDeviceClientGetPower() != 0;
  }
  return v3;
}

- (BOOL)hasWiFi
{
  __WiFiManagerClient *v3;

  v3 = -[PLWifiAgent wifiManager](self, "wifiManager");
  if (v3)
    LOBYTE(v3) = -[PLWifiAgent wifiDevice](self, "wifiDevice") != 0;
  return (char)v3;
}

- (BOOL)isWowSupported
{
  _BOOL4 v3;

  v3 = -[PLWifiAgent hasWiFi](self, "hasWiFi");
  if (v3)
  {
    -[PLWifiAgent wifiManager](self, "wifiManager");
    LOBYTE(v3) = WiFiManagerClientGetWoWCapability() != 0;
  }
  return v3;
}

- (BOOL)isWowEnabled
{
  _BOOL4 v3;

  v3 = -[PLWifiAgent isWowSupported](self, "isWowSupported");
  if (v3)
  {
    -[PLWifiAgent wifiManager](self, "wifiManager");
    LOBYTE(v3) = WiFiManagerClientGetWoWState() != 0;
  }
  return v3;
}

- (unint64_t)getCurrentChannelWidth:(__WiFiNetwork *)a3
{
  const __CFNumber *Property;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int valuePtr;
  _QWORD block[5];

  Property = (const __CFNumber *)WiFiNetworkGetProperty();
  if (Property)
  {
    valuePtr = 0;
    CFNumberGetValue(Property, kCFNumberSInt32Type, &valuePtr);
    if ((valuePtr & 2) != 0)
    {
      return 20;
    }
    else
    {
      v4 = 80;
      v5 = 10;
      v6 = 160;
      if ((valuePtr & 0x800) == 0)
        v6 = 0;
      if ((valuePtr & 1) == 0)
        v5 = v6;
      if ((valuePtr & 0x400) == 0)
        v4 = v5;
      if ((valuePtr & 4) != 0)
        return 40;
      else
        return v4;
    }
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v8 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__PLWifiAgent_getCurrentChannelWidth___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v8;
      if (getCurrentChannelWidth__defaultOnce != -1)
        dispatch_once(&getCurrentChannelWidth__defaultOnce, block);
      if (getCurrentChannelWidth__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("channel width flag is null"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent getCurrentChannelWidth:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 2645);

        PLLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    return 0;
  }
}

uint64_t __38__PLWifiAgent_getCurrentChannelWidth___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getCurrentChannelWidth__classDebugEnabled = result;
  return result;
}

- (id)decodeWifiEventLinkReason:(unsigned int)a3
{
  if (a3 - 1 < 4)
    return off_1EA16FAC8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("other(%u)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)isNonUDMMac
{
  return 0;
}

- (void)logFromWiFiNoAvailableCallback:(id)a3 withAvailability:(BOOL)a4 withWakeParams:(id)a5
{
  _BOOL4 v5;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  _QWORD block[5];
  id v19;
  BOOL v20;
  _QWORD v21[5];

  v5 = a4;
  v7 = a5;
  v8 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __78__PLWifiAgent_logFromWiFiNoAvailableCallback_withAvailability_withWakeParams___block_invoke;
    v21[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v21[4] = objc_opt_class();
    if (logFromWiFiNoAvailableCallback_withAvailability_withWakeParams__defaultOnce != -1)
      dispatch_once(&logFromWiFiNoAvailableCallback_withAvailability_withWakeParams__defaultOnce, v21);
    if (logFromWiFiNoAvailableCallback_withAvailability_withWakeParams__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("before dispatch WiFi availability= %d: , wakeparams=%@"), v5, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logFromWiFiNoAvailableCallback:withAvailability:withWakeParams:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 2711);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  -[PLOperator workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __78__PLWifiAgent_logFromWiFiNoAvailableCallback_withAvailability_withWakeParams___block_invoke_592;
  block[3] = &unk_1EA16FA80;
  v20 = v5;
  block[4] = self;
  v19 = v7;
  v17 = v7;
  dispatch_async(v16, block);

}

uint64_t __78__PLWifiAgent_logFromWiFiNoAvailableCallback_withAvailability_withWakeParams___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logFromWiFiNoAvailableCallback_withAvailability_withWakeParams__classDebugEnabled = result;
  return result;
}

void __78__PLWifiAgent_logFromWiFiNoAvailableCallback_withAvailability_withWakeParams___block_invoke_592(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1DF0A47AC]();
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "logEventBackwardWifiProperties:", 1);
    if (*(_QWORD *)(a1 + 40))
      objc_msgSend(*(id *)(a1 + 32), "logEventPointWake:");
  }
  objc_autoreleasePoolPop(v2);
}

- (void)logFromLinkChangeCallback:(id)a3 withStats:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[PLOperator workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PLWifiAgent_logFromLinkChangeCallback_withStats___block_invoke;
  block[3] = &unk_1EA16DCE0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __51__PLWifiAgent_logFromLinkChangeCallback_withStats___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[5];
  _QWORD block[5];

  v2 = (void *)MEMORY[0x1DF0A47AC]();
  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PLWifiAgent_logFromLinkChangeCallback_withStats___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (kPLWifiAgentEventForwardWifiAssist_block_invoke_4_defaultOnce != -1)
      dispatch_once(&kPLWifiAgentEventForwardWifiAssist_block_invoke_4_defaultOnce, block);
    if (kPLWifiAgentEventForwardWifiAssist_block_invoke_4_classDebugEnabled)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "className");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ got CFCallback %@"), v6, *(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logFromLinkChangeCallback:withStats:]_block_invoke");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 2728);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v19[0] = v4;
    v19[1] = 3221225472;
    v19[2] = __51__PLWifiAgent_logFromLinkChangeCallback_withStats___block_invoke_597;
    v19[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v19[4] = objc_opt_class();
    if (kPLWifiAgentEventForwardWifiAssist_block_invoke_4_defaultOnce_595 != -1)
      dispatch_once(&kPLWifiAgentEventForwardWifiAssist_block_invoke_4_defaultOnce_595, v19);
    if (kPLWifiAgentEventForwardWifiAssist_block_invoke_4_classDebugEnabled_596)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("link change dic: %@"), *(_QWORD *)(a1 + 48));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logFromLinkChangeCallback:withStats:]_block_invoke_2");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 2729);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "log");
  objc_autoreleasePoolPop(v2);
}

uint64_t __51__PLWifiAgent_logFromLinkChangeCallback_withStats___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLWifiAgentEventForwardWifiAssist_block_invoke_4_classDebugEnabled = result;
  return result;
}

uint64_t __51__PLWifiAgent_logFromLinkChangeCallback_withStats___block_invoke_597(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLWifiAgentEventForwardWifiAssist_block_invoke_4_classDebugEnabled_596 = result;
  return result;
}

- (void)logFromAJCallback:(id)a3 withFlag:(unsigned __int8)a4 withStats:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned __int8 v16;

  v8 = a3;
  v9 = a5;
  -[PLOperator workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__PLWifiAgent_logFromAJCallback_withFlag_withStats___block_invoke;
  v13[3] = &unk_1EA16EA30;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __52__PLWifiAgent_logFromAJCallback_withFlag_withStats___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];

  v2 = (void *)MEMORY[0x1DF0A47AC]();
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__PLWifiAgent_logFromAJCallback_withFlag_withStats___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (kPLWifiAgentEventForwardWifiAssist_block_invoke_5_defaultOnce != -1)
      dispatch_once(&kPLWifiAgentEventForwardWifiAssist_block_invoke_5_defaultOnce, block);
    if (kPLWifiAgentEventForwardWifiAssist_block_invoke_5_classDebugEnabled)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "className");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ got AJCallback %@"), v5, *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logFromAJCallback:withFlag:withStats:]_block_invoke");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 2757);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventPointJoin:withStats:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  objc_autoreleasePoolPop(v2);
}

uint64_t __52__PLWifiAgent_logFromAJCallback_withFlag_withStats___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLWifiAgentEventForwardWifiAssist_block_invoke_5_classDebugEnabled = result;
  return result;
}

- (void)log
{
  -[PLWifiAgent logEventBackwardWifiProperties:](self, "logEventBackwardWifiProperties:", 1);
  -[PLWifiAgent logEventBackwardUserScanDuration](self, "logEventBackwardUserScanDuration");
  -[PLWifiAgent logEventPointAWDLServicesAndPorts](self, "logEventPointAWDLServicesAndPorts");
}

- (void)logEventPointWake:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  _QWORD v87[5];
  _QWORD v88[5];
  _QWORD v89[5];
  _QWORD v90[5];
  _QWORD v91[5];
  _QWORD block[6];

  v4 = a3;
  if (-[PLWifiAgent hasWiFi](self, "hasWiFi"))
  {
    if (v4)
    {
      v5 = v4;
      goto LABEL_11;
    }
    -[PLWifiAgent wifiDevice](self, "wifiDevice");
    v5 = (id)WiFiDeviceClientCopyProperty();
    if (v5)
    {
LABEL_11:
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v12 = objc_opt_class();
        v90[0] = MEMORY[0x1E0C809B0];
        v90[1] = 3221225472;
        v90[2] = __33__PLWifiAgent_logEventPointWake___block_invoke_614;
        v90[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v90[4] = v12;
        if (logEventPointWake__defaultOnce_612 != -1)
          dispatch_once(&logEventPointWake__defaultOnce_612, v90);
        if (logEventPointWake__classDebugEnabled_613)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wake params = %@"), v5);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lastPathComponent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventPointWake:]");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 2800);

          PLLogCommon();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      objc_msgSend(v5, "objectForCFString:", CFSTR("IO80211InterfaceWoWWakeUpCommand"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForCFString:", CFSTR("IO80211InterfaceWoWWakeUpData"));
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("IO80211InterfaceWoWWakeUpTCPKAWakeReason"));
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForCFString:", CFSTR("IO80211InterfaceWoWWakeUpTimeStamp"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v24 = v23;

      v25 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "convertFromSystemToMonotonic");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "timeIntervalSince1970");
      objc_msgSend(v25, "numberWithDouble:");
      v28 = objc_claimAutoreleasedReturnValue();

      +[PLOperator entryKeyForType:andName:](PLWifiAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("Wake"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v29);
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v19, CFSTR("WakeReason"));
      v84 = (void *)v28;
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v28, CFSTR("WakeTime"));
      v85 = (void *)v21;
      v31 = v21;
      v11 = v20;
      objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, CFSTR("TCPKAWakeReason"));
      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[NSObject length](v20, "length"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, CFSTR("WakeLen"));

      }
      if (!objc_msgSend(v19, "isEqualToString:", CFSTR("DataFrame")))
      {
        if (objc_msgSend(v19, "isEqualToString:", CFSTR("E_PFN_NET_FOUND")))
        {
          -[PLWifiAgent logEventPointWakePNO:withParams:toEntry:](self, "logEventPointWakePNO:withParams:toEntry:", v20, v5, v30);
LABEL_42:
          -[PLOperator logEntry:](self, "logEntry:", v30);

LABEL_43:
          goto LABEL_44;
        }
        if (objc_msgSend(v19, "isEqualToString:", CFSTR("E_LINK")))
        {
          -[PLWifiAgent logEventPointWakeLink:withParams:toEntry:](self, "logEventPointWakeLink:withParams:toEntry:", v20, v5, v30);
          goto LABEL_42;
        }
        if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          goto LABEL_42;
        v71 = objc_opt_class();
        v87[0] = MEMORY[0x1E0C809B0];
        v87[1] = 3221225472;
        v87[2] = __33__PLWifiAgent_logEventPointWake___block_invoke_661;
        v87[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v87[4] = v71;
        if (logEventPointWake__defaultOnce_659 != -1)
          dispatch_once(&logEventPointWake__defaultOnce_659, v87);
        if (!logEventPointWake__classDebugEnabled_660)
          goto LABEL_42;
        v78 = v29;
        v81 = v19;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: unrecognized wake reason: %@"), v19);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "lastPathComponent");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventPointWake:]");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "logMessage:fromFile:fromFunction:fromLineNumber:", v72, v75, v76, 2849);

        PLLogCommon();
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        v19 = v81;
LABEL_41:
        v29 = v78;
        goto LABEL_42;
      }
      v78 = v29;
      -[PLWifiAgent logEventPointWakeDataFrame:withParams:toEntry:](self, "logEventPointWakeDataFrame:withParams:toEntry:", v20, v5, v30);
      objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("tcp_dest_port"));
      v33 = objc_claimAutoreleasedReturnValue();
      v79 = v4;
      v80 = v19;
      if (v33
        && (v34 = (void *)v33,
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("tcp_source_port")),
            v35 = (void *)objc_claimAutoreleasedReturnValue(),
            v35,
            v34,
            v35))
      {
        v36 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("tcp_dest_port"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "numberWithInteger:", objc_msgSend(v37, "integerValue"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = (void *)MEMORY[0x1E0CB37E8];
        v39 = CFSTR("tcp_source_port");
      }
      else
      {
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("udp_dest_port"));
        v40 = objc_claimAutoreleasedReturnValue();
        if (!v40
          || (v41 = (void *)v40,
              objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("udp_source_port")),
              v42 = (void *)objc_claimAutoreleasedReturnValue(),
              v42,
              v41,
              !v42))
        {
          if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v46 = 0;
            v82 = 0;
            goto LABEL_31;
          }
          v61 = objc_opt_class();
          v89[0] = MEMORY[0x1E0C809B0];
          v89[1] = 3221225472;
          v89[2] = __33__PLWifiAgent_logEventPointWake___block_invoke_640;
          v89[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v89[4] = v61;
          if (logEventPointWake__defaultOnce_638 != -1)
            dispatch_once(&logEventPointWake__defaultOnce_638, v89);
          if (!logEventPointWake__classDebugEnabled_639)
          {
            v46 = 0;
            v82 = 0;
            goto LABEL_31;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: unsupported network protocol"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "lastPathComponent");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventPointWake:]");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "logMessage:fromFile:fromFunction:fromLineNumber:", v45, v63, v64, 2828);

          PLLogCommon();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

          v46 = 0;
          v82 = 0;
LABEL_30:

LABEL_31:
          +[PLProcessPortMap sharedInstance](PLProcessPortMap, "sharedInstance");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("ip_destination"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("ip_source"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("ip_protocol"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:", v48, v82, v49, v46, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          v4 = v79;
          v19 = v80;
          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v52 = objc_opt_class();
            v88[0] = MEMORY[0x1E0C809B0];
            v88[1] = 3221225472;
            v88[2] = __33__PLWifiAgent_logEventPointWake___block_invoke_652;
            v88[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v88[4] = v52;
            if (logEventPointWake__defaultOnce_650 != -1)
              dispatch_once(&logEventPointWake__defaultOnce_650, v88);
            if (logEventPointWake__classDebugEnabled_651)
            {
              v86 = v5;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pidAndProcessName=%@"), v51);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "lastPathComponent");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventPointWake:]");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "logMessage:fromFile:fromFunction:fromLineNumber:", v53, v56, v57, 2837);

              PLLogCommon();
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

              v4 = v79;
              v19 = v80;
              v5 = v86;
            }
          }
          if (v51)
          {
            objc_msgSend(v51, "pid");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v59, CFSTR("PID"));

            objc_msgSend(v51, "processName");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v60, CFSTR("ProcessName"));

          }
          goto LABEL_41;
        }
        v43 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("udp_dest_port"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "numberWithInteger:", objc_msgSend(v44, "integerValue"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = (void *)MEMORY[0x1E0CB37E8];
        v39 = CFSTR("udp_source_port");
      }
      objc_msgSend(v30, "objectForKeyedSubscript:", v39);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "numberWithInteger:", objc_msgSend(v45, "integerValue"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v66 = objc_opt_class();
      v91[0] = MEMORY[0x1E0C809B0];
      v91[1] = 3221225472;
      v91[2] = __33__PLWifiAgent_logEventPointWake___block_invoke_609;
      v91[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v91[4] = v66;
      if (logEventPointWake__defaultOnce_607 != -1)
        dispatch_once(&logEventPointWake__defaultOnce_607, v91);
      if (logEventPointWake__classDebugEnabled_608)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: woke up for wlan but WoW wakeup parameters dictionary returned nil"));
        v5 = (id)objc_claimAutoreleasedReturnValue();
        v67 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "lastPathComponent");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventPointWake:]");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v69, v70, 2798);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        goto LABEL_43;
      }
    }
  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__PLWifiAgent_logEventPointWake___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (logEventPointWake__defaultOnce != -1)
      dispatch_once(&logEventPointWake__defaultOnce, block);
    if (logEventPointWake__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No wifi to log power properties about"));
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventPointWake:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v9, v10, 2784);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      goto LABEL_43;
    }
  }
LABEL_44:

}

uint64_t __33__PLWifiAgent_logEventPointWake___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointWake__classDebugEnabled = result;
  return result;
}

uint64_t __33__PLWifiAgent_logEventPointWake___block_invoke_609(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointWake__classDebugEnabled_608 = result;
  return result;
}

uint64_t __33__PLWifiAgent_logEventPointWake___block_invoke_614(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointWake__classDebugEnabled_613 = result;
  return result;
}

uint64_t __33__PLWifiAgent_logEventPointWake___block_invoke_640(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointWake__classDebugEnabled_639 = result;
  return result;
}

uint64_t __33__PLWifiAgent_logEventPointWake___block_invoke_652(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointWake__classDebugEnabled_651 = result;
  return result;
}

uint64_t __33__PLWifiAgent_logEventPointWake___block_invoke_661(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointWake__classDebugEnabled_660 = result;
  return result;
}

- (void)logEventPointWakeDataFrame:(id)a3 withParams:(id)a4 toEntry:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
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
  void *v46;
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
  NSObject *v62;
  NSObject *v63;
  void *v64;
  const __CFString *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _QWORD v85[5];
  _QWORD v86[5];
  _QWORD v87[5];
  _QWORD block[5];
  _BYTE v89[12];
  unsigned __int16 v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  if ((unint64_t)objc_msgSend(v6, "length") > 0xE)
  {
    objc_msgSend(v6, "getBytes:length:", v89, 14);
    objc_msgSend(v6, "subdataWithRange:", 14, objc_msgSend(v6, "length") - 14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02x:%02x:%02x:%02x:%02x:%02x;"),
      v89[0],
      v89[1],
      v89[2],
      v89[3],
      v89[4],
      v89[5]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02x:%02x:%02x:%02x:%02x:%02x;"),
      v89[6],
      v89[7],
      v89[8],
      v89[9],
      v89[10],
      v89[11]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80018], "decodeEtherType:", bswap32(v90) >> 16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("RemoteMAC"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("LocalMAC"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("EtherType"));
    if ((objc_msgSend(v18, "isEqualToString:", CFSTR("IPv4")) & 1) != 0
      || objc_msgSend(v18, "isEqualToString:", CFSTR("IPv6")))
    {
      objc_msgSend(MEMORY[0x1E0D80018], "decodeIPPacket:encryptedPath:", v15, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
      if (v19)
      {
        v83 = v15;
        v84 = v16;
        if (v20)
        {
          v21 = objc_opt_class();
          v86[0] = MEMORY[0x1E0C809B0];
          v86[1] = 3221225472;
          v86[2] = __61__PLWifiAgent_logEventPointWakeDataFrame_withParams_toEntry___block_invoke_686;
          v86[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v86[4] = v21;
          if (logEventPointWakeDataFrame_withParams_toEntry__defaultOnce_684 != -1)
            dispatch_once(&logEventPointWakeDataFrame_withParams_toEntry__defaultOnce_684, v86);
          if (logEventPointWakeDataFrame_withParams_toEntry__classDebugEnabled_685)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Dictionary for IP: %@"), v19);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "lastPathComponent");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventPointWakeDataFrame:withParams:toEntry:]");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 2887);

            PLLogCommon();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

          }
        }
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("destination"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, CFSTR("ip_destination"));

        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("source"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, CFSTR("ip_source"));

        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("protocol"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v30, CFSTR("ip_protocol"));

        v31 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("version"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringWithFormat:", CFSTR("%@"), v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v33, CFSTR("ip_version"));

        v34 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("seqNo"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "numberWithUnsignedInt:", objc_msgSend(v35, "unsignedIntValue"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v36, CFSTR("seqNo"));

        v37 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("spi"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "numberWithUnsignedInt:", objc_msgSend(v38, "unsignedIntValue"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v39, CFSTR("spi"));

        objc_msgSend(v19, "objectForKey:", CFSTR("protocol"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v32) = objc_msgSend(v40, "isEqualToString:", CFSTR("TCP"));

        if ((_DWORD)v32)
        {
          v41 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("protocol_info"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("ack"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "stringWithFormat:", CFSTR("%@"), v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v44, CFSTR("tcp_ack"));

          v45 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("protocol_info"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("seq"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "stringWithFormat:", CFSTR("%@"), v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v48, CFSTR("tcp_seq"));

          v49 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("protocol_info"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("window"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "stringWithFormat:", CFSTR("%@"), v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v52, CFSTR("tcp_window"));

          v53 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("protocol_info"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("control"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "stringWithFormat:", CFSTR("%@"), v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v56, CFSTR("tcp_control"));

          v57 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("protocol_info"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("dest_port"));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "stringWithFormat:", CFSTR("%@"), v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v60, CFSTR("tcp_dest_port"));

          v61 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("protocol_info"));
          v62 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v62, "objectForKeyedSubscript:", CFSTR("source_port"));
          v63 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "stringWithFormat:", CFSTR("%@"), v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = CFSTR("tcp_source_port");
        }
        else
        {
          objc_msgSend(v19, "objectForKey:", CFSTR("protocol"));
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = objc_msgSend(v76, "isEqualToString:", CFSTR("UDP"));

          if (!v77)
          {
            v15 = v83;
            v16 = v84;
            goto LABEL_38;
          }
          v78 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("protocol_info"));
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("dest_port"));
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "stringWithFormat:", CFSTR("%@"), v80);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v81, CFSTR("udp_dest_port"));

          v82 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("protocol_info"));
          v62 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v62, "objectForKeyedSubscript:", CFSTR("source_port"));
          v63 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "stringWithFormat:", CFSTR("%@"), v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = CFSTR("udp_source_port");
        }
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v64, v65);

      }
      else
      {
        if (!v20)
          goto LABEL_38;
        v66 = objc_opt_class();
        v87[0] = MEMORY[0x1E0C809B0];
        v87[1] = 3221225472;
        v87[2] = __61__PLWifiAgent_logEventPointWakeDataFrame_withParams_toEntry___block_invoke_681;
        v87[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v87[4] = v66;
        if (logEventPointWakeDataFrame_withParams_toEntry__defaultOnce_679 != -1)
          dispatch_once(&logEventPointWakeDataFrame_withParams_toEntry__defaultOnce_679, v87);
        if (!logEventPointWakeDataFrame_withParams_toEntry__classDebugEnabled_680)
          goto LABEL_38;
        v83 = v15;
        v84 = v16;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to decode IP packet"));
        v62 = objc_claimAutoreleasedReturnValue();
        v67 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "lastPathComponent");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventPointWakeDataFrame:withParams:toEntry:]");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "logMessage:fromFile:fromFunction:fromLineNumber:", v62, v69, v70, 2885);

        PLLogCommon();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }

      v15 = v83;
    }
    else
    {
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_39;
      v71 = objc_opt_class();
      v85[0] = MEMORY[0x1E0C809B0];
      v85[1] = 3221225472;
      v85[2] = __61__PLWifiAgent_logEventPointWakeDataFrame_withParams_toEntry___block_invoke_729;
      v85[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v85[4] = v71;
      if (logEventPointWakeDataFrame_withParams_toEntry__defaultOnce_727 != -1)
        dispatch_once(&logEventPointWakeDataFrame_withParams_toEntry__defaultOnce_727, v85);
      if (!logEventPointWakeDataFrame_withParams_toEntry__classDebugEnabled_728)
        goto LABEL_39;
      v84 = v16;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unrelated etherType: %@"), v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "lastPathComponent");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventPointWakeDataFrame:withParams:toEntry:]");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v74, v75, 2912);

      PLLogCommon();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    }

    v16 = v84;
LABEL_38:

LABEL_39:
    goto LABEL_40;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__PLWifiAgent_logEventPointWakeDataFrame_withParams_toEntry___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (logEventPointWakeDataFrame_withParams_toEntry__defaultOnce != -1)
      dispatch_once(&logEventPointWakeDataFrame_withParams_toEntry__defaultOnce, block);
    if (logEventPointWakeDataFrame_withParams_toEntry__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: payload too short: length of %lu"), objc_msgSend(v6, "length"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventPointWakeDataFrame:withParams:toEntry:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 2859);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
LABEL_40:

}

uint64_t __61__PLWifiAgent_logEventPointWakeDataFrame_withParams_toEntry___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointWakeDataFrame_withParams_toEntry__classDebugEnabled = result;
  return result;
}

uint64_t __61__PLWifiAgent_logEventPointWakeDataFrame_withParams_toEntry___block_invoke_681(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointWakeDataFrame_withParams_toEntry__classDebugEnabled_680 = result;
  return result;
}

uint64_t __61__PLWifiAgent_logEventPointWakeDataFrame_withParams_toEntry___block_invoke_686(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointWakeDataFrame_withParams_toEntry__classDebugEnabled_685 = result;
  return result;
}

uint64_t __61__PLWifiAgent_logEventPointWakeDataFrame_withParams_toEntry___block_invoke_729(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointWakeDataFrame_withParams_toEntry__classDebugEnabled_728 = result;
  return result;
}

- (void)logEventPointWakePNO:(id)a3 withParams:(id)a4 toEntry:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  __int128 v22;
  unint64_t v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
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
  id v44;
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD block[5];
  unsigned int v48[12];
  uint64_t v49;
  _OWORD v50[3];
  unsigned int v51[13];
  _BYTE v52[33];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(a4, "objectForCFString:", CFSTR("IO80211InterfaceWoWWakeUpCommand"));
  v9 = objc_claimAutoreleasedReturnValue();
  memset(v51, 0, 48);
  v49 = 0;
  memset(v48, 0, sizeof(v48));
  memset(v50, 0, 44);
  v44 = v7;
  v43 = (void *)v9;
  if ((unint64_t)objc_msgSend(v7, "length") > 0x67)
  {
    objc_msgSend(v7, "getBytes:length:", v51, 48);
    objc_msgSend(v7, "getBytes:range:", v48, 48, 56);
    if (v51[1] == 553648128)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v48[2]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("network_count"));

      v18 = v48[2];
      if (v48[2] >= 5)
        v18 = 5;
      v48[2] = v18;
      if (v18)
      {
        v19 = 0;
        v20 = 0;
        v21 = 60;
        while (1)
        {
          v21 += 44;
          if (objc_msgSend(v7, "length") < v21)
            break;
          if (v19)
          {
            objc_msgSend(v7, "getBytes:range:", v50, 44 * (v19 - 1) + 104, 44);
          }
          else
          {
            v22 = *(_OWORD *)(((unint64_t)v48 | 0xC) + 0x10);
            v50[0] = *(_OWORD *)((unint64_t)v48 | 0xC);
            v50[1] = v22;
            *(_OWORD *)((char *)&v50[1] + 12) = *(_OWORD *)(((unint64_t)v48 | 0xC) + 0x1C);
          }
          v23 = v19 + 1;
          if (BYTE7(v50[0]) >= 0x20u)
            v24 = 32;
          else
            v24 = BYTE7(v50[0]);
          BYTE7(v50[0]) = v24;
          __memcpy_chk();
          v52[v24] = 0;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02x:%02x:%02x:%02x:%02x:%02x"), LOBYTE(v50[0]), BYTE1(v50[0]), BYTE2(v50[0]), BYTE3(v50[0]), BYTE4(v50[0]), BYTE5(v50[0]));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", BYTE6(v50[0]));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("network%d_channel"), v19);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, v27);

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v52);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("network%d_ssid"), v19);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v28, v29);

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("network%d_bssid"), v19);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, v30);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", SWORD4(v50[2]));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("network%d_rssi"), v19);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, v32);

          ++v19;
          v20 = v25;
          v7 = v44;
          if (v23 >= v48[2])
            goto LABEL_31;
        }
        if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          goto LABEL_38;
        v38 = objc_opt_class();
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __55__PLWifiAgent_logEventPointWakePNO_withParams_toEntry___block_invoke_743;
        v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v45[4] = v38;
        if (logEventPointWakePNO_withParams_toEntry__defaultOnce_741 != -1)
          dispatch_once(&logEventPointWakePNO_withParams_toEntry__defaultOnce_741, v45);
        if (!logEventPointWakePNO_withParams_toEntry__classDebugEnabled_742)
        {
LABEL_38:
          v25 = v20;
          goto LABEL_31;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WoW wake payload too small to decode all PNO networks"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "lastPathComponent");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventPointWakePNO:withParams:toEntry:]");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v41, v42, 2943);

        PLLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        goto LABEL_29;
      }
    }
    else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v33 = objc_opt_class();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __55__PLWifiAgent_logEventPointWakePNO_withParams_toEntry___block_invoke_736;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v33;
      if (logEventPointWakePNO_withParams_toEntry__defaultOnce_734 != -1)
        dispatch_once(&logEventPointWakePNO_withParams_toEntry__defaultOnce_734, v46);
      if (logEventPointWakePNO_withParams_toEntry__classDebugEnabled_735)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WiFi Logger wl_event_msg_t.event_type (0x%x) and wow_wakeup_command (%@ 0x%x) don't match"), bswap32(v51[1]), v9, 16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "lastPathComponent");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventPointWakePNO:withParams:toEntry:]");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v36, v37, 2933);

        PLLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        goto LABEL_28;
      }
    }
LABEL_30:
    v25 = 0;
    goto LABEL_31;
  }
  if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    goto LABEL_30;
  v10 = objc_opt_class();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PLWifiAgent_logEventPointWakePNO_withParams_toEntry___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = v10;
  if (logEventPointWakePNO_withParams_toEntry__defaultOnce != -1)
    dispatch_once(&logEventPointWakePNO_withParams_toEntry__defaultOnce, block);
  if (!logEventPointWakePNO_withParams_toEntry__classDebugEnabled)
    goto LABEL_30;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WoW wake payload too small to decode E_PFN_NET_FOUND"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventPointWakePNO:withParams:toEntry:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 2925);

  PLLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
LABEL_28:
  v20 = 0;
LABEL_29:

  v25 = v20;
  v7 = v44;
LABEL_31:

}

uint64_t __55__PLWifiAgent_logEventPointWakePNO_withParams_toEntry___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointWakePNO_withParams_toEntry__classDebugEnabled = result;
  return result;
}

uint64_t __55__PLWifiAgent_logEventPointWakePNO_withParams_toEntry___block_invoke_736(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointWakePNO_withParams_toEntry__classDebugEnabled_735 = result;
  return result;
}

uint64_t __55__PLWifiAgent_logEventPointWakePNO_withParams_toEntry___block_invoke_743(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointWakePNO_withParams_toEntry__classDebugEnabled_742 = result;
  return result;
}

- (void)logEventPointWakeLink:(id)a3 withParams:(id)a4 toEntry:(id)a5
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  uint64_t v25;
  _QWORD block[5];
  _OWORD v27[3];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  memset(v27, 0, sizeof(v27));
  if ((unint64_t)objc_msgSend(v7, "length") > 0x2F)
  {
    objc_msgSend(v7, "getBytes:length:", v27, 48);
    if (DWORD1(v27[0]) == 0x10000000)
    {
      -[PLWifiAgent decodeWifiEventLinkReason:](self, "decodeWifiEventLinkReason:", bswap32(HIDWORD(v27[0])));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("loss_reason"));
LABEL_17:

      goto LABEL_18;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v16 = objc_opt_class();
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __56__PLWifiAgent_logEventPointWakeLink_withParams_toEntry___block_invoke_762;
      v24 = &__block_descriptor_40_e5_v8__0lu32l8;
      v25 = v16;
      if (logEventPointWakeLink_withParams_toEntry__defaultOnce_760 != -1)
        dispatch_once(&logEventPointWakeLink_withParams_toEntry__defaultOnce_760, &v21);
      if (logEventPointWakeLink_withParams_toEntry__classDebugEnabled_761)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WiFi Logger wl_event_msg_t.event_type (0x%x) and wow_wakeup_command (0x%x) don't match"), bswap32(DWORD1(v27[0])), 16, v21, v22, v23, v24, v25);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventPointWakeLink:withParams:toEntry:]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v19, v20, 2983);

        PLLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        goto LABEL_16;
      }
    }
  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__PLWifiAgent_logEventPointWakeLink_withParams_toEntry___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (logEventPointWakeLink_withParams_toEntry__defaultOnce != -1)
      dispatch_once(&logEventPointWakeLink_withParams_toEntry__defaultOnce, block);
    if (logEventPointWakeLink_withParams_toEntry__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WoW wake payload too small to decode E_LINK"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventPointWakeLink:withParams:toEntry:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 2974);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
LABEL_16:

      goto LABEL_17;
    }
  }
LABEL_18:

}

uint64_t __56__PLWifiAgent_logEventPointWakeLink_withParams_toEntry___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointWakeLink_withParams_toEntry__classDebugEnabled = result;
  return result;
}

uint64_t __56__PLWifiAgent_logEventPointWakeLink_withParams_toEntry___block_invoke_762(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointWakeLink_withParams_toEntry__classDebugEnabled_761 = result;
  return result;
}

- (void)logEventPointJoin:(unsigned __int8)a3 withStats:(id)a4
{
  int v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[5];

  v4 = a3;
  v6 = a4;
  if (-[PLWifiAgent hasWiFi](self, "hasWiFi"))
  {
    if (v6)
    {
      +[PLOperator entryKeyForType:andName:](PLWifiAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("Join"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v7);
      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D4FE88]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("Reason"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4 != 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("State"));

      -[PLOperator logEntry:](self, "logEntry:", v8);
    }
  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v11 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PLWifiAgent_logEventPointJoin_withStats___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (logEventPointJoin_withStats__defaultOnce != -1)
      dispatch_once(&logEventPointJoin_withStats__defaultOnce, block);
    if (logEventPointJoin_withStats__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No wifi to log power properties about"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventPointJoin:withStats:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 2990);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

uint64_t __43__PLWifiAgent_logEventPointJoin_withStats___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointJoin_withStats__classDebugEnabled = result;
  return result;
}

- (void)logEventPointRemoteControlSession:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80390];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLWifiAgent, "entryKeyForType:andName:", v4, CFSTR("RemoteControlSession"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardModuleInfo
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD block[5];

  if (-[PLWifiAgent hasWiFi](self, "hasWiFi"))
  {
    +[PLOperator entryKeyForType:andName:](PLWifiAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ModuleInfo"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator storage](self, "storage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastEntryForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
LABEL_19:

      return;
    }
    -[PLWifiAgent wifiDevice](self, "wifiDevice");
    v6 = WiFiDeviceClientCopyProperty();
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v7 = objc_opt_class();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __40__PLWifiAgent_logEventForwardModuleInfo__block_invoke_771;
      v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v24[4] = v7;
      if (logEventForwardModuleInfo_defaultOnce_769 != -1)
        dispatch_once(&logEventForwardModuleInfo_defaultOnce_769, v24);
      if (logEventForwardModuleInfo_classDebugEnabled_770)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Module parameters: %@"), v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventForwardModuleInfo]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 3078);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    if (v6)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v3);
      -[NSObject objectForKey:](v6, "objectForKey:", CFSTR("ChipInfo"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("ChipInfo"));

      -[NSObject objectForKey:](v6, "objectForKey:", CFSTR("ManufacturerID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("ManufacturerId"));

      -[NSObject objectForKey:](v6, "objectForKey:", CFSTR("ModuleInfo"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("ModuleInfo"));

      -[NSObject objectForKey:](v6, "objectForKey:", CFSTR("ProductID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("ProductId"));

      -[PLOperator logEntry:](self, "logEntry:", v14);
    }
LABEL_18:

    goto LABEL_19;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v19 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__PLWifiAgent_logEventForwardModuleInfo__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v19;
    if (logEventForwardModuleInfo_defaultOnce != -1)
      dispatch_once(&logEventForwardModuleInfo_defaultOnce, block);
    if (logEventForwardModuleInfo_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No wifi to log module info about"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventForwardModuleInfo]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v22, v23, 3068);

      PLLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      goto LABEL_18;
    }
  }
}

uint64_t __40__PLWifiAgent_logEventForwardModuleInfo__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventForwardModuleInfo_classDebugEnabled = result;
  return result;
}

uint64_t __40__PLWifiAgent_logEventForwardModuleInfo__block_invoke_771(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventForwardModuleInfo_classDebugEnabled_770 = result;
  return result;
}

- (void)logEventForwardRSSI:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t block;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  uint64_t v20;

  v4 = a3;
  if (v4)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v5 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __35__PLWifiAgent_logEventForwardRSSI___block_invoke;
      v19 = &__block_descriptor_40_e5_v8__0lu32l8;
      v20 = v5;
      if (logEventForwardRSSI__defaultOnce != -1)
        dispatch_once(&logEventForwardRSSI__defaultOnce, &block);
      if (logEventForwardRSSI__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LinkQuality Callback: %@"), v4, block, v17, v18, v19, v20);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventForwardRSSI:]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 3099);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("RSSI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("SCALED_RSSI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLOperator entryKeyForType:andName:](PLWifiAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("RSSI"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v14);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("RSSI"));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, CFSTR("ScaledRSSI"));
    -[PLOperator logEntry:](self, "logEntry:", v15);
    -[PLWifiAgent setRemainingAllowedRSSIEntryCount:](self, "setRemainingAllowedRSSIEntryCount:", -[PLWifiAgent remainingAllowedRSSIEntryCount](self, "remainingAllowedRSSIEntryCount") - 1);

  }
}

uint64_t __35__PLWifiAgent_logEventForwardRSSI___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventForwardRSSI__classDebugEnabled = result;
  return result;
}

- (void)logEventForwardWifiAssist:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  +[PLOperator entryKeyForType:andName:](PLWifiAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("WifiAssist"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("WifiAssistFallback"));

  -[PLOperator logEntry:](self, "logEntry:", v5);
}

- (void)logAWDLStateEntry:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("WifiMetrics"), CFSTR("AWDLState"), v6, v5);
}

- (void)logEventForwardAWDLState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD block[5];

  v4 = a3;
  if (v4)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v5 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40__PLWifiAgent_logEventForwardAWDLState___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v5;
      if (logEventForwardAWDLState__defaultOnce != -1)
        dispatch_once(&logEventForwardAWDLState__defaultOnce, block);
      if (logEventForwardAWDLState__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AWDL Availability Callback: %@"), v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventForwardAWDLState:]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 3193);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    +[PLOperator entryKeyForType:andName:](PLWifiAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("AWDLState"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator storage](self, "storage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastEntryForKey:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14
      || (objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AWDLDown")),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LINK_CHANGED_IS_LINKDOWN")),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v16,
          v15,
          v15 != v16))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v12);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LINK_CHANGED_IS_LINKDOWN"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("AWDLDown"));

      objc_msgSend(v17, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("AWDLRanging"));
      v19 = 0;
      -[PLWifiAgent wifiAwdlDevice](self, "wifiAwdlDevice");
      WiFiDeviceClientCopyInterfaceStateInfo();
      -[PLOperator logEntry:](self, "logEntry:", v17);
      -[PLWifiAgent logAWDLStateEntry:](self, "logAWDLStateEntry:", v17);

    }
  }

}

uint64_t __40__PLWifiAgent_logEventForwardAWDLState___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventForwardAWDLState__classDebugEnabled = result;
  return result;
}

uint64_t __40__PLWifiAgent_logEventForwardAWDLState___block_invoke_793(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventForwardAWDLState__classDebugEnabled_792 = result;
  return result;
}

- (void)logEventForwardHotspotState:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
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
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  int v42;
  int v43;
  _QWORD v44[5];
  _QWORD block[5];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = *MEMORY[0x1E0D4FE28];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D4FE28]);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = *MEMORY[0x1E0D4FE30];
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D4FE30]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v11 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __43__PLWifiAgent_logEventForwardHotspotState___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v11;
          if (logEventForwardHotspotState__defaultOnce != -1)
            dispatch_once(&logEventForwardHotspotState__defaultOnce, block);
          if (logEventForwardHotspotState__classDebugEnabled)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Hotspot Availability Callback: %@"), v5);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "lastPathComponent");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventForwardHotspotState:]");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 3222);

            PLLogCommon();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

          }
        }
        +[PLOperator entryKeyForType:andName:](PLWifiAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("HotspotState"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLOperator storage](self, "storage");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastEntryForKey:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("HotSpotOn"));
          v21 = objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = (void *)v21;
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("ADHS"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("HotSpotOn"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "BOOLValue");
              objc_msgSend(v5, "objectForKeyedSubscript:", v9);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              if (v25 == objc_msgSend(v26, "BOOLValue"))
              {
                objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("ADHS"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = objc_msgSend(v27, "BOOLValue");
                objc_msgSend(v5, "objectForKeyedSubscript:", v6);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = objc_msgSend(v28, "BOOLValue");

                if (v43 == v42)
                {
                  if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
                    goto LABEL_19;
                  v36 = objc_opt_class();
                  v44[0] = MEMORY[0x1E0C809B0];
                  v44[1] = 3221225472;
                  v44[2] = __43__PLWifiAgent_logEventForwardHotspotState___block_invoke_800;
                  v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                  v44[4] = v36;
                  if (logEventForwardHotspotState__defaultOnce_798 != -1)
                    dispatch_once(&logEventForwardHotspotState__defaultOnce_798, v44);
                  if (!logEventForwardHotspotState__classDebugEnabled_799)
                    goto LABEL_19;
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Same hotspot data: %@"), v5);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = (void *)MEMORY[0x1E0D7FF98];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "lastPathComponent");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventForwardHotspotState:]");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v39, v40, 3228);

                  PLLogCommon();
                  v41 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                    __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

LABEL_18:
LABEL_19:

                  goto LABEL_20;
                }
              }
              else
              {

              }
            }
          }
        }
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v18);
        v30 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "objectForKeyedSubscript:", v9);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "numberWithBool:", objc_msgSend(v31, "BOOLValue"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v32, CFSTR("HotSpotOn"));

        v33 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "objectForKeyedSubscript:", v6);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "numberWithBool:", objc_msgSend(v34, "BOOLValue"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v35, CFSTR("ADHS"));

        -[PLOperator logEntry:](self, "logEntry:", v29);
        goto LABEL_18;
      }
    }
  }
LABEL_20:

}

uint64_t __43__PLWifiAgent_logEventForwardHotspotState___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventForwardHotspotState__classDebugEnabled = result;
  return result;
}

uint64_t __43__PLWifiAgent_logEventForwardHotspotState___block_invoke_800(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventForwardHotspotState__classDebugEnabled_799 = result;
  return result;
}

- (void)logEventBackwardCumulativeProperties
{
  -[PLWifiAgent logEventBackwardWifiProperties:](self, "logEventBackwardWifiProperties:", 1);
}

- (void)logEventBackwardDiffProperties
{
  -[PLWifiAgent logEventBackwardWifiProperties:](self, "logEventBackwardWifiProperties:", 1);
}

- (void)logEventBackwardUserScanDuration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  +[PLOperator entryKeyForType:andName:](PLWifiAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("CumulativeUserScanDurations"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v9);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_autoJoinScanDuration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("AutojoinScanDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_locationScanDuration);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("LocationScanDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_pipelineScanDuration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("PipelineScanDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_unknownScanDuration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("UnknownScanDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_setupScanDuration);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("SetupScanDuration"));

  -[PLOperator logEntry:](self, "logEntry:", v3);
}

- (void)updateEventBackwardUserScanDuration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _QWORD block[5];

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("SCAN_CHANNELS"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_30:

        goto LABEL_31;
      }
      objc_msgSend(v4, "objectForKey:", CFSTR("ScanReqClientName"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5
        || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            v7,
            v5 == v7))
      {
        v8 = 0;
        v16 = 110;
        v17 = 3000;
        if (!v6)
        {
LABEL_21:
          v18 = &OBJC_IVAR___PLWifiAgent__autoJoinScanDuration;
LABEL_22:
          *(Class *)((char *)&self->super.super.super.isa + *v18) = (Class)(*(char **)((char *)&self->super.super.super.isa
                                                                                     + *v18)
                                                                          + v17);
          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v20 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __51__PLWifiAgent_updateEventBackwardUserScanDuration___block_invoke;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v20;
            if (updateEventBackwardUserScanDuration__defaultOnce != -1)
              dispatch_once(&updateEventBackwardUserScanDuration__defaultOnce, block);
            if (updateEventBackwardUserScanDuration__classDebugEnabled)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("User scan counter update: clientName = %@, dwellTime= %lu, channelCountNum = %lu, totalScanTime = %lu\n"), v6, v16, v8, v17);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "lastPathComponent");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent updateEventBackwardUserScanDuration:]");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 3326);

              PLLogCommon();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

            }
          }
          goto LABEL_29;
        }
LABEL_12:
        if ((objc_msgSend(v6, "hasPrefix:", CFSTR("location")) & 1) != 0)
        {
          v18 = &OBJC_IVAR___PLWifiAgent__locationScanDuration;
        }
        else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("Setup")) & 1) != 0)
        {
          v18 = &OBJC_IVAR___PLWifiAgent__setupScanDuration;
        }
        else
        {
          v19 = objc_msgSend(v6, "hasPrefix:", CFSTR("pipe"));
          v18 = &OBJC_IVAR___PLWifiAgent__unknownScanDuration;
          if (v19)
            v18 = &OBJC_IVAR___PLWifiAgent__pipelineScanDuration;
        }
        goto LABEL_22;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v8 = objc_msgSend(v5, "count");
        objc_msgSend(v4, "objectForKey:", CFSTR("SCAN_DWELL_TIME"));
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_19;
        v10 = (void *)v9;
        objc_msgSend(v4, "objectForKey:", CFSTR("SCAN_DWELL_TIME"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == v12)
        {
LABEL_19:
          v16 = 110;
LABEL_20:
          v17 = v16 * v8;
          if (!v6)
            goto LABEL_21;
          goto LABEL_12;
        }
        objc_msgSend(v4, "objectForKey:", CFSTR("SCAN_DWELL_TIME"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_opt_respondsToSelector();

        if ((v14 & 1) != 0)
        {
          objc_msgSend(v4, "objectForKey:", CFSTR("SCAN_DWELL_TIME"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (int)objc_msgSend(v15, "intValue");

          goto LABEL_20;
        }
      }
LABEL_29:

      goto LABEL_30;
    }
  }
LABEL_31:

}

uint64_t __51__PLWifiAgent_updateEventBackwardUserScanDuration___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateEventBackwardUserScanDuration__classDebugEnabled = result;
  return result;
}

- (void)logEventPointAWDLServicesAndPorts
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "No wifi to log active services and ports about", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)logEventBackwardWifiProperties:(BOOL)a3
{
  _BOOL8 v3;
  CFNumberRef v5;
  void *v6;
  const void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD v56[5];
  _QWORD v57[5];
  int valuePtr;
  _QWORD block[6];

  v3 = a3;
  if (-[PLWifiAgent hasWiFi](self, "hasWiFi"))
  {
    valuePtr = 115;
    v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
    -[PLWifiAgent wifiDevice](self, "wifiDevice");
    v6 = (void *)WiFiDeviceClientCopyProperty();
    CFRelease(v5);
    -[PLWifiAgent wifiDevice](self, "wifiDevice");
    v7 = (const void *)WiFiDeviceClientCopyCurrentNetwork();
    PLLogWifi();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PLWifiAgent logEventBackwardWifiProperties:].cold.5();

    v9 = objc_opt_new();
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", CFSTR("<error>"), CFSTR("CurrentSSID"));
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("CurrentChannel"));
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("CurrentBandwidth"));
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("Carplay"));
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v36, CFSTR("CurrentSSID"));

      -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("CurrentChannel"));
      -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("CurrentBandwidth"));
LABEL_35:
      v37 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
      if (v6)
      {
        if (v37)
        {
          v38 = objc_opt_class();
          v54[0] = MEMORY[0x1E0C809B0];
          v54[1] = 3221225472;
          v54[2] = __46__PLWifiAgent_logEventBackwardWifiProperties___block_invoke_849;
          v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v54[4] = v38;
          if (logEventBackwardWifiProperties__defaultOnce_847 != -1)
            dispatch_once(&logEventBackwardWifiProperties__defaultOnce_847, v54);
          if (logEventBackwardWifiProperties__classDebugEnabled_848)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wifi properties dictionary: %@, need to model power=%d"), v6, v3);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "lastPathComponent");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventBackwardWifiProperties:]");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v42, v43, 3488);

            PLLogCommon();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

          }
        }
        -[PLWifiAgent logEventBackwardWifiProperties:withNetworkProperties:shallModelPower:](self, "logEventBackwardWifiProperties:withNetworkProperties:shallModelPower:", v6, v9, v3);
      }
      else if (v37)
      {
        v45 = objc_opt_class();
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __46__PLWifiAgent_logEventBackwardWifiProperties___block_invoke_844;
        v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v55[4] = v45;
        if (logEventBackwardWifiProperties__defaultOnce_842 != -1)
          dispatch_once(&logEventBackwardWifiProperties__defaultOnce_842, v55);
        if (logEventBackwardWifiProperties__classDebugEnabled_843)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No wifi properties"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "lastPathComponent");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventBackwardWifiProperties:]");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "logMessage:fromFile:fromFunction:fromLineNumber:", v46, v49, v50, 3486);

          PLLogCommon();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
LABEL_51:

      return;
    }
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", WiFiNetworkGetSSID(), CFSTR("CurrentSSID"));
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("CurrentSSID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", MEMORY[0x1DF0A40B0](v7), CFSTR("CurrentChannel"));
      -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("CurrentChannel"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PLWifiAgent getCurrentChannelWidth:](self, "getCurrentChannelWidth:", v7));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v12, CFSTR("CurrentBandwidth"));

        MEMORY[0x1DF0A40B0](v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v13, CFSTR("CurrentChannel"));
        if (WiFiNetworkGetOperatingBand() == 3)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v13, "intValue") + 1000);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v14, CFSTR("CurrentChannel"));

          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v15 = objc_opt_class();
            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = __46__PLWifiAgent_logEventBackwardWifiProperties___block_invoke_833;
            v57[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v57[4] = v15;
            if (logEventBackwardWifiProperties__defaultOnce_831 != -1)
              dispatch_once(&logEventBackwardWifiProperties__defaultOnce_831, v57);
            if (logEventBackwardWifiProperties__classDebugEnabled_832)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("6G chan %lu"), v13);
              v16 = objc_claimAutoreleasedReturnValue();
              v52 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "lastPathComponent");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventBackwardWifiProperties:]");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v18, v19, 3473);

              v20 = (void *)v16;
              PLLogCommon();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

            }
          }
        }
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v22 = objc_opt_class();
          v56[0] = MEMORY[0x1E0C809B0];
          v56[1] = 3221225472;
          v56[2] = __46__PLWifiAgent_logEventBackwardWifiProperties___block_invoke_838;
          v56[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v56[4] = v22;
          if (logEventBackwardWifiProperties__defaultOnce_836 != -1)
            dispatch_once(&logEventBackwardWifiProperties__defaultOnce_836, v56);
          if (logEventBackwardWifiProperties__classDebugEnabled_837)
          {
            v53 = v13;
            v23 = (void *)MEMORY[0x1E0CB3940];
            -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("CurrentBandwidth"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "stringWithFormat:", CFSTR("kPLWACurrentChannelWidthInMHz = %@"), v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v26 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "lastPathComponent");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventBackwardWifiProperties:]");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 3476);

            PLLogCommon();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

            v13 = v53;
          }
        }

        goto LABEL_32;
      }
    }
    else
    {
      -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", CFSTR("<unknown>"), CFSTR("CurrentSSID"));
    }
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("CurrentChannel"));
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("CurrentBandwidth"));
LABEL_32:
    if (WiFiNetworkIsCarPlay())
      -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", &unk_1EA1C09B0, CFSTR("Carplay"));
    CFRelease(v7);
    goto LABEL_35;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v31 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__PLWifiAgent_logEventBackwardWifiProperties___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v31;
    if (logEventBackwardWifiProperties__defaultOnce != -1)
      dispatch_once(&logEventBackwardWifiProperties__defaultOnce, block);
    if (logEventBackwardWifiProperties__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No wifi to log power properties about"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "lastPathComponent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventBackwardWifiProperties:]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v34, v35, 3432);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      goto LABEL_51;
    }
  }
}

uint64_t __46__PLWifiAgent_logEventBackwardWifiProperties___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventBackwardWifiProperties__classDebugEnabled = result;
  return result;
}

uint64_t __46__PLWifiAgent_logEventBackwardWifiProperties___block_invoke_833(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventBackwardWifiProperties__classDebugEnabled_832 = result;
  return result;
}

uint64_t __46__PLWifiAgent_logEventBackwardWifiProperties___block_invoke_838(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventBackwardWifiProperties__classDebugEnabled_837 = result;
  return result;
}

uint64_t __46__PLWifiAgent_logEventBackwardWifiProperties___block_invoke_844(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventBackwardWifiProperties__classDebugEnabled_843 = result;
  return result;
}

uint64_t __46__PLWifiAgent_logEventBackwardWifiProperties___block_invoke_849(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventBackwardWifiProperties__classDebugEnabled_848 = result;
  return result;
}

- (void)logEventBackwardWifiProperties:(id)a3 withNetworkProperties:(id)a4 shallModelPower:(BOOL)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  PLEntry *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  PLWifiAgent *v39;
  PLEntry *v40;
  BOOL v41;
  uint64_t v42;
  int v43;
  BOOL v44;
  unint64_t v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  unint64_t v64;
  unint64_t v65;
  void *v66;
  void *v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  uint64_t v81;
  _QWORD *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  PLWifiAgent *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t k;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  _QWORD *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  NSObject *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t m;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  _QWORD *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  NSObject *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t n;
  uint64_t v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  void *v170;
  uint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  unint64_t v176;
  void *v177;
  unint64_t v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  int v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t i;
  id v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t j;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  uint64_t v204;
  _QWORD *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  NSObject *v211;
  void *v212;
  void *v213;
  void *v214;
  uint64_t v215;
  void *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t ii;
  uint64_t v221;
  void *v222;
  void *v223;
  void *v224;
  uint64_t v225;
  void *v226;
  void *v227;
  void *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t jj;
  uint64_t v233;
  void *v234;
  void *v235;
  void *v236;
  uint64_t v237;
  void *v238;
  void *v239;
  uint64_t v240;
  _QWORD *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  NSObject *v247;
  void *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t kk;
  uint64_t v253;
  void *v254;
  void *v255;
  void *v256;
  uint64_t v257;
  void *v258;
  void *v259;
  uint64_t v260;
  _QWORD *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  NSObject *v267;
  NSObject *v268;
  void *v269;
  uint64_t v270;
  void *v271;
  double v272;
  void *v273;
  void *v274;
  double v275;
  double v276;
  void *v277;
  void *v278;
  void *v279;
  PLEntry *v280;
  void *v281;
  void *v282;
  uint64_t v283;
  void *v284;
  void *v285;
  void *v286;
  unint64_t v287;
  void *v288;
  unint64_t v289;
  void *v290;
  void *v291;
  uint64_t v292;
  void *v293;
  void *v294;
  void *v295;
  unint64_t v296;
  void *v297;
  unint64_t v298;
  void *v299;
  void *v300;
  uint64_t v301;
  void *v302;
  void *v303;
  void *v304;
  unint64_t v305;
  void *v306;
  unint64_t v307;
  void *v308;
  void *v309;
  uint64_t v310;
  void *v311;
  void *v312;
  void *v313;
  unint64_t v314;
  void *v315;
  unint64_t v316;
  void *v317;
  uint64_t v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  id v327;
  _BOOL4 v328;
  int v329;
  void *v330;
  uint64_t v331;
  void *v332;
  int v333;
  void *v334;
  id v335;
  PLWifiAgent *v336;
  void *v337;
  id obj;
  void *v339;
  PLEntry *v340;
  PLEntry *v341;
  id v342;
  id v343;
  void *v344;
  uint64_t v345;
  unsigned int v346;
  void *v347;
  unint64_t v348;
  uint64_t v349;
  _BOOL4 v350;
  void *v351;
  unsigned int v352;
  unsigned int v353;
  void *v354;
  void *v355;
  __int128 v356;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  _QWORD v364[5];
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  _QWORD v369[5];
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  _QWORD v378[5];
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  _QWORD v383[5];
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  _QWORD v388[5];
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  _QWORD v393[5];
  _QWORD v394[5];
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  _BYTE v399[128];
  uint8_t v400[128];
  uint8_t buf[4];
  void *v402;
  __int16 v403;
  id v404;
  _BYTE v405[128];
  _BYTE v406[128];
  _BYTE v407[128];
  _BYTE v408[128];
  _BYTE v409[128];
  _BYTE v410[128];
  _BYTE v411[128];
  _QWORD v412[10];
  _QWORD v413[13];

  v328 = a5;
  v413[10] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v327 = a4;
  v412[0] = CFSTR("SOFTAP_LOWPOWER_STATS_ACTIVE_STATE_DURATION");
  v412[1] = CFSTR("SOFTAP_LOWPOWER_STATS_ACTIVE_STATE_COUNT");
  v413[0] = CFSTR("ADHSActiveStateDuration");
  v413[1] = CFSTR("ADHSActiveStateCount");
  v412[2] = CFSTR("SOFTAP_LOWPOWER_STATS_DYNAMIC_STATE_DURATION");
  v412[3] = CFSTR("SOFTAP_LOWPOWER_STATS_DYNAMIC_STATE_COUNT");
  v413[2] = CFSTR("ADHSDynamicStateDuration");
  v413[3] = CFSTR("ADHSDynamicStateDuration");
  v412[4] = CFSTR("SOFTAP_LOWPOWER_STATS_LOWPOWER_STATE_COUNT");
  v412[5] = CFSTR("SOFTAP_LOWPOWER_STATS_LOWPOWER_STATE_COUNT");
  v413[4] = CFSTR("ADHSLowPowerStateDuration");
  v413[5] = CFSTR("ADHSLowPowerStateDuration");
  v412[6] = CFSTR("SOFTAP_LOWPOWER_STATS_OFF_STATE_COUNT");
  v412[7] = CFSTR("SOFTAP_LOWPOWER_STATS_OFF_STATE_COUNT");
  v413[6] = CFSTR("ADHSOffStateDuration");
  v413[7] = CFSTR("ADHSOffStateDuration");
  v412[8] = CFSTR("SOFTAP_LOWPOWER_STATS_TXPACKETS");
  v412[9] = CFSTR("SOFTAP_LOWPOWER_STATS_RXPACKETS");
  v413[8] = CFSTR("ADHSTXPackets");
  v413[9] = CFSTR("ADHSRXPackets");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v413, v412, 10);
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v337, "allValues");
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D80370];
  +[PLOperator entryKeyForType:andName:](PLWifiAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("HotspotPowerStats"));
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CACHED_TIME_STAMP"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v352 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("INSTANT_ASSOCIATED_SLEEP_DURATION"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("INSTANT_UNASSOCIATED_SLEEP_DURATION"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("INSTANT_TIME_STAMP"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v346 = objc_msgSend(v14, "integerValue");

  +[PLOperator entryKeyForType:andName:](PLWifiAgent, "entryKeyForType:andName:", v8, CFSTR("CumulativeProperties"));
  v15 = objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLWifiAgent, "entryKeyForType:andName:", v8, CFSTR("DiffProperties"));
  v334 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLWifiAgent, "entryKeyForType:andName:", v8, CFSTR("BeaconProfile"));
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLWifiAgent, "entryKeyForType:andName:", v8, CFSTR("AutoJoin"));
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLWifiAgent, "entryKeyForType:andName:", v8, CFSTR("Scans"));
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLWifiAgent, "entryKeyForType:andName:", v8, CFSTR("ScanForwardStats"));
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    v16 = self->_lastEntryForHelperd;
  }
  else
  {
    -[PLOperator storage](self, "storage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastEntryForKey:", v15);
    v16 = (PLEntry *)objc_claimAutoreleasedReturnValue();

  }
  v350 = (v11 | v13) != 0;
  v340 = v16;
  if (v16)
  {
    -[PLEntry objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("WifiTimestamp"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v348 = objc_msgSend(v18, "unsignedIntegerValue");

  }
  else
  {
    v348 = 0;
  }
  v332 = (void *)v15;
  v336 = self;
  v355 = v7;
  v19 = (void *)objc_opt_new();
  v20 = +[PLWifiAgent isBeaconLoggingEnabled](PLWifiAgent, "isBeaconLoggingEnabled");
  v21 = (void *)MEMORY[0x1E0C9AA70];
  v22 = &unk_1EA1D8530;
  if (!v20)
    v22 = (void *)MEMORY[0x1E0C9AA70];
  obj = v22;
  v23 = +[PLWifiAgent isScanLoggingEnabled](PLWifiAgent, "isScanLoggingEnabled");
  v24 = &unk_1EA1D8558;
  if (!v23)
    v24 = v21;
  v342 = v24;
  v25 = +[PLWifiAgent isScanForwardLoggingEnabled](PLWifiAgent, "isScanForwardLoggingEnabled");
  v26 = &unk_1EA1D8580;
  if (!v25)
    v26 = v21;
  v343 = v26;
  v330 = v19;
  objc_msgSend(v19, "addEntriesFromDictionary:", &unk_1EA1D8350);
  v27 = objc_msgSend(MEMORY[0x1E0D80020], "kPLWiFiClassOfDevice");
  v28 = 0;
  v29 = &unk_1EA1D8378;
  v30 = &unk_1EA1D8508;
  v31 = &unk_1EA1D83C8;
  v32 = &unk_1EA1D8468;
  v33 = &unk_1EA1D8440;
  v34 = &unk_1EA1D8418;
  v35 = &unk_1EA1D83F0;
  v36 = 0;
  v331 = 0;
  v329 = 0;
  v37 = &unk_1EA1D83A0;
  switch(v27)
  {
    case 1004001:
    case 1004002:
    case 1004003:
    case 1004006:
    case 1004008:
      goto LABEL_20;
    case 1004004:
    case 1004005:
      goto LABEL_19;
    case 1004007:
      goto LABEL_18;
    case 1004009:
      goto LABEL_21;
    case 1004010:
      goto LABEL_17;
    case 1004011:
      v331 = 0;
      v329 = 0;
      v28 = 0;
      v35 = &unk_1EA1D84B8;
      v37 = &unk_1EA1D8490;
      goto LABEL_19;
    case 1004012:
      objc_msgSend(v19, "addEntriesFromDictionary:", &unk_1EA1D8378);
      objc_msgSend(v19, "addEntriesFromDictionary:", &unk_1EA1D8490);
      objc_msgSend(v19, "addEntriesFromDictionary:", &unk_1EA1D84B8);
      HIDWORD(v331) = 0;
      if ((int)objc_msgSend(MEMORY[0x1E0D80020], "kPLSoCClassOfDevice") <= 1001204)
      {
        v38 = 0;
        LODWORD(v331) = 0;
        v329 = 0;
      }
      else
      {
        v28 = &unk_1EA1D85A8;
        LODWORD(v331) = 1;
        v329 = 0;
        v29 = &unk_1EA1D84E0;
LABEL_21:
        objc_msgSend(v19, "addEntriesFromDictionary:", v29);
        v38 = v28;
      }
      v39 = v336;
      v40 = v340;
      if (!v350)
      {
        v43 = 1;
        if (!v340)
        {
          LODWORD(v42) = 1;
          goto LABEL_40;
        }
        v44 = v352 > v348;
        goto LABEL_36;
      }
      if (v346 <= (unint64_t)v352)
      {
        v44 = v352 > v348;
        v43 = 1;
LABEL_36:
        if (v44)
          LODWORD(v42) = 1;
        else
          LODWORD(v42) = 2;
        goto LABEL_40;
      }
      if (v348)
        v41 = v352 > v348;
      else
        v41 = 1;
      LODWORD(v42) = v41;
      if ((_DWORD)v42)
        v43 = 2;
      else
        v43 = 1;
LABEL_40:
      v45 = 0x1E0CB3000uLL;
      v344 = v38;
      do
      {
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v332);
        v339 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v334);
        v351 = v46;
        if ((_DWORD)v42 == 2)
        {
          if (!v40 || -[PLWifiAgent isWiFiPowered](v39, "isWiFiPowered"))
          {
            LODWORD(v42) = 2;
            goto LABEL_269;
          }
          v179 = (void *)-[PLEntry copy](v40, "copy");
          v180 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v334);
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v179, "setObject:forKeyedSubscript:", v181, CFSTR("CurrentSSID"));

          objc_msgSend(v179, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("CurrentChannel"));
          objc_msgSend(v179, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("CurrentBandwidth"));
          objc_msgSend(v179, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("WifiPowered"));
          objc_msgSend(v179, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("Carplay"));
          objc_msgSend(*(id *)(v45 + 2024), "numberWithUnsignedInteger:", v336->_autoJoinScanDuration);
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v179, "setObject:forKeyedSubscript:", v182, CFSTR("AutojoinScanDuration"));

          objc_msgSend(*(id *)(v45 + 2024), "numberWithUnsignedInteger:", v336->_locationScanDuration);
          v183 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v179, "setObject:forKeyedSubscript:", v183, CFSTR("LocationScanDuration"));

          objc_msgSend(*(id *)(v45 + 2024), "numberWithUnsignedInteger:", v336->_pipelineScanDuration);
          v184 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v179, "setObject:forKeyedSubscript:", v184, CFSTR("PipelineScanDuration"));

          objc_msgSend(*(id *)(v45 + 2024), "numberWithUnsignedInteger:", v336->_unknownScanDuration);
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v179, "setObject:forKeyedSubscript:", v185, CFSTR("UnknownScanDuration"));

          objc_msgSend(*(id *)(v45 + 2024), "numberWithUnsignedInteger:", v336->_setupScanDuration);
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          v354 = v179;
          objc_msgSend(v179, "setObject:forKeyedSubscript:", v186, CFSTR("SetupScanDuration"));

          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("AWDLAWDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("AWDLRXDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("AWDLScanDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("AWDLTXDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("AssociatedScanDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("AutojoinScanDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("CurrentBandwidth"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("CurrentChannel"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("CurrentSSID"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("FRTSDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("HSICActiveDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("HSICSuspendDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("LocationScanDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("MPCDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("OtherScanDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("PCIEActiveDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("PCIEPERSTDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("PCIESuspendDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("PMDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("PNOBSSIDDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("PNOScanSSIDDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("PipelineScanDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("RXDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("RoamScanDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("SetupScanDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("TXDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("TimeDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("UnknownScanDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("UserScanDuration"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("WifiPowered"));
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("WowEnabled"));
          if (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004005))
          {
            objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("SISOTXDuration"));
            objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("MIMOTXDuration"));
            objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("MIMORXDuration"));
            objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("SISORXDuration"));
            objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("MIMOCSDuration"));
            objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("SISOCSDuration"));
          }
          if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004007) & 1) != 0
            || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004010) & 1) != 0
            || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004013) & 1) != 0
            || objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004014))
          {
            objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("SISOTXDuration"));
            objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("MIMOTXDuration"));
            objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("MIMORXDuration"));
            objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("SISORXDuration"));
            objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("MIMOCSDuration"));
            objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("SISOCSDuration"));
            objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("OCLCSDuration"));
            objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("OCLRXDuration"));
          }
          v45 = 0x1E0CB3000uLL;
          v187 = v179;
          v39 = v336;
          if (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004010))
          {
            objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("OPSFullDuration"));
            objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("OPSPartialDuration"));
          }
          if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004013) & 1) != 0
            || objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004014))
          {
            objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("OPSFullDuration"));
            objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("OPSPartialDuration"));
            objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("PSBWDuration"));
          }
          v188 = v43;
          if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004015) & 1) != 0
            || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004016) & 1) != 0
            || objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017))
          {
            objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("SCRXDurationSISO"));
          }
          if ((_DWORD)v331)
          {
            v362 = 0u;
            v363 = 0u;
            v360 = 0u;
            v361 = 0u;
            v189 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v360, v400, 16);
            if (v189)
            {
              v190 = v189;
              v191 = *(_QWORD *)v361;
              do
              {
                for (i = 0; i != v190; ++i)
                {
                  if (*(_QWORD *)v361 != v191)
                    objc_enumerationMutation(v38);
                  objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, *(_QWORD *)(*((_QWORD *)&v360 + 1) + 8 * i));
                }
                v190 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v360, v400, 16);
              }
              while (v190);
            }
          }
          if (HIDWORD(v331))
          {
            v358 = 0u;
            v359 = 0u;
            v356 = 0u;
            v357 = 0u;
            v193 = v322;
            v194 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v356, v399, 16);
            if (v194)
            {
              v195 = v194;
              v196 = *(_QWORD *)v357;
              do
              {
                for (j = 0; j != v195; ++j)
                {
                  if (*(_QWORD *)v357 != v196)
                    objc_enumerationMutation(v193);
                  objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, *(_QWORD *)(*((_QWORD *)&v356 + 1) + 8 * j));
                }
                v195 = objc_msgSend(v193, "countByEnumeratingWithState:objects:count:", &v356, v399, 16);
              }
              while (v195);
            }

            v38 = v344;
          }
          objc_msgSend(v180, "setObject:forKeyedSubscript:", &unk_1EA1C0998, CFSTR("TimeDuration"));
          -[PLEntry objectForKey:](v40, "objectForKey:", CFSTR("CurrentChannel"));
          v198 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v180, "setObject:forKeyedSubscript:", v198, CFSTR("CurrentChannel"));

          -[PLEntry objectForKey:](v40, "objectForKey:", CFSTR("CurrentSSID"));
          v199 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v180, "setObject:forKeyedSubscript:", v199, CFSTR("CurrentSSID"));

          -[PLEntry objectForKey:](v40, "objectForKey:", CFSTR("CurrentBandwidth"));
          v200 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v180, "setObject:forKeyedSubscript:", v200, CFSTR("CurrentBandwidth"));

          -[PLEntry objectForKey:](v40, "objectForKey:", CFSTR("WowEnabled"));
          v201 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v180, "setObject:forKeyedSubscript:", v201, CFSTR("WowEnabled"));

          -[PLEntry objectForKey:](v40, "objectForKey:", CFSTR("WifiPowered"));
          v202 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v180, "setObject:forKeyedSubscript:", v202, CFSTR("WifiPowered"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2);
          v203 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v354, "setObject:forKeyedSubscript:", v203, CFSTR("READINGTYPE"));

          if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
            objc_storeStrong((id *)&v336->_lastEntryForHelperd, v354);
          else
            -[PLOperator logEntry:](v336, "logEntry:", v354);
          v43 = v188;
          v46 = v351;
          if (v328)
            -[PLWifiAgent modelWiFiPower:](v336, "modelWiFiPower:", v180);

          LODWORD(v42) = 2;
          goto LABEL_267;
        }
        v333 = v43;
        v47 = *(void **)(v45 + 2024);
        if ((_DWORD)v42)
          v48 = CFSTR("CACHED_TIME_STAMP");
        else
          v48 = CFSTR("INSTANT_TIME_STAMP");
        objc_msgSend(v355, "objectForKeyedSubscript:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "numberWithUnsignedInteger:", objc_msgSend(v49, "integerValue"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setObject:forKeyedSubscript:", v50, CFSTR("WifiTimestamp"));

        if (v40)
        {
          v51 = *(void **)(v45 + 2024);
          objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("WifiTimestamp"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "unsignedIntegerValue");
          -[PLEntry objectForKeyedSubscript:](v40, "objectForKeyedSubscript:", CFSTR("WifiTimestamp"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "numberWithInteger:", v53 - objc_msgSend(v54, "unsignedIntegerValue"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v339, "setObject:forKeyedSubscript:", v55, CFSTR("TimeDuration"));

        }
        v347 = &unk_1EA1DC7F0;
        if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004011) & 1) == 0)
        {
          v56 = objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004012);
          v57 = &unk_1EA1DC7F0;
          if (!v56)
            v57 = &unk_1EA1DC808;
          v347 = v57;
        }
        v398 = 0u;
        v397 = 0u;
        v396 = 0u;
        v395 = 0u;
        v58 = v330;
        v341 = v40;
        v353 = v42;
        v349 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v395, v411, 16);
        if (v349)
        {
          v345 = *(_QWORD *)v396;
          v335 = v58;
          do
          {
            v59 = 0;
            do
            {
              if (*(_QWORD *)v396 != v345)
                objc_enumerationMutation(v58);
              v60 = *(_QWORD *)(*((_QWORD *)&v395 + 1) + 8 * v59);
              objc_msgSend(v58, "objectForKeyedSubscript:", v60);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "objectAtIndexedSubscript:", (_DWORD)v42 != 0);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v355, "objectForKeyedSubscript:", v62);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = objc_msgSend(v63, "integerValue");

              if (objc_msgSend(v347, "containsObject:", v60))
                v65 = v64 / 0x3E8uLL;
              else
                v65 = v64;
              objc_msgSend(*(id *)(v45 + 2024), "numberWithUnsignedInteger:", v65);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v351, "setObject:forKeyedSubscript:", v66, v60);

              if (v40)
              {
                -[PLEntry objectForKey:](v40, "objectForKey:", v60);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v67, "isNil") & 1) != 0)
                  goto LABEL_91;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v68 = objc_msgSend(v67, "unsignedLongValue");
                  goto LABEL_68;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v68 = objc_msgSend(v67, "longLongValue");
LABEL_68:
                  v69 = v68;
                  v70 = v68 - v65;
                  if (v68 > v65)
                  {
                    if (objc_msgSend(&unk_1EA1DC820, "containsObject:", v60))
                    {
                      v71 = *(void **)(v45 + 2024);
                      if (v70 - 858994 <= 0x346DC4)
                      {
                        v72 = v65 - v69 + 4294967;
                        goto LABEL_90;
                      }
                    }
                    else
                    {
                      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
                      {
                        v81 = objc_opt_class();
                        v394[0] = MEMORY[0x1E0C809B0];
                        v394[1] = 3221225472;
                        v394[2] = __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke;
                        v394[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                        v394[4] = v81;
                        v82 = v394;
                        if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce != -1)
                          dispatch_once(&logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce, v82);

                        if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled)
                        {
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("diff[%@] = %lu < %lu, ignoring setting to zero"), v60, v65, v69);
                          v83 = (void *)objc_claimAutoreleasedReturnValue();
                          v84 = (void *)MEMORY[0x1E0D7FF98];
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
                          v85 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v85, "lastPathComponent");
                          v86 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventBackwardWifiProperties:withNetworkProperties:shallModelPower:]");
                          v87 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v84, "logMessage:fromFile:fromFunction:fromLineNumber:", v83, v86, v87, 4080);

                          PLLogCommon();
                          v88 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138412290;
                            v402 = v83;
                            _os_log_debug_impl(&dword_1DA9D6000, v88, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                          }

                          v45 = 0x1E0CB3000uLL;
                        }
                      }
                      v71 = *(void **)(v45 + 2024);
                    }
                    v72 = 0;
LABEL_90:
                    objc_msgSend(v71, "numberWithUnsignedInteger:", v72);
                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v339, "setObject:forKeyedSubscript:", v89, v60);

LABEL_91:
                    v40 = v341;
                    goto LABEL_92;
                  }
                }
                else
                {
                  v69 = 0;
                }
                if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
                {
                  v73 = objc_opt_class();
                  v393[0] = MEMORY[0x1E0C809B0];
                  v393[1] = 3221225472;
                  v393[2] = __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_1558;
                  v393[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                  v393[4] = v73;
                  v74 = v393;
                  if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_1556 != -1)
                    dispatch_once(&logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_1556, v74);

                  if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_1557)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("diff[%@] = %lu - %lu"), v60, v65, v69);
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    v76 = (void *)MEMORY[0x1E0D7FF98];
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v77, "lastPathComponent");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventBackwardWifiProperties:withNetworkProperties:shallModelPower:]");
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v76, "logMessage:fromFile:fromFunction:fromLineNumber:", v75, v78, v79, 4086);

                    PLLogCommon();
                    v80 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v402 = v75;
                      _os_log_debug_impl(&dword_1DA9D6000, v80, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }

                    v45 = 0x1E0CB3000uLL;
                    v58 = v335;
                  }
                }
                v71 = *(void **)(v45 + 2024);
                v72 = v65 - v69;
                goto LABEL_90;
              }
LABEL_92:
              ++v59;
              LODWORD(v42) = v353;
            }
            while (v349 != v59);
            v349 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v395, v411, 16);
          }
          while (v349);
        }

        if (v40 && (_DWORD)v42 == 1)
        {
          -[PLEntry objectForKey:](v40, "objectForKey:", CFSTR("CurrentChannel"));
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = v351;
          objc_msgSend(v351, "setObject:forKeyedSubscript:", v90, CFSTR("CurrentChannel"));

          -[PLEntry objectForKey:](v40, "objectForKey:", CFSTR("CurrentSSID"));
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v351, "setObject:forKeyedSubscript:", v92, CFSTR("CurrentSSID"));

          -[PLEntry objectForKey:](v40, "objectForKey:", CFSTR("CurrentBandwidth"));
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v351, "setObject:forKeyedSubscript:", v93, CFSTR("CurrentBandwidth"));

          -[PLEntry objectForKey:](v40, "objectForKey:", CFSTR("WowEnabled"));
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v351, "setObject:forKeyedSubscript:", v94, CFSTR("WowEnabled"));

          -[PLEntry objectForKey:](v40, "objectForKey:", CFSTR("Carplay"));
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v351, "setObject:forKeyedSubscript:", v95, CFSTR("Carplay"));

          -[PLEntry objectForKey:](v40, "objectForKey:", CFSTR("WifiPowered"));
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = v336;
        }
        else
        {
          objc_msgSend(v327, "objectForKeyedSubscript:", CFSTR("CurrentChannel"));
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = v351;
          objc_msgSend(v351, "setObject:forKeyedSubscript:", v98, CFSTR("CurrentChannel"));

          objc_msgSend(v327, "objectForKeyedSubscript:", CFSTR("CurrentSSID"));
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v351, "setObject:forKeyedSubscript:", v99, CFSTR("CurrentSSID"));

          objc_msgSend(v327, "objectForKeyedSubscript:", CFSTR("CurrentBandwidth"));
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v351, "setObject:forKeyedSubscript:", v100, CFSTR("CurrentBandwidth"));

          objc_msgSend(v327, "objectForKeyedSubscript:", CFSTR("Carplay"));
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v351, "setObject:forKeyedSubscript:", v101, CFSTR("Carplay"));

          v97 = v336;
          objc_msgSend(*(id *)(v45 + 2024), "numberWithBool:", -[PLWifiAgent isWowEnabled](v336, "isWowEnabled"));
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v351, "setObject:forKeyedSubscript:", v102, CFSTR("WowEnabled"));

          objc_msgSend(*(id *)(v45 + 2024), "numberWithBool:", -[PLWifiAgent isWiFiPowered](v336, "isWiFiPowered"));
          v96 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v91, "setObject:forKeyedSubscript:", v96, CFSTR("WifiPowered"));

        if ((_DWORD)v331)
        {
          objc_msgSend(v355, "objectForKeyedSubscript:", CFSTR("AutoJoinPowerDiag"));
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v326);
          v389 = 0u;
          v390 = 0u;
          v391 = 0u;
          v392 = 0u;
          objc_msgSend(v344, "allKeys");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v389, v410, 16);
          if (v106)
          {
            v107 = v106;
            v108 = *(_QWORD *)v390;
            do
            {
              for (k = 0; k != v107; ++k)
              {
                if (*(_QWORD *)v390 != v108)
                  objc_enumerationMutation(v105);
                v110 = *(_QWORD *)(*((_QWORD *)&v389 + 1) + 8 * k);
                objc_msgSend(v344, "objectForKeyedSubscript:", v110);
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v104, "setObject:forKeyedSubscript:", 0, v111);

                objc_msgSend(v103, "objectForKey:", v110);
                v112 = (void *)objc_claimAutoreleasedReturnValue();

                if (v112)
                {
                  objc_msgSend(v103, "objectForKeyedSubscript:", v110);
                  v113 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v344, "objectForKeyedSubscript:", v110);
                  v114 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v104, "setObject:forKeyedSubscript:", v113, v114);

                }
                objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("auto_join_trigger_counts"));
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v115, "objectForKey:", v110);
                v116 = (void *)objc_claimAutoreleasedReturnValue();

                if (v116)
                {
                  objc_msgSend(v103, "objectForKeyedSubscript:", CFSTR("auto_join_trigger_counts"));
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v117, "objectForKeyedSubscript:", v110);
                  v118 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v344, "objectForKeyedSubscript:", v110);
                  v119 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v104, "setObject:forKeyedSubscript:", v118, v119);

                }
              }
              v107 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v389, v410, 16);
            }
            while (v107);
          }

          v97 = v336;
          -[PLOperator logEntry:](v336, "logEntry:", v104);
          v40 = v341;
          v45 = 0x1E0CB3000;
          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v120 = objc_opt_class();
            v388[0] = MEMORY[0x1E0C809B0];
            v388[1] = 3221225472;
            v388[2] = __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_1567;
            v388[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v388[4] = v120;
            v121 = v388;
            if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_1565 != -1)
              dispatch_once(&logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_1565, v121);

            if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_1566)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Logged AJ keys:%@"), v104);
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              v123 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v124, "lastPathComponent");
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventBackwardWifiProperties:withNetworkProperties:shallModelPower:]");
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v123, "logMessage:fromFile:fromFunction:fromLineNumber:", v122, v125, v126, 4135);

              PLLogCommon();
              v127 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v127, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v402 = v122;
                _os_log_debug_impl(&dword_1DA9D6000, v127, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v45 = 0x1E0CB3000;
            }
          }

        }
        if (HIDWORD(v331))
        {
          objc_msgSend(v355, "objectForKey:", CFSTR("AutoHotspotLPHSPowerStats"));
          v128 = (void *)objc_claimAutoreleasedReturnValue();

          if (v128)
          {
            v129 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v323);
            objc_msgSend(v355, "objectForKeyedSubscript:", CFSTR("AutoHotspotLPHSPowerStats"));
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            v384 = 0u;
            v385 = 0u;
            v386 = 0u;
            v387 = 0u;
            objc_msgSend(v337, "allKeys");
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v384, v409, 16);
            if (v132)
            {
              v133 = v132;
              v134 = *(_QWORD *)v385;
              do
              {
                for (m = 0; m != v133; ++m)
                {
                  if (*(_QWORD *)v385 != v134)
                    objc_enumerationMutation(v131);
                  v136 = *(_QWORD *)(*((_QWORD *)&v384 + 1) + 8 * m);
                  objc_msgSend(v130, "objectForKey:", v136);
                  v137 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v137)
                  {
                    objc_msgSend(v130, "objectForKeyedSubscript:", v136);
                    v138 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v337, "objectForKeyedSubscript:", v136);
                    v139 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v129, "setObject:forKeyedSubscript:", v138, v139);

                  }
                }
                v133 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v384, v409, 16);
              }
              while (v133);
            }

            -[PLOperator logEntry:](v97, "logEntry:", v129);
            v40 = v341;
            v45 = 0x1E0CB3000;
            if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
            {
              v140 = objc_opt_class();
              v383[0] = MEMORY[0x1E0C809B0];
              v383[1] = 3221225472;
              v383[2] = __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_1574;
              v383[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v383[4] = v140;
              v141 = v383;
              if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_1572 != -1)
                dispatch_once(&logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_1572, v141);

              if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_1573)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Logged ADHS keys:%@"), v129);
                v142 = (void *)objc_claimAutoreleasedReturnValue();
                v143 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
                v144 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v144, "lastPathComponent");
                v145 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventBackwardWifiProperties:withNetworkProperties:shallModelPower:]");
                v146 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v143, "logMessage:fromFile:fromFunction:fromLineNumber:", v142, v145, v146, 4150);

                PLLogCommon();
                v147 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v402 = v142;
                  _os_log_debug_impl(&dword_1DA9D6000, v147, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v45 = 0x1E0CB3000uLL;
              }
            }

          }
        }
        if (v329)
        {
          v381 = 0u;
          v382 = 0u;
          v379 = 0u;
          v380 = 0u;
          v148 = objc_msgSend(&unk_1EA1D85D0, "countByEnumeratingWithState:objects:count:", &v379, v408, 16);
          if (v148)
          {
            v149 = v148;
            v150 = *(_QWORD *)v380;
            do
            {
              for (n = 0; n != v149; ++n)
              {
                if (*(_QWORD *)v380 != v150)
                  objc_enumerationMutation(&unk_1EA1D85D0);
                v152 = *(_QWORD *)(*((_QWORD *)&v379 + 1) + 8 * n);
                objc_msgSend(&unk_1EA1D85D0, "objectForKeyedSubscript:", v152);
                v153 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v355, "objectForKey:", v153);
                v154 = (void *)objc_claimAutoreleasedReturnValue();

                if (v154)
                {
                  objc_msgSend(&unk_1EA1D85D0, "objectForKeyedSubscript:", v152);
                  v155 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v355, "objectForKeyedSubscript:", v155);
                  v156 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v351, "setObject:forKeyedSubscript:", v156, v152);

                }
              }
              v149 = objc_msgSend(&unk_1EA1D85D0, "countByEnumeratingWithState:objects:count:", &v379, v408, 16);
            }
            while (v149);
          }
        }
        if (v40)
        {
          -[PLEntry objectForKey:](v40, "objectForKey:", CFSTR("CurrentChannel"));
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v339, "setObject:forKeyedSubscript:", v157, CFSTR("CurrentChannel"));

          -[PLEntry objectForKey:](v40, "objectForKey:", CFSTR("CurrentSSID"));
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v339, "setObject:forKeyedSubscript:", v158, CFSTR("CurrentSSID"));

          -[PLEntry objectForKey:](v40, "objectForKey:", CFSTR("CurrentBandwidth"));
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v339, "setObject:forKeyedSubscript:", v159, CFSTR("CurrentBandwidth"));

          -[PLEntry objectForKey:](v40, "objectForKey:", CFSTR("WowEnabled"));
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v339, "setObject:forKeyedSubscript:", v160, CFSTR("WowEnabled"));

          -[PLEntry objectForKey:](v40, "objectForKey:", CFSTR("WifiPowered"));
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v339, "setObject:forKeyedSubscript:", v161, CFSTR("WifiPowered"));

        }
        v39 = v336;
        objc_msgSend(*(id *)(v45 + 2024), "numberWithUnsignedInteger:", v336->_autoJoinScanDuration);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v351, "setObject:forKeyedSubscript:", v162, CFSTR("AutojoinScanDuration"));

        objc_msgSend(*(id *)(v45 + 2024), "numberWithUnsignedInteger:", v336->_locationScanDuration);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v351, "setObject:forKeyedSubscript:", v163, CFSTR("LocationScanDuration"));

        objc_msgSend(*(id *)(v45 + 2024), "numberWithUnsignedInteger:", v336->_pipelineScanDuration);
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v351, "setObject:forKeyedSubscript:", v164, CFSTR("PipelineScanDuration"));

        objc_msgSend(*(id *)(v45 + 2024), "numberWithUnsignedInteger:", v336->_unknownScanDuration);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v351, "setObject:forKeyedSubscript:", v165, CFSTR("UnknownScanDuration"));

        objc_msgSend(*(id *)(v45 + 2024), "numberWithUnsignedInteger:", v336->_setupScanDuration);
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v351, "setObject:forKeyedSubscript:", v166, CFSTR("SetupScanDuration"));

        v38 = v344;
        if (v40)
        {
          -[PLEntry objectForKeyedSubscript:](v40, "objectForKeyedSubscript:", CFSTR("AutojoinScanDuration"));
          v167 = objc_claimAutoreleasedReturnValue();
          if (v167)
          {
            v168 = (void *)v167;
            -[PLEntry objectForKeyedSubscript:](v40, "objectForKeyedSubscript:", CFSTR("LocationScanDuration"));
            v169 = objc_claimAutoreleasedReturnValue();
            if (!v169)
            {

              goto LABEL_201;
            }
            v170 = (void *)v169;
            -[PLEntry objectForKeyedSubscript:](v40, "objectForKeyedSubscript:", CFSTR("PipelineScanDuration"));
            v171 = objc_claimAutoreleasedReturnValue();
            if (v171)
            {
              v172 = (void *)v171;
              -[PLEntry objectForKeyedSubscript:](v40, "objectForKeyedSubscript:", CFSTR("UnknownScanDuration"));
              v173 = (void *)objc_claimAutoreleasedReturnValue();
              if (v173)
              {
                -[PLEntry objectForKeyedSubscript:](v40, "objectForKeyedSubscript:", CFSTR("SetupScanDuration"));
                v174 = (void *)objc_claimAutoreleasedReturnValue();

                v38 = v344;
                if (!v174)
                  goto LABEL_201;
                objc_msgSend(v351, "objectForKeyedSubscript:", CFSTR("AutojoinScanDuration"));
                v175 = (void *)objc_claimAutoreleasedReturnValue();
                v176 = objc_msgSend(v175, "unsignedLongLongValue");
                -[PLEntry objectForKeyedSubscript:](v40, "objectForKeyedSubscript:", CFSTR("AutojoinScanDuration"));
                v177 = (void *)objc_claimAutoreleasedReturnValue();
                v178 = objc_msgSend(v177, "unsignedLongLongValue");

                if (v176 >= v178)
                {
                  v281 = *(void **)(v45 + 2024);
                  objc_msgSend(v351, "objectForKeyedSubscript:", CFSTR("AutojoinScanDuration"));
                  v282 = (void *)objc_claimAutoreleasedReturnValue();
                  v283 = objc_msgSend(v282, "unsignedLongLongValue");
                  -[PLEntry objectForKeyedSubscript:](v40, "objectForKeyedSubscript:", CFSTR("AutojoinScanDuration"));
                  v284 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v281, "numberWithUnsignedLongLong:", v283 - objc_msgSend(v284, "unsignedLongLongValue"));
                  v285 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v339, "setObject:forKeyedSubscript:", v285, CFSTR("AutojoinScanDuration"));

                }
                else
                {
                  objc_msgSend(v339, "setObject:forKeyedSubscript:", 0, CFSTR("AutojoinScanDuration"));
                }
                objc_msgSend(v351, "objectForKeyedSubscript:", CFSTR("LocationScanDuration"));
                v286 = (void *)objc_claimAutoreleasedReturnValue();
                v287 = objc_msgSend(v286, "unsignedLongLongValue");
                -[PLEntry objectForKeyedSubscript:](v40, "objectForKeyedSubscript:", CFSTR("LocationScanDuration"));
                v288 = (void *)objc_claimAutoreleasedReturnValue();
                v289 = objc_msgSend(v288, "unsignedLongLongValue");

                if (v287 >= v289)
                {
                  v290 = *(void **)(v45 + 2024);
                  objc_msgSend(v351, "objectForKeyedSubscript:", CFSTR("LocationScanDuration"));
                  v291 = (void *)objc_claimAutoreleasedReturnValue();
                  v292 = objc_msgSend(v291, "unsignedLongLongValue");
                  -[PLEntry objectForKeyedSubscript:](v40, "objectForKeyedSubscript:", CFSTR("LocationScanDuration"));
                  v293 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v290, "numberWithUnsignedLongLong:", v292 - objc_msgSend(v293, "unsignedLongLongValue"));
                  v294 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v339, "setObject:forKeyedSubscript:", v294, CFSTR("LocationScanDuration"));

                }
                else
                {
                  objc_msgSend(v339, "setObject:forKeyedSubscript:", 0, CFSTR("LocationScanDuration"));
                }
                objc_msgSend(v351, "objectForKeyedSubscript:", CFSTR("PipelineScanDuration"));
                v295 = (void *)objc_claimAutoreleasedReturnValue();
                v296 = objc_msgSend(v295, "unsignedLongLongValue");
                -[PLEntry objectForKeyedSubscript:](v40, "objectForKeyedSubscript:", CFSTR("PipelineScanDuration"));
                v297 = (void *)objc_claimAutoreleasedReturnValue();
                v298 = objc_msgSend(v297, "unsignedLongLongValue");

                if (v296 >= v298)
                {
                  v299 = *(void **)(v45 + 2024);
                  objc_msgSend(v351, "objectForKeyedSubscript:", CFSTR("PipelineScanDuration"));
                  v300 = (void *)objc_claimAutoreleasedReturnValue();
                  v301 = objc_msgSend(v300, "unsignedLongLongValue");
                  -[PLEntry objectForKeyedSubscript:](v40, "objectForKeyedSubscript:", CFSTR("PipelineScanDuration"));
                  v302 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v299, "numberWithUnsignedLongLong:", v301 - objc_msgSend(v302, "unsignedLongLongValue"));
                  v303 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v339, "setObject:forKeyedSubscript:", v303, CFSTR("PipelineScanDuration"));

                }
                else
                {
                  objc_msgSend(v339, "setObject:forKeyedSubscript:", 0, CFSTR("PipelineScanDuration"));
                }
                objc_msgSend(v351, "objectForKeyedSubscript:", CFSTR("UnknownScanDuration"));
                v304 = (void *)objc_claimAutoreleasedReturnValue();
                v305 = objc_msgSend(v304, "unsignedLongLongValue");
                -[PLEntry objectForKeyedSubscript:](v40, "objectForKeyedSubscript:", CFSTR("UnknownScanDuration"));
                v306 = (void *)objc_claimAutoreleasedReturnValue();
                v307 = objc_msgSend(v306, "unsignedLongLongValue");

                if (v305 >= v307)
                {
                  v308 = *(void **)(v45 + 2024);
                  objc_msgSend(v351, "objectForKeyedSubscript:", CFSTR("UnknownScanDuration"));
                  v309 = (void *)objc_claimAutoreleasedReturnValue();
                  v310 = objc_msgSend(v309, "unsignedLongLongValue");
                  -[PLEntry objectForKeyedSubscript:](v40, "objectForKeyedSubscript:", CFSTR("UnknownScanDuration"));
                  v311 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v308, "numberWithUnsignedLongLong:", v310 - objc_msgSend(v311, "unsignedLongLongValue"));
                  v312 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v339, "setObject:forKeyedSubscript:", v312, CFSTR("UnknownScanDuration"));

                }
                else
                {
                  objc_msgSend(v339, "setObject:forKeyedSubscript:", 0, CFSTR("UnknownScanDuration"));
                }
                objc_msgSend(v351, "objectForKeyedSubscript:", CFSTR("SetupScanDuration"));
                v313 = (void *)objc_claimAutoreleasedReturnValue();
                v314 = objc_msgSend(v313, "unsignedLongLongValue");
                -[PLEntry objectForKeyedSubscript:](v40, "objectForKeyedSubscript:", CFSTR("SetupScanDuration"));
                v315 = (void *)objc_claimAutoreleasedReturnValue();
                v316 = objc_msgSend(v315, "unsignedLongLongValue");

                if (v314 < v316)
                {
                  objc_msgSend(v339, "setObject:forKeyedSubscript:", 0, CFSTR("SetupScanDuration"));
                  goto LABEL_200;
                }
                v317 = *(void **)(v45 + 2024);
                objc_msgSend(v351, "objectForKeyedSubscript:", CFSTR("SetupScanDuration"));
                v168 = (void *)objc_claimAutoreleasedReturnValue();
                v318 = objc_msgSend(v168, "unsignedLongLongValue");
                -[PLEntry objectForKeyedSubscript:](v40, "objectForKeyedSubscript:", CFSTR("SetupScanDuration"));
                v319 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v317, "numberWithUnsignedLongLong:", v318 - objc_msgSend(v319, "unsignedLongLongValue"));
                v320 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v339, "setObject:forKeyedSubscript:", v320, CFSTR("SetupScanDuration"));

LABEL_199:
LABEL_200:
                v38 = v344;
                goto LABEL_201;
              }

            }
            goto LABEL_199;
          }
        }
LABEL_201:
        v46 = v351;
        v42 = v353;
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v204 = objc_opt_class();
          v378[0] = MEMORY[0x1E0C809B0];
          v378[1] = 3221225472;
          v378[2] = __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_1579;
          v378[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v378[4] = v204;
          v205 = v378;
          if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_1577 != -1)
            dispatch_once(&logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_1577, v205);

          if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_1578)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Last logged data: %@ current data:%@"), v40, v351);
            v206 = (void *)objc_claimAutoreleasedReturnValue();
            v207 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
            v208 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v208, "lastPathComponent");
            v209 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventBackwardWifiProperties:withNetworkProperties:shallModelPower:]");
            v210 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v207, "logMessage:fromFile:fromFunction:fromLineNumber:", v206, v209, v210, 4216);

            PLLogCommon();
            v211 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v211, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v402 = v206;
              _os_log_debug_impl(&dword_1DA9D6000, v211, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v38 = v344;
            v46 = v351;
            v42 = v353;
          }
        }
        objc_msgSend(*(id *)(v45 + 2024), "numberWithUnsignedInt:", v42);
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setObject:forKeyedSubscript:", v212, CFSTR("READINGTYPE"));

        if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
          -[PLWifiAgent setLastEntryForHelperd:](v336, "setLastEntryForHelperd:", v46);
        else
          -[PLOperator logEntry:](v336, "logEntry:", v46);
        if (+[PLWifiAgent isBeaconLoggingEnabled](PLWifiAgent, "isBeaconLoggingEnabled"))
        {
          objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("CurrentChannel"));
          v213 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v213, "integerValue") >= 1)
          {
            objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("WifiTimestamp"));
            v214 = (void *)objc_claimAutoreleasedReturnValue();
            v215 = objc_msgSend(v214, "integerValue");
            -[PLEntry objectForKeyedSubscript:](v40, "objectForKeyedSubscript:", CFSTR("WifiTimestamp"));
            v216 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v216, "integerValue") + 60000;

            v38 = v344;
            v41 = v215 <= v42;
            LODWORD(v42) = v353;
            v46 = v351;
            if (v41)
              goto LABEL_223;
            v213 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v321);
            v374 = 0u;
            v375 = 0u;
            v376 = 0u;
            v377 = 0u;
            v217 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v374, v407, 16);
            if (v217)
            {
              v218 = v217;
              v219 = *(_QWORD *)v375;
              do
              {
                for (ii = 0; ii != v218; ++ii)
                {
                  if (*(_QWORD *)v375 != v219)
                    objc_enumerationMutation(obj);
                  v221 = *(_QWORD *)(*((_QWORD *)&v374 + 1) + 8 * ii);
                  objc_msgSend(obj, "objectForKeyedSubscript:", v221);
                  v222 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v222, "objectAtIndexedSubscript:", v353 != 0);
                  v223 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v355, "objectForKeyedSubscript:", v223);
                  v224 = (void *)objc_claimAutoreleasedReturnValue();
                  v225 = objc_msgSend(v224, "integerValue");

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v225);
                  v226 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v213, "setObject:forKeyedSubscript:", v226, v221);

                }
                v218 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v374, v407, 16);
              }
              while (v218);
            }
            objc_msgSend(v351, "objectForKeyedSubscript:", CFSTR("WifiTimestamp"));
            v227 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v351;
            objc_msgSend(v213, "setObject:forKeyedSubscript:", v227, CFSTR("WifiTimestamp"));

            v39 = v336;
            -[PLOperator logEntry:](v336, "logEntry:", v213);
            v40 = v341;
            v38 = v344;
            v45 = 0x1E0CB3000;
            LODWORD(v42) = v353;
          }

        }
LABEL_223:
        if (+[PLWifiAgent isScanLoggingEnabled](PLWifiAgent, "isScanLoggingEnabled"))
        {
          v228 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v325);
          v370 = 0u;
          v371 = 0u;
          v372 = 0u;
          v373 = 0u;
          v229 = objc_msgSend(v342, "countByEnumeratingWithState:objects:count:", &v370, v406, 16);
          if (v229)
          {
            v230 = v229;
            v231 = *(_QWORD *)v371;
            do
            {
              for (jj = 0; jj != v230; ++jj)
              {
                if (*(_QWORD *)v371 != v231)
                  objc_enumerationMutation(v342);
                v233 = *(_QWORD *)(*((_QWORD *)&v370 + 1) + 8 * jj);
                objc_msgSend(v342, "objectForKeyedSubscript:", v233);
                v234 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v234, "objectAtIndexedSubscript:", v353 != 0);
                v235 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v355, "objectForKeyedSubscript:", v235);
                v236 = (void *)objc_claimAutoreleasedReturnValue();
                v237 = objc_msgSend(v236, "integerValue");

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v237);
                v238 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v228, "setObject:forKeyedSubscript:", v238, v233);

              }
              v230 = objc_msgSend(v342, "countByEnumeratingWithState:objects:count:", &v370, v406, 16);
            }
            while (v230);
          }
          objc_msgSend(v351, "objectForKeyedSubscript:", CFSTR("WifiTimestamp"));
          v239 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v228, "setObject:forKeyedSubscript:", v239, CFSTR("WifiTimestamp"));

          v39 = v336;
          v40 = v341;
          v38 = v344;
          v45 = 0x1E0CB3000;
          LODWORD(v42) = v353;
          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v240 = objc_opt_class();
            v369[0] = MEMORY[0x1E0C809B0];
            v369[1] = 3221225472;
            v369[2] = __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_1584;
            v369[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v369[4] = v240;
            v241 = v369;
            if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_1582 != -1)
              dispatch_once(&logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_1582, v241);

            if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_1583)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" current data:%@ %@"), v228, v342);
              v242 = (void *)objc_claimAutoreleasedReturnValue();
              v243 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
              v244 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v244, "lastPathComponent");
              v245 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventBackwardWifiProperties:withNetworkProperties:shallModelPower:]");
              v246 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v243, "logMessage:fromFile:fromFunction:fromLineNumber:", v242, v245, v246, 4248);

              PLLogCommon();
              v247 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v247, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v402 = v242;
                _os_log_debug_impl(&dword_1DA9D6000, v247, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v38 = v344;
              LODWORD(v42) = v353;
            }
          }
          -[PLOperator logEntry:](v336, "logEntry:", v228);

          v46 = v351;
        }
        if (+[PLWifiAgent isScanForwardLoggingEnabled](PLWifiAgent, "isScanForwardLoggingEnabled"))
        {
          v248 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v324);
          v365 = 0u;
          v366 = 0u;
          v367 = 0u;
          v368 = 0u;
          v249 = objc_msgSend(v343, "countByEnumeratingWithState:objects:count:", &v365, v405, 16);
          if (v249)
          {
            v250 = v249;
            v251 = *(_QWORD *)v366;
            do
            {
              for (kk = 0; kk != v250; ++kk)
              {
                if (*(_QWORD *)v366 != v251)
                  objc_enumerationMutation(v343);
                v253 = *(_QWORD *)(*((_QWORD *)&v365 + 1) + 8 * kk);
                objc_msgSend(v343, "objectForKeyedSubscript:", v253);
                v254 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v254, "objectAtIndexedSubscript:", v353 != 0);
                v255 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v355, "objectForKeyedSubscript:", v255);
                v256 = (void *)objc_claimAutoreleasedReturnValue();
                v257 = objc_msgSend(v256, "integerValue");

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v257);
                v258 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v248, "setObject:forKeyedSubscript:", v258, v253);

              }
              v250 = objc_msgSend(v343, "countByEnumeratingWithState:objects:count:", &v365, v405, 16);
            }
            while (v250);
          }
          objc_msgSend(v351, "objectForKeyedSubscript:", CFSTR("WifiTimestamp"));
          v259 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v248, "setObject:forKeyedSubscript:", v259, CFSTR("WifiTimestamp"));

          v39 = v336;
          v38 = v344;
          LODWORD(v42) = v353;
          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v260 = objc_opt_class();
            v364[0] = MEMORY[0x1E0C809B0];
            v364[1] = 3221225472;
            v364[2] = __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_1589;
            v364[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v364[4] = v260;
            v261 = v364;
            if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_1587 != -1)
              dispatch_once(&logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__defaultOnce_1587, v261);

            if (logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_1588)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ScanForward current data: %@ %@"), v248, v343);
              v262 = (void *)objc_claimAutoreleasedReturnValue();
              v263 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
              v264 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v264, "lastPathComponent");
              v265 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent logEventBackwardWifiProperties:withNetworkProperties:shallModelPower:]");
              v266 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v263, "logMessage:fromFile:fromFunction:fromLineNumber:", v262, v265, v266, 4262);

              PLLogCommon();
              v267 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v267, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v402 = v262;
                _os_log_debug_impl(&dword_1DA9D6000, v267, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v38 = v344;
              LODWORD(v42) = v353;
            }
          }
          PLLogWifi();
          v268 = objc_claimAutoreleasedReturnValue();
          v40 = v341;
          v45 = 0x1E0CB3000;
          if (os_log_type_enabled(v268, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v402 = v248;
            v403 = 2112;
            v404 = v343;
            _os_log_debug_impl(&dword_1DA9D6000, v268, OS_LOG_TYPE_DEBUG, "ScanForward current data: %@ %@", buf, 0x16u);
          }

          -[PLOperator logEntry:](v336, "logEntry:", v248);
          v46 = v351;
        }
        if (v40)
        {
          objc_msgSend(v339, "objectForKeyedSubscript:", CFSTR("TimeDuration"));
          v269 = (void *)objc_claimAutoreleasedReturnValue();
          v270 = objc_msgSend(v269, "integerValue");

          if (v270 >= 1)
          {
            if (v333 >= 2)
            {
              objc_msgSend(v339, "objectForKeyedSubscript:", CFSTR("TimeDuration"));
              v271 = (void *)objc_claimAutoreleasedReturnValue();
              v272 = (double)objc_msgSend(v271, "integerValue") / 1000.0;

              objc_msgSend(v339, "entryDate");
              v273 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLEntry entryDate](v40, "entryDate");
              v274 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v273, "timeIntervalSinceDate:", v274);
              v276 = v275;

              if (v272 < v276)
              {
                v277 = (void *)MEMORY[0x1E0C99D68];
                -[PLEntry entryDate](v40, "entryDate");
                v278 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v277, "dateWithTimeInterval:sinceDate:", v278, v272);
                v279 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v339, "setEntryDate:", v279);

              }
            }
            if (v328)
              -[PLWifiAgent modelWiFiPower:](v39, "modelWiFiPower:", v339);
          }
        }
        v43 = v333;
        if (v333 >= 2)
        {
          v280 = v46;

          if (v280)
          {
            -[PLEntry objectForKeyedSubscript:](v280, "objectForKeyedSubscript:", CFSTR("WifiTimestamp"));
            v187 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v187, "unsignedIntegerValue");
            LODWORD(v42) = 0;
            v40 = v280;
LABEL_267:

            goto LABEL_269;
          }
          v40 = 0;
          LODWORD(v42) = 0;
        }
LABEL_269:

        v41 = v43-- <= 1;
      }
      while (!v41);

      return;
    case 1004013:
    case 1004014:
      goto LABEL_16;
    case 1004015:
      goto LABEL_15;
    case 1004016:
    case 1004017:
      v30 = &unk_1EA1D83C8;
      v32 = &unk_1EA1D8508;
      v33 = &unk_1EA1D8468;
      v34 = &unk_1EA1D8440;
      v35 = &unk_1EA1D8418;
      v31 = &unk_1EA1D83F0;
LABEL_15:
      objc_msgSend(v19, "addEntriesFromDictionary:", &unk_1EA1D8378);
      objc_msgSend(v19, "addEntriesFromDictionary:", &unk_1EA1D83A0);
      HIDWORD(v331) = 1;
      v29 = v31;
      v37 = v35;
      v35 = v34;
      v34 = v33;
      v33 = v32;
      v32 = v30;
LABEL_16:
      objc_msgSend(v19, "addEntriesFromDictionary:", v29);
      v29 = v37;
      v37 = v35;
      v35 = v34;
      v34 = v33;
      v33 = v32;
LABEL_17:
      objc_msgSend(v19, "addEntriesFromDictionary:", v29);
      v36 = 1;
      v29 = v37;
      v37 = v35;
      v35 = v34;
      v34 = v33;
LABEL_18:
      v329 = HIDWORD(v331);
      objc_msgSend(v19, "addEntriesFromDictionary:", v29);
      LODWORD(v331) = 1;
      HIDWORD(v331) = v36;
      v29 = v37;
      v37 = v35;
      v35 = v34;
      v28 = &unk_1EA1D85A8;
LABEL_19:
      objc_msgSend(v19, "addEntriesFromDictionary:", v29);
      v29 = v37;
      v37 = v35;
LABEL_20:
      objc_msgSend(v19, "addEntriesFromDictionary:", v29);
      v29 = v37;
      goto LABEL_21;
    default:
      LODWORD(v331) = 0;
      v329 = 0;
      goto LABEL_21;
  }
}

uint64_t __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled = result;
  return result;
}

uint64_t __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_1558(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_1557 = result;
  return result;
}

uint64_t __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_1567(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_1566 = result;
  return result;
}

uint64_t __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_1574(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_1573 = result;
  return result;
}

uint64_t __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_1579(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_1578 = result;
  return result;
}

uint64_t __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_1584(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_1583 = result;
  return result;
}

uint64_t __84__PLWifiAgent_logEventBackwardWifiProperties_withNetworkProperties_shallModelPower___block_invoke_1589(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventBackwardWifiProperties_withNetworkProperties_shallModelPower__classDebugEnabled_1588 = result;
  return result;
}

- (id)wifiChipsetQuery
{
  NSString *wifiChipset;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSString *v24;
  uint64_t block;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  uint64_t v30;

  wifiChipset = self->_wifiChipset;
  if (wifiChipset)
    goto LABEL_49;
  +[PLOperator entryKeyForType:andName:](PLWifiAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ModuleInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastEntryForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (!-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
    {
LABEL_48:

      wifiChipset = self->_wifiChipset;
LABEL_49:
      v16 = wifiChipset;
      return v16;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wifiChipsetQuery: WiFi Module entry not found. Assume 4334 for now."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastPathComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent wifiChipsetQuery]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 4494);

    PLLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    v16 = CFSTR("4334");
    goto LABEL_20;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __31__PLWifiAgent_wifiChipsetQuery__block_invoke;
    v29 = &__block_descriptor_40_e5_v8__0lu32l8;
    v30 = v7;
    if (wifiChipsetQuery_defaultOnce != -1)
      dispatch_once(&wifiChipsetQuery_defaultOnce, &block);
    if (wifiChipsetQuery_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("last module entry: %@"), v6, block, v27, v28, v29, v30);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent wifiChipsetQuery]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 4441);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ProductId"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "intValue");

  v16 = 0;
  if (v15 <= 17459)
  {
    if (v15 > 17371)
    {
      if (v15 > 17444)
      {
        if (v15 == 17445)
        {
          v17 = CFSTR("4378");
          goto LABEL_47;
        }
        if (v15 == 17459)
        {
          v17 = CFSTR("4387");
          goto LABEL_47;
        }
      }
      else
      {
        if (v15 == 17372)
        {
          v17 = CFSTR("4355");
          goto LABEL_47;
        }
        if (v15 == 17418)
        {
          v17 = CFSTR("4357");
LABEL_47:
          v24 = self->_wifiChipset;
          self->_wifiChipset = &v17->isa;

          goto LABEL_48;
        }
      }
      goto LABEL_20;
    }
    if (v15 != 17204)
    {
      if (v15 == 17315)
      {
        v17 = CFSTR("4350");
        goto LABEL_47;
      }
      if (v15 == 17323)
      {
        v17 = CFSTR("4345");
        goto LABEL_47;
      }
      goto LABEL_20;
    }
LABEL_39:
    v17 = CFSTR("43342");
    goto LABEL_47;
  }
  if (v15 <= 18346)
  {
    switch(v15)
    {
      case 17460:
        v17 = CFSTR("4388");
        goto LABEL_47;
      case 17489:
        v17 = CFSTR("4399");
        goto LABEL_47;
      case 17544:
        v17 = CFSTR("4377");
        goto LABEL_47;
    }
    goto LABEL_20;
  }
  if (v15 > 48411)
  {
    if (v15 == 48412)
    {
      v17 = CFSTR("4324");
      goto LABEL_47;
    }
    if (v15 != 48417)
      goto LABEL_20;
    goto LABEL_39;
  }
  if (v15 == 18347)
  {
    v17 = CFSTR("43452");
    goto LABEL_47;
  }
  if (v15 == 48410)
  {
    v17 = CFSTR("4334");
    goto LABEL_47;
  }
LABEL_20:

  return v16;
}

uint64_t __31__PLWifiAgent_wifiChipsetQuery__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  wifiChipsetQuery_classDebugEnabled = result;
  return result;
}

- (id)wifiManufacturerQuery
{
  PLWifiAgent *v2;
  NSString *wifiManufacturer;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSString *v32;
  void *v34;
  PLWifiAgent *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD block[5];
  _BYTE v44[128];
  uint64_t v45;

  v2 = self;
  v45 = *MEMORY[0x1E0C80C00];
  wifiManufacturer = self->_wifiManufacturer;
  if (!wifiManufacturer)
  {
    +[PLOperator entryKeyForType:andName:](PLWifiAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ModuleInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator storage](v2, "storage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastEntryForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
LABEL_37:

      wifiManufacturer = v2->_wifiManufacturer;
      return wifiManufacturer;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v7 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__PLWifiAgent_wifiManufacturerQuery__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (wifiManufacturerQuery_defaultOnce != -1)
        dispatch_once(&wifiManufacturerQuery_defaultOnce, block);
      if (wifiManufacturerQuery_classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("last module entry: %@"), v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent wifiManufacturerQuery]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 4508);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    v36 = v6;
    v37 = v4;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ModuleInfo"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "componentsSeparatedByString:", CFSTR(" "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    v35 = v2;
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v40 != v18)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("="));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "count") == 2)
          {
            objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("V"));

            if (v22)
            {
              objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
              v23 = objc_claimAutoreleasedReturnValue();

              v17 = (void *)v23;
            }
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v16);
    }
    else
    {
      v17 = 0;
    }
    v4 = v37;
    if ((objc_msgSend(v17, "isEqualToString:", CFSTR("u")) & 1) != 0)
    {
      v24 = CFSTR("usi");
      v2 = v35;
    }
    else
    {
      v2 = v35;
      if ((objc_msgSend(v17, "isEqualToString:", CFSTR("t")) & 1) != 0)
      {
        v24 = CFSTR("usi");
        goto LABEL_36;
      }
      if ((objc_msgSend(v17, "isEqualToString:", CFSTR("m")) & 1) != 0
        || !objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v24 = CFSTR("murata");
        goto LABEL_36;
      }
      v25 = objc_opt_class();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __36__PLWifiAgent_wifiManufacturerQuery__block_invoke_1640;
      v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v38[4] = v25;
      if (wifiManufacturerQuery_defaultOnce_1638 != -1)
        dispatch_once(&wifiManufacturerQuery_defaultOnce_1638, v38);
      if (!wifiManufacturerQuery_classDebugEnabled_1639)
      {
        v24 = CFSTR("murata");
        v4 = v37;
        goto LABEL_36;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLWiFiAgent wifiManufacturerQuery: manufacturer string not recognized: %@. Defaulting to murata"), v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "lastPathComponent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent wifiManufacturerQuery]");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v29, v30, 4529);

      PLLogCommon();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      v24 = CFSTR("murata");
      v4 = v37;
    }
    v6 = v36;
LABEL_36:
    v32 = v2->_wifiManufacturer;
    v2->_wifiManufacturer = &v24->isa;

    goto LABEL_37;
  }
  return wifiManufacturer;
}

uint64_t __36__PLWifiAgent_wifiManufacturerQuery__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  wifiManufacturerQuery_classDebugEnabled = result;
  return result;
}

uint64_t __36__PLWifiAgent_wifiManufacturerQuery__block_invoke_1640(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  wifiManufacturerQuery_classDebugEnabled_1639 = result;
  return result;
}

- (void)modelWiFiPower:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  double v8;
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
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  PLWifiAgent *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  __CFString *v60;
  __CFString *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  double v90;
  void *v91;
  double v92;
  double v93;
  void *v94;
  double v95;
  double v96;
  void *v97;
  double v98;
  double v99;
  void *v100;
  double v101;
  double v102;
  void *v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  double v110;
  double v111;
  PLWifiAgent *v112;
  __CFString *v113;
  __CFString *v114;
  void *v115;
  double v116;
  unsigned int v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  double v123;
  double v124;
  void *v125;
  void *v126;
  void *v127;
  double v128;
  double v129;
  void *v130;
  void *v131;
  void *v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  void *v140;
  double v141;
  double v142;
  void *v143;
  double v144;
  double v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  double v150;
  double v151;
  double v152;
  BOOL v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  void *v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  uint64_t v172;
  PLWifiAgent *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  NSObject *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  double v185;
  void *v186;
  double v187;
  double v188;
  void *v189;
  double v190;
  double v191;
  void *v192;
  double v193;
  double v194;
  void *v195;
  double v196;
  double v197;
  void *v198;
  double v199;
  double v200;
  void *v201;
  double v202;
  double v203;
  void *v204;
  double v205;
  double v206;
  void *v207;
  void *v208;
  double v209;
  double v210;
  void *v211;
  void *v212;
  double v213;
  void *v214;
  double v215;
  void *v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  double v228;
  double v229;
  void *v230;
  __CFString *v231;
  __CFString *v232;
  void *v233;
  double v234;
  unsigned int v235;
  uint64_t v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  double v241;
  void *v242;
  void *v243;
  void *v244;
  double v245;
  double v246;
  void *v247;
  void *v248;
  void *v249;
  double v250;
  void *v251;
  void *v252;
  void *v253;
  double v254;
  void *v255;
  void *v256;
  void *v257;
  double v258;
  void *v259;
  void *v260;
  void *v261;
  double v262;
  void *v263;
  void *v264;
  void *v265;
  double v266;
  double v267;
  double v268;
  void *v269;
  void *v270;
  double v271;
  double v272;
  double v273;
  void *v274;
  double v275;
  double v276;
  void *v277;
  double v278;
  double v279;
  double v280;
  void *v281;
  void *v282;
  void *v283;
  double v284;
  void *v285;
  void *v286;
  void *v287;
  double v288;
  double v289;
  double v290;
  double v291;
  double v292;
  double v293;
  double v294;
  uint64_t v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  NSObject *v301;
  double v302;
  double v303;
  char v304;
  double v305;
  double v306;
  double v307;
  double v308;
  double v309;
  double v310;
  double v311;
  double v312;
  double v313;
  double v314;
  double v315;
  double v316;
  double v317;
  double v318;
  double v319;
  double v320;
  double v321;
  double v322;
  double v323;
  double v324;
  void *v325;
  double v326;
  void *v327;
  double v328;
  double v329;
  double v330;
  double v331;
  double v332;
  PLWifiAgent *v333;
  _QWORD block[5];
  _QWORD v335[5];
  _QWORD v336[3];

  v336[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WifiPowered"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(v4, "entryDate");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TimeDuration"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "doubleValue");
      -[PLWifiAgent modelWiFiSegmentPower:withDataPower:withIdlePower:withLocationPower:withPipelinePower:withTotalDuration:](self, "modelWiFiSegmentPower:withDataPower:withIdlePower:withLocationPower:withPipelinePower:withTotalDuration:", v56, 0.0, 0.0, 0.0, 0.0, v58 / 1000.0);
LABEL_82:

      goto LABEL_83;
    }
    v6 = 0x1E0D7F000;
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004002) & 1) != 0
      || objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004003))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CurrentChannel"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "doubleValue");
      v9 = v8;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PMDuration"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v331 = v11;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MPCDuration"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v328 = v13;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TimeDuration"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v326 = v15;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TXDuration"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      v324 = v17;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RXDuration"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v322 = v19;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HSICActiveDuration"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      v320 = v21;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AssociatedScanDuration"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v24 = v23;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OtherScanDuration"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      v27 = v26;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PNOBSSIDDuration"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "doubleValue");
      v30 = v29;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PNOScanSSIDDuration"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      v33 = v32;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RoamScanDuration"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "doubleValue");
      v36 = v35;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SetupScanDuration"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "doubleValue");
      v39 = v38;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UserScanDuration"));
      v40 = self;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "doubleValue");
      v43 = v42;

      self = v40;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FRTSDuration"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "doubleValue");
      v318 = v45;

      +[PLUtilities powerModelForOperatorName:](PLUtilities, "powerModelForOperatorName:", CFSTR("wifi"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLWifiAgent wifiChipsetQuery](v40, "wifiChipsetQuery");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectForKeyedSubscript:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLWifiAgent wifiManufacturerQuery](v40, "wifiManufacturerQuery");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 >= 0.0)
      {
        v59 = v24 + v27 + v30 + v33 + v36 + v39 + v43;
        v60 = CFSTR("5");
        if (v9 != 0.0)
        {
          v61 = CFSTR("2.4");
          if (v9 > 11.0)
            v61 = CFSTR("5");
          v60 = v61;
        }
        objc_msgSend(v50, "objectForKeyedSubscript:", v60);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("tx"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "doubleValue");
        v65 = v64;

        objc_msgSend(v50, "objectForKeyedSubscript:", v60);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("rx"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "doubleValue");
        v69 = v68;

        objc_msgSend(v50, "objectForKeyedSubscript:", v60);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("cs"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "doubleValue");
        v73 = v72;

        objc_msgSend(v50, "objectForKeyedSubscript:", v60);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("hsic"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "doubleValue");
        v77 = v76;

        v78 = v326 - v331 - v328 - v324 - v322;
        if (v78 < 0.0)
          v78 = 0.0;
        v79 = v78 * v73;
        v80 = v320 + v328 + v331 + v59 - v326;
        if (v80 < 0.0)
          v80 = 0.0;
        v81 = v80 * v77;
        v82 = v324 * v65 + v322 * v69;
        v54 = v82 + v79 + v81;
        v83 = v318 - v322 - v324;
        if (v83 < 0.0)
          v83 = 0.0;
        v84 = v82 + v81 + v83 * v73;
        if (v9 == 0.0)
          v55 = 0.0;
        else
          v55 = v84;

      }
      else
      {
        objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("scan"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "doubleValue");
        v53 = v52;

        v54 = (v326 - v331 - v328) * v53;
        v55 = 0.0;
      }
    }
    else
    {
      if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004006) & 1) == 0
        && (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004004) & 1) == 0
        && !objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004008))
      {
        if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004005) & 1) != 0
          || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004007) & 1) != 0
          || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004010) & 1) != 0
          || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004013) & 1) != 0
          || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004014) & 1) != 0
          || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004015) & 1) != 0
          || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004016) & 1) != 0
          || (v55 = 0.0, v54 = 0.0, objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017)))
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CurrentChannel"));
          v184 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v184, "doubleValue");
          v330 = v185;

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PMDuration"));
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v186, "doubleValue");
          v188 = v187;

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MPCDuration"));
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v189, "doubleValue");
          v191 = v190;

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TimeDuration"));
          v192 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v192, "doubleValue");
          v194 = v193;

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TXDuration"));
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v195, "doubleValue");
          v197 = v196;

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MIMOTXDuration"));
          v198 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v198, "doubleValue");
          v200 = v199;

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RXDuration"));
          v201 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v201, "doubleValue");
          v203 = v202;

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MIMORXDuration"));
          v204 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v204, "doubleValue");
          v206 = v205;

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SISORXDuration"));
          v207 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v207, "doubleValue");

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MIMOCSDuration"));
          v208 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v208, "doubleValue");
          v210 = v209;

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SISOCSDuration"));
          v211 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v211, "doubleValue");

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OCLCSDuration"));
          v212 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v212, "doubleValue");
          v314 = v213;

          if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004015) & 1) != 0
            || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004016) & 1) != 0
            || (v317 = 0.0, objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017)))
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SCRXDurationSISO"));
            v214 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v214, "doubleValue");
            v317 = v215;

          }
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FRTSDuration"));
          v216 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v216, "doubleValue");
          v316 = v217;

          if (v206 <= v203)
            v218 = v206;
          else
            v218 = v203;
          if (v200 <= v197)
            v219 = v200;
          else
            v219 = v197;
          v323 = v219;
          v55 = 0.0;
          if (v194 - v203 - v197 - v188 - v191 >= 0.0)
            v220 = v194 - v203 - v197 - v188 - v191;
          else
            v220 = 0.0;
          if (v210 <= v220)
            v221 = v210;
          else
            v221 = v220;
          v319 = v218;
          v321 = v221;
          +[PLUtilities powerModelForOperatorName:](PLUtilities, "powerModelForOperatorName:", CFSTR("wifi"));
          v222 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLWifiAgent wifiChipsetQuery](self, "wifiChipsetQuery");
          v223 = (void *)objc_claimAutoreleasedReturnValue();
          v327 = v222;
          objc_msgSend(v222, "objectForKeyedSubscript:", v223);
          v224 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLWifiAgent wifiManufacturerQuery](self, "wifiManufacturerQuery");
          v225 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v224, "objectForKeyedSubscript:", v225);
          v226 = (void *)objc_claimAutoreleasedReturnValue();

          if (v330 >= 0.0)
          {
            v325 = v226;
            v333 = self;
            v231 = CFSTR("5");
            if (v330 != 0.0)
            {
              v232 = CFSTR("2.4");
              if (v330 > 11.0)
                v232 = CFSTR("5");
              v231 = v232;
            }
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CurrentBandwidth"));
            v233 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v233, "doubleValue");
            v235 = (int)v234;

            if (v235)
              v236 = v235;
            else
              v236 = 20;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v236);
            v237 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v226, "objectForKeyedSubscript:", v231);
            v238 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v238, "objectForKeyedSubscript:", v237);
            v239 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v239, "objectForKeyedSubscript:", CFSTR("mimo_tx"));
            v240 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v240, "doubleValue");
            v312 = v241;

            objc_msgSend(v226, "objectForKeyedSubscript:", v231);
            v242 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v242, "objectForKeyedSubscript:", v237);
            v243 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v243, "objectForKeyedSubscript:", CFSTR("mimo_rx"));
            v244 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v244, "doubleValue");
            v246 = v245;

            objc_msgSend(v226, "objectForKeyedSubscript:", v231);
            v247 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v247, "objectForKeyedSubscript:", v237);
            v248 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v248, "objectForKeyedSubscript:", CFSTR("mimo_cs"));
            v249 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v249, "doubleValue");
            v315 = v250;

            objc_msgSend(v226, "objectForKeyedSubscript:", v231);
            v251 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v251, "objectForKeyedSubscript:", v237);
            v252 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v252, "objectForKeyedSubscript:", CFSTR("siso_tx"));
            v253 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v253, "doubleValue");
            v311 = v254;

            objc_msgSend(v226, "objectForKeyedSubscript:", v231);
            v255 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v255, "objectForKeyedSubscript:", v237);
            v256 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v256, "objectForKeyedSubscript:", CFSTR("siso_rx"));
            v257 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v257, "doubleValue");
            v310 = v258;

            objc_msgSend(v226, "objectForKeyedSubscript:", v231);
            v259 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v259, "objectForKeyedSubscript:", v237);
            v260 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v260, "objectForKeyedSubscript:", CFSTR("siso_cs"));
            v261 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v261, "doubleValue");
            v313 = v262;

            objc_msgSend(v226, "objectForKeyedSubscript:", v231);
            v263 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v263, "objectForKeyedSubscript:", v237);
            v264 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v264, "objectForKeyedSubscript:", CFSTR("ocl_cs"));
            v265 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v265, "doubleValue");
            v309 = v266;

            v267 = v321;
            if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004015) & 1) != 0
              || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004016) & 1) != 0
              || (v268 = 0.0, objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017)))
            {
              objc_msgSend(v226, "objectForKeyedSubscript:", v231);
              v269 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v269, "objectForKeyedSubscript:", CFSTR("sc"));
              v270 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v270, "doubleValue");
              v268 = v271;

            }
            v272 = v203 - v319;
            self = v333;
            v6 = 0x1E0D7F000;
            if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004005) & 1) != 0
              || objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004007))
            {
              v273 = v272 * v310 + v319 * v246;
              v230 = v327;
            }
            else
            {
              v308 = v246;
              objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OPSFullDuration"));
              v274 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v274, "doubleValue");
              v276 = v275;

              objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OPSPartialDuration"));
              v277 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v277, "doubleValue");
              v279 = v278;

              if (v276 < 0.0)
                v276 = 0.0;
              if (v279 >= 0.0)
                v280 = v279;
              else
                v280 = 0.0;
              objc_msgSend(v226, "objectForKeyedSubscript:", v231);
              v281 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v281, "objectForKeyedSubscript:", v237);
              v282 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v282, "objectForKeyedSubscript:", CFSTR("ops_full"));
              v283 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v283, "doubleValue");
              v307 = v284;

              objc_msgSend(v226, "objectForKeyedSubscript:", v231);
              v285 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v285, "objectForKeyedSubscript:", v237);
              v286 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v286, "objectForKeyedSubscript:", CFSTR("ops_partial"));
              v287 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v287, "doubleValue");
              v289 = v288;

              v290 = v272 * v310;
              v230 = v327;
              if (v319 <= v276 + v280)
                v273 = v290 + v319 * v308;
              else
                v273 = v290 + (v319 - v276 - v280) * v308 + v280 * v289 + v276 * v307;
              self = v333;
              v6 = 0x1E0D7F000uLL;
              v267 = v321;
            }
            v291 = v220 - v267;
            if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004005) & 1) != 0
              || (objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 100020) & 1) != 0
              || (objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 100021) & 1) != 0
              || v314 > v267)
            {
              v292 = v291 * v313 + v267 * v315;
            }
            else
            {
              v292 = v314 * v309 + (v267 - v314) * v315 + v291 * v313;
            }
            if ((objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004015) & 1) != 0
              || (objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004016) & 1) != 0
              || (v293 = 0.0, objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004017)))
            {
              v293 = v317 * v268;
            }
            v294 = (v197 - v323) * v311 + v323 * v312;
            if (objc_msgSend(*(id *)(v6 + 4000), "debugEnabled"))
            {
              v295 = objc_opt_class();
              v335[0] = MEMORY[0x1E0C809B0];
              v335[1] = 3221225472;
              v335[2] = __30__PLWifiAgent_modelWiFiPower___block_invoke;
              v335[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v335[4] = v295;
              if (modelWiFiPower__defaultOnce != -1)
                dispatch_once(&modelWiFiPower__defaultOnce, v335);
              if (modelWiFiPower__classDebugEnabled)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("txE = %f, rxE = %f, csE = %f, scE = %f"), *(_QWORD *)&v294, *(_QWORD *)&v273, *(_QWORD *)&v292, *(_QWORD *)&v293);
                v296 = (void *)objc_claimAutoreleasedReturnValue();
                v297 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
                v298 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v298, "lastPathComponent");
                v299 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent modelWiFiPower:]");
                v300 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v297, "logMessage:fromFile:fromFunction:fromLineNumber:", v296, v299, v300, 4826);

                PLLogCommon();
                v301 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v301, OS_LOG_TYPE_DEBUG))
                  __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

                self = v333;
                v6 = 0x1E0D7F000;
                v230 = v327;
              }
            }
            v302 = v294 + v273;
            if (v316 - v203 - v197 >= 0.0)
              v303 = v316 - v203 - v197;
            else
              v303 = 0.0;
            v304 = objc_msgSend(MEMORY[0x1E0D80020], "isWiFiClass:", 1004005);
            if (v303 >= v267)
            {
              if ((v304 & 1) != 0
                || (objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 100020) & 1) != 0
                || (objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 100021) & 1) != 0
                || v314 > v303)
              {
                v305 = (v303 - v267) * v313 + v267 * v315;
              }
              else
              {
                v305 = v314 * v309 + (v267 - v314) * v315 + (v303 - v267) * v313;
              }
            }
            else if ((v304 & 1) != 0
                   || (objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 100020) & 1) != 0
                   || (objc_msgSend(MEMORY[0x1E0D80020], "isDeviceClass:", 100021) & 1) != 0
                   || v314 > v303)
            {
              v305 = v303 * v315;
            }
            else
            {
              v305 = v314 * v309 + (v303 - v314) * v315;
            }
            v54 = v302 + v292 + v293;
            if (v305 < 0.0)
              v305 = 0.0;
            v306 = v302 + v305;
            if (v330 == 0.0)
              v55 = 0.0;
            else
              v55 = v306;

            v226 = v325;
          }
          else
          {
            objc_msgSend(v226, "objectForKeyedSubscript:", CFSTR("scan"), v330);
            v227 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v227, "doubleValue");
            v229 = v228;

            v54 = (v194 - v188 - v191) * v229;
            v230 = v327;
          }

        }
        goto LABEL_43;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CurrentChannel"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "doubleValue");
      v87 = v86;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PMDuration"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "doubleValue");
      v90 = v89;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MPCDuration"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "doubleValue");
      v93 = v92;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TimeDuration"));
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "doubleValue");
      v96 = v95;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TXDuration"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "doubleValue");
      v99 = v98;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RXDuration"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "doubleValue");
      v102 = v101;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FRTSDuration"));
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "doubleValue");
      v105 = v104;

      +[PLUtilities powerModelForOperatorName:](PLUtilities, "powerModelForOperatorName:", CFSTR("wifi"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLWifiAgent wifiChipsetQuery](self, "wifiChipsetQuery");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectForKeyedSubscript:", v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLWifiAgent wifiManufacturerQuery](self, "wifiManufacturerQuery");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "objectForKeyedSubscript:", v108);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (v87 < 0.0)
      {
        objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("scan"));
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "doubleValue");
        v111 = v110;

        v54 = (v96 - v90 - v93) * v111;
        v55 = 0.0;
LABEL_42:

LABEL_43:
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LocationScanDuration"));
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "doubleValue");
        v142 = v141;

        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PipelineScanDuration"));
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "doubleValue");
        v145 = v144;

        +[PLUtilities powerModelForOperatorName:](PLUtilities, "powerModelForOperatorName:", CFSTR("wifi"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLWifiAgent wifiChipset](self, "wifiChipset");
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "objectForKeyedSubscript:", v146);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLWifiAgent wifiManufacturer](self, "wifiManufacturer");
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "objectForKeyedSubscript:", v148);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("scan"));
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "doubleValue");
        v151 = v150;

        v152 = v142 * v151;
        v153 = v142 <= 0.0;
        v154 = 0.0;
        if (v153)
          v155 = 0.0;
        else
          v155 = v152;
        if (v145 <= 0.0)
          v156 = 0.0;
        else
          v156 = v145 * v151;
        v157 = v54 - v55 - v155 - v156;
        if (v55 < 0.0)
          v55 = 0.0;
        if (v157 >= 0.0)
          v158 = v157;
        else
          v158 = 0.0;
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TimeDuration"));
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "doubleValue");
        v161 = v160;

        v162 = 0.0;
        v163 = 0.0;
        v164 = 0.0;
        v165 = 0.0;
        if (v161 > 0.0)
        {
          if (v156 >= 0.0)
            v166 = v156;
          else
            v166 = 0.0;
          if (v155 >= 0.0)
            v167 = v155;
          else
            v167 = 0.0;
          if (v54 >= 0.0)
            v168 = v54;
          else
            v168 = 0.0;
          v154 = v168 / v161;
          v163 = v167 / v161;
          v153 = v168 <= v55;
          v164 = v166 / v161;
          if (v153)
          {
            if (v154 <= v163 + v164)
              v162 = 0.0;
            else
              v162 = v154 - v163 - v164;
          }
          else
          {
            v162 = v55 / v161;
            v165 = v158 / v161;
          }
        }
        v169 = v162;
        v170 = v164;
        v171 = v163;
        if (objc_msgSend(*(id *)(v6 + 4000), "debugEnabled"))
        {
          v172 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __30__PLWifiAgent_modelWiFiPower___block_invoke_1685;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v172;
          if (modelWiFiPower__defaultOnce_1683 != -1)
            dispatch_once(&modelWiFiPower__defaultOnce_1683, block);
          if (modelWiFiPower__classDebugEnabled_1684)
          {
            v173 = self;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wifi_power = %f, wifi_power_data = %f, wifi_power_location = %f, wifi_power_wow = %f, wifi_power_idle = %f"), *(_QWORD *)&v154, *(_QWORD *)&v169, *(_QWORD *)&v171, 0, *(_QWORD *)&v165);
            v174 = (void *)objc_claimAutoreleasedReturnValue();
            v175 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLWifiAgent.m");
            v176 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v176, "lastPathComponent");
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLWifiAgent modelWiFiPower:]");
            v178 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v175, "logMessage:fromFile:fromFunction:fromLineNumber:", v174, v177, v178, 4943);

            PLLogCommon();
            v179 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v179, OS_LOG_TYPE_DEBUG))
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

            self = v173;
          }
        }
        if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
        {
          +[PLOperator entryKeyForType:andName:](PLWifiAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("MetricMonitorInstantKeys"));
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          v181 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v180);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v154);
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v181, "setObject:forKeyedSubscript:", v182, CFSTR("WifiPower"));
          if (-[PLWifiAgent wifiAwdlDevice](self, "wifiAwdlDevice"))
          {
            -[PLWifiAgent wifiAwdlDevice](self, "wifiAwdlDevice");
            WiFiDeviceClientCopyInterfaceStateInfo();

          }
          v336[0] = v181;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v336, 1);
          v183 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLOperator postEntries:](self, "postEntries:", v183);

        }
        else
        {
          objc_msgSend(v4, "entryDate");
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLWifiAgent modelWiFiSegmentPower:withDataPower:withIdlePower:withLocationPower:withPipelinePower:withTotalDuration:](self, "modelWiFiSegmentPower:withDataPower:withIdlePower:withLocationPower:withPipelinePower:withTotalDuration:", v180, v169, v165, v171, v170, v161 / 1000.0);
        }

        goto LABEL_82;
      }
      v329 = v105;
      v332 = v90;
      v112 = self;
      v113 = CFSTR("5");
      if (v87 != 0.0)
      {
        v114 = CFSTR("2.4");
        if (v87 > 11.0)
          v114 = CFSTR("5");
        v113 = v114;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CurrentBandwidth"));
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "doubleValue");
      v117 = (int)v116;

      if (v117)
        v118 = v117;
      else
        v118 = 20;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKeyedSubscript:", v113);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "objectForKeyedSubscript:", v119);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "objectForKeyedSubscript:", CFSTR("tx"));
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "doubleValue");
      v124 = v123;

      objc_msgSend(v50, "objectForKeyedSubscript:", v113);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "objectForKeyedSubscript:", v119);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("rx"));
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "doubleValue");
      v129 = v128;

      objc_msgSend(v50, "objectForKeyedSubscript:", v113);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "objectForKeyedSubscript:", v119);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "objectForKeyedSubscript:", CFSTR("cs"));
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "doubleValue");
      v134 = v133;

      v135 = v99 * v124;
      v136 = v96 - v332 - v93 - v99 - v102;
      v55 = 0.0;
      if (v136 < 0.0)
        v136 = 0.0;
      v137 = v136 * v134;
      v138 = v135 + v102 * v129;
      if (v87 != 0.0)
      {
        v139 = v329 - v102 - v99;
        if (v139 < 0.0)
          v139 = 0.0;
        v55 = v138 + v139 * v134;
      }
      v54 = v138 + v137;

      self = v112;
    }
    v6 = 0x1E0D7F000uLL;
    goto LABEL_42;
  }
LABEL_83:

}

uint64_t __30__PLWifiAgent_modelWiFiPower___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  modelWiFiPower__classDebugEnabled = result;
  return result;
}

uint64_t __30__PLWifiAgent_modelWiFiPower___block_invoke_1685(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  modelWiFiPower__classDebugEnabled_1684 = result;
  return result;
}

- (void)modelWiFiSegmentPower:(id)a3 withDataPower:(double)a4 withIdlePower:(double)a5 withLocationPower:(double)a6 withPipelinePower:(double)a7 withTotalDuration:(double)a8
{
  char v15;
  void *v16;
  double v17;
  double v18;
  double wifi_segment_lastWrittenTimestamp;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;

  v26 = a3;
  v15 = objc_msgSend(MEMORY[0x1E0D80020], "isHomePod");
  v16 = v26;
  if ((v15 & 1) == 0)
  {
    objc_msgSend(v26, "timeIntervalSince1970");
    v18 = v17;
    if (self->_wifi_segment_lastWrittenDate)
    {
      wifi_segment_lastWrittenTimestamp = self->_wifi_segment_lastWrittenTimestamp;
      v20 = self->_wifi_segment_timestamp - wifi_segment_lastWrittenTimestamp;
      v21 = 0.0;
      v22 = 0.0;
      v23 = 0.0;
      v24 = 0.0;
      if (v20 > 0.0)
      {
        v21 = v20 * self->_wifi_segment_power_data;
        v22 = v20 * self->_wifi_segment_power_idle;
        v23 = v20 * self->_wifi_segment_power_location;
        v24 = v20 * self->_wifi_segment_power_pipeline;
      }
      v25 = v18 - wifi_segment_lastWrittenTimestamp;
      v16 = v26;
      if (v25 > 0.0)
      {
        self->_wifi_segment_power_data = (v21 + a4 * a8) / v25;
        self->_wifi_segment_power_idle = (v22 + a5 * a8) / v25;
        self->_wifi_segment_power_location = (v23 + a6 * a8) / v25;
        self->_wifi_segment_power_pipeline = (v24 + a7 * a8) / v25;
        objc_storeStrong((id *)&self->_wifi_segment_date, a3);
        v16 = v26;
        self->_wifi_segment_timestamp = v18;
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_wifi_segment_lastWrittenDate, a3);
      self->_wifi_segment_lastWrittenTimestamp = v18;
      objc_storeStrong((id *)&self->_wifi_segment_date, a3);
      self->_wifi_segment_timestamp = self->_wifi_segment_lastWrittenTimestamp;
      self->_wifi_segment_power_data = a4;
      self->_wifi_segment_power_idle = a5;
      self->_wifi_segment_power_location = a6;
      self->_wifi_segment_power_pipeline = a7;
      v16 = v26;
    }
  }

}

- (void)writeModeledPower
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0
    && self->_wifi_segment_timestamp != self->_wifi_segment_lastWrittenTimestamp)
  {
    if (self->_wifi_segment_power_data > 2500.0)
      self->_wifi_segment_power_data = 2500.0;
    if (self->_wifi_segment_power_idle > 2500.0)
      self->_wifi_segment_power_idle = 2500.0;
    if (self->_wifi_segment_power_location > 2500.0)
      self->_wifi_segment_power_location = 2500.0;
    if (self->_wifi_segment_power_pipeline > 2500.0)
      self->_wifi_segment_power_pipeline = 2500.0;
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 11, self->_wifi_segment_date, self->_wifi_segment_power_data);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 53, self->_wifi_segment_date, self->_wifi_segment_power_idle);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 12, self->_wifi_segment_date, self->_wifi_segment_power_location);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 13, self->_wifi_segment_date, self->_wifi_segment_power_pipeline);

    objc_storeStrong((id *)&self->_wifi_segment_lastWrittenDate, self->_wifi_segment_date);
    self->_wifi_segment_lastWrittenTimestamp = self->_wifi_segment_timestamp;
  }
}

- (void)handleRemoteSessionCallbackWithUserInfo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("event"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entryDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v5, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 11, CFSTR("ScreenContinuityShell"), v6);
    else
      objc_msgSend(v5, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 11, CFSTR("ScreenContinuityShell"), v6);

    v3 = v7;
  }

}

- (PLEntry)lastEntryForHelperd
{
  return self->_lastEntryForHelperd;
}

- (void)setLastEntryForHelperd:(id)a3
{
  objc_storeStrong((id *)&self->_lastEntryForHelperd, a3);
}

- (PLCFNotificationOperatorComposition)notificationWiFiChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (__WiFiManagerClient)wifiManager
{
  return self->_wifiManager;
}

- (__WiFiDeviceClient)wifiDevice
{
  return self->_wifiDevice;
}

- (__WiFiDeviceClient)wifiAwdlDevice
{
  return self->_wifiAwdlDevice;
}

- (void)setWifiAwdlDevice:(__WiFiDeviceClient *)a3
{
  self->_wifiAwdlDevice = a3;
}

- (__WiFiDeviceClient)wifiHotspotDevice
{
  return self->_wifiHotspotDevice;
}

- (void)setWifiHotspotDevice:(__WiFiDeviceClient *)a3
{
  self->_wifiHotspotDevice = a3;
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PLEntryNotificationOperatorComposition)sbcLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSbcLevelChanged:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (PLEntryNotificationOperatorComposition)deviceWake
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDeviceWake:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLNSNotificationOperatorComposition)thermalMonitorListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setThermalMonitorListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PLXPCListenerOperatorComposition)remoteControlSessionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRemoteControlSessionListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (unint64_t)lastLoggedTimestamp
{
  return self->_lastLoggedTimestamp;
}

- (void)setLastLoggedTimestamp:(unint64_t)a3
{
  self->_lastLoggedTimestamp = a3;
}

- (unint64_t)locationScanDuration
{
  return self->_locationScanDuration;
}

- (void)setLocationScanDuration:(unint64_t)a3
{
  self->_locationScanDuration = a3;
}

- (unint64_t)pipelineScanDuration
{
  return self->_pipelineScanDuration;
}

- (void)setPipelineScanDuration:(unint64_t)a3
{
  self->_pipelineScanDuration = a3;
}

- (unint64_t)autoJoinScanDuration
{
  return self->_autoJoinScanDuration;
}

- (void)setAutoJoinScanDuration:(unint64_t)a3
{
  self->_autoJoinScanDuration = a3;
}

- (unint64_t)setupScanDuration
{
  return self->_setupScanDuration;
}

- (void)setSetupScanDuration:(unint64_t)a3
{
  self->_setupScanDuration = a3;
}

- (unint64_t)unknownScanDuration
{
  return self->_unknownScanDuration;
}

- (void)setUnknownScanDuration:(unint64_t)a3
{
  self->_unknownScanDuration = a3;
}

- (WiFiP2PAWDLStateMonitor)monitor
{
  return (WiFiP2PAWDLStateMonitor *)objc_getProperty(self, a2, 184, 1);
}

- (void)setMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSString)wifiChipset
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (NSString)wifiManufacturer
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (unint64_t)remainingAllowedRSSIEntryCount
{
  return self->_remainingAllowedRSSIEntryCount;
}

- (void)setRemainingAllowedRSSIEntryCount:(unint64_t)a3
{
  self->_remainingAllowedRSSIEntryCount = a3;
}

- (double)wifi_segment_power_data
{
  return self->_wifi_segment_power_data;
}

- (void)setWifi_segment_power_data:(double)a3
{
  self->_wifi_segment_power_data = a3;
}

- (double)wifi_segment_power_idle
{
  return self->_wifi_segment_power_idle;
}

- (void)setWifi_segment_power_idle:(double)a3
{
  self->_wifi_segment_power_idle = a3;
}

- (double)wifi_segment_power_location
{
  return self->_wifi_segment_power_location;
}

- (void)setWifi_segment_power_location:(double)a3
{
  self->_wifi_segment_power_location = a3;
}

- (double)wifi_segment_power_pipeline
{
  return self->_wifi_segment_power_pipeline;
}

- (void)setWifi_segment_power_pipeline:(double)a3
{
  self->_wifi_segment_power_pipeline = a3;
}

- (NSDate)wifi_segment_lastWrittenDate
{
  return (NSDate *)objc_getProperty(self, a2, 248, 1);
}

- (void)setWifi_segment_lastWrittenDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (double)wifi_segment_lastWrittenTimestamp
{
  return self->_wifi_segment_lastWrittenTimestamp;
}

- (void)setWifi_segment_lastWrittenTimestamp:(double)a3
{
  self->_wifi_segment_lastWrittenTimestamp = a3;
}

- (NSDate)wifi_segment_date
{
  return (NSDate *)objc_getProperty(self, a2, 264, 1);
}

- (void)setWifi_segment_date:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (double)wifi_segment_timestamp
{
  return self->_wifi_segment_timestamp;
}

- (void)setWifi_segment_timestamp:(double)a3
{
  self->_wifi_segment_timestamp = a3;
}

- (PLEntryNotificationOperatorComposition)remoteSessionCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 280, 1);
}

- (void)setRemoteSessionCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteSessionCallback, 0);
  objc_storeStrong((id *)&self->_wifi_segment_date, 0);
  objc_storeStrong((id *)&self->_wifi_segment_lastWrittenDate, 0);
  objc_storeStrong((id *)&self->_wifiManufacturer, 0);
  objc_storeStrong((id *)&self->_wifiChipset, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_remoteControlSessionListener, 0);
  objc_storeStrong((id *)&self->_thermalMonitorListener, 0);
  objc_storeStrong((id *)&self->_deviceWake, 0);
  objc_storeStrong((id *)&self->_sbcLevelChanged, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
  objc_storeStrong((id *)&self->_notificationWiFiChanged, 0);
  objc_storeStrong((id *)&self->_lastEntryForHelperd, 0);
}

void __39__PLWifiAgent_initOperatorDependancies__block_invoke_557_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_11();
  _os_log_error_impl(&dword_1DA9D6000, v0, OS_LOG_TYPE_ERROR, "cellFallbackObserver could not be created", v1, 2u);
  OUTLINED_FUNCTION_6();
}

void __39__PLWifiAgent_initOperatorDependancies__block_invoke_573_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "RemoteControlSession payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)logEventBackwardWifiProperties:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "wifi properties: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
