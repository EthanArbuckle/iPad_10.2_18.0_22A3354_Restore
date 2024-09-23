@implementation PLEntryNotificationOperatorComposition

+ (id)requestEntryForEntryKey:(id)a3 forOperator:(id)a4 withTimeout:(double)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  PLEntryNotificationOperatorComposition *v12;
  NSObject *v13;
  PLEntryNotificationOperatorComposition *v14;
  dispatch_time_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id *v24;
  void *context;
  _QWORD v26[4];
  NSObject *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v9 = a3;
  v10 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__12;
  v33 = __Block_byref_object_dispose__12;
  v34 = 0;
  context = (void *)MEMORY[0x1BCC9E9B4]();
  v11 = dispatch_semaphore_create(1);
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  v12 = [PLEntryNotificationOperatorComposition alloc];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __96__PLEntryNotificationOperatorComposition_requestEntryForEntryKey_forOperator_withTimeout_error___block_invoke;
  v26[3] = &unk_1E6A54A70;
  v28 = &v29;
  v13 = v11;
  v27 = v13;
  v14 = -[PLEntryNotificationOperatorComposition initWithOperator:forEntryKey:withBlock:](v12, "initWithOperator:forEntryKey:withBlock:", v10, v9, v26);
  -[PLEntryNotificationOperatorComposition requestEntry](v14, "requestEntry");
  v15 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  v16 = (void *)dispatch_semaphore_wait(v13, v15);
  if (v16)
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v24 = a6;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: Timeout requesting %@"), v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLEntryNotificationOperatorComposition.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLEntryNotificationOperatorComposition requestEntryForEntryKey:forOperator:withTimeout:error:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v19, v20, 54);

      PLLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFileSP copyAndPrepareLog].cold.1((uint64_t)v17, v21);

      a6 = v24;
    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.powerlogd"), v16, &unk_1E6AF7520);
  }
  dispatch_semaphore_signal(v13);
  -[PLNSNotificationOperatorComposition listenForNotifications:](v14, "listenForNotifications:", 0);

  objc_autoreleasePoolPop(context);
  if (a6 && v16)
    *a6 = objc_retainAutorelease(v16);
  v22 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v22;
}

intptr_t __96__PLEntryNotificationOperatorComposition_requestEntryForEntryKey_forOperator_withTimeout_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)smcThermalInstantNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  PLEntryNotificationOperatorComposition *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PLEntryNotificationOperatorComposition initWithOperator:forEntryKey:withBlock:]([PLEntryNotificationOperatorComposition alloc], "initWithOperator:forEntryKey:withBlock:", v6, CFSTR("PLSMCAgent_EventPoint_ThermalInstantKeys"), v5);

  return v7;
}

+ (id)smcPowerAccumulatedNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  PLEntryNotificationOperatorComposition *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PLEntryNotificationOperatorComposition initWithOperator:forEntryKey:withBlock:]([PLEntryNotificationOperatorComposition alloc], "initWithOperator:forEntryKey:withBlock:", v6, CFSTR("PLSMCAgent_EventBackward_PowerAccumulatedKeys"), v5);

  return v7;
}

+ (id)luxEntryNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  PLEntryNotificationOperatorComposition *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PLEntryNotificationOperatorComposition initWithOperator:forEntryKey:withBlock:]([PLEntryNotificationOperatorComposition alloc], "initWithOperator:forEntryKey:withBlock:", v6, CFSTR("PLDisplayAgent_EventForward_Display"), v5);

  return v7;
}

+ (id)wakeEntryNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "workQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "wakeEntryNotificationWithWorkQueue:withBlock:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)wakeEntryNotificationWithWorkQueue:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  PLEntryNotificationOperatorComposition *v7;
  void *v8;
  void *v9;
  PLEntryNotificationOperatorComposition *v10;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [PLEntryNotificationOperatorComposition alloc];
  v12 = &unk_1E6ABAEE0;
  v13 = &unk_1E6ABAEF8;
  v14 = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLEntryNotificationOperatorComposition initWithWorkQueue:forEntryKey:forUpdateOrInsert:withFilter:withBlock:](v7, "initWithWorkQueue:forEntryKey:forUpdateOrInsert:withFilter:withBlock:", v6, CFSTR("PLSleepWakeAgent_EventForward_PowerState"), 1, v9, v5);

  return v10;
}

