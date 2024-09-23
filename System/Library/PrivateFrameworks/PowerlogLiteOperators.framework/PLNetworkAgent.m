@implementation PLNetworkAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLNetworkAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)railDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)accountingGroupDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("IsExpensive");
  +[PLNetworkAgent entryEventForwardDefinitionNetworkIsExpensive](PLNetworkAgent, "entryEventForwardDefinitionNetworkIsExpensive");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventForwardDefinitionNetworkIsExpensive
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
  v2 = *MEMORY[0x1E0D802B8];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653470;
  v14[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("NetworkType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("IsExpensive");
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

+ (id)entryEventBackwardDefinitions
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
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v20 = CFSTR("CumulativeNetworkUsage");
  v18[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80288];
  v16[0] = *MEMORY[0x1E0D80318];
  v16[1] = v2;
  v17[0] = &unk_1E8653470;
  v17[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("Interface");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v14[1] = CFSTR("UpBytes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  v14[2] = CFSTR("DownBytes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventPointDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("Wake");
  objc_msgSend(a1, "entryEventPointDefinitionWake");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("UnattributedWake");
  v8[0] = v3;
  objc_msgSend(a1, "entryEventPointDefinitionUnattributedWake");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryEventPointDefinitionWake
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
  _QWORD v35[14];
  _QWORD v36[14];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[4];

  v40[2] = *MEMORY[0x1E0C80C00];
  v39[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v37[0] = *MEMORY[0x1E0D80318];
  v37[1] = v2;
  v38[0] = &unk_1E8653480;
  v38[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v34;
  v39[1] = *MEMORY[0x1E0D802F0];
  v35[0] = CFSTR("wakeUUID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_StringFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v32;
  v35[1] = CFSTR("Interface");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_StringFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v30;
  v35[2] = CFSTR("PID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v28;
  v35[3] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_StringFormat_withProcessName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v26;
  v35[4] = CFSTR("EffectivePID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v24;
  v35[5] = CFSTR("EffectiveProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_StringFormat_withProcessName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v22;
  v35[6] = CFSTR("packetDataLength");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v20;
  v35[7] = CFSTR("controlFlagType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[7] = v18;
  v35[8] = CFSTR("InterfaceType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[8] = v16;
  v35[9] = CFSTR("CompanionLink");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_BoolFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[9] = v14;
  v35[10] = CFSTR("sourcePort");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36[10] = v4;
  v35[11] = CFSTR("sourceAddress");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36[11] = v6;
  v35[12] = CFSTR("destinationPort");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36[12] = v8;
  v35[13] = CFSTR("destinationAddress");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[13] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionUnattributedWake
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
  _QWORD v26[10];
  _QWORD v27[10];
  uint64_t v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[4];

  v31[2] = *MEMORY[0x1E0C80C00];
  v30[0] = *MEMORY[0x1E0D80298];
  v28 = *MEMORY[0x1E0D80318];
  v29 = &unk_1E8653490;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v25;
  v30[1] = *MEMORY[0x1E0D802F0];
  v26[0] = CFSTR("wakeUUID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_StringFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v23;
  v26[1] = CFSTR("Interface");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_StringFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v21;
  v26[2] = CFSTR("sourcePort");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v19;
  v26[3] = CFSTR("sourceAddress");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_StringFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v17;
  v26[4] = CFSTR("destinationPort");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v15;
  v26[5] = CFSTR("destinationAddress");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_StringFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v13;
  v26[6] = CFSTR("packetDataLength");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v3;
  v26[7] = CFSTR("controlFlagType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v5;
  v26[8] = CFSTR("InterfaceType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v7;
  v26[9] = CFSTR("CompanionLink");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_BoolFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[9] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 10);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)initKernelEvent
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uintptr_t wakeSocket;
  NSObject *v34;
  dispatch_source_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint8_t *v43;
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD handler[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD block[5];
  int v50;
  _QWORD v51[5];
  uint8_t v52[4];
  void *v53;
  _BYTE buf[24];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  self->_wakeSocket = -1;
  v3 = socket(32, 3, 1);
  self->_wakeSocket = v3;
  if (v3 == -1)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v12 = objc_opt_class();
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __33__PLNetworkAgent_initKernelEvent__block_invoke;
      v51[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v51[4] = v12;
      if (qword_1ED884A00 != -1)
        dispatch_once(&qword_1ED884A00, v51);
      if (_MergedGlobals_1_46)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("socket(PF_SYSTEM, SOCK_RAW, SYSPROTO_EVENT) error"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLNetworkAgent.m");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNetworkAgent initKernelEvent]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 246);

        PLLogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v13;
          v43 = buf;
          goto LABEL_40;
        }
LABEL_14:

      }
    }
  }
  else
  {
    v50 = 1;
    if (ioctl(v3, 0x8004667EuLL, &v50))
    {
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_22;
      v4 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __33__PLNetworkAgent_initKernelEvent__block_invoke_60;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (qword_1ED884A08 != -1)
        dispatch_once(&qword_1ED884A08, block);
      if (!byte_1ED8849F1)
        goto LABEL_22;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ioctl(FIONBIO) error"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLNetworkAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNetworkAgent initKernelEvent]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 253);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
LABEL_21:

LABEL_22:
        close(self->_wakeSocket);
        return;
      }
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v5;
      v11 = buf;
LABEL_42:
      _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", v11, 0xCu);
      goto LABEL_21;
    }
    *(_QWORD *)buf = 0x100000001;
    *(_DWORD *)&buf[8] = 14;
    v19 = ioctl(self->_wakeSocket, 0x800C6502uLL, buf);
    v20 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
    if (v19)
    {
      if (!v20)
        goto LABEL_22;
      v21 = objc_opt_class();
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __33__PLNetworkAgent_initKernelEvent__block_invoke_65;
      v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v48[4] = v21;
      if (qword_1ED884A10 != -1)
        dispatch_once(&qword_1ED884A10, v48);
      if (!byte_1ED8849F2)
        goto LABEL_22;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ioctl(SIOCSKEVFILT) error"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLNetworkAgent.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNetworkAgent initKernelEvent]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v24, v25, 263);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        goto LABEL_21;
      *(_DWORD *)v52 = 138412290;
      v53 = v5;
      v11 = v52;
      goto LABEL_42;
    }
    if (v20)
    {
      v26 = objc_opt_class();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __33__PLNetworkAgent_initKernelEvent__block_invoke_70;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v26;
      if (qword_1ED884A18 != -1)
        dispatch_once(&qword_1ED884A18, v47);
      if (byte_1ED8849F3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("power wake socket number %d"), self->_wakeSocket);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLNetworkAgent.m");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "lastPathComponent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNetworkAgent initKernelEvent]");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 269);

        PLLogCommon();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v52 = 138412290;
          v53 = v27;
          _os_log_debug_impl(&dword_1CAF47000, v32, OS_LOG_TYPE_DEBUG, "%@", v52, 0xCu);
        }

      }
    }
    wakeSocket = self->_wakeSocket;
    -[PLOperator workQueue](self, "workQueue");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = dispatch_source_create(MEMORY[0x1E0C80DB8], wakeSocket, 0, v34);
    v36 = (void *)qword_1ED884A20;
    qword_1ED884A20 = (uint64_t)v35;

    if (qword_1ED884A20)
    {
      v37 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __33__PLNetworkAgent_initKernelEvent__block_invoke_73;
      handler[3] = &unk_1E85780C8;
      handler[4] = self;
      dispatch_source_set_cancel_handler((dispatch_source_t)qword_1ED884A20, handler);
      v45[0] = v37;
      v45[1] = 3221225472;
      v45[2] = __33__PLNetworkAgent_initKernelEvent__block_invoke_76;
      v45[3] = &unk_1E85780C8;
      v45[4] = self;
      dispatch_source_set_event_handler((dispatch_source_t)qword_1ED884A20, v45);
      dispatch_resume((dispatch_object_t)qword_1ED884A20);
      return;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v38 = objc_opt_class();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __33__PLNetworkAgent_initKernelEvent__block_invoke_2_79;
      v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v44[4] = v38;
      if (qword_1ED884A30 != -1)
        dispatch_once(&qword_1ED884A30, v44);
      if (byte_1ED8849F5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wakeSrc is invalid"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLNetworkAgent.m");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "lastPathComponent");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNetworkAgent initKernelEvent]");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v41, v42, 282);

        PLLogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v52 = 138412290;
          v53 = v13;
          v43 = v52;
LABEL_40:
          _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", v43, 0xCu);
          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
  }
}

uint64_t __33__PLNetworkAgent_initKernelEvent__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_46 = result;
  return result;
}

uint64_t __33__PLNetworkAgent_initKernelEvent__block_invoke_60(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8849F1 = result;
  return result;
}

uint64_t __33__PLNetworkAgent_initKernelEvent__block_invoke_65(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8849F2 = result;
  return result;
}

uint64_t __33__PLNetworkAgent_initKernelEvent__block_invoke_70(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8849F3 = result;
  return result;
}

uint64_t __33__PLNetworkAgent_initKernelEvent__block_invoke_73(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__PLNetworkAgent_initKernelEvent__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (qword_1ED884A28 != -1)
      dispatch_once(&qword_1ED884A28, block);
    if (byte_1ED8849F4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wake cancel event!!!!"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLNetworkAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNetworkAgent initKernelEvent]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 274);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v3;
        _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  return close(objc_msgSend(*(id *)(a1 + 32), "wakeSocket"));
}

uint64_t __33__PLNetworkAgent_initKernelEvent__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8849F4 = result;
  return result;
}

uint64_t __33__PLNetworkAgent_initKernelEvent__block_invoke_76(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logEventPointWake");
}

uint64_t __33__PLNetworkAgent_initKernelEvent__block_invoke_2_79(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8849F5 = result;
  return result;
}

- (PLNetworkAgent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLNetworkAgent;
  return -[PLAgent init](&v3, sel_init);
}

- (void)initOperatorDependancies
{
  _BOOL4 v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  dispatch_queue_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[2];
  _QWORD v26[2];
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v3 = -[PLOperator isDebugEnabled](self, "isDebugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v5 = objc_alloc(MEMORY[0x1E0D7FFC8]);
    v25[0] = &unk_1E8634200;
    v25[1] = &unk_1E8634218;
    v26[0] = &unk_1E8653470;
    v26[1] = &unk_1E8634230;
    v27 = CFSTR("Level");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v4;
    v24[1] = 3221225472;
    v24[2] = __42__PLNetworkAgent_initOperatorDependancies__block_invoke;
    v24[3] = &unk_1E8577F48;
    v24[4] = self;
    v8 = (void *)objc_msgSend(v5, "initWithOperator:forEntryKey:withFilter:withBlock:", self, CFSTR("PLBatteryAgent_EventBackward_Battery"), v7, v24);

  }
  else
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __42__PLNetworkAgent_initOperatorDependancies__block_invoke_2;
    v23[3] = &unk_1E8577F48;
    v23[4] = self;
    objc_msgSend(MEMORY[0x1E0D7FFC8], "significantBatteryChangeNotificationWithOperator:withBlock:", self, v23);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PLNetworkAgent setBatteryLevelChanged:](self, "setBatteryLevelChanged:", v8);
  objc_msgSend(MEMORY[0x1E0D80030], "sharedSemaphoreForKey:", *MEMORY[0x1E0D80218]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLNetworkAgent setCanSleepSemaphore:](self, "setCanSleepSemaphore:", v9);

  -[PLNetworkAgent canSleepSemaphore](self, "canSleepSemaphore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "signalInterestByObject:", self);

  v22[0] = v4;
  v22[1] = 3221225472;
  v22[2] = __42__PLNetworkAgent_initOperatorDependancies__block_invoke_3;
  v22[3] = &unk_1E8577F48;
  v22[4] = self;
  objc_msgSend(MEMORY[0x1E0D7FFC8], "canSleepEntryNotificationWithOperator:withBlock:", self, v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLNetworkAgent setCanSleep:](self, "setCanSleep:", v11);

  v12 = dispatch_queue_create("com.apple.powerlog.networkPathMonitor", 0);
  -[PLNetworkAgent setNwPathMonitorQueue:](self, "setNwPathMonitorQueue:", v12);

  -[PLNetworkAgent NWPathMonitorWithInterface:](self, "NWPathMonitorWithInterface:", 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLNetworkAgent setNwPathMonitorCellular:](self, "setNwPathMonitorCellular:", v13);

  -[PLNetworkAgent NWPathMonitorWithInterface:](self, "NWPathMonitorWithInterface:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLNetworkAgent setNwPathMonitorWiFi:](self, "setNwPathMonitorWiFi:", v14);

  -[PLNetworkAgent NWPathMonitorWithInterface:](self, "NWPathMonitorWithInterface:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLNetworkAgent setNwPathMonitorWired:](self, "setNwPathMonitorWired:", v15);

  -[PLNetworkAgent NWPathMonitorWithInterface:](self, "NWPathMonitorWithInterface:", 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLNetworkAgent setNwPathMonitorLoopback:](self, "setNwPathMonitorLoopback:", v16);

  -[PLNetworkAgent NWPathMonitorWithInterface:](self, "NWPathMonitorWithInterface:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLNetworkAgent setNwPathMonitorOther:](self, "setNwPathMonitorOther:", v17);

  -[PLNetworkAgent initKernelEvent](self, "initKernelEvent");
  v21[0] = v4;
  v21[1] = 3221225472;
  v21[2] = __42__PLNetworkAgent_initOperatorDependancies__block_invoke_115;
  v21[3] = &unk_1E8578610;
  v21[4] = self;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D098, v21);
  -[PLNetworkAgent setDownloadAutoAssetDownloadsListener:](self, "setDownloadAutoAssetDownloadsListener:", v18);
  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __42__PLNetworkAgent_initOperatorDependancies__block_invoke_124;
  v20[3] = &unk_1E8578610;
  v20[4] = self;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864D0C0, v20);
  -[PLNetworkAgent setDownloadV2AssetDownloadsListener:](self, "setDownloadV2AssetDownloadsListener:", v19);

}

uint64_t __42__PLNetworkAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "log");
}

uint64_t __42__PLNetworkAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "log");
}

void __42__PLNetworkAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v3 = MEMORY[0x1E0C809B0];
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__PLNetworkAgent_initOperatorDependancies__block_invoke_4;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED884A38 != -1)
      dispatch_once(&qword_1ED884A38, block);
    if (byte_1ED8849F6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep triggered"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLNetworkAgent.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNetworkAgent initOperatorDependancies]_block_invoke_3");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 313);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLProcessPortMap sharedInstance](PLProcessPortMap, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clearPortMap");

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v18[0] = v3;
    v18[1] = 3221225472;
    v18[2] = __42__PLNetworkAgent_initOperatorDependancies__block_invoke_101;
    v18[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v18[4] = objc_opt_class();
    if (qword_1ED884A40 != -1)
      dispatch_once(&qword_1ED884A40, v18);
    if (byte_1ED8849F7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ signaling done"), *(_QWORD *)(a1 + 32));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLNetworkAgent.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNetworkAgent initOperatorDependancies]_block_invoke_2");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 318);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v11;
        _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "canSleepSemaphore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "signalDoneByObject:", *(_QWORD *)(a1 + 32));

}

