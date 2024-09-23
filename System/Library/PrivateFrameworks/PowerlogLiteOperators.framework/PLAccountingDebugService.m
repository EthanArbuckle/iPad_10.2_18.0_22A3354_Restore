@implementation PLAccountingDebugService

- (NSArray)testNames
{
  NSArray *testNames;

  testNames = self->_testNames;
  if (!testNames)
  {
    self->_testNames = (NSArray *)&unk_1E8650168;
    testNames = self->_testNames;
  }
  return testNames;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingDebugService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLAccountingDebugService)init
{
  PLAccountingDebugService *v3;
  PLAccountingDebugService *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  __CFNotificationCenter *DarwinNotifyCenter;
  PLAccountingDebugService *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0
    || !objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:ifNotSet:", CFSTR("PLAccountingDebugService_Debug"), 0))
  {
    v12 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PLAccountingDebugService;
    v3 = -[PLOperator init](&v18, sel_init);
    v4 = v3;
    if (v3)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      -[PLAccountingDebugService testNames](v3, "testNames", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v15;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v15 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(CFSTR("com.apple.powerlogd.accounting."), "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9));
            v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)NotificationCallback_0, v10, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
        }
        while (v7);
      }

    }
    self = v4;
    v12 = self;
  }

  return v12;
}

- (void)testDistribution1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
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
  NSObject *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testDistribution1]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 148);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v25 = 138412290;
    v26 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v25, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, &unk_1E864C030, v11);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App1"), 0.5);
  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App2"), 0.5);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 3.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, &unk_1E864C058, v13);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App1"), 1.0);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 10, v15, 3.0);

  -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", 10, 3.0);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 2.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 10, v17, 4.0);

  -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", 10, 4.0);
  objc_msgSend(&unk_1E8650180, "objectAtIndexedSubscript:", 10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", v18, 10, 0.000833333333, 0.001);

  -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", CFSTR("App1"), 10, 0.000416666667, 0.001);
  -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", CFSTR("App2"), 10, 0.000416666667, 0.001);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lastPathComponent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testDistribution1]");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 197);

  PLLogCommon();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v25 = 138412290;
    v26 = v19;
    _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v25, 0xCu);
  }

}

- (void)testDistribution2
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
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
  NSObject *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testDistribution2]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 202);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v24 = 138412290;
    v25 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v24, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 3.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", 2, v11, v12, 5.0);

  -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", 2, 5.0);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createDistributionEventBackwardWithDistributionID:withChildNodeNameToWeight:withEndDate:", 33, &unk_1E864C080, v14);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 33, CFSTR("App1"), 1.0);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 4.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "createDistributionEventBackwardWithDistributionID:withChildNodeNameToWeight:withEndDate:", 33, &unk_1E864C0A8, v16);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 33, CFSTR("App1"), 0.75);
  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 33, CFSTR("App2"), 0.25);
  objc_msgSend(&unk_1E8650198, "objectAtIndexedSubscript:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", v17, 2, 0.00277777778, 0.001);

  -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", CFSTR("App1"), 2, 0.00208333333, 0.001);
  -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", CFSTR("App2"), 2, 0.000694444444, 0.001);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lastPathComponent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testDistribution2]");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 247);

  PLLogCommon();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v24 = 138412290;
    v25 = v18;
    _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v24, 0xCu);
  }

}

- (void)testDistribution3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
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
  NSObject *v23;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testDistribution3]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 252);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v24 = 138412290;
    v25 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v24, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 5.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", 2, v11, v12, 8.0);

  -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", 2, 8.0);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createDistributionEventBackwardWithDistributionID:withChildNodeNameToWeight:withEndDate:", 33, &unk_1E864C0D0, v14);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 33, CFSTR("App1"), 1.0);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 10.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "createDistributionEventBackwardWithDistributionID:withChildNodeNameToWeight:withEndDate:", 33, &unk_1E864C0F8, v16);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 33, CFSTR("kernel_task"), 0.5);
  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 33, CFSTR("App1"), 0.5);
  objc_msgSend(&unk_1E86501B0, "objectAtIndexedSubscript:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", v17, 2, 0.0111111111, 0.001);

  -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", CFSTR("kernel_task"), 2, 0.00444444444, 0.001);
  -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", CFSTR("App1"), 2, 0.00666666667, 0.001);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lastPathComponent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testDistribution3]");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 296);

  PLLogCommon();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v24 = 138412290;
    v25 = v18;
    _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v24, 0xCu);
  }

}

- (void)testDistribution4
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  double v10;
  int i;
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
  NSObject *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testDistribution4]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 301);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v23 = 138412290;
    v24 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v23, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0.0;
  for (i = 1; i != 12; ++i)
  {
    objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingTimeInterval:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 10, v13, (double)i);

    -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", 10, (double)i);
    objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingTimeInterval:", v10 + 0.5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, &unk_1E864C120, v15);

    -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App1"), 0.75);
    -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App2"), 0.25);
    v10 = v10 + 1.0;
  }
  objc_msgSend(&unk_1E86501C8, "objectAtIndexedSubscript:", 10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", v16, 10, 0.0152777778, 0.001);

  -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", CFSTR("App1"), 10, 0.0113541667, 0.001);
  -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", CFSTR("App2"), 10, 0.00378472222, 0.001);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lastPathComponent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testDistribution4]");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 341);

  PLLogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v23 = 138412290;
    v24 = v17;
    _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v23, 0xCu);
  }

}

- (void)testDistribution5
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
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
  NSObject *v30;
  int v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testDistribution5]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 346);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v31 = 138412290;
    v32 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v31, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 11, v11, 5.0);

  -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", 11, 5.0);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 5.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 11, v13, 10.0);

  -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", 11, 10.0);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createDistributionEventPointWithDistributionID:withChildNodeNameToWeight:withStartDate:", 4, &unk_1E864C148, v15);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 4, CFSTR("App1"), 1.0);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 2.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createDistributionEventPointWithDistributionID:withChildNodeNameToWeight:withStartDate:", 4, &unk_1E864C170, v17);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 4, CFSTR("App1"), 1.0);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 4.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "createDistributionEventPointWithDistributionID:withChildNodeNameToWeight:withStartDate:", 4, &unk_1E864C198, v19);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 4, CFSTR("App2"), 1.0);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 6.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "createDistributionEventPointWithDistributionID:withChildNodeNameToWeight:withStartDate:", 4, &unk_1E864C1C0, v21);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 4, CFSTR("App2"), 1.0);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 3, &unk_1E864C1E8, v23);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 3, CFSTR("apsd"), 0.5);
  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 3, CFSTR("App1"), 0.5);
  objc_msgSend(&unk_1E86501E0, "objectAtIndexedSubscript:", 11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", v24, 11, 0.0138888889, 0.001);

  -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", CFSTR("apsd"), 11, 0.00694444444, 0.001);
  -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", CFSTR("App1"), 11, 0.0115740741, 0.001);
  -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", CFSTR("App2"), 11, 0.00231481481, 0.001);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lastPathComponent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testDistribution5]");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 421);

  PLLogCommon();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    v31 = 138412290;
    v32 = v25;
    _os_log_debug_impl(&dword_1CAF47000, v30, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v31, 0xCu);
  }

}

- (void)testCorrection1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testCorrection1]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 426);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v61 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addPowerMeasurementEventIntervalWithPower:withStartDate:withEndDate:", v11, v12, 5.0);

  objc_msgSend(MEMORY[0x1E0D7FED8], "deviceRootNodeIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v14, "removeObject:", &unk_1E86334E0);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  v49 = v15;
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v55;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v55 != v18)
          objc_enumerationMutation(v15);
        v20 = objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "intValue");
        objc_msgSend(&unk_1E86501F8, "objectAtIndexedSubscript:", (int)v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "intValue");

        switch(v22)
        {
          case 3:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = 1.0;
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", v20, v26, v28, 1.0);

            v15 = v49;
            break;
          case 2:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v20, v30, 0.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v20, 0.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = 1.0;
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v20, v26, 1.0);
            break;
          case 1:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v20, v24, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v20, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = 2.0;
            objc_msgSend(v25, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v20, v26, 2.0);
            break;
          default:
            v43 = v15;
            goto LABEL_27;
        }

        -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v20, v27);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      if (v17)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 10, v32, 1.0);

  -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", 10, 1.0);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 10, v34, 2.0);

  -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", 10, 2.0);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v35 = v15;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v51 != v38)
          objc_enumerationMutation(v35);
        v40 = objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * j), "intValue");
        objc_msgSend(&unk_1E8650210, "objectAtIndexedSubscript:", (int)v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", v41, v40, (5.0 / (double)(unint64_t)(objc_msgSend(v35, "count") + 1) + -1.0) / 3600.0);

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v37);
  }

  objc_msgSend(&unk_1E8650228, "objectAtIndexedSubscript:", 10);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", v42, 10, (5.0 / (double)(unint64_t)(objc_msgSend(v35, "count") + 1) + -1.0) / 3600.0);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "lastPathComponent");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testCorrection1]");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "logMessage:fromFile:fromFunction:fromLineNumber:", v43, v46, v47, 518);

  PLLogCommon();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v61 = v43;
    _os_log_debug_impl(&dword_1CAF47000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  v15 = v49;
LABEL_27:

}

- (void)testCorrection2
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
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
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint8_t v66[128];
  uint8_t buf[4];
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testCorrection2]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 522);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v68 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addPowerMeasurementEventIntervalWithPower:withStartDate:withEndDate:", v11, v12, 5.0);

  objc_msgSend(MEMORY[0x1E0D7FED8], "deviceRootNodeIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v14, "removeObject:", &unk_1E8633540);
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  v56 = v15;
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v62;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v62 != v18)
          objc_enumerationMutation(v15);
        v20 = objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "intValue");
        objc_msgSend(&unk_1E8650240, "objectAtIndexedSubscript:", (int)v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "intValue");

        switch(v22)
        {
          case 3:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", v20, v31, v32, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v20, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 2.0;
            objc_msgSend(v9, "dateByAddingTimeInterval:", 2.0);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", v20, v28, v33, 2.0);

            v15 = v56;
            break;
          case 2:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v20, v35, 0.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v20, 0.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v20, v37, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v20, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 2.0;
            objc_msgSend(v9, "dateByAddingTimeInterval:", 2.0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v20, v28, 2.0);
            break;
          case 1:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v20, v24, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v20, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v20, v26, 2.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v20, 2.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 2.0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 3.0;
            objc_msgSend(v27, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v20, v28, 3.0);
            break;
          default:
            v50 = v15;
            goto LABEL_27;
        }

        -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v20, v29);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
      if (v17)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 3.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", 2, v39, v40, 1.0);

  -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", 2, 1.0);
  v41 = objc_msgSend(v15, "count");
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v42 = v15;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v58 != v45)
          objc_enumerationMutation(v42);
        v47 = objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "intValue");
        objc_msgSend(&unk_1E8650258, "objectAtIndexedSubscript:", (int)v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", v48, v47, (5.0 / (double)(unint64_t)(v41 + 1) + -1.0) / 3600.0);

      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
    }
    while (v44);
  }

  objc_msgSend(&unk_1E8650270, "objectAtIndexedSubscript:", 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", v49, 2, 0.0);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "lastPathComponent");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testCorrection2]");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "logMessage:fromFile:fromFunction:fromLineNumber:", v50, v53, v54, 629);

  PLLogCommon();
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v68 = v50;
    _os_log_debug_impl(&dword_1CAF47000, v55, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  v15 = v56;
LABEL_27:

}