+ (id)displayOnNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  PLEntryNotificationOperatorComposition *v7;
  void *v8;
  void *v9;
  void *v10;
  PLEntryNotificationOperatorComposition *v11;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [PLEntryNotificationOperatorComposition alloc];
  v15 = &unk_1E6ABAEE0;
  v16 = CFSTR("Backlight");
  v17[0] = CFSTR("Block");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("Active");
  v18[0] = v8;
  v13 = &unk_1E6ABAEE0;
  v14 = &unk_1E6ABAF10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PLEntryNotificationOperatorComposition initWithOperator:forEntryKey:withFilter:withBlock:](v7, "initWithOperator:forEntryKey:withFilter:withBlock:", v6, CFSTR("PLDisplayAgent_EventPoint_Display"), v10, v5);

  return v11;
}

+ (id)displayOffNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  PLEntryNotificationOperatorComposition *v7;
  void *v8;
  void *v9;
  void *v10;
  PLEntryNotificationOperatorComposition *v11;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [PLEntryNotificationOperatorComposition alloc];
  v15 = &unk_1E6ABAEE0;
  v16 = CFSTR("Backlight");
  v17[0] = CFSTR("Block");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("Active");
  v18[0] = v8;
  v13 = &unk_1E6ABAEE0;
  v14 = &unk_1E6ABAF28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PLEntryNotificationOperatorComposition initWithOperator:forEntryKey:withFilter:withBlock:](v7, "initWithOperator:forEntryKey:withFilter:withBlock:", v6, CFSTR("PLDisplayAgent_EventPoint_Display"), v10, v5);

  return v11;
}

+ (id)displayAODNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  PLEntryNotificationOperatorComposition *v7;
  void *v8;
  void *v9;
  void *v10;
  PLEntryNotificationOperatorComposition *v11;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [PLEntryNotificationOperatorComposition alloc];
  v15 = &unk_1E6ABAEE0;
  v16 = CFSTR("Backlight");
  v17[0] = CFSTR("Block");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("Active");
  v18[0] = v8;
  v13 = &unk_1E6ABAEE0;
  v14 = &unk_1E6ABAF40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PLEntryNotificationOperatorComposition initWithOperator:forEntryKey:withFilter:withBlock:](v7, "initWithOperator:forEntryKey:withFilter:withBlock:", v6, CFSTR("PLDisplayAgent_EventPoint_Display"), v10, v5);

  return v11;
}

+ (id)displayOnOrAODNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  PLEntryNotificationOperatorComposition *v7;
  void *v8;
  void *v9;
  void *v10;
  PLEntryNotificationOperatorComposition *v11;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [PLEntryNotificationOperatorComposition alloc];
  v15 = &unk_1E6ABAEE0;
  v16 = CFSTR("Backlight");
  v17[0] = CFSTR("Block");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("Active");
  v18[0] = v8;
  v13 = &unk_1E6ABAF58;
  v14 = &unk_1E6ABAF28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PLEntryNotificationOperatorComposition initWithOperator:forEntryKey:withFilter:withBlock:](v7, "initWithOperator:forEntryKey:withFilter:withBlock:", v6, CFSTR("PLDisplayAgent_EventPoint_Display"), v10, v5);

  return v11;
}

+ (id)displayOffOrAODNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  PLEntryNotificationOperatorComposition *v7;
  void *v8;
  void *v9;
  void *v10;
  PLEntryNotificationOperatorComposition *v11;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [PLEntryNotificationOperatorComposition alloc];
  v15 = &unk_1E6ABAEE0;
  v16 = CFSTR("Backlight");
  v17[0] = CFSTR("Block");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("Active");
  v18[0] = v8;
  v13 = &unk_1E6ABAF58;
  v14 = &unk_1E6ABAF10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PLEntryNotificationOperatorComposition initWithOperator:forEntryKey:withFilter:withBlock:](v7, "initWithOperator:forEntryKey:withFilter:withBlock:", v6, CFSTR("PLDisplayAgent_EventPoint_Display"), v10, v5);

  return v11;
}

+ (id)displayStateChangeNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  PLEntryNotificationOperatorComposition *v7;
  void *v8;
  void *v9;
  PLEntryNotificationOperatorComposition *v10;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [PLEntryNotificationOperatorComposition alloc];
  v12 = &unk_1E6ABAEE0;
  v13 = CFSTR("Backlight");
  v14 = CFSTR("Block");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLEntryNotificationOperatorComposition initWithOperator:forEntryKey:withFilter:withBlock:](v7, "initWithOperator:forEntryKey:withFilter:withBlock:", v6, CFSTR("PLDisplayAgent_EventPoint_Display"), v9, v5);

  return v10;
}

