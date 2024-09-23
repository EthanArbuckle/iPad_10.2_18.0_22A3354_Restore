@implementation PLProcessMonitorAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLProcessMonitorAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
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
  _QWORD v15[10];
  _QWORD v16[12];

  v16[10] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("MemoryTracking");
  objc_msgSend(a1, "entryEventPointMemoryTracking");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  v15[1] = CFSTR("ProcessSnapshot");
  objc_msgSend(a1, "entryEventPointProcessSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v3;
  v15[2] = CFSTR("ProcessExit");
  objc_msgSend(a1, "entryEventPointProcessExit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v4;
  v15[3] = CFSTR("FreezerStats");
  objc_msgSend(a1, "entryEventPointFreezerStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v5;
  v15[4] = CFSTR("FreezerDemotion");
  objc_msgSend(a1, "entryEventPointFreezerDemotion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v6;
  v15[5] = CFSTR("SharedCacheReslid");
  objc_msgSend(a1, "entryEventPointSharedCacheReslid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v7;
  v15[6] = CFSTR("AppResumePredictions");
  objc_msgSend(a1, "entryEventPointAppResumePredictions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v8;
  v15[7] = CFSTR("AppNotFrozen");
  objc_msgSend(a1, "entryEventPointAppNotFrozen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v9;
  v15[8] = CFSTR("SystemFreezerStats");
  objc_msgSend(a1, "entryEventPointSystemFreezerStats");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v10;
  v15[9] = CFSTR("AppNapEnabled");
  objc_msgSend(a1, "entryEventPointAppNapEnabled");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointMemoryTracking
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
  v23 = &unk_1EA1DAA58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  v24[1] = *MEMORY[0x1E0D802F0];
  v20[0] = CFSTR("HeapTotal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_RealFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v17;
  v20[1] = CFSTR("HeapUsed");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_RealFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v15;
  v20[2] = CFSTR("HeapFree");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_RealFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v13;
  v20[3] = CFSTR("MallocBlocks");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v3;
  v20[4] = CFSTR("MallocSize");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_RealFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v5;
  v20[5] = CFSTR("MallocMaxSize");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_RealFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v7;
  v20[6] = CFSTR("MallocAllocated");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_RealFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointProcessSnapshot
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
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[2];
  _QWORD v21[4];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v18[0] = *MEMORY[0x1E0D80318];
  v18[1] = v2;
  v19[0] = &unk_1EA1DAA58;
  v19[1] = MEMORY[0x1E0C9AAB0];
  v3 = *MEMORY[0x1E0D80330];
  v18[2] = *MEMORY[0x1E0D80300];
  v18[3] = v3;
  v19[2] = MEMORY[0x1E0C9AAA0];
  v19[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E0D802F0];
  v16[0] = CFSTR("PID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v16[1] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat_withBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v7;
  v16[2] = CFSTR("PhyFootprint");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v9;
  v16[3] = CFSTR("StartOrder");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryEventPointProcessExit
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
  _QWORD v21[7];
  _QWORD v22[7];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[2];
  _QWORD v26[4];

  v26[2] = *MEMORY[0x1E0C80C00];
  v25[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v23[0] = *MEMORY[0x1E0D80318];
  v23[1] = v2;
  v24[0] = &unk_1EA1DAA68;
  v24[1] = MEMORY[0x1E0C9AAB0];
  v23[2] = *MEMORY[0x1E0D80250];
  v24[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v20;
  v25[1] = *MEMORY[0x1E0D802F0];
  v21[0] = CFSTR("PID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  v21[1] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat_withProcessName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  v21[2] = CFSTR("timeSinceSpawn");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v14;
  v21[3] = CFSTR("lastTimeToRelaunch");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v4;
  v21[4] = CFSTR("ReasonNamespace");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v6;
  v21[5] = CFSTR("ReasonCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v8;
  v21[6] = CFSTR("JetsamPriority");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointSystemFreezerStats
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
  _QWORD v21[7];
  _QWORD v22[7];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[4];

  v26[2] = *MEMORY[0x1E0C80C00];
  v25[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v23[0] = *MEMORY[0x1E0D80318];
  v23[1] = v2;
  v24[0] = &unk_1EA1DAA58;
  v24[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v20;
  v25[1] = *MEMORY[0x1E0D802F0];
  v21[0] = CFSTR("RemainingPages");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  v21[1] = CFSTR("ThawCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  v21[2] = CFSTR("ThawPercentage");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v14;
  v21[3] = CFSTR("RefreezeAvgBytes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v4;
  v21[4] = CFSTR("ThawsPerGB");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v6;
  v21[5] = CFSTR("SwapTotal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v8;
  v21[6] = CFSTR("SwapUsed");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointFreezerStats
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
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1EA1DAA58;
  v20[1] = MEMORY[0x1E0C9AAB0];
  v19[2] = *MEMORY[0x1E0D80250];
  v20[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("PID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat_withProcessName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("Credits");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("Debits");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("Balance");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointFreezerDemotion
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
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1EA1DAA58;
  v14[1] = MEMORY[0x1E0C9AAB0];
  v13[2] = *MEMORY[0x1E0D80250];
  v14[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("PID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("ProcessName");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat_withProcessName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventPointSharedCacheReslid
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
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1EA1DAA58;
  v14[1] = MEMORY[0x1E0C9AAB0];
  v13[2] = *MEMORY[0x1E0D80250];
  v14[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("PID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("ProcessName");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat_withProcessName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventPointAppResumePredictions
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
  v16[0] = &unk_1EA1DAA58;
  v16[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("PredictionScore");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_RealFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("PredictionType");
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

+ (id)entryEventPointAppNotFrozen
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
  v16[0] = &unk_1EA1DAA58;
  v16[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("PID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("Reason");
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

+ (id)entryEventPointAppNapEnabled
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
  v12[0] = &unk_1EA1DAA58;
  v12[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("PID");
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

+ (id)entryEventForwardDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("ProcessID");
  objc_msgSend(a1, "entryEventForwardProcessID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("AppResumeInferredCarry");
  v8[0] = v3;
  objc_msgSend(a1, "entryEventForwardAppResumeInferredCarry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryEventForwardProcessID
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
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[2];
  _QWORD v21[4];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v18[0] = *MEMORY[0x1E0D80318];
  v18[1] = v2;
  v19[0] = &unk_1EA1DAA68;
  v19[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80250];
  v18[2] = *MEMORY[0x1E0D80288];
  v18[3] = v3;
  v19[2] = MEMORY[0x1E0C9AAB0];
  v19[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v20[1] = *MEMORY[0x1E0D802F0];
  v16[0] = CFSTR("PID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v16[1] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat_withBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v7;
  v16[2] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat_withProcessName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v9;
  v16[3] = CFSTR("CoalitionID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryEventForwardAppResumeInferredCarry
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
  if (!objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
    return MEMORY[0x1E0C9AA70];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1EA1DAA58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("CarryType");
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

+ (id)entryEventBackwardDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("ProcessExitHistogram");
  objc_msgSend(a1, "entryEventBackwardProcessExitHistogram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("ThreadStats");
  objc_msgSend(a1, "entryEventBackwardDefinitionThreadStats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("AppLaunchTimeSeries");
  objc_msgSend(a1, "entryEventBackwardAppLaunchTimeSeries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventBackwardDefinitionThreadStats
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
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLProcessMonitorAgent enableThreadStatsLogging](PLProcessMonitorAgent, "enableThreadStatsLogging"))return MEMORY[0x1E0C9AA70];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1EA1DAA58;
  v20[1] = MEMORY[0x1E0C9AAB0];
  v19[2] = *MEMORY[0x1E0D80250];
  v20[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("PID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat_withProcessName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("ThreadName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("SysTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("UsrTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardAppLaunchTimeSeries
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
  v16[0] = &unk_1EA1DAA58;
  v16[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("Duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("IsForeground");
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

+ (id)entryEventIntervalDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("ProcessMonitorInterval");
  objc_msgSend(a1, "entryEventIntervalDefinitionProcessMonitorDiff");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("KernelTaskMonitor");
  v8[0] = v3;
  objc_msgSend(a1, "entryEventIntervalDefinitionKernelTaskMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryEventIntervalDefinitionProcessMonitorDiff
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
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[2];
  _QWORD v23[2];
  const __CFString *v24;
  void *v25;
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[3];
  _QWORD v29[5];

  v29[3] = *MEMORY[0x1E0C80C00];
  v28[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802A8];
  v26[0] = *MEMORY[0x1E0D80318];
  v26[1] = v2;
  v27[0] = &unk_1EA1DAA78;
  v27[1] = MEMORY[0x1E0C9AAB0];
  v3 = *MEMORY[0x1E0D80250];
  v26[2] = *MEMORY[0x1E0D80288];
  v26[3] = v3;
  v27[2] = MEMORY[0x1E0C9AAB0];
  v27[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v19;
  v28[1] = *MEMORY[0x1E0D802F0];
  v24 = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_DateFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v16;
  v28[2] = *MEMORY[0x1E0D802B0];
  v22[0] = CFSTR("key");
  v20[0] = CFSTR("PID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  v20[1] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat_withProcessName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v6;
  v20[2] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat_withBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = CFSTR("value");
  v23[0] = v9;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryEventIntervalDefinitionKernelTaskMonitor
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
  v2 = *MEMORY[0x1E0D80288];
  v21[0] = *MEMORY[0x1E0D80318];
  v21[1] = v2;
  v22[0] = &unk_1EA1DAA68;
  v22[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E0D802F0];
  v19[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_DateFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v19[1] = CFSTR("ThreadID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  v19[2] = CFSTR("ThreadName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v4;
  v19[3] = CFSTR("CPUTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v6;
  v19[4] = CFSTR("CPUEnergyP");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v8;
  v19[5] = CFSTR("CPUEnergyE");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardProcessExitHistogram
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
  _QWORD v25[9];
  _QWORD v26[9];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[2];
  _QWORD v30[4];

  v30[2] = *MEMORY[0x1E0C80C00];
  v29[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v27[0] = *MEMORY[0x1E0D80318];
  v27[1] = v2;
  v28[0] = &unk_1EA1DAA58;
  v28[1] = MEMORY[0x1E0C9AAB0];
  v27[2] = *MEMORY[0x1E0D80250];
  v28[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v24;
  v29[1] = *MEMORY[0x1E0D802F0];
  v25[0] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_StringFormat_withProcessName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v22;
  v25[1] = CFSTR("lastTimeToRelaunch");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v20;
  v25[2] = CFSTR("ReasonNamespace");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v18;
  v25[3] = CFSTR("ReasonCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v16;
  v25[4] = CFSTR("0s-5s");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v14;
  v25[5] = CFSTR("5s-10s");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26[5] = v4;
  v25[6] = CFSTR("10s-60s");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[6] = v6;
  v25[7] = CFSTR("60s+");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[7] = v8;
  v25[8] = CFSTR("UnknownDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)defaults
{
  return &unk_1EA1D8238;
}

- (PLProcessMonitorAgent)init
{
  PLProcessMonitorAgent *v2;
  uint64_t v3;
  NSMutableSet *processes;
  NSDictionary *diffFreezerProcs;
  NSDictionary *lastFreezerProcs;
  NSDictionary *lastCPUTimeDict;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLProcessMonitorAgent;
  v2 = -[PLAgent init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    processes = v2->_processes;
    v2->_processes = (NSMutableSet *)v3;

    v2->_launchServiceStatsEnabled = 0;
    v2->_processExitSummaryCount = 0;
    diffFreezerProcs = v2->_diffFreezerProcs;
    v2->_diffFreezerProcs = 0;

    lastFreezerProcs = v2->_lastFreezerProcs;
    v2->_lastFreezerProcs = 0;

    lastCPUTimeDict = v2->_lastCPUTimeDict;
    v2->_lastCPUTimeDict = 0;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_processesOfInterest_, CFSTR("PLProcessMonitorAgent.addProcessesOfInterest"), 0);

  }
  return v2;
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
      -[PLProcessMonitorAgent processes](self, "processes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("entry"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "unionSet:", v7);

    }
    v4 = v8;
  }

}

- (void)initOperatorDependancies
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a1, a3, "ProcDirtyStats: Picked random time in next 24 hours for sending stats to CA: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

uint64_t __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v5[16];

  PLLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DA9D6000, v2, OS_LOG_TYPE_DEFAULT, "ProcessMonitor: Received SBC notification!", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "updateProcessMonitorCache");
  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalProcessMonitorIntervalUsingCache");
  objc_msgSend(*(id *)(a1 + 32), "logEventPointMemoryTracking");
  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalKernelTaskMonitor");
  objc_msgSend(*(id *)(a1 + 32), "logProcessExit");
  objc_msgSend(*(id *)(a1 + 32), "logEventPointFreezerStats");
  objc_msgSend(*(id *)(a1 + 32), "logEventPointFreezerDemotion");
  objc_msgSend(*(id *)(a1 + 32), "logEventPointSystemFreezerStats");
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logProcDirtyStats");
  objc_msgSend(*(id *)(a1 + 32), "logThreadStats");
  return objc_msgSend(*(id *)(a1 + 32), "logEventPointAppNapEnabled");
}

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_327(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogProcessMonitor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_327_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventPointAppResumePredictions:", v6);
}

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogProcessMonitor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_334_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventPointAppNotFrozen:", v6);
}

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;

  v6 = a5;
  PLLogProcessMonitor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_338_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardAppResumeInferredCarry:", v6);
}

id __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_347(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogProcessMonitor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_impl(&dword_1DA9D6000, v7, OS_LOG_TYPE_INFO, "MemoryKills query received with info: %@", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "getProcessExits:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "count"))
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("ProcessExits"));
  }
  else
  {
    PLLogProcessMonitor();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_347_cold_1();

    v10 = 0;
  }

  return v10;
}

id __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_358(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  PLLogProcessMonitor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1DA9D6000, v2, OS_LOG_TYPE_INFO, "HUD Terminations query received", v8, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "getAllProcessExitsInLastHour");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("ProcessExits"));
  }
  else
  {
    PLLogProcessMonitor();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_358_cold_1();

    v5 = 0;
  }

  return v5;
}

- (void)updateProcessExitSummary
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  _QWORD block[5];
  _QWORD v16[5];

  +[PLOperator entryKeyForType:andName:](PLProcessMonitorAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("ProcessExitHistogram"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_processExitSummaryCount = objc_msgSend(v4, "countOfEntriesForKey:", v3);

  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __49__PLProcessMonitorAgent_updateProcessExitSummary__block_invoke;
    v16[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v16[4] = objc_opt_class();
    if (updateProcessExitSummary_defaultOnce != -1)
      dispatch_once(&updateProcessExitSummary_defaultOnce, v16);
    if (updateProcessExitSummary_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Init processExitSummaryCount = %d\n"), self->_processExitSummaryCount);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessMonitorAgent updateProcessExitSummary]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 796);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  v13 = dispatch_time(0, 86400000000000);
  -[PLOperator workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __49__PLProcessMonitorAgent_updateProcessExitSummary__block_invoke_365;
  block[3] = &unk_1EA16D040;
  block[4] = self;
  dispatch_after(v13, v14, block);

}

uint64_t __49__PLProcessMonitorAgent_updateProcessExitSummary__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateProcessExitSummary_classDebugEnabled = result;
  return result;
}

void __49__PLProcessMonitorAgent_updateProcessExitSummary__block_invoke_365(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t block;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  uint64_t v15;

  objc_msgSend(*(id *)(a1 + 32), "setProcessExitSummaryCount:", 0);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __49__PLProcessMonitorAgent_updateProcessExitSummary__block_invoke_2;
    v14 = &__block_descriptor_40_e5_v8__0lu32l8;
    v15 = v2;
    if (kPLProcessMonitorAgentAddProcessesOfInterestNotificationName_block_invoke_defaultOnce != -1)
      dispatch_once(&kPLProcessMonitorAgentAddProcessesOfInterestNotificationName_block_invoke_defaultOnce, &block);
    if (kPLProcessMonitorAgentAddProcessesOfInterestNotificationName_block_invoke_classDebugEnabled)
    {
      v3 = (void *)MEMORY[0x1E0CB3940];
      v4 = objc_msgSend(*(id *)(a1 + 32), "processExitSummaryCount");
      objc_msgSend(v3, "stringWithFormat:", CFSTR("Reset processExitSummaryCount = %d\n"), v4, block, v12, v13, v14, v15);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessMonitorAgent updateProcessExitSummary]_block_invoke");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 802);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
}

uint64_t __49__PLProcessMonitorAgent_updateProcessExitSummary__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLProcessMonitorAgentAddProcessesOfInterestNotificationName_block_invoke_classDebugEnabled = result;
  return result;
}

- (void)enableProcessExitLogging
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  strerror(a1);
  OUTLINED_FUNCTION_13_4();
  OUTLINED_FUNCTION_8_2(&dword_1DA9D6000, a2, v3, "Failed to enable launch_service_stats(%d):%s", v4);
  OUTLINED_FUNCTION_8_0();
}

uint64_t __49__PLProcessMonitorAgent_enableProcessExitLogging__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  enableProcessExitLogging_classDebugEnabled = result;
  return result;
}

- (void)disableProcessExitLogging
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t block;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  uint64_t v20;
  _QWORD v21[5];

  -[PLProcessMonitorAgent setLaunchServiceStatsEnabled:](self, "setLaunchServiceStatsEnabled:", 0);
  v2 = launch_service_stats_disable_4ppse();
  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  if ((_DWORD)v2)
  {
    if (v3)
    {
      v4 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __50__PLProcessMonitorAgent_disableProcessExitLogging__block_invoke_374;
      v19 = &__block_descriptor_40_e5_v8__0lu32l8;
      v20 = v4;
      if (disableProcessExitLogging_defaultOnce_372 != -1)
        dispatch_once(&disableProcessExitLogging_defaultOnce_372, &block);
      if (disableProcessExitLogging_classDebugEnabled_373)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to disable launch_service_stats(%d):%s"), v2, strerror(v2), block, v17, v18, v19, v20);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessMonitorAgent disableProcessExitLogging]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 833);

        PLLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
LABEL_14:

      }
    }
  }
  else if (v3)
  {
    v11 = objc_opt_class();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __50__PLProcessMonitorAgent_disableProcessExitLogging__block_invoke;
    v21[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v21[4] = v11;
    if (disableProcessExitLogging_defaultOnce != -1)
      dispatch_once(&disableProcessExitLogging_defaultOnce, v21);
    if (disableProcessExitLogging_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("launch_service_stats successfully disabled."));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessMonitorAgent disableProcessExitLogging]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v14, v15, 830);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      goto LABEL_14;
    }
  }
}

uint64_t __50__PLProcessMonitorAgent_disableProcessExitLogging__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  disableProcessExitLogging_classDebugEnabled = result;
  return result;
}

uint64_t __50__PLProcessMonitorAgent_disableProcessExitLogging__block_invoke_374(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  disableProcessExitLogging_classDebugEnabled_373 = result;
  return result;
}

- (id)eventForwardProcessIDForPID:(int)a3
{
  uint64_t v3;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = *(_QWORD *)&a3;
  v5 = +[PLProcessMonitorAgent PIDToCoalitionID:](PLProcessMonitorAgent, "PIDToCoalitionID:");
  -[PLProcessMonitorAgent processMonitorMultiKeyFromProcessID:](self, "processMonitorMultiKeyFromProcessID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLProcessMonitorAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ProcessID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("CoalitionID"));

  return v8;
}

- (void)getCpuUsageAndMemoryForPid:(int)a3 withBuffer:(void *)a4 withNewProcessArray:(id)a5 withTotalCpu:(unint64_t *)a6 withActiveProcesses:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  ProcessMonitorStats *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _DWORD v24[2];
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v10 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a7;
  if (!proc_pid_rusage(v10, 5, (rusage_info_t *)a4))
  {
    -[PLOperator storage](self, "storage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "processIDEntryForPid:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      -[PLProcessMonitorAgent eventForwardProcessIDForPID:](self, "eventForwardProcessIDForPID:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v16);

    }
    v17 = objc_alloc_init(ProcessMonitorStats);
    +[PLUtilities secondsFromMachTime:](PLUtilities, "secondsFromMachTime:", *((_QWORD *)a4 + 2));
    -[ProcessMonitorStats setCpu_time:](v17, "setCpu_time:", (unint64_t)v18);
    -[ProcessMonitorStats setShared_cache_reslid:](v17, "setShared_cache_reslid:", *((_DWORD *)a4 + 74) & 1);
    -[PLProcessMonitorAgent lastCPUTimeDict](self, "lastCPUTimeDict");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[ProcessMonitorStats setCpu_time_diff:](v17, "setCpu_time_diff:", -[ProcessMonitorStats cpu_time](v17, "cpu_time") - objc_msgSend(v21, "cpu_time"));
      PLLogProcessMonitor();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v24[0] = 67109632;
        v24[1] = v10;
        v25 = 2048;
        v26 = -[ProcessMonitorStats cpu_time](v17, "cpu_time");
        v27 = 2048;
        v28 = objc_msgSend(v21, "cpu_time");
        _os_log_debug_impl(&dword_1DA9D6000, v22, OS_LOG_TYPE_DEBUG, "CPU Time Difference calculation for pid[%d] %llu %llu", (uint8_t *)v24, 0x1Cu);
      }

    }
    else
    {
      -[ProcessMonitorStats setCpu_time_diff:](v17, "setCpu_time_diff:", 0);
    }
    if (-[ProcessMonitorStats cpu_time_diff](v17, "cpu_time_diff"))
      *a6 += -[ProcessMonitorStats cpu_time_diff](v17, "cpu_time_diff");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, v23);

  }
}

- (void)updateProcessMonitorCache
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  unint64_t v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _DWORD __b[1024];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1DF0A47AC](self, a2);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v34 = 0;
  v6 = (void *)objc_opt_new();
  memset(__b, 255, sizeof(__b));
  v7 = 0x1EA16B000uLL;
  if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    -[PLProcessMonitorAgent processes](self, "processes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v29 = v3;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      -[PLProcessMonitorAgent processes](self, "processes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v56, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v31 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            v16 = (void *)MEMORY[0x1DF0A47AC]();
            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            v50 = 0u;
            v51 = 0u;
            v48 = 0u;
            v49 = 0u;
            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            v37 = 0u;
            -[PLProcessMonitorAgent getCpuUsageAndMemoryForPid:withBuffer:withNewProcessArray:withTotalCpu:withActiveProcesses:](self, "getCpuUsageAndMemoryForPid:withBuffer:withNewProcessArray:withTotalCpu:withActiveProcesses:", objc_msgSend(v15, "intValue"), &v37, v6, &v34, v5);
            objc_autoreleasePoolPop(v16);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v56, 16);
        }
        while (v12);
      }

      v3 = v29;
      v7 = 0x1EA16B000;
    }
  }
  else
  {
    v17 = proc_listpids(1u, 0, 0, 0);
    v18 = proc_listpids(1u, 0, __b, 4096);
    if (v17 >= 4)
    {
      v19 = 0;
      v20 = (unint64_t)v17 >> 2;
      do
      {
        v21 = (void *)MEMORY[0x1DF0A47AC](v18);
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v37 = 0u;
        -[PLProcessMonitorAgent getCpuUsageAndMemoryForPid:withBuffer:withNewProcessArray:withTotalCpu:withActiveProcesses:](self, "getCpuUsageAndMemoryForPid:withBuffer:withNewProcessArray:withTotalCpu:withActiveProcesses:", __b[v19], &v37, v6, &v34, v5);
        objc_autoreleasePoolPop(v21);
        if (v19 > 0x3FE)
          break;
        ++v19;
      }
      while (v20 > v19);
    }
  }
  if (objc_msgSend(v6, "count") && (objc_msgSend(*(id *)(v7 + 3136), "isPowerlogHelperd") & 1) == 0)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "entryKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v23;
    v36 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v25 = v3;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "entryKey");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v24, v27);

    v3 = v25;
  }
  -[PLProcessMonitorAgent setLastCPUTimeDict:](self, "setLastCPUTimeDict:", v5);
  -[PLProcessMonitorAgent currentCachedDate](self, "currentCachedDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLProcessMonitorAgent setPreviousCacheDate:](self, "setPreviousCacheDate:", v28);

  -[PLProcessMonitorAgent setCurrentCachedDate:](self, "setCurrentCachedDate:", v4);
  -[PLProcessMonitorAgent setCurrentCachedTotalCPUTime:](self, "setCurrentCachedTotalCPUTime:", (double)v34);

  objc_autoreleasePoolPop(v3);
}

- (id)getFrozenProcesses
{
  id v2;
  uint64_t v3;
  _BYTE *v4;
  __CFString *v5;
  void *v6;
  const __CFString *v7;
  id v8;
  uint64_t v9;
  void *v10;
  int *v11;
  char *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t block;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  uint64_t v24;
  _OWORD v25[32];

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  memset(v25, 0, sizeof(v25));
  if ((int)memorystatus_control() < 1)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v9 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __43__PLProcessMonitorAgent_getFrozenProcesses__block_invoke;
      v23 = &__block_descriptor_40_e5_v8__0lu32l8;
      v24 = v9;
      if (getFrozenProcesses_defaultOnce != -1)
        dispatch_once(&getFrozenProcesses_defaultOnce, &block);
      if (getFrozenProcesses_classDebugEnabled)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = __error();
        v12 = strerror(*v11);
        objc_msgSend(v10, "stringWithFormat:", CFSTR("Error: Could not get frozen process list: %s\n"), v12, block, v21, v22, v23, v24);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessMonitorAgent getFrozenProcesses]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 973);

        PLLogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    v8 = 0;
  }
  else
  {
    v3 = LODWORD(v25[0]);
    if (LODWORD(v25[0]))
    {
      v4 = (_BYTE *)((unint64_t)v25 | 0xC);
      do
      {
        if (*v4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
          v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v4 - 1));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (v5)
            v7 = v5;
          else
            v7 = CFSTR("Unknown Name");
          objc_msgSend(v2, "setObject:forKey:", v7, v6);

        }
        v4 += 40;
        --v3;
      }
      while (v3);
    }
    v8 = v2;
  }

  return v8;
}

uint64_t __43__PLProcessMonitorAgent_getFrozenProcesses__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getFrozenProcesses_classDebugEnabled = result;
  return result;
}

- (id)getProcessesNotInFreezer:(id)a3 withCurrentProcesses:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v13, (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v13);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (int)getLedgerIndex:(int64_t)a3 forKey:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a4;
  if ((ledger() & 0x80000000) == 0)
  {
    v5 = malloc_type_malloc(0, 0x1000040565EDBD2uLL);
    if (v5)
    {
      v6 = v5;
      ledger();
      free(v6);
    }
  }

  return -1;
}

- (int)getFrozenToSwapLedgerIndex:(int64_t)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__PLProcessMonitorAgent_getFrozenToSwapLedgerIndex___block_invoke;
  v4[3] = &unk_1EA16D9E8;
  v4[4] = self;
  v4[5] = a3;
  if (getFrozenToSwapLedgerIndex__onceToken != -1)
    dispatch_once(&getFrozenToSwapLedgerIndex__onceToken, v4);
  return getFrozenToSwapLedgerIndex__frozenToSwapOffset;
}

uint64_t __52__PLProcessMonitorAgent_getFrozenToSwapLedgerIndex___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "getLedgerIndex:forKey:", *(_QWORD *)(a1 + 40), CFSTR("frozen_to_swap"));
  getFrozenToSwapLedgerIndex__frozenToSwapOffset = result;
  return result;
}

- (int)getProcDirtyTimeLedgerIndex:(int64_t)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__PLProcessMonitorAgent_getProcDirtyTimeLedgerIndex___block_invoke;
  v4[3] = &unk_1EA16D9E8;
  v4[4] = self;
  v4[5] = a3;
  if (getProcDirtyTimeLedgerIndex__onceToken != -1)
    dispatch_once(&getProcDirtyTimeLedgerIndex__onceToken, v4);
  return getProcDirtyTimeLedgerIndex__procDirtyTimeOffset;
}

uint64_t __53__PLProcessMonitorAgent_getProcDirtyTimeLedgerIndex___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "getLedgerIndex:forKey:", *(_QWORD *)(a1 + 40), CFSTR("memorystatus_dirty_time"));
  getProcDirtyTimeLedgerIndex__procDirtyTimeOffset = result;
  return result;
}

- (id)ledgerDataAtIndex:(int)a3 forPid:(int64_t)a4
{
  uint64_t v5;
  char *v6;
  char *v7;
  PLLedgerEntryData *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[5];
  _QWORD v31[5];
  uint64_t v32;
  _QWORD block[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v5 = *(_QWORD *)&a3;
  v37 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  if ((ledger() & 0x80000000) != 0)
  {
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_27;
    v10 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__PLProcessMonitorAgent_ledgerDataAtIndex_forPid___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (ledgerDataAtIndex_forPid__defaultOnce != -1)
      dispatch_once(&ledgerDataAtIndex_forPid__defaultOnce, block);
    if (!ledgerDataAtIndex_forPid__classDebugEnabled)
      goto LABEL_27;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error in ledger info"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessMonitorAgent ledgerDataAtIndex:forPid:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 1056);

    PLLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
LABEL_26:

LABEL_27:
    v8 = 0;
    return v8;
  }
  v32 = *((_QWORD *)&v36 + 1);
  v6 = (char *)malloc_type_malloc(56 * *((_QWORD *)&v36 + 1), 0x3DE92795uLL);
  if (!v6)
  {
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_27;
    v24 = objc_opt_class();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __50__PLProcessMonitorAgent_ledgerDataAtIndex_forPid___block_invoke_392;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v24;
    if (ledgerDataAtIndex_forPid__defaultOnce_390 != -1)
      dispatch_once(&ledgerDataAtIndex_forPid__defaultOnce_390, v31);
    if (!ledgerDataAtIndex_forPid__classDebugEnabled_391)
      goto LABEL_27;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to allocate ledger entry info"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "lastPathComponent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessMonitorAgent ledgerDataAtIndex:forPid:]");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v27, v28, 1065);

    PLLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    goto LABEL_26;
  }
  v7 = v6;
  if ((ledger() & 0x80000000) != 0 || v32 <= (int)v5)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v17 = objc_opt_class();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __50__PLProcessMonitorAgent_ledgerDataAtIndex_forPid___block_invoke_397;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v17;
      if (ledgerDataAtIndex_forPid__defaultOnce_395 != -1)
        dispatch_once(&ledgerDataAtIndex_forPid__defaultOnce_395, v30);
      if (ledgerDataAtIndex_forPid__classDebugEnabled_396)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not get ledger entry info for pid %ld and frozen to swap index %d and ledger count %lld"), a4, v5, v32);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessMonitorAgent ledgerDataAtIndex:forPid:]");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 1069);

        PLLogCommon();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    free(v7);
    goto LABEL_27;
  }
  v8 = objc_alloc_init(PLLedgerEntryData);
  v9 = &v7[56 * (int)v5];
  -[PLLedgerEntryData setCredit:](v8, "setCredit:", *((_QWORD *)v9 + 1));
  -[PLLedgerEntryData setDebit:](v8, "setDebit:", *((_QWORD *)v9 + 2));
  -[PLLedgerEntryData setBalance:](v8, "setBalance:", *(_QWORD *)v9);
  free(v7);
  return v8;
}

uint64_t __50__PLProcessMonitorAgent_ledgerDataAtIndex_forPid___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ledgerDataAtIndex_forPid__classDebugEnabled = result;
  return result;
}

uint64_t __50__PLProcessMonitorAgent_ledgerDataAtIndex_forPid___block_invoke_392(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ledgerDataAtIndex_forPid__classDebugEnabled_391 = result;
  return result;
}

uint64_t __50__PLProcessMonitorAgent_ledgerDataAtIndex_forPid___block_invoke_397(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ledgerDataAtIndex_forPid__classDebugEnabled_396 = result;
  return result;
}

- (void)log
{
  -[PLProcessMonitorAgent updateProcessMonitorCache](self, "updateProcessMonitorCache");
  -[PLProcessMonitorAgent logEventIntervalProcessMonitorIntervalUsingCache](self, "logEventIntervalProcessMonitorIntervalUsingCache");
  -[PLProcessMonitorAgent logEventPointMemoryTracking](self, "logEventPointMemoryTracking");
  -[PLProcessMonitorAgent logEventIntervalKernelTaskMonitor](self, "logEventIntervalKernelTaskMonitor");
  -[PLProcessMonitorAgent logProcessExit](self, "logProcessExit");
}

- (void)logEventPointMemoryTracking
{
  void *v3;
  void *v4;
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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[5];
  mstats v23;
  _QWORD block[5];
  malloc_statistics_t stats;
  int v26;
  uint64_t v27;

  if (-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
  {
    +[PLOperator entryKeyForType:andName:](PLProcessMonitorAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("MemoryTracking"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v3);
    v27 = 0;
    v26 = 0;
    memset(&stats, 0, sizeof(stats));
    if (malloc_get_all_zones())
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v5 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __52__PLProcessMonitorAgent_logEventPointMemoryTracking__block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v5;
        if (logEventPointMemoryTracking_defaultOnce != -1)
          dispatch_once(&logEventPointMemoryTracking_defaultOnce, block);
        if (logEventPointMemoryTracking_classDebugEnabled)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error with malloc_get_all_zones"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "lastPathComponent");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessMonitorAgent logEventPointMemoryTracking]");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 1104);

          PLLogCommon();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
    }
    else
    {
      memset(&v23, 0, sizeof(v23));
      mstats(&v23);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v23.bytes_total * 0.0009765625);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("HeapTotal"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v23.bytes_used * 0.0009765625);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("HeapUsed"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v23.bytes_free * 0.0009765625);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("HeapFree"));

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v15 = objc_opt_class();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __52__PLProcessMonitorAgent_logEventPointMemoryTracking__block_invoke_415;
        v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v22[4] = v15;
        if (logEventPointMemoryTracking_defaultOnce_413 != -1)
          dispatch_once(&logEventPointMemoryTracking_defaultOnce_413, v22);
        if (logEventPointMemoryTracking_classDebugEnabled_414)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("heap: total=%f used=%f free=%f"), (double)v23.bytes_total * 0.0009765625, (double)v23.bytes_used * 0.0009765625, (double)v23.bytes_free * 0.0009765625);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "lastPathComponent");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessMonitorAgent logEventPointMemoryTracking]");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 1127);

          PLLogCommon();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      -[PLOperator logEntry:](self, "logEntry:", v4);
    }

  }
}

uint64_t __52__PLProcessMonitorAgent_logEventPointMemoryTracking__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointMemoryTracking_classDebugEnabled = result;
  return result;
}

uint64_t __52__PLProcessMonitorAgent_logEventPointMemoryTracking__block_invoke_405(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointMemoryTracking_classDebugEnabled_404 = result;
  return result;
}

uint64_t __52__PLProcessMonitorAgent_logEventPointMemoryTracking__block_invoke_410(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointMemoryTracking_classDebugEnabled_409 = result;
  return result;
}

uint64_t __52__PLProcessMonitorAgent_logEventPointMemoryTracking__block_invoke_415(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointMemoryTracking_classDebugEnabled_414 = result;
  return result;
}

- (void)logEventPointProcessSnapshot
{
  unsigned int v3;
  int v4;
  size_t v5;
  int *v6;
  int *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  PLProcessMonitorAgent *v44;
  int *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  void *v54;
  id v55;
  _BYTE v56[128];
  _BYTE v57[128];
  rusage_info_t v58[2];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _OWORD buffer[12];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = proc_listpids(1u, 0, 0, 0);
  if ((v3 & 0x80000000) == 0)
  {
    v4 = v3;
    v5 = v3;
    v6 = (int *)malloc_type_malloc(v3, 0xD59F943uLL);
    if (v6)
    {
      v7 = v6;
      v44 = self;
      memset(v6, 255, v5);
      v45 = v7;
      v8 = proc_listpids(1u, 0, v7, v4);
      +[PLOperator entryKeyForType:andName:](PLProcessMonitorAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("ProcessSnapshot"));
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_opt_new();
      v11 = (void *)objc_opt_new();
      if (v8 >= 4)
      {
        if ((unint64_t)v8 >> 2 <= 1)
          v12 = 1;
        else
          v12 = (unint64_t)v8 >> 2;
        v13 = 0x1E0D7F000uLL;
        do
        {
          v15 = *v7++;
          v14 = v15;
          if (v15 >= 1)
          {
            memset(buffer, 0, sizeof(buffer));
            if (proc_pidinfo(v14, 18, 0, buffer, 192) == 192 && DWORD1(buffer[0]) != 5)
            {
              v65 = 0u;
              v66 = 0u;
              v63 = 0u;
              v64 = 0u;
              v61 = 0u;
              v62 = 0u;
              v59 = 0u;
              v60 = 0u;
              *(_OWORD *)v58 = 0u;
              if (!proc_pid_rusage(v14, 1, v58))
              {
                v16 = (void *)objc_msgSend(objc_alloc(*(Class *)(v13 + 4016)), "initWithEntryKey:", v9);
                if (v16)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
                  v17 = v13;
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("PID"));

                  v13 = v17;
                  +[PLUtilities bundleIDFromPid:](PLUtilities, "bundleIDFromPid:", v14);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("BundleID"));

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v62 + 1));
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("PhyFootprint"));

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v63);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, CFSTR("StartOrder"));

                  objc_msgSend(v10, "addObject:", v16);
                  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("StartOrder"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "addObject:", v22);

                }
              }
            }
          }
          --v12;
        }
        while (v12);
      }
      v43 = (void *)v9;
      v23 = objc_msgSend(v11, "count", v10);
      v24 = (void *)objc_opt_new();
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v25 = v11;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v51;
        do
        {
          v29 = 0;
          v30 = v23;
          do
          {
            if (*(_QWORD *)v51 != v28)
              objc_enumerationMutation(v25);
            v31 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v29);
            v23 = (v30 - 1);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v32, v31);

            ++v29;
            v30 = v23;
          }
          while (v27 != v29);
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
        }
        while (v27);
      }

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v33 = v42;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v47 != v36)
              objc_enumerationMutation(v33);
            v38 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
            objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("StartOrder"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "setObject:forKeyedSubscript:", v40, CFSTR("StartOrder"));

          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
        }
        while (v35);
      }

      v54 = v43;
      v55 = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator logEntries:withGroupID:](v44, "logEntries:withGroupID:", v41, v43);

      free(v45);
    }
  }
}

