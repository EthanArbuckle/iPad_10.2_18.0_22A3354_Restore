@implementation PLProcessNetworkAgent

void __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLLogNetwork();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "Notification for sysdiagnose trigger for network bitmaps: %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Source"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Source"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", &unk_1E86320D0);

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "setCurNetworkBitmapTimestampForSysdiagnoseTrigger:", -1);
      objc_msgSend(*(id *)(a1 + 32), "logEventBackwardNetworkBitmapsSysdiagnoseTrigger");
    }
  }

}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLProcessNetworkAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("Connection");
  +[PLProcessNetworkAgent entryEventPointDefinitionConnection](PLProcessNetworkAgent, "entryEventPointDefinitionConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventPointDefinitionConnection
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
  _QWORD v38[15];
  _QWORD v39[15];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[2];
  _QWORD v43[4];

  v43[2] = *MEMORY[0x1E0C80C00];
  v42[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v40[0] = *MEMORY[0x1E0D80318];
  v40[1] = v2;
  v41[0] = &unk_1E86529D0;
  v41[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80270];
  v40[2] = *MEMORY[0x1E0D80278];
  v40[3] = v3;
  v41[2] = &unk_1E8632088;
  v41[3] = &unk_1E86320A0;
  v40[4] = *MEMORY[0x1E0D80250];
  v41[4] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v37;
  v42[1] = *MEMORY[0x1E0D802F0];
  v38[0] = CFSTR("EventType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "commonTypeDict_IntegerFormat");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v35;
  v38[1] = CFSTR("InterfaceName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "commonTypeDict_StringFormat");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v33;
  v38[2] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_StringFormat_withBundleID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v31;
  v38[3] = CFSTR("ProcessPID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v29;
  v38[4] = CFSTR("ProviderType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v27;
  v38[5] = CFSTR("LocalAddress");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_StringFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[5] = v25;
  v38[6] = CFSTR("LocalPort");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v39[6] = v23;
  v38[7] = CFSTR("RemoteAddress");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_StringFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39[7] = v21;
  v38[8] = CFSTR("RemotePort");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[8] = v19;
  v38[9] = CFSTR("TrafficClass");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_StringFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39[9] = v17;
  v38[10] = CFSTR("rxWifiBytes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v39[10] = v15;
  v38[11] = CFSTR("txWifiBytes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39[11] = v5;
  v38[12] = CFSTR("rxCellularBytes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39[12] = v7;
  v38[13] = CFSTR("txCellularBytes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39[13] = v9;
  v38[14] = CFSTR("isChannelArch");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_BoolFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39[14] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryEventForwardDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("LowInternet");
  +[PLProcessNetworkAgent entryEventForwardDefinitionLowInternet](PLProcessNetworkAgent, "entryEventForwardDefinitionLowInternet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("HighCellularBWTransactions");
  +[PLProcessNetworkAgent entryEventForwardDefinitionHighCellularBWTransactions](PLProcessNetworkAgent, "entryEventForwardDefinitionHighCellularBWTransactions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("HighCellularBWTransactionsDetail");
  +[PLProcessNetworkAgent entryEventForwardDefinitionHighCellularBWTransactionsDetail](PLProcessNetworkAgent, "entryEventForwardDefinitionHighCellularBWTransactionsDetail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryEventBackwardDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("Usage");
  +[PLProcessNetworkAgent entryEventBackwardDefinitionUsage](PLProcessNetworkAgent, "entryEventBackwardDefinitionUsage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("NetworkBitmap");
  v7[0] = v2;
  +[PLProcessNetworkAgent entryEventBackwardDefinitionNetworkBitmap](PLProcessNetworkAgent, "entryEventBackwardDefinitionNetworkBitmap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)entryEventIntervalDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("UsageDiff");
  +[PLProcessNetworkAgent entryEventIntervalDefinitionUsage](PLProcessNetworkAgent, "entryEventIntervalDefinitionUsage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventBackwardDefinitionNetworkBitmap
{
  uint64_t v2;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[7];
  _QWORD v26[7];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[2];
  _QWORD v30[4];

  v30[2] = *MEMORY[0x1E0C80C00];
  v29[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v27[0] = *MEMORY[0x1E0D80318];
  v27[1] = v2;
  v28[0] = &unk_1E86529E0;
  v28[1] = MEMORY[0x1E0C9AAB0];
  v27[2] = *MEMORY[0x1E0D80250];
  v28[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v18;
  v29[1] = *MEMORY[0x1E0D802F0];
  v25[0] = CFSTR("BundleName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat_withBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v16;
  v25[1] = CFSTR("CurrentMachAbsoluteTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v3;
  v25[2] = CFSTR("MachAbsoluteStartTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v5;
  v25[3] = CFSTR("MachAbsoluteEndTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v7;
  v25[4] = *MEMORY[0x1E0DB03D8];
  v23 = *MEMORY[0x1E0D80358];
  v8 = v23;
  v24 = &unk_1E86320B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v9;
  v25[5] = *MEMORY[0x1E0DB03B0];
  v21 = v8;
  v22 = &unk_1E86320B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v10;
  v25[6] = *MEMORY[0x1E0DB03C0];
  v19 = v8;
  v20 = &unk_1E86320B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryEventForwardDefinitionLowInternet
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
  v2 = *MEMORY[0x1E0D80330];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E86529F0;
  v12[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("Mode");
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

+ (id)entryEventBackwardDefinitionUsage
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
  _QWORD v23[8];
  _QWORD v24[8];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[4];

  v28[2] = *MEMORY[0x1E0C80C00];
  v27[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v25[0] = *MEMORY[0x1E0D80318];
  v25[1] = v2;
  v26[0] = &unk_1E8652A00;
  v26[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  v27[1] = *MEMORY[0x1E0D802F0];
  v23[0] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_StringFormat_withBundleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  v23[1] = CFSTR("BundleName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_StringFormat_withBundleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v18;
  v23[2] = CFSTR("ExtensionName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat_withBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v16;
  v23[3] = CFSTR("WifiIn");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v14;
  v23[4] = CFSTR("WifiOut");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v4;
  v23[5] = CFSTR("CellIn");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v6;
  v23[6] = CFSTR("CellOut");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v8;
  v23[7] = CFSTR("SinceTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_DateFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventIntervalDefinitionUsage
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
  _QWORD v23[8];
  _QWORD v24[8];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[2];
  _QWORD v28[4];

  v28[2] = *MEMORY[0x1E0C80C00];
  v27[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v25[0] = *MEMORY[0x1E0D80318];
  v25[1] = v2;
  v26[0] = &unk_1E8652A00;
  v26[1] = CFSTR("logEventBackwardUsage");
  v25[2] = *MEMORY[0x1E0D80250];
  v26[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  v27[1] = *MEMORY[0x1E0D802F0];
  v23[0] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_StringFormat_withBundleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  v23[1] = CFSTR("BundleName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_StringFormat_withBundleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v18;
  v23[2] = CFSTR("ExtensionName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat_withBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v16;
  v23[3] = CFSTR("WifiIn");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v14;
  v23[4] = CFSTR("WifiOut");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v4;
  v23[5] = CFSTR("CellIn");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v6;
  v23[6] = CFSTR("CellOut");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v8;
  v23[7] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_DateFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardDefinitionHighCellularBWTransactions
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
  _QWORD v14[4];
  _QWORD v15[4];
  uint64_t v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18[0] = *MEMORY[0x1E0D80298];
  v16 = *MEMORY[0x1E0D80318];
  v17 = &unk_1E86529F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("HighThroughputStartReason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("HighThroughputLinkRxTputAfterStart");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("HighThroughputLinkTxTputAfterStart");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("HighThroughputOriginators");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventForwardDefinitionHighCellularBWTransactionsDetail
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
  _QWORD v29[4];
  _QWORD v30[4];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];
  _QWORD v38[5];

  v38[3] = *MEMORY[0x1E0C80C00];
  v37[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802A8];
  v35[0] = *MEMORY[0x1E0D80318];
  v35[1] = v2;
  v36[0] = &unk_1E86529F0;
  v36[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v28;
  v37[1] = *MEMORY[0x1E0D802F0];
  v33[0] = CFSTR("HighThroughputStartReason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v26;
  v33[1] = CFSTR("HighThroughputLinkRxTputAfterStart");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v24;
  v33[2] = CFSTR("HighThroughputLinkTxTputAfterStart");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v22;
  v33[3] = CFSTR("HighThroughputOriginators");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_StringFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v20;
  v33[4] = CFSTR("HighThroughputDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v17;
  v37[2] = *MEMORY[0x1E0D802B0];
  v31[0] = CFSTR("key");
  v29[0] = CFSTR("Participant");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_StringFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v15;
  v29[1] = CFSTR("Duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v3;
  v29[2] = CFSTR("RxBytes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v5;
  v29[3] = CFSTR("TxBytes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = CFSTR("value");
  v32[0] = v8;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLProcessNetworkAgent)init
{
  PLProcessNetworkAgent *v2;
  uint64_t v3;
  NSMutableSet *processes;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLProcessNetworkAgent;
  v2 = -[PLAgent init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    processes = v2->_processes;
    v2->_processes = (NSMutableSet *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_processesOfInterest_, CFSTR("PLProcessNetworkAgent.addProcessesOfInterest"), 0);

  }
  return v2;
}

- (void)initOperatorDependancies
{
  int v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  uint8_t buf[16];
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void *v35;
  PLProcessNetworkAgent *v36;

  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    -[PLOperator workQueue](self, "workQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v4;
    v33 = 3221225472;
    v34 = __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke;
    v35 = &unk_1E85793B8;
    v36 = self;
    -[PLProcessNetworkAgent setStatManagerRef:](self, "setStatManagerRef:", NStatManagerCreate());

    if (-[PLProcessNetworkAgent statManagerRef](self, "statManagerRef"))
    {
      NStatManagerAddAllTCP();
      NStatManagerAddAllUDP();
    }
    else
    {
      PLLogNetwork();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_ERROR, "Failed to create NStatManager, not tracking network connection statistics", buf, 2u);
      }

    }
  }
  -[PLProcessNetworkAgent setLastNetworkBitmapTimestamp:](self, "setLastNetworkBitmapTimestamp:", -1);
  -[PLProcessNetworkAgent setCurNetworkBitmapTimestampForSysdiagnoseTrigger:](self, "setCurNetworkBitmapTimestampForSysdiagnoseTrigger:", -1);
  if (-[PLProcessNetworkAgent hasSymptomsLogging](self, "hasSymptomsLogging"))
  {
    v7 = objc_alloc(MEMORY[0x1E0DB02B0]);
    v8 = (void *)objc_msgSend(v7, "initWorkspaceWithService:", *MEMORY[0x1E0DB0528]);
    if (v8)
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DB0698]), "initWithWorkspace:", v8);
      if (v9)
      {
        v10 = v9;
        -[PLProcessNetworkAgent setUsageFeed:](self, "setUsageFeed:", v9);
      }
      else
      {
        PLLogNetwork();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_ERROR, "Failed to initialize usage feed", buf, 2u);
        }

        v10 = 0;
      }
    }
    else
    {
      PLLogNetwork();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_ERROR, "Failed to create AnalyticsWorkspace", buf, 2u);
      }
    }

    if (-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
    {
      v12 = (void *)MEMORY[0x1E0D80000];
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDateWithTimeIntervalSinceNow:", 5.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator workQueue](self, "workQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v4;
      v30[1] = 3221225472;
      v30[2] = __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_150;
      v30[3] = &unk_1E85793E0;
      v30[4] = self;
      objc_msgSend(v12, "scheduledTimerWithMonotonicFireDate:withInterval:withQueue:withBlock:", v13, v14, v30, 5.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLProcessNetworkAgent setLogUsageTimer:](self, "setLogUsageTimer:", v15);

      if (-[PLProcessNetworkAgent hasSymptomsLogging](self, "hasSymptomsLogging"))
      {
        v16 = objc_alloc(MEMORY[0x1E0D7FF80]);
        -[PLOperator workQueue](self, "workQueue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v4;
        v29[1] = 3221225472;
        v29[2] = __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_2;
        v29[3] = &unk_1E8577F48;
        v29[4] = self;
        v18 = (void *)objc_msgSend(v16, "initWithWorkQueue:forNotification:requireState:withBlock:", v17, CFSTR("com.apple.powerlogd.flushNetworkBitmaps"), 0, v29);
        -[PLProcessNetworkAgent setFlushNetworkBitmapsListener:](self, "setFlushNetworkBitmapsListener:", v18);

      }
      v19 = 0;
    }
    else
    {
      v28[0] = v4;
      v28[1] = 3221225472;
      v28[2] = __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_3;
      v28[3] = &unk_1E8577F48;
      v28[4] = self;
      objc_msgSend(MEMORY[0x1E0D7FFC8], "significantBatteryChangeNotificationWithOperator:withBlock:", self, v28);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (-[PLProcessNetworkAgent hasSymptomsLogging](self, "hasSymptomsLogging"))
    {
      v27[0] = v4;
      v27[1] = 3221225472;
      v27[2] = __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_4;
      v27[3] = &unk_1E8577F48;
      v27[4] = self;
      objc_msgSend(MEMORY[0x1E0D7FFC8], "significantBatteryChangeNotificationWithOperator:withMaxIntervalInSecs:withBlock:", self, v27, 900.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLProcessNetworkAgent setBatteryLevelChangedListenerForNetworkBitmap:](self, "setBatteryLevelChangedListenerForNetworkBitmap:", v20);

      v26[0] = v4;
      v26[1] = 3221225472;
      v26[2] = __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_5;
      v26[3] = &unk_1E8577F48;
      v26[4] = self;
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80010]), "initWithOperator:forNotification:withBlock:", self, CFSTR("PLThermalMonitorNotification"), v26);
      -[PLProcessNetworkAgent setSysdiagnoseListener:](self, "setSysdiagnoseListener:", v21);

    }
    -[PLProcessNetworkAgent setBatteryLevelChanged:](self, "setBatteryLevelChanged:", v19);
    -[PLProcessNetworkAgent logEventForwardLowInternet](self, "logEventForwardLowInternet");
    -[PLProcessNetworkAgent logEventBackwardNetworkBitmaps](self, "logEventBackwardNetworkBitmaps");
    v25[0] = v4;
    v25[1] = 3221225472;
    v25[2] = __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_172;
    v25[3] = &unk_1E8578610;
    v25[4] = self;
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B428, v25);
    -[PLProcessNetworkAgent setHighBWStartListener:](self, "setHighBWStartListener:", v22);

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
    {
      v24[0] = v4;
      v24[1] = 3221225472;
      v24[2] = __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_2_179;
      v24[3] = &unk_1E8578610;
      v24[4] = self;
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B450, v24);
      -[PLProcessNetworkAgent setHighBWEndlistener:](self, "setHighBWEndlistener:", v23);

    }
  }
}

uint64_t __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "didAddNewSource:", a2);
}

uint64_t __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_150(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "log");
}

uint64_t __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logEventBackwardNetworkBitmaps");
}

uint64_t __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "log");
}

uint64_t __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logEventBackwardNetworkBitmaps");
}

uint64_t __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_172(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleHighBWStartCallback:", a5);
}

uint64_t __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_2_179(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleHighBWEndCallback:", a5);
}

- (BOOL)hasSymptomsLogging
{
  return 1;
}

- (void)processesOfInterest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("entry"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[PLProcessNetworkAgent processes](self, "processes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("entry"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "unionSet:", v7);

    }
    v4 = v8;
  }

}

- (void)didAddNewSource:(__NStatSource *)a3
{
  PLProcessNetworkSource *v3;
  PLProcessNetworkSource *v4;
  PLProcessNetworkSource *v5;

  v5 = -[PLProcessNetworkSource initWithSource:]([PLProcessNetworkSource alloc], "initWithSource:", a3);
  NStatSourceSetCountsBlock();
  v4 = v5;
  NStatSourceSetDescriptionBlock();
  v3 = v4;
  NStatSourceSetRemovedBlock();

}

uint64_t __41__PLProcessNetworkAgent_didAddNewSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "didSetCountsBlock:withCounts:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __41__PLProcessNetworkAgent_didAddNewSource___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "didSetDescriptionBlock:withDescription:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __41__PLProcessNetworkAgent_didAddNewSource___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didRemoveSource:", *(_QWORD *)(a1 + 40));
}

- (void)didSetCountsBlock:(id)a3 withCounts:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];
  uint64_t v8;
  uint64_t v9;

  if (a4)
  {
    objc_msgSend(a3, "setCountsDictionary:", a4);
  }
  else
  {
    v8 = v4;
    v9 = v5;
    PLLogNetwork();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_ERROR, "WARNING: null counts dictionary passed in", v7, 2u);
    }

  }
}

- (void)didSetDescriptionBlock:(id)a3 withDescription:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  NSObject *v33;
  const char *v34;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "descriptionDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "descriptionDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (_QWORD *)MEMORY[0x1E0D51B90];
      objc_msgSend(v9, "objectForCFString:", *MEMORY[0x1E0D51B90]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectForCFString:", *v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "descriptionDictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (_QWORD *)MEMORY[0x1E0D51BD8];
      objc_msgSend(v13, "objectForCFString:", *MEMORY[0x1E0D51BD8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectForCFString:", *v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "descriptionDictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (_QWORD *)MEMORY[0x1E0D51BD0];
      objc_msgSend(v17, "objectForCFString:", *MEMORY[0x1E0D51BD0]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectForCFString:", *v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isEqualToString:", v16))
      {
        PLLogNetwork();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "descriptionDictionary");
          v22 = v11;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v39 = v23;
          v40 = 2112;
          v41 = v7;
          _os_log_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_DEFAULT, "WARNING: new description dictionary with same process name: %@ => %@", buf, 0x16u);

          v11 = v22;
        }

        goto LABEL_22;
      }
      if ((objc_msgSend(v15, "isEqualToString:", CFSTR("kernel_task")) & 1) != 0)
      {
LABEL_22:

        goto LABEL_23;
      }
      v35 = v19;
      v26 = v12;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v11;
      v29 = (void *)v27;
      v37 = v28;
      v30 = objc_msgSend(v28, "isEqualToNumber:", v27);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v26;
      v32 = objc_msgSend(v26, "isEqualToNumber:", v31);

      if (v30)
      {
        v19 = v35;
        if (v32)
        {
          PLLogNetwork();
          v33 = objc_claimAutoreleasedReturnValue();
          v12 = v36;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v34 = "WARNING: new dictionary with same process name and same zeroth interface number";
LABEL_19:
            _os_log_impl(&dword_1CAF47000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 2u);
            goto LABEL_20;
          }
          goto LABEL_20;
        }
      }
      else
      {
        v19 = v35;
        if (v32)
        {
          PLLogNetwork();
          v33 = objc_claimAutoreleasedReturnValue();
          v12 = v36;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v34 = "WARNING: new dictionary with same process name but new zeroth interface number";
            goto LABEL_19;
          }
LABEL_20:

          v11 = v37;
          goto LABEL_22;
        }
      }
      -[PLProcessNetworkAgent transferSource:fromPID:toPID:](self, "transferSource:fromPID:toPID:", v6, v19, v20);
      objc_msgSend(v6, "setDescriptionDictionary:", v7);
      -[PLProcessNetworkAgent logEventPointConnectionEvent:forSource:](self, "logEventPointConnectionEvent:forSource:", 2, v6);
      v12 = v36;
      v11 = v37;
      goto LABEL_22;
    }
    objc_msgSend(v7, "objectForCFString:", *MEMORY[0x1E0D51BD0]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLProcessNetworkAgent addSource:toPID:](self, "addSource:toPID:", v6, v25);

    objc_msgSend(v6, "setDescriptionDictionary:", v7);
    -[PLProcessNetworkAgent logEventPointConnectionEvent:forSource:](self, "logEventPointConnectionEvent:forSource:", 0, v6);
  }
  else
  {
    PLLogNetwork();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_ERROR, "WARNING: null description dictionary passed in", buf, 2u);
    }

  }
LABEL_23:

}

- (void)didRemoveSource:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "descriptionDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[PLProcessNetworkAgent logEventPointConnectionEvent:forSource:](self, "logEventPointConnectionEvent:forSource:", 1, v5);

}

- (void)aggregateAndLogNetworkBitmaps:(id)a3 withStartTime:(unint64_t)a4 andEndTime:(unint64_t)a5
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
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
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  void *context;
  id obj;
  uint64_t v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  _QWORD block[5];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  uint8_t v83[128];
  uint8_t buf[4];
  void *v85;
  _BYTE v86[128];
  _QWORD v87[6];

  v87[3] = *MEMORY[0x1E0C80C00];
  v56 = a3;
  context = (void *)MEMORY[0x1D179C2E0]();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = *MEMORY[0x1E0DB03B0];
  v6 = *MEMORY[0x1E0DB03B0];
  v61 = *MEMORY[0x1E0DB03D8];
  v87[0] = *MEMORY[0x1E0DB03D8];
  v87[1] = v6;
  v59 = *MEMORY[0x1E0DB03C0];
  v87[2] = *MEMORY[0x1E0DB03C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 3);
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
  if (v57)
  {
    v55 = *(_QWORD *)v79;
    v7 = *MEMORY[0x1E0DB03E0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v79 != v55)
          objc_enumerationMutation(obj);
        v64 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v8);
        objc_msgSend(v56, "objectForKeyedSubscript:");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v62 = v8;
        if (v9)
        {
          v76 = 0u;
          v77 = 0u;
          v75 = 0u;
          v74 = 0u;
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v75;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v75 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i);
                objc_msgSend(v10, "objectForKeyedSubscript:", v15);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "objectForKeyedSubscript:", v15);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v17)
                {
                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v15);

                }
                objc_msgSend(v16, "objectForKeyedSubscript:", v7);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLProcessNetworkAgent compressNetworkBitmap:](self, "compressNetworkBitmap:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                if (v20)
                {
                  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v64);

                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
            }
            while (v12);
          }
        }
        else
        {
          PLLogNetwork();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v85 = v64;
            _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@ interface does not exist in outcome dict from symptoms.", buf, 0xCu);
          }

        }
        v8 = v62 + 1;
      }
      while (v62 + 1 != v57);
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
    }
    while (v57);
  }

  +[PLOperator entryKeyForType:andName:](PLProcessNetworkAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("NetworkBitmap"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0;
  v73 = 0;
  objc_msgSend(MEMORY[0x1E0D80078], "getCurrentMonotonicAndMachAbsTime:machAbsTime:machContTime:", &v72, &v73, 0);
  v58 = v72;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v23 = v5;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
  if (v24)
  {
    v25 = v24;
    v65 = *(_QWORD *)v69;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v69 != v65)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v26);
        PLLogNetwork();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v85 = v27;
          _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "Process %@'s network bitmaps", buf, 0xCu);
        }

        objc_msgSend(v23, "objectForKeyedSubscript:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", v61);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
          goto LABEL_34;
        objc_msgSend(v23, "objectForKeyedSubscript:", v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", v60);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {

LABEL_34:
LABEL_35:
          v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v63);
          objc_msgSend(v32, "setEntryDate:", v58);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v73);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("CurrentMachAbsoluteTime"));

          objc_msgSend(v32, "setObject:forKeyedSubscript:", v27, CFSTR("BundleName"));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v34, CFSTR("MachAbsoluteStartTime"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v35, CFSTR("MachAbsoluteEndTime"));

          objc_msgSend(v23, "objectForKeyedSubscript:", v27);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", v61);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v37, v61);

          objc_msgSend(v23, "objectForKeyedSubscript:", v27);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectForKeyedSubscript:", v60);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v39, v60);

          objc_msgSend(v23, "objectForKeyedSubscript:", v27);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", v59);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v41, v59);

          -[PLOperator logEntry:](self, "logEntry:", v32);