+ (id)significantBatteryChangeNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  PLEntryNotificationOperatorComposition *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PLEntryNotificationOperatorComposition *v14;
  _QWORD v16[3];
  _QWORD v17[3];
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = +[PLUtilities hasBattery](PLUtilities, "hasBattery");
  v9 = [PLEntryNotificationOperatorComposition alloc];
  if (v8)
  {
    v18 = CFSTR("Level");
    v17[0] = &unk_1E6ABEE70;
    v16[0] = &unk_1E6ABAEF8;
    v16[1] = &unk_1E6ABAF70;
    objc_msgSend(a1, "getSBCMaxTimeInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v10;
    v16[2] = &unk_1E6ABAF88;
    objc_msgSend(a1, "getSBCMinTimeInterval");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PLEntryNotificationOperatorComposition initWithOperator:forEntryKey:withFilter:withBlock:](v9, "initWithOperator:forEntryKey:withFilter:withBlock:", v7, CFSTR("PLBatteryAgent_EventBackward_Battery"), v13, v6);

  }
  else
  {
    objc_msgSend(v7, "workQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[PLEntryNotificationOperatorComposition initNotificationTimerWithWorkQueue:withBlock:](v9, "initNotificationTimerWithWorkQueue:withBlock:", v10, v6);
  }

  return v14;
}

+ (id)significantBatteryChangeNotificationWithOperator:(id)a3 withMaxIntervalInSecs:(double)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  PLEntryNotificationOperatorComposition *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PLEntryNotificationOperatorComposition *v16;
  _QWORD v18[3];
  _QWORD v19[3];
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  v10 = +[PLUtilities hasBattery](PLUtilities, "hasBattery");
  v11 = [PLEntryNotificationOperatorComposition alloc];
  if (v10)
  {
    v20 = CFSTR("Level");
    v19[0] = &unk_1E6ABEE70;
    v18[0] = &unk_1E6ABAEF8;
    v18[1] = &unk_1E6ABAF70;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v12;
    v18[2] = &unk_1E6ABAF88;
    objc_msgSend(a1, "getSBCMinTimeInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PLEntryNotificationOperatorComposition initWithOperator:forEntryKey:withFilter:withBlock:](v11, "initWithOperator:forEntryKey:withFilter:withBlock:", v9, CFSTR("PLBatteryAgent_EventBackward_Battery"), v15, v8);

  }
  else
  {
    objc_msgSend(v9, "workQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = -[PLEntryNotificationOperatorComposition initNotificationTimerWithWorkQueue:withMaxInterval:withBlock:](v11, "initNotificationTimerWithWorkQueue:withMaxInterval:withBlock:", v12, v8, a4);
  }

  return v16;
}

+ (id)getSBCMinTimeInterval
{
  void *v2;
  double v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  __CFString *v9;
  uint64_t v10;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __63__PLEntryNotificationOperatorComposition_getSBCMinTimeInterval__block_invoke;
  v8 = &unk_1E6A527D8;
  v9 = CFSTR("SBCMinTimeInterval");
  v10 = 0x4072C00000000000;
  if (getSBCMinTimeInterval_defaultOnce != -1)
    dispatch_once(&getSBCMinTimeInterval_defaultOnce, &v5);
  v3 = *(double *)&getSBCMinTimeInterval_objectForKey;

  objc_msgSend(v2, "numberWithDouble:", v3, v5, v6, v7, v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __63__PLEntryNotificationOperatorComposition_getSBCMinTimeInterval__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
  getSBCMinTimeInterval_objectForKey = v2;
  return result;
}

+ (id)getSBCMaxTimeInterval
{
  void *v2;
  double v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  __CFString *v9;
  uint64_t v10;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __63__PLEntryNotificationOperatorComposition_getSBCMaxTimeInterval__block_invoke;
  v8 = &unk_1E6A527D8;
  v9 = CFSTR("SBCMaxTimeInterval");
  v10 = 0x409C200000000000;
  if (getSBCMaxTimeInterval_defaultOnce != -1)
    dispatch_once(&getSBCMaxTimeInterval_defaultOnce, &v5);
  v3 = *(double *)&getSBCMaxTimeInterval_objectForKey;

  objc_msgSend(v2, "numberWithDouble:", v3, v5, v6, v7, v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __63__PLEntryNotificationOperatorComposition_getSBCMaxTimeInterval__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
  getSBCMaxTimeInterval_objectForKey = v2;
  return result;
}

+ (id)canSleepEntryNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "workQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "canSleepEntryNotificationWithWorkQueue:withBlock:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)canSleepEntryNotificationWithWorkQueue:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  PLEntryNotificationOperatorComposition *v7;
  void *v8;
  void *v9;
  void *v10;
  PLEntryNotificationOperatorComposition *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [PLEntryNotificationOperatorComposition alloc];
  v15 = &unk_1E6ABAEE0;
  v16 = &unk_1E6ABAFA0;
  v17[0] = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("Event");
  v18[0] = v8;
  v13 = &unk_1E6ABAEE0;
  v14 = &unk_1E6ABAEE0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PLEntryNotificationOperatorComposition initWithWorkQueue:forEntryKey:forUpdateOrInsert:withFilter:withBlock:](v7, "initWithWorkQueue:forEntryKey:forUpdateOrInsert:withFilter:withBlock:", v6, CFSTR("PLSleepWakeAgent_EventForward_PowerState"), 1, v10, v5);

  return v11;
}

