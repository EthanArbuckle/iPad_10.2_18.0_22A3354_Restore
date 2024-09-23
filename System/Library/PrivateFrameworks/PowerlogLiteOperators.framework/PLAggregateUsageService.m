@implementation PLAggregateUsageService

- (void)handleAudioStateChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t block;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLAggregateUsageService submitMetricsToAggd](self, "submitMetricsToAggd");
  objc_msgSend(v4, "objectForKey:", CFSTR("entry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Active"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v8 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __50__PLAggregateUsageService_handleAudioStateChange___block_invoke;
      v22 = &__block_descriptor_40_e5_v8__0lu32l8;
      v23 = v8;
      if (qword_1ED883728 != -1)
        dispatch_once(&qword_1ED883728, &block);
      if (byte_1ED8836C7)
      {
        v9 = CFSTR("OFF");
        if ((_DWORD)v7)
          v9 = CFSTR("ON");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Handle audio %@"), v9, block, v20, v21, v22, v23);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateUsageService handleAudioStateChange:]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 609);

        PLLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v10;
          _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLAggregateUsageService intervalData](self, "intervalData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entryDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertFromMonotonicToSystem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updateMetric:withTimestamp:forEvent:withValue:", CFSTR("AudioOnDuration"), v18, v7, 0xFFFFFFFFLL);

  }
}

- (PLIntervalData)intervalData
{
  return (PLIntervalData *)objc_getProperty(self, a2, 120, 1);
}

- (void)submitMetricsToAggd
{
  int v3;
  int v4;
  void *v5;

  v3 = -[PLAggregateUsageService numIntervalsToFill](self, "numIntervalsToFill");
  if (v3 >= 1)
  {
    v4 = v3;
    do
    {
      if (v4 == 1)
        -[PLAggregateUsageService updateSampledMetrics](self, "updateSampledMetrics");
      -[PLAggregateUsageService intervalData](self, "intervalData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "submitIntervalData");

      --v4;
    }
    while (v4);
  }
}

- (int)numIntervalsToFill
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
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
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD block[5];
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateUsageService intervalData](self, "intervalData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v5);
  v7 = (int)v6;

  if (v7 < 0)
  {
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_22;
    v17 = objc_opt_class();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __45__PLAggregateUsageService_numIntervalsToFill__block_invoke;
    v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v26[4] = v17;
    if (qword_1ED883770 != -1)
      dispatch_once(&qword_1ED883770, v26);
    if (!byte_1ED8836CE)
    {
LABEL_22:
      LODWORD(v9) = 0;
      return v9;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Intervals to fill = 0"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastPathComponent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateUsageService numIntervalsToFill]");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v20, v21, 724);

    PLLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v11;
      _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    LODWORD(v9) = 0;
    goto LABEL_21;
  }
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PLAggregateUsageService_numIntervalsToFill__block_invoke_246;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  if (qword_1ED883778 != -1)
    dispatch_once(&qword_1ED883778, block);
  v9 = (v7 / (int)*(double *)&qword_1ED883780 + 1);
  v24[0] = v8;
  v24[1] = 3221225472;
  v24[2] = __45__PLAggregateUsageService_numIntervalsToFill__block_invoke_2;
  v24[3] = &unk_1E85780C8;
  v24[4] = self;
  if (qword_1ED883788 != -1)
    dispatch_once(&qword_1ED883788, v24);
  v10 = 86400.0 / *(double *)&qword_1ED883790;
  if (86400.0 / *(double *)&qword_1ED883790 < (double)(int)v9)
  {
    -[PLAggregateUsageService handleLargeTimeGap](self, "handleLargeTimeGap", v10);
    v9 = 0;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled", v10))
  {
    v23[0] = v8;
    v23[1] = 3221225472;
    v23[2] = __45__PLAggregateUsageService_numIntervalsToFill__block_invoke_3;
    v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v23[4] = objc_opt_class();
    if (qword_1ED883798 != -1)
      dispatch_once(&qword_1ED883798, v23);
    if (byte_1ED8836CF)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Intervals to fill = %d"), v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateUsageService numIntervalsToFill]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 732);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v11;
        _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
LABEL_21:

    }
  }
  return v9;
}