- (void)logProcessExit
{
  *(_DWORD *)a2 = 67109378;
  *(_DWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 8) = 2080;
  *(_QWORD *)(a2 + 10) = a1;
  OUTLINED_FUNCTION_8_2(&dword_1DA9D6000, a4, a3, "Failed to fetch launch_service_stats(%d):%s", (uint8_t *)a2);
}

uint64_t __39__PLProcessMonitorAgent_logProcessExit__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultLongForKey:", CFSTR("ProcessExitSummaryRowThreshold"));
  logProcessExit_objectForKey = result;
  return result;
}

uint64_t __39__PLProcessMonitorAgent_logProcessExit__block_invoke_425(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultLongForKey:", CFSTR("ThresholdToSkipAppExitDetail"));
  logProcessExit_objectForKey_424 = result;
  return result;
}

uint64_t __39__PLProcessMonitorAgent_logProcessExit__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultLongForKey:", CFSTR("ThresholdToSkipProcessExitDetail"));
  logProcessExit_objectForKey_427 = result;
  return result;
}

- (void)logEventPointProcessExit:(id)a3 excludeProcesses:(id)a4 withStats:(id *)a5 withDate:(id)a6 withNowInSec:(unint64_t)a7
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  _launch_service_stats_record *var1;
  unsigned int *v19;
  void *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  size_t v26;
  unint64_t v27;
  void *v29;
  void *v30;
  char *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id obj;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *context;
  id v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  void *v66;
  void *v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v51 = a4;
  v48 = a6;
  v42 = v9;
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_429);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = (void *)objc_opt_new();
  +[PLOperator entryKeyForType:andName:](PLProcessMonitorAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("ProcessExit"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v11;
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
  if (v43)
  {
    v41 = *(_QWORD *)v63;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v63 != v41)
          objc_enumerationMutation(obj);
        v44 = v12;
        objc_msgSend(v42, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v49 = v13;
        v52 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
        if (v52)
        {
          v14 = *(_QWORD *)v59;
          do
          {
            for (i = 0; i != v52; ++i)
            {
              if (*(_QWORD *)v59 != v14)
                objc_enumerationMutation(v49);
              v16 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
              context = (void *)MEMORY[0x1DF0A47AC]();
              v17 = objc_msgSend(v16, "intValue");
              var1 = a5->var1;
              v19 = (unsigned int *)((char *)var1 + 51 * v17);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_array_get_string(a5->var0, *v19));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v51, "containsObject:", v20) & 1) == 0)
              {
                v21 = (char *)var1 + 51 * v17;
                v23 = *(_QWORD *)(v21 + 12);
                v22 = v21 + 12;
                objc_msgSend(v48, "dateByAddingTimeInterval:", (double)(a7 - v23) / -1000.0);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v46, v50);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v22 + 2));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("PID"));

                v26 = *v19;
                if (xpc_array_get_count(a5->var0) > v26)
                  objc_msgSend(v24, "setObject:forKeyedSubscript:", v20, CFSTR("ProcessName"));
                v27 = *(_QWORD *)((char *)var1 + 51 * v17 + 4);
                if (*(_QWORD *)v22 > v27 && v27 != 0)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)v22 - v27);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "setObject:forKeyedSubscript:", v29, CFSTR("timeSinceSpawn"));

                }
                if (*(_DWORD *)((char *)var1 + 51 * v17 + 24) != -1)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "setObject:forKeyedSubscript:", v30, CFSTR("lastTimeToRelaunch"));

                }
                v31 = (char *)var1 + 51 * v17;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v31[28]);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "setObject:forKeyedSubscript:", v32, CFSTR("ReasonNamespace"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v31 + 29));
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "setObject:forKeyedSubscript:", v33, CFSTR("ReasonCode"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(v31 + 49));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "setObject:forKeyedSubscript:", v34, CFSTR("JetsamPriority"));

                objc_msgSend(v47, "addObject:", v24);
              }
              if (objc_msgSend(v20, "hasPrefix:", CFSTR("UIKitApplication:")))
              {
                objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR("UIKitApplication:"), &stru_1EA174678);
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                v36 = objc_msgSend(v35, "rangeOfString:", CFSTR("["));
                if (v36 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  objc_msgSend(v35, "substringToIndex:", v36);
                  v37 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_28;
                }
              }
              else
              {
                if (objc_msgSend(v20, "hasPrefix:", CFSTR("application.")))
                {
                  +[PLUtilities cleanLaunchdApplicationMacOS:](PLUtilities, "cleanLaunchdApplicationMacOS:", v20);
                  v37 = objc_claimAutoreleasedReturnValue();
                  v35 = v20;
LABEL_28:

                  v35 = (void *)v37;
                  goto LABEL_30;
                }
                v35 = v20;
              }