LABEL_36:

          goto LABEL_37;
        }
        objc_msgSend(v23, "objectForKeyedSubscript:", v27);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "objectForKeyedSubscript:", v59);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (v43)
          goto LABEL_35;
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v44 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __80__PLProcessNetworkAgent_aggregateAndLogNetworkBitmaps_withStartTime_andEndTime___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v44;
          if (qword_1ED8825C0 != -1)
            dispatch_once(&qword_1ED8825C0, block);
          if (_MergedGlobals_1_11)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Process %@'s network bitmaps on all interfaces are empty."), v27);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "lastPathComponent");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessNetworkAgent aggregateAndLogNetworkBitmaps:withStartTime:andEndTime:]");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v47, v48, 647);

            PLLogCommon();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v85 = v32;
              _os_log_debug_impl(&dword_1CAF47000, v49, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            goto LABEL_36;
          }
        }
LABEL_37:
        ++v26;
      }
      while (v25 != v26);
      v50 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
      v25 = v50;
    }
    while (v50);
  }

  objc_autoreleasePoolPop(context);
}

uint64_t __80__PLProcessNetworkAgent_aggregateAndLogNetworkBitmaps_withStartTime_andEndTime___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_11 = result;
  return result;
}

- (id)compressNetworkBitmap:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v21;
  uint64_t *v23;
  uint64_t v24;
  _QWORD block[5];
  uint8_t buf[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3 || !objc_msgSend(v3, "length"))
    goto LABEL_22;
  v5 = objc_msgSend(v4, "length");
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "bytes");
  if ((v5 & 7) == 0)
  {
    v16 = v5 >> 3;
    if (v5 >= 8)
    {
      v17 = 0;
      if (v16 <= 1)
        v18 = 1;
      else
        v18 = v5 >> 3;
      v19 = (_QWORD *)(v7 + 8 * v16 - 8);
      while (!*v19--)
      {
        if (v18 == ++v17)
        {
          v17 = v18;
          break;
        }
      }
    }
    else
    {
      v17 = 0;
    }
    v21 = v16 - v17;
    if (v16 != v17)
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", 8 * v21);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v23 = (uint64_t *)objc_msgSend(objc_retainAutorelease(v6), "bytes");
      do
      {
        v24 = *v23++;
        *(_QWORD *)buf = v24;
        objc_msgSend(v15, "appendBytes:length:", buf, 8);
        --v21;
      }
      while (v21);
      goto LABEL_23;
    }