uint64_t __51__PLAggregateUsageService_scheduleSubmissionAfter___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  _QWORD block[5];
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v3 = MEMORY[0x1E0C809B0];
  if (v2)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __51__PLAggregateUsageService_scheduleSubmissionAfter___block_invoke_2;
    v17[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v17[4] = objc_opt_class();
    if (qword_1ED883750 != -1)
      dispatch_once(&qword_1ED883750, v17);
    if (byte_1ED8836CC)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("Submit metrics triggered at %@!"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateUsageService scheduleSubmissionAfter:]_block_invoke");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 673);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "submitMetricsToAggd");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSince1970");
  v14 = v13;

  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __51__PLAggregateUsageService_scheduleSubmissionAfter___block_invoke_239;
  block[3] = &unk_1E85780C8;
  block[4] = *(_QWORD *)(a1 + 32);
  if (qword_1ED883758 != -1)
    dispatch_once(&qword_1ED883758, block);
  return objc_msgSend(*(id *)(a1 + 32), "scheduleSubmissionAfter:", (unint64_t)*(double *)&qword_1ED883760+ (unint64_t)v14/ (unint64_t)*(double *)&qword_1ED883760* (unint64_t)*(double *)&qword_1ED883760- (unint64_t)v14);
}

- (void)updateSampledMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  +[PLOperator entryKeyForType:andName:](PLBatteryAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("Battery"));
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastEntryForKey:", v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLAggregateUsageService intervalData](self, "intervalData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Level"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateMetric:withTimestamp:forEvent:withValue:", CFSTR("BatteryLevel"), 0, 1, objc_msgSend(v6, "intValue"));

    -[PLAggregateUsageService intervalData](self, "intervalData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Temperature"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateMetric:withTimestamp:forEvent:withValue:", CFSTR("BatteryTemperature"), 0, 1, objc_msgSend(v8, "intValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IsCharging"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v9, "BOOLValue");

    if ((_DWORD)v8)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Amperage"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "intValue");

      -[PLAggregateUsageService intervalData](self, "intervalData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "convertFromMonotonicToSystem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "updateMetric:withTimestamp:forEvent:withValue:", CFSTR("ChargerCurrent"), v14, 1, v11);

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AdapterVoltage"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "intValue");

      -[PLAggregateUsageService intervalData](self, "intervalData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "convertFromMonotonicToSystem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "updateMetric:withTimestamp:forEvent:withValue:", CFSTR("ChargerVoltage"), v19, 1, v16);

    }
  }

}