LABEL_30:
              if ((objc_msgSend(v35, "containsString:", CFSTR("/")) & 1) == 0)
              {
                if (*(_DWORD *)((char *)var1 + 51 * v17 + 24) != -1)
                {
                  v57 = v35;
                  AnalyticsSendEventLazy();

                }
                v56 = v35;
                AnalyticsSendEventLazy();
                v55 = v56;
                AnalyticsSendEventLazy();

              }
              objc_autoreleasePoolPop(context);
            }
            v52 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
          }
          while (v52);
        }

        v12 = v44 + 1;
      }
      while (v44 + 1 != v43);
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    }
    while (v43);
  }

  if (objc_msgSend(v47, "count"))
  {
    v66 = v46;
    v67 = v47;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v38, v46);

  }
}

uint64_t __99__PLProcessMonitorAgent_logEventPointProcessExit_excludeProcesses_withStats_withDate_withNowInSec___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

id __99__PLProcessMonitorAgent_logEventPointProcessExit_excludeProcesses_withStats_withDate_withNowInSec___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = *(_QWORD *)(a1 + 32);
  v3 = (uint64_t *)(a1 + 32);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("procname"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v3[1] + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("time_to_relaunch_ms"));

  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __99__PLProcessMonitorAgent_logEventPointProcessExit_excludeProcesses_withStats_withDate_withNowInSec___block_invoke_2_cold_1(v3, (uint64_t)v2, v6);

  return v2;
}

