@implementation PLDuetServiceSimple

- (PLDuetServiceSimple)init
{
  PLDuetServiceSimple *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLDuetServiceSimple;
  v2 = -[PLDuetServiceSimple init](&v4, sel_init);
  -[PLDuetServiceImpl setDuetService:](v2, "setDuetService:", 0);
  return v2;
}

- (void)initOperatorDependancies:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v29;
  __CFNotificationCenter *v30;
  __CFNotificationCenter *v31;
  __CFNotificationCenter *v32;
  __CFNotificationCenter *v33;
  void *v34;
  PLDuetServiceSimple *v35;
  _QWORD v36[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  _BYTE v45[128];
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[PLDuetServiceImpl setDuetService:](self, "setDuetService:", v4);
    v5 = objc_alloc(MEMORY[0x1E0D80090]);
    v6 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __48__PLDuetServiceSimple_initOperatorDependancies___block_invoke;
    v44[3] = &unk_1E8578610;
    v44[4] = self;
    v7 = (void *)objc_msgSend(v5, "initWithOperator:withRegistration:withBlock:", v4, &unk_1E864DDE0, v44);
    -[PLDuetServiceImpl setEventListener:](self, "setEventListener:", v7);

    v43[0] = v6;
    v43[1] = 3221225472;
    v43[2] = __48__PLDuetServiceSimple_initOperatorDependancies___block_invoke_2;
    v43[3] = &unk_1E8577F70;
    v43[4] = self;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80098]), "initWithOperator:withRegistration:withBlock:", v4, &unk_1E864DE08, v43);
    -[PLDuetServiceImpl setEnergyResponder:](self, "setEnergyResponder:", v8);

    v42[0] = v6;
    v42[1] = 3221225472;
    v42[2] = __48__PLDuetServiceSimple_initOperatorDependancies___block_invoke_3;
    v42[3] = &unk_1E8578610;
    v42[4] = self;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", v4, &unk_1E864DE30, v42);
    -[PLDuetServiceSimple setResetListener:](self, "setResetListener:", v9);

    -[PLDuetServiceSimple setIsCharging:](self, "setIsCharging:", 0);
    v10 = objc_alloc(MEMORY[0x1E0D7FFC8]);
    +[PLOperator entryKeyForType:andName:](PLBatteryAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("Battery"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v6;
    v41[1] = 3221225472;
    v41[2] = __48__PLDuetServiceSimple_initOperatorDependancies___block_invoke_4;
    v41[3] = &unk_1E8577F48;
    v41[4] = self;
    v12 = (void *)objc_msgSend(v10, "initWithOperator:forEntryKey:withBlock:", v4, v11, v41);
    -[PLDuetServiceSimple setChargingListener:](self, "setChargingListener:", v12);

    -[PLDuetServiceImpl duetService](self, "duetService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v13, "isDebugEnabled");

    if ((_DWORD)v11)
    {
      v35 = self;
      +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("ComplicationEvents"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("timestampEnd"), &unk_1E8634CC8, 6);
      objc_msgSend(v4, "storage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)v14;
      objc_msgSend(v16, "entriesForKey:withComparisons:", v14, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v38 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_msgSend(v4, "storage");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v36[0] = v6;
            v36[1] = 3221225472;
            v36[2] = __48__PLDuetServiceSimple_initOperatorDependancies___block_invoke_277;
            v36[3] = &unk_1E85780C8;
            v36[4] = v24;
            objc_msgSend(v25, "updateEntry:withBlock:", v24, v36);

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        }
        while (v21);
      }

      self = v35;
    }
    -[PLDuetServiceImpl duetService](self, "duetService");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isDebugEnabled");

    if (v27)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)testStartEvent, CFSTR("com.apple.powerlogd.PLDuetService.testStartEvent"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v29 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v29, self, (CFNotificationCallback)testStartEvent2, CFSTR("com.apple.powerlogd.PLDuetService.testStartEvent2"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v30 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v30, self, (CFNotificationCallback)testStopEvent, CFSTR("com.apple.powerlogd.PLDuetService.testStopEvent"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v31 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v31, self, (CFNotificationCallback)testStopEvent2, CFSTR("com.apple.powerlogd.PLDuetService.testStopEvent2"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v32 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v32, self, (CFNotificationCallback)testReset, CFSTR("com.apple.powerlogd.PLDuetService.testReset"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v33 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v33, self, (CFNotificationCallback)testCapping, CFSTR("com.apple.powerlogd.PLDuetService.testCapping"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }

}

uint64_t __48__PLDuetServiceSimple_initOperatorDependancies___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveStartEventWithPayload:", a5);
}

uint64_t __48__PLDuetServiceSimple_initOperatorDependancies___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveStopEventWithPayload:", a5);
}

uint64_t __48__PLDuetServiceSimple_initOperatorDependancies___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveReset");
}

void __48__PLDuetServiceSimple_initOperatorDependancies___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsCharging"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setIsCharging:", objc_msgSend(v3, "BOOLValue"));

}

void __48__PLDuetServiceSimple_initOperatorDependancies___block_invoke_277(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, CFSTR("timestampEnd"));

}

