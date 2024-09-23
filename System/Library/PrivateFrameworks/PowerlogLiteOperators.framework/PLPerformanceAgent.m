@implementation PLPerformanceAgent

+ (BOOL)shouldCreateJetsamPriorityTable
{
  if (qword_1ED882470 != -1)
    dispatch_once(&qword_1ED882470, &__block_literal_global_7);
  return _MergedGlobals_1_6;
}

uint64_t __53__PLPerformanceAgent_shouldCreateJetsamPriorityTable__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D80020], "isiOS");
  _MergedGlobals_1_6 = result;
  return result;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLPerformanceAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("SystemMemory");
  +[PLPerformanceAgent entryEventPointDefinitionSystemMemory](PLPerformanceAgent, "entryEventPointDefinitionSystemMemory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v10[1] = CFSTR("DiskUsage");
  +[PLPerformanceAgent entryEventPointDefinitionDiskUsage](PLPerformanceAgent, "entryEventPointDefinitionDiskUsage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  v10[2] = CFSTR("DiskFragmentation");
  +[PLPerformanceAgent entryEventPointDefinitionDiskFragmentation](PLPerformanceAgent, "entryEventPointDefinitionDiskFragmentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  v10[3] = CFSTR("JetsamPriority");
  +[PLPerformanceAgent entryEventPointDefinitionJetsamPriority](PLPerformanceAgent, "entryEventPointDefinitionJetsamPriority");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  v10[4] = CFSTR("APFSFragmentation");
  +[PLPerformanceAgent entryEventPointDefinitionAPFSFragmentation](PLPerformanceAgent, "entryEventPointDefinitionAPFSFragmentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v6;
  v10[5] = CFSTR("Rollout");
  +[PLPerformanceAgent entryEventPointDefinitionRollout](PLPerformanceAgent, "entryEventPointDefinitionRollout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventPointDefinitionSystemMemory
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
  _QWORD v57[25];
  _QWORD v58[25];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[4];

  v62[2] = *MEMORY[0x1E0C80C00];
  v61[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v59[0] = *MEMORY[0x1E0D80318];
  v59[1] = v2;
  v60[0] = &unk_1E86528E0;
  v60[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v56;
  v61[1] = *MEMORY[0x1E0D802F0];
  v57[0] = CFSTR("FreeCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "commonTypeDict_IntegerFormat");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v54;
  v57[1] = CFSTR("WiredCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v52;
  v57[2] = CFSTR("CompressorPageCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v50;
  v57[3] = CFSTR("PurgeableCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "commonTypeDict_IntegerFormat");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v48;
  v57[4] = CFSTR("Purges");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v58[4] = v46;
  v57[5] = CFSTR("Faults");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v58[5] = v44;
  v57[6] = CFSTR("ZeroFills");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v58[6] = v42;
  v57[7] = CFSTR("Reactivations");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v58[7] = v40;
  v57[8] = CFSTR("PageIns");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v58[8] = v38;
  v57[9] = CFSTR("PageOuts");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v58[9] = v36;
  v57[10] = CFSTR("Decompressions");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v58[10] = v34;
  v57[11] = CFSTR("Compressions");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v58[11] = v32;
  v57[12] = CFSTR("SwapIns");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v58[12] = v30;
  v57[13] = CFSTR("SwapOuts");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v58[13] = v28;
  v57[14] = CFSTR("CompressedPageCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v58[14] = v26;
  v57[15] = CFSTR("InternalPageCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v58[15] = v24;
  v57[16] = CFSTR("ExternalPageCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v58[16] = v22;
  v57[17] = CFSTR("SwapAvailSize");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v58[17] = v20;
  v57[18] = CFSTR("SwapUsedSize");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v58[18] = v18;
  v57[19] = CFSTR("MemoryPressureLevel");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v58[19] = v16;
  v57[20] = CFSTR("FreeVnodeCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v58[20] = v14;
  v57[21] = CFSTR("SharedCacheVirtualSize");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v58[21] = v4;
  v57[22] = CFSTR("SharedCacheResidentSize");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v58[22] = v6;
  v57[23] = CFSTR("SharedCacheResidencyPercent");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v58[23] = v8;
  v57[24] = CFSTR("PagesGrabbed");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v58[24] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionDiskUsage
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
  v13 = &unk_1E86528F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("FreeSize");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("SystemSize");
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

+ (id)entryEventPointDefinitionDiskFragmentation
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
  v11 = &unk_1E86528F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("INDPoolFull");
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

+ (id)entryEventPointDefinitionAPFSFragmentation
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
  v15 = &unk_1E86528F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E0D802F0];
  v12[0] = CFSTR("container");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("fragmentedExtent");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("fileCount");
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

+ (id)entryEventPointDefinitionJetsamPriority
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
  _QWORD v32[13];
  _QWORD v33[13];
  uint64_t v34;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  if (!+[PLPerformanceAgent shouldCreateJetsamPriorityTable](PLPerformanceAgent, "shouldCreateJetsamPriorityTable"))return MEMORY[0x1E0C9AA70];
  v36[0] = *MEMORY[0x1E0D80298];
  v34 = *MEMORY[0x1E0D80318];
  v35 = &unk_1E8652900;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v31;
  v36[1] = *MEMORY[0x1E0D802F0];
  v32[0] = CFSTR("pid");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v29;
  v32[1] = CFSTR("name");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonTypeDict_StringFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v27;
  v32[2] = CFSTR("priority");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v25;
  v32[3] = CFSTR("footprint");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v23;
  v32[4] = CFSTR("peakFootprint");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v21;
  v32[5] = CFSTR("activeLimit");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[5] = v19;
  v32[6] = CFSTR("activeLimitIsHard");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_BoolFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v33[6] = v17;
  v32[7] = CFSTR("inactiveLimit");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33[7] = v15;
  v32[8] = CFSTR("inactiveLimitIsHard");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_BoolFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[8] = v13;
  v32[9] = CFSTR("frozen");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_BoolFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v33[9] = v3;
  v32[10] = CFSTR("pressuredExit");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33[10] = v5;
  v32[11] = CFSTR("fds");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33[11] = v7;
  v32[12] = CFSTR("machPorts");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[12] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitionRollout
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
  v13 = &unk_1E86528F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("rolloutID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("deploymentID");
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

+ (id)entryEventIntervalDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("Experiment");
  +[PLPerformanceAgent entryEventIntervalDefinitionExperiment](PLPerformanceAgent, "entryEventIntervalDefinitionExperiment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventIntervalDefinitionExperiment
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
  v21 = &unk_1E8652910;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E0D802F0];
  v18[0] = CFSTR("namespace");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_StringFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v18[1] = CFSTR("experimentID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_StringFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v13;
  v18[2] = CFSTR("treatmentID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_StringFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v3;
  v18[3] = CFSTR("deploymentID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v5;
  v18[4] = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_DateFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v7;
  v18[5] = CFSTR("EndDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_DateFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (PLPerformanceAgent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLPerformanceAgent;
  return -[PLAgent init](&v3, sel_init);
}

- (void)initOperatorDependancies
{
  uint64_t v3;
  PLEntryNotificationOperatorComposition *v4;
  PLEntryNotificationOperatorComposition *batteryLevelChanged;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int randomSample;
  _QWORD v12[5];
  _QWORD v13[5];
  uint8_t buf[4];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __46__PLPerformanceAgent_initOperatorDependancies__block_invoke;
  v13[3] = &unk_1E8577F48;
  v13[4] = self;
  objc_msgSend(MEMORY[0x1E0D7FFC8], "significantBatteryChangeNotificationWithOperator:withBlock:", self, v13);
  v4 = (PLEntryNotificationOperatorComposition *)objc_claimAutoreleasedReturnValue();
  batteryLevelChanged = self->_batteryLevelChanged;
  self->_batteryLevelChanged = v4;

  v6 = objc_alloc(MEMORY[0x1E0D80010]);
  objc_msgSend(MEMORY[0x1E0D80078], "workQueueForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C99690];
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __46__PLPerformanceAgent_initOperatorDependancies__block_invoke_2;
  v12[3] = &unk_1E8577F48;
  v12[4] = self;
  v9 = (void *)objc_msgSend(v6, "initWithWorkQueue:forNotification:withBlock:", v7, v8, v12);

  -[PLPerformanceAgent setDailyTaskNotification:](self, "setDailyTaskNotification:", v9);
  -[PLPerformanceAgent logEventIntervalExperiment](self, "logEventIntervalExperiment");
  -[PLPerformanceAgent logEventPointRollout](self, "logEventPointRollout");
  self->_randomSample = arc4random_uniform(0x30u);
  self->_sampleCounter = 0;
  PLLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    randomSample = self->_randomSample;
    *(_DWORD *)buf = 67109120;
    v15 = randomSample;
    _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "Picked random sample value as %d for sending stats to CA", buf, 8u);
  }

}

uint64_t __46__PLPerformanceAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "logEventPointSystemMemory");
  objc_msgSend(*(id *)(a1 + 32), "logEventPointDiskUsage");
  return objc_msgSend(*(id *)(a1 + 32), "logEventPointJetsamPrority");
}

void __46__PLPerformanceAgent_initOperatorDependancies__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  __CFString *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD block[4];
  const __CFString *v27;
  uint64_t v28;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v11 = MEMORY[0x1E0C809B0];
  if (v10)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__PLPerformanceAgent_initOperatorDependancies__block_invoke_3;
    block[3] = &unk_1E8578738;
    v27 = CFSTR("DailyTasks");
    v28 = objc_opt_class();
    if (qword_1ED882478 == -1)
    {
      v12 = CFSTR("DailyTasks");
    }
    else
    {
      dispatch_once(&qword_1ED882478, block);
      v12 = (__CFString *)v27;
    }
    v13 = byte_1ED882459;

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DailyTasks notification!"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPerformanceAgent initOperatorDependancies]_block_invoke_2");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 396);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v14;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)location, 0xCu);
      }

    }
  }
  objc_initWeak(location, *(id *)(a1 + 32));
  v20 = objc_alloc(MEMORY[0x1E0D80070]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 30.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __46__PLPerformanceAgent_initOperatorDependancies__block_invoke_145;
  v24[3] = &unk_1E8578C50;
  objc_copyWeak(&v25, location);
  v23 = (void *)objc_msgSend(v20, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v21, 0, 0, v22, v24, 0.0, 0.0);

  objc_msgSend(v23, "arm");
  objc_destroyWeak(&v25);
  objc_destroyWeak(location);

}

uint64_t __46__PLPerformanceAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  byte_1ED882459 = result;
  return result;
}

void __46__PLPerformanceAgent_initOperatorDependancies__block_invoke_145(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "logEventPointDiskFragmentation");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "logEventPointAPFSFragmentation");

}

- (void)logEventIntervalExperiment
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "internalBuild") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D7FFA0], "liteMode") & 1) == 0)
  {
    v3 = (void *)objc_opt_new();
    +[PLOperator entryKeyForType:andName:](PLPerformanceAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("Experiment"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC0988], "defaultProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __48__PLPerformanceAgent_logEventIntervalExperiment__block_invoke;
    v13 = &unk_1E8578C78;
    v6 = v4;
    v14 = v6;
    v7 = v3;
    v15 = v7;
    objc_msgSend(v5, "enumerateSampledActiveExperimentsForEnvironment:correlationID:error:block:", 0, CFSTR("com.apple.powerlog"), &v16, &v10);
    v8 = v16;
    if (objc_msgSend(v7, "count", v10, v11, v12, v13))
    {
      v17 = v6;
      v18[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v9, v6);

    }
  }
}