id __99__PLProcessMonitorAgent_logEventPointProcessExit_excludeProcesses_withStats_withDate_withNowInSec___block_invoke_445(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  +[PLUtilities intervalPeakCADictionaryForLaunchdName:intervalMaxKB:](PLUtilities, "intervalPeakCADictionaryForLaunchdName:intervalMaxKB:", *(_QWORD *)(a1 + 32), *(unsigned int *)(*(_QWORD *)(a1 + 40) + 41));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("is_uikit_app"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 49));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("is_mac_app"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 28));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("exit_reason_namespace"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 29));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("exit_reason_code"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(a1 + 40) + 37));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("lifetime_peak_footprint_kb"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(*(_QWORD *)(a1 + 40) + 49));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("jetsam_priority"));

  return v2;
}

id __99__PLProcessMonitorAgent_logEventPointProcessExit_excludeProcesses_withStats_withDate_withNowInSec___block_invoke_2_460(uint64_t a1)
{
  return +[PLUtilities intervalPeakCADictionaryForLaunchdName:intervalMaxKB:](PLUtilities, "intervalPeakCADictionaryForLaunchdName:intervalMaxKB:", *(_QWORD *)(a1 + 32), *(unsigned int *)(*(_QWORD *)(a1 + 40) + 41));
}