- (void)didReceiveStartEventWithPayload:(id)a3
{
  id v4;
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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  id v34;
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
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  PLDuetServiceSimple *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  _QWORD v76[5];
  _QWORD block[5];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD v82[5];
  _QWORD v83[5];
  uint8_t v84[128];
  uint8_t buf[4];
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __55__PLDuetServiceSimple_didReceiveStartEventWithPayload___block_invoke;
    v83[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v83[4] = v5;
    if (qword_1ED8853C0 != -1)
      dispatch_once(&qword_1ED8853C0, v83);
    if (byte_1ED88533B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("payload=%@"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple didReceiveStartEventWithPayload:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 800);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v86 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("info"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("pid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "intValue");

  -[PLDuetServiceSimple bundleIDToState](self, "bundleIDToState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = (void *)v12;
  if (v17)
  {
    -[PLDuetServiceSimple didReceiveStopEventWithPayload:](self, "didReceiveStopEventWithPayload:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v19 = objc_opt_class();
      v82[0] = MEMORY[0x1E0C809B0];
      v82[1] = 3221225472;
      v82[2] = __55__PLDuetServiceSimple_didReceiveStartEventWithPayload___block_invoke_296;
      v82[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v82[4] = v19;
      if (qword_1ED8853C8 != -1)
        dispatch_once(&qword_1ED8853C8, v82);
      if (byte_1ED88533C)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Second start arrived. Dropping energy on floor %@"), v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lastPathComponent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple didReceiveStartEventWithPayload:]");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 809);

        PLLogCommon();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v86 = v20;
          _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v12 = (uint64_t)v73;
      }
    }

  }
  v26 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setStartDate:", v27);

  if ((int)v15 < 1)
    -[PLDuetServiceSimple numCPUSecondsForBundleID:](self, "numCPUSecondsForBundleID:", v12);
  else
    -[PLDuetServiceSimple numCPUSecondsForPid:](self, "numCPUSecondsForPid:", v15);
  objc_msgSend(v26, "setCpuSeconds:");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("info"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setInfo:", v28);

  -[PLDuetServiceImpl duetService](self, "duetService");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[PLDuetServiceImpl duetService](self, "duetService");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isDebugEnabled");

    if (v32)
    {
      +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("ComplicationEvents"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_alloc(MEMORY[0x1E0D7FFB0]);
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v34, "initWithEntryKey:withDate:", v33, v35);

      objc_msgSend(v36, "setObject:forKeyedSubscript:", v12, CFSTR("BundleID"));
      objc_msgSend(v26, "info");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "description");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v38, CFSTR("Info"));

      v39 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v26, "cpuSeconds");
      objc_msgSend(v39, "numberWithDouble:");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v40, CFSTR("CPUSecondsStart"));

      -[PLDuetServiceImpl duetService](self, "duetService");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        -[PLDuetServiceImpl duetService](self, "duetService");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "logEntry:", v36);

      }
    }
  }
  v72 = v4;
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  -[PLDuetServiceSimple bundleIDToState](self, "bundleIDToState");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "allValues");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v79;
    v74 = v44;
    v75 = v26;
    do
    {
      v48 = 0;
      do
      {
        if (*(_QWORD *)v79 != v47)
          objc_enumerationMutation(v44);
        v49 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v48);
        objc_msgSend(v49, "endDate");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v50)
        {
          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v51 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __55__PLDuetServiceSimple_didReceiveStartEventWithPayload___block_invoke_306;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v51;
            if (qword_1ED8853D0 != -1)
              dispatch_once(&qword_1ED8853D0, block);
            if (byte_1ED88533D)
            {
              v52 = self;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("state=%@"), v49);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "lastPathComponent");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple didReceiveStartEventWithPayload:]");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "logMessage:fromFile:fromFunction:fromLineNumber:", v53, v56, v57, 833);

              PLLogCommon();
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v86 = v53;
                _os_log_debug_impl(&dword_1CAF47000, v58, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              self = v52;
              v44 = v74;
              v26 = v75;
            }
          }
          objc_msgSend(v49, "overlappingStates");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "addObject:", v26);

          objc_msgSend(v26, "overlappingStates");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "addObject:", v49);

        }
        ++v48;
      }
      while (v46 != v48);
      v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
    }
    while (v46);
  }

  -[PLDuetServiceSimple bundleIDToState](self, "bundleIDToState");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v73;
  objc_msgSend(v61, "setObject:forKeyedSubscript:", v26, v73);

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v63 = objc_opt_class();
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __55__PLDuetServiceSimple_didReceiveStartEventWithPayload___block_invoke_311;
    v76[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v76[4] = v63;
    if (qword_1ED8853D8 != -1)
      dispatch_once(&qword_1ED8853D8, v76);
    if (byte_1ED88533E)
    {
      v64 = (void *)MEMORY[0x1E0CB3940];
      -[PLDuetServiceSimple bundleIDToState](self, "bundleIDToState");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "stringWithFormat:", CFSTR("bundleIDToState=%@"), v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      v67 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "lastPathComponent");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple didReceiveStartEventWithPayload:]");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "logMessage:fromFile:fromFunction:fromLineNumber:", v66, v69, v70, 841);

      PLLogCommon();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v86 = v66;
        _os_log_debug_impl(&dword_1CAF47000, v71, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v62 = v73;
    }
  }

}