uint64_t __42__PLNetworkAgent_initOperatorDependancies__block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8849F6 = result;
  return result;
}

uint64_t __42__PLNetworkAgent_initOperatorDependancies__block_invoke_101(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8849F7 = result;
  return result;
}

void __42__PLNetworkAgent_initOperatorDependancies__block_invoke_115(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "DownloadMetrics AutoAssetDownloads payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logMobileAssetDownload:withCategory:", v6, CFSTR("AutoAssetDownloads"));
}

void __42__PLNetworkAgent_initOperatorDependancies__block_invoke_124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "DownloadMetrics v2AssetDownloads payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logMobileAssetDownload:withCategory:", v6, CFSTR("v2AssetDownloads"));
}

- (id)NWPathMonitorWithInterface:(int)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD update_handler[5];

  v4 = nw_path_monitor_create_with_type((nw_interface_type_t)a3);
  update_handler[0] = MEMORY[0x1E0C809B0];
  update_handler[1] = 3221225472;
  update_handler[2] = __45__PLNetworkAgent_NWPathMonitorWithInterface___block_invoke;
  update_handler[3] = &unk_1E857FA08;
  update_handler[4] = self;
  nw_path_monitor_set_update_handler(v4, update_handler);
  -[PLNetworkAgent nwPathMonitorQueue](self, "nwPathMonitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  nw_path_monitor_set_queue(v4, v5);

  nw_path_monitor_start(v4);
  return v4;
}

