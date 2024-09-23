@implementation PLDuetServiceWithAccounting

- (PLDuetServiceWithAccounting)init
{
  PLDuetServiceWithAccounting *v3;
  PLDuetServiceWithAccounting *v4;
  objc_super v6;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PLDuetServiceWithAccounting;
    v4 = -[PLDuetServiceWithAccounting init](&v6, sel_init);
    -[PLDuetServiceImpl setDuetService:](v4, "setDuetService:", 0);
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = +[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd");
  if (v4 && !v5)
  {
    -[PLDuetServiceImpl setDuetService:](self, "setDuetService:", v4);
    v6 = objc_alloc(MEMORY[0x1E0D80090]);
    v7 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __56__PLDuetServiceWithAccounting_initOperatorDependancies___block_invoke;
    v20[3] = &unk_1EA16CF18;
    v20[4] = self;
    v8 = (void *)objc_msgSend(v6, "initWithOperator:withRegistration:withBlock:", v4, &unk_1EA1D7F90, v20);
    -[PLDuetServiceImpl setEventListener:](self, "setEventListener:", v8);

    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __56__PLDuetServiceWithAccounting_initOperatorDependancies___block_invoke_2;
    v19[3] = &unk_1EA16D1A8;
    v19[4] = self;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80098]), "initWithOperator:withRegistration:withBlock:", v4, &unk_1EA1D7FB8, v19);
    -[PLDuetServiceImpl setEnergyResponder:](self, "setEnergyResponder:", v9);

    objc_msgSend(MEMORY[0x1E0D7FF58], "timeCriterionWithInterval:", 21600.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    objc_msgSend(MEMORY[0x1E0D7FF50], "pluggedInCriterion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v11;
    objc_msgSend(MEMORY[0x1E0D7FF50], "displayOffCriterion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D7FF60], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "workQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __56__PLDuetServiceWithAccounting_initOperatorDependancies___block_invoke_3;
    v18[3] = &unk_1EA16F358;
    v18[4] = self;
    objc_msgSend(v14, "scheduleActivityWithIdentifier:withCriteria:withMustRunCriterion:withQueue:withInterruptBlock:withActivityBlock:", CFSTR("PLDuetService_duetEnergyAccumulator"), v13, 0, v15, 0, v18);

    if ((objc_msgSend(v4, "isDebugEnabled") & 1) != 0
      || objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:ifNotSet:", CFSTR("PLDuetService_test"), 0))
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)testLogEvents, CFSTR("com.apple.powerlogd.PLDuetService.testLogEvents"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v17 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v17, self, (CFNotificationCallback)testReportEnergy, CFSTR("com.apple.powerlogd.PLDuetService.testReportEnergy"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }

  }
}

uint64_t __56__PLDuetServiceWithAccounting_initOperatorDependancies___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveEventWithPayload:", a5);
}

uint64_t __56__PLDuetServiceWithAccounting_initOperatorDependancies___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "energyResponse");
}

uint64_t __56__PLDuetServiceWithAccounting_initOperatorDependancies___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "accumulateWithLastCompletedDate:withNow:", a2, a3);
}