LABEL_22:
    v15 = 0;
    goto LABEL_23;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLProcessNetworkAgent_compressNetworkBitmap___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1ED8825C8 != -1)
      dispatch_once(&qword_1ED8825C8, block);
    if (byte_1ED8825A1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Network bitmap's size is not a multiple of 64 bits."));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessNetworkAgent compressNetworkBitmap:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 682);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v9;
        _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v15 = v6;
LABEL_23:

  return v15;
}

uint64_t __47__PLProcessNetworkAgent_compressNetworkBitmap___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8825A1 = result;
  return result;
}

- (void)log
{
  if (-[PLProcessNetworkAgent hasSymptomsLogging](self, "hasSymptomsLogging"))
    -[PLProcessNetworkAgent logEventBackwardUsage](self, "logEventBackwardUsage");
}

- (void)logEventPointConnectionEvent:(signed __int16)a3 forSource:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  const __CFData *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFData *v33;
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
  _QWORD *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
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
  void *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  PLProcessNetworkAgent *v86;
  _QWORD v87[5];
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v90;
  uint64_t v91;

  v4 = a3;
  v91 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D80018];
  objc_msgSend(v6, "descriptionDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForCFString:", *MEMORY[0x1E0D51B90]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "interfaceNameForIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "descriptionDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForCFString:", *MEMORY[0x1E0D51BA8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "BOOLValue"))
  {

    goto LABEL_4;
  }
  objc_msgSend(v6, "descriptionDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForCFString:", *MEMORY[0x1E0D51BB0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (v15)
  {
LABEL_4:
    objc_msgSend(v6, "descriptionDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForCFString:", *MEMORY[0x1E0D51BD8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (objc_msgSend(v17, "length"))
      {
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("mDNSResponder")))
        {
          objc_msgSend(v6, "descriptionDictionary");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForCFString:", *MEMORY[0x1E0D51BB0]);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "BOOLValue");

          if ((v20 & 1) != 0)
            goto LABEL_28;
        }
        v86 = self;
        objc_msgSend(v6, "descriptionDictionary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (_QWORD *)MEMORY[0x1E0D51BC8];
        objc_msgSend(v21, "objectForCFString:", *MEMORY[0x1E0D51BC8]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "descriptionDictionary");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (_QWORD *)MEMORY[0x1E0D51BE0];
        objc_msgSend(v24, "objectForCFString:", *MEMORY[0x1E0D51BE0]);
        v26 = objc_claimAutoreleasedReturnValue();

        if (v23 && v26)
        {
          v82 = v26;
          v84 = v23;
          v27 = (void *)MEMORY[0x1E0D80018];
          objc_msgSend(v6, "descriptionDictionary");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForCFString:", *v22);
          v29 = (const __CFData *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "sockaddrToNSDictionary:", CFDataGetBytePtr(v29));
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = (void *)MEMORY[0x1E0D80018];
          objc_msgSend(v6, "descriptionDictionary");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForCFString:", *v25);
          v33 = (const __CFData *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "sockaddrToNSDictionary:", CFDataGetBytePtr(v33));
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          +[PLOperator entryKeyForType:andName:](PLProcessNetworkAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("Connection"));
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v81);
          -[PLProcessNetworkAgent timestampNetConnectEntry:withEventType:withSource:](v86, "timestampNetConnectEntry:withEventType:withSource:", v35, v4, v6);
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v17, CFSTR("ProcessName"));
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v10, CFSTR("InterfaceName"));
          objc_msgSend(v6, "descriptionDictionary");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForCFString:", *MEMORY[0x1E0D51BD0]);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v37, CFSTR("ProcessPID"));

          objc_msgSend(v30, "objectForKey:", CFSTR("address"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v38, CFSTR("LocalAddress"));

          v83 = v30;
          v39 = v30;
          v40 = v34;
          objc_msgSend(v39, "objectForKey:", CFSTR("port"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v41, CFSTR("LocalPort"));

          objc_msgSend(v34, "objectForKey:", CFSTR("address"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v42, CFSTR("RemoteAddress"));

          objc_msgSend(v34, "objectForKey:", CFSTR("port"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v43, CFSTR("RemotePort"));

          v44 = (void *)MEMORY[0x1E0D80018];
          objc_msgSend(v6, "descriptionDictionary");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectForCFString:", *MEMORY[0x1E0D51C10]);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "stringFromTrafficClass:", objc_msgSend(v46, "intValue"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v47, CFSTR("TrafficClass"));

          objc_msgSend(v6, "descriptionDictionary");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "objectForCFString:", *MEMORY[0x1E0D51C00]);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v49, CFSTR("rxWifiBytes"));

          objc_msgSend(v6, "descriptionDictionary");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "objectForCFString:", *MEMORY[0x1E0D51C30]);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v51, CFSTR("txWifiBytes"));

          objc_msgSend(v6, "descriptionDictionary");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectForCFString:", *MEMORY[0x1E0D51BF0]);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v53, CFSTR("rxCellularBytes"));

          objc_msgSend(v6, "descriptionDictionary");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectForCFString:", *MEMORY[0x1E0D51C20]);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v55, CFSTR("txCellularBytes"));

          objc_msgSend(v6, "descriptionDictionary");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = (_QWORD *)MEMORY[0x1E0D51B80];
          objc_msgSend(v56, "objectForCFString:", *MEMORY[0x1E0D51B80]);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          if (v58)
          {
            objc_msgSend(v6, "descriptionDictionary");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "objectForCFString:", *v57);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v60, "BOOLValue");

          }
          else
          {
            v61 = 0;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v61);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setObject:forKeyedSubscript:", v80, CFSTR("isChannelArch"));

          -[PLOperator logEntry:](v86, "logEntry:", v35);
          v23 = v84;
          v26 = v82;
        }
        else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v71 = objc_opt_class();
          v87[0] = MEMORY[0x1E0C809B0];
          v87[1] = 3221225472;
          v87[2] = __64__PLProcessNetworkAgent_logEventPointConnectionEvent_forSource___block_invoke_207;
          v87[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v87[4] = v71;
          if (qword_1ED8825D8 != -1)
            dispatch_once(&qword_1ED8825D8, v87);
          if (byte_1ED8825A3)
          {
            v85 = v23;
            v72 = (void *)MEMORY[0x1E0CB3940];
            -[PLOperator className](v86, "className");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "stringWithFormat:", CFSTR("%@: statsrckeylocal or statsrckeylocal is null for processName=%@"), v73, v17);
            v74 = (void *)objc_claimAutoreleasedReturnValue();

            v75 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "lastPathComponent");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessNetworkAgent logEventPointConnectionEvent:forSource:]");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "logMessage:fromFile:fromFunction:fromLineNumber:", v74, v77, v78, 766);

            PLLogCommon();
            v79 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v90 = (uint64_t)v74;
              _os_log_debug_impl(&dword_1CAF47000, v79, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v23 = v85;
          }
        }
      }
      else
      {
        if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          goto LABEL_28;
        v62 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __64__PLProcessNetworkAgent_logEventPointConnectionEvent_forSource___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v62;
        if (qword_1ED8825D0 != -1)
          dispatch_once(&qword_1ED8825D0, block);
        if (!byte_1ED8825A2)
          goto LABEL_28;
        v63 = (void *)MEMORY[0x1E0CB3940];
        -[PLOperator className](self, "className");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "descriptionDictionary");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "stringWithFormat:", CFSTR("%@: processName length == 0 detected, source = %@"), v64, v65);
        v66 = objc_claimAutoreleasedReturnValue();

        v67 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "lastPathComponent");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessNetworkAgent logEventPointConnectionEvent:forSource:]");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "logMessage:fromFile:fromFunction:fromLineNumber:", v66, v69, v70, 747);

        PLLogCommon();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v23 = (void *)v66;
          v90 = v66;
          _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        else
        {
          v23 = (void *)v66;
        }
      }

    }