uint64_t __45__PLNetworkAgent_NWPathMonitorWithInterface___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNWPathUpdate:", a2);
}

- (void)logEventPointWake
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t block;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D80018], "handlePowerWakeEvent:", self->_wakeSocket);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __35__PLNetworkAgent_logEventPointWake__block_invoke;
    v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    v20 = v4;
    if (qword_1ED884A48 != -1)
      dispatch_once(&qword_1ED884A48, &block);
    if (byte_1ED8849F8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Power wake packet dictionary %@"), v3, block, v17, v18, v19, v20);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLNetworkAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLNetworkAgent logEventPointWake]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 378);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AttributedWake"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if (v12)
      v13 = CFSTR("Wake");
    else
      v13 = CFSTR("UnattributedWake");
    +[PLOperator entryKeyForType:andName:](PLNetworkAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v14, v3);
    -[PLOperator logEntry:](self, "logEntry:", v15);

  }
}

uint64_t __35__PLNetworkAgent_logEventPointWake__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8849F8 = result;
  return result;
}

- (void)logEventBackwardCumulativeNetworkUsage
{
  void *v3;
  ifaddrs *v4;
  sockaddr *ifa_addr;
  unsigned int *ifa_data;
  const char *ifa_name;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ifaddrs *v12;
  ifaddrs *v13;

  v13 = 0;
  if (!getifaddrs(&v13))
  {
    +[PLOperator entryKeyForType:andName:](PLNetworkAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("CumulativeNetworkUsage"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v13;
    if (v13)
    {
      do
      {
        ifa_addr = v4->ifa_addr;
        if (ifa_addr)
        {
          ifa_data = (unsigned int *)v4->ifa_data;
          if (ifa_data)
          {
            if ((v4->ifa_flags & 8) == 0 && ifa_addr->sa_family == 18)
            {
              ifa_name = v4->ifa_name;
              if (!strcmp(ifa_name, "pdp_ip0") || !strcmp(ifa_name, "en0") || !strcmp(ifa_name, "awdl0"))
              {
                v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v3);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4->ifa_name);
                v9 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("Interface"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", ifa_data[11]);
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("UpBytes"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", ifa_data[10]);
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("DownBytes"));

                -[PLOperator logEntry:](self, "logEntry:", v8);
              }
            }
          }
        }
        v4 = v4->ifa_next;
      }
      while (v4);
      v12 = v13;
    }
    else
    {
      v12 = 0;
    }
    MEMORY[0x1D179C01C](v12);

  }
}

- (void)logMobileAssetDownload:(id)a3 withCategory:(id)a4
{
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
  NSObject *v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  _WORD v35[9];

  *(_QWORD *)&v35[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestampStart"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "convertFromSystemToMonotonic");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("timestampStart"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, "convertFromSystemToMonotonic");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("timestampEnd"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)MEMORY[0x1E0D80078];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeFirstPartyBundleIDPrefix:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("clientName"));

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &stru_1E8587D00, CFSTR("clientName"));
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("assetType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0D80078];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("assetType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeFirstPartyBundleIDPrefix:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("assetType"));

  }
  else
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &stru_1E8587D00, CFSTR("assetType"));
  }

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bytesDownloaded"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v23 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bytesDownloaded"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "numberWithDouble:", (double)((int)objc_msgSend(v24, "intValue") / 0x100000));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, CFSTR("bytesDownloaded"));

    PLLogCommon();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bytesDownloaded"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "intValue");
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bytesDownloaded"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v33 = v6;
      v34 = 1024;
      *(_DWORD *)v35 = v29;
      v35[2] = 1024;
      *(_DWORD *)&v35[3] = objc_msgSend(v30, "intValue");
      _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "DownloadMetrics %@ rounded bytesDownloaded from %d to %d", buf, 0x18u);

    }
  }
  PLLogCommon();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v6;
    v34 = 2112;
    *(_QWORD *)v35 = v7;
    _os_log_debug_impl(&dword_1CAF47000, v27, OS_LOG_TYPE_DEBUG, "DownloadMetrics %@ updated payload: %@", buf, 0x16u);
  }

  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("DownloadMetrics"), v6, v7, v10);
}