- (void)scheduleSubmissionAfter:(unint64_t)a3
{
  dispatch_time_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = dispatch_walltime(0, 1000000000 * a3);
  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PLAggregateUsageService_scheduleSubmissionAfter___block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  dispatch_after(v4, v5, block);

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __51__PLAggregateUsageService_scheduleSubmissionAfter___block_invoke_2_240;
    v15[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v15[4] = objc_opt_class();
    if (qword_1ED883768 != -1)
      dispatch_once(&qword_1ED883768, v15);
    if (byte_1ED8836CD)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("Scheduled submission at %@!"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateUsageService scheduleSubmissionAfter:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 683);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v9;
        _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
}

+ (id)defaults
{
  return &unk_1E864CB70;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAggregateUsageService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLAggregateUsageService)init
{
  PLAggregateUsageService *v3;
  objc_super v5;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "nonUIBuild") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLAggregateUsageService;
    self = -[PLOperator init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  void *v3;
  double v4;
  unint64_t v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;

  -[PLAggregateUsageService instantiateMetrics](self, "instantiateMetrics");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = (unint64_t)v4;

  -[PLOperator defaultDoubleForKey:](self, "defaultDoubleForKey:", CFSTR("IntervalDuration"));
  v7 = (unint64_t)v6 + v5 / (unint64_t)v6 * (unint64_t)v6 - v5;
  v8 = (unint64_t)v6 + v5 / (unint64_t)v6 * (unint64_t)v6;
  -[PLAggregateUsageService intervalData](self, "intervalData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCurrentInterval:", v10);

  -[PLAggregateUsageService initializeMetrics](self, "initializeMetrics");
  -[PLAggregateUsageService registerForEntryNotifications](self, "registerForEntryNotifications");
  -[PLAggregateUsageService scheduleSubmissionAfter:](self, "scheduleSubmissionAfter:", v7);
}

- (void)instantiateMetrics
{
  PLIntervalData *v3;
  PLIntervalData *intervalData;
  PLIntervalData *v5;
  PLIntervalData *v6;
  PLMetric *v7;
  PLIntervalData *v8;
  PLMetric *v9;
  PLIntervalData *v10;
  PLMetric *v11;
  PLIntervalData *v12;
  PLMetric *v13;
  PLIntervalData *v14;
  PLMetric *v15;
  PLIntervalData *v16;
  PLMetric *v17;
  PLIntervalData *v18;
  PLMetric *v19;
  PLIntervalData *v20;
  PLMetric *v21;
  PLIntervalData *v22;
  PLMetric *v23;
  PLIntervalData *v24;
  PLMetric *v25;
  PLIntervalData *v26;
  PLMetric *v27;
  PLIntervalData *v28;
  PLMetric *v29;
  _QWORD block[5];

  v3 = objc_alloc_init(PLIntervalData);
  intervalData = self->_intervalData;
  self->_intervalData = v3;

  v5 = self->_intervalData;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PLAggregateUsageService_instantiateMetrics__block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  if (qword_1ED8836F8 != -1)
    dispatch_once(&qword_1ED8836F8, block);
  -[PLIntervalData setIntervalDuration:](v5, "setIntervalDuration:", (int)*(double *)&qword_1ED883700);
  v6 = self->_intervalData;
  v7 = -[PLMetric initWithKey:withPosition:withNumBits:withDefault:andType:]([PLMetric alloc], "initWithKey:withPosition:withNumBits:withDefault:andType:", CFSTR("ScreenOnDuration"), 1, 3, 0, 0);
  -[PLIntervalData addMetric:](v6, "addMetric:", v7);

  v8 = self->_intervalData;
  v9 = -[PLMetric initWithKey:withPosition:withNumBits:withDefault:andType:]([PLMetric alloc], "initWithKey:withPosition:withNumBits:withDefault:andType:", CFSTR("WakeDuration"), 4, 3, 0, 0);
  -[PLIntervalData addMetric:](v8, "addMetric:", v9);

  v10 = self->_intervalData;
  v11 = -[PLMetric initWithKey:withPosition:withNumBits:withDefault:andType:]([PLMetric alloc], "initWithKey:withPosition:withNumBits:withDefault:andType:", CFSTR("AudioOnDuration"), 7, 3, 0, 0);
  -[PLIntervalData addMetric:](v10, "addMetric:", v11);

  v12 = self->_intervalData;
  v13 = -[PLMetric initWithKey:withPosition:withNumBits:withDefault:andType:]([PLMetric alloc], "initWithKey:withPosition:withNumBits:withDefault:andType:", CFSTR("ConnectedState"), 17, 1, 0, 1);
  -[PLIntervalData addMetric:](v12, "addMetric:", v13);

  v14 = self->_intervalData;
  v15 = -[PLMetric initWithKey:withPosition:withNumBits:withDefault:andType:]([PLMetric alloc], "initWithKey:withPosition:withNumBits:withDefault:andType:", CFSTR("ChargingState"), 18, 1, 0, 1);
  -[PLIntervalData addMetric:](v14, "addMetric:", v15);

  v16 = self->_intervalData;
  v17 = -[PLMetric initWithKey:withPosition:withNumBits:withDefault:andType:]([PLMetric alloc], "initWithKey:withPosition:withNumBits:withDefault:andType:", CFSTR("AdapterType"), 19, 3, 0, 1);
  -[PLIntervalData addMetric:](v16, "addMetric:", v17);

  v18 = self->_intervalData;
  v19 = -[PLMetric initWithKey:withPosition:withNumBits:withDefault:andType:]([PLMetric alloc], "initWithKey:withPosition:withNumBits:withDefault:andType:", CFSTR("ChargerCurrent"), 22, 5, 0, 1);
  -[PLIntervalData addMetric:](v18, "addMetric:", v19);

  v20 = self->_intervalData;
  v21 = -[PLMetric initWithKey:withPosition:withNumBits:withDefault:andType:]([PLMetric alloc], "initWithKey:withPosition:withNumBits:withDefault:andType:", CFSTR("ChargerVoltage"), 27, 5, 0, 1);
  -[PLIntervalData addMetric:](v20, "addMetric:", v21);

  v22 = self->_intervalData;
  v23 = -[PLMetric initWithKey:withPosition:withNumBits:withDefault:andType:]([PLMetric alloc], "initWithKey:withPosition:withNumBits:withDefault:andType:", CFSTR("LockState"), 32, 1, 0, 1);
  -[PLIntervalData addMetric:](v22, "addMetric:", v23);

  v24 = self->_intervalData;
  v25 = -[PLMetric initWithKey:withPosition:withNumBits:withDefault:andType:]([PLMetric alloc], "initWithKey:withPosition:withNumBits:withDefault:andType:", CFSTR("BatteryLevel"), 10, 7, 127, 2);
  -[PLIntervalData addMetric:](v24, "addMetric:", v25);

  v26 = self->_intervalData;
  v27 = -[PLMetric initWithKey:withPosition:withNumBits:withDefault:andType:]([PLMetric alloc], "initWithKey:withPosition:withNumBits:withDefault:andType:", CFSTR("PowerlogInit"), 0, 1, 0, 2);
  -[PLIntervalData addMetric:](v26, "addMetric:", v27);

  v28 = self->_intervalData;
  v29 = -[PLMetric initWithKey:withPosition:withNumBits:withDefault:andType:]([PLMetric alloc], "initWithKey:withPosition:withNumBits:withDefault:andType:", CFSTR("BatteryTemperature"), 33, 4, 1000, 2);
  -[PLIntervalData addMetric:](v28, "addMetric:", v29);

}

uint64_t __45__PLAggregateUsageService_instantiateMetrics__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultDoubleForKey:", CFSTR("IntervalDuration"));
  qword_1ED883700 = v2;
  return result;
}