- (id)getAllProcessExitsInLastHour
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PLProcessMonitorAgent logProcessExit](self, "logProcessExit");
  +[PLOperator entryKeyForType:andName:](PLProcessMonitorAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("ProcessExitHistogram"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", -3600.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "timeIntervalSince1970");
  v8 = v7;
  objc_msgSend(v4, "timeIntervalSince1970");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("SELECT ID, %@, %@, %@, timestamp from %@ WHERE timestamp > %f AND timestamp <= %f"), CFSTR("ProcessName"), CFSTR("ReasonNamespace"), CFSTR("ReasonCode"), v3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogProcessMonitor();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = (uint64_t)v10;
    _os_log_impl(&dword_1DA9D6000, v11, OS_LOG_TYPE_INFO, "LastHourKills Query is %@", buf, 0xCu);
  }

  -[PLOperator storage](self, "storage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "performQuery:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogProcessMonitor();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = objc_msgSend(v14, "count");
    *(_DWORD *)buf = 134218242;
    v19 = v16;
    v20 = 2112;
    v21 = v14;
    _os_log_impl(&dword_1DA9D6000, v15, OS_LOG_TYPE_INFO, "LastHourKills Result Count is %lu and result %@", buf, 0x16u);
  }

  return v14;
}

- (id)getProcessExits:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    PLLogProcessMonitor();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[PLProcessMonitorAgent getProcessExits:].cold.1();
    goto LABEL_14;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastNHours"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longLongValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ReasonCode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "longLongValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ReasonNamespace"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "longLongValue");

  if ((unint64_t)v7 > 0x18 || v9 < 0 || v11 < 0)
  {
    PLLogProcessMonitor();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      v30 = v7;
      v31 = 2048;
      v32 = v9;
      v33 = 2048;
      v34 = v11;
      _os_log_error_impl(&dword_1DA9D6000, v26, OS_LOG_TYPE_ERROR, "Invalid payload sent to query lastNHours %lld reasonCode %lld reasonNamespace %lld", buf, 0x20u);
    }
LABEL_14:
    v27 = 0;
    goto LABEL_15;
  }
  +[PLOperator entryKeyForType:andName:](PLProcessMonitorAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("ProcessExitHistogram"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateByAddingTimeInterval:", (double)v7 * -3600.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v14, "timeIntervalSince1970");
  v17 = v16;
  objc_msgSend(v13, "timeIntervalSince1970");
  objc_msgSend(v15, "stringWithFormat:", CFSTR("SELECT %@ as LaunchdName, SUM(\"0s-5s\" + \"10s-60s\" + \"5s-10s\" + \"60s+\" + \"UnknownDuration\") as count from %@ WHERE %@ = %lld AND %@ = %lld AND timestamp > %f AND timestamp <= %f GROUP BY %@;"),
    CFSTR("ProcessName"),
    v12,
    CFSTR("ReasonNamespace"),
    v11,
    CFSTR("ReasonCode"),
    v9,
    v17,
    v18,
    CFSTR("ProcessName"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogProcessMonitor();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v30 = (uint64_t)v19;
    _os_log_impl(&dword_1DA9D6000, v20, OS_LOG_TYPE_INFO, "MemoryKills Query is %@", buf, 0xCu);
  }

  -[PLOperator storage](self, "storage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "connection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "performQuery:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogProcessMonitor();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = objc_msgSend(v23, "count");
    *(_DWORD *)buf = 134218242;
    v30 = v25;
    v31 = 2112;
    v32 = (uint64_t)v23;
    _os_log_impl(&dword_1DA9D6000, v24, OS_LOG_TYPE_INFO, "MemoryKills Result Count is %lu and result %@", buf, 0x16u);
  }

  v26 = v23;
  v27 = v26;
LABEL_15:

  return v27;
}

- (void)logEventPointSystemFreezerStats
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Entry for System Freezer Stats : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)logEventPointFreezerStats
{
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = CFSTR("frozen_to_swap");
  OUTLINED_FUNCTION_13_0(&dword_1DA9D6000, a1, a3, "Ledger does not have key %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __50__PLProcessMonitorAgent_logEventPointFreezerStats__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = (int)objc_msgSend(a2, "intValue");
  objc_msgSend(*(id *)(a1 + 32), "ledgerDataAtIndex:forPid:", *(unsigned int *)(a1 + 56), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "credit") / 1024);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("Credits"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "debit") / 1024);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("Debits"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v6, "balance") / 1024);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("Balance"));

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("ProcessName"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("PID"));

    +[PLUtilities bundleIDFromPid:](PLUtilities, "bundleIDFromPid:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("BundleID"));

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", *(_QWORD *)(a1 + 40), v7);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);

  }
}