- (void)handleNWPathUpdate:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  id v7;
  _BOOL8 is_expensive;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD enumerate_block[4];
  id v14;
  uint8_t buf[4];
  NSObject *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_INFO, "Received NWPath update: %@", buf, 0xCu);
  }

  if ((nw_path_get_status(v4) & 0xFFFFFFFD) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    enumerate_block[0] = MEMORY[0x1E0C809B0];
    enumerate_block[1] = 3221225472;
    enumerate_block[2] = __37__PLNetworkAgent_handleNWPathUpdate___block_invoke;
    enumerate_block[3] = &unk_1E857FA30;
    v7 = v6;
    v14 = v7;
    nw_path_enumerate_interfaces(v4, enumerate_block);
    if (objc_msgSend(v7, "count") == 1)
    {
      is_expensive = nw_path_is_expensive(v4);
      +[PLOperator entryKeyForType:andName:](PLNetworkAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("IsExpensive"));
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v9);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("NetworkType"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", is_expensive);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("IsExpensive"));

      -[PLOperator logEntry:](self, "logEntry:", v11);
    }
    else
    {
      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v4;
        _os_log_error_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_ERROR, "NWPath does not have valid interface: %@", buf, 0xCu);
      }
    }

  }
}

uint64_t __37__PLNetworkAgent_handleNWPathUpdate___block_invoke(uint64_t a1, nw_interface_t interface)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", nw_interface_get_type(interface));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return 1;
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLEntryNotificationOperatorComposition)canSleep
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCanSleep:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLSemaphore)canSleepSemaphore
{
  return (PLSemaphore *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCanSleepSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLXPCListenerOperatorComposition)downloadAutoAssetDownloadsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDownloadAutoAssetDownloadsListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLXPCListenerOperatorComposition)downloadV2AssetDownloadsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDownloadV2AssetDownloadsListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (int)wakeSocket
{
  return self->_wakeSocket;
}