- (void)initializeMetrics
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
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
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD block[5];

  v3 = *MEMORY[0x1E0D80378];
  +[PLOperator entryKeyForType:andName:](PLSleepWakeAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("PowerState"));
  v36 = (id)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastEntryForKey:", v36);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99D68];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PLAggregateUsageService_initializeMetrics__block_invoke;
    block[3] = &unk_1E85780C8;
    block[4] = self;
    if (qword_1ED883708 != -1)
      dispatch_once(&qword_1ED883708, block);
    v7 = -*(double *)&qword_1ED883710;
    -[PLAggregateUsageService intervalData](self, "intervalData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentInterval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateWithTimeInterval:sinceDate:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("State"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue") == 0;

    -[PLAggregateUsageService intervalData](self, "intervalData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateMetric:withTimestamp:forEvent:withValue:", CFSTR("WakeDuration"), v10, v12, 0xFFFFFFFFLL);

  }
  +[PLOperator entryKeyForType:andName:](PLBatteryAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("Battery"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastEntryForKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PLAggregateUsageService intervalData](self, "intervalData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Level"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateMetric:withTimestamp:forEvent:withValue:", CFSTR("BatteryLevel"), 0, 1, objc_msgSend(v18, "intValue"));

    -[PLAggregateUsageService intervalData](self, "intervalData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Temperature"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateMetric:withTimestamp:forEvent:withValue:", CFSTR("BatteryTemperature"), 0, 1, objc_msgSend(v20, "intValue"));

  }
  +[PLOperator entryKeyForType:andName:](PLSpringBoardAgent, "entryKeyForType:andName:", v3, CFSTR("SBLock"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "lastEntryForKey:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Locked"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v21;
    v25 = v16;
    v26 = v14;
    v27 = v5;
    v28 = objc_msgSend(v24, "BOOLValue") ^ 1;
    -[PLAggregateUsageService intervalData](self, "intervalData");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "entryDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "convertFromMonotonicToSystem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v24, "BOOLValue");
    v33 = v28;
    v5 = v27;
    v14 = v26;
    v16 = v25;
    v21 = v35;
    objc_msgSend(v29, "updateMetric:withTimestamp:forEvent:withValue:", CFSTR("LockState"), v31, v33, v32 ^ 1u);

  }
  -[PLAggregateUsageService intervalData](self, "intervalData");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "updateMetric:withTimestamp:forEvent:withValue:", CFSTR("PowerlogInit"), 0, 1, 1);

}