+ (id)sleepEntryNotificationWithOperator:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  PLEntryNotificationOperatorComposition *v7;
  void *v8;
  void *v9;
  PLEntryNotificationOperatorComposition *v10;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [PLEntryNotificationOperatorComposition alloc];
  v12 = &unk_1E6ABAEE0;
  v13 = &unk_1E6ABAFA0;
  v14 = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLEntryNotificationOperatorComposition initWithOperator:forEntryKey:withFilter:withBlock:](v7, "initWithOperator:forEntryKey:withFilter:withBlock:", v6, CFSTR("PLSleepWakeAgent_EventForward_PowerState"), v9, v5);

  return v10;
}

- (PLEntryNotificationOperatorComposition)initWithWorkQueue:(id)a3 forEntryKey:(id)a4 forUpdateOrInsert:(signed __int16)a5 withBlock:(id)a6
{
  int v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  PLEntryNotificationOperatorComposition *v16;
  objc_super v18;

  v9 = (unsigned __int16)a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_opt_new();
  v14 = v13;
  if ((v9 - 1) <= 1)
    objc_msgSend(v13, "addObject:", v11);
  if ((v9 & 0xFFFFFFFD) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_update"), v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

  }
  v18.receiver = self;
  v18.super_class = (Class)PLEntryNotificationOperatorComposition;
  v16 = -[PLNSNotificationOperatorComposition initWithWorkQueue:forNotifications:withBlock:](&v18, sel_initWithWorkQueue_forNotifications_withBlock_, v10, v14, v12);

  return v16;
}

- (PLEntryNotificationOperatorComposition)initWithOperator:(id)a3 forEntryKey:(id)a4 forUpdateOrInsert:(signed __int16)a5 withBlock:(id)a6
{
  uint64_t v6;
  id v10;
  id v11;
  void *v12;
  PLEntryNotificationOperatorComposition *v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  objc_msgSend(a3, "workQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PLEntryNotificationOperatorComposition initWithWorkQueue:forEntryKey:forUpdateOrInsert:withBlock:](self, "initWithWorkQueue:forEntryKey:forUpdateOrInsert:withBlock:", v12, v11, v6, v10);

  return v13;
}

- (PLEntryNotificationOperatorComposition)initWithOperator:(id)a3 forEntryKey:(id)a4 forUpdateOrInsert:(signed __int16)a5 withFilter:(id)a6 withBlock:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  PLEntryNotificationOperatorComposition *v16;

  v8 = a5;
  v12 = a7;
  v13 = a6;
  v14 = a4;
  objc_msgSend(a3, "workQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PLEntryNotificationOperatorComposition initWithWorkQueue:forEntryKey:forUpdateOrInsert:withFilter:withBlock:](self, "initWithWorkQueue:forEntryKey:forUpdateOrInsert:withFilter:withBlock:", v15, v14, v8, v13, v12);

  return v16;
}

- (PLEntryNotificationOperatorComposition)initWithWorkQueue:(id)a3 forEntryKey:(id)a4 forUpdateOrInsert:(signed __int16)a5 withFilter:(id)a6 withBlock:(id)a7
{
  int v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PLEntryNotificationOperatorComposition *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v30;
  void *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v11 = (unsigned __int16)a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = (void *)objc_opt_new();
  v17 = (void *)objc_opt_new();
  +[PLEntryDefinition notificationNameForEntryKey:withFilterDefintion:](PLEntryDefinition, "notificationNameForEntryKey:withFilterDefintion:", v13, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 - 1) <= 1)
  {
    objc_msgSend(v16, "addObject:", v18);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("requestingFilter.%@"), v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v19);

  }
  if ((v11 & 0xFFFFFFFD) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_update"), v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v20);

  }
  v38.receiver = self;
  v38.super_class = (Class)PLEntryNotificationOperatorComposition;
  v21 = -[PLNSNotificationOperatorComposition initWithWorkQueue:forNotifications:withBlock:](&v38, sel_initWithWorkQueue_forNotifications_withBlock_, v12, v16, v15);
  if (v21)
  {
    v30 = v18;
    v31 = v17;
    v32 = v15;
    v33 = v12;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v22 = v17;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "postNotificationName:object:userInfo:", v27, 0, v14);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v24);
    }

    v12 = v33;
    v17 = v31;
    v15 = v32;
    v18 = v30;
  }

  return v21;
}