uint64_t __50__PLProcessMonitorAgent_logEventPointFreezerStats__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointFreezerStats_classDebugEnabled = result;
  return result;
}

- (void)logEventPointFreezerDemotion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD block[5];
  NSObject *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  -[PLProcessMonitorAgent diffFreezerProcs](self, "diffFreezerProcs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_new();
    +[PLOperator entryKeyForType:andName:](PLProcessMonitorAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("FreezerDemotion"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLProcessMonitorAgent diffFreezerProcs](self, "diffFreezerProcs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __53__PLProcessMonitorAgent_logEventPointFreezerDemotion__block_invoke_481;
    v18 = &unk_1EA16D560;
    v7 = v5;
    v19 = v7;
    v8 = v4;
    v20 = v8;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v15);

    if (objc_msgSend(v8, "count", v15, v16, v17, v18))
    {
      v22 = v7;
      v23[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v9, v7);

    }
LABEL_5:

    return;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v10 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__PLProcessMonitorAgent_logEventPointFreezerDemotion__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (logEventPointFreezerDemotion_defaultOnce != -1)
      dispatch_once(&logEventPointFreezerDemotion_defaultOnce, block);
    if (logEventPointFreezerDemotion_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No processes were evicted out of freezer"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessMonitorAgent logEventPointFreezerDemotion]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v13, v14, 1496);

      PLLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      goto LABEL_5;
    }
  }
}

uint64_t __53__PLProcessMonitorAgent_logEventPointFreezerDemotion__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointFreezerDemotion_classDebugEnabled = result;
  return result;
}

void __53__PLProcessMonitorAgent_logEventPointFreezerDemotion__block_invoke_481(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = objc_msgSend(a2, "intValue");
  if (!+[PLUtilities getJetamPriority:](PLUtilities, "getJetamPriority:", v5))
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("ProcessName"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("PID"));

    +[PLUtilities bundleIDFromPid:](PLUtilities, "bundleIDFromPid:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("BundleID"));

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", *(_QWORD *)(a1 + 32), v6);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

  }
}

- (void)logEventPointSharedCacheReslid:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  +[PLOperator entryKeyForType:andName:](PLProcessMonitorAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("SharedCacheReslid"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v8);
  +[PLUtilities processNameForPid:](PLUtilities, "processNameForPid:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("ProcessName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("PID"));

  -[PLOperator logEntry:](self, "logEntry:", v5);
}

- (void)logEventPointAppResumePredictions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0C99D68];
    v5 = a3;
    objc_msgSend(v4, "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "convertFromSystemToMonotonic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("appResumePredictions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[PLOperator entryKeyForType:andName:](PLProcessMonitorAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("AppResumePredictions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __59__PLProcessMonitorAgent_logEventPointAppResumePredictions___block_invoke;
    v18 = &unk_1EA16F8D8;
    v11 = v9;
    v19 = v11;
    v12 = v7;
    v20 = v12;
    v13 = v10;
    v21 = v13;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v15);
    if (objc_msgSend(v13, "count", v15, v16, v17, v18))
    {
      v22 = v11;
      v23[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v14, v11);

    }
  }
}

void __59__PLProcessMonitorAgent_logEventPointAppResumePredictions___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D7FFB0];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithEntryKey:withRawData:", *(_QWORD *)(a1 + 32), v4);

  objc_msgSend(v5, "setEntryDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);

}

- (void)logEventPointAppNotFrozen:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0C99D68];
    v5 = a3;
    objc_msgSend(v4, "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "convertFromSystemToMonotonic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Applications"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[PLOperator entryKeyForType:andName:](PLProcessMonitorAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("AppNotFrozen"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __51__PLProcessMonitorAgent_logEventPointAppNotFrozen___block_invoke;
    v18 = &unk_1EA16F8D8;
    v11 = v9;
    v19 = v11;
    v12 = v7;
    v20 = v12;
    v13 = v10;
    v21 = v13;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v15);
    if (objc_msgSend(v13, "count", v15, v16, v17, v18))
    {
      v22 = v11;
      v23[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v14, v11);

    }
  }
}

void __51__PLProcessMonitorAgent_logEventPointAppNotFrozen___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0D7FFB0];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithEntryKey:withRawData:", *(_QWORD *)(a1 + 32), v4);

  objc_msgSend(v5, "setEntryDate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);

}

- (void)logEventPointAppNapEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "Not enough memory to log AppNap Enabled, returning.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (id)getJetsamSnapshotEntries:(jetsam_snapshot *)a3
{
  void *v5;
  unint64_t v6;
  char *var1;
  void *v8;
  void *v9;
  NSObject *v10;

  if (a3)
  {
    v5 = (void *)objc_opt_new();
    if (a3->var4)
    {
      v6 = 0;
      var1 = a3->var5[0].var1;
      do
      {
        -[PLProcessMonitorAgent getProcessName:](self, "getProcessName:", var1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(var1 + 204));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, v8);

        }
        ++v6;
        var1 += 280;
      }
      while (a3->var4 > v6);
    }
    PLLogProcessMonitor();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[PLProcessMonitorAgent getJetsamSnapshotEntries:].cold.1();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)fetchSnapshotWithFlags:(unsigned int)a3
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  NSObject *v17;
  int v18;
  unint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = memorystatus_control();
  if ((v4 & 0x80000000) != 0)
  {
    PLLogProcessMonitor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PLProcessMonitorAgent fetchSnapshotWithFlags:].cold.1(v7);
    goto LABEL_20;
  }
  v5 = v4;
  if (!v4)
  {
    PLLogProcessMonitor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PLProcessMonitorAgent fetchSnapshotWithFlags:].cold.2(v7);
    goto LABEL_20;
  }
  v6 = v4;
  if (v4 >= 0xC9 && __ROR8__(0xAF8AF8AF8AF8AF8BLL * (v4 - 200), 3) >= 0xEA0EA0EA0EA0EBuLL)
  {
    PLLogProcessMonitor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PLProcessMonitorAgent fetchSnapshotWithFlags:].cold.5();
LABEL_20:

LABEL_21:
    v14 = 0;
    return v14;
  }
  v8 = malloc_type_malloc(v4, 0x66BF9BF9uLL);
  if (!v8)
  {
    PLLogProcessMonitor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PLProcessMonitorAgent fetchSnapshotWithFlags:].cold.3(v5, v7);
    goto LABEL_20;
  }
  v9 = v8;
  v10 = memorystatus_control();
  if ((_DWORD)v10 != v5)
  {
    v16 = v10;
    PLLogProcessMonitor();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[PLProcessMonitorAgent fetchSnapshotWithFlags:].cold.4(v16, v17);

    free(v9);
    goto LABEL_21;
  }
  v11 = ((unint64_t)v5 - 200) / 0x118;
  if (v11 < v9[24])
  {
    PLLogProcessMonitor();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = v9[24];
      v18 = 134218240;
      v19 = (v6 - 200) / 0x118uLL;
      v20 = 2048;
      v21 = v13;
      _os_log_impl(&dword_1DA9D6000, v12, OS_LOG_TYPE_INFO, "Got fewer jetsam entries from the kernel; received %zu, expected %zu",
        (uint8_t *)&v18,
        0x16u);
    }

    v9[24] = v11;
  }
  -[PLProcessMonitorAgent getJetsamSnapshotEntries:](self, "getJetsamSnapshotEntries:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  free(v9);
  return v14;
}

- (id)getProcessName:(char *)a3
{
  __int128 v4;
  __CFString *v5;
  _OWORD v7[2];
  char v8;
  _BYTE v9[4079];

  *(_QWORD *)&v9[4071] = *MEMORY[0x1E0C80C00];
  bzero(v9, 0xFDFuLL);
  v4 = *((_OWORD *)a3 + 1);
  v7[0] = *(_OWORD *)a3;
  v7[1] = v4;
  v8 = a3[32];
  if (LOBYTE(v7[0]))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("Unknown");
  }
  return v5;
}

- (id)getJSEIdleTime
{
  void *v2;
  NSObject *v3;

  -[PLProcessMonitorAgent fetchSnapshotWithFlags:](self, "fetchSnapshotWithFlags:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogProcessMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PLProcessMonitorAgent getJetsamSnapshotEntries:].cold.1();

  return v2;
}

- (void)logProcDirtyStats
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, v0, v1, "ProcDirtyStats: Should Not Log to CoreAnalytics (current_time=%@ is not greater than report_stats_time=%@)", v2);
  OUTLINED_FUNCTION_1();
}

id __42__PLProcessMonitorAgent_logProcDirtyStats__block_invoke(uint64_t a1)
{
  id v2;
  int *v3;
  void *v4;
  __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int16 v11;
  double v12;
  void *v13;
  void *v14;
  NSObject *v15;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (int *)(a1 + 56);
  +[PLUtilities binaryPathForPid:](PLUtilities, "binaryPathForPid:", *(unsigned int *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = CFSTR("Unknown");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("daemon_procname"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("time_dirty_seconds"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("lifetime_seconds"));

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("jse_idle_time"));

    }
  }
  v11 = *(_WORD *)(a1 + 60);
  if (!v11)
  {
    v12 = *(double *)(a1 + 48);
    if (v12 <= 0.0)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40) / v12 * 100.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("percent_dirty"));

      v11 = *(_WORD *)(a1 + 60);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, CFSTR("collection_status"));

  PLLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    __42__PLProcessMonitorAgent_logProcDirtyStats__block_invoke_cold_1(v3, (uint64_t)v2, v15);

  return v2;
}