- (void)didReceiveEventWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
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
  uint64_t v34;
  void *v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  int v80;
  void *v81;
  int v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t k;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  void *v96;
  int v97;
  NSObject *v98;
  NSObject *v99;
  NSObject *v100;
  void *v101;
  void *v102;
  NSObject *v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  uint64_t v107;
  uint64_t v108;
  NSObject *v109;
  void *context;
  id v111;
  id obj;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  id v119;
  void *v120;
  void *v121;
  PLDuetServiceWithAccounting *v122;
  char v123;
  char v124[15];
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v143;
  __int16 v144;
  uint64_t v145;
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  uint64_t v150;

  v150 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__PLDuetServiceWithAccounting_didReceiveEventWithPayload___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didReceiveEventWithPayload__defaultOnce != -1)
      dispatch_once(&didReceiveEventWithPayload__defaultOnce, block);
    if (didReceiveEventWithPayload__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("payload=%@"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting didReceiveEventWithPayload:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 181);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  PLLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v12, OS_LOG_TYPE_DEFAULT, "┏ PLDuetService didReceiveEventWithPayload start", buf, 2u);
  }

  if (!v4
    || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("events")),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    PLLogCommon();
    v109 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
      -[PLDuetServiceWithAccounting didReceiveEventWithPayload:].cold.1();
    goto LABEL_91;
  }
  v14 = (void *)MEMORY[0x1DF0A47AC]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDuetServiceImpl duetService](self, "duetService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {
    context = v14;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("events"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v143) = v20;
      _os_log_impl(&dword_1DA9D6000, v18, OS_LOG_TYPE_DEFAULT, "┃ ┏ PLDuetService didReceiveEventWithPayload processing %d events", buf, 8u);

    }
    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    v111 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("events"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v149, 16);
    if (v115)
    {
      v113 = *(_QWORD *)v138;
      v118 = *MEMORY[0x1E0D80380];
      v122 = self;
      v114 = v15;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v138 != v113)
            objc_enumerationMutation(obj);
          v116 = v21;
          v22 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * v21);
          v23 = (void *)objc_opt_new();
          v24 = (void *)objc_opt_class();
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("bundleID"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "mapBundleID:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setBundleID:", v26);

          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("processName"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setProcessName:", v27);

          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("updateType"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setUpdateType:", objc_msgSend(v28, "integerValue"));

          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("childBundleIDToWeight"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setChildBundleIDToWeight:", v29);

          PLLogCommon();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v143 = (uint64_t)v23;
            _os_log_debug_impl(&dword_1DA9D6000, v30, OS_LOG_TYPE_DEBUG, "┃ ┃ ┏ PLDuetService didReceiveEventWithPayload processing event: %@", buf, 0xCu);
          }

          objc_msgSend(v23, "childBundleIDToWeight");
          v31 = objc_claimAutoreleasedReturnValue();
          if (v31
            && (v32 = (void *)v31,
                objc_msgSend(v23, "childBundleIDToWeight"),
                v33 = (void *)objc_claimAutoreleasedReturnValue(),
                v34 = objc_msgSend(v33, "count"),
                v33,
                v32,
                v34))
          {
            v120 = v22;
            objc_msgSend(v23, "bundleID");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("cloudphotod"));

            if (v36)
              v37 = 35;
            else
              v37 = 0;
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v133 = 0u;
            v134 = 0u;
            v135 = 0u;
            v136 = 0u;
            objc_msgSend(v23, "childBundleIDToWeight");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v133, v148, 16);
            if (v40)
            {
              v41 = v40;
              v42 = *(_QWORD *)v134;
              do
              {
                for (i = 0; i != v41; ++i)
                {
                  if (*(_QWORD *)v134 != v42)
                    objc_enumerationMutation(v39);
                  v44 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * i);
                  objc_msgSend(v23, "childBundleIDToWeight");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "objectForKeyedSubscript:", v44);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)objc_opt_class(), "mapBundleID:", v44);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "setObject:forKeyedSubscript:", v46, v47);

                }
                v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v133, v148, 16);
              }
              while (v41);
            }

            objc_msgSend(v23, "setChildBundleIDToWeight:", v38);
            v22 = v120;
            self = v122;
          }
          else
          {
            v37 = 0;
          }
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          PLLogCommon();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("eventIntervals"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "count");
            *(_DWORD *)buf = 67109120;
            LODWORD(v143) = v50;
            _os_log_impl(&dword_1DA9D6000, v48, OS_LOG_TYPE_INFO, "┃ ┃ ┃ ┏ PLDuetService didReceiveEventWithPayload processing %d intervals", buf, 8u);

          }
          v131 = 0u;
          v132 = 0u;
          v129 = 0u;
          v130 = 0u;
          objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("eventIntervals"));
          v119 = (id)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v129, v147, 16);
          if (v51)
          {
            v52 = v51;
            v53 = *(_QWORD *)v130;
            do
            {
              for (j = 0; j != v52; ++j)
              {
                if (*(_QWORD *)v130 != v53)
                  objc_enumerationMutation(v119);
                v55 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * j);
                v56 = (void *)objc_opt_new();
                objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("startDate"));
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "convertFromSystemToMonotonic");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "setStartDate:", v58);

                objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("endDate"));
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "convertFromSystemToMonotonic");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "setEndDate:", v60);

                objc_msgSend(v121, "addObject:", v56);
                PLLogCommon();
                v61 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v143 = (uint64_t)v56;
                  _os_log_debug_impl(&dword_1DA9D6000, v61, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ ┃ PLDuetService didReceiveEventWithPayload new interval:%@", buf, 0xCu);
                }

                if ((_DWORD)v37)
                {
                  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "childBundleIDToWeight");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "startDate");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "endDate");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "createDistributionEventIntervalWithDistributionID:withChildNodeNameToWeight:withStartDate:withEndDate:", v37, v63, v64, v65);

                  self = v122;
                }
                -[PLDuetServiceImpl duetService](self, "duetService");
                v66 = objc_claimAutoreleasedReturnValue();
                if (v66)
                {
                  v67 = (void *)v66;
                  -[PLDuetServiceImpl duetService](self, "duetService");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  v69 = objc_msgSend(v68, "isDebugEnabled");

                  if (v69)
                  {
                    +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:", v118, CFSTR("DuetEvents"));
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v70);
                    objc_msgSend(v23, "bundleID");
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v72)
                      objc_msgSend(v23, "bundleID");
                    else
                      objc_msgSend(v23, "processName");
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v71, "setObject:forKeyedSubscript:", v73, CFSTR("BundleID"));

                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v23, "updateType"));
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v71, "setObject:forKeyedSubscript:", v74, CFSTR("UpdateType"));

                    objc_msgSend(v56, "startDate");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v71, "setObject:forKeyedSubscript:", v75, CFSTR("StartDate"));

                    objc_msgSend(v56, "endDate");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v71, "setObject:forKeyedSubscript:", v76, CFSTR("EndDate"));

                    self = v122;
                    -[PLDuetServiceImpl duetService](v122, "duetService");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v77)
                    {
                      -[PLDuetServiceImpl duetService](v122, "duetService");
                      v78 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v78, "logEntry:", v71);

                    }
                  }
                }

              }
              v52 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v129, v147, 16);
            }
            while (v52);
          }

          PLLogCommon();
          v79 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DA9D6000, v79, OS_LOG_TYPE_INFO, "┃ ┃ ┃ ┗ PLDuetService didReceiveEventWithPayload finished processing intervals", buf, 2u);
          }

          objc_msgSend(v23, "setEventIntervals:", v121);
          v80 = objc_msgSend(v23, "updateType");
          v15 = v114;
          v81 = v114;
          if (v80 == 1 || (v82 = objc_msgSend(v23, "updateType"), v81 = v117, v82 == 2))
            objc_msgSend(v81, "addObject:", v23);
          objc_msgSend(v23, "childBundleIDToWeight");
          v83 = objc_claimAutoreleasedReturnValue();
          if (v83)
          {
            v84 = (void *)v83;
            objc_msgSend(v23, "childBundleIDToWeight");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = objc_msgSend(v85, "count");

            if (v86)
            {
              v127 = 0u;
              v128 = 0u;
              v125 = 0u;
              v126 = 0u;
              objc_msgSend(v23, "childBundleIDToWeight");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v125, v146, 16);
              if (v88)
              {
                v89 = v88;
                v90 = *(_QWORD *)v126;
                do
                {
                  for (k = 0; k != v89; ++k)
                  {
                    if (*(_QWORD *)v126 != v90)
                      objc_enumerationMutation(v87);
                    v92 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * k);
                    v93 = (void *)objc_opt_new();
                    objc_msgSend(v93, "setBundleID:", v92);
                    objc_msgSend(v93, "setProcessName:", v92);
                    objc_msgSend(v93, "setUpdateType:", objc_msgSend(v23, "updateType"));
                    objc_msgSend(v23, "eventIntervals");
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v93, "setEventIntervals:", v94);

                    v95 = objc_msgSend(v93, "updateType");
                    v96 = v114;
                    if (v95 == 1 || (v97 = objc_msgSend(v93, "updateType"), v96 = v117, v97 == 2))
                      objc_msgSend(v96, "addObject:", v93);
                    PLLogCommon();
                    v98 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v143 = (uint64_t)v92;
                      _os_log_debug_impl(&dword_1DA9D6000, v98, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ ╸ PLDuetService didReceiveEventWithPayload childEvent for bundleID:%@", buf, 0xCu);
                    }

                  }
                  v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v125, v146, 16);
                }
                while (v89);
              }

            }
          }
          PLLogCommon();
          v99 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
            -[PLDuetServiceWithAccounting didReceiveEventWithPayload:].cold.3(&v123, v124);

          v21 = v116 + 1;
        }
        while (v116 + 1 != v115);
        v115 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v137, v149, 16);
      }
      while (v115);
    }

    PLLogCommon();
    v100 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA9D6000, v100, OS_LOG_TYPE_DEFAULT, "┃ ┗ PLDuetService didReceiveEventWithPayload processing events completed", buf, 2u);
    }

    -[PLDuetServiceWithAccounting eventTransitionsWithEvents:](self, "eventTransitionsWithEvents:", v15);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDuetServiceWithAccounting eventTransitionsWithEvents:](self, "eventTransitionsWithEvents:", v117);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDuetServiceWithAccounting createQualificationEventsWithEventTransitions:withQualificationID:](self, "createQualificationEventsWithEventTransitions:withQualificationID:", v101, 11);
    PLLogCommon();
    v103 = objc_claimAutoreleasedReturnValue();
    v4 = v111;
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      v104 = objc_msgSend(v101, "count");
      v105 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 134218240;
      v143 = v104;
      v144 = 2048;
      v145 = v105;
      _os_log_impl(&dword_1DA9D6000, v103, OS_LOG_TYPE_DEFAULT, "┃ PLDuetService didReceiveEventWithPayload created %lu disc transitions from %lu events", buf, 0x16u);
    }

    -[PLDuetServiceWithAccounting createQualificationEventsWithEventTransitions:withQualificationID:](self, "createQualificationEventsWithEventTransitions:withQualificationID:", v102, 12);
    PLLogCommon();
    v106 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      v107 = objc_msgSend(v102, "count");
      v108 = objc_msgSend(v117, "count");
      *(_DWORD *)buf = 134218240;
      v143 = v107;
      v144 = 2048;
      v145 = v108;
      _os_log_impl(&dword_1DA9D6000, v106, OS_LOG_TYPE_DEFAULT, "┃ PLDuetService didReceiveEventWithPayload created %lu comp transitions from %lu events", buf, 0x16u);
    }

    objc_autoreleasePoolPop(context);
    PLLogCommon();
    v109 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA9D6000, v109, OS_LOG_TYPE_DEFAULT, "┗ PLDuetService didReceiveEventWithPayload end", buf, 2u);
    }