uint64_t __55__PLDuetServiceSimple_didReceiveStartEventWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88533B = result;
  return result;
}

uint64_t __55__PLDuetServiceSimple_didReceiveStartEventWithPayload___block_invoke_296(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88533C = result;
  return result;
}

uint64_t __55__PLDuetServiceSimple_didReceiveStartEventWithPayload___block_invoke_306(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88533D = result;
  return result;
}

uint64_t __55__PLDuetServiceSimple_didReceiveStartEventWithPayload___block_invoke_311(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88533E = result;
  return result;
}

- (id)didReceiveStopEventWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  _QWORD *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  double v42;
  double v43;
  uint64_t v44;
  _QWORD *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  double v52;
  uint64_t v53;
  _QWORD *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  _QWORD *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  double v81;
  double v82;
  uint64_t v83;
  _QWORD *v84;
  PLDuetServiceSimple *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  NSObject *v91;
  double v92;
  double v93;
  uint64_t v94;
  _QWORD *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  double v102;
  double v103;
  uint64_t v104;
  _QWORD *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  NSObject *v111;
  double v112;
  uint64_t v113;
  _QWORD *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  NSObject *v120;
  void *v121;
  void *v122;
  double v123;
  uint64_t v124;
  _QWORD *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  NSObject *v131;
  void *v132;
  double v133;
  void *v134;
  double v135;
  void *v136;
  double v137;
  uint64_t v138;
  _QWORD *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  NSObject *v145;
  void *v146;
  uint64_t v147;
  _QWORD *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  NSObject *v156;
  double v157;
  double v158;
  uint64_t v159;
  void *v160;
  void *v161;
  int v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  id v172;
  uint64_t v173;
  _QWORD *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  NSObject *v180;
  void *v181;
  id v183;
  void *v184;
  void *v185;
  void *v186;
  id obj;
  uint64_t v188;
  _QWORD v189[5];
  _QWORD v190[4];
  id v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  _QWORD v198[5];
  _QWORD v199[5];
  _QWORD v200[5];
  _QWORD v201[5];
  _QWORD v202[5];
  _QWORD v203[5];
  _QWORD v204[5];
  _QWORD v205[5];
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  _QWORD v210[5];
  _QWORD v211[5];
  _QWORD v212[5];
  _QWORD v213[5];
  _QWORD v214[5];
  const __CFString *v215;
  void *v216;
  _QWORD v217[2];
  uint8_t v218[128];
  uint8_t buf[4];
  void *v220;
  uint64_t v221;

  v221 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    v214[0] = MEMORY[0x1E0C809B0];
    v214[1] = 3221225472;
    v214[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke;
    v214[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v214[4] = v5;
    v6 = v214;
    if (qword_1ED8853E0 != -1)
      dispatch_once(&qword_1ED8853E0, v6);

    if (byte_1ED88533F)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("payload=%@"), v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple didReceiveStopEventWithPayload:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 863);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v220 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("info"));
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuetServiceSimple bundleIDToState](self, "bundleIDToState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v185 = (void *)v13;
  objc_msgSend(v14, "objectForKeyedSubscript:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v186 = v15;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v16 = objc_opt_class();
    v213[0] = MEMORY[0x1E0C809B0];
    v213[1] = 3221225472;
    v213[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_316;
    v213[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v213[4] = v16;
    v17 = v213;
    if (qword_1ED8853E8 != -1)
      dispatch_once(&qword_1ED8853E8, v17);

    if (byte_1ED885340)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("state=%@"), v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple didReceiveStopEventWithPayload:]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 868);

      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v220 = v18;
        _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (v15)
  {
    objc_msgSend(v15, "info");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("pid"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "intValue");

    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEndDate:", v27);

    if ((int)v26 < 1)
      -[PLDuetServiceSimple numCPUSecondsForBundleID:](self, "numCPUSecondsForBundleID:", v185);
    else
      -[PLDuetServiceSimple numCPUSecondsForPid:](self, "numCPUSecondsForPid:", v26);
    v30 = v28;
    objc_msgSend(v15, "cpuSeconds");
    v32 = v30 - v31;
    if (v32 >= 0.0)
      v33 = v32;
    else
      v33 = 0.0;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v34 = objc_opt_class();
      v212[0] = MEMORY[0x1E0C809B0];
      v212[1] = 3221225472;
      v212[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_319;
      v212[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v212[4] = v34;
      v35 = v212;
      if (qword_1ED8853F0 != -1)
        dispatch_once(&qword_1ED8853F0, v35);

      if (byte_1ED885341)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CPU duration=%f"), *(_QWORD *)&v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "lastPathComponent");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple didReceiveStopEventWithPayload:]");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "logMessage:fromFile:fromFunction:fromLineNumber:", v36, v39, v40, 879);

        PLLogCommon();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v220 = v36;
          _os_log_debug_impl(&dword_1CAF47000, v41, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLDuetServiceSimple capUtilizationInSeconds:withUpperBoundInError:withCapInError:withCappedUpperBound:](self, "capUtilizationInSeconds:withUpperBoundInError:withCapInError:withCappedUpperBound:", v33, 90.0, 1.0, 30.0);
    v43 = v42;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v44 = objc_opt_class();
      v211[0] = MEMORY[0x1E0C809B0];
      v211[1] = 3221225472;
      v211[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_324;
      v211[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v211[4] = v44;
      v45 = v211;
      if (qword_1ED8853F8 != -1)
        dispatch_once(&qword_1ED8853F8, v45);

      if (byte_1ED885342)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Capped CPU duration=%f"), *(_QWORD *)&v43);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "lastPathComponent");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple didReceiveStopEventWithPayload:]");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "logMessage:fromFile:fromFunction:fromLineNumber:", v46, v49, v50, 884);

        PLLogCommon();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v220 = v46;
          _os_log_debug_impl(&dword_1CAF47000, v51, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v52 = v43 * 0.0277777778;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v53 = objc_opt_class();
      v210[0] = MEMORY[0x1E0C809B0];
      v210[1] = 3221225472;
      v210[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_329;
      v210[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v210[4] = v53;
      v54 = v210;
      if (qword_1ED885400 != -1)
        dispatch_once(&qword_1ED885400, v54);

      if (byte_1ED885343)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cpuSecondsEnd=%f, cpuEnergy=%f"), *(_QWORD *)&v30, v43 * 0.0277777778);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "lastPathComponent");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple didReceiveStopEventWithPayload:]");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "logMessage:fromFile:fromFunction:fromLineNumber:", v55, v58, v59, 887);

        PLLogCommon();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v220 = v55;
          _os_log_debug_impl(&dword_1CAF47000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v183 = v4;
    v208 = 0u;
    v209 = 0u;
    v206 = 0u;
    v207 = 0u;
    objc_msgSend(v15, "overlappingStates");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v206, v218, 16);
    if (v61)
    {
      v62 = v61;
      v188 = *(_QWORD *)v207;
      v63 = 0.0;
      do
      {
        v64 = 0;
        do
        {
          if (*(_QWORD *)v207 != v188)
            objc_enumerationMutation(obj);
          v65 = *(void **)(*((_QWORD *)&v206 + 1) + 8 * v64);
          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v66 = objc_opt_class();
            v205[0] = MEMORY[0x1E0C809B0];
            v205[1] = 3221225472;
            v205[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_334;
            v205[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v205[4] = v66;
            v67 = v205;
            if (qword_1ED885408 != -1)
              dispatch_once(&qword_1ED885408, v67);

            if (byte_1ED885344)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("overlappingState=%@"), v65);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "lastPathComponent");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple didReceiveStopEventWithPayload:]");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "logMessage:fromFile:fromFunction:fromLineNumber:", v68, v71, v72, 893);

              PLLogCommon();
              v73 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v220 = v68;
                _os_log_debug_impl(&dword_1CAF47000, v73, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

            }
          }
          objc_msgSend(v65, "startDate");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "startDate");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "laterDate:", v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v65, "endDate");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          if (v77)
          {
            objc_msgSend(v65, "endDate");
            v78 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "endDate");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "earlierDate:", v79);
            v80 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v15, "endDate");
            v78 = (id)objc_claimAutoreleasedReturnValue();
            v80 = v78;
          }

          objc_msgSend(v80, "timeIntervalSinceDate:", v76);
          v82 = v81;
          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v83 = objc_opt_class();
            v204[0] = MEMORY[0x1E0C809B0];
            v204[1] = 3221225472;
            v204[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_339;
            v204[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v204[4] = v83;
            v84 = v204;
            if (qword_1ED885410 != -1)
              dispatch_once(&qword_1ED885410, v84);

            if (byte_1ED885345)
            {
              v85 = self;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("overlappingState=%@"), v65);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v87 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "lastPathComponent");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple didReceiveStopEventWithPayload:]");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "logMessage:fromFile:fromFunction:fromLineNumber:", v86, v89, v90, 898);

              PLLogCommon();
              v91 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v220 = v86;
                _os_log_debug_impl(&dword_1CAF47000, v91, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              self = v85;
              v15 = v186;
            }
          }
          v63 = v63 + v82;

          ++v64;
        }
        while (v62 != v64);
        v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v206, v218, 16);
      }
      while (v62);
    }
    else
    {
      v63 = 0.0;
    }

    objc_msgSend(v15, "duration");
    v93 = v92;
    v4 = v183;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v94 = objc_opt_class();
      v203[0] = MEMORY[0x1E0C809B0];
      v203[1] = 3221225472;
      v203[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_342;
      v203[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v203[4] = v94;
      v95 = v203;
      if (qword_1ED885418 != -1)
        dispatch_once(&qword_1ED885418, v95);

      if (byte_1ED885346)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SOC duration=%f"), *(_QWORD *)&v93);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "lastPathComponent");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple didReceiveStopEventWithPayload:]");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "logMessage:fromFile:fromFunction:fromLineNumber:", v96, v99, v100, 905);

        PLLogCommon();
        v101 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v220 = v96;
          _os_log_debug_impl(&dword_1CAF47000, v101, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v15 = v186;
      }
    }
    -[PLDuetServiceSimple capUtilizationInSeconds:withUpperBoundInError:withCapInError:withCappedUpperBound:](self, "capUtilizationInSeconds:withUpperBoundInError:withCapInError:withCappedUpperBound:", v93, 90.0, 10.0, 30.0);
    v103 = v102;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v104 = objc_opt_class();
      v202[0] = MEMORY[0x1E0C809B0];
      v202[1] = 3221225472;
      v202[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_347;
      v202[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v202[4] = v104;
      v105 = v202;
      if (qword_1ED885420 != -1)
        dispatch_once(&qword_1ED885420, v105);

      if (byte_1ED885347)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Capped SOC duration=%f"), *(_QWORD *)&v103);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "lastPathComponent");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple didReceiveStopEventWithPayload:]");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "logMessage:fromFile:fromFunction:fromLineNumber:", v106, v109, v110, 910);

        PLLogCommon();
        v111 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v220 = v106;
          _os_log_debug_impl(&dword_1CAF47000, v111, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v15 = v186;
      }
    }
    v112 = v103 * (v103 * 0.00833333333) / (v63 + v103);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v113 = objc_opt_class();
      v201[0] = MEMORY[0x1E0C809B0];
      v201[1] = 3221225472;
      v201[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_352;
      v201[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v201[4] = v113;
      v114 = v201;
      if (qword_1ED885428 != -1)
        dispatch_once(&qword_1ED885428, v114);

      if (byte_1ED885348)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("socEnergy=%f"), *(_QWORD *)&v112);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v116 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "lastPathComponent");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple didReceiveStopEventWithPayload:]");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "logMessage:fromFile:fromFunction:fromLineNumber:", v115, v118, v119, 914);

        PLLogCommon();
        v120 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v220 = v115;
          _os_log_debug_impl(&dword_1CAF47000, v120, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v15 = v186;
      }
    }
    objc_msgSend(v15, "info");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "objectForKeyedSubscript:", CFSTR("pushType"));
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v122, "isEqualToString:", CFSTR("waking")))
      v123 = 0.125;
    else
      v123 = 0.0277777778;

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v124 = objc_opt_class();
      v200[0] = MEMORY[0x1E0C809B0];
      v200[1] = 3221225472;
      v200[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_361;
      v200[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v200[4] = v124;
      v125 = v200;
      if (qword_1ED885430 != -1)
        dispatch_once(&qword_1ED885430, v125);

      if (byte_1ED885349)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wakingNonWakingEnergy=%f"), *(_QWORD *)&v123);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v128, "lastPathComponent");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple didReceiveStopEventWithPayload:]");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "logMessage:fromFile:fromFunction:fromLineNumber:", v126, v129, v130, 918);

        PLLogCommon();
        v131 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v220 = v126;
          _os_log_debug_impl(&dword_1CAF47000, v131, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v15 = v186;
      }
    }
    objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("cellDuration"));
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = (double)objc_msgSend(v132, "integerValue") / 1000.0;
    objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("wifiDuration"));
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = (double)objc_msgSend(v134, "integerValue") / 1000.0 * 0.0611111111 + v133 * 0.222222222;
    objc_msgSend(v184, "objectForKeyedSubscript:", CFSTR("btDuration"));
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = v135 + (double)objc_msgSend(v136, "integerValue") / 1000.0 * 0.0277777778;

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v138 = objc_opt_class();
      v199[0] = MEMORY[0x1E0C809B0];
      v199[1] = 3221225472;
      v199[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_372;
      v199[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v199[4] = v138;
      v139 = v199;
      if (qword_1ED885438 != -1)
        dispatch_once(&qword_1ED885438, v139);

      if (byte_1ED88534A)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("networkEnergy=%f"), *(_QWORD *)&v137);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        v141 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "lastPathComponent");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple didReceiveStopEventWithPayload:]");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v141, "logMessage:fromFile:fromFunction:fromLineNumber:", v140, v143, v144, 925);

        PLLogCommon();
        v145 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v145, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v220 = v140;
          _os_log_debug_impl(&dword_1CAF47000, v145, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v15 = v186;
      }
    }
    -[PLDuetServiceSimple bundleIDToState](self, "bundleIDToState");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "removeObjectForKey:", v185);

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v147 = objc_opt_class();
      v198[0] = MEMORY[0x1E0C809B0];
      v198[1] = 3221225472;
      v198[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_377;
      v198[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v198[4] = v147;
      v148 = v198;
      if (qword_1ED885440 != -1)
        dispatch_once(&qword_1ED885440, v148);

      if (byte_1ED88534B)
      {
        v149 = (void *)MEMORY[0x1E0CB3940];
        -[PLDuetServiceSimple bundleIDToState](self, "bundleIDToState");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "stringWithFormat:", CFSTR("bundleIDToState=%@"), v150);
        v151 = (void *)objc_claimAutoreleasedReturnValue();

        v152 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v153, "lastPathComponent");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple didReceiveStopEventWithPayload:]");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "logMessage:fromFile:fromFunction:fromLineNumber:", v151, v154, v155, 929);

        PLLogCommon();
        v156 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v156, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v220 = v151;
          _os_log_debug_impl(&dword_1CAF47000, v156, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v15 = v186;
      }
    }
    v157 = 0.0;
    if (!-[PLDuetServiceSimple isCharging](self, "isCharging"))
    {
      v158 = v52 + v112 + v123 + v137;
      if (v158 < 0.0)
        v158 = 0.0;
      if (v158 <= 1.4)
        v157 = v158;
      else
        v157 = 1.4;
    }
    -[PLDuetServiceImpl duetService](self, "duetService");
    v159 = objc_claimAutoreleasedReturnValue();
    if (v159)
    {
      v160 = (void *)v159;
      -[PLDuetServiceImpl duetService](self, "duetService");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      v162 = objc_msgSend(v161, "isDebugEnabled");

      if (v162)
      {
        +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("ComplicationEvents"));
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        v164 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("BundleID"), v185, 0);
        v165 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("timestampEnd"), &unk_1E8634CC8, 6);
        -[PLDuetServiceImpl duetService](self, "duetService");
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v166, "storage");
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        v217[0] = v164;
        v217[1] = v165;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v217, 2);
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v167, "lastEntryForKey:withComparisons:isSingleton:", v163, v168, 0);
        v169 = (void *)objc_claimAutoreleasedReturnValue();

        -[PLDuetServiceImpl duetService](self, "duetService");
        v170 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v170, "storage");
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        v190[0] = MEMORY[0x1E0C809B0];
        v190[1] = 3221225472;
        v190[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_378;
        v190[3] = &unk_1E8580AF0;
        v172 = v169;
        v191 = v172;
        v192 = v30;
        v193 = v52;
        v194 = v112;
        v195 = v123;
        v196 = v137;
        v197 = v157;
        objc_msgSend(v171, "updateEntry:withBlock:", v172, v190);

        v4 = v183;
      }
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v173 = objc_opt_class();
      v189[0] = MEMORY[0x1E0C809B0];
      v189[1] = 3221225472;
      v189[2] = __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_2;
      v189[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v189[4] = v173;
      v174 = v189;
      if (qword_1ED885448 != -1)
        dispatch_once(&qword_1ED885448, v174);

      if (byte_1ED88534C)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Returning Sum: %f"), *(_QWORD *)&v157);
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        v176 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "lastPathComponent");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple didReceiveStopEventWithPayload:]");
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v176, "logMessage:fromFile:fromFunction:fromLineNumber:", v175, v178, v179, 957);

        PLLogCommon();
        v180 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v180, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v220 = v175;
          _os_log_debug_impl(&dword_1CAF47000, v180, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v15 = v186;
      }
    }
    v215 = CFSTR("energy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v157);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v216 = v181;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v216, &v215, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88533F = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_316(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885340 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_319(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885341 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_324(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885342 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_329(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885343 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_334(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885344 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_339(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885345 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_342(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885346 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_347(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885347 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_352(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885348 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_361(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885349 = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_372(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88534A = result;
  return result;
}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_377(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88534B = result;
  return result;
}