- (void)logEventForwardAppResumeInferredCarry:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = *MEMORY[0x1E0D80378];
    v5 = a3;
    +[PLOperator entryKeyForType:andName:](PLProcessMonitorAgent, "entryKeyForType:andName:", v4, CFSTR("AppResumeInferredCarry"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v9, v5);

    -[PLOperator logEntry:](self, "logEntry:", v6);
    objc_msgSend(v6, "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entryDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("BackgroundProcessing"), CFSTR("AppResumeInferredCarry"), v7, v8);

  }
}

- (void)logEventBackwardProcessExitHistogram:(id)a3 withStats:(id *)a4 withDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *context;
  id v40;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  _QWORD v47[5];
  _QWORD block[5];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  void *v53;
  void *v54;
  uint8_t buf[4];
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  context = (void *)MEMORY[0x1DF0A47AC]();
  v42 = (void *)objc_opt_new();
  +[PLOperator entryKeyForType:andName:](PLProcessMonitorAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("ProcessExitHistogram"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v9 = v7;
  v40 = v8;
  v43 = v9;
  v46 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v46)
  {
    v44 = *(_QWORD *)v50;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v50 != v44)
          objc_enumerationMutation(v9);
        v11 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v10);
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v45, v8);
        objc_msgSend(v9, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "labelIdx");
        if (xpc_array_get_count(a4->var0) > v14)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_array_get_string(a4->var0, objc_msgSend(v11, "labelIdx")));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("ProcessName"));

          if (objc_msgSend(v11, "lastTTR") != -1)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v11, "lastTTR"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("lastTimeToRelaunch"));

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v11, "exitReasonNamespace"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("ReasonNamespace"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v11, "exitReasonCode"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("ReasonCode"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v13, "duration_0"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("0s-5s"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v13, "duration_5"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("5s-10s"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v13, "duration_10"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("10s-60s"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v13, "duration_60_above"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("60s+"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v13, "duration_unknown"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("UnknownDuration"));

          objc_msgSend(v42, "addObject:", v12);
LABEL_17:
          v9 = v43;
          goto LABEL_18;
        }
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v24 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __81__PLProcessMonitorAgent_logEventBackwardProcessExitHistogram_withStats_withDate___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v24;
          if (logEventBackwardProcessExitHistogram_withStats_withDate__defaultOnce != -1)
            dispatch_once(&logEventBackwardProcessExitHistogram_withStats_withDate__defaultOnce, block);
          if (logEventBackwardProcessExitHistogram_withStats_withDate__classDebugEnabled)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: process exit buffer label index out of range."));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "lastPathComponent");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessMonitorAgent logEventBackwardProcessExitHistogram:withStats:withDate:]");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 1812);

            PLLogCommon();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v56 = v25;
              _os_log_debug_impl(&dword_1DA9D6000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v8 = v40;
            goto LABEL_17;
          }
        }
LABEL_18:

        ++v10;
      }
      while (v46 != v10);
      v46 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v46);
  }

  if (objc_msgSend(v42, "count"))
  {
    v53 = v45;
    v54 = v42;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v31, v45);

  }
  self->_processExitSummaryCount += objc_msgSend(v42, "count");
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v32 = objc_opt_class();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __81__PLProcessMonitorAgent_logEventBackwardProcessExitHistogram_withStats_withDate___block_invoke_509;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v32;
    if (logEventBackwardProcessExitHistogram_withStats_withDate__defaultOnce_507 != -1)
      dispatch_once(&logEventBackwardProcessExitHistogram_withStats_withDate__defaultOnce_507, v47);
    if (logEventBackwardProcessExitHistogram_withStats_withDate__classDebugEnabled_508)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("processExitSummaryCount = %d\n"), self->_processExitSummaryCount, context);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "lastPathComponent");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessMonitorAgent logEventBackwardProcessExitHistogram:withStats:withDate:]");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v36, v37, 1837);

      PLLogCommon();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      v8 = v40;
      v9 = v43;
    }
  }

  objc_autoreleasePoolPop(context);
}

uint64_t __81__PLProcessMonitorAgent_logEventBackwardProcessExitHistogram_withStats_withDate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventBackwardProcessExitHistogram_withStats_withDate__classDebugEnabled = result;
  return result;
}

uint64_t __81__PLProcessMonitorAgent_logEventBackwardProcessExitHistogram_withStats_withDate___block_invoke_509(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventBackwardProcessExitHistogram_withStats_withDate__classDebugEnabled_508 = result;
  return result;
}

- (id)processMonitorMultiKeyFromProcessID:(int)a3
{
  uint64_t v3;
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
  _QWORD v16[3];
  _QWORD v17[3];
  void *v18;
  _BYTE buffer[64];
  uint64_t v20;

  v3 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (proc_name(a3, buffer, 0x40u) < 1)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[PLUtilities bundleIDFromPid:](PLUtilities, "bundleIDFromPid:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("PluginExecutableName"), v5, 0);
    -[PLOperator storage](self, "storage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastEntryForKey:withComparisons:isSingleton:", CFSTR("PLApplicationAgent_EventNone_AllPlugins"), v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PluginId"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3, CFSTR("PID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v16[1] = CFSTR("ProcessName");
  v12 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v12;
  v16[2] = CFSTR("BundleID");
  v13 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {

    if (v5)
      goto LABEL_15;
LABEL_17:

    goto LABEL_15;
  }
  if (!v5)
    goto LABEL_17;
LABEL_15:

  return v14;
}

- (void)logEventIntervalProcessMonitorIntervalUsingCache
{
  int v7;

  v7 = objc_msgSend(a2, "intValue");
  *(_DWORD *)a1 = 67109120;
  *a3 = v7;
  _os_log_debug_impl(&dword_1DA9D6000, a4, OS_LOG_TYPE_DEBUG, "Cache reslid for %d", a1, 8u);
}

- (void)logEventIntervalProcessMonitorInterval
{
  if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    -[PLProcessMonitorAgent updateProcessMonitorCache](self, "updateProcessMonitorCache");
    -[PLProcessMonitorAgent logEventIntervalProcessMonitorIntervalUsingCache](self, "logEventIntervalProcessMonitorIntervalUsingCache");
  }
}

- (int)get_kthread_list:(unint64_t *)a3
{
  int v4;
  uint64_t v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  size_t v17;
  void *v18;
  malloc_type_id_t v19;
  _QWORD block[5];
  _OWORD buffer[5];
  __int128 v23;

  v23 = 0u;
  memset(buffer, 0, sizeof(buffer));
  proc_pidinfo(0, 4, 0, buffer, 96);
  v4 = DWORD1(v23);
  v5 = 8 * SDWORD1(v23);
  v6 = v5 + 120;
  v7 = malloc_type_malloc(v5 + 120, 0xD6B13E90uLL);
  v8 = proc_pidinfo(0, 28, 0, v7, v5 + 120);
  if (v8)
  {
    v9 = v8;
    if (v8 == (_DWORD)v5)
    {
      *a3 = (unint64_t *)v7;
    }
    else
    {
      if (v8 >= (int)v5)
      {
        if (v8 <= (int)v5)
          return 0;
        if (v8 >= v6)
        {
          *a3 = (unint64_t *)v7;
          return v6 >> 3;
        }
        v17 = v8;
        v18 = v7;
        v19 = 119782195;
      }
      else
      {
        v17 = v8;
        v18 = v7;
        v19 = 3594044251;
      }
      *a3 = (unint64_t *)malloc_type_realloc(v18, v17, v19);
      return v9 / 8;
    }
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v10 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__PLProcessMonitorAgent_get_kthread_list___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v10;
      if (get_kthread_list__defaultOnce != -1)
        dispatch_once(&get_kthread_list__defaultOnce, block);
      if (get_kthread_list__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("proc_pidinfo(PROC_PIDLISTTHREADIDS) failed"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLProcessMonitorAgent get_kthread_list:]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 1945);

        PLLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    return -1;
  }
  return v4;
}

uint64_t __42__PLProcessMonitorAgent_get_kthread_list___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  get_kthread_list__classDebugEnabled = result;
  return result;
}

- (void)logEventIntervalKernelTaskMonitor
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, v0, v1, "Error in allocating memory for proc_threadcounts", v2);
  OUTLINED_FUNCTION_6();
}

uint64_t __58__PLProcessMonitorAgent_logEventIntervalKernelTaskMonitor__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventIntervalKernelTaskMonitor_classDebugEnabled = result;
  return result;
}

uint64_t __58__PLProcessMonitorAgent_logEventIntervalKernelTaskMonitor__block_invoke_528(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventIntervalKernelTaskMonitor_classDebugEnabled_527 = result;
  return result;
}

+ (unint64_t)PIDToCoalitionID:(int)a3
{
  int v3;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  _OWORD buffer[2];
  uint64_t v15;

  v15 = 0;
  memset(buffer, 0, sizeof(buffer));
  v3 = proc_pidinfo(a3, 20, 1uLL, buffer, 40);
  if (v3 == 40)
    return *(_QWORD *)&buffer[0];
  v5 = v3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__PLProcessMonitorAgent_PIDToCoalitionID___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (PIDToCoalitionID__defaultOnce != -1)
      dispatch_once(&PIDToCoalitionID__defaultOnce, block);
    if (PIDToCoalitionID__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("proc_pidinfo(PROC_PIDCOALITIONINFO) failed\n"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProcessMonitorAgent.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLProcessMonitorAgent PIDToCoalitionID:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 2109);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  return -v5;
}

uint64_t __42__PLProcessMonitorAgent_PIDToCoalitionID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PIDToCoalitionID__classDebugEnabled = result;
  return result;
}

+ (BOOL)enableThreadStatsLogging
{
  if (enableThreadStatsLogging_onceToken != -1)
    dispatch_once(&enableThreadStatsLogging_onceToken, &__block_literal_global_534);
  return enableThreadStatsLogging_threadStatsEnabled;
}

void __49__PLProcessMonitorAgent_enableThreadStatsLogging__block_invoke()
{
  int v0;
  NSObject *v1;
  uint8_t v2[16];

  if (objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
  {
    v0 = objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:ifNotSet:", CFSTR("PLThreadStats_Enabled"), 0);
    enableThreadStatsLogging_threadStatsEnabled = v0;
    if (!v0)
      return;
  }
  else if (!enableThreadStatsLogging_threadStatsEnabled)
  {
    return;
  }
  PLLogCommon();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1DA9D6000, v1, OS_LOG_TYPE_INFO, "thread stats: enabled", v2, 2u);
  }

}