- (void)testCorrection3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
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
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  uint8_t v73[128];
  uint8_t buf[4];
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testCorrection3]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 633);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v75 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addPowerMeasurementEventIntervalWithPower:withStartDate:withEndDate:", v11, v12, 5.0);

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 3.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addPowerMeasurementEventIntervalWithPower:withStartDate:withEndDate:", v14, v15, 5.0);

  objc_msgSend(MEMORY[0x1E0D7FED8], "deviceRootNodeIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  objc_msgSend(v17, "removeObject:", &unk_1E8633540);
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
  v63 = v18;
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v69;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v69 != v21)
          objc_enumerationMutation(v18);
        v23 = objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * i), "intValue");
        objc_msgSend(&unk_1E8650288, "objectAtIndexedSubscript:", (int)v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "intValue");

        switch(v25)
        {
          case 3:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", v23, v34, v35, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v23, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = 2.0;
            objc_msgSend(v9, "dateByAddingTimeInterval:", 2.0);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", v23, v31, v36, 2.0);

            v18 = v63;
            break;
          case 2:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v23, v38, 0.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v23, 0.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v23, v40, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v23, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = 2.0;
            objc_msgSend(v9, "dateByAddingTimeInterval:", 2.0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v23, v31, 2.0);
            break;
          case 1:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v23, v27, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v23, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v23, v29, 2.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v23, 2.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 2.0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = 3.0;
            objc_msgSend(v30, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v23, v31, 3.0);
            break;
          default:
            v57 = v18;
            goto LABEL_27;
        }

        -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v23, v32);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v68, v73, 16);
      if (v20)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", 2, v42, v43, 2.0);

  -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", 2, 2.0);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "createDistributionEventBackwardWithDistributionID:withChildNodeNameToWeight:withEndDate:", 33, &unk_1E864C210, v45);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 33, CFSTR("kernel_task"), 0.5);
  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 33, CFSTR("App1"), 0.5);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 4.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "createDistributionEventBackwardWithDistributionID:withChildNodeNameToWeight:withEndDate:", 33, &unk_1E864C238, v47);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 33, CFSTR("kernel_task"), 0.5);
  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 33, CFSTR("App1"), 0.5);
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v48 = v18;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v65;
    do
    {
      for (j = 0; j != v50; ++j)
      {
        if (*(_QWORD *)v65 != v51)
          objc_enumerationMutation(v48);
        v53 = objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "intValue");
        objc_msgSend(&unk_1E86502A0, "objectAtIndexedSubscript:", (int)v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", v54, v53, (5.0 / (double)(unint64_t)(objc_msgSend(v48, "count") + 2) + -1.0) / 3600.0);

      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
    }
    while (v50);
  }

  objc_msgSend(&unk_1E86502B8, "objectAtIndexedSubscript:", 2);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v48, "count");
  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", v55, 2, (5.0 / (double)(unint64_t)(v56 + 2) + -1.0 + 5.0 / (double)(unint64_t)(v56 + 2) + -1.0) / 3600.0);

  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", CFSTR("kernel_task"), 2, (5.0 / (double)(unint64_t)(objc_msgSend(v48, "count") + 2) + -1.0) / 3600.0);
  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", CFSTR("App1"), 2, (5.0 / (double)(unint64_t)(objc_msgSend(v48, "count") + 2) + -1.0) * 3.0 * 0.5 / 3600.0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "lastPathComponent");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testCorrection3]");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "logMessage:fromFile:fromFunction:fromLineNumber:", v57, v60, v61, 780);

  PLLogCommon();
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v75 = v57;
    _os_log_debug_impl(&dword_1CAF47000, v62, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  v18 = v63;
LABEL_27:

}

- (void)testCorrection4
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
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
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint8_t v65[128];
  uint8_t buf[4];
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testCorrection4]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 785);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v67 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addPowerMeasurementEventIntervalWithPower:withStartDate:withEndDate:", v11, v12, 5.0);

  objc_msgSend(MEMORY[0x1E0D7FED8], "deviceRootNodeIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
  v55 = v15;
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v61;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v61 != v18)
          objc_enumerationMutation(v15);
        v20 = objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "intValue");
        objc_msgSend(&unk_1E86502D0, "objectAtIndexedSubscript:", (int)v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "intValue");

        switch(v22)
        {
          case 3:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 1.0;
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", v20, v31, v32, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v20, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 2.0);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", v20, v28, v33, 1.0);

            v15 = v55;
            break;
          case 2:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v20, v35, 0.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v20, 0.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v20, v37, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v20, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 2.0;
            objc_msgSend(v9, "dateByAddingTimeInterval:", 2.0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v20, v28, 2.0);
            break;
          case 1:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v20, v24, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v20, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v20, v26, 2.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v20, 2.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 2.0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 3.0;
            objc_msgSend(v27, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v20, v28, 3.0);
            break;
          default:
            v49 = v15;
            goto LABEL_27;
        }

        -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v20, v29);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      if (v17)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, &unk_1E864C260, v39);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App1"), 0.5);
  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App2"), 0.5);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 3.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, &unk_1E864C288, v41);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App1"), 0.5);
  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App2"), 0.5);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v42 = v15;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v44; ++j)
      {
        if (*(_QWORD *)v57 != v45)
          objc_enumerationMutation(v42);
        v47 = objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * j), "intValue");
        objc_msgSend(&unk_1E86502E8, "objectAtIndexedSubscript:", (int)v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", v48, v47, (5.0 / (double)(unint64_t)objc_msgSend(v42, "count") + -1.0) / 3600.0);

      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    }
    while (v44);
  }

  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", CFSTR("App1"), 10, (5.0 / (double)(unint64_t)objc_msgSend(v42, "count") + -1.0) * 0.5 / 3600.0);
  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", CFSTR("App2"), 10, (5.0 / (double)(unint64_t)objc_msgSend(v42, "count") + -1.0) * 0.5 / 3600.0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "lastPathComponent");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testCorrection4]");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "logMessage:fromFile:fromFunction:fromLineNumber:", v49, v52, v53, 911);

  PLLogCommon();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v67 = v49;
    _os_log_debug_impl(&dword_1CAF47000, v54, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  v15 = v55;
LABEL_27:

}

- (void)testQualification1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
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
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  id v44;
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
  id v63;
  PLAccountingDebugService *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint8_t v75[128];
  uint8_t buf[4];
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testQualification1]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 916);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v77 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FED8], "allQualificationIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "removeObject:", &unk_1E8633540);
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
  v63 = v11;
  v64 = self;
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v71;
LABEL_5:
    v15 = 0;
    while (2)
    {
      if (*(_QWORD *)v71 != v14)
        objc_enumerationMutation(v11);
      v16 = objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * v15), "intValue");
      objc_msgSend(&unk_1E8650300, "objectAtIndexedSubscript:", (int)v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "intValue");

      switch(v18)
      {
        case 1:
          objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "dateByAddingTimeInterval:", 0.0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", v16, &unk_1E8650318, v20);

          -[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:](v64, "verifyLastQualificationEventWithQualificationID:withNodeName:", v16, CFSTR("__GLOBAL__"));
          self = v64;
          objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "dateByAddingTimeInterval:", 5.0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", v16, &unk_1E8650330, v22);
          goto LABEL_13;
        case 2:
          objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "dateByAddingTimeInterval:", 0.0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "createQualificationEventBackwardWithQualificationID:withChildNodeNames:withEndDate:", v16, &unk_1E8650348, v24);

          -[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:](v64, "verifyLastQualificationEventWithQualificationID:withNodeName:", v16, CFSTR("__GLOBAL__"));
          self = v64;
          objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "dateByAddingTimeInterval:", 5.0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "createQualificationEventBackwardWithQualificationID:withChildNodeNames:withEndDate:", v16, &unk_1E8650360, v22);
          goto LABEL_13;
        case 3:
          objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "dateByAddingTimeInterval:", 0.0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "dateByAddingTimeInterval:", 5.0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "createQualificationEventIntervalWithQualificationID:withChildNodeNames:withStartDate:withEndDate:", v16, &unk_1E8650378, v22, v25);

          v11 = v63;
          goto LABEL_13;
        case 4:
          objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "dateByAddingTimeInterval:", 1.0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "createQualificationEventPointWithQualificationID:withChildNodeNames:withStartDate:", v16, &unk_1E8650390, v22);
LABEL_13:

          -[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:](self, "verifyLastQualificationEventWithQualificationID:withNodeName:", v16, CFSTR("__GLOBAL__"));
          if (v13 != ++v15)
            continue;
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
          if (!v13)
            goto LABEL_15;
          goto LABEL_5;
        default:
          v29 = v11;
          goto LABEL_34;
      }
    }
  }
LABEL_15:

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "dateByAddingTimeInterval:", 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "dateByAddingTimeInterval:", 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addPowerMeasurementEventIntervalWithPower:withStartDate:withEndDate:", v27, v28, 5.0);

  objc_msgSend(MEMORY[0x1E0D7FED8], "deviceRootNodeIDs");
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v67;
    while (2)
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v67 != v32)
          objc_enumerationMutation(v29);
        v34 = objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "intValue");
        objc_msgSend(&unk_1E86503A8, "objectAtIndexedSubscript:", (int)v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "intValue");

        switch(v36)
        {
          case 3:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "dateByAddingTimeInterval:", 0.0);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = 1.0;
            objc_msgSend(v65, "dateByAddingTimeInterval:", 1.0);
            v44 = v29;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", v34, v42, v45, 1.0);

            v29 = v44;
            break;
          case 2:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "dateByAddingTimeInterval:", 0.0);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v34, v47, 0.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](v64, "verifyLastPowerEventWithRootNodeID:withPower:", v34, 0.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "dateByAddingTimeInterval:", 1.0);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v34, v49, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](v64, "verifyLastPowerEventWithRootNodeID:withPower:", v34, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = 2.0;
            objc_msgSend(v65, "dateByAddingTimeInterval:", 2.0);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v34, v42, 2.0);
            break;
          case 1:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "dateByAddingTimeInterval:", 0.0);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v34, v38, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](v64, "verifyLastPowerEventWithRootNodeID:withPower:", v34, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "dateByAddingTimeInterval:", 1.0);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v34, v40, 2.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](v64, "verifyLastPowerEventWithRootNodeID:withPower:", v34, 2.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "dateByAddingTimeInterval:", 2.0);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = 3.0;
            objc_msgSend(v41, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v34, v42, 3.0);
            break;
          default:
            v57 = v29;
            goto LABEL_33;
        }

        -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](v64, "verifyLastPowerEventWithRootNodeID:withPower:", v34, v43);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      if (v31)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "dateByAddingTimeInterval:", 0.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, &unk_1E864C2B0, v51);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](v64, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App1"), 0.5);
  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](v64, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App2"), 0.5);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "dateByAddingTimeInterval:", 3.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, &unk_1E864C2D8, v53);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](v64, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App1"), 0.5);
  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](v64, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App2"), 0.5);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "dateByAddingTimeInterval:", 0.0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 2, &unk_1E86503C0, v55);

  objc_msgSend(&unk_1E86503D8, "objectAtIndexedSubscript:", 10);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](v64, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", v56, 10, v65, 0.0);

  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](v64, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", CFSTR("App1"), 10, v65, 5.0 / (double)(unint64_t)objc_msgSend(v29, "count") * 0.5 / 3600.0);
  -[PLAccountingDebugService verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:](v64, "verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:", 2, 10, CFSTR("App1"), v65, 5.0 / (double)(unint64_t)objc_msgSend(v29, "count") * 0.5 / 3600.0);
  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](v64, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", CFSTR("App2"), 10, v65, 5.0 / (double)(unint64_t)objc_msgSend(v29, "count") * 0.5 / 3600.0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "lastPathComponent");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testQualification1]");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "logMessage:fromFile:fromFunction:fromLineNumber:", v57, v60, v61, 1093);

  PLLogCommon();
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v77 = v57;
    _os_log_debug_impl(&dword_1CAF47000, v62, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

LABEL_33:
  v11 = v63;

LABEL_34:
}