uint64_t __44__PLAggregateUsageService_initializeMetrics__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultDoubleForKey:", CFSTR("IntervalDuration"));
  qword_1ED883710 = v2;
  return result;
}

- (void)registerForEntryNotifications
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  v44[0] = MEMORY[0x1E0C809B0];
  v3 = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke;
  v44[3] = &unk_1E8577F48;
  v44[4] = self;
  objc_msgSend(MEMORY[0x1E0D7FFC8], "displayOnNotificationWithOperator:withBlock:", self, v44);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateUsageService setDisplayOnNotification:](self, "setDisplayOnNotification:", v4);

  v43[0] = v3;
  v43[1] = 3221225472;
  v43[2] = __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_2;
  v43[3] = &unk_1E8577F48;
  v43[4] = self;
  objc_msgSend(MEMORY[0x1E0D7FFC8], "displayOffNotificationWithOperator:withBlock:", self, v43);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateUsageService setDisplayOffNotification:](self, "setDisplayOffNotification:", v5);

  v42[0] = v3;
  v42[1] = 3221225472;
  v42[2] = __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_3;
  v42[3] = &unk_1E8577F48;
  v42[4] = self;
  objc_msgSend(MEMORY[0x1E0D7FFC8], "wakeEntryNotificationWithOperator:withBlock:", self, v42);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateUsageService setWakeEntryNotification:](self, "setWakeEntryNotification:", v6);

  v41[0] = v3;
  v7 = v3;
  v41[1] = 3221225472;
  v41[2] = __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_4;
  v41[3] = &unk_1E8577F48;
  v41[4] = self;
  objc_msgSend(MEMORY[0x1E0D7FFC8], "canSleepEntryNotificationWithOperator:withBlock:", self, v41);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateUsageService setSleepEntryNotification:](self, "setSleepEntryNotification:", v8);

  v9 = *MEMORY[0x1E0D80378];
  +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Routing"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v59 = CFSTR("Active");
  v57 = &unk_1E8633840;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v7;
  v40[1] = 3221225472;
  v40[2] = __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_192;
  v40[3] = &unk_1E8577F48;
  v40[4] = self;
  v14 = (void *)objc_msgSend(v10, "initWithOperator:forEntryKey:withFilter:withBlock:", self, v35, v13, v40);
  -[PLAggregateUsageService setAudioEntryNotification:](self, "setAudioEntryNotification:", v14);

  +[PLOperator entryKeyForType:andName:](PLSpringBoardAgent, "entryKeyForType:andName:", v9, CFSTR("SBLock"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v7;
  v39[1] = 3221225472;
  v39[2] = __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_2_193;
  v39[3] = &unk_1E8577F48;
  v39[4] = self;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFC8]), "initWithOperator:forEntryKey:withBlock:", self, v34, v39);
  -[PLAggregateUsageService setLockStateEntryNotification:](self, "setLockStateEntryNotification:", v15);

  +[PLOperator entryKeyForType:andName:](PLBatteryAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("ChargingInfo"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v55 = CFSTR("Connected");
  v53 = &unk_1E8633840;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_3_196;
  v38[3] = &unk_1E8577F48;
  v38[4] = self;
  v21 = (void *)objc_msgSend(v16, "initWithOperator:forEntryKey:withFilter:withBlock:", self, v33, v19, v38);
  -[PLAggregateUsageService setChargingEntryNotification:](self, "setChargingEntryNotification:", v21);

  +[PLOperator entryKeyForType:andName:](PLBatteryAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("Battery"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v51 = CFSTR("IsCharging");
  v49 = &unk_1E8633840;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v20;
  v37[1] = 3221225472;
  v37[2] = __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_4_199;
  v37[3] = &unk_1E8577F48;
  v37[4] = self;
  v27 = (void *)objc_msgSend(v23, "initWithOperator:forEntryKey:withFilter:withBlock:", self, v22, v26, v37);
  -[PLAggregateUsageService setBatteryIsChargingEntryNotification:](self, "setBatteryIsChargingEntryNotification:", v27);

  v28 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v47 = CFSTR("ExternalConnected");
  v45 = &unk_1E8633840;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v20;
  v36[1] = 3221225472;
  v36[2] = __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_5;
  v36[3] = &unk_1E8577F48;
  v36[4] = self;
  v32 = (void *)objc_msgSend(v28, "initWithOperator:forEntryKey:withFilter:withBlock:", self, v22, v31, v36);
  -[PLAggregateUsageService setBatteryExternalConnectedEntryNotification:](self, "setBatteryExternalConnectedEntryNotification:", v32);

}

uint64_t __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleScreenStateChange:withState:", a2, 1);
}

uint64_t __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleScreenStateChange:withState:", a2, 0);
}

uint64_t __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleWakeStateChange:withState:", a2, 1);
}

