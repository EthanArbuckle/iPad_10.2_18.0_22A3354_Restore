@implementation NFExceptionsCALogger

+ (void)postHardwareExceptionEventWithAssertionCounter:(unsigned int)a3 hardwareType:(unsigned int)a4 wdogDump:(unsigned int *)a5 hwFltDump:(unsigned int *)a6 wdgTickInfo:(unsigned int *)a7
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
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
  const __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[3];

  v10 = *(_QWORD *)&a4;
  v11 = *(_QWORD *)&a3;
  v61[2] = *MEMORY[0x1E0C80C00];
  v12 = (void *)MEMORY[0x1C3BD2368](a1, a2);
  if ((_DWORD)v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("AssertionProgramCounter"));

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("RfProcessPc"));

    }
    else
    {
      objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E7D88550, CFSTR("RfProcessPc"));
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5[1]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("RfProcessSp"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5[2]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("RfProcessWaitObject"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5[3]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("RfProcessState"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5[4]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, CFSTR("SwpProcessPc"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5[5]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, CFSTR("SwpProcessSp"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5[6]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, CFSTR("SwpProcessWaitObject"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5[7]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v23, CFSTR("SwpProcessState"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5[8]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v24, CFSTR("KernelProcessPc"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5[9]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v25, CFSTR("KernelProcessSp"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5[10]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v26, CFSTR("KernelProcessWaitObject"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5[11]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v27, CFSTR("KernelProcessState"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5[12]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v28, CFSTR("HostProcessPc"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5[13]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v29, CFSTR("HostProcessSp"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5[14]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v30, CFSTR("HostProcessWaitObject"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5[15]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v31, CFSTR("HostProcessState"));

    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *a6);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v32, CFSTR("R0"));

    }
    else
    {
      objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E7D88550, CFSTR("R0"));
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a6[1]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v33, CFSTR("R1"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a6[2]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v34, CFSTR("R2"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a6[3]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v35, CFSTR("R3"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a6[4]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v36, CFSTR("R12"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a6[5]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v37, CFSTR("LR"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a6[6]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v38, CFSTR("PC"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a6[7]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v39, CFSTR("XPsr"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a6[8]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v40, CFSTR("hfLr"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a6[9]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v41, CFSTR("Psp"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a6[10]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v42, CFSTR("Msp"));

    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *a7);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v43, CFSTR("WDG_RF"));

    }
    else
    {
      objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E7D88550, CFSTR("WDG_RF"));
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a7[1]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v44, CFSTR("WDG_SWP"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a7[2]);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v45, CFSTR("WDG_Kernel"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a7[3]);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v46, CFSTR("WDG_Host"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a7[4]);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v47, CFSTR("WDG_MBox"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a7[5]);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v48, CFSTR("WDG_LowPower"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a7[6]);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v49, CFSTR("WDG_Sys_Ticks"));

    objc_msgSend(v13, "description");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  if (v16)
    v50 = v16;
  else
    v50 = &stru_1E7D801F8;
  v60[0] = CFSTR("exceptionData");
  v60[1] = CFSTR("hardwareType");
  v61[0] = v50;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v51;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.hardwareExceptionEvent"), v52);
  objc_msgSend(v53, "generateDailyUUIDForCA");
  v54 = objc_claimAutoreleasedReturnValue();
  v55 = (void *)v54;
  v58[0] = CFSTR("hwCount");
  v58[1] = CFSTR("dailyDeviceUUID");
  if (v54)
    v56 = (const __CFString *)v54;
  else
    v56 = CFSTR("noUUID");
  v59[0] = &unk_1E7D88568;
  v59[1] = v56;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.deviceExceptionStatistic"), v57);

  objc_autoreleasePoolPop(v12);
}

+ (void)postMiddlewareExceptionEvent:(unsigned int)a3 mwVersion:(unsigned int)a4 errorType:(unsigned int)a5 errorCode:(unsigned int)a6 breadcrumb:(unint64_t)a7 description:(id)a8
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[6];
  _QWORD v29[7];

  v9 = *(_QWORD *)&a6;
  v10 = *(_QWORD *)&a5;
  v11 = *(_QWORD *)&a4;
  v12 = *(_QWORD *)&a3;
  v29[6] = *MEMORY[0x1E0C80C00];
  v13 = a8;
  v14 = (void *)MEMORY[0x1C3BD2368]();
  v28[0] = CFSTR("middlewareVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v15;
  v28[1] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v16;
  v28[2] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v17;
  v28[3] = CFSTR("breadcrump");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v18;
  v28[4] = CFSTR("hardwareType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = CFSTR("description");
  v29[4] = v19;
  v29[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.middlewareExceptionEvent"), v20);
  objc_msgSend(v21, "generateDailyUUIDForCA");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  v26[0] = CFSTR("mwCount");
  v26[1] = CFSTR("dailyDeviceUUID");
  if (v22)
    v24 = (const __CFString *)v22;
  else
    v24 = CFSTR("noUUID");
  v27[0] = &unk_1E7D88568;
  v27[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.deviceExceptionStatistic"), v25);

  objc_autoreleasePoolPop(v14);
}

+ (void)postAnalyticsMobileSoftwareUpdateExceptionEvent:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v3 = a3;
  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1C3BD2368](a1, a2);
  v8 = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.mobileSoftwareUpdateExceptionEvent"), v6);

  objc_autoreleasePoolPop(v4);
}

+ (void)postAnalyticsSERemovedEvent:(unsigned int)a3 hasExpressTransactionStarted:(BOOL)a4 hasCardEmulationStarted:(BOOL)a5 hardwareType:(unsigned int)a6
{
  uint64_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v8 = a4;
  v9 = *(_QWORD *)&a3;
  v18[4] = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1C3BD2368](a1, a2);
  v17[0] = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v17[1] = CFSTR("hasExpressTransactionStarted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  v17[2] = CFSTR("hasCardEmulationStarted");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v13;
  v17[3] = CFSTR("hardwareType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.seRemovedEvent"), v15);

  objc_autoreleasePoolPop(v10);
}

+ (void)postAnalyticsOsResetEvent:(unsigned int)a3 osID:(unsigned int)a4 hardwareType:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  v15[3] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1C3BD2368](a1, a2);
  v14[0] = CFSTR("reason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v14[1] = CFSTR("osID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  v14[2] = CFSTR("hardwareType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.osResetEvent"), v12);

  objc_autoreleasePoolPop(v8);
}

+ (void)postAnalyticsCRSAuthInitEventWithStatus:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v3 = a3;
  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1C3BD2368](a1, a2);
  if ((_DWORD)v3 != 36864)
  {
    v8 = CFSTR("statusCode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.crsAuthInitExceptionEvent"), v6);

  }
  objc_autoreleasePoolPop(v4);
}

+ (void)postAnalyticsCRSAuthECommerceWithParameters:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD2368]();
  objc_msgSend(v3, "objectForKey:", CFSTR("status"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  if ((_DWORD)v6 != 36864)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("method"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "objectForKey:", CFSTR("method"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "unsignedIntValue");

    }
    else
    {
      v9 = 0xFFFFFFFFLL;
    }

    v14[0] = CFSTR("statusCode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = CFSTR("type");
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.crsAuthExceptionEvent"), v12);

  }
  objc_autoreleasePoolPop(v4);

}

+ (void)postAnalyticsCRSAuthWithStatus:(unsigned __int16)a3 withMethod:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1C3BD2368](a1, a2);
  if ((_DWORD)v5 != 36864)
  {
    v11[0] = CFSTR("statusCode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = CFSTR("type");
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.crsAuthExceptionEvent"), v9);

  }
  objc_autoreleasePoolPop(v6);
}

+ (void)postAnalyticsCRSDeAuthWithStatus:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v3 = a3;
  v9[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1C3BD2368](a1, a2);
  if ((_DWORD)v3 != 36864)
  {
    v8[0] = CFSTR("statusCode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = CFSTR("type");
    v9[0] = v5;
    v9[1] = &unk_1E7D88580;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.crsAuthExceptionEvent"), v6);

  }
  objc_autoreleasePoolPop(v4);
}

+ (void)postAnalyticsSERestrictedModeEntered:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1C3BD2368]();
  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "restrictedMode") & 1) == 0)
  {
    objc_msgSend(v6, "setRestrictedMode:", 1);
    v23[0] = CFSTR("contactless");
    objc_msgSend(v4, "objectForKeyedSubscript:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactless"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithBool:", objc_msgSend(v3, "BOOLValue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = &unk_1E7D88550;
    }
    v24[0] = v9;
    v23[1] = CFSTR("platformIdentifier");
    objc_msgSend(v4, "objectForKeyedSubscript:");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = &stru_1E7D801F8;
    if (v10)
      v12 = (const __CFString *)v10;
    v24[1] = v12;
    v23[2] = CFSTR("hardwareType");
    objc_msgSend(v4, "objectForKeyedSubscript:");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = &unk_1E7D88550;
    v24[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {

    }
    objc_msgSend(v6, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.seRestrictedModeEnteredEvent"), v16);
    +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:](NFGeneralStatisticsCALogger, "updateAnalyticsGeneralTransactionStatistics:", &unk_1E7D88AF8);
    objc_msgSend(v6, "generateDailyUUIDForCA");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v21[0] = CFSTR("restrictedModeCount");
    v21[1] = CFSTR("dailyDeviceUUID");
    if (v17)
      v19 = (const __CFString *)v17;
    else
      v19 = CFSTR("noUUID");
    v22[0] = &unk_1E7D88568;
    v22[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.deviceExceptionStatistic"), v20);

  }
  objc_autoreleasePoolPop(v5);

}

+ (void)postAnalyticsSERestrictedModeExited:(unsigned int)a3
{
  id v3;

  objc_msgSend(a1, "postCASERestrictedModeExited:", *(_QWORD *)&a3);
  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeRestrictedMode");

}

+ (void)postCASERestrictedModeExited:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v3 = *(_QWORD *)&a3;
  v9[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1C3BD2368](a1, a2);
  v8[0] = CFSTR("hardwareType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("exitReason");
  v9[0] = v5;
  v9[1] = &unk_1E7D88550;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.seRestrictedModeExitEvent"), v6);

  objc_autoreleasePoolPop(v4);
}

+ (void)postAnalyticsVASTransactionException:(unsigned int)a3 withSWStatus:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1C3BD2368](a1, a2);
  if ((int)v4 > 27266)
  {
    if ((_DWORD)v4 != 27267 && (_DWORD)v4 != 36864)
      goto LABEL_7;
  }
  else if ((_DWORD)v4 != 25223 && (_DWORD)v4 != 27012)
  {
LABEL_7:
    v11[0] = CFSTR("swStatus");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = CFSTR("commandType");
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.vasTransactionExceptionEvent"), v9);

    +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:](NFGeneralStatisticsCALogger, "updateAnalyticsGeneralTransactionStatistics:", &unk_1E7D88B20);
  }
  objc_autoreleasePoolPop(v6);
}

+ (void)postAnalyticsTSMConnectivityException:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v3 = *(_QWORD *)&a3;
  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1C3BD2368](a1, a2);
  v8 = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.tsmConnectivityExceptionEvent"), v6);

  objc_autoreleasePoolPop(v4);
}