void __48__PLPerformanceAgent_logEventIntervalExperiment__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v4, "namespaces", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10), "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

    v12 = (void *)objc_opt_new();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("namespace"));

    objc_msgSend(v4, "experimentId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("experimentID"));

    objc_msgSend(v4, "treatmentId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("treatmentID"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "deploymentId"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("deploymentID"));

    objc_msgSend(v4, "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("startDate"));

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("EndDate"));

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", *(_QWORD *)(a1 + 32), v12);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v19);

  }
}

- (id)descriptionForMemoryPressure:(int)a3
{
  if ((a3 - 1) > 3)
    return CFSTR("unknown");
  else
    return off_1E8578CC0[a3 - 1];
}

- (void)logSystemMemoryToCA:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  id v26;
  size_t v27;
  int v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v27 = 4;
  if (!sysctlbyname("vm.pagesize", &v28, &v27, 0, 0))
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WiredCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedLongLongValue");
    objc_msgSend(v5, "numberWithUnsignedLongLong:", (unint64_t)(v7 * v28) >> 10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("wired_down"));

    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ExternalPageCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedLongLongValue");
    objc_msgSend(v9, "numberWithUnsignedLongLong:", (unint64_t)(v11 * v28) >> 10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("file_backed"));

    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CompressorPageCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedLongLongValue");
    objc_msgSend(v13, "numberWithUnsignedLongLong:", (unint64_t)(v15 * v28) >> 10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("occupied_by_compressor"));

    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CompressedPageCount"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "unsignedLongLongValue");
    objc_msgSend(v17, "numberWithUnsignedLongLong:", (unint64_t)(v19 * v28) >> 10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("stored_in_compressor"));

    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FreeCount"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "unsignedLongLongValue");
    objc_msgSend(v21, "numberWithUnsignedLongLong:", (unint64_t)(v23 * v28) >> 10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("free"));

    PLLogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v4;
      _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "Log System Memory Stats to CA %@", buf, 0xCu);
    }

    v26 = v4;
    AnalyticsSendEventLazy();

  }
}