uint64_t __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleWakeStateChange:withState:", a2, 0);
}

uint64_t __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_192(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleAudioStateChange:", a2);
}

uint64_t __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_2_193(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleLockStateChange:", a2);
}

uint64_t __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_3_196(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleConnectedChange:", a2);
}

uint64_t __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_4_199(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleChargingChange:", a2);
}

uint64_t __56__PLAggregateUsageService_registerForEntryNotifications__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleExternalConnectedChange:", a2);
}

- (void)handleScreenStateChange:(id)a3 withState:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
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
  uint64_t block;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D7FFA0];
  v7 = a3;
  if (objc_msgSend(v6, "debugEnabled"))
  {
    v8 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __61__PLAggregateUsageService_handleScreenStateChange_withState___block_invoke;
    v23 = &__block_descriptor_40_e5_v8__0lu32l8;
    v24 = v8;
    if (qword_1ED883718 != -1)
      dispatch_once(&qword_1ED883718, &block);
    if (byte_1ED8836C5)
    {
      v9 = CFSTR("OFF");
      if (v4)
        v9 = CFSTR("ON");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Handle display %@"), v9, block, v21, v22, v23, v24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateUsageService handleScreenStateChange:withState:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 582);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v10;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLAggregateUsageService submitMetricsToAggd](self, "submitMetricsToAggd");
  objc_msgSend(v7, "objectForKey:", CFSTR("entry"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PLAggregateUsageService intervalData](self, "intervalData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "entryDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "convertFromMonotonicToSystem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateMetric:withTimestamp:forEvent:withValue:", CFSTR("ScreenOnDuration"), v19, v4, 0xFFFFFFFFLL);

  }
}

uint64_t __61__PLAggregateUsageService_handleScreenStateChange_withState___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8836C5 = result;
  return result;
}

- (void)handleWakeStateChange:(id)a3 withState:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
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
  uint64_t block;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D7FFA0];
  v7 = a3;
  if (objc_msgSend(v6, "debugEnabled"))
  {
    v8 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __59__PLAggregateUsageService_handleWakeStateChange_withState___block_invoke;
    v23 = &__block_descriptor_40_e5_v8__0lu32l8;
    v24 = v8;
    if (qword_1ED883720 != -1)
      dispatch_once(&qword_1ED883720, &block);
    if (byte_1ED8836C6)
    {
      v9 = CFSTR("Sleep");
      if (v4)
        v9 = CFSTR("Wake");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Handle device %@"), v9, block, v21, v22, v23, v24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateUsageService handleWakeStateChange:withState:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 593);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v10;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLAggregateUsageService submitMetricsToAggd](self, "submitMetricsToAggd");
  objc_msgSend(v7, "objectForKey:", CFSTR("entry"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PLAggregateUsageService intervalData](self, "intervalData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "entryDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "convertFromMonotonicToSystem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateMetric:withTimestamp:forEvent:withValue:", CFSTR("WakeDuration"), v19, v4, 0xFFFFFFFFLL);

  }
}

uint64_t __59__PLAggregateUsageService_handleWakeStateChange_withState___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8836C6 = result;
  return result;
}

uint64_t __50__PLAggregateUsageService_handleAudioStateChange___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8836C7 = result;
  return result;
}