- (void)testQualification2
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
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
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
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
  NSObject *v72;
  id v73;
  PLAccountingDebugService *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  uint8_t v84[128];
  uint8_t buf[4];
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testQualification2]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 1097);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v86 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FED8], "allQualificationIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "removeObject:", &unk_1E8633540);
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
  v73 = v12;
  v74 = self;
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v80;
LABEL_5:
    v16 = 0;
    while (2)
    {
      if (*(_QWORD *)v80 != v15)
        objc_enumerationMutation(v12);
      v17 = objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * v16), "intValue", v73);
      objc_msgSend(&unk_1E86503F0, "objectAtIndexedSubscript:", (int)v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "intValue");

      switch(v19)
      {
        case 1:
          objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", v17, &unk_1E8650408, v21);

          -[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:](v74, "verifyLastQualificationEventWithQualificationID:withNodeName:", v17, CFSTR("__GLOBAL__"));
          self = v74;
          objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "dateByAddingTimeInterval:", 5.0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", v17, &unk_1E8650420, v23);
          goto LABEL_13;
        case 2:
          objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "createQualificationEventBackwardWithQualificationID:withChildNodeNames:withEndDate:", v17, &unk_1E8650438, v25);

          -[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:](v74, "verifyLastQualificationEventWithQualificationID:withNodeName:", v17, CFSTR("__GLOBAL__"));
          self = v74;
          objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "dateByAddingTimeInterval:", 5.0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "createQualificationEventBackwardWithQualificationID:withChildNodeNames:withEndDate:", v17, &unk_1E8650450, v23);
          goto LABEL_13;
        case 3:
          objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "dateByAddingTimeInterval:", 5.0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "createQualificationEventIntervalWithQualificationID:withChildNodeNames:withStartDate:withEndDate:", v17, &unk_1E8650468, v23, v26);

          v12 = v73;
          goto LABEL_13;
        case 4:
          objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "createQualificationEventPointWithQualificationID:withChildNodeNames:withStartDate:", v17, &unk_1E8650480, v23);
LABEL_13:

          -[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:](self, "verifyLastQualificationEventWithQualificationID:withNodeName:", v17, CFSTR("__GLOBAL__"));
          if (v14 != ++v16)
            continue;
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
          if (!v14)
            goto LABEL_15;
          goto LABEL_5;
        default:
          v38 = v12;
          goto LABEL_34;
      }
    }
  }
LABEL_15:

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 2, &unk_1E8650498, v28);

  -[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:](self, "verifyLastQualificationEventWithQualificationID:withNodeName:", 2, CFSTR("locationd"));
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 2, &unk_1E86504B0, v30);

  -[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:](self, "verifyLastQualificationEventWithQualificationID:withNodeName:", 2, CFSTR("locationd"));
  -[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:](self, "verifyLastQualificationEventWithQualificationID:withNodeName:", 2, CFSTR("App1"));
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 3.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 2, &unk_1E86504C8, v32);

  -[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:](self, "verifyLastQualificationEventWithQualificationID:withNodeName:", 2, CFSTR("locationd"));
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 3.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addPowerMeasurementEventIntervalWithPower:withStartDate:withEndDate:", v34, v35, 5.0);

  objc_msgSend(MEMORY[0x1E0D7FED8], "deviceRootNodeIDs");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v36, "mutableCopy");

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v38 = v37;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v76;
    while (2)
    {
      v42 = 0;
      do
      {
        if (*(_QWORD *)v76 != v41)
          objc_enumerationMutation(v38);
        v43 = objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * v42), "intValue", v73);
        objc_msgSend(&unk_1E86504E0, "objectAtIndexedSubscript:", (int)v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "intValue");

        switch(v45)
        {
          case 3:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v54 = v38;
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", v43, v53, v55, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](v74, "verifyLastPowerEventWithRootNodeID:withPower:", v43, 1.0);
            self = v74;
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 2.0);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", v43, v51, v56, 1.0);

            v38 = v54;
            break;
          case 2:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v43, v58, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v43, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v43, v60, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v43, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 2.0);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v43, v51, 1.0);
            break;
          case 1:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v43, v47, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v43, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v43, v49, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v43, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 2.0);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v43, v51, 1.0);
            break;
          default:
            v67 = v38;
            goto LABEL_33;
        }

        -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v43, 1.0);
        ++v42;
      }
      while (v40 != v42);
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
      if (v40)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, &unk_1E864C300, v62);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App1"), 0.5);
  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App2"), 0.5);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 3.0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, &unk_1E864C328, v64);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App1"), 0.5);
  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App2"), 0.5);
  objc_msgSend(&unk_1E86504F8, "objectAtIndexedSubscript:", 10);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", v65, 10, v9, 0.0);

  objc_msgSend(&unk_1E8650510, "objectAtIndexedSubscript:", 10);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingDebugService verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:](self, "verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:", 2, 10, v66, v9, 0.0);

  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", CFSTR("App1"), 10, v9, 5.0 / (double)(unint64_t)objc_msgSend(v38, "count") / 3600.0);
  -[PLAccountingDebugService verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:](self, "verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:", 2, 10, CFSTR("App1"), v9, 5.0 / (double)(unint64_t)objc_msgSend(v38, "count") * 0.25 / 3600.0);
  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", CFSTR("App2"), 10, v9, 5.0 / (double)(unint64_t)objc_msgSend(v38, "count") / 3600.0);
  -[PLAccountingDebugService verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:](self, "verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:", 2, 10, CFSTR("App2"), v9, 0.0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "lastPathComponent");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testQualification2]");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "logMessage:fromFile:fromFunction:fromLineNumber:", v67, v70, v71, 1307);

  PLLogCommon();
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v86 = v67;
    _os_log_debug_impl(&dword_1CAF47000, v72, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

LABEL_33:
  v12 = v73;

LABEL_34:
}

- (void)testQualification3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
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
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
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
  NSObject *v68;
  id v69;
  PLAccountingDebugService *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  uint8_t v80[128];
  uint8_t buf[4];
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testQualification3]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 1311);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v82 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FED8], "allQualificationIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "removeObject:", &unk_1E8633570);
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
  v69 = v12;
  v70 = self;
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v76;
LABEL_5:
    v16 = 0;
    while (2)
    {
      if (*(_QWORD *)v76 != v15)
        objc_enumerationMutation(v12);
      v17 = objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * v16), "intValue", v69);
      objc_msgSend(&unk_1E8650528, "objectAtIndexedSubscript:", (int)v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "intValue");

      switch(v19)
      {
        case 1:
          objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", v17, &unk_1E8650540, v21);

          -[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:](v70, "verifyLastQualificationEventWithQualificationID:withNodeName:", v17, CFSTR("__GLOBAL__"));
          self = v70;
          objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "dateByAddingTimeInterval:", 5.0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", v17, &unk_1E8650558, v23);
          goto LABEL_13;
        case 2:
          objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "createQualificationEventBackwardWithQualificationID:withChildNodeNames:withEndDate:", v17, &unk_1E8650570, v25);

          -[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:](v70, "verifyLastQualificationEventWithQualificationID:withNodeName:", v17, CFSTR("__GLOBAL__"));
          self = v70;
          objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "dateByAddingTimeInterval:", 5.0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "createQualificationEventBackwardWithQualificationID:withChildNodeNames:withEndDate:", v17, &unk_1E8650588, v23);
          goto LABEL_13;
        case 3:
          objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "dateByAddingTimeInterval:", 5.0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "createQualificationEventIntervalWithQualificationID:withChildNodeNames:withStartDate:withEndDate:", v17, &unk_1E86505A0, v23, v26);

          v12 = v69;
          goto LABEL_13;
        case 4:
          objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "createQualificationEventPointWithQualificationID:withChildNodeNames:withStartDate:", v17, &unk_1E86505B8, v23);
LABEL_13:

          -[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:](self, "verifyLastQualificationEventWithQualificationID:withNodeName:", v17, CFSTR("__GLOBAL__"));
          if (v14 != ++v16)
            continue;
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
          if (!v14)
            goto LABEL_15;
          goto LABEL_5;
        default:
          v36 = v12;
          goto LABEL_34;
      }
    }
  }
LABEL_15:

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "createQualificationEventPointWithQualificationID:withChildNodeNames:withStartDate:", 11, &unk_1E86505D0, v28);

  -[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:](self, "verifyLastQualificationEventWithQualificationID:withNodeName:", 11, CFSTR("App1"));
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "createQualificationEventPointWithQualificationID:withChildNodeNames:withStartDate:", 11, &unk_1E86505E8, v30);

  -[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:](self, "verifyLastQualificationEventWithQualificationID:withNodeName:", 11, CFSTR("App2"));
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 3.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addPowerMeasurementEventIntervalWithPower:withStartDate:withEndDate:", v32, v33, 5.0);

  objc_msgSend(MEMORY[0x1E0D7FED8], "deviceRootNodeIDs");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)objc_msgSend(v34, "mutableCopy");

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v36 = v35;
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v72;
    while (2)
    {
      v40 = 0;
      do
      {
        if (*(_QWORD *)v72 != v39)
          objc_enumerationMutation(v36);
        v41 = objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * v40), "intValue", v69);
        objc_msgSend(&unk_1E8650600, "objectAtIndexedSubscript:", (int)v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "intValue");

        switch(v43)
        {
          case 3:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v52 = v36;
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", v41, v51, v53, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](v70, "verifyLastPowerEventWithRootNodeID:withPower:", v41, 1.0);
            self = v70;
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 2.0);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", v41, v49, v54, 1.0);

            v36 = v52;
            break;
          case 2:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v41, v56, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v41, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v41, v58, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v41, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 2.0);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v41, v49, 1.0);
            break;
          case 1:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v41, v45, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v41, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v41, v47, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v41, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "dateByAddingTimeInterval:", 2.0);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v41, v49, 1.0);
            break;
          default:
            v63 = v36;
            goto LABEL_33;
        }

        -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v41, 1.0);
        ++v40;
      }
      while (v38 != v40);
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
      if (v38)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "createDistributionEventBackwardWithDistributionID:withChildNodeNameToWeight:withEndDate:", 33, &unk_1E864C350, v60);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 33, CFSTR("App1"), 0.5);
  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 33, CFSTR("App2"), 0.5);
  objc_msgSend(&unk_1E8650618, "objectAtIndexedSubscript:", 2);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", v61, 2, v9, 0.0);

  objc_msgSend(&unk_1E8650630, "objectAtIndexedSubscript:", 2);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingDebugService verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:](self, "verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:", 11, 2, v62, v9, 0.0);

  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", CFSTR("App1"), 2, v9, 5.0 / (double)(unint64_t)objc_msgSend(v36, "count") / 3600.0);
  -[PLAccountingDebugService verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:](self, "verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:", 11, 2, CFSTR("App1"), v9, 5.0 / (double)(unint64_t)objc_msgSend(v36, "count") * 0.25 / 3600.0);
  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", CFSTR("App2"), 2, v9, 5.0 / (double)(unint64_t)objc_msgSend(v36, "count") / 3600.0);
  -[PLAccountingDebugService verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:](self, "verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:", 11, 2, CFSTR("App2"), v9, 0.0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "lastPathComponent");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testQualification3]");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "logMessage:fromFile:fromFunction:fromLineNumber:", v63, v66, v67, 1503);

  PLLogCommon();
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v82 = v63;
    _os_log_debug_impl(&dword_1CAF47000, v68, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

LABEL_33:
  v12 = v69;

LABEL_34:
}