id __42__PLPerformanceAgent_logSystemMemoryToCA___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logSharedCacheStatisticsToCA:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SharedCacheVirtualSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("virtual_shared_cache"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SharedCacheResidentSize"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("resident_shared_cache"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SharedCacheResidencyPercent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("shared_cache_resident_percent"));
  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "Log Shared Cache Stats to CA %@", buf, 0xCu);
  }

  v11 = v5;
  v10 = v5;
  AnalyticsSendEventLazy();

}

id __51__PLPerformanceAgent_logSharedCacheStatisticsToCA___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logEventPointSystemMemory
{
  host_t v3;
  kern_return_t v4;
  ipc_space_t *v5;
  id v6;
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
  NSObject *v29;
  void *v30;
  vm_map_read_t v31;
  uint64_t shared_cache;
  uint64_t v33;
  uint64_t v34;
  mach_vm_address_t v35;
  uint64_t v36;
  BOOL v37;
  mach_vm_address_t v38;
  NSObject *v40;
  NSObject *v41;
  unint64_t v42;
  unint64_t v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  NSObject *v51;
  void *v52;
  int sampleCounter;
  char *v54;
  char *v55;
  char *v56;
  host_t v57;
  unint64_t v58;
  unsigned int v59;
  size_t v60;
  unsigned int v61;
  size_t v62;
  __int128 v63;
  __int128 v64;
  mach_msg_type_number_t host_info64_outCnt;
  integer_t host_info64_out[4];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  natural_t nesting_depth;
  mach_vm_address_t address;
  mach_msg_type_number_t infoCnt;
  mach_vm_size_t size;
  mach_error_t v80;
  uint64_t v81;
  _BYTE v82[12];
  __int16 v83;
  uint64_t v84;
  __int128 buf;
  __int128 v86;
  __int128 v87;
  _BYTE v88[28];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1D179C10C](self, a2);
  v75 = 0;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v70 = 0u;
  v68 = 0u;
  v69 = 0u;
  *(_OWORD *)host_info64_out = 0u;
  v67 = 0u;
  host_info64_outCnt = 38;
  v4 = host_statistics64(v3, 4, host_info64_out, &host_info64_outCnt);
  v5 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  if (v4)
    goto LABEL_52;
  v6 = objc_alloc(MEMORY[0x1E0D7FFB0]);
  +[PLOperator entryKeyForType:andName:](PLPerformanceAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("SystemMemory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithEntryKey:", v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (host_info64_out[0] - HIDWORD(v71)));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("FreeCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", host_info64_out[3]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("WiredCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v67);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("ZeroFills"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v67 + 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("Reactivations"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v68);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("PageIns"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v68 + 1));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("PageOuts"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v69);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("Faults"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v71);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("Purges"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD2(v71));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("PurgeableCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v72);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("Decompressions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v72 + 1));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("Compressions"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v73);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, CFSTR("SwapIns"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v73 + 1));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, CFSTR("SwapOuts"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v74);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("CompressorPageCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD2(v74));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, CFSTR("ExternalPageCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v74));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v24, CFSTR("InternalPageCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v75);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, CFSTR("CompressedPageCount"));

  v81 = 0x500000002;
  v63 = 0u;
  v64 = 0u;
  v62 = 32;
  if (!sysctl((int *)&v81, 2u, &v63, &v62, 0, 0))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v63 + 1));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, CFSTR("SwapAvailSize"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v64);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, CFSTR("SwapUsedSize"));

  }
  v61 = 1;
  v60 = 4;
  if (!sysctlbyname("kern.memorystatus_vm_pressure_level", &v61, &v60, 0, 0))
  {
    -[PLPerformanceAgent descriptionForMemoryPressure:](self, "descriptionForMemoryPressure:", v61);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v28, CFSTR("MemoryPressureLevel"));

  }
  v59 = 0;
  v60 = 4;
  if (sysctlbyname("kern.free_vnodes", &v59, &v60, 0, 0))
  {
    PLLogCommon();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_ERROR, "Error getting free vnode count from sysctl", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v59);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v30, CFSTR("FreeVnodeCount"));

    PLLogCommon();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v59;
      _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "Freevnode count %d", (uint8_t *)&buf, 8u);
    }
  }

  v31 = *v5;
  v80 = 0;
  if (dyld_process_create_for_task())
  {
    if (dyld_process_snapshot_create_for_process())
    {
      shared_cache = dyld_process_snapshot_get_shared_cache();
      if (!shared_cache)
      {
        PLLogCommon();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_error_impl(&dword_1CAF47000, v44, OS_LOG_TYPE_ERROR, "failed to get shared cache", (uint8_t *)&buf, 2u);
        }

        dyld_process_dispose();
        dyld_process_snapshot_dispose();
        goto LABEL_44;
      }
      v33 = shared_cache;
      v57 = v3;
      v34 = MEMORY[0x1D179BFB0]();
      v35 = MEMORY[0x1D179BFA4](v33);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v34;
        _os_log_debug_impl(&dword_1CAF47000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "sharedRegionSize = %llu", (uint8_t *)&buf, 0xCu);
      }
      v36 = 0;
      size = 0;
      v87 = 0u;
      memset(v88, 0, sizeof(v88));
      buf = 0u;
      v86 = 0u;
      infoCnt = 19;
      address = v35;
      v58 = v34;
      v37 = __CFADD__(v35, v34);
      v38 = v35 + v34;
      if (!v37)
      {
        v36 = 0;
        while (1)
        {
          nesting_depth = 1;
          v80 = mach_vm_region_recurse(v31, &address, &size, &nesting_depth, (vm_region_recurse_info_t)&buf, &infoCnt);
          if (v80 == 1)
            break;
          if (HIBYTE(v87) <= 5u && ((1 << SHIBYTE(v87)) & 0x32) != 0)
            v36 += DWORD2(v86);
          address += size;
          if (address > v38)
            goto LABEL_40;
        }
        PLLogCommon();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          v56 = mach_error_string(v80);
          *(_DWORD *)v82 = 136315138;
          *(_QWORD *)&v82[4] = v56;
          _os_log_error_impl(&dword_1CAF47000, v45, OS_LOG_TYPE_ERROR, "reached last region:%s", v82, 0xCu);
        }

      }