- (void)setWakeSocket:(int)a3
{
  self->_wakeSocket = a3;
}

- (OS_nw_path_monitor)nwPathMonitorCellular
{
  return (OS_nw_path_monitor *)objc_getProperty(self, a2, 96, 1);
}

- (void)setNwPathMonitorCellular:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (OS_nw_path_monitor)nwPathMonitorWiFi
{
  return (OS_nw_path_monitor *)objc_getProperty(self, a2, 104, 1);
}

- (void)setNwPathMonitorWiFi:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (OS_nw_path_monitor)nwPathMonitorWired
{
  return (OS_nw_path_monitor *)objc_getProperty(self, a2, 112, 1);
}

- (void)setNwPathMonitorWired:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (OS_nw_path_monitor)nwPathMonitorLoopback
{
  return (OS_nw_path_monitor *)objc_getProperty(self, a2, 120, 1);
}

- (void)setNwPathMonitorLoopback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (OS_nw_path_monitor)nwPathMonitorOther
{
  return (OS_nw_path_monitor *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNwPathMonitorOther:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (OS_dispatch_queue)nwPathMonitorQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 136, 1);
}

- (void)setNwPathMonitorQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwPathMonitorQueue, 0);
  objc_storeStrong((id *)&self->_nwPathMonitorOther, 0);
  objc_storeStrong((id *)&self->_nwPathMonitorLoopback, 0);
  objc_storeStrong((id *)&self->_nwPathMonitorWired, 0);
  objc_storeStrong((id *)&self->_nwPathMonitorWiFi, 0);
  objc_storeStrong((id *)&self->_nwPathMonitorCellular, 0);
  objc_storeStrong((id *)&self->_downloadV2AssetDownloadsListener, 0);
  objc_storeStrong((id *)&self->_downloadAutoAssetDownloadsListener, 0);
  objc_storeStrong((id *)&self->_canSleepSemaphore, 0);
  objc_storeStrong((id *)&self->_canSleep, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
}

@end