- (void)testReloadBefore1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
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
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testReloadBefore1]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 1509);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("now=%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testReloadBefore1]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 1512);

  PLLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v10;
    _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, &unk_1E864C378, v17);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App1"), 0.5);
  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App2"), 0.5);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 4.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, &unk_1E864C3A0, v19);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App1"), 0.75);
  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App2"), 0.25);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 10, v21, 5.0);

  -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", 10, 5.0);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 5.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 10, v23, 10.0);

  -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", 10, 10.0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "lastPathComponent");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testReloadBefore1]");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 1548);

  PLLogCommon();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v24;
    _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

- (void)testReloadAfter1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
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
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testReloadAfter1]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 1552);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "storage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FEF8], "entryKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "entriesForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "range");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("now=%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lastPathComponent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testReloadAfter1]");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 1558);

  PLLogCommon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v16;
    _os_log_debug_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dateByAddingTimeInterval:", 6.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, &unk_1E864C3C8, v23);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App1"), 1.0);
  objc_msgSend(&unk_1E8650648, "objectAtIndexedSubscript:", 10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", v24, 10, 0.00694444444, 0.001);

  -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", CFSTR("App1"), 10, 0.00381944444, 0.001);
  -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", CFSTR("App2"), 10, 0.003125, 0.001);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lastPathComponent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testReloadAfter1]");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 1582);

  PLLogCommon();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v25;
    _os_log_debug_impl(&dword_1CAF47000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

- (void)testReloadBefore2
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
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
  NSObject *v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testReloadBefore2]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 1586);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("now=%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testReloadBefore2]");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 1589);

  PLLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v10;
    _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addPowerMeasurementEventIntervalWithPower:withStartDate:withEndDate:", v17, v18, 5.0);

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 3.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addPowerMeasurementEventIntervalWithPower:withStartDate:withEndDate:", v20, v21, 5.0);

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 2, v23, 1.0);

  -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", 2, 1.0);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 2, v25, 1.0);

  -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", 2, 1.0);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "createDistributionEventBackwardWithDistributionID:withChildNodeNameToWeight:withEndDate:", 33, &unk_1E864C3F0, v27);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 33, CFSTR("kernel_task"), 0.5);
  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 33, CFSTR("App1"), 0.5);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 4.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "createDistributionEventBackwardWithDistributionID:withChildNodeNameToWeight:withEndDate:", 33, &unk_1E864C418, v29);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 33, CFSTR("kernel_task"), 0.5);
  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 33, CFSTR("App1"), 0.5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "lastPathComponent");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testReloadBefore2]");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v33, v34, 1634);

  PLLogCommon();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v30;
    _os_log_debug_impl(&dword_1CAF47000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

- (void)testReloadAfter2
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
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
  id v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint8_t v77[128];
  uint8_t buf[4];
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testReloadAfter2]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 1637);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v79 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "storage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FED0], "entryKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "entriesForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = v12;
  objc_msgSend(v12, "firstObject");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "range");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startDate");
  v14 = objc_claimAutoreleasedReturnValue();

  v67 = (void *)v14;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("now=%@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lastPathComponent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testReloadAfter2]");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 1643);

  PLLogCommon();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v79 = v15;
    _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D7FED8], "deviceRootNodeIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "mutableCopy");

  objc_msgSend(v22, "removeObject:", &unk_1E8633540);
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v23 = v22;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
  v66 = v23;
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v73;
    while (2)
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v73 != v26)
          objc_enumerationMutation(v23);
        v28 = objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * v27), "intValue");
        objc_msgSend(&unk_1E8650660, "objectAtIndexedSubscript:", (int)v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "intValue");

        switch(v30)
        {
          case 3:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "dateByAddingTimeInterval:", 0.0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "dateByAddingTimeInterval:", 1.0);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", v28, v39, v40, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v28, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "dateByAddingTimeInterval:", 1.0);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 2.0;
            v23 = v66;
            objc_msgSend(v67, "dateByAddingTimeInterval:", 2.0);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", v28, v36, v41, 2.0);

            break;
          case 2:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "dateByAddingTimeInterval:", 0.0);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v28, v43, 0.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v28, 0.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "dateByAddingTimeInterval:", 1.0);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v28, v45, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v28, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 2.0;
            objc_msgSend(v67, "dateByAddingTimeInterval:", 2.0);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v28, v36, 2.0);
            break;
          case 1:
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "dateByAddingTimeInterval:", 0.0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v28, v32, 1.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v28, 1.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "dateByAddingTimeInterval:", 1.0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v28, v34, 2.0);

            -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v28, 2.0);
            objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "dateByAddingTimeInterval:", 2.0);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = 3.0;
            objc_msgSend(v35, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v28, v36, 3.0);
            break;
          default:
            v56 = v23;
            v62 = v64;
            v63 = v65;
            goto LABEL_29;
        }

        -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", v28, v37);
        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
      if (v25)
        continue;
      break;
    }
  }

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v46 = v23;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v69;
    do
    {
      v50 = 0;
      do
      {
        if (*(_QWORD *)v69 != v49)
          objc_enumerationMutation(v46);
        v51 = objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * v50), "intValue");
        objc_msgSend(&unk_1E8650678, "objectAtIndexedSubscript:", (int)v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", v52, v51, (5.0 / (double)(unint64_t)(objc_msgSend(v46, "count") + 1) + -1.0) / 3600.0);

        objc_msgSend(&unk_1E8650690, "objectAtIndexedSubscript:", (int)v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", v53, v51, v67, 5.0 / (double)(unint64_t)(objc_msgSend(v46, "count") + 1) / 3600.0);

        ++v50;
      }
      while (v48 != v50);
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    }
    while (v48);
  }

  objc_msgSend(&unk_1E86506A8, "objectAtIndexedSubscript:", 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", v54, 2, (5.0 / (double)(unint64_t)(objc_msgSend(v46, "count") + 1) + -1.0) / 3600.0);

  objc_msgSend(&unk_1E86506C0, "objectAtIndexedSubscript:", 2);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", v55, 2, v67, 5.0 / (double)(unint64_t)(objc_msgSend(v46, "count") + 1) / 3600.0);

  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", CFSTR("kernel_task"), 2, (5.0 / (double)(unint64_t)(objc_msgSend(v46, "count") + 1) + -1.0) * 0.5 / 3600.0);
  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", CFSTR("kernel_task"), 2, v67, ((5.0 / (double)(unint64_t)(objc_msgSend(v46, "count") + 1) + -1.0) * 0.5 + 0.5) / 3600.0);
  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", CFSTR("App1"), 2, (5.0 / (double)(unint64_t)(objc_msgSend(v46, "count") + 1) + -1.0) * 3.0 * 0.25 / 3600.0);
  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", CFSTR("App1"), 2, v67, ((5.0 / (double)(unint64_t)(objc_msgSend(v46, "count") + 1) + -1.0) * 3.0 * 0.25 + 0.5 + 0.25) / 3600.0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "lastPathComponent");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testReloadAfter2]");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "logMessage:fromFile:fromFunction:fromLineNumber:", v56, v59, v60, 1750);

  PLLogCommon();
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v79 = v56;
    _os_log_debug_impl(&dword_1CAF47000, v61, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  v62 = v64;
  v63 = v65;
  v23 = v66;
LABEL_29:

}