LABEL_28:

  }
}

uint64_t __64__PLProcessNetworkAgent_logEventPointConnectionEvent_forSource___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8825A2 = result;
  return result;
}

uint64_t __64__PLProcessNetworkAgent_logEventPointConnectionEvent_forSource___block_invoke_207(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8825A3 = result;
  return result;
}

- (void)timestampNetConnectEntry:(id)a3 withEventType:(signed __int16)a4 withSource:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t);
  void *v61;
  uint64_t v62;
  _QWORD v63[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v66;
  uint64_t v67;

  v6 = a4;
  v67 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = mach_continuous_time();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("EventType"));

  objc_msgSend(v7, "setEntryDate:", v10);
  if (v6 <= 1)
  {
    objc_msgSend(v8, "descriptionDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (_QWORD *)MEMORY[0x1E0D51C08];
    objc_msgSend(v12, "objectForCFString:", *MEMORY[0x1E0D51C08]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v39 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __75__PLProcessNetworkAgent_timestampNetConnectEntry_withEventType_withSource___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v39;
        if (qword_1ED8825E0 != -1)
          dispatch_once(&qword_1ED8825E0, block);
        if (byte_1ED8825A4)
        {
          v40 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v8, "descriptionDictionary");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stringWithFormat:", CFSTR("Flow %@ had no start timestamp"), v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          v43 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "lastPathComponent");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessNetworkAgent timestampNetConnectEntry:withEventType:withSource:]");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "logMessage:fromFile:fromFunction:fromLineNumber:", v42, v45, v46, 816);

          PLLogCommon();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v66 = v42;
            _os_log_debug_impl(&dword_1CAF47000, v47, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      v38 = &unk_1E8632100;
      goto LABEL_32;
    }
    objc_msgSend(v8, "descriptionDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForCFString:", *v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedLongLongValue");

    if ((_DWORD)v6 == 1)
    {
      objc_msgSend(v8, "descriptionDictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (_QWORD *)MEMORY[0x1E0D51B88];
      objc_msgSend(v18, "objectForCFString:", *MEMORY[0x1E0D51B88]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v49 = objc_opt_class();
          v63[0] = MEMORY[0x1E0C809B0];
          v63[1] = 3221225472;
          v63[2] = __75__PLProcessNetworkAgent_timestampNetConnectEntry_withEventType_withSource___block_invoke_219;
          v63[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v63[4] = v49;
          if (qword_1ED8825E8 != -1)
            dispatch_once(&qword_1ED8825E8, v63);
          if (byte_1ED8825A5)
          {
            v50 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v8, "descriptionDictionary");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "stringWithFormat:", CFSTR("Flow %@ closed, but had no duration"), v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            v53 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "lastPathComponent");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessNetworkAgent timestampNetConnectEntry:withEventType:withSource:]");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "logMessage:fromFile:fromFunction:fromLineNumber:", v52, v55, v56, 823);

            PLLogCommon();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v66 = v52;
              _os_log_debug_impl(&dword_1CAF47000, v57, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        v38 = &unk_1E8632118;
        goto LABEL_32;
      }
      objc_msgSend(v8, "descriptionDictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForCFString:", *v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "integerValue");

      v17 += v23;
    }
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v9);
    v25 = v24;
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v17);
    v27 = v25 - v26;
    if (v27 < 0.0)
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v28 = objc_opt_class();
        v58 = MEMORY[0x1E0C809B0];
        v59 = 3221225472;
        v60 = __75__PLProcessNetworkAgent_timestampNetConnectEntry_withEventType_withSource___block_invoke_225;
        v61 = &__block_descriptor_40_e5_v8__0lu32l8;
        v62 = v28;
        if (qword_1ED8825F0 != -1)
          dispatch_once(&qword_1ED8825F0, &v58);
        if (byte_1ED8825A6)
        {
          v29 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v8, "descriptionDictionary");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "dateByAddingTimeInterval:", -v27);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringWithFormat:", CFSTR("Flow from %@ ends in the future -- Now: %@ End Date: %@ currentMachTime: %llu providedMachTime: %llu"), v30, v10, v31, v9, v17, v58, v59, v60, v61, v62);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v33 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "lastPathComponent");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessNetworkAgent timestampNetConnectEntry:withEventType:withSource:]");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 833);

          PLLogCommon();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v66 = v32;
            _os_log_debug_impl(&dword_1CAF47000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      v38 = &unk_1E8632130;
LABEL_32:
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v38, CFSTR("EventType"));
      goto LABEL_33;
    }
    objc_msgSend(v10, "dateByAddingTimeInterval:", -v27);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEntryDate:", v48);

  }