LABEL_91:

    goto LABEL_92;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[PLDuetServiceWithAccounting didReceiveEventWithPayload:].cold.2();

  objc_autoreleasePoolPop(v14);
LABEL_92:

}

uint64_t __58__PLDuetServiceWithAccounting_didReceiveEventWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didReceiveEventWithPayload__classDebugEnabled = result;
  return result;
}

- (id)eventTransitionsWithEvents:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  NSObject *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  unint64_t v50;
  NSObject *v51;
  NSObject *v52;
  id obj;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  _BYTE v59[15];
  char v60;
  _BYTE v61[15];
  _QWORD block[5];
  _QWORD v63[5];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  _BYTE v69[10];
  __int16 v70;
  uint64_t v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v4, OS_LOG_TYPE_INFO, "┃ ┏ PLDuetService eventTransitionsWithEvents start", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v3;
  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
  if (v56)
  {
    v55 = *(_QWORD *)v65;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v65 != v55)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v6);
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v8 = objc_opt_class();
          v63[0] = MEMORY[0x1E0C809B0];
          v63[1] = 3221225472;
          v63[2] = __58__PLDuetServiceWithAccounting_eventTransitionsWithEvents___block_invoke;
          v63[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v63[4] = v8;
          if (eventTransitionsWithEvents__defaultOnce != -1)
            dispatch_once(&eventTransitionsWithEvents__defaultOnce, v63);
          if (eventTransitionsWithEvents__classDebugEnabled)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("event=%@"), v7);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "lastPathComponent");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting eventTransitionsWithEvents:]");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 308);

            PLLogCommon();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v69 = v9;
              _os_log_debug_impl(&dword_1DA9D6000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        PLLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v69 = v7;
          _os_log_debug_impl(&dword_1DA9D6000, v15, OS_LOG_TYPE_DEBUG, "┃ ┃ ┏ PLDuetService eventTransitionsWithEvents processing event: %@", buf, 0xCu);
        }

        objc_msgSend(v7, "eventIntervals");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v17)
        {
          v57 = v6;
          v18 = 0;
          v19 = 0;
          v20 = 0;
          do
          {
            v21 = v19;
            objc_msgSend(v7, "eventIntervals");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectAtIndex:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            PLLogCommon();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v69 = v19;
              _os_log_debug_impl(&dword_1DA9D6000, v23, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ ┏ PLDuetService eventTransitionsWithEvents processing interval: %@", buf, 0xCu);
            }

            LODWORD(v24) = v20 + 1;
            objc_msgSend(v7, "eventIntervals");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v25, "count") <= (unint64_t)(v20 + 1))
            {
LABEL_28:

            }
            else
            {
              v24 = (int)v24;
              while (1)
              {
                objc_msgSend(v7, "eventIntervals");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "objectAtIndex:", v24);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v19, "intersects:", v27);

                if (!v28)
                  break;
                objc_msgSend(v7, "eventIntervals");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "objectAtIndex:", v24);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "joinWithInterval:", v30);
                v31 = objc_claimAutoreleasedReturnValue();

                PLLogCommon();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 67109634;
                  *(_DWORD *)v69 = v20;
                  *(_WORD *)&v69[4] = 1024;
                  *(_DWORD *)&v69[6] = v24;
                  v70 = 2112;
                  v71 = v31;
                  _os_log_debug_impl(&dword_1DA9D6000, v32, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ ┃ PLDuetService eventTransitionsWithEvents Joining intervals %d-%d, active interval updated: %@", buf, 0x18u);
                }
                v20 = v24;

                ++v24;
                objc_msgSend(v7, "eventIntervals");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = (void *)v31;
                if (objc_msgSend(v25, "count") <= v24)
                {
                  v19 = (void *)v31;
                  goto LABEL_28;
                }
              }
            }
            v20 = v24;
            if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
            {
              v33 = objc_opt_class();
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __58__PLDuetServiceWithAccounting_eventTransitionsWithEvents___block_invoke_137;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              block[4] = v33;
              if (eventTransitionsWithEvents__defaultOnce_135 != -1)
                dispatch_once(&eventTransitionsWithEvents__defaultOnce_135, block);
              if (eventTransitionsWithEvents__classDebugEnabled_136)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("eventInterval=%@"), v19);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "lastPathComponent");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting eventTransitionsWithEvents:]");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v37, v38, 325);

                PLLogCommon();
                v39 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v69 = v34;
                  _os_log_debug_impl(&dword_1DA9D6000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

              }
            }
            v40 = (void *)objc_opt_new();
            objc_msgSend(v19, "startDate");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setDate:", v41);

            objc_msgSend(v7, "bundleID");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setBundleID:", v42);

            objc_msgSend(v40, "setIsStart:", 1);
            objc_msgSend(v5, "addObject:", v40);
            PLLogCommon();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v69 = v40;
              _os_log_impl(&dword_1DA9D6000, v43, OS_LOG_TYPE_INFO, "┃ ┃ ┃ ┃ PLDuetService eventTransitionsWithEvents created start transition: %@", buf, 0xCu);
            }

            v44 = (void *)objc_opt_new();
            objc_msgSend(v19, "endDate");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setDate:", v45);

            objc_msgSend(v7, "bundleID");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setBundleID:", v46);

            objc_msgSend(v44, "setIsStart:", 0);
            objc_msgSend(v5, "addObject:", v44);
            PLLogCommon();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v69 = v44;
              _os_log_impl(&dword_1DA9D6000, v47, OS_LOG_TYPE_INFO, "┃ ┃ ┃ ┃ PLDuetService eventTransitionsWithEvents created end transition: %@", buf, 0xCu);
            }

            PLLogCommon();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
              -[PLDuetServiceWithAccounting eventTransitionsWithEvents:].cold.2(&v60, v61);

            v18 = v20;
            objc_msgSend(v7, "eventIntervals");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "count");

          }
          while (v50 > v20);

          v6 = v57;
        }
        PLLogCommon();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          -[PLDuetServiceWithAccounting eventTransitionsWithEvents:].cold.1(&v58, v59);

        ++v6;
      }
      while (v6 != v56);
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
    }
    while (v56);
  }

  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_14);
  PLLogCommon();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v52, OS_LOG_TYPE_INFO, "┃ ┗ PLDuetService eventTransitionsWithEvents end", buf, 2u);
  }

  return v5;
}