- (void)testChunk
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testChunk]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 1756);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0.0;
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, &unk_1E864C440, v12);

  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App1"), 0.5);
  -[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:](self, "verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:", 1, CFSTR("App2"), 0.5);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v9;
  objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 10, v14, 5.0);

  -[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:](self, "verifyLastPowerEventWithRootNodeID:withPower:", 10, 5.0);
  objc_msgSend(MEMORY[0x1E0D7FED8], "maxPowerEventChunkInterval");
  sleep((v15 * 0.5));
  v16 = 0;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("i=%i"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastPathComponent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testChunk]");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 1782);

    PLLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v17;
      _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    objc_msgSend(&unk_1E86506D8, "objectAtIndexedSubscript:", 10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7FED8], "maxPowerEventChunkInterval");
    v25 = v24 * v11 * 5.0 / 3600.0;
    objc_msgSend(MEMORY[0x1E0D7FED8], "maxPowerEventChunkInterval");
    -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", v23, 10, v25, v26 * 5.0 * 0.5);

    objc_msgSend(MEMORY[0x1E0D7FED8], "maxPowerEventChunkInterval");
    v28 = v27 * v11 * 5.0 * 0.5 / 3600.0;
    objc_msgSend(MEMORY[0x1E0D7FED8], "maxPowerEventChunkInterval");
    -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", CFSTR("App1"), 10, v28, v29 * 5.0 * 0.25);
    objc_msgSend(MEMORY[0x1E0D7FED8], "maxPowerEventChunkInterval");
    v31 = v30 * v11 * 5.0 * 0.5 / 3600.0;
    objc_msgSend(MEMORY[0x1E0D7FED8], "maxPowerEventChunkInterval");
    -[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:](self, "verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:", CFSTR("App2"), 10, v31, v32 * 5.0 * 0.25);
    objc_msgSend(MEMORY[0x1E0D7FED8], "maxPowerEventChunkInterval");
    sleep(v33);
    v11 = v11 + 1.0;
    v16 = (v16 + 1);
  }
  while ((_DWORD)v16 != 3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "lastPathComponent");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testChunk]");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v37, v38, 1798);

  PLLogCommon();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v34;
    _os_log_debug_impl(&dword_1CAF47000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

- (void)testPerformance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  __int128 v42;
  _QWORD v43[6];
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _QWORD v52[5];
  __int128 v53;
  _QWORD block[5];
  __int128 v55;
  uint8_t v56[4];
  void *v57;
  uint8_t v58[128];
  __int128 buf;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testPerformance]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 1802);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__8;
  v62 = __Block_byref_object_dispose__8;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v63 = (id)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0D80078], "workQueueForKey:", CFSTR("testPerformance1"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__PLAccountingDebugService_testPerformance__block_invoke;
  block[3] = &unk_1E857C250;
  block[4] = &buf;
  v36 = xmmword_1CB388C00;
  v55 = xmmword_1CB388C00;
  dispatch_async(v10, block);

  objc_msgSend(MEMORY[0x1E0D80078], "workQueueForKey:", CFSTR("testPerformance1"));
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_group_async(v9, v12, &__block_literal_global_26);

  objc_msgSend(MEMORY[0x1E0D80078], "workQueueForKey:", CFSTR("testPerformance2"));
  v13 = objc_claimAutoreleasedReturnValue();
  v52[0] = v11;
  v52[1] = 3221225472;
  v52[2] = __43__PLAccountingDebugService_testPerformance__block_invoke_445;
  v52[3] = &unk_1E857C250;
  v52[4] = &buf;
  v53 = xmmword_1CB388C10;
  dispatch_async(v13, v52);

  objc_msgSend(MEMORY[0x1E0D80078], "workQueueForKey:", CFSTR("testPerformance2"));
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_group_async(v9, v14, &__block_literal_global_454);

  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__8;
  v50 = __Block_byref_object_dispose__8;
  objc_msgSend(MEMORY[0x1E0D7FED8], "deviceRootNodeIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (id)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0D80078], "workQueueForKey:", CFSTR("testPerformance3"));
  v16 = objc_claimAutoreleasedReturnValue();
  v43[0] = v11;
  v43[1] = 3221225472;
  v43[2] = __43__PLAccountingDebugService_testPerformance__block_invoke_459;
  v43[3] = &unk_1E857C2B8;
  v44 = xmmword_1CB388C20;
  v45 = 0x4000000000000000;
  v43[4] = &buf;
  v43[5] = &v46;
  dispatch_async(v16, v43);

  objc_msgSend(MEMORY[0x1E0D80078], "workQueueForKey:", CFSTR("testPerformance3"));
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_group_async(v9, v17, &__block_literal_global_467);

  objc_msgSend(MEMORY[0x1E0D80078], "workQueueForKey:", CFSTR("testPerformance4"));
  v18 = objc_claimAutoreleasedReturnValue();
  v41[0] = v11;
  v41[1] = 3221225472;
  v41[2] = __43__PLAccountingDebugService_testPerformance__block_invoke_472;
  v41[3] = &unk_1E857C250;
  v41[4] = &buf;
  v42 = xmmword_1CB388C00;
  dispatch_async(v18, v41);

  objc_msgSend(MEMORY[0x1E0D80078], "workQueueForKey:", CFSTR("testPerformance4"));
  v19 = objc_claimAutoreleasedReturnValue();
  dispatch_group_async(v9, v19, &__block_literal_global_490);

  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v20 = objc_msgSend((id)v47[5], "count");
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v21 = (id)v47[5];
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v58, 16);
  v23 = 20.0 / (double)v20 + -4.0;
  if (v22)
  {
    v24 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v38 != v24)
          objc_enumerationMutation(v21);
        v26 = objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "intValue", v36, (_QWORD)v37);
        objc_msgSend(&unk_1E8650798, "objectAtIndexedSubscript:", (int)v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", v27, v26, v23 / 3600.0);

      }
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v58, 16);
    }
    while (v22);
  }

  v28 = v23 * 0.5 / 3600.0;
  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", CFSTR("apsd"), 11, v28);
  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", CFSTR("apsd"), 11, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), 0.0);
  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", CFSTR("App1"), 11, v28);
  v29 = (v23 + 4.0) * 0.5 / 3600.0;
  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", CFSTR("App1"), 11, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v29);
  -[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:](self, "verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:", CFSTR("App2"), 11, v28);
  -[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:](self, "verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:", CFSTR("App2"), 11, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v29);
  -[PLAccountingDebugService verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:](self, "verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:", 2, 11, CFSTR("App2"), *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v29);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "lastPathComponent");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testPerformance]");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v33, v34, 2019);

  PLLogCommon();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v56 = 138412290;
    v57 = v30;
    _os_log_debug_impl(&dword_1CAF47000, v35, OS_LOG_TYPE_DEBUG, "%@", v56, 0xCu);
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&buf, 8);

}

void __43__PLAccountingDebugService_testPerformance__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  double i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin testPerformance1"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testPerformance]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 1812);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138412290;
    v18 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v17, 0xCu);
  }

  for (i = *(double *)(a1 + 40); i <= 5.0; i = i + *(double *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "dateByAddingTimeInterval:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 3, &unk_1E864C468, v10);

    sleep(*(double *)(a1 + 48));
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end testPerformance1"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testPerformance]_block_invoke");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 1825);

  PLLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138412290;
    v18 = v11;
    _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v17, 0xCu);
  }

}

void __43__PLAccountingDebugService_testPerformance__block_invoke_440()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("join testPerformance1"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testPerformance]_block_invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "logMessage:fromFile:fromFunction:fromLineNumber:", v0, v3, v4, 1828);

  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v0;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v6, 0xCu);
  }

}

void __43__PLAccountingDebugService_testPerformance__block_invoke_445(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  double i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin testPerformance2"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testPerformance]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 1835);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138412290;
    v18 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v17, 0xCu);
  }

  for (i = *(double *)(a1 + 40); i <= 5.0; i = i + *(double *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "dateByAddingTimeInterval:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createDistributionEventPointWithDistributionID:withChildNodeNameToWeight:withStartDate:", 4, &unk_1E864C490, v10);

    sleep(*(double *)(a1 + 48));
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end testPerformance2"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testPerformance]_block_invoke");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 1848);

  PLLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = 138412290;
    v18 = v11;
    _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v17, 0xCu);
  }

}

void __43__PLAccountingDebugService_testPerformance__block_invoke_453()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("join testPerformance2"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testPerformance]_block_invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "logMessage:fromFile:fromFunction:fromLineNumber:", v0, v3, v4, 1851);

  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v0;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v6, 0xCu);
  }

}

void __43__PLAccountingDebugService_testPerformance__block_invoke_459(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin testPerformance3"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0x1E0D7F000uLL;
  v5 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testPerformance]_block_invoke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v7, v8, 1861);

  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v43 = (uint64_t)v3;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  v10 = *(double *)(a1 + 48);
  if (v10 <= 5.0)
  {
    v17 = 0x1E0D7F000uLL;
    v18 = &unk_1E86506F0;
    do
    {
      objc_msgSend(*(id *)(v17 + 3800), "debugInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(double *)(a1 + 56);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "dateByAddingTimeInterval:", v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "dateByAddingTimeInterval:", v10 + *(double *)(a1 + 64));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addPowerMeasurementEventIntervalWithPower:withStartDate:withEndDate:", v21, v22, v20);

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      v24 = v17;
      if (v23)
      {
        v25 = v23;
        v26 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v38 != v26)
              objc_enumerationMutation(obj);
            v28 = objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "intValue");
            objc_msgSend(v18, "objectAtIndexedSubscript:", (int)v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "intValue");

            switch(v30)
            {
              case 3:
                objc_msgSend(*(id *)(v24 + 3800), "debugInstance");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "dateByAddingTimeInterval:", v10);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "dateByAddingTimeInterval:", v10 + *(double *)(a1 + 64));
                v33 = v18;
                v34 = v24;
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", v28, v32, v35, 1.0);

                v24 = v34;
                v18 = v33;
                break;
              case 2:
                objc_msgSend(*(id *)(v24 + 3800), "debugInstance");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "dateByAddingTimeInterval:", v10);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", v28, v32, 1.0);
                break;
              case 1:
                objc_msgSend(*(id *)(v24 + 3800), "debugInstance");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "dateByAddingTimeInterval:", v10);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", v28, v32, 1.0);
                break;
              default:
                goto LABEL_7;
            }

          }
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v25);
      }

      sleep(*(double *)(a1 + 64));
      v10 = v10 + *(double *)(a1 + 64);
      v2 = 0x1E0CB3000;
      v17 = v24;
      v4 = 0x1E0D7F000;
    }
    while (v10 <= 5.0);
  }
  objc_msgSend(*(id *)(v2 + 2368), "stringWithFormat:", CFSTR("end testPerformance3"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(v4 + 3992);
  objc_msgSend(*(id *)(v2 + 2368), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 + 2368), "stringWithUTF8String:", "-[PLAccountingDebugService testPerformance]_block_invoke");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  obj = (id)v11;
  objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 1907);

  PLLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v11;
    _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

LABEL_7:
}

void __43__PLAccountingDebugService_testPerformance__block_invoke_466()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("join testPerformance3"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testPerformance]_block_invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "logMessage:fromFile:fromFunction:fromLineNumber:", v0, v3, v4, 1910);

  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v0;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v6, 0xCu);
  }

}

void __43__PLAccountingDebugService_testPerformance__block_invoke_472(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin testPerformance4"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0x1E0D7F000uLL;
  v5 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testPerformance]_block_invoke");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v7, v8, 1917);

  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D7FED8], "allQualificationIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "removeObject:", &unk_1E8633540);
  v12 = *(double *)(a1 + 40);
  if (v12 <= 5.0)
  {
    v19 = 0uLL;
    v33 = v11;
    do
    {
      v36 = v19;
      v37 = v19;
      v34 = v19;
      v35 = v19;
      v13 = v11;
      v20 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      v21 = 0x1E0D7F000uLL;
      if (v20)
      {
        v22 = v20;
        v23 = *(_QWORD *)v35;
LABEL_10:
        v24 = 0;
        while (2)
        {
          if (*(_QWORD *)v35 != v23)
            objc_enumerationMutation(v13);
          v25 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v24), "intValue");
          objc_msgSend(&unk_1E8650708, "objectAtIndexedSubscript:", (int)v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "intValue");

          switch(v27)
          {
            case 1:
              objc_msgSend(*(id *)(v21 + 3800), "debugInstance");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "dateByAddingTimeInterval:", v12);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", v25, &unk_1E8650720, v29);
              goto LABEL_18;
            case 2:
              objc_msgSend(*(id *)(v21 + 3800), "debugInstance");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "dateByAddingTimeInterval:", v12);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "createQualificationEventBackwardWithQualificationID:withChildNodeNames:withEndDate:", v25, &unk_1E8650738, v29);
              goto LABEL_18;
            case 3:
              objc_msgSend(*(id *)(v21 + 3800), "debugInstance");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "dateByAddingTimeInterval:", v12);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "dateByAddingTimeInterval:", v12 + *(double *)(a1 + 48));
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "createQualificationEventIntervalWithQualificationID:withChildNodeNames:withStartDate:withEndDate:", v25, &unk_1E8650750, v29, v30);

              v21 = 0x1E0D7F000;
              goto LABEL_18;
            case 4:
              objc_msgSend(*(id *)(v21 + 3800), "debugInstance");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "dateByAddingTimeInterval:", v12);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "createQualificationEventPointWithQualificationID:withChildNodeNames:withStartDate:", v25, &unk_1E8650768, v29);
LABEL_18:

              if (v22 != ++v24)
                continue;
              v22 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
              if (!v22)
                goto LABEL_20;
              goto LABEL_10;
            default:
              v11 = v33;
              goto LABEL_23;
          }
        }
      }
LABEL_20:

      objc_msgSend(*(id *)(v21 + 3800), "debugInstance");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "dateByAddingTimeInterval:", v12);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 2, &unk_1E8650780, v32);

      sleep(*(double *)(a1 + 48));
      v12 = v12 + *(double *)(a1 + 48);
      v2 = 0x1E0CB3000;
      v4 = 0x1E0D7F000;
      v11 = v33;
      v19 = 0uLL;
    }
    while (v12 <= 5.0);
  }
  objc_msgSend(*(id *)(v2 + 2368), "stringWithFormat:", CFSTR("end testPerformance4"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = *(void **)(v4 + 3992);
  objc_msgSend(*(id *)(v2 + 2368), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v2 + 2368), "stringWithUTF8String:", "-[PLAccountingDebugService testPerformance]_block_invoke");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 1971);

  PLLogCommon();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v13;
    _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