LABEL_33:

}

uint64_t __75__PLProcessNetworkAgent_timestampNetConnectEntry_withEventType_withSource___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8825A4 = result;
  return result;
}

uint64_t __75__PLProcessNetworkAgent_timestampNetConnectEntry_withEventType_withSource___block_invoke_219(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8825A5 = result;
  return result;
}

uint64_t __75__PLProcessNetworkAgent_timestampNetConnectEntry_withEventType_withSource___block_invoke_225(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8825A6 = result;
  return result;
}

- (void)logEventBackwardUsage
{
  uint64_t v3;
  void *v4;
  char v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[16];
  _QWORD v15[5];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0DB0530];
  v16[0] = *MEMORY[0x1E0DB0648];
  v16[1] = v3;
  v17[0] = MEMORY[0x1E0C9AAB0];
  v17[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd");
  -[PLProcessNetworkAgent usageFeed](self, "usageFeed");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    -[PLProcessNetworkAgent processes](self, "processes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0DB06E0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__PLProcessNetworkAgent_logEventBackwardUsage__block_invoke_230;
    v13[3] = &unk_1E8579430;
    v13[4] = self;
    -[NSObject usageToDateWithOptionsFor:nameKind:options:reply:](v7, "usageToDateWithOptionsFor:nameKind:options:reply:", v8, v9, v4, v13);

  }
  else
  {
    v10 = *MEMORY[0x1E0DB06E0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __46__PLProcessNetworkAgent_logEventBackwardUsage__block_invoke;
    v15[3] = &unk_1E8579430;
    v15[4] = self;
    v11 = -[NSObject usageToDateWithOptionsFor:nameKind:options:reply:](v6, "usageToDateWithOptionsFor:nameKind:options:reply:", 0, v10, v4, v15);

    PLLogNetwork();
    v12 = objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEFAULT, "successfully retrieved network usage data", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_ERROR, "failed to retrieve network usage data", buf, 2u);
    }
  }

}

uint64_t __46__PLProcessNetworkAgent_logEventBackwardUsage__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "logEventBackwardUsageWithOutcome:", a2);
}

void __46__PLProcessNetworkAgent_logEventBackwardUsage__block_invoke_230(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLLogNetwork();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "processes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "[self processes]=%@, outcome=%@", (uint8_t *)&v8, 0x16u);

  }
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v5, "logEventBackwardUsageWithOutcome:", v6);

}

- (void)logEventForwardLowInternet
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)CFPreferencesCopyValue(CFSTR("deviceConfigType"), CFSTR("com.apple.symptomsd"), CFSTR("_networkd"), (CFStringRef)*MEMORY[0x1E0C9B250]);
  if (v5)
  {
    +[PLOperator entryKeyForType:andName:](PLProcessNetworkAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("LowInternet"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v3);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("Mode"));
    -[PLOperator logEntry:](self, "logEntry:", v4);

  }
}