+ (void)postAnalyticsHciTransactionException:(id)a3 eventType:(id)a4 commandResult:(id)a5 status:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1C3BD2368]();
  v16[0] = CFSTR("transactionUUID");
  v16[1] = CFSTR("eventType");
  v17[0] = v9;
  v17[1] = v10;
  v16[2] = CFSTR("commandResult");
  v16[3] = CFSTR("status");
  v17[2] = v11;
  v17[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.hciTransactionExceptionEvent"), v14);

  objc_autoreleasePoolPop(v13);
}

+ (void)postAnalyticsReaderModeExceptionForType:(unsigned int)a3 tagType:(unsigned int)a4 rfFrameInterface:(BOOL)a5 withErrorCode:(unsigned int)a6
{
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v9 = *(_QWORD *)&a3;
  v18[4] = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1C3BD2368](a1, a2);
  v17[0] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v17[1] = CFSTR("tagType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  v17[2] = CFSTR("rfFrameInterface");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v13;
  v17[3] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.ReaderModeExceptionEvent"), v15);

  objc_autoreleasePoolPop(v10);
}

+ (void)postAnalyticsExpressSetupFailureEvent:(unsigned __int16)a3 context:(unsigned __int16)a4 error:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v6 = a3;
  v13 = a5;
  v7 = (void *)MEMORY[0x1C3BD2368]();
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("reason"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("context"));

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "code"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("errorCode"));

  }
  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.expressSetupFailures"), v8);

  objc_autoreleasePoolPop(v7);
}