uint64_t __58__PLDuetServiceWithAccounting_eventTransitionsWithEvents___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  eventTransitionsWithEvents__classDebugEnabled = result;
  return result;
}

uint64_t __58__PLDuetServiceWithAccounting_eventTransitionsWithEvents___block_invoke_137(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  eventTransitionsWithEvents__classDebugEnabled_136 = result;
  return result;
}

uint64_t __58__PLDuetServiceWithAccounting_eventTransitionsWithEvents___block_invoke_141(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)createQualificationEventsWithEventTransitions:(id)a3 withQualificationID:(int)a4
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  id obj;
  uint64_t v54;
  _QWORD block[5];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v5, OS_LOG_TYPE_INFO, "┃ ┏ PLDuetService createQualificationEventsWithEventTransitions start", buf, 2u);
  }

  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v61) = v9;
    _os_log_impl(&dword_1DA9D6000, v8, OS_LOG_TYPE_INFO, "┃ ┃ ┏ PLDuetService createQualificationEventsWithEventTransitions processing %d transitions", buf, 8u);
  }

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v4;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v54 = *(_QWORD *)v57;
    v13 = *MEMORY[0x1E0D7FF30];
    v51 = v7;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v57 != v54)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v14);
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v16 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __97__PLDuetServiceWithAccounting_createQualificationEventsWithEventTransitions_withQualificationID___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v16;
          if (createQualificationEventsWithEventTransitions_withQualificationID__defaultOnce != -1)
            dispatch_once(&createQualificationEventsWithEventTransitions_withQualificationID__defaultOnce, block);
          if (createQualificationEventsWithEventTransitions_withQualificationID__classDebugEnabled)
          {
            v17 = v11;
            v18 = v12;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lastEventTransition=%@, eventTransition=%@"), v6, v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "lastPathComponent");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting createQualificationEventsWithEventTransitions:withQualificationID:]");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 362);

            PLLogCommon();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v61 = v19;
              _os_log_debug_impl(&dword_1DA9D6000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v12 = v18;
            v11 = v17;
            v7 = v51;
          }
        }
        PLLogCommon();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v15;
          _os_log_debug_impl(&dword_1DA9D6000, v25, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ PLDuetService createQualificationEventsWithEventTransitions current transition:%@", buf, 0xCu);
        }

        PLLogCommon();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v7;
          _os_log_debug_impl(&dword_1DA9D6000, v26, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ PLDuetService createQualificationEventsWithEventTransitions current eventElements:%@", buf, 0xCu);
        }

        objc_msgSend(v15, "date");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "date");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeIntervalSinceDate:", v28);
        v30 = v29;

        if (v30 > v13)
        {
          objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "allObjects");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "date");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "date");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "createQualificationEventIntervalWithQualificationID:withChildNodeNames:withStartDate:withEndDate:", a4, v32, v33, v34);

          PLLogCommon();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v6, "date");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "timeIntervalSince1970");
            v41 = v40;
            objc_msgSend(v15, "date");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "timeIntervalSince1970");
            v44 = v43;
            objc_msgSend(v15, "date");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "date");
            v46 = v11;
            v47 = v12;
            v12 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "timeIntervalSinceDate:", v12);
            *(_DWORD *)buf = 134218496;
            v61 = v41;
            v62 = 2048;
            v63 = v44;
            v64 = 2048;
            v65 = v48;
            _os_log_debug_impl(&dword_1DA9D6000, v35, OS_LOG_TYPE_DEBUG, "┃ ┃ ┃ PLDuetService createQualificationEventsWithEventTransitions created event with startDate:%f, endDate:%f, timeRange=%f seconds", buf, 0x20u);

            LODWORD(v12) = v47;
            v11 = v46;
            v7 = v51;

          }
          v36 = v15;

          v12 = (v12 + 1);
          v6 = v36;
        }
        v37 = objc_msgSend(v15, "isStart");
        objc_msgSend(v15, "bundleID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
          objc_msgSend(v7, "addObject:", v38);
        else
          objc_msgSend(v7, "removeObject:", v38);

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    }
    while (v11);
  }
  else
  {
    LODWORD(v12) = 0;
  }

  PLLogCommon();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v61) = v12;
    _os_log_impl(&dword_1DA9D6000, v49, OS_LOG_TYPE_INFO, "┃ ┃ ┗ PLDuetService createQualificationEventsWithEventTransitions Created %d qualification events", buf, 8u);
  }

  PLLogCommon();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v50, OS_LOG_TYPE_INFO, "┃ ┗ PLDuetService createQualificationEventsWithEventTransitions end", buf, 2u);
  }

}

uint64_t __97__PLDuetServiceWithAccounting_createQualificationEventsWithEventTransitions_withQualificationID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  createQualificationEventsWithEventTransitions_withQualificationID__classDebugEnabled = result;
  return result;
}

- (id)energyResponse
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _QWORD v33[3];
  _QWORD v34[3];
  uint8_t buf[4];
  void *v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v3, OS_LOG_TYPE_DEFAULT, "┏ PLDuetService energyResponse start", buf, 2u);
  }

  -[PLDuetServiceImpl duetService](self, "duetService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLDuetServiceWithAccounting energyResponseWithQualificationID:](self, "energyResponseWithQualificationID:", 11);
    v5 = objc_claimAutoreleasedReturnValue();
    PLLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[NSObject count](v5, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v36) = v7;
      _os_log_impl(&dword_1DA9D6000, v6, OS_LOG_TYPE_DEFAULT, "┃ PLDuetService discretionaryCumulativeEnergies count: %d", buf, 8u);
    }

    -[PLDuetServiceWithAccounting energyResponseWithQualificationID:](self, "energyResponseWithQualificationID:", 12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PLLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 67109120;
      LODWORD(v36) = v10;
      _os_log_impl(&dword_1DA9D6000, v9, OS_LOG_TYPE_DEFAULT, "┃ PLDuetService complicationCumulativeEnergies count: %d", buf, 8u);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v8);
    v37[0] = CFSTR("BLMEnergyForDuet");
    v37[1] = CFSTR("BLMUUIDForDuet");
    v38[0] = v11;
    -[PLDuetServiceImpl duetService](self, "duetService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "storage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "getLastQualifiedEnergyEventDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[PLDuetServiceWithAccounting energyResponse].cold.2();

    if (v17)
    {
      objc_msgSend(v17, "convertFromMonotonicToSystem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
LABEL_25:

        v34[0] = v11;
        -[PLDuetServiceImpl duetService](self, "duetService", CFSTR("BLMEnergyForDuet"), CFSTR("BLMUUIDForDuet"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "storage");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "uuid");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v33[2] = CFSTR("BLMEnergyResponseTimestamp");
        v34[1] = v30;
        v34[2] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        PLLogCommon();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DA9D6000, v31, OS_LOG_TYPE_DEFAULT, "┗ PLDuetService energyResponse created", buf, 2u);
        }

        goto LABEL_28;
      }
      *(_DWORD *)buf = 138412290;
      v36 = v19;
      v21 = "After converting to system time, energyResponseTimestamp=%@";
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D7FF60], "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastCompletedDateWithIdentifier:", CFSTR("PLDuetService_duetEnergyAccumulator"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "dateByAddingTimeInterval:", -3600.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v25;
        _os_log_impl(&dword_1DA9D6000, v26, OS_LOG_TYPE_INFO, "lastAccumulatedDate=%@", buf, 0xCu);
      }

      objc_msgSend(v25, "convertFromMonotonicToSystem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      PLLogCommon();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v19;
        _os_log_impl(&dword_1DA9D6000, v27, OS_LOG_TYPE_INFO, "After converting to system time, lastAccumulatedDate=%@", buf, 0xCu);
      }

      if (!v19)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        goto LABEL_25;
      *(_DWORD *)buf = 138412290;
      v36 = v19;
      v21 = "energyResponse timestamp is lastAccumulatedDate=%@";
    }
    _os_log_impl(&dword_1DA9D6000, v20, OS_LOG_TYPE_INFO, v21, buf, 0xCu);
    goto LABEL_25;
  }
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[PLDuetServiceWithAccounting energyResponse].cold.1();
  v22 = (void *)MEMORY[0x1E0C9AA70];