LABEL_23:
}

void __43__PLAccountingDebugService_testPerformance__block_invoke_489()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("join testPerformance4"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testPerformance]_block_invoke");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "logMessage:fromFile:fromFunction:fromLineNumber:", v0, v3, v4, 1974);

  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v0;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)testShortDistributionEventDuration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  double v8;
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
  NSObject *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testShortDistributionEventDuration]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2023);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v23 = 138412290;
    v24 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v23, 0xCu);
  }

  v8 = 0.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingTimeInterval:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, &unk_1E864C4B8, v11);

    v8 = v8 + 0.001;
  }
  while (v8 < 0.01);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.01);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 1, &unk_1E864C4E0, v13);

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 10, v9, 10.0);

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 0.01);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 10, v16, 10.0);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lastPathComponent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testShortDistributionEventDuration]");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 2046);

  PLLogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v23 = 138412290;
    v24 = v17;
    _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v23, 0xCu);
  }

}

- (void)testShortQualificationEventDuration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  double v8;
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
  NSObject *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testShortQualificationEventDuration]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2050);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v23 = 138412290;
    v24 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v23, 0xCu);
  }

  v8 = 0.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingTimeInterval:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 2, &unk_1E86507B0, v11);

    v8 = v8 + 0.001;
  }
  while (v8 < 1.0);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 2, &unk_1E86507C8, v13);

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 10, v9, 10.0);

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingTimeInterval:", 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 10, v16, 10.0);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "lastPathComponent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testShortQualificationEventDuration]");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 2073);

  PLLogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v23 = 138412290;
    v24 = v17;
    _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v23, 0xCu);
  }

}

- (void)testAddRemoveDistributionEventForward
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
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
  NSObject *v30;
  int v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testAddRemoveDistributionEventForward]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2077);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v31 = 138412290;
    v32 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v31, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 1, CFSTR("App1"), v8);

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 1, CFSTR("App2"), v11);

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", 2.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 1, CFSTR("App1"), v13);

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", 3.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 1, CFSTR("App2"), v15);

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 7, &unk_1E864C508, v8);

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 7, CFSTR("App1"), v18);

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", 2.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 7, CFSTR("App2"), v20);

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", 3.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 7, CFSTR("App2"), v22);

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", 4.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 7, CFSTR("App1"), v24);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lastPathComponent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testAddRemoveDistributionEventForward]");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 2109);

  PLLogCommon();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    v31 = 138412290;
    v32 = v25;
    _os_log_debug_impl(&dword_1CAF47000, v30, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v31, 0xCu);
  }

}

- (void)testCorrectionInMemory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
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
  NSObject *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testCorrectionInMemory]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2113);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v20 = 138412290;
    v21 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v20, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 10, v8, 5.0);

  sleep(2u);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateByAddingTimeInterval:", -10.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", 2, v12, v10, 10.0);

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 10, v10, 0.0);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lastPathComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testCorrectionInMemory]");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 2131);

  PLLogCommon();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v20 = 138412290;
    v21 = v14;
    _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v20, 0xCu);
  }

}

- (void)testPowerEventIntervalOverlap
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
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
  NSObject *v25;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testPowerEventIntervalOverlap]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2135);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v26 = 138412290;
    v27 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v26, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", -10.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", 6, v10, v8, 10.0);

  sleep(2u);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingTimeInterval:", -4.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", 6, v13, v11, 10.0);

  sleep(2u);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateByAddingTimeInterval:", -2.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", 6, v16, v14, 10.0);

  sleep(2u);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dateByAddingTimeInterval:", -0.5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "createPowerEventIntervalWithRootNodeID:withPower:withStartDate:withEndDate:", 6, v19, v17, 10.0);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "lastPathComponent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testPowerEventIntervalOverlap]");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 2164);

  PLLogCommon();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v26 = 138412290;
    v27 = v20;
    _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v26, 0xCu);
  }

}

- (void)testCurrentDistributionEventForward
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testCurrentDistributionEventForward]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logMessage:fromFile:fromFunction:fromLineNumber:", v2, v5, v6, 2168);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v27 = 138412290;
    v28 = v2;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v27, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 3, &unk_1E864C530, v8);

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createDistributionEventPointWithDistributionID:withChildNodeNameToWeight:withStartDate:", 4, &unk_1E864C558, v8);

  sleep(1u);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createDistributionEventForwardWithDistributionID:withAddingChildNodeName:withStartDate:", 3, CFSTR("App3"), v12);

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentDistributionEventForwardWithDistributionID:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(&unk_1E864C580, "isEqualToDictionary:", v14);

  if ((v15 & 1) == 0)
    objc_msgSend((id)objc_opt_class(), "printError:", CFSTR("testCurrentDistributionEventForward:: currentDistributionEventForwardWithDistributionID does not match"));
  sleep(1u);
  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", 2.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createDistributionEventForwardWithDistributionID:withRemovingChildNodeName:withStartDate:", 3, CFSTR("App3"), v17);

  objc_msgSend(MEMORY[0x1E0D7FED8], "debugInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "currentDistributionEventForwardWithDistributionID:", 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(&unk_1E864C5A8, "isEqualToDictionary:", v19);

  if ((v20 & 1) == 0)
    objc_msgSend((id)objc_opt_class(), "printError:", CFSTR("testCurrentDistributionEventForward:: currentDistributionEventForwardWithDistributionID does not match"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lastPathComponent");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService testCurrentDistributionEventForward]");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 2198);

  PLLogCommon();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v27 = 138412290;
    v28 = v21;
    _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v27, 0xCu);
  }

}

- (BOOL)verifyLastDistributionEventWithDistributionID:(int)a3 withNodeName:(id)a4 withWeight:(double)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  BOOL v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  _QWORD v51[2];

  v6 = *(_QWORD *)&a3;
  v51[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[PLAccountingDebugService blockingClearQueues](self, "blockingClearQueues");
  if ((int)v6 < 1 || !v8)
  {
    v37 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:]");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "printError:", v38);

    v39 = 2210;
LABEL_13:
    NSLog(CFSTR("Fail: Returned from line: %d"), v39);
    v34 = 0;
    goto LABEL_20;
  }
  objc_msgSend(&unk_1E86507E0, "objectAtIndexedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  if ((v10 - 1) >= 4)
  {
    v39 = 2235;
    goto LABEL_13;
  }
  objc_msgSend(**((id **)&unk_1E857C368 + v10 - 1), "entryKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0D80080]);
  v13 = *MEMORY[0x1E0D801F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithKey:withValue:withComparisonOperation:", v13, v14, 0);

  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "storage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v11;
  objc_msgSend(v17, "entriesForKey:withComparisons:", v11, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v19, "lastObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "childNodeIDToWeight");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v47 = v20;
      v22 = objc_alloc(MEMORY[0x1E0D80080]);
      v23 = objc_msgSend(v22, "initWithKey:withValue:withComparisonOperation:", *MEMORY[0x1E0D801E8], v8, 0);
      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "storage");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D7FEE0], "entryKey");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)v23;
      v50 = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "entriesForKey:withComparisons:", v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28 && objc_msgSend(v28, "count"))
      {
        objc_msgSend(v28, "firstObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v29, "entryID"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v31, "doubleValue");
        v33 = vabdd_f64(v32, a5);
        v34 = v33 <= 0.001;
        if (v33 > 0.001)
        {
          v35 = (void *)objc_opt_class();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:]");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "printError:", v36);

          NSLog(CFSTR("Fail: Returned from line: %d"), 2273);
        }

      }
      else
      {
        v42 = (void *)objc_opt_class();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:]");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "printError:", v43);

        NSLog(CFSTR("Fail: Returned from line: %d"), 2265);
        v34 = 0;
      }
      v11 = v49;
      v20 = v47;

    }
    else
    {
      v44 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:]");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "printError:", v45);

      NSLog(CFSTR("Fail: Returned from line: %d"), 2254);
      v34 = 0;
    }

  }
  else
  {
    v40 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyLastDistributionEventWithDistributionID:withNodeName:withWeight:]");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "printError:", v41);

    NSLog(CFSTR("Fail: Returned from line: %d"), 2246);
    v34 = 0;
  }

LABEL_20:
  return v34;
}

- (BOOL)verifyLastQualificationEventWithQualificationID:(int)a3 withNodeName:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[2];

  v4 = *(_QWORD *)&a3;
  v53[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PLAccountingDebugService blockingClearQueues](self, "blockingClearQueues");
  if ((int)v4 <= 0)
  {
    v22 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:]");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "printError:", v23);

    v24 = 2286;
  }
  else
  {
    objc_msgSend(&unk_1E86507F8, "objectAtIndexedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");

    if ((v8 - 1) < 4)
    {
      objc_msgSend(**((id **)&unk_1E857C388 + v8 - 1), "entryKey");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x1E0D80080]);
      v11 = *MEMORY[0x1E0D80210];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v10, "initWithKey:withValue:withComparisonOperation:", v11, v12, 0);

      objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "storage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = (void *)v9;
      objc_msgSend(v15, "entriesForKey:withComparisons:", v9, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v26 = (void *)objc_opt_class();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:]");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "printError:", v27);

        NSLog(CFSTR("Fail: Returned from line: %d"), 2322);
        v25 = 0;
        v28 = (void *)v9;
LABEL_24:

        goto LABEL_25;
      }
      objc_msgSend(v17, "lastObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "childNodeIDs");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        if (v6 || !objc_msgSend(v19, "count"))
        {
          if ((objc_msgSend(v6, "isEqualToString:", CFSTR("__GLOBAL__")) & 1) != 0)
          {
            v21 = 1;
          }
          else
          {
            v50 = v18;
            v32 = objc_alloc(MEMORY[0x1E0D80080]);
            v33 = objc_msgSend(v32, "initWithKey:withValue:withComparisonOperation:", *MEMORY[0x1E0D801E8], v6, 0);
            objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "storage");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D7FEE0], "entryKey");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = (void *)v33;
            v52 = v33;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "entriesForKey:withComparisons:", v36, v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v38 || !objc_msgSend(v38, "count"))
            {
              v47 = (void *)objc_opt_class();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:]");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "printError:", v48);

              NSLog(CFSTR("Fail: Returned from line: %d"), 2355);
              v25 = 0;
              v18 = v50;
              v28 = v51;
              goto LABEL_23;
            }
            objc_msgSend(v38, "firstObject");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v39, "entryID");

            v18 = v50;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v20, "containsObject:", v40);

          if ((v41 & 1) != 0)
          {
            v25 = 1;
LABEL_22:
            v28 = v51;
LABEL_23:

            goto LABEL_24;
          }
          v44 = (void *)objc_opt_class();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:]");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "printError:", v45);

          v31 = 2364;
        }
        else
        {
          v42 = (void *)objc_opt_class();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:]");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "printError:", v43);

          v31 = 2338;
        }
      }
      else
      {
        v29 = (void *)objc_opt_class();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyLastQualificationEventWithQualificationID:withNodeName:]");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "printError:", v30);

        v31 = 2330;
      }
      NSLog(CFSTR("Fail: Returned from line: %d"), v31);
      v25 = 0;
      goto LABEL_22;
    }
    v24 = 2311;
  }
  NSLog(CFSTR("Fail: Returned from line: %d"), v24);
  v25 = 0;