- (void)handleLockStateChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t block;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLAggregateUsageService submitMetricsToAggd](self, "submitMetricsToAggd");
  objc_msgSend(v4, "objectForKey:", CFSTR("entry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Locked"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");
    v8 = v7 ^ 1u;

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v9 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __49__PLAggregateUsageService_handleLockStateChange___block_invoke;
      v23 = &__block_descriptor_40_e5_v8__0lu32l8;
      v24 = v9;
      if (qword_1ED883730 != -1)
        dispatch_once(&qword_1ED883730, &block);
      if (byte_1ED8836C8)
      {
        v10 = CFSTR("Unlock");
        if (v7)
          v10 = CFSTR("Lock");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Handle device %@"), v10, block, v21, v22, v23, v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateUsageService handleLockStateChange:]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 621);

        PLLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v11;
          _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLAggregateUsageService intervalData](self, "intervalData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entryDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "convertFromMonotonicToSystem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateMetric:withTimestamp:forEvent:withValue:", CFSTR("LockState"), v19, v8, v8);

  }
}

uint64_t __49__PLAggregateUsageService_handleLockStateChange___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8836C8 = result;
  return result;
}

- (void)handleConnectedChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t block;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLAggregateUsageService submitMetricsToAggd](self, "submitMetricsToAggd");
  objc_msgSend(v4, "objectForKey:", CFSTR("entry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Connected"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v7 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __49__PLAggregateUsageService_handleConnectedChange___block_invoke;
      v21 = &__block_descriptor_40_e5_v8__0lu32l8;
      v22 = v7;
      if (qword_1ED883738 != -1)
        dispatch_once(&qword_1ED883738, &block);
      if (byte_1ED8836C9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Handle charger change: %@"), v6, block, v19, v20, v21, v22);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateUsageService handleConnectedChange:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 632);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v8;
          _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    if ((objc_msgSend(v6, "intValue") & 0x80000000) == 0)
    {
      v14 = objc_msgSend(v6, "BOOLValue");
      -[PLAggregateUsageService intervalData](self, "intervalData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "entryDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "convertFromMonotonicToSystem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "updateMetric:withTimestamp:forEvent:withValue:", CFSTR("AdapterType"), v17, v14, objc_msgSend(v6, "intValue"));

    }
  }

}

uint64_t __49__PLAggregateUsageService_handleConnectedChange___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8836C9 = result;
  return result;
}

- (void)handleChargingChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t block;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLAggregateUsageService submitMetricsToAggd](self, "submitMetricsToAggd");
  objc_msgSend(v4, "objectForKey:", CFSTR("entry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("IsCharging"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Amperage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AdapterVoltage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v12 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v30 = 3221225472;
      v31 = __48__PLAggregateUsageService_handleChargingChange___block_invoke;
      v32 = &__block_descriptor_40_e5_v8__0lu32l8;
      v33 = v12;
      if (qword_1ED883740 != -1)
        dispatch_once(&qword_1ED883740, &block);
      if (byte_1ED8836CA)
      {
        v13 = CFSTR("Stop");
        if ((_DWORD)v7)
          v13 = CFSTR("Start");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Handle charging: %@ Current: %d, Voltage: %d"), v13, v9, v11, block, v30, v31, v32, v33);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateUsageService handleChargingChange:]");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 649);

        PLLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v14;
          _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLAggregateUsageService intervalData](self, "intervalData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entryDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "convertFromMonotonicToSystem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateMetric:withTimestamp:forEvent:withValue:", CFSTR("ChargingState"), v22, v7, v7);

    -[PLAggregateUsageService intervalData](self, "intervalData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entryDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "convertFromMonotonicToSystem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "updateMetric:withTimestamp:forEvent:withValue:", CFSTR("ChargerCurrent"), v25, v7, v9);

    -[PLAggregateUsageService intervalData](self, "intervalData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entryDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "convertFromMonotonicToSystem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "updateMetric:withTimestamp:forEvent:withValue:", CFSTR("ChargerVoltage"), v28, v7, v11);

  }
}

uint64_t __48__PLAggregateUsageService_handleChargingChange___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8836CA = result;
  return result;
}