LABEL_28:

  return v22;
}

- (id)energyResponseWithQualificationID:(int)a3
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  int v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  NSObject *v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  void *v91;
  void *v92;
  void *v93;
  double v94;
  void *v95;
  NSObject *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  double v101;
  uint64_t j;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  NSObject *v110;
  void *v111;
  double v112;
  NSObject *v113;
  uint64_t v114;
  uint64_t v115;
  NSObject *v116;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  NSObject *v123;
  uint64_t v124;
  id v126;
  id obj;
  uint64_t v128;
  unsigned int v129;
  id v130;
  id v131;
  id v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _QWORD block[5];
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _QWORD v142[5];
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  _QWORD v147[5];
  _QWORD v148[5];
  uint8_t buf[4];
  uint64_t v150;
  __int16 v151;
  double v152;
  __int16 v153;
  uint64_t v154;
  _QWORD v155[3];
  _QWORD v156[3];
  _BYTE v157[128];
  _BYTE v158[128];
  _QWORD v159[3];
  _BYTE v160[128];
  _QWORD v161[4];

  v3 = *(_QWORD *)&a3;
  v161[1] = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v4, OS_LOG_TYPE_INFO, "┃ ┏ PLDuetService energyResponseWithQualificationID start", buf, 2u);
  }

  -[PLDuetServiceImpl duetService](self, "duetService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[PLDuetServiceWithAccounting energyResponseWithQualificationID:].cold.1();
    goto LABEL_79;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    v148[0] = MEMORY[0x1E0C809B0];
    v148[1] = 3221225472;
    v148[2] = __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke;
    v148[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v148[4] = v6;
    if (energyResponseWithQualificationID__defaultOnce != -1)
      dispatch_once(&energyResponseWithQualificationID__defaultOnce, v148);
    if (energyResponseWithQualificationID__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("qualificationID=%i"), v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting energyResponseWithQualificationID:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 444);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  if ((_DWORD)v3 == 11)
  {
    v13 = 1;
    goto LABEL_17;
  }
  if ((_DWORD)v3 != 12)
  {
    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[PLDuetServiceWithAccounting energyResponseWithQualificationID:].cold.2(v14);
LABEL_79:
    v132 = 0;
    goto LABEL_86;
  }
  v13 = 2;
LABEL_17:
  v129 = v13;
  PLLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v150) = v129;
    _os_log_impl(&dword_1DA9D6000, v15, OS_LOG_TYPE_DEFAULT, "┃ ┃ PLDuetService energyResponseWithQualificationID: updateType %d", buf, 8u);
  }

  -[PLDuetServiceImpl duetService](self, "duetService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_opt_class();
  v18 = *MEMORY[0x1E0D80368];
  objc_msgSend(v17, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("DuetEnergyAccumulator"));
  v19 = objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc(MEMORY[0x1E0D80080]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "initWithKey:withValue:withComparisonOperation:", CFSTR("QualificationID"), v21, 0);

  -[PLDuetServiceImpl duetService](self, "duetService");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "storage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = (id)v22;
  v161[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v161, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v19;
  objc_msgSend(v24, "entriesForKey:withComparisons:", v19, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v27 = objc_opt_class();
    v147[0] = MEMORY[0x1E0C809B0];
    v147[1] = 3221225472;
    v147[2] = __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_163;
    v147[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v147[4] = v27;
    if (energyResponseWithQualificationID__defaultOnce_161 != -1)
      dispatch_once(&energyResponseWithQualificationID__defaultOnce_161, v147);
    if (energyResponseWithQualificationID__classDebugEnabled_162)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("accumulatorEntries=%@"), v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "lastPathComponent");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting energyResponseWithQualificationID:]");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 468);

      PLLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  PLLogCommon();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = objc_msgSend(v26, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v150) = v35;
    _os_log_impl(&dword_1DA9D6000, v34, OS_LOG_TYPE_INFO, "┃ ┃ PLDuetService energyResponseWithQualificationID accumulatorEntries count: %d", buf, 8u);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = 0u;
  v144 = 0u;
  v145 = 0u;
  v146 = 0u;
  obj = v26;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v160, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v144;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v144 != v39)
          objc_enumerationMutation(obj);
        v41 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * i);
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("Energy"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("BundleID"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v42, v43);

      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v143, v160, 16);
    }
    while (v38);
  }

  objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", v18, *MEMORY[0x1E0D80168]);
  v44 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FF60], "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "lastCompletedDateWithIdentifier:", CFSTR("PLDuetService_duetEnergyAccumulator"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "dateByAddingTimeInterval:", -3600.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v47)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v48 = objc_alloc(MEMORY[0x1E0D80080]);
  v49 = (void *)MEMORY[0x1E0CB37E8];
  v121 = v47;
  objc_msgSend(v47, "timeIntervalSince1970");
  objc_msgSend(v49, "numberWithDouble:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v48, "initWithKey:withValue:withComparisonOperation:", CFSTR("timestamp"), v50, 2);

  v52 = objc_alloc(MEMORY[0x1E0D80080]);
  v53 = *MEMORY[0x1E0D80180];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v52, "initWithKey:withValue:withComparisonOperation:", v53, v54, 0);

  v56 = objc_alloc(MEMORY[0x1E0D80080]);
  v124 = *MEMORY[0x1E0D80178];
  v57 = objc_msgSend(v56, "initWithKey:withValue:withComparisonOperation:");
  -[PLDuetServiceImpl duetService](self, "duetService");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "storage");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = (void *)v55;
  v120 = (void *)v51;
  v159[0] = v51;
  v159[1] = v55;
  v118 = (void *)v57;
  v159[2] = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v159, 3);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "entriesForKey:withComparisons:", v44, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = 0x1E0D7F000uLL;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v63 = objc_opt_class();
    v142[0] = MEMORY[0x1E0C809B0];
    v142[1] = 3221225472;
    v142[2] = __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_175;
    v142[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v142[4] = v63;
    if (energyResponseWithQualificationID__defaultOnce_173 != -1)
      dispatch_once(&energyResponseWithQualificationID__defaultOnce_173, v142);
    if (energyResponseWithQualificationID__classDebugEnabled_174)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aggregateQualificationEnergyEntries=%@"), v61);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "lastPathComponent");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting energyResponseWithQualificationID:]");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "logMessage:fromFile:fromFunction:fromLineNumber:", v64, v67, v68, 501);

      PLLogCommon();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      v62 = 0x1E0D7F000uLL;
    }
  }
  v122 = (void *)v44;
  PLLogCommon();
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
  {
    v71 = objc_msgSend(v61, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v150) = v71;
    _os_log_impl(&dword_1DA9D6000, v70, OS_LOG_TYPE_INFO, "┃ ┃ PLDuetService energyResponseWithQualificationID aggregateQualificationEnergyEntries count: %d", buf, 8u);
  }

  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v126 = v61;
  v72 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v138, v158, 16);
  v73 = v124;
  if (v72)
  {
    v74 = v72;
    v131 = *(id *)v139;
    v128 = *MEMORY[0x1E0D80170];
    do
    {
      v75 = 0;
      do
      {
        if (*(id *)v139 != v131)
          objc_enumerationMutation(v126);
        v76 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * v75);
        objc_msgSend(MEMORY[0x1E0D7FEE8], "sharedInstance");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "objectForKeyedSubscript:", v73);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "nodeNameForNodeID:", v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(*(id *)(v62 + 4000), "debugEnabled"))
        {
          v80 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_181;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v80;
          if (energyResponseWithQualificationID__defaultOnce_179 != -1)
            dispatch_once(&energyResponseWithQualificationID__defaultOnce_179, block);
          if (energyResponseWithQualificationID__classDebugEnabled_180)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleID=%@"), v79);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "lastPathComponent");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting energyResponseWithQualificationID:]");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "logMessage:fromFile:fromFunction:fromLineNumber:", v81, v84, v85, 508);

            PLLogCommon();
            v86 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v150 = (uint64_t)v81;
              _os_log_debug_impl(&dword_1DA9D6000, v86, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v62 = 0x1E0D7F000;
            v73 = v124;
          }
        }
        if (v79)
        {
          objc_msgSend(v76, "objectForKeyedSubscript:", v128);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "doubleValue");
          v89 = v88 / 1000.0;

          v90 = fmin(v89, 10000.0);
          objc_msgSend(v36, "objectForKeyedSubscript:", v79);
          v91 = (void *)objc_claimAutoreleasedReturnValue();

          v92 = (void *)MEMORY[0x1E0CB37E8];
          if (v91)
          {
            objc_msgSend(v36, "objectForKeyedSubscript:", v79);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "doubleValue");
            objc_msgSend(v92, "numberWithDouble:", v90 + v94);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setObject:forKeyedSubscript:", v95, v79);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v90);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setObject:forKeyedSubscript:", v93, v79);
          }

        }
        ++v75;
      }
      while (v74 != v75);
      v74 = objc_msgSend(v126, "countByEnumeratingWithState:objects:count:", &v138, v158, 16);
    }
    while (v74);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v132 = (id)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v96 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v96, OS_LOG_TYPE_INFO, "┃ ┃ ┏ PLDuetService energyResponseWithQualificationID cumulativeEnergies", buf, 2u);
  }

  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  v97 = v36;
  v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v133, v157, 16);
  if (v98)
  {
    v99 = v98;
    v100 = *(_QWORD *)v134;
    v101 = 0.0;
    do
    {
      for (j = 0; j != v99; ++j)
      {
        if (*(_QWORD *)v134 != v100)
          objc_enumerationMutation(v97);
        v156[0] = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * j);
        v103 = (void *)v156[0];
        v155[0] = CFSTR("bundleID");
        v155[1] = CFSTR("updateType");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v129);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v156[1] = v104;
        v155[2] = CFSTR("energy");
        objc_msgSend(v97, "objectForKeyedSubscript:", v103);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v156[2] = v105;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v156, v155, 3);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "addObject:", v106);

        objc_msgSend(v97, "objectForKeyedSubscript:", v103);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "doubleValue");
        v109 = v108;

        PLLogCommon();
        v110 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v97, "objectForKeyedSubscript:", v103);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "doubleValue");
          *(_DWORD *)buf = 138412546;
          v150 = (uint64_t)v103;
          v151 = 2048;
          v152 = v112;
          _os_log_impl(&dword_1DA9D6000, v110, OS_LOG_TYPE_INFO, "┃ ┃ ┃ PLDuetService energyResponseWithQualificationID cumulativeEnergies %@: %f", buf, 0x16u);

        }
        v101 = v101 + v109;

      }
      v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v133, v157, 16);
    }
    while (v99);
  }
  else
  {
    v101 = 0.0;
  }

  PLLogCommon();
  v113 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
  {
    v114 = objc_msgSend(v132, "count");
    objc_msgSend(v121, "timeIntervalSince1970");
    *(_DWORD *)buf = 134218496;
    v150 = v114;
    v151 = 2048;
    v152 = v101;
    v153 = 2048;
    v154 = v115;
    _os_log_impl(&dword_1DA9D6000, v113, OS_LOG_TYPE_DEFAULT, "┃ ┃ ┗ PLDuetService energyResponseWithQualificationID cumulativeEnergies %lu items with %f since %f", buf, 0x20u);
  }

  PLLogCommon();
  v116 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v116, OS_LOG_TYPE_INFO, "┃ ┗ PLDuetService energyResponseWithQualificationID created", buf, 2u);
  }

  v14 = v123;