LABEL_40:
      v42 = *MEMORY[0x1E0C85AA8] * v36;
      PLLogCommon();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v82 = 134218240;
        *(_QWORD *)&v82[4] = v42;
        v83 = 2048;
        v84 = v34;
        _os_log_debug_impl(&dword_1CAF47000, v46, OS_LOG_TYPE_DEBUG, "sharedCacheResidentSize = %llu sharedCacheVirtualSize = %llu", v82, 0x16u);
      }

      dyld_process_dispose();
      dyld_process_snapshot_dispose();
      v3 = v57;
      v5 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
      v43 = v58;
      if (v80)
        goto LABEL_44;
      goto LABEL_43;
    }
    PLLogCommon();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v55 = mach_error_string(v80);
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v55;
      _os_log_error_impl(&dword_1CAF47000, v41, OS_LOG_TYPE_ERROR, "failed to create snapshot of the process:%s", (uint8_t *)&buf, 0xCu);
    }

    dyld_process_dispose();
  }
  else
  {
    PLLogCommon();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v54 = mach_error_string(v80);
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v54;
      _os_log_error_impl(&dword_1CAF47000, v40, OS_LOG_TYPE_ERROR, "failed to create dyld process:%s", (uint8_t *)&buf, 0xCu);
    }

  }
  v42 = 0;
  v43 = 0;
  if (!v80)
  {
LABEL_43:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v43 >> 10);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v47, CFSTR("SharedCacheVirtualSize"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v42 >> 10);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v48, CFSTR("SharedCacheResidentSize"));

    v49 = (double)v42 * 100.0 / (double)v43;
    *(float *)&v49 = v49;
    *(float *)&v49 = roundf(*(float *)&v49);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v50, CFSTR("SharedCacheResidencyPercent"));

  }
LABEL_44:
  *(_QWORD *)v82 = 0;
  v60 = 8;
  if (sysctlbyname("vm.pages_grabbed", v82, &v60, 0, 0))
  {
    PLLogCommon();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1CAF47000, v51, OS_LOG_TYPE_ERROR, "Error getting pages grabbed from sysctl", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)v82);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v52, CFSTR("PagesGrabbed"));

    PLLogCommon();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = *(_QWORD *)v82;
      _os_log_debug_impl(&dword_1CAF47000, v51, OS_LOG_TYPE_DEBUG, "Pages Grabbed count %llu", (uint8_t *)&buf, 0xCu);
    }
  }

  -[PLOperator logEntry:](self, "logEntry:", v8);
  -[PLPerformanceAgent logSharedCacheStatisticsToCA:](self, "logSharedCacheStatisticsToCA:", v8);
  sampleCounter = self->_sampleCounter;
  if (sampleCounter == self->_randomSample)
  {
    -[PLPerformanceAgent logSystemMemoryToCA:](self, "logSystemMemoryToCA:", v8);
    sampleCounter = self->_sampleCounter;
  }
  self->_sampleCounter = sampleCounter + 1;

LABEL_52:
  mach_port_deallocate(*v5, v3);
}