void __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_378(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, CFSTR("timestampEnd"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, CFSTR("CPUSecondsEnd"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, CFSTR("CPUEnergy"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("SOCEnergy"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, CFSTR("WakingNonWakingEnergy"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, CFSTR("NetworkEnergy"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 80));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, CFSTR("EnergyReturned"));

}

uint64_t __54__PLDuetServiceSimple_didReceiveStopEventWithPayload___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88534C = result;
  return result;
}

- (double)capUtilizationInSeconds:(double)a3 withUpperBoundInError:(double)a4 withCapInError:(double)a5 withCappedUpperBound:(double)a6
{
  if (a3 < a6)
    a6 = a3;
  if (a3 <= a4)
    a5 = a6;
  return fmax(a5, 0.0);
}

- (double)numCPUSecondsForPid:(int)a3
{
  int v3;
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v5 = 0u;
  v3 = proc_pid_rusage(a3, 1, (rusage_info_t *)&v5);
  result = 0.0;
  if (!v3)
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", (_QWORD)v6, 0.0);
  return result;
}

- (double)numCPUSecondsForBundleID:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  double v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  double v44;
  id v46;
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD block[5];
  _QWORD v50[5];
  int buffer;
  void *v52;
  uint8_t __b[4104];
  uint64_t v54;

  v3 = (void *)MEMORY[0x1E0C80A78](self);
  v54 = *MEMORY[0x1E0C80C00];
  v5 = v4;
  v46 = v5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __48__PLDuetServiceSimple_numCPUSecondsForBundleID___block_invoke;
    v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v50[4] = v6;
    if (qword_1ED885450 != -1)
      dispatch_once(&qword_1ED885450, v50);
    if (byte_1ED88534D)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleID=%@"), v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple numCPUSecondsForBundleID:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 972);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__b = 138412290;
        *(_QWORD *)&__b[4] = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", __b, 0xCu);
      }

      v5 = v46;
    }
  }
  objc_msgSend(v3, "duetService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    memset(__b, 255, 0x1000uLL);
    v14 = proc_listpids(1u, 0, __b, 4096);
    if (v14 >= 1)
    {
      v15 = v14;
      v16 = (int *)__b;
      do
      {
        v18 = *v16++;
        v17 = v18;
        if (v18 >= 1)
        {
          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v19 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __48__PLDuetServiceSimple_numCPUSecondsForBundleID___block_invoke_397;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v19;
            if (qword_1ED885458 != -1)
              dispatch_once(&qword_1ED885458, block);
            if (byte_1ED88534E)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pid=%i"), v17);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "lastPathComponent");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple numCPUSecondsForBundleID:]");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 985);

              PLLogCommon();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                buffer = 138412290;
                v52 = v20;
                _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buffer, 0xCu);
              }

            }
          }
          objc_msgSend(v3, "duetService");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "storage");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "processIDEntryForPid:", v17);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("BundleID"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v29)
          {
            objc_msgSend(MEMORY[0x1E0D80078], "bundleIDFromPid:", v17);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v29)
            {
              if (proc_name(v17, &buffer, 0x40u) < 1)
              {
                v29 = 0;
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &buffer);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
              }
            }
          }
          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v30 = objc_opt_class();
            v48[0] = MEMORY[0x1E0C809B0];
            v48[1] = 3221225472;
            v48[2] = __48__PLDuetServiceSimple_numCPUSecondsForBundleID___block_invoke_402;
            v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v48[4] = v30;
            if (qword_1ED885460 != -1)
              dispatch_once(&qword_1ED885460, v48);
            if (byte_1ED88534F)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pidBundleID=%@"), v29);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "lastPathComponent");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple numCPUSecondsForBundleID:]");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v34, v35, 1000);

              PLLogCommon();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
              {
                buffer = 138412290;
                v52 = v31;
                _os_log_debug_impl(&dword_1CAF47000, v36, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buffer, 0xCu);
              }

              v5 = v46;
            }
          }
          if (objc_msgSend(v29, "isEqualToString:", v5))
          {
            objc_msgSend(v3, "numCPUSecondsForPid:", v17);
            v37 = v44;
            goto LABEL_43;
          }

        }
        --v15;
      }
      while (v15);
    }
    v37 = 0.0;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v38 = objc_opt_class();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __48__PLDuetServiceSimple_numCPUSecondsForBundleID___block_invoke_407;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v38;
      if (qword_1ED885468 != -1)
        dispatch_once(&qword_1ED885468, v47);
      if (byte_1ED885350)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("could not find matching pid"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "lastPathComponent");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceSimple numCPUSecondsForBundleID:]");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v41, v42, 1007);

        PLLogCommon();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          buffer = 138412290;
          v52 = v29;
          _os_log_debug_impl(&dword_1CAF47000, v43, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buffer, 0xCu);
        }

        v5 = v46;