LABEL_86:

  return v132;
}

uint64_t __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  energyResponseWithQualificationID__classDebugEnabled = result;
  return result;
}

uint64_t __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_163(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  energyResponseWithQualificationID__classDebugEnabled_162 = result;
  return result;
}

uint64_t __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_175(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  energyResponseWithQualificationID__classDebugEnabled_174 = result;
  return result;
}

uint64_t __65__PLDuetServiceWithAccounting_energyResponseWithQualificationID___block_invoke_181(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  energyResponseWithQualificationID__classDebugEnabled_180 = result;
  return result;
}

- (void)accumulateWithLastCompletedDate:(id)a3 withNow:(id)a4
{
  id v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD block[5];

  v6 = a3;
  v7 = (char *)a4;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (accumulateWithLastCompletedDate_withNow__defaultOnce != -1)
      dispatch_once(&accumulateWithLastCompletedDate_withNow__defaultOnce, block);
    if (accumulateWithLastCompletedDate_withNow__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lastCompletedDate=%@, now=%@"), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 541);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  PLLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:].cold.2(v6, v7, v15);

  -[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:](self, "accumulateWithLastCompletedDate:withNow:withQualificationID:", v6, v7, 11);
  -[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:](self, "accumulateWithLastCompletedDate:withNow:withQualificationID:", v6, v7, 12);
  PLLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:].cold.1();

}