- (void)handleExternalConnectedChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  uint64_t block;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLAggregateUsageService submitMetricsToAggd](self, "submitMetricsToAggd");
  objc_msgSend(v4, "objectForKey:", CFSTR("entry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ExternalConnected"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v8 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __57__PLAggregateUsageService_handleExternalConnectedChange___block_invoke;
      v21 = &__block_descriptor_40_e5_v8__0lu32l8;
      v22 = v8;
      if (qword_1ED883748 != -1)
        dispatch_once(&qword_1ED883748, &block);
      if (byte_1ED8836CB)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Handle external connected change: %d"), v7, block, v19, v20, v21, v22);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateUsageService handleExternalConnectedChange:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 663);

        PLLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v9;
          _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLAggregateUsageService intervalData](self, "intervalData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entryDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "convertFromMonotonicToSystem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateMetric:withTimestamp:forEvent:withValue:", CFSTR("ConnectedState"), v17, v7, v7);

  }
}

uint64_t __57__PLAggregateUsageService_handleExternalConnectedChange___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8836CB = result;
  return result;
}

uint64_t __51__PLAggregateUsageService_scheduleSubmissionAfter___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8836CC = result;
  return result;
}

uint64_t __51__PLAggregateUsageService_scheduleSubmissionAfter___block_invoke_239(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultDoubleForKey:", CFSTR("IntervalDuration"));
  qword_1ED883760 = v2;
  return result;
}

uint64_t __51__PLAggregateUsageService_scheduleSubmissionAfter___block_invoke_2_240(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8836CD = result;
  return result;
}

uint64_t __45__PLAggregateUsageService_numIntervalsToFill__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8836CE = result;
  return result;
}

uint64_t __45__PLAggregateUsageService_numIntervalsToFill__block_invoke_246(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultDoubleForKey:", CFSTR("IntervalDuration"));
  qword_1ED883780 = v2;
  return result;
}

uint64_t __45__PLAggregateUsageService_numIntervalsToFill__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultDoubleForKey:", CFSTR("IntervalDuration"));
  qword_1ED883790 = v2;
  return result;
}

uint64_t __45__PLAggregateUsageService_numIntervalsToFill__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8836CF = result;
  return result;
}

- (void)handleLargeTimeGap
{
  void *v3;
  void *v4;
  double v5;
  unint64_t v6;
  double v7;
  unint64_t v8;
  void *v9;
  id v10;

  -[PLAggregateUsageService intervalData](self, "intervalData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetMetrics");

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = (unint64_t)v5;

  -[PLOperator defaultDoubleForKey:](self, "defaultDoubleForKey:", CFSTR("IntervalDuration"));
  v8 = (unint64_t)v7 + v6 / (unint64_t)v7 * (unint64_t)v7;
  -[PLAggregateUsageService intervalData](self, "intervalData");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCurrentInterval:", v9);

}

- (PLEntryNotificationOperatorComposition)displayOnNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDisplayOnNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLEntryNotificationOperatorComposition)displayOffNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDisplayOffNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLEntryNotificationOperatorComposition)wakeEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setWakeEntryNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLEntryNotificationOperatorComposition)sleepEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSleepEntryNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLEntryNotificationOperatorComposition)audioEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAudioEntryNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLEntryNotificationOperatorComposition)batteryIsChargingEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBatteryIsChargingEntryNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLEntryNotificationOperatorComposition)batteryExternalConnectedEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBatteryExternalConnectedEntryNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PLEntryNotificationOperatorComposition)chargingEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setChargingEntryNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (PLEntryNotificationOperatorComposition)lockStateEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLockStateEntryNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void)setIntervalData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervalData, 0);
  objc_storeStrong((id *)&self->_lockStateEntryNotification, 0);
  objc_storeStrong((id *)&self->_chargingEntryNotification, 0);
  objc_storeStrong((id *)&self->_batteryExternalConnectedEntryNotification, 0);
  objc_storeStrong((id *)&self->_batteryIsChargingEntryNotification, 0);
  objc_storeStrong((id *)&self->_audioEntryNotification, 0);
  objc_storeStrong((id *)&self->_sleepEntryNotification, 0);
  objc_storeStrong((id *)&self->_wakeEntryNotification, 0);
  objc_storeStrong((id *)&self->_displayOffNotification, 0);
  objc_storeStrong((id *)&self->_displayOnNotification, 0);
}

@end