- (void)logEventPointDiskUsage
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD block[5];
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "isTaskFullEPLMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v3, "attributesOfFileSystemForPath:error:", CFSTR("/"), &v22);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v22;
    if (v4)
    {
      v6 = objc_alloc(MEMORY[0x1E0D7FFB0]);
      +[PLOperator entryKeyForType:andName:](PLPerformanceAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("DiskUsage"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithEntryKey:", v7);

      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B00]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "unsignedIntegerValue") & 0xFFFFFFFFFFFFFC00);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("FreeSize"));

      v12 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B10]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "unsignedIntegerValue") & 0xFFFFFFFFFFFFFC00);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("SystemSize"));

      -[PLOperator logEntry:](self, "logEntry:", v8);
    }
    else
    {
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_12;
      v15 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __44__PLPerformanceAgent_logEventPointDiskUsage__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v15;
      if (qword_1ED882480 != -1)
        dispatch_once(&qword_1ED882480, block);
      if (!byte_1ED88245A)
        goto LABEL_12;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not get root dir attributes. Error: %@"), v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPerformanceAgent logEventPointDiskUsage]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v18, v19, 600);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
LABEL_12:

  }
}

uint64_t __44__PLPerformanceAgent_logEventPointDiskUsage__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88245A = result;
  return result;
}