LABEL_43:

      }
    }
  }
  else
  {
    v37 = 0.0;
  }

  return v37;
}

uint64_t __48__PLDuetServiceSimple_numCPUSecondsForBundleID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88534D = result;
  return result;
}

uint64_t __48__PLDuetServiceSimple_numCPUSecondsForBundleID___block_invoke_397(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88534E = result;
  return result;
}

uint64_t __48__PLDuetServiceSimple_numCPUSecondsForBundleID___block_invoke_402(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88534F = result;
  return result;
}

uint64_t __48__PLDuetServiceSimple_numCPUSecondsForBundleID___block_invoke_407(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885350 = result;
  return result;
}

- (void)didReceiveReset
{
  id v2;

  -[PLDuetServiceSimple bundleIDToState](self, "bundleIDToState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (NSMutableDictionary)bundleIDToState
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBundleIDToState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (PLXPCListenerOperatorComposition)resetListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setResetListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLEntryNotificationOperatorComposition)chargingListener
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setChargingListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)isCharging
{
  return self->_isCharging;
}

- (void)setIsCharging:(BOOL)a3
{
  self->_isCharging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chargingListener, 0);
  objc_storeStrong((id *)&self->_resetListener, 0);
  objc_storeStrong((id *)&self->_bundleIDToState, 0);
}

@end