- (BOOL)outcomeHasDataUsage:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[7];

  v20[6] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0DB06B8];
  v20[0] = *MEMORY[0x1E0DB06B0];
  v20[1] = v4;
  v5 = *MEMORY[0x1E0DB06A8];
  v20[2] = *MEMORY[0x1E0DB06A0];
  v20[3] = v5;
  v6 = *MEMORY[0x1E0DB06C8];
  v20[4] = *MEMORY[0x1E0DB06C0];
  v20[5] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 6);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(v3, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        v13 = v12;

        if (v13 > 0.0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)logEventBackwardUsageWithOutcome:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
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
  id v20;
  void *v21;
  BOOL v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  uint64_t *v58;
  uint64_t v59;
  double *v60;
  uint64_t v61;
  double v62;
  _QWORD v63[4];
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  __int128 *p_buf;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  __int128 buf;
  uint64_t v78;
  uint64_t v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLProcessNetworkAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("UsageDiff"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLProcessNetworkAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("Usage"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40 && objc_msgSend(v40, "count"))
  {
    PLLogNetwork();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v40, "count");
      _os_log_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEFAULT, "NetworkUsage outcome has payload size: %lu", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = v40;
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
    if (v4)
    {
      v50 = *MEMORY[0x1E0DB06E0];
      v51 = *(_QWORD *)v70;
      v49 = *MEMORY[0x1E0DB06D0];
      v47 = *MEMORY[0x1E0DB06B0];
      v48 = *MEMORY[0x1E0DB06D8];
      v46 = *MEMORY[0x1E0DB06B8];
      v45 = *MEMORY[0x1E0DB06A0];
      v5 = *MEMORY[0x1E0DB06A8];
      v6 = *MEMORY[0x1E0DB06E8];
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v70 != v51)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
          v9 = (void *)MEMORY[0x1D179C2E0]();
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v52, v54);
          objc_msgSend(v8, "valueForKey:", v50);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("ProcessName"));
          objc_msgSend(v8, "valueForKey:", v49);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("BundleName"));

          objc_msgSend(v8, "valueForKey:", v48);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("ExtensionName"));

          objc_msgSend(v8, "valueForKey:", v47);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("WifiIn"));

          objc_msgSend(v8, "valueForKey:", v46);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("WifiOut"));

          objc_msgSend(v8, "valueForKey:", v45);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("CellIn"));

          objc_msgSend(v8, "valueForKey:", v5);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("CellOut"));

          objc_msgSend(v8, "valueForKey:", v6);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("SinceTime"));

          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v78 = 0x2020000000;
          v79 = 0;
          objc_msgSend(v10, "dictionary");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v66[0] = MEMORY[0x1E0C809B0];
          v66[1] = 3221225472;
          v66[2] = __58__PLProcessNetworkAgent_logEventBackwardUsageWithOutcome___block_invoke;
          v66[3] = &unk_1E8579458;
          p_buf = &buf;
          v20 = v10;
          v67 = v20;
          objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v66);

          if (*(double *)(*((_QWORD *)&buf + 1) + 24) > 0.0)
          {
            objc_msgSend(v43, "setObject:forKeyedSubscript:", v20, v11);
            -[PLProcessNetworkAgent lastEntryDate](self, "lastEntryDate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21 == 0;

            if (!v22)
            {
              v23 = objc_alloc(MEMORY[0x1E0D7FFB0]);
              -[PLProcessNetworkAgent lastEntryDate](self, "lastEntryDate");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = (void *)objc_msgSend(v23, "initWithEntryKey:withDate:", v42, v24);

              objc_msgSend(v25, "setObject:forKeyedSubscript:", v54, CFSTR("timestampEnd"));
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v11, CFSTR("ProcessName"));
              objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("BundleName"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, CFSTR("BundleName"));

              objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("ExtensionName"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v27, CFSTR("ExtensionName"));

              objc_msgSend(v20, "dictionary");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v63[0] = MEMORY[0x1E0C809B0];
              v63[1] = 3221225472;
              v63[2] = __58__PLProcessNetworkAgent_logEventBackwardUsageWithOutcome___block_invoke_2;
              v63[3] = &unk_1E8579480;
              v29 = v25;
              v64 = v29;
              v65 = v20;
              objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v63);

              -[PLProcessNetworkAgent lastProcessNameToNetworkUsageEntry](self, "lastProcessNameToNetworkUsageEntry");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKeyedSubscript:", v11);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              v59 = 0;
              v60 = (double *)&v59;
              v62 = 0.0;
              v32 = *(double *)(*((_QWORD *)&buf + 1) + 24);
              v61 = 0x2020000000;
              v62 = v32;
              if (v31)
              {
                v62 = 0.0;
                objc_msgSend(v31, "dictionary");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v55[0] = MEMORY[0x1E0C809B0];
                v55[1] = 3221225472;
                v55[2] = __58__PLProcessNetworkAgent_logEventBackwardUsageWithOutcome___block_invoke_3;
                v55[3] = &unk_1E85794A8;
                v56 = v29;
                v57 = v31;
                v58 = &v59;
                objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", v55);

                v32 = v60[3];
              }
              if (v32 > 0.0)
                objc_msgSend(v41, "addObject:", v29);
              _Block_object_dispose(&v59, 8);

            }
          }

          _Block_object_dispose(&buf, 8);
          objc_autoreleasePoolPop(v9);
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
      }
      while (v4);
    }

    if (-[PLOperator isDebugEnabled](self, "isDebugEnabled")
      && (objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd") & 1) == 0)
    {
      v75 = v52;
      objc_msgSend(v43, "allValues");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v35, v52);

    }
    -[PLProcessNetworkAgent lastEntryDate](self, "lastEntryDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v73 = v42;
      v74 = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v37, v42);

      -[PLProcessNetworkAgent lastEntryDate](self, "lastEntryDate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLProcessNetworkAgent accountWithNetworkUsageDiffEntries:withStartDate:withEndDate:](self, "accountWithNetworkUsageDiffEntries:withStartDate:withEndDate:", v41, v38, v54);

    }
    -[PLProcessNetworkAgent setLastEntryDate:](self, "setLastEntryDate:", v54);
    -[PLProcessNetworkAgent setLastProcessNameToNetworkUsageEntry:](self, "setLastProcessNameToNetworkUsageEntry:", v43);

  }
  else
  {
    PLLogNetwork();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1CAF47000, v39, OS_LOG_TYPE_ERROR, "NetworkUsage outcome has no payload", (uint8_t *)&buf, 2u);
    }

    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v42, v54);
    objc_msgSend(v43, "setIsErrorEntry:", 1);
    objc_msgSend(v43, "setObject:forKeyedSubscript:", CFSTR("NetworkUsage outcome has no payload"), CFSTR("__PLEntryErrorString__"));
    -[PLOperator logEntry:](self, "logEntry:", v43);
  }

}

void __58__PLProcessNetworkAgent_logEventBackwardUsageWithOutcome___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  double v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);

  }
}

void __58__PLProcessNetworkAgent_logEventBackwardUsageWithOutcome___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

  }
}

void __58__PLProcessNetworkAgent_logEventBackwardUsageWithOutcome___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v9 - v11;

    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v12
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, v14);

  }
}

- (void)setLastNetworkBitmapTimestampFor:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  NSObject *v19;
  int v20;
  id v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80078], "deviceRebooted") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    PLLogNetwork();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v4;
      _os_log_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEFAULT, "[%@]: Detected that powerlog restarted", (uint8_t *)&v20, 0xCu);
    }

    +[PLOperator entryKeyForType:andName:](PLProcessNetworkAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("NetworkBitmap"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator storage](self, "storage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastEntryForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9
      && (objc_msgSend(MEMORY[0x1E0D80078], "deviceBootTime"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "entryDate"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v10, "compare:", v11),
          v11,
          v10,
          v12 == -1))
    {
      PLLogNetwork();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MachAbsoluteEndTime"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412546;
        v21 = v4;
        v22 = 2112;
        v23 = (unint64_t)v15;
        _os_log_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEFAULT, "[%@]: Recovered last entry's mach time: %@", (uint8_t *)&v20, 0x16u);

      }
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MachAbsoluteEndTime"));
      v13 = objc_claimAutoreleasedReturnValue();
      v5 = -[NSObject unsignedLongLongValue](v13, "unsignedLongLongValue");
    }
    else
    {
      PLLogNetwork();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412290;
        v21 = v4;
        _os_log_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEFAULT, "[%@]: Last entry's mach time not available", (uint8_t *)&v20, 0xCu);
      }
      v5 = 0;
    }

  }
  v16 = objc_msgSend(MEMORY[0x1E0D80078], "getCurrMachAbsTimeInSecs");
  v17 = v16 - 3072;
  if (v16 < 0xC00)
    v17 = 0;
  if (v17 <= v5)
    v17 = v5;
  v18 = v17 & 0xFFFFFFFFFFFFFFF8;
  -[PLProcessNetworkAgent setLastNetworkBitmapTimestamp:](self, "setLastNetworkBitmapTimestamp:", v17 & 0xFFFFFFFFFFFFFFF8);
  PLLogNetwork();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412546;
    v21 = v4;
    v22 = 2048;
    v23 = v18;
    _os_log_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEFAULT, "[%@]: Network bitmaps initialized start time: %llu.", (uint8_t *)&v20, 0x16u);
  }

}

- (void)getNetWorkBitmapForEndTime:(unint64_t)a3 andSysdiagnoseTrigger:(BOOL)a4
{
  const __CFString *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[4];
  __CFString *v15;
  PLProcessNetworkAgent *v16;
  BOOL v17;
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (a4)
    v7 = CFSTR("Sysdiagnose Bitmap");
  else
    v7 = CFSTR("Bitmap");
  v20 = *MEMORY[0x1E0DB03C8];
  v21[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLProcessNetworkAgent usageFeed](self, "usageFeed");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLProcessNetworkAgent lastNetworkBitmapTimestamp](self, "lastNetworkBitmapTimestamp");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__PLProcessNetworkAgent_getNetWorkBitmapForEndTime_andSysdiagnoseTrigger___block_invoke;
  v14[3] = &unk_1E85794D0;
  v15 = (__CFString *)v7;
  v16 = self;
  v17 = a4;
  v11 = objc_msgSend(v9, "networkBitmapsToDateWithOptionsFor:startTime:endTime:options:reply:", 0, v10, a3, v8, v14);

  PLLogNetwork();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v7;
      _os_log_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEFAULT, "[%@]: successfully obtained network bitmaps", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v7;
    _os_log_error_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_ERROR, "[%@]: failed to retrieve network bitmaps", buf, 0xCu);
  }

}

void __74__PLProcessNetworkAgent_getNetWorkBitmapForEndTime_andSysdiagnoseTrigger___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  unint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PLLogNetwork();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_3:

      goto LABEL_4;
    }
    v24 = *(_QWORD *)(a1 + 32);
    v27 = 138412546;
    v28 = v24;
    v29 = 2112;
    v30 = (unint64_t)v6;
    v17 = "[%@]: error in network bitmap callback: %@";
    v18 = v7;
    v19 = 22;