- (void)logEventPointDiskFragmentation
{
  CFDictionaryRef IndirectionTableStatistics;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "isTaskFullEPLMode"))
  {
    IndirectionTableStatistics = ASP_GetIndirectionTableStatistics();
    if (IndirectionTableStatistics)
    {
      v12 = IndirectionTableStatistics;
      -[__CFDictionary objectForKeyedSubscript:](IndirectionTableStatistics, "objectForKeyedSubscript:", CFSTR("INDPool"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      IndirectionTableStatistics = v12;
      if (v4)
      {
        -[__CFDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("INDPool"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("INDPoolFull"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        IndirectionTableStatistics = v12;
        if (v6)
        {
          v7 = objc_alloc(MEMORY[0x1E0D7FFB0]);
          +[PLOperator entryKeyForType:andName:](PLPerformanceAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("DiskFragmentation"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)objc_msgSend(v7, "initWithEntryKey:", v8);

          -[__CFDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("INDPool"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("INDPoolFull"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("INDPoolFull"));

          -[PLOperator logEntry:](self, "logEntry:", v9);
          IndirectionTableStatistics = v12;
        }
      }
    }

  }
}

- (void)logEventPointJetsamPrority
{
  void *v2;
  unint64_t v3;
  int v4;
  void *v5;
  int v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  int *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  unint64_t v29;
  unsigned int *v30;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *context;
  _QWORD v65[5];
  _QWORD v66[5];
  _QWORD block[5];
  uint64_t v68;
  uint64_t v69;
  _QWORD v70[5];
  void *v71;
  void *v72;
  uint8_t buf[4];
  void *v74;
  rusage_info_t v75[2];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  int buffer;
  void *v105;
  char v106;
  uint64_t v107;

  v2 = (void *)MEMORY[0x1E0C80A78](self);
  v107 = *MEMORY[0x1E0C80C00];
  if (+[PLPerformanceAgent shouldCreateJetsamPriorityTable](PLPerformanceAgent, "shouldCreateJetsamPriorityTable"))
  {
    v3 = 0x1E0D7F000uLL;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "eplEnabled"))
    {
      v4 = memorystatus_control();
      if (v4 < 1)
      {
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v11 = objc_opt_class();
          v65[0] = MEMORY[0x1E0C809B0];
          v65[1] = 3221225472;
          v65[2] = __48__PLPerformanceAgent_logEventPointJetsamPrority__block_invoke_213;
          v65[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v65[4] = v11;
          if (qword_1ED8824A0 != -1)
            dispatch_once(&qword_1ED8824A0, v65);
          if (byte_1ED88245E)
          {
            v12 = (void *)MEMORY[0x1E0CB3940];
            v13 = __error();
            objc_msgSend(v12, "stringWithFormat:", CFSTR("Could not get jetsam priority list size: %s\n"), strerror(*v13));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "lastPathComponent");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPerformanceAgent logEventPointJetsamPrority]");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 692);

            PLLogCommon();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              buffer = 138412290;
              v105 = v14;
              _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buffer, 0xCu);
            }

          }
        }
      }
      else
      {
        v5 = malloc_type_malloc(v4, 0x8491EBAEuLL);
        v6 = memorystatus_control();
        if (v6 > 0)
        {
          v7 = v6;
          v60 = v5;
          v8 = (void *)objc_opt_new();
          +[PLOperator entryKeyForType:andName:](PLPerformanceAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("JetsamPriority"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          if (v7 < 0x18)
          {
LABEL_6:
            v71 = v9;
            v72 = v8;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "logEntries:withGroupID:", v10, v9);

            free(v60);
            return;
          }
          v29 = v7 / 0x18uLL;
          v30 = (unsigned int *)v60;
          v61 = v9;
          v62 = v8;
          while (1)
          {
            context = (void *)MEMORY[0x1D179C2E0]();
            v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v9, v63);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v32, CFSTR("pid"));

            bzero(&buffer, 0x1000uLL);
            proc_pidpath(*v30, &buffer, 0x1000u);
            v106 = 0;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", basename((char *)&buffer));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v33, CFSTR("name"));

            v68 = 0;
            v69 = 0;
            if (memorystatus_control() && objc_msgSend(*(id *)(v3 + 4000), "debugEnabled"))
            {
              v34 = objc_opt_class();
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __48__PLPerformanceAgent_logEventPointJetsamPrority__block_invoke_203;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              block[4] = v34;
              if (qword_1ED882490 != -1)
                dispatch_once(&qword_1ED882490, block);
              if (byte_1ED88245C)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Warning: Failed to get memory limit info for pid %d.  Limits will appear as 0MB and not fatal.\n"), *v30);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "lastPathComponent");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPerformanceAgent logEventPointJetsamPrority]");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 658);

                PLLogCommon();
                v40 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                {
                  LODWORD(v75[0]) = 138412290;
                  *(rusage_info_t *)((char *)v75 + 4) = v35;
                  _os_log_debug_impl(&dword_1CAF47000, v40, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)v75, 0xCu);
                }

                v3 = 0x1E0D7F000uLL;
                v9 = v61;
                v8 = v62;
              }
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v68);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v41, CFSTR("activeLimit"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v69);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v42, CFSTR("inactiveLimit"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BYTE4(v68) & 1);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v43, CFSTR("activeLimitIsHard"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", BYTE4(v69) & 1);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v44, CFSTR("inactiveLimitIsHard"));

            v102 = 0u;
            v103 = 0u;
            v100 = 0u;
            v101 = 0u;
            v98 = 0u;
            v99 = 0u;
            v96 = 0u;
            v97 = 0u;
            v94 = 0u;
            v95 = 0u;
            v92 = 0u;
            v93 = 0u;
            v90 = 0u;
            v91 = 0u;
            v88 = 0u;
            v89 = 0u;
            v86 = 0u;
            v87 = 0u;
            v84 = 0u;
            v85 = 0u;
            v82 = 0u;
            v83 = 0u;
            v80 = 0u;
            v81 = 0u;
            v78 = 0u;
            v79 = 0u;
            v76 = 0u;
            v77 = 0u;
            *(_OWORD *)v75 = 0u;
            if (proc_pid_rusage(*v30, 6, v75))
            {
              if (!objc_msgSend(*(id *)(v3 + 4000), "debugEnabled"))
                goto LABEL_42;
              v45 = objc_opt_class();
              v66[0] = MEMORY[0x1E0C809B0];
              v66[1] = 3221225472;
              v66[2] = __48__PLPerformanceAgent_logEventPointJetsamPrority__block_invoke_208;
              v66[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v66[4] = v45;
              if (qword_1ED882498 != -1)
                dispatch_once(&qword_1ED882498, v66);
              if (!byte_1ED88245D)
                goto LABEL_42;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Warning: Could not get rusage for pid %d.\n"), *v30);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "lastPathComponent");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPerformanceAgent logEventPointJetsamPrority]");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "logMessage:fromFile:fromFunction:fromLineNumber:", v46, v49, v50, 668);

              PLLogCommon();
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v74 = v46;
                _os_log_debug_impl(&dword_1CAF47000, v51, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v3 = 0x1E0D7F000;
              v9 = v61;
              v8 = v62;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v90);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setObject:forKeyedSubscript:", v52, CFSTR("peakFootprint"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v79 + 1));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setObject:forKeyedSubscript:", v46, CFSTR("footprint"));
            }

LABEL_42:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v30[1]);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v53, CFSTR("priority"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v30[5] & 0x10);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v54, CFSTR("pressuredExit"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v30[5] & 2);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setObject:forKeyedSubscript:", v55, CFSTR("frozen"));

            v56 = objc_msgSend(v2, "countFD:", *v30);
            if ((_DWORD)v56 != -1)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v56);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setObject:forKeyedSubscript:", v57, CFSTR("fds"));

            }
            v58 = objc_msgSend(v2, "countMachPort:", *v30);
            if ((_DWORD)v58 != -1)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v58);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setObject:forKeyedSubscript:", v59, CFSTR("machPorts"));

            }
            objc_msgSend(v8, "addObject:", v31);

            objc_autoreleasePoolPop(context);
            v30 += 6;
            if (!--v29)
              goto LABEL_6;
          }
        }
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v20 = objc_opt_class();
          v70[0] = MEMORY[0x1E0C809B0];
          v70[1] = 3221225472;
          v70[2] = __48__PLPerformanceAgent_logEventPointJetsamPrority__block_invoke;
          v70[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v70[4] = v20;
          if (qword_1ED882488 != -1)
            dispatch_once(&qword_1ED882488, v70);
          if (byte_1ED88245B)
          {
            v21 = (void *)MEMORY[0x1E0CB3940];
            v22 = __error();
            objc_msgSend(v21, "stringWithFormat:", CFSTR("Error: Could not get jetsam priority list: %s\n"), strerror(*v22));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "lastPathComponent");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPerformanceAgent logEventPointJetsamPrority]");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 635);

            PLLogCommon();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              buffer = 138412290;
              v105 = v23;
              _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buffer, 0xCu);
            }

          }
        }
        free(v5);
      }
    }
  }
}

uint64_t __48__PLPerformanceAgent_logEventPointJetsamPrority__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88245B = result;
  return result;
}

uint64_t __48__PLPerformanceAgent_logEventPointJetsamPrority__block_invoke_203(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88245C = result;
  return result;
}

uint64_t __48__PLPerformanceAgent_logEventPointJetsamPrority__block_invoke_208(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88245D = result;
  return result;
}

uint64_t __48__PLPerformanceAgent_logEventPointJetsamPrority__block_invoke_213(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88245E = result;
  return result;
}

- (int)countFD:(int)a3
{
  int v4;
  int v5;
  char *v6;
  char *v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  _OWORD v14[11];

  v4 = proc_pidinfo(a3, 1, 0, 0, 0);
  if (v4 < 1)
    return -1;
  v5 = v4;
  v6 = (char *)malloc_type_malloc(v4, 0xF72BEF86uLL);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = proc_pidinfo(a3, 1, 0, v6, v5);
  if (v8 >= 8)
  {
    v9 = 0;
    v10 = 0;
    v11 = v8 & 0xFFFFFFF8;
    while (1)
    {
      if (*(_DWORD *)&v7[v9 + 4] == 1)
      {
        memset(v14, 0, sizeof(v14));
        v12 = proc_pidfdinfo(a3, *(_DWORD *)&v7[v9], 1, v14, 176);
        if (v12 <= 0)
        {
          if (*__error() != 2)
          {
LABEL_15:
            free(v7);
            return -1;
          }
        }
        else
        {
          if (v12 < 0xB0)
            goto LABEL_15;
          ++v10;
        }
      }
      v9 += 8;
      if (v11 == v9)
        goto LABEL_14;
    }
  }
  v10 = 0;
LABEL_14:
  free(v7);
  return v10;
}