LABEL_25:

  return v25;
}

- (BOOL)verifyLastPowerEventWithRootNodeID:(int)a3 withPower:(double)a4
{
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  -[PLAccountingDebugService blockingClearQueues](self, "blockingClearQueues");
  if (a3 <= 0)
  {
    v35 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:]");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "printError:", v36);

    v37 = 2377;
LABEL_11:
    NSLog(CFSTR("Fail: Returned from line: %d"), v37);
    return 0;
  }
  v6 = a3;
  objc_msgSend(&unk_1E8650810, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  if ((v8 - 1) >= 3)
  {
    v37 = 2398;
    goto LABEL_11;
  }
  objc_msgSend(**((id **)&unk_1E857C3A8 + v8 - 1), "entryKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0D80080]);
  v11 = *MEMORY[0x1E0D801E8];
  objc_msgSend(&unk_1E8650828, "objectAtIndexedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithKey:withValue:withComparisonOperation:", v11, v12, 0);

  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "storage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FEE0], "entryKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "entriesForKey:withComparisons:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x1E0D80080]);
    v21 = *MEMORY[0x1E0D80208];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v19, "entryID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v20, "initWithKey:withValue:withComparisonOperation:", v21, v22, 0);

    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "storage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "entriesForKey:withComparisons:", v9, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27 && objc_msgSend(v27, "count"))
    {
      objc_msgSend(v27, "lastObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x1E0D80200]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "doubleValue");
      v31 = vabdd_f64(v30 / 1000.0, a4);

      v32 = v31 <= 0.001;
      if (v31 > 0.001)
      {
        v33 = (void *)objc_opt_class();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:]");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "printError:", v34);

        NSLog(CFSTR("Fail: Returned from line: %d"), 2428);
      }

    }
    else
    {
      v38 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:]");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "printError:", v39);

      NSLog(CFSTR("Fail: Returned from line: %d"), 2421);
      v32 = 0;
    }

  }
  else
  {
    v40 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyLastPowerEventWithRootNodeID:withPower:]");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "printError:", v41);

    NSLog(CFSTR("Fail: Returned from line: %d"), 2409);
    v32 = 0;
  }

  return v32;
}

- (BOOL)verifyTotalEnergyWithNodeName:(id)a3 withTotalEnergy:(double)a4 withRootNodeID:(int)a5 withEpsilon:(double)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  uint64_t i;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _QWORD v62[2];
  _QWORD v63[3];

  v7 = *(_QWORD *)&a5;
  v63[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[PLAccountingDebugService blockingClearQueues](self, "blockingClearQueues");
  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0D80080]);
    v12 = (void *)objc_msgSend(v11, "initWithKey:withValue:withComparisonOperation:", *MEMORY[0x1E0D801E8], v10, 0);
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "storage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7FEE0], "entryKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v12;
    v63[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "entriesForKey:withComparisons:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      v39 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:]");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "printError:", v40);

      NSLog(CFSTR("Fail: Returned from line: %d"), 2454);
      v38 = 0;
LABEL_24:

      goto LABEL_25;
    }
    v55 = v17;
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc(MEMORY[0x1E0D80080]);
    v20 = *MEMORY[0x1E0D801C8];
    v54 = v18;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v18, "entryID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "initWithKey:withValue:withComparisonOperation:", v20, v21, 0);

    v23 = objc_alloc(MEMORY[0x1E0D80080]);
    v24 = *MEMORY[0x1E0D801D0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v23, "initWithKey:withValue:withComparisonOperation:", v24, v25, 0);

    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "storage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7FED0], "entryKey");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)v22;
    v62[0] = v22;
    v62[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "entriesForKey:withComparisons:", v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v32 = objc_msgSend(v31, "count");
      if (a4 != 0.0 && !v32)
        goto LABEL_6;
    }
    else if (a4 != 0.0)
    {
LABEL_6:
      v33 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:]");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "printError:", v34);
      v35 = 2470;
      goto LABEL_22;
    }
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v41 = v31;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v58;
      v45 = *MEMORY[0x1E0D801C0];
      v46 = 0.0;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v58 != v44)
            objc_enumerationMutation(v41);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "objectForKeyedSubscript:", v45);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "doubleValue");
          v46 = v46 + v49 / 1000.0;

        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      }
      while (v43);
    }
    else
    {
      v46 = 0.0;
    }

    if (vabdd_f64(v46, a4) <= a6)
    {
      v38 = 1;
      v17 = v55;
      v12 = v56;
      v50 = v54;
LABEL_23:

      goto LABEL_24;
    }
    v51 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:]");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "printError:", v34);
    v35 = 2482;
LABEL_22:
    v50 = v54;
    v17 = v55;

    NSLog(CFSTR("Fail: Returned from line: %d"), v35);
    v38 = 0;
    v12 = v56;
    goto LABEL_23;
  }
  v36 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyTotalEnergyWithNodeName:withTotalEnergy:withRootNodeID:withEpsilon:]");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "printError:", v37);

  NSLog(CFSTR("Fail: Returned from line: %d"), 2443);
  v38 = 0;
LABEL_25:

  return v38;
}

- (BOOL)verifyTotalCorrectionEnergyWithNodeName:(id)a3 withTotalCorrectionEnergy:(double)a4 withRootNodeID:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  uint64_t i;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _QWORD v59[2];
  _QWORD v60[3];

  v5 = *(_QWORD *)&a5;
  v60[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[PLAccountingDebugService blockingClearQueues](self, "blockingClearQueues");
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0D80080]);
    v10 = objc_msgSend(v9, "initWithKey:withValue:withComparisonOperation:", *MEMORY[0x1E0D801E8], v8, 0);
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "storage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7FEE0], "entryKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)v10;
    v60[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "entriesForKey:withComparisons:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v46 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:]");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "printError:", v47);

      NSLog(CFSTR("Fail: Returned from line: %d"), 2506);
      v42 = 0;
LABEL_22:

      goto LABEL_23;
    }
    v52 = v15;
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x1E0D80080]);
    v18 = *MEMORY[0x1E0D801C8];
    v51 = v16;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v16, "entryID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "initWithKey:withValue:withComparisonOperation:", v18, v19, 0);

    v21 = (void *)v20;
    v22 = objc_alloc(MEMORY[0x1E0D80080]);
    v23 = *MEMORY[0x1E0D801D0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v22, "initWithKey:withValue:withComparisonOperation:", v23, v24, 0);

    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "storage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7FED0], "entryKey");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v21;
    v59[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "entriesForKey:withComparisons:", v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30 && objc_msgSend(v30, "count"))
    {
      v50 = v21;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v31 = v30;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v55;
        v35 = *MEMORY[0x1E0D801B0];
        v36 = 0.0;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v55 != v34)
              objc_enumerationMutation(v31);
            objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "objectForKeyedSubscript:", v35);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "doubleValue");
            v36 = v36 + v39 / 1000.0;

          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
        }
        while (v33);
      }
      else
      {
        v36 = 0.0;
      }

      if (vabdd_f64(v36, a4) <= 0.001)
      {
        v42 = 1;
        v15 = v52;
        v21 = v50;
LABEL_21:

        goto LABEL_22;
      }
      v48 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:]");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "printError:", v44);
      v45 = 2532;
      v15 = v52;
      v21 = v50;
    }
    else
    {
      v43 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:]");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "printError:", v44);
      v45 = 2521;
      v15 = v52;
    }

    NSLog(CFSTR("Fail: Returned from line: %d"), v45);
    v42 = 0;
    goto LABEL_21;
  }
  v40 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyTotalCorrectionEnergyWithNodeName:withTotalCorrectionEnergy:withRootNodeID:]");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "printError:", v41);

  NSLog(CFSTR("Fail: Returned from line: %d"), 2495);
  v42 = 0;
LABEL_23:

  return v42;
}

- (BOOL)verifyAggregateRootNodeEnergyWithNodeName:(id)a3 withRootNodeID:(int)a4 withEnergy:(double)a5 withDate:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
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
  BOOL v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[4];
  _QWORD v62[2];

  v8 = *(_QWORD *)&a4;
  v62[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  -[PLAccountingDebugService blockingClearQueues](self, "blockingClearQueues");
  if (v10 && (int)v8 > 0)
  {
    v12 = objc_alloc(MEMORY[0x1E0D80080]);
    v13 = objc_msgSend(v12, "initWithKey:withValue:withComparisonOperation:", *MEMORY[0x1E0D801E8], v10, 0);
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "storage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7FEE0], "entryKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)v13;
    v62[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "entriesForKey:withComparisons:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v48 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:]");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "printError:", v49);

      NSLog(CFSTR("Fail: Returned from line: %d"), 2557);
      v47 = 0;
LABEL_14:

      goto LABEL_15;
    }
    v58 = v18;
    objc_msgSend(v18, "firstObject");
    v19 = v11;
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc(MEMORY[0x1E0D80080]);
    v22 = *MEMORY[0x1E0D801A0];
    v59 = (void *)v20;
    v23 = (void *)v20;
    v11 = v19;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v23, "entryID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v21, "initWithKey:withValue:withComparisonOperation:", v22, v24, 0);

    v26 = objc_alloc(MEMORY[0x1E0D80080]);
    v27 = *MEMORY[0x1E0D801A8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v26, "initWithKey:withValue:withComparisonOperation:", v27, v28, 0);

    objc_msgSend(v11, "timeIntervalSince1970");
    v31 = floor(v30 / 3600.0) * 3600.0;
    v32 = objc_alloc(MEMORY[0x1E0D80080]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "initWithKey:withValue:withComparisonOperation:", CFSTR("timestamp"), v33, 0);

    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("timeInterval"), &unk_1E86530A0, 0);
    objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", *MEMORY[0x1E0D80368], *MEMORY[0x1E0D80190]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "storage");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)v29;
    v57 = (void *)v25;
    v61[0] = v25;
    v61[1] = v29;
    v55 = (void *)v34;
    v61[2] = v34;
    v61[3] = v35;
    v39 = (void *)v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "lastEntryForKey:withComparisons:isSingleton:", v36, v40, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5 == 0.0 || v41)
    {
      objc_msgSend(v41, "objectForKeyedSubscript:", *MEMORY[0x1E0D80198]);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "doubleValue");
      v52 = v51 / 1000.0;

      if (vabdd_f64(v52, a5) <= 0.001)
      {
        v47 = 1;
        v18 = v58;
LABEL_13:

        goto LABEL_14;
      }
      v53 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:]");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "printError:", v43);
      v44 = 2597;
    }
    else
    {
      v42 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:]");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "printError:", v43);
      v44 = 2589;
    }
    v18 = v58;

    NSLog(CFSTR("Fail: Returned from line: %d"), v44);
    v47 = 0;
    goto LABEL_13;
  }
  v45 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyAggregateRootNodeEnergyWithNodeName:withRootNodeID:withEnergy:withDate:]");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "printError:", v46);

  NSLog(CFSTR("Fail: Returned from line: %d"), 2546);
  v47 = 0;
LABEL_15:

  return v47;
}