uint64_t __71__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  accumulateWithLastCompletedDate_withNow__classDebugEnabled = result;
  return result;
}

- (void)accumulateWithLastCompletedDate:(id)a3 withNow:(id)a4 withQualificationID:(int)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  char *v16;
  void *v17;
  char *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  double v54;
  NSObject *v55;
  uint64_t v56;
  PLDuetServiceWithAccounting *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  NSObject *v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  id v94;
  PLDuetServiceWithAccounting *v95;
  id v96;
  id obj;
  uint64_t v98;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  _QWORD block[5];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD v113[5];
  void *v114;
  void *v115;
  uint8_t buf[4];
  double v117;
  __int16 v118;
  void *v119;
  __int16 v120;
  void *v121;
  _BYTE v122[128];
  _BYTE v123[128];
  _QWORD v124[7];

  v124[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:].cold.7(a5, v9, v10);

  -[PLDuetServiceImpl duetService](self, "duetService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v95 = self;
    v12 = *MEMORY[0x1E0D80368];
    objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", *MEMORY[0x1E0D80368], *MEMORY[0x1E0D80168]);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingTimeInterval:", -3600.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:].cold.6();

      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    PLLogCommon();
    v16 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG))
      -[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:].cold.5(v14, v16);
    v93 = v7;

    objc_msgSend(v8, "dateByAddingTimeInterval:", -3600.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PLLogCommon();
    v18 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEBUG))
      -[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:].cold.4(v17, v18);

    v19 = objc_alloc(MEMORY[0x1E0D80080]);
    v20 = (void *)MEMORY[0x1E0CB37E8];
    v91 = v14;
    objc_msgSend(v14, "timeIntervalSince1970");
    objc_msgSend(v20, "numberWithDouble:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "initWithKey:withValue:withComparisonOperation:", CFSTR("timestamp"), v21, 2);

    v23 = objc_alloc(MEMORY[0x1E0D80080]);
    v24 = (void *)MEMORY[0x1E0CB37E8];
    v90 = v17;
    objc_msgSend(v17, "timeIntervalSince1970");
    objc_msgSend(v24, "numberWithDouble:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v23, "initWithKey:withValue:withComparisonOperation:", CFSTR("timestamp"), v25, 4);

    v27 = objc_alloc(MEMORY[0x1E0D80080]);
    v28 = *MEMORY[0x1E0D80180];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v27, "initWithKey:withValue:withComparisonOperation:", v28, v29, 0);

    v31 = objc_alloc(MEMORY[0x1E0D80080]);
    v103 = *MEMORY[0x1E0D80178];
    v32 = objc_msgSend(v31, "initWithKey:withValue:withComparisonOperation:");
    -[PLDuetServiceImpl duetService](v95, "duetService");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "storage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = (void *)v26;
    v89 = (void *)v22;
    v124[0] = v22;
    v124[1] = v26;
    v86 = (void *)v32;
    v87 = (void *)v30;
    v124[2] = v30;
    v124[3] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = (void *)v13;
    objc_msgSend(v34, "entriesForKey:withComparisons:", v13, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v94 = v8;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v37 = objc_opt_class();
      v113[0] = MEMORY[0x1E0C809B0];
      v113[1] = 3221225472;
      v113[2] = __91__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow_withQualificationID___block_invoke;
      v113[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v113[4] = v37;
      if (accumulateWithLastCompletedDate_withNow_withQualificationID__defaultOnce != -1)
        dispatch_once(&accumulateWithLastCompletedDate_withNow_withQualificationID__defaultOnce, v113);
      if (accumulateWithLastCompletedDate_withNow_withQualificationID__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aggregateQualificationEnergyEntries=%@"), v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "lastPathComponent");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:]");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "logMessage:fromFile:fromFunction:fromLineNumber:", v38, v41, v42, 590);

        PLLogCommon();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    PLLogCommon();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      -[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:].cold.2(v36, v44);

    -[PLDuetServiceImpl duetService](v95, "duetService");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", v12, CFSTR("DuetEnergyAccumulator"));
    v46 = objc_claimAutoreleasedReturnValue();

    -[PLDuetServiceImpl duetService](v95, "duetService");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "storage");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = (void *)v46;
    objc_msgSend(v48, "entriesForKey:", v46);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    obj = v49;
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v123, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v110;
      do
      {
        for (i = 0; i != v51; ++i)
        {
          if (*(_QWORD *)v110 != v52)
            objc_enumerationMutation(obj);
          v54 = *(double *)(*((_QWORD *)&v109 + 1) + 8 * i);
          PLLogCommon();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v117 = v54;
            _os_log_debug_impl(&dword_1DA9D6000, v55, OS_LOG_TYPE_DEBUG, "┃ ┃ ╸ PLDuetService accumulateWithLastCompletedDate existing entry:%@", buf, 0xCu);
          }

        }
        v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v123, 16);
      }
      while (v51);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v96 = v36;
    v56 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v105, v122, 16);
    v8 = v94;
    v57 = v95;
    if (v56)
    {
      v58 = v56;
      v101 = *(_QWORD *)v106;
      v98 = *MEMORY[0x1E0D80170];
      do
      {
        v59 = 0;
        do
        {
          if (*(_QWORD *)v106 != v101)
            objc_enumerationMutation(v96);
          v60 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v59);
          v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v102, v8);
          objc_msgSend(MEMORY[0x1E0D7FEE8], "sharedInstance");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "objectForKeyedSubscript:", v103);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "nodeNameForNodeID:", v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v65 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __91__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow_withQualificationID___block_invoke_190;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v65;
            if (accumulateWithLastCompletedDate_withNow_withQualificationID__defaultOnce_188 != -1)
              dispatch_once(&accumulateWithLastCompletedDate_withNow_withQualificationID__defaultOnce_188, block);
            if (accumulateWithLastCompletedDate_withNow_withQualificationID__classDebugEnabled_189)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleID=%@"), v64);
              v66 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              v67 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "lastPathComponent");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:]");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "logMessage:fromFile:fromFunction:fromLineNumber:", *(_QWORD *)&v66, v69, v70, 607);

              PLLogCommon();
              v71 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v117 = v66;
                _os_log_debug_impl(&dword_1DA9D6000, v71, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v8 = v94;
              v57 = v95;
            }
          }
          PLLogCommon();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v60, "objectForKeyedSubscript:", v103);
            v80 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("timestamp"));
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v117 = v80;
            v118 = 2112;
            v119 = v64;
            v120 = 2112;
            v121 = v81;
            _os_log_debug_impl(&dword_1DA9D6000, v72, OS_LOG_TYPE_DEBUG, "┃ ┃ ┏ PLDuetService accumulateWithLastCompletedDate entry for nodeID:%@, bundleID:%@, timestamp:%@", buf, 0x20u);

            v57 = v95;
          }

          if (v64)
          {
            objc_msgSend(v61, "setObject:forKeyedSubscript:", v64, CFSTR("BundleID"));
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a5);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "setObject:forKeyedSubscript:", v73, CFSTR("QualificationID"));

            objc_msgSend(v60, "objectForKeyedSubscript:", v98);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "doubleValue");
            v76 = v75 / 1000.0;

            v77 = fmin(v76, 10000.0);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v77);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "setObject:forKeyedSubscript:", v78, CFSTR("Energy"));

            PLLogCommon();
            v79 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              v117 = v77;
              _os_log_debug_impl(&dword_1DA9D6000, v79, OS_LOG_TYPE_DEBUG, "┃ ┃ ┗ PLDuetService accumulateWithLastCompletedDate entry energy:%fmWh", buf, 0xCu);
            }

            objc_msgSend(v100, "addObject:", v61);
          }

          ++v59;
        }
        while (v58 != v59);
        v58 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v105, v122, 16);
      }
      while (v58);
    }

    if (objc_msgSend(v100, "count"))
    {
      -[PLDuetServiceImpl duetService](v57, "duetService");
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      if (v82)
      {
        -[PLDuetServiceImpl duetService](v57, "duetService");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v114 = v102;
        v115 = v100;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v115, &v114, 1);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "logEntries:withGroupID:", v84, v102);

      }
    }
    PLLogCommon();
    v85 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
      -[PLDuetServiceWithAccounting accumulateWithLastCompletedDate:withNow:withQualificationID:].cold.1();

    v7 = v93;
  }

}