- (int)countMachPort:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD block[5];
  uint64_t buffer;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v3 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x1E0C80C00];
  buffer = 0;
  v4 = proc_pidinfo(a3, 32, 0, &buffer, 8);
  if ((_DWORD)v4 != 8)
  {
    v13 = v4;
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      return -1;
    v14 = objc_opt_class();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __36__PLPerformanceAgent_countMachPort___block_invoke_220;
    v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v20[4] = v14;
    if (qword_1ED8824B0 != -1)
      dispatch_once(&qword_1ED8824B0, v20);
    if (!byte_1ED882460)
      return -1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to get mach port count for pid(%d) with error=%d\n"), v3, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPerformanceAgent countMachPort:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v17, v18, 753);

    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v7;
      _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    v5 = -1;
    goto LABEL_15;
  }
  v5 = buffer - HIDWORD(buffer);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__PLPerformanceAgent_countMachPort___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1ED8824A8 != -1)
      dispatch_once(&qword_1ED8824A8, block);
    if (byte_1ED88245F)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mach port for pid(%d): table_size = %u, table_free = %u\n"), v3, buffer, HIDWORD(buffer));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPerformanceAgent countMachPort:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 750);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
LABEL_15:

    }
  }
  return v5;
}

uint64_t __36__PLPerformanceAgent_countMachPort___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88245F = result;
  return result;
}

uint64_t __36__PLPerformanceAgent_countMachPort___block_invoke_220(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882460 = result;
  return result;
}

- (void)logEventPointAPFSFragmentation
{
  NSObject *v3;
  _QWORD block[5];

  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) == 0)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "isTaskFullEPLMode"))
    {
      -[PLOperator workQueue](self, "workQueue");
      v3 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__PLPerformanceAgent_logEventPointAPFSFragmentation__block_invoke;
      block[3] = &unk_1E85780C8;
      block[4] = self;
      dispatch_async(v3, block);

    }
  }
}

void __52__PLPerformanceAgent_logEventPointAPFSFragmentation__block_invoke(uint64_t a1)
{
  mach_port_t v2;
  const __CFDictionary *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  io_object_t v11;
  const __CFAllocator *v12;
  io_registry_entry_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *Value;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD block[5];
  CFMutableDictionaryRef properties;
  io_registry_entry_t parent;
  _QWORD v39[5];
  io_iterator_t existing;
  _OWORD buffer[4];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  existing = 0;
  v2 = *MEMORY[0x1E0CBBAB8];
  v3 = IOServiceMatching("AppleAPFSContainer");
  if (IOServiceGetMatchingServices(v2, v3, &existing))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v4 = objc_opt_class();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __52__PLPerformanceAgent_logEventPointAPFSFragmentation__block_invoke_2;
      v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v39[4] = v4;
      if (qword_1ED8824B8 != -1)
        dispatch_once(&qword_1ED8824B8, v39);
      if (byte_1ED882461)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to scan IORegistry for APFS container object."));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPerformanceAgent logEventPointAPFSFragmentation]_block_invoke");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 766);

        PLLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buffer[0]) = 138412290;
          *(_QWORD *)((char *)buffer + 4) = v5;
LABEL_39:
          _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)buffer, 0xCu);
          goto LABEL_36;
        }
        goto LABEL_36;
      }
    }
    return;
  }
  v11 = IOIteratorNext(existing);
  if (v11)
  {
    v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v13 = v11;
    while (1)
    {
      parent = 0;
      properties = 0;
      if (IORegistryEntryGetParentEntry(v13, "IOService", &parent))
        break;
      if (!IORegistryEntryCreateCFProperties(parent, &properties, v12, 0))
      {
        Value = (const __CFString *)CFDictionaryGetValue(properties, CFSTR("BSD Name"));
        memset(buffer, 0, sizeof(buffer));
        if (Value && CFStringGetCString(Value, (char *)buffer, 64, 0x8000100u))
          objc_msgSend(*(id *)(a1 + 32), "logEventPointAPFSFragmentationWithContainer:", buffer);
        CFRelease(properties);
        IOObjectRelease(parent);
        IOObjectRelease(v13);
        goto LABEL_28;
      }
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v21 = objc_opt_class();
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __52__PLPerformanceAgent_logEventPointAPFSFragmentation__block_invoke_233;
        v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v35[4] = v21;
        if (qword_1ED8824C8 != -1)
          dispatch_once(&qword_1ED8824C8, v35);
        if (byte_1ED882463)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to fetch IORegistry properties for APFS container object."));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "lastPathComponent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPerformanceAgent logEventPointAPFSFragmentation]_block_invoke_2");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v24, v25, 781);

          PLLogCommon();
          v20 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
LABEL_23:

            goto LABEL_28;
          }
LABEL_30:
          LODWORD(buffer[0]) = 138412290;
          *(_QWORD *)((char *)buffer + 4) = v15;
          _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)buffer, 0xCu);
          goto LABEL_23;
        }
      }