LABEL_26:
    _os_log_error_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v27, v19);
    goto LABEL_3;
  }
  if (!v5)
  {
    PLLogNetwork();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    v16 = *(_QWORD *)(a1 + 32);
    v27 = 138412290;
    v28 = v16;
    v17 = "[%@]: network bitmap dict is empty";
    v18 = v7;
    v19 = 12;
    goto LABEL_26;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DB03D0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedLongLongValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DB03B8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedLongLongValue");

  PLLogNetwork();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v27 = 138412802;
    v28 = v13;
    v29 = 2048;
    v30 = v11;
    v31 = 2048;
    v32 = v9;
    _os_log_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEFAULT, "[%@]: Network bitmaps endtime from symptoms: %llu, start time: %llu", (uint8_t *)&v27, 0x20u);
  }

  if (v11 <= v9)
  {
    PLLogNetwork();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v25 = *(_QWORD *)(a1 + 32);
      v26 = objc_msgSend(*(id *)(a1 + 40), "lastNetworkBitmapTimestamp");
      v27 = 138412802;
      v28 = v25;
      v29 = 2048;
      v30 = v11;
      v31 = 2048;
      v32 = v26;
      _os_log_error_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_ERROR, "[%@]: End time %llu smaller than start time %llu.", (uint8_t *)&v27, 0x20u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "aggregateAndLogNetworkBitmaps:withStartTime:andEndTime:", v5, v9, v11);
    objc_msgSend(*(id *)(a1 + 40), "setLastNetworkBitmapTimestamp:", v11);
    if (*(_BYTE *)(a1 + 48))
    {
      if (v11 < objc_msgSend(*(id *)(a1 + 40), "curNetworkBitmapTimestampForSysdiagnoseTrigger")
        && objc_msgSend(*(id *)(a1 + 40), "curNetworkBitmapTimestampForSysdiagnoseTrigger") - v11 >= 8)
      {
        PLLogNetwork();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(_QWORD *)(a1 + 32);
          v27 = 138412290;
          v28 = v15;
          _os_log_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEFAULT, "[%@]: trying to retrieve more network bitmaps", (uint8_t *)&v27, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 40), "logEventBackwardNetworkBitmapsSysdiagnoseTrigger");
      }
    }
    else
    {
      v21 = objc_msgSend(MEMORY[0x1E0D80078], "getCurrMachAbsTimeInSecs");
      if (v21 > v11 && v21 - v11 >= 0x800)
      {
        PLLogNetwork();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = *(_QWORD *)(a1 + 32);
          v27 = 138412290;
          v28 = v23;
          _os_log_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEFAULT, "[%@]: trying to retrieve more network bitmaps", (uint8_t *)&v27, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 40), "logEventBackwardNetworkBitmaps");
      }
    }
  }
LABEL_4:

}

- (void)logEventBackwardNetworkBitmapsSysdiagnoseTrigger
{
  unint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  unint64_t v6;
  NSObject *v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  PLProcessNetworkAgent *v13;
  unint64_t v14;
  unint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  unint64_t v18;
  int v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = -[PLProcessNetworkAgent lastNetworkBitmapTimestamp](self, "lastNetworkBitmapTimestamp");
  PLLogNetwork();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 == -1)
  {
    if (v5)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: initialize last network bitmap log timestamp", (uint8_t *)&v19, 2u);
    }

    -[PLProcessNetworkAgent setLastNetworkBitmapTimestampFor:](self, "setLastNetworkBitmapTimestampFor:", CFSTR("Sysdiagnose Bitmap"));
    -[PLProcessNetworkAgent logEventBackwardNetworkBitmapsSysdiagnoseTrigger](self, "logEventBackwardNetworkBitmapsSysdiagnoseTrigger");
  }
  else
  {
    if (v5)
    {
      v19 = 134217984;
      v20 = -[PLProcessNetworkAgent lastNetworkBitmapTimestamp](self, "lastNetworkBitmapTimestamp");
      _os_log_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: Network bitmaps start time: %llu.", (uint8_t *)&v19, 0xCu);
    }

    v6 = -[PLProcessNetworkAgent lastNetworkBitmapTimestamp](self, "lastNetworkBitmapTimestamp") + 1024;
    if (-[PLProcessNetworkAgent curNetworkBitmapTimestampForSysdiagnoseTrigger](self, "curNetworkBitmapTimestampForSysdiagnoseTrigger") == -1)
    {
      -[PLProcessNetworkAgent setCurNetworkBitmapTimestampForSysdiagnoseTrigger:](self, "setCurNetworkBitmapTimestampForSysdiagnoseTrigger:", objc_msgSend(MEMORY[0x1E0D80078], "getCurrMachAbsTimeInSecs"));
      PLLogNetwork();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = -[PLProcessNetworkAgent curNetworkBitmapTimestampForSysdiagnoseTrigger](self, "curNetworkBitmapTimestampForSysdiagnoseTrigger");
        v19 = 134217984;
        v20 = v8;
        _os_log_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: Setting network bitmaps current time for sysdiagnose trigger: %llu.", (uint8_t *)&v19, 0xCu);
      }

    }
    v9 = -[PLProcessNetworkAgent curNetworkBitmapTimestampForSysdiagnoseTrigger](self, "curNetworkBitmapTimestampForSysdiagnoseTrigger");
    PLLogNetwork();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134218240;
      v20 = v6;
      v21 = 2048;
      v22 = v9;
      _os_log_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: Network bitmaps end time: %llu, curr time: %llu.", (uint8_t *)&v19, 0x16u);
    }

    if (v9 > v6)
    {
      PLLogNetwork();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = -[PLProcessNetworkAgent lastNetworkBitmapTimestamp](self, "lastNetworkBitmapTimestamp");
        v19 = 134218240;
        v20 = v12;
        v21 = 2048;
        v22 = v6;
        _os_log_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: Requesting network bitmaps from symptoms with start time: %llu, end time: %llu.", (uint8_t *)&v19, 0x16u);
      }

      v13 = self;
      v14 = v6;
LABEL_21:
      -[PLProcessNetworkAgent getNetWorkBitmapForEndTime:andSysdiagnoseTrigger:](v13, "getNetWorkBitmapForEndTime:andSysdiagnoseTrigger:", v14, 1);
      return;
    }
    v15 = v9 - -[PLProcessNetworkAgent lastNetworkBitmapTimestamp](self, "lastNetworkBitmapTimestamp");
    PLLogNetwork();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15 >= 8)
    {
      if (v17)
      {
        v18 = -[PLProcessNetworkAgent lastNetworkBitmapTimestamp](self, "lastNetworkBitmapTimestamp");
        v19 = 134218240;
        v20 = v18;
        v21 = 2048;
        v22 = v9;
        _os_log_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: Requesting network bitmaps from symptoms with start time: %llu, curr time: %llu.", (uint8_t *)&v19, 0x16u);
      }

      v13 = self;
      v14 = v9;
      goto LABEL_21;
    }
    if (v17)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: Requested network bitmap is too recent.", (uint8_t *)&v19, 2u);
    }

  }
}

- (void)logEventBackwardNetworkBitmaps
{
  unint64_t v3;
  unint64_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  unint64_t v9;
  __int16 v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[PLProcessNetworkAgent lastNetworkBitmapTimestamp](self, "lastNetworkBitmapTimestamp") == -1)
  {
    PLLogNetwork();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEFAULT, "[Bitmap]: initialize last network bitmap log timestamp", (uint8_t *)&v8, 2u);
    }

    -[PLProcessNetworkAgent setLastNetworkBitmapTimestampFor:](self, "setLastNetworkBitmapTimestampFor:", CFSTR("Bitmap"));
    -[PLProcessNetworkAgent logEventBackwardNetworkBitmaps](self, "logEventBackwardNetworkBitmaps");
  }
  else
  {
    v3 = -[PLProcessNetworkAgent lastNetworkBitmapTimestamp](self, "lastNetworkBitmapTimestamp") + 1024;
    v4 = objc_msgSend(MEMORY[0x1E0D80078], "getCurrMachAbsTimeInSecs");
    PLLogNetwork();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134218496;
      v9 = -[PLProcessNetworkAgent lastNetworkBitmapTimestamp](self, "lastNetworkBitmapTimestamp");
      v10 = 2048;
      v11 = v3;
      v12 = 2048;
      v13 = v4;
      _os_log_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEFAULT, "[Bitmap]: Requesting network bitmaps from symptoms with start time: %llu, end time: %llu, curr time: %llu.", (uint8_t *)&v8, 0x20u);
    }

    if (v4 <= v3 || v4 - v3 <= 0x3FF)
    {
      PLLogNetwork();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v8) = 0;
        _os_log_error_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_ERROR, "[Bitmap]: Requested network bitmap is too recent.", (uint8_t *)&v8, 2u);
      }

    }
    else
    {
      -[PLProcessNetworkAgent getNetWorkBitmapForEndTime:andSysdiagnoseTrigger:](self, "getNetWorkBitmapForEndTime:andSysdiagnoseTrigger:", v3, 0);
    }
  }
}