- (BOOL)verifyAggregateQualificationEnergyWithQualificationID:(int)a3 withRootNodeID:(int)a4 withNodeName:(id)a5 withQualificationEnergy:(double)a6 withDate:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  double v34;
  double v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  BOOL v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  _QWORD v68[5];
  _QWORD v69[2];

  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v69[1] = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a7;
  -[PLAccountingDebugService blockingClearQueues](self, "blockingClearQueues");
  if ((int)v10 >= 1 && (int)v9 >= 1 && v12)
  {
    v67 = v13;
    v14 = objc_alloc(MEMORY[0x1E0D80080]);
    v65 = v12;
    v15 = objc_msgSend(v14, "initWithKey:withValue:withComparisonOperation:", *MEMORY[0x1E0D801E8], v12, 0);
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "storage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7FEE0], "entryKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)v15;
    v69[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "entriesForKey:withComparisons:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      v52 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:]");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "printError:", v53);

      NSLog(CFSTR("Fail: Returned from line: %d"), 2623);
      v51 = 0;
      v54 = v66;
      v12 = v65;
LABEL_15:

      goto LABEL_16;
    }
    v63 = v20;
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc(MEMORY[0x1E0D80080]);
    v23 = *MEMORY[0x1E0D80178];
    v64 = v21;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v21, "entryID"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v22, "initWithKey:withValue:withComparisonOperation:", v23, v24, 0);

    v26 = objc_alloc(MEMORY[0x1E0D80080]);
    v27 = *MEMORY[0x1E0D80188];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v26, "initWithKey:withValue:withComparisonOperation:", v27, v28, 0);

    v30 = objc_alloc(MEMORY[0x1E0D80080]);
    v31 = *MEMORY[0x1E0D80180];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v30, "initWithKey:withValue:withComparisonOperation:", v31, v32, 0);

    objc_msgSend(v67, "timeIntervalSince1970");
    v35 = floor(v34 / 3600.0) * 3600.0;
    v36 = objc_alloc(MEMORY[0x1E0D80080]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "initWithKey:withValue:withComparisonOperation:", CFSTR("timestamp"), v37, 0);

    v39 = (void *)v38;
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("timeInterval"), &unk_1E86530A0, 0);
    objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", *MEMORY[0x1E0D80368], *MEMORY[0x1E0D80168]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "storage");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)v29;
    v62 = (void *)v25;
    v68[0] = v25;
    v68[1] = v29;
    v60 = (void *)v33;
    v68[2] = v33;
    v68[3] = v39;
    v68[4] = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 5);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "lastEntryForKey:withComparisons:isSingleton:", v41, v44, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (a6 == 0.0 || v45)
    {
      objc_msgSend(v45, "objectForKeyedSubscript:", *MEMORY[0x1E0D80170]);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "doubleValue");
      v57 = v56 / 1000.0;

      v12 = v65;
      if (vabdd_f64(v57, a6) <= 0.001)
      {
        v51 = 1;
        v54 = v66;
        v20 = v63;
LABEL_14:

        v13 = v67;
        goto LABEL_15;
      }
      v58 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:]");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "printError:", v47);
      v48 = 2667;
      v20 = v63;
    }
    else
    {
      v46 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:]");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "printError:", v47);
      v48 = 2659;
      v20 = v63;
      v12 = v65;
    }

    NSLog(CFSTR("Fail: Returned from line: %d"), v48);
    v51 = 0;
    v54 = v66;
    goto LABEL_14;
  }
  v49 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService verifyAggregateQualificationEnergyWithQualificationID:withRootNodeID:withNodeName:withQualificationEnergy:withDate:]");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "printError:", v50);

  NSLog(CFSTR("Fail: Returned from line: %d"), 2612);
  v51 = 0;
LABEL_16:

  return v51;
}

- (void)blockingLogGasGaugeWithTotalPower:(double)a3 withStartDate:(id)a4 withEndDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  dispatch_semaphore_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  +[PLOperator entryKeyForType:andName:](PLBatteryAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("GasGauge"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__8;
  v25 = __Block_byref_object_dispose__8;
  v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v10, v8);
  objc_msgSend((id)v22[5], "setObject:forKeyedSubscript:", v9, CFSTR("timestampEnd"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v22[5], "setObject:forKeyedSubscript:", v11, CFSTR("TotalPower"));

  v12 = dispatch_semaphore_create(0);
  v13 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__PLAccountingDebugService_blockingLogGasGaugeWithTotalPower_withStartDate_withEndDate___block_invoke;
  v18[3] = &unk_1E857C320;
  v20 = &v21;
  v14 = v12;
  v19 = v14;
  v15 = (void *)objc_msgSend(v13, "initWithOperator:forEntryKey:withBlock:", self, v10, v18);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = CFSTR("entry");
  v28[0] = v22[5];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("PLBatteryAgent.fakeLogEntry"), 0, v17);

  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  _Block_object_dispose(&v21, 8);

}

void __88__PLAccountingDebugService_blockingLogGasGaugeWithTotalPower_withStartDate_withEndDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToDate:", v4);

  if (v5)
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)blockingClearQueues
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D80078], "workQueueForClass:", objc_opt_class());
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PLAccountingDebugService_blockingClearQueues__block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  dispatch_sync(v3, block);

  objc_msgSend(MEMORY[0x1E0D80078], "workQueueForClass:", objc_opt_class());
  v5 = objc_claimAutoreleasedReturnValue();
  v27[0] = v4;
  v27[1] = 3221225472;
  v27[2] = __47__PLAccountingDebugService_blockingClearQueues__block_invoke_573;
  v27[3] = &unk_1E85780C8;
  v27[4] = self;
  dispatch_sync(v5, v27);

  objc_msgSend(MEMORY[0x1E0D80078], "workQueueForClass:", objc_opt_class());
  v6 = objc_claimAutoreleasedReturnValue();
  v26[0] = v4;
  v26[1] = 3221225472;
  v26[2] = __47__PLAccountingDebugService_blockingClearQueues__block_invoke_578;
  v26[3] = &unk_1E85780C8;
  v26[4] = self;
  dispatch_sync(v6, v26);

  objc_msgSend(MEMORY[0x1E0D80078], "workQueueForClass:", objc_opt_class());
  v7 = objc_claimAutoreleasedReturnValue();
  v25[0] = v4;
  v25[1] = 3221225472;
  v25[2] = __47__PLAccountingDebugService_blockingClearQueues__block_invoke_583;
  v25[3] = &unk_1E85780C8;
  v25[4] = self;
  dispatch_sync(v7, v25);

  v8 = (void *)MEMORY[0x1E0D80078];
  objc_msgSend(MEMORY[0x1E0D7FF98], "storageQueueNameForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workQueueForKey:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v24[0] = v4;
  v24[1] = 3221225472;
  v24[2] = __47__PLAccountingDebugService_blockingClearQueues__block_invoke_587;
  v24[3] = &unk_1E85780C8;
  v24[4] = self;
  dispatch_sync(v10, v24);

  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "storage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "blockingFlushCachesWithReason:", CFSTR("PLAccountingDebugService"));

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v19 = v4;
    v20 = 3221225472;
    v21 = __47__PLAccountingDebugService_blockingClearQueues__block_invoke_593;
    v22 = &__block_descriptor_40_e5_v8__0lu32l8;
    v23 = objc_opt_class();
    if (qword_1ED886C30 != -1)
      dispatch_once(&qword_1ED886C30, &v19);
    if (byte_1ED886C05)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("flushes cleared"), v19, v20, v21, v22, v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService blockingClearQueues]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 2715);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v13;
        _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
}

void __47__PLAccountingDebugService_blockingClearQueues__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v0 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLAccountingDebugService_blockingClearQueues__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v0;
    if (qword_1ED886C08 != -1)
      dispatch_once(&qword_1ED886C08, block);
    if (_MergedGlobals_94)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLAccountingEngine work queue cleared"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lastPathComponent");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService blockingClearQueues]_block_invoke");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "logMessage:fromFile:fromFunction:fromLineNumber:", v1, v4, v5, 2700);

      PLLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v1;
        _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
}

uint64_t __47__PLAccountingDebugService_blockingClearQueues__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_94 = result;
  return result;
}

void __47__PLAccountingDebugService_blockingClearQueues__block_invoke_573()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v0 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLAccountingDebugService_blockingClearQueues__block_invoke_2_574;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v0;
    if (qword_1ED886C10 != -1)
      dispatch_once(&qword_1ED886C10, block);
    if (byte_1ED886C01)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLAccountingDistributionManager work queue cleared"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lastPathComponent");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService blockingClearQueues]_block_invoke");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "logMessage:fromFile:fromFunction:fromLineNumber:", v1, v4, v5, 2703);

      PLLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v1;
        _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
}

uint64_t __47__PLAccountingDebugService_blockingClearQueues__block_invoke_2_574(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C01 = result;
  return result;
}

void __47__PLAccountingDebugService_blockingClearQueues__block_invoke_578()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v0 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLAccountingDebugService_blockingClearQueues__block_invoke_2_579;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v0;
    if (qword_1ED886C18 != -1)
      dispatch_once(&qword_1ED886C18, block);
    if (byte_1ED886C02)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLAccountingCorrectionManager work queue cleared"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lastPathComponent");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService blockingClearQueues]_block_invoke");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "logMessage:fromFile:fromFunction:fromLineNumber:", v1, v4, v5, 2706);

      PLLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v1;
        _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
}

uint64_t __47__PLAccountingDebugService_blockingClearQueues__block_invoke_2_579(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C02 = result;
  return result;
}

void __47__PLAccountingDebugService_blockingClearQueues__block_invoke_583()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v0 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLAccountingDebugService_blockingClearQueues__block_invoke_2_584;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v0;
    if (qword_1ED886C20 != -1)
      dispatch_once(&qword_1ED886C20, block);
    if (byte_1ED886C03)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLAccountingQualificationManager work queue cleared"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lastPathComponent");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService blockingClearQueues]_block_invoke");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "logMessage:fromFile:fromFunction:fromLineNumber:", v1, v4, v5, 2709);

      PLLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v1;
        _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
}

uint64_t __47__PLAccountingDebugService_blockingClearQueues__block_invoke_2_584(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C03 = result;
  return result;
}

void __47__PLAccountingDebugService_blockingClearQueues__block_invoke_587()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v0 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLAccountingDebugService_blockingClearQueues__block_invoke_2_588;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v0;
    if (qword_1ED886C28 != -1)
      dispatch_once(&qword_1ED886C28, block);
    if (byte_1ED886C04)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLAccountingOperator storage queue cleared"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "lastPathComponent");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAccountingDebugService blockingClearQueues]_block_invoke");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "logMessage:fromFile:fromFunction:fromLineNumber:", v1, v4, v5, 2712);

      PLLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v1;
        _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
}

uint64_t __47__PLAccountingDebugService_blockingClearQueues__block_invoke_2_588(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C04 = result;
  return result;
}

uint64_t __47__PLAccountingDebugService_blockingClearQueues__block_invoke_593(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C05 = result;
  return result;
}

+ (void)printError:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("&&&&&&&&&&&&&&&&&&%@&&&&&&&&&&&&&&&&&&"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAccountingDebugService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLAccountingDebugService printError:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 2719);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

- (void)setTestNames:(id)a3
{
  objc_storeStrong((id *)&self->_testNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testNames, 0);
}

@end