LABEL_28:
      v13 = IOIteratorNext(existing);
      if (!v13)
      {
        IOObjectRelease(existing);
        return;
      }
    }
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_28;
    v14 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__PLPerformanceAgent_logEventPointAPFSFragmentation__block_invoke_229;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v14;
    if (qword_1ED8824C0 != -1)
      dispatch_once(&qword_1ED8824C0, block);
    if (!byte_1ED882462)
      goto LABEL_28;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to scan IORegistry for APFS container object."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPerformanceAgent logEventPointAPFSFragmentation]_block_invoke_2");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 777);

    PLLogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      goto LABEL_23;
    goto LABEL_30;
  }
  IOObjectRelease(existing);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled", v32, v33))
  {
    v27 = objc_opt_class();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __52__PLPerformanceAgent_logEventPointAPFSFragmentation__block_invoke_240;
    v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v34[4] = v27;
    if (qword_1ED8824D0 != -1)
      dispatch_once(&qword_1ED8824D0, v34);
    if (byte_1ED882464)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no APFS containers found."));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "lastPathComponent");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPerformanceAgent logEventPointAPFSFragmentation]_block_invoke_2");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v30, v31, 796);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buffer[0]) = 138412290;
        *(_QWORD *)((char *)buffer + 4) = v5;
        goto LABEL_39;
      }
LABEL_36:

    }
  }
}

uint64_t __52__PLPerformanceAgent_logEventPointAPFSFragmentation__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882461 = result;
  return result;
}

uint64_t __52__PLPerformanceAgent_logEventPointAPFSFragmentation__block_invoke_229(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882462 = result;
  return result;
}

uint64_t __52__PLPerformanceAgent_logEventPointAPFSFragmentation__block_invoke_233(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882463 = result;
  return result;
}

uint64_t __52__PLPerformanceAgent_logEventPointAPFSFragmentation__block_invoke_240(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882464 = result;
  return result;
}

- (void)logEventPointAPFSFragmentationWithContainer:(const char *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[5];
  int valuePtr;
  CFArrayRef theArray;
  _QWORD v24[5];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __66__PLPerformanceAgent_logEventPointAPFSFragmentationWithContainer___block_invoke;
    v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v24[4] = v4;
    if (qword_1ED8824D8 != -1)
      dispatch_once(&qword_1ED8824D8, v24);
    if (byte_1ED882465)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("logEventPointAPFSFragmentationWithContainer:%s\n"), a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPerformanceAgent logEventPointAPFSFragmentationWithContainer:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 805);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  theArray = 0;
  valuePtr = 0;
  APFSGetFragmentationHistogram();
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v11 = objc_opt_class();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __66__PLPerformanceAgent_logEventPointAPFSFragmentationWithContainer___block_invoke_247;
    v21[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v21[4] = v11;
    if (qword_1ED8824E0 != -1)
      dispatch_once(&qword_1ED8824E0, v21);
    if (byte_1ED882466)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to get fragmentation histogram for %s"), a3);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPerformanceAgent.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLPerformanceAgent logEventPointAPFSFragmentationWithContainer:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v13;
      v18 = (void *)v12;
      objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 811);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v18;
        v26 = v18;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      else
      {
        v20 = v18;
      }

    }
  }
}

uint64_t __66__PLPerformanceAgent_logEventPointAPFSFragmentationWithContainer___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882465 = result;
  return result;
}

uint64_t __66__PLPerformanceAgent_logEventPointAPFSFragmentationWithContainer___block_invoke_247(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882466 = result;
  return result;
}

uint64_t __66__PLPerformanceAgent_logEventPointAPFSFragmentationWithContainer___block_invoke_252(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882467 = result;
  return result;
}

uint64_t __66__PLPerformanceAgent_logEventPointAPFSFragmentationWithContainer___block_invoke_257(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882468 = result;
  return result;
}

- (void)logEventPointRollout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "internalBuild") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D7FFA0], "liteMode") & 1) == 0)
  {
    v3 = (void *)objc_opt_new();
    +[PLOperator entryKeyForType:andName:](PLPerformanceAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("Rollout"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC0988], "defaultProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __42__PLPerformanceAgent_logEventPointRollout__block_invoke;
    v12[3] = &unk_1E8578CA0;
    v7 = v4;
    v13 = v7;
    v8 = v6;
    v14 = v8;
    v9 = v3;
    v15 = v9;
    objc_msgSend(v5, "enumerateSampledActiveRolloutsForCorrelationID:error:block:", CFSTR("com.apple.powerlog"), &v16, v12);
    v10 = v16;
    if (objc_msgSend(v9, "count"))
    {
      v17 = v7;
      v18[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v11, v7);

    }
  }
}

void __42__PLPerformanceAgent_logEventPointRollout__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0D7FFB0];
  v4 = a2;
  v9 = (id)objc_msgSend([v3 alloc], "initWithEntryKey:withDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "rolloutId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("rolloutID"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(v4, "deploymentId");

  objc_msgSend(v6, "numberWithInt:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("deploymentID"));

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
}

- (void)log
{
  -[PLPerformanceAgent logEventPointSystemMemory](self, "logEventPointSystemMemory");
  -[PLPerformanceAgent logEventPointDiskUsage](self, "logEventPointDiskUsage");
  -[PLPerformanceAgent logEventPointJetsamPrority](self, "logEventPointJetsamPrority");
  -[PLPerformanceAgent logEventPointDiskFragmentation](self, "logEventPointDiskFragmentation");
  -[PLPerformanceAgent logEventPointAPFSFragmentation](self, "logEventPointAPFSFragmentation");
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLNSNotificationOperatorComposition)dailyTaskNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDailyTaskNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (int)randomSample
{
  return self->_randomSample;
}

- (void)setRandomSample:(int)a3
{
  self->_randomSample = a3;
}

- (int)sampleCounter
{
  return self->_sampleCounter;
}

- (void)setSampleCounter:(int)a3
{
  self->_sampleCounter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dailyTaskNotification, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
}

@end