- (void)accountWithNetworkUsageDiffEntries:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  id obj;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  _QWORD v84[5];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[5];
  _QWORD v90[4];
  id v91;
  uint64_t v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD block[5];
  _BYTE v98[128];
  uint8_t v99[128];
  uint8_t buf[4];
  void *v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v10 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v10;
      if (qword_1ED8825F8 != -1)
        dispatch_once(&qword_1ED8825F8, block);
      if (byte_1ED8825A7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("networkUsageDiffEntries=%@, startDate=%@, endDate=%@"), v7, v8, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessNetworkAgent accountWithNetworkUsageDiffEntries:withStartDate:withEndDate:]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 1151);

        PLLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v101 = v11;
          _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v83 = (void *)objc_msgSend(&unk_1E864B478, "mutableCopy");
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v17 = v7;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v93, v99, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v94;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v94 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * i);
          v90[0] = MEMORY[0x1E0C809B0];
          v90[1] = 3221225472;
          v90[2] = __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke_255;
          v90[3] = &unk_1E8579480;
          v91 = v83;
          v92 = v22;
          objc_msgSend(v91, "enumerateKeysAndObjectsUsingBlock:", v90);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v93, v99, 16);
      }
      while (v19);
    }

    objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("WifiIn"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;
    objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("WifiOut"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    v28 = v25 + v27;

    objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("CellIn"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "doubleValue");
    v31 = v30;
    objc_msgSend(v83, "objectForKeyedSubscript:", CFSTR("CellOut"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValue");
    v34 = v31 + v33;

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v35 = objc_opt_class();
      v89[0] = MEMORY[0x1E0C809B0];
      v89[1] = 3221225472;
      v89[2] = __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke_2;
      v89[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v89[4] = v35;
      if (qword_1ED882600 != -1)
        dispatch_once(&qword_1ED882600, v89);
      if (byte_1ED8825A8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("totalWiFiUsage=%f, totalBBUsage=%f"), *(_QWORD *)&v28, *(_QWORD *)&v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "lastPathComponent");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessNetworkAgent accountWithNetworkUsageDiffEntries:withStartDate:withEndDate:]");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "logMessage:fromFile:fromFunction:fromLineNumber:", v36, v39, v40, 1168);

        PLLogCommon();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v101 = v36;
          _os_log_debug_impl(&dword_1CAF47000, v41, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v28 + v34;
    if (v28 + v34 > 0.0)
    {
      v76 = v9;
      v77 = v8;
      v78 = v7;
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      obj = v17;
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
      if (v43)
      {
        v44 = v43;
        v80 = *(_QWORD *)v86;
        do
        {
          for (j = 0; j != v44; ++j)
          {
            if (*(_QWORD *)v86 != v80)
              objc_enumerationMutation(obj);
            v46 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * j);
            objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("BundleName"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("ProcessName"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("ExtensionName"));
            v49 = objc_claimAutoreleasedReturnValue();
            v50 = (void *)v49;
            if (v47)
              v51 = v47;
            else
              v51 = v48;
            if (v49)
              v51 = (void *)v49;
            v52 = v51;
            v53 = 0.0;
            v54 = 0.0;
            if (v28 > 0.0)
            {
              objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("WifiIn"));
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "doubleValue");
              v57 = v56;
              objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("WifiOut"));
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "doubleValue");
              v54 = (v57 + v59) / v28;

            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v54);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "setObject:forKeyedSubscript:", v60, v52);

            if (v34 > 0.0)
            {
              objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("CellIn"));
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "doubleValue");
              v63 = v62;
              objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("CellOut"));
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "doubleValue");
              v53 = (v63 + v65) / v34;

            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v53);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "setObject:forKeyedSubscript:", v66, v52);

          }
          v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
        }
        while (v44);
      }

      v8 = v77;
      v7 = v78;
      v9 = v76;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled", v42))
    {
      v67 = objc_opt_class();
      v84[0] = MEMORY[0x1E0C809B0];
      v84[1] = 3221225472;
      v84[2] = __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke_262;
      v84[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v84[4] = v67;
      if (qword_1ED882608 != -1)
        dispatch_once(&qword_1ED882608, v84);
      if (byte_1ED8825A9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("identifierToWeightWiFi=%@, identifierToWeightBB=%@"), v82, v81);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "lastPathComponent");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessNetworkAgent accountWithNetworkUsageDiffEntries:withStartDate:withEndDate:]");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "logMessage:fromFile:fromFunction:fromLineNumber:", v68, v71, v72, 1194);

        PLLogCommon();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v101 = v68;
          _os_log_debug_impl(&dword_1CAF47000, v73, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "createDistributionEventIntervalWithDistributionID:withChildNodeNameToWeight:withStartDate:withEndDate:", 37, v82, v8, v9);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "createDistributionEventIntervalWithDistributionID:withChildNodeNameToWeight:withStartDate:withEndDate:", 38, v81, v8, v9);

  }
}

uint64_t __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8825A7 = result;
  return result;
}

void __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke_255(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v3, "numberWithDouble:", v7 + v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v5);

}

uint64_t __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8825A8 = result;
  return result;
}

uint64_t __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke_262(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8825A9 = result;
  return result;
}

- (void)handleHighBWStartCallback:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "High BW payload: %@", (uint8_t *)&v13, 0xCu);
  }

  +[PLOperator entryKeyForType:andName:](PLProcessNetworkAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("HighCellularBWTransactions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v6);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HighThroughputStartReason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("HighThroughputStartReason"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HighThroughputLinkRxTputAfterStart"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("HighThroughputLinkRxTputAfterStart"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HighThroughputLinkTxTputAfterStart"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("HighThroughputLinkTxTputAfterStart"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HighThroughputOriginators"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("HighThroughputOriginators"));

  -[PLOperator logEntry:](self, "logEntry:", v7);
}

- (void)handleHighBWEndCallback:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  id obj;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  _QWORD v32[4];
  uint8_t v33[128];
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "High BW payload details: %@", buf, 0xCu);
  }

  +[PLOperator entryKeyForType:andName:](PLProcessNetworkAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("HighCellularBWTransactionsDetail"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80008]), "initWithEntryKey:", v22);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HighThroughputStartReason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("HighThroughputStartReason"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HighThroughputLinkRxTputAfterStart"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("HighThroughputLinkRxTputAfterStart"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HighThroughputLinkTxTputAfterStart"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("HighThroughputLinkTxTputAfterStart"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HighThroughputOriginators"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("HighThroughputOriginators"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HighThroughputDuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v5;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("HighThroughputDuration"));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v24 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HighThroughputParticipants"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v15);
        v31[0] = CFSTR("Participant");
        objc_msgSend(v16, "objectForKeyedSubscript:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v17;
        v31[1] = CFSTR("Duration");
        objc_msgSend(v16, "objectForKeyedSubscript:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v32[1] = v18;
        v31[2] = CFSTR("RxBytes");
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("RxBytes"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v32[2] = v19;
        v31[3] = CFSTR("TxBytes");
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("TxBytes"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v32[3] = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "setObject:forKeyedSubscript:", &unk_1E8632148, v21);
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v13);
  }

  -[PLOperator logEntry:](self, "logEntry:", v26);
}

- (__NStatManager)statManagerRef
{
  return self->_statManagerRef;
}

- (void)setStatManagerRef:(__NStatManager *)a3
{
  self->_statManagerRef = a3;
}

- (UsageFeed)usageFeed
{
  return (UsageFeed *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUsageFeed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLEntryNotificationOperatorComposition)batteryLevelChangedListenerForNetworkBitmap
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBatteryLevelChangedListenerForNetworkBitmap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLMonotonicTimer)logUsageTimer
{
  return (PLMonotonicTimer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLogUsageTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSDictionary)lastProcessNameToNetworkUsageEntry
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastProcessNameToNetworkUsageEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSDate)lastEntryDate
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastEntryDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableSet)processes
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setProcesses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (unint64_t)lastNetworkBitmapTimestamp
{
  return self->_lastNetworkBitmapTimestamp;
}

- (void)setLastNetworkBitmapTimestamp:(unint64_t)a3
{
  self->_lastNetworkBitmapTimestamp = a3;
}

- (unint64_t)curNetworkBitmapTimestampForSysdiagnoseTrigger
{
  return self->_curNetworkBitmapTimestampForSysdiagnoseTrigger;
}

- (void)setCurNetworkBitmapTimestampForSysdiagnoseTrigger:(unint64_t)a3
{
  self->_curNetworkBitmapTimestampForSysdiagnoseTrigger = a3;
}

- (PLCFNotificationOperatorComposition)flushNetworkBitmapsListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFlushNetworkBitmapsListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (PLNSNotificationOperatorComposition)sysdiagnoseListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSysdiagnoseListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PLXPCListenerOperatorComposition)highBWStartListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setHighBWStartListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (PLXPCListenerOperatorComposition)highBWEndlistener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setHighBWEndlistener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highBWEndlistener, 0);
  objc_storeStrong((id *)&self->_highBWStartListener, 0);
  objc_storeStrong((id *)&self->_sysdiagnoseListener, 0);
  objc_storeStrong((id *)&self->_flushNetworkBitmapsListener, 0);
  objc_storeStrong((id *)&self->_processes, 0);
  objc_storeStrong((id *)&self->_lastEntryDate, 0);
  objc_storeStrong((id *)&self->_lastProcessNameToNetworkUsageEntry, 0);
  objc_storeStrong((id *)&self->_logUsageTimer, 0);
  objc_storeStrong((id *)&self->_batteryLevelChangedListenerForNetworkBitmap, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
  objc_storeStrong((id *)&self->_usageFeed, 0);
}

@end