- (PLEntryNotificationOperatorComposition)initWithWorkQueue:(id)a3 forEntryKey:(id)a4 withBlock:(id)a5
{
  return -[PLEntryNotificationOperatorComposition initWithWorkQueue:forEntryKey:forUpdateOrInsert:withBlock:](self, "initWithWorkQueue:forEntryKey:forUpdateOrInsert:withBlock:", a3, a4, 1, a5);
}

- (PLEntryNotificationOperatorComposition)initWithOperator:(id)a3 forEntryKey:(id)a4 withBlock:(id)a5
{
  return -[PLEntryNotificationOperatorComposition initWithOperator:forEntryKey:forUpdateOrInsert:withBlock:](self, "initWithOperator:forEntryKey:forUpdateOrInsert:withBlock:", a3, a4, 1, a5);
}

- (PLEntryNotificationOperatorComposition)initWithWorkQueue:(id)a3 forEntryKey:(id)a4 withFilter:(id)a5 withBlock:(id)a6
{
  return -[PLEntryNotificationOperatorComposition initWithWorkQueue:forEntryKey:forUpdateOrInsert:withFilter:withBlock:](self, "initWithWorkQueue:forEntryKey:forUpdateOrInsert:withFilter:withBlock:", a3, a4, 1, a5, a6);
}

- (PLEntryNotificationOperatorComposition)initWithOperator:(id)a3 forEntryKey:(id)a4 withFilter:(id)a5 withBlock:(id)a6
{
  return -[PLEntryNotificationOperatorComposition initWithOperator:forEntryKey:forUpdateOrInsert:withFilter:withBlock:](self, "initWithOperator:forEntryKey:forUpdateOrInsert:withFilter:withBlock:", a3, a4, 1, a5, a6);
}

- (void)requestEntry
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLNSNotificationOperatorComposition notificationName](self, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("requesting.%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", v5, 0);

}

- (id)initNotificationTimerWithWorkQueue:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PLEntryNotificationOperatorComposition initNotificationTimerWithWorkQueue:withMaxInterval:withBlock:](self, "initNotificationTimerWithWorkQueue:withMaxInterval:withBlock:", v7, v6, (double)+[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", CFSTR("sbcLoggingInterval"), 1800));

  return v8;
}

- (id)initNotificationTimerWithWorkQueue:(id)a3 withMaxInterval:(double)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  PLTimer *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  PLEntryNotificationOperatorComposition *v15;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  if (!notificationTimer)
  {
    v10 = [PLTimer alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(-2, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PLTimer initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:](v10, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v11, 1, 0, v12, &__block_literal_global_27, a4, 0.0);
    v14 = (void *)notificationTimer;
    notificationTimer = v13;

  }
  v17.receiver = self;
  v17.super_class = (Class)PLEntryNotificationOperatorComposition;
  v15 = -[PLNSNotificationOperatorComposition initWithWorkQueue:forNotification:withBlock:](&v17, sel_initWithWorkQueue_forNotification_withBlock_, v8, CFSTR("PLTimerFiredNotification"), v9);

  return v15;
}

void __103__PLEntryNotificationOperatorComposition_initNotificationTimerWithWorkQueue_withMaxInterval_withBlock___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("PLTimerFiredNotification"), 0);

}

@end