- (void)initializeThreadStatsLogging
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13_0(&dword_1DA9D6000, v0, v1, "thread stats: error initializing: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)logThreadStats
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PLProcessMonitorAgent threadStats](self, "threadStats");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLOperator entryKeyForType:andName:](PLProcessMonitorAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("ThreadStats"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLProcessMonitorAgent threadStats](self, "threadStats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "diffSinceLastSnapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __39__PLProcessMonitorAgent_logThreadStats__block_invoke;
    v15[3] = &unk_1EA16F970;
    v9 = v5;
    v16 = v9;
    v10 = v4;
    v17 = v10;
    v11 = v8;
    v18 = v11;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v15);
    if (objc_msgSend(v11, "count"))
    {
      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = objc_msgSend(v11, "count");
        *(_DWORD *)buf = 134217984;
        v22 = v13;
        _os_log_impl(&dword_1DA9D6000, v12, OS_LOG_TYPE_INFO, "thread stats: logging %lu entries", buf, 0xCu);
      }

      v19 = v9;
      v20 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v14, v9);

    }
  }
}

void __39__PLProcessMonitorAgent_logThreadStats__block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v5, "threadNameToInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "pid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__PLProcessMonitorAgent_logThreadStats__block_invoke_2;
    v10[3] = &unk_1EA16F948;
    v11 = a1[4];
    v12 = a1[5];
    v13 = v7;
    v14 = v9;
    v15 = a1[6];
    v8 = v7;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);

  }
}

void __39__PLProcessMonitorAgent_logThreadStats__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  v5 = (objc_class *)MEMORY[0x1E0D7FFB0];
  v6 = a3;
  v7 = a2;
  v14 = (id)objc_msgSend([v5 alloc], "initWithEntryKey:withDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("PID"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), CFSTR("ProcessName"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, CFSTR("ThreadName"));

  objc_msgSend(v6, "systemTime");
  v9 = (unint64_t)(v8 * 1000.0);
  objc_msgSend(v6, "userTime");
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("SysTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (unint64_t)(v11 * 1000.0));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("UsrTime"));

  objc_msgSend(*(id *)(a1 + 64), "addObject:", v14);
}

- (void)logEventBackwardAppLaunchTimeSeries:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  PLProcessMonitorAgent *v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  void *v29;
  NSObject *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v22 = self;
    PLLogProcessMonitor();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PLProcessMonitorAgent logEventBackwardAppLaunchTimeSeries:].cold.2();

    v7 = objc_opt_new();
    +[PLOperator entryKeyForType:andName:](PLProcessMonitorAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("AppLaunchTimeSeries"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v23 = v5;
    obj = v5;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
          v14 = (void *)objc_opt_new();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("bundleID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("BundleID"));

          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("IsForeground"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("IsForeground"));

          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("duration"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("Duration"));

          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("beginDate"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "convertFromSystemToMonotonic");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v8, v14);
          objc_msgSend(v20, "setEntryDate:", v19);
          -[NSObject addObject:](v7, "addObject:", v20);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v10);
    }

    if (-[NSObject count](v7, "count"))
    {
      v29 = v8;
      v30 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator logEntries:withGroupID:](v22, "logEntries:withGroupID:", v21, v8);

    }
    v5 = v23;
  }
  else
  {
    PLLogProcessMonitor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PLProcessMonitorAgent logEventBackwardAppLaunchTimeSeries:].cold.1();
  }

}

- (NSDate)currentCachedDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentCachedDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDate)previousCacheDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPreviousCacheDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (double)currentCachedTotalCPUTime
{
  return self->_currentCachedTotalCPUTime;
}

- (void)setCurrentCachedTotalCPUTime:(double)a3
{
  self->_currentCachedTotalCPUTime = a3;
}

- (BOOL)firstBoot
{
  return self->_firstBoot;
}

- (void)setFirstBoot:(BOOL)a3
{
  self->_firstBoot = a3;
}

- (PLMonotonicTimer)logTimer
{
  return (PLMonotonicTimer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLogTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLNSNotificationOperatorComposition)asertionNotifications
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAsertionNotifications:(id)a3
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

- (NSDictionary)lastCPUTimeDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLastCPUTimeDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSDictionary)lastThreadIdToKTMonitorEntryDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setLastThreadIdToKTMonitorEntryDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSDate)lastEntryDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLastEntryDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (BOOL)launchServiceStatsEnabled
{
  return self->_launchServiceStatsEnabled;
}

- (void)setLaunchServiceStatsEnabled:(BOOL)a3
{
  self->_launchServiceStatsEnabled = a3;
}

- (int64_t)processExitSummaryCount
{
  return self->_processExitSummaryCount;
}

- (void)setProcessExitSummaryCount:(int64_t)a3
{
  self->_processExitSummaryCount = a3;
}

- (NSDictionary)lastFreezerProcs
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLastFreezerProcs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSDictionary)diffFreezerProcs
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDiffFreezerProcs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (PLXPCListenerOperatorComposition)appResumePredictionsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAppResumePredictionsListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (PLXPCListenerOperatorComposition)appResumeInferredCarryListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAppResumeInferredCarryListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (PLXPCListenerOperatorComposition)appNotFrozenListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAppNotFrozenListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (PLXPCResponderOperatorComposition)memoryKillsResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 184, 1);
}

- (void)setMemoryKillsResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (PLXPCResponderOperatorComposition)hudKillsResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 192, 1);
}

- (void)setHudKillsResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (PLThreadStats)threadStats
{
  return (PLThreadStats *)objc_getProperty(self, a2, 200, 1);
}

- (void)setThreadStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadStats, 0);
  objc_storeStrong((id *)&self->_hudKillsResponder, 0);
  objc_storeStrong((id *)&self->_memoryKillsResponder, 0);
  objc_storeStrong((id *)&self->_appNotFrozenListener, 0);
  objc_storeStrong((id *)&self->_appResumeInferredCarryListener, 0);
  objc_storeStrong((id *)&self->_appResumePredictionsListener, 0);
  objc_storeStrong((id *)&self->_diffFreezerProcs, 0);
  objc_storeStrong((id *)&self->_lastFreezerProcs, 0);
  objc_storeStrong((id *)&self->_lastEntryDate, 0);
  objc_storeStrong((id *)&self->_lastThreadIdToKTMonitorEntryDict, 0);
  objc_storeStrong((id *)&self->_lastCPUTimeDict, 0);
  objc_storeStrong((id *)&self->_processes, 0);
  objc_storeStrong((id *)&self->_asertionNotifications, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
  objc_storeStrong((id *)&self->_logTimer, 0);
  objc_storeStrong((id *)&self->_previousCacheDate, 0);
  objc_storeStrong((id *)&self->_currentCachedDate, 0);
}

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, v0, v1, "ProcDirtyStats: BatteryLevelChanged -> should log to CoreAnalytics?", v2);
  OUTLINED_FUNCTION_6();
}

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_327_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Got callback for PLProcessMonitorAgent_EventPoint_AppResumePredictions: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_334_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Got callback for PLProcessMonitorAgent_EventPoint_AppNotFrozen: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_338_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Got callback for PLProcessMonitorAgent_EventForward_AppResumeInferredCarry: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_347_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "MemoryKills query did not succeed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __49__PLProcessMonitorAgent_initOperatorDependancies__block_invoke_358_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "HUD Terminations query did not succeed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __99__PLProcessMonitorAgent_logEventPointProcessExit_excludeProcesses_withStats_withDate_withNowInSec___block_invoke_2_cold_1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, a3, (uint64_t)a3, "ProcessRelaunchTime: processName %@'s statistics: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)getProcessExits:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "Nil payload sent to query", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)getJetsamSnapshotEntries:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "getJSEIdleTime: memoryJetsamEntries %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)fetchSnapshotWithFlags:(NSObject *)a1 .cold.1(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  uint8_t v4[24];

  v2 = OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_14_2(v2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13_0(&dword_1DA9D6000, a1, v3, "memorystatus_control(MEMORYSTATUS_CMD_GET_JETSAM_SNAPSHOT) failed: %s", v4);
  OUTLINED_FUNCTION_8_0();
}

- (void)fetchSnapshotWithFlags:(NSObject *)a1 .cold.2(NSObject *a1)
{
  int *v2;
  uint64_t v3;
  uint8_t v4[24];

  v2 = OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_14_2(v2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13_0(&dword_1DA9D6000, a1, v3, "kernel returned (0) from memorystatus_control(MEMORYSTATUS_CMD_GET_JETSAM_SNAPSHOT) -- no jetsam data available %s", v4);
  OUTLINED_FUNCTION_8_0();
}

- (void)fetchSnapshotWithFlags:(int)a1 .cold.3(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_ERROR, "unable to allocate %d bytes for jetsam snapshot", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_6();
}

- (void)fetchSnapshotWithFlags:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  int *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_14_2(v3);
  OUTLINED_FUNCTION_13_4();
  OUTLINED_FUNCTION_8_2(&dword_1DA9D6000, a2, v4, "memorystatus_control returned unexpected value - %d: %s", v5);
  OUTLINED_FUNCTION_8_0();
}

- (void)fetchSnapshotWithFlags:.cold.5()
{
  os_log_t v0;
  uint8_t v1[12];
  __int16 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v2 = 2048;
  v3 = 280;
  _os_log_error_impl(&dword_1DA9D6000, v0, OS_LOG_TYPE_ERROR, "memorystatus_control gave snapshot size (%lu) not multiple of jetsam entry type (%lu)", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __42__PLProcessMonitorAgent_logProcDirtyStats__block_invoke_cold_1(int *a1, uint64_t a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v3;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1DA9D6000, log, OS_LOG_TYPE_DEBUG, "ProcDirtyStats: pid %d's statistics: %@", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)logEventBackwardAppLaunchTimeSeries:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, v0, v1, "Empty App Launch Payload", v2);
  OUTLINED_FUNCTION_6();
}

- (void)logEventBackwardAppLaunchTimeSeries:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Got payload for App Launch Signposts : %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