uint64_t __91__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow_withQualificationID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  accumulateWithLastCompletedDate_withNow_withQualificationID__classDebugEnabled = result;
  return result;
}

uint64_t __91__PLDuetServiceWithAccounting_accumulateWithLastCompletedDate_withNow_withQualificationID___block_invoke_190(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  accumulateWithLastCompletedDate_withNow_withQualificationID__classDebugEnabled_189 = result;
  return result;
}

+ (id)mapBundleID:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = mapBundleID__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&mapBundleID__onceToken, &__block_literal_global_191);
  objc_msgSend((id)mapBundleID__daemonBundleIDToName, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v4;
  v7 = v5;

  return v7;
}

void __43__PLDuetServiceWithAccounting_mapBundleID___block_invoke()
{
  void *v0;

  v0 = (void *)mapBundleID__daemonBundleIDToName;
  mapBundleID__daemonBundleIDToName = (uint64_t)&unk_1EA1D7FE0;

}

- (void)didReceiveEventWithPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "┗ PLDuetService didReceiveEventWithPayload end: Invalid payload", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)didReceiveEventWithPayload:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "┗ PLDuetService didReceiveEventWithPayload end: duetService not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)didReceiveEventWithPayload:(_BYTE *)a1 .cold.3(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_9_2(a1, a2);
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, v2, (uint64_t)v2, "┃ ┃ ┗ PLDuetService didReceiveEventWithPayload finished processing event", v3);
}

- (void)eventTransitionsWithEvents:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_9_2(a1, a2);
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, v2, (uint64_t)v2, "┃ ┃ ┗ PLDuetService eventTransitionsWithEvents finished processing event", v3);
}

- (void)eventTransitionsWithEvents:(_BYTE *)a1 .cold.2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_9_2(a1, a2);
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, v2, (uint64_t)v2, "┃ ┃ ┃ ┗ PLDuetService eventTransitionsWithEvents finished processing interval", v3);
}

- (void)energyResponse
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "lastQualifiedDate=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)energyResponseWithQualificationID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "┃ ┗ PLDuetService energyResponseWithQualificationID: duetService not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)energyResponseWithQualificationID:(os_log_t)log .cold.2(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = 0;
  _os_log_error_impl(&dword_1DA9D6000, log, OS_LOG_TYPE_ERROR, "┃ ┗ PLDuetService energyResponseWithQualificationID: unexpected updateType %d", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_6();
}

- (void)accumulateWithLastCompletedDate:withNow:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, v0, v1, "┗ PLDuetService accumulateWithLastCompletedDate end", v2);
  OUTLINED_FUNCTION_6();
}

- (void)accumulateWithLastCompletedDate:(NSObject *)a3 withNow:.cold.2(void *a1, char *a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;

  OUTLINED_FUNCTION_11_3(a1, a2);
  v6 = v5;
  objc_msgSend(a2, "timeIntervalSince1970");
  v9 = 134218240;
  v10 = v6;
  v11 = 2048;
  v12 = v7;
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, a3, v8, "┏ PLDuetService accumulateWithLastCompletedDate start, lastCompletedDate=%f, now=%f", (uint8_t *)&v9);
}

- (void)accumulateWithLastCompletedDate:withNow:withQualificationID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, v0, v1, "┃ ┗ PLDuetService accumulateWithLastCompletedDate end", v2);
  OUTLINED_FUNCTION_6();
}

- (void)accumulateWithLastCompletedDate:(void *)a1 withNow:(NSObject *)a2 withQualificationID:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4[0] = 67109120;
  v4[1] = objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_7_2(&dword_1DA9D6000, a2, v3, "┃ ┃ PLDuetService accumulateWithLastCompletedDate %d aggregate entries found", (uint8_t *)v4);
  OUTLINED_FUNCTION_1();
}

- (void)accumulateWithLastCompletedDate:(void *)a1 withNow:(char *)a2 withQualificationID:.cold.4(void *a1, char *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  OUTLINED_FUNCTION_11_3(a1, a2);
  v5 = 134217984;
  v6 = v3;
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "┃ ┃ PLDuetService accumulateWithLastCompletedDate lastBucketToAccumulate=%f", (uint8_t *)&v5);
  OUTLINED_FUNCTION_8_0();
}

- (void)accumulateWithLastCompletedDate:(void *)a1 withNow:(char *)a2 withQualificationID:.cold.5(void *a1, char *a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  OUTLINED_FUNCTION_11_3(a1, a2);
  v5 = 134217984;
  v6 = v3;
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "┃ ┃ PLDuetService accumulateWithLastCompletedDate lastBucketAlreadyAccumulated=%f", (uint8_t *)&v5);
  OUTLINED_FUNCTION_8_0();
}

- (void)accumulateWithLastCompletedDate:withNow:withQualificationID:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, v0, v1, "┃ ┃ PLDuetService accumulateWithLastCompletedDate !lastBucketAlreadyAccumulated", v2);
  OUTLINED_FUNCTION_6();
}

- (void)accumulateWithLastCompletedDate:(int)a1 withNow:(NSObject *)a2 withQualificationID:(uint64_t)a3 .cold.7(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_7_2(&dword_1DA9D6000, a2, a3, "┃ ┏ PLDuetService accumulateWithLastCompletedDate start for qualificationID:%d", (uint8_t *)v3);
  OUTLINED_FUNCTION_6();
}

@end