+ (void)postAnalyticsATLFailureEvent:(unsigned __int16)a3 aid:(id)a4 error:(id)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v13 = a4;
  v7 = a5;
  v8 = (void *)MEMORY[0x1C3BD2368]();
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("reason"));

  if (v13)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("aid"));
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "code"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("errorCode"));

  }
  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.atlFailures"), v9);

  objc_autoreleasePoolPop(v8);
}

+ (void)postAnalyticsAppletProvisioningFailureEvent:(unsigned __int16)a3 responseCode:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  v6 = (void *)MEMORY[0x1C3BD2368](a1, a2);
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("reason"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("errorCode"));

  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.appletProvisioningFailures"), v7);

  objc_autoreleasePoolPop(v6);
}

+ (void)postAnalyticsSEFailureEvent:(unsigned __int16)a3 context:(id)a4 error:(id)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v13 = a4;
  v7 = a5;
  v8 = (void *)MEMORY[0x1C3BD2368]();
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("reason"));

  if (v13)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("context"));
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "code"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("errorCode"));

  }
  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.seFailures"), v9);

  objc_autoreleasePoolPop(v8);
}

+ (void)postAnalyticsContactlessErrorsEvent:(unsigned __int16)a3 status:(unsigned __int16)a4 error:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v6 = a3;
  v13 = a5;
  v7 = (void *)MEMORY[0x1C3BD2368]();
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("reason"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("context"));

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "code"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("errorCode"));

  }
  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.contactlessErrors"), v8);

  objc_autoreleasePoolPop(v7);
}

@end
