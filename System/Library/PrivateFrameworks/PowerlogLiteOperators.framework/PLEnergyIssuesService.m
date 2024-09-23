@implementation PLEnergyIssuesService

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLEnergyIssuesService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitionEnergySignatures
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitionHighPowerDetection
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLEnergyIssuesService)init
{
  PLEnergyIssuesService *v3;
  objc_super v5;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLEnergyIssuesService;
    self = -[PLOperator init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  if ((objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd") & 1) == 0)
  {
    -[PLEnergyIssuesService setAssertionThresholds](self, "setAssertionThresholds");
    -[PLEnergyIssuesService setUpUrsa](self, "setUpUrsa");
    -[PLEnergyIssuesService initializeSafeguardsSystem](self, "initializeSafeguardsSystem");
  }
}

- (__CFDictionary)createAssertionThreshold:(int)a3 withAggregateLimit:(int)a4
{
  const __CFAllocator *v6;
  __CFDictionary *Mutable;
  CFNumberRef v8;
  CFNumberRef v9;
  int v11;
  int valuePtr;

  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  valuePtr = a3;
  v8 = CFNumberCreate(v6, kCFNumberIntType, &valuePtr);
  v11 = a4;
  v9 = CFNumberCreate(v6, kCFNumberIntType, &v11);
  CFDictionarySetValue(Mutable, CFSTR("Asssertion Duration Limit"), v8);
  CFDictionarySetValue(Mutable, CFSTR("Aggregate Assertion Limit"), v9);
  CFRelease(v8);
  CFRelease(v9);
  return Mutable;
}

- (void)setAssertionThresholds
{
  __CFDictionary *v3;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  uint64_t v22;
  _QWORD block[5];
  CFDictionaryValueCallBacks valueCallBacks;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&valueCallBacks.version = xmmword_1E857C3C0;
  *(_OWORD *)&valueCallBacks.release = *(_OWORD *)&off_1E857C3D0;
  valueCallBacks.equal = 0;
  v3 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], &valueCallBacks);
  CFDictionarySetValue(v3, CFSTR("Default Limits"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 1800, 1800));
  CFDictionarySetValue(v3, CFSTR("backboardd"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 999999, 999999));
  CFDictionarySetValue(v3, CFSTR("SpringBoard"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 999999, 999999));
  CFDictionarySetValue(v3, CFSTR("mediaserverd"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 7200, 3150));
  CFDictionarySetValue(v3, CFSTR("locationd"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 7200, 3150));
  CFDictionarySetValue(v3, CFSTR("InCallService"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 999999, 999999));
  CFDictionarySetValue(v3, CFSTR("itunesstored"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 3600, 2250));
  CFDictionarySetValue(v3, CFSTR("CommCenter"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 7200, 3150));
  CFDictionarySetValue(v3, CFSTR("assertiond"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 3600, 2250));
  CFDictionarySetValue(v3, CFSTR("nsurlsessiond"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 3600, 2250));
  CFDictionarySetValue(v3, CFSTR("MobileMail"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 1800, 1800));
  CFDictionarySetValue(v3, CFSTR("assetsd"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 1800, 1800));
  CFDictionarySetValue(v3, CFSTR("iaptransportd"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 1800, 1800));
  CFDictionarySetValue(v3, CFSTR("bluetoothd"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 3600, 999999));
  CFDictionarySetValue(v3, CFSTR("identityservicesd"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 1800, 1800));
  CFDictionarySetValue(v3, CFSTR("cloudd"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 3600, 3600));
  CFDictionarySetValue(v3, CFSTR("backupd"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 3600, 2250));
  CFDictionarySetValue(v3, CFSTR("apsd"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 3600, 999999));
  CFDictionarySetValue(v3, CFSTR("ReportCrash"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 999999, 999999));
  CFDictionarySetValue(v3, CFSTR("com.apple.TapToRadar"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 7200, 3150));
  CFDictionarySetValue(v3, CFSTR("iapd"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 3600, 2250));
  CFDictionarySetValue(v3, CFSTR("Music"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 7200, 3150));
  CFDictionarySetValue(v3, CFSTR("pmset"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 999999, 999999));
  CFDictionarySetValue(v3, CFSTR("Tap-To-Radar"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 7200, 3150));
  CFDictionarySetValue(v3, CFSTR("callservicesd"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 999999, 999999));
  CFDictionarySetValue(v3, CFSTR("terminusd"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 999999, 999999));
  CFDictionarySetValue(v3, CFSTR("wifid"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 999999, 2250));
  CFDictionarySetValue(v3, CFSTR("softwareupdateservicesd"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 3600, 999999));
  CFDictionarySetValue(v3, CFSTR("sharingd"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 3600, 999999));
  CFDictionarySetValue(v3, CFSTR("homed"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 3600, 999999));
  CFDictionarySetValue(v3, CFSTR("dasd"), -[PLEnergyIssuesService createAssertionThreshold:withAggregateLimit:](self, "createAssertionThreshold:withAggregateLimit:", 3600, 999999));
  v4 = IOPMSetAssertionExceptionLimits();
  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  if (v4)
  {
    if (v5)
    {
      v6 = objc_opt_class();
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __47__PLEnergyIssuesService_setAssertionThresholds__block_invoke_84;
      v21 = &__block_descriptor_40_e5_v8__0lu32l8;
      v22 = v6;
      if (qword_1ED883458 != -1)
        dispatch_once(&qword_1ED883458, &v18);
      if (byte_1ED883449)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsuccessful initialization of thresholds"), v18, v19, v20, v21, v22);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLEnergyIssuesService.m");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEnergyIssuesService setAssertionThresholds]");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 798);

        PLLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v7;
LABEL_18:
          _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
    }
  }
  else if (v5)
  {
    v13 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLEnergyIssuesService_setAssertionThresholds__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v13;
    if (qword_1ED883450 != -1)
      dispatch_once(&qword_1ED883450, block);
    if (_MergedGlobals_1_31)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Succesful initialization of thresholds"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLEnergyIssuesService.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEnergyIssuesService setAssertionThresholds]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v16, v17, 795);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v7;
        goto LABEL_18;
      }
LABEL_13:

    }
  }
  if (v3)
  {
    CFDictionaryRemoveAllValues(v3);
    CFRelease(v3);
  }
}

uint64_t __47__PLEnergyIssuesService_setAssertionThresholds__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_31 = result;
  return result;
}

uint64_t __47__PLEnergyIssuesService_setAssertionThresholds__block_invoke_84(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883449 = result;
  return result;
}

- (void)handleAssertionNotifications
{
  dispatch_queue_t v2;

  v2 = dispatch_queue_create("PM test queue", 0);
  IOPMScheduleAssertionExceptionNotification();

}

void __53__PLEnergyIssuesService_handleAssertionNotifications__block_invoke()
{
  NSLog(CFSTR("AssertionException Created"));
}

+ (id)entryEventIntervalDefinitions
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
    return MEMORY[0x1E0C9AA70];
  v6 = CFSTR("UrsaDefinition");
  objc_msgSend(a1, "entryEventIntervalDefinitionsUrsaIssues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)entryEventIntervalDefinitionsUrsaIssues
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
  _QWORD v24[9];
  _QWORD v25[9];
  uint64_t v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x1E0C80C00];
  v28[0] = *MEMORY[0x1E0D80298];
  v26 = *MEMORY[0x1E0D80318];
  v27 = &unk_1E86530B0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  v28[1] = *MEMORY[0x1E0D802F0];
  v24[0] = CFSTR("radar");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  v24[1] = CFSTR("impact");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v19;
  v24[2] = CFSTR("timestampStart");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_DateFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v17;
  v24[3] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_DateFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v15;
  v24[4] = CFSTR("hitIn");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_StringFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v13;
  v24[5] = CFSTR("fixedIn");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_StringFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v3;
  v24[6] = CFSTR("isCritical");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v5;
  v24[7] = CFSTR("timestampInvalid");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_DateFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v7;
  v24[8] = CFSTR("driMessage");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
    return MEMORY[0x1E0C9AA70];
  v7[0] = CFSTR("UrsaSummary");
  objc_msgSend(a1, "entryEventPointDefinitionUrsaSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("UrsaInteraction");
  v8[0] = v3;
  objc_msgSend(a1, "entryEventPointDefinitionUrsaInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryEventPointDefinitionUrsaSummary
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
  v17 = &unk_1E86530C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("requestId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_StringFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("countBui");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("countNotification");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitionUrsaInteraction
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
  v15 = &unk_1E86530C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E0D802F0];
  v12[0] = CFSTR("source");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("radar");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("action");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setUpUrsa
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  _TtC21PowerlogLiteOperators10UrsaClient *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D80078], "mobileUserADG");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  if (!_os_feature_enabled_impl()
    || (objc_msgSend(MEMORY[0x1E0D80020], "internalBuild") ? (v5 = v4 == 0) : (v5 = 0), !v5))
  {
    PLLogUrsa();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEFAULT, "Feature disabled", (uint8_t *)&v13, 2u);
    }

LABEL_9:
    -[PLEnergyIssuesService deregisterUrsa](self, "deregisterUrsa");
    goto LABEL_10;
  }
  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "objectExistsForKey:", CFSTR("kUrsaEnabledKey")) & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:saveToDisk:", MEMORY[0x1E0C9AAB0], CFSTR("kUrsaEnabledKey"), 1);
  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:", CFSTR("kUrsaEnabledKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  PLLogUrsa();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("disabled");
    if (v8)
      v10 = CFSTR("enabled");
    v13 = 138412290;
    v14 = v10;
    _os_log_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEFAULT, "Feature %@", (uint8_t *)&v13, 0xCu);
  }

  if ((v8 & 1) == 0)
    goto LABEL_9;
  v11 = -[UrsaClient initWith:]([_TtC21PowerlogLiteOperators10UrsaClient alloc], "initWith:", -[PLEnergyIssuesService isUrsaDevModeEnabled](self, "isUrsaDevModeEnabled"));
  -[PLEnergyIssuesService setUrsaClient:](self, "setUrsaClient:", v11);

  -[PLEnergyIssuesService addUrsaResponders](self, "addUrsaResponders");
  -[PLEnergyIssuesService registerUrsa](self, "registerUrsa");
  LOBYTE(v13) = 0;
  -[PLEnergyIssuesService getUrsaTask:](self, "getUrsaTask:", &v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEnergyIssuesService updateParamsForUrsaTask:](self, "updateParamsForUrsaTask:", v12);
  if ((_BYTE)v13)
    -[PLEnergyIssuesService submitTask:](self, "submitTask:", v12);
  else
    -[PLEnergyIssuesService updateTask:](self, "updateTask:", v12);

LABEL_10:
}

- (BOOL)isUrsaDevModeEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:ifNotSet:", CFSTR("UrsaDevMode"), MEMORY[0x1E0C9AAA0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)addUrsaResponders
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = objc_alloc(MEMORY[0x1E0D80090]);
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__PLEnergyIssuesService_addUrsaResponders__block_invoke;
  v8[3] = &unk_1E8578610;
  v8[4] = self;
  v5 = (void *)objc_msgSend(v3, "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C5D0, v8);
  -[PLEnergyIssuesService setUrsaInvocationListener:](self, "setUrsaInvocationListener:", v5);

  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __42__PLEnergyIssuesService_addUrsaResponders__block_invoke_158;
  v7[3] = &unk_1E8578610;
  v7[4] = self;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C5F8, v7);
  -[PLEnergyIssuesService setUrsaInteractionListener:](self, "setUrsaInteractionListener:", v6);

}

void __42__PLEnergyIssuesService_addUrsaResponders__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogUrsa();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Payload for invocation via XPC: %@", (uint8_t *)&v12, 0xCu);
  }

  if (v6
    && (objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UrsaFetchFlagKey")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UrsaFetchFlagKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithString:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "fetchForIssuesWithFlag:", v11);
  }
  else
  {
    PLLogUrsa();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_ERROR, "No payload available or key missing", (uint8_t *)&v12, 2u);
    }
  }

}

void __42__PLEnergyIssuesService_addUrsaResponders__block_invoke_158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogUrsa();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Payload from Ursa Interaction via XPC: %@", (uint8_t *)&v10, 0xCu);
  }

  if (v6)
  {
    +[PLOperator entryKeyForType:andName:](PLEnergyIssuesService, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("UrsaInteraction"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v8, v6);
    objc_msgSend(*(id *)(a1 + 32), "logEntry:", v9);

  }
  else
  {
    PLLogUrsa();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_error_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_ERROR, "No payload available", (uint8_t *)&v10, 2u);
    }
  }

}

- (void)registerUrsa
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PLOperator workQueue](self, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__PLEnergyIssuesService_registerUrsa__block_invoke;
  v4[3] = &unk_1E857C450;
  objc_copyWeak(&v5, &location);
  -[PLEnergyIssuesService registerTaskWith:inQueue:launchHandler:](self, "registerTaskWith:inQueue:launchHandler:", CFSTR("com.apple.PerfPowerServices.ursaTask"), v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __37__PLEnergyIssuesService_registerUrsa__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleUrsaTask:", v3);

}

- (void)registerTaskWith:(id)a3 inQueue:(id)a4 launchHandler:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (void *)MEMORY[0x1E0D00E68];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "sharedScheduler");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerForTaskWithIdentifier:usingQueue:launchHandler:", v10, v9, v8);

}

- (id)getUrsaTask:(BOOL *)a3
{
  return -[PLEnergyIssuesService getRepeatingTaskWith:needsSubmit:](self, "getRepeatingTaskWith:needsSubmit:", CFSTR("com.apple.PerfPowerServices.ursaTask"), a3);
}

- (id)getRepeatingTaskWith:(id)a3 needsSubmit:(BOOL *)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "taskRequestForIdentifier:", CFSTR("com.apple.PerfPowerServices.ursaTask"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  *a4 = 0;
  if (!v6)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00E50]), "initWithIdentifier:", CFSTR("com.apple.PerfPowerServices.ursaTask"));
    *a4 = 1;
  }
  return v6;
}

- (void)updateParamsForUrsaTask:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setPriority:", 1);
  objc_msgSend(v3, "setRequiresNetworkConnectivity:", 1);
  objc_msgSend(v3, "setRequiresExternalPower:", 0);
  objc_msgSend(v3, "setInterval:", 21600.0);

}

- (void)submitTask:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLLogUrsa();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEFAULT, "Submitting task with id, %@...", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v7 = objc_msgSend(v6, "submitTaskRequest:error:", v3, &v12);
  v8 = v12;

  PLLogUrsa();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v7 & 1) == 0)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    objc_msgSend(v3, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v11;
    v15 = 2112;
    v16 = v8;
    _os_log_error_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_ERROR, "Failed to submit task with id, %@, error: %@", buf, 0x16u);
    goto LABEL_6;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v11;
    _os_log_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEFAULT, "Submitted task with id, %@", buf, 0xCu);
LABEL_6:

  }
LABEL_8:

}

- (void)updateTask:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLLogUrsa();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEFAULT, "Updating task with id, %@...", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v7 = objc_msgSend(v6, "updateTaskRequest:error:", v3, &v12);
  v8 = v12;

  PLLogUrsa();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v7 & 1) == 0)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    objc_msgSend(v3, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v11;
    v15 = 2112;
    v16 = v8;
    _os_log_error_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_ERROR, "Failed to update task with id, %@, error: %@", buf, 0x16u);
    goto LABEL_6;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v11;
    _os_log_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEFAULT, "Updated task with id, %@ successfully", buf, 0xCu);
LABEL_6:

  }
LABEL_8:

}

- (void)deregisterUrsa
{
  void *v3;
  void *v4;
  id v5;

  -[PLEnergyIssuesService setUrsaClient:](self, "setUrsaClient:", 0);
  -[PLEnergyIssuesService setUrsaInvocationListener:](self, "setUrsaInvocationListener:", 0);
  -[PLEnergyIssuesService setUrsaInteractionListener:](self, "setUrsaInteractionListener:", 0);
  -[PLEnergyIssuesService invalidateIssues](self, "invalidateIssues");
  objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "taskRequestForIdentifier:", CFSTR("com.apple.PerfPowerServices.ursaTask"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    -[PLEnergyIssuesService deregister:](self, "deregister:", v5);
    v4 = v5;
  }

}

- (void)deregister:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLLogUrsa();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEFAULT, "Deregistering task with id, %@...", (uint8_t *)&v12, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "deregisterTaskWithIdentifier:", v7);

  PLLogUrsa();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    objc_msgSend(v3, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v11;
    _os_log_error_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_ERROR, "Failed to deregister task with id, %@", (uint8_t *)&v12, 0xCu);
    goto LABEL_6;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v11;
    _os_log_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEFAULT, "Deregistered task with id, %@", (uint8_t *)&v12, 0xCu);
LABEL_6:

  }
LABEL_8:

}

- (void)handleUrsaTask:(id)a3
{
  id v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__PLEnergyIssuesService_handleUrsaTask___block_invoke;
  v5[3] = &unk_1E85780C8;
  v5[4] = self;
  v4 = a3;
  objc_msgSend(v4, "setExpirationHandler:", v5);
  -[PLEnergyIssuesService fetchForIssues](self, "fetchForIssues");
  objc_msgSend(v4, "setTaskCompleted");

}

void __40__PLEnergyIssuesService_handleUrsaTask___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "ursaClient");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancel");

}

- (void)fetchForIssues
{
  const __CFString *v3;

  if (_os_feature_enabled_impl())
    v3 = CFSTR("beta");
  else
    v3 = CFSTR("noFlag");
  -[PLEnergyIssuesService fetchForIssuesWithFlag:](self, "fetchForIssuesWithFlag:", v3);
}

- (void)fetchForIssuesWithFlag:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "nearestMidnightBeforeDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[PLEnergyIssuesService ursaClient](self, "ursaClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80078], "crashReporterKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80078], "buildVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80078], "hardwareModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __48__PLEnergyIssuesService_fetchForIssuesWithFlag___block_invoke;
  v16[3] = &unk_1E857C4A0;
  objc_copyWeak(&v18, &location);
  v16[4] = self;
  v15 = v10;
  v17 = v15;
  objc_msgSend(v11, "submitUrsaWith:build:device:flag:fetchStartTime:requestId:completion:", v12, v13, v14, v4, v15, v16, v8 + -86400.0);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __48__PLEnergyIssuesService_fetchForIssuesWithFlag___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  id *location;
  void *v47;
  _QWORD v48[5];
  id v49;
  uint64_t v50;
  uint64_t v51;
  id (*v52)(uint64_t);
  void *v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  id (*v57)(uint64_t);
  void *v58;
  id v59;
  void *v60;
  NSObject *v61;
  uint8_t buf[4];
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    PLLogUrsa();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v63 = (uint64_t)v5;
      _os_log_error_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_ERROR, "CloudKit function failed with error: %@", buf, 0xCu);
    }

    v55 = MEMORY[0x1E0C809B0];
    v56 = 3221225472;
    v57 = __48__PLEnergyIssuesService_fetchForIssuesWithFlag___block_invoke_175;
    v58 = &unk_1E8578178;
    v59 = v5;
    AnalyticsSendEventLazy();
    +[PLOperator entryKeyForType:andName:](PLEnergyIssuesService, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("UrsaSummary"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0D7FFB0]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "convertFromSystemToMonotonic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithEntryKey:withDate:", v8, v11);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v59, "code"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("error"));

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "logEntry:", v12);

    v15 = v59;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "convertFromSystemToMonotonic");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "nearestMidnightAfterDate:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertFromSystemToMonotonic");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[PLOperator entryKeyForType:andName:](PLEnergyIssuesService, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("UrsaDefinition"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "invalidateIssues");
    +[PLEnergyIssuesService createIssueEntriesFrom:forKey:now:midnight:](PLEnergyIssuesService, "createIssueEntriesFrom:forKey:now:midnight:", v6, v19, v16, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      v45 = v18;
      v47 = v16;
      v22 = MEMORY[0x1E0C809B0];
      v50 = MEMORY[0x1E0C809B0];
      v51 = 3221225472;
      v52 = __48__PLEnergyIssuesService_fetchForIssuesWithFlag___block_invoke_180;
      v53 = &unk_1E8578178;
      v23 = v20;
      v54 = v23;
      AnalyticsSendEventLazy();
      if (-[NSObject count](v23, "count"))
      {
        v24 = objc_loadWeakRetained((id *)(a1 + 48));
        v60 = v19;
        v61 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "logEntries:withGroupID:", v25, v19);

      }
      location = (id *)(a1 + 48);
      v26 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v26, "storage");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "blockingFlushCachesWithReason:", CFSTR("ursa"));

      if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "objectExistsForKey:", CFSTR("kUrsaNotificationEnabledKey")) & 1) == 0)
        objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:saveToDisk:", MEMORY[0x1E0C9AAB0], CFSTR("kUrsaNotificationEnabledKey"), 1);
      v43 = v19;
      if (_os_feature_enabled_impl()
        && (objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:", CFSTR("kUrsaNotificationEnabledKey")),
            v28 = (void *)objc_claimAutoreleasedReturnValue(),
            v29 = objc_msgSend(v28, "BOOLValue"),
            v28,
            v29))
      {
        v30 = objc_loadWeakRetained(location);
        objc_msgSend(v30, "removeNotifications");

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = v22;
        v48[1] = 3221225472;
        v48[2] = __48__PLEnergyIssuesService_fetchForIssuesWithFlag___block_invoke_2;
        v48[3] = &unk_1E857C478;
        v48[4] = *(_QWORD *)(a1 + 32);
        v32 = v31;
        v49 = v32;
        -[NSObject enumerateObjectsUsingBlock:](v23, "enumerateObjectsUsingBlock:", v48);
        v33 = objc_msgSend(v32, "count");
        PLLogUrsa();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = objc_msgSend(v32, "count");
          *(_DWORD *)buf = 134217984;
          v63 = v35;
          _os_log_impl(&dword_1CAF47000, v34, OS_LOG_TYPE_DEFAULT, "Found %lu critical issues", buf, 0xCu);
        }

        v36 = objc_loadWeakRetained(location);
        objc_msgSend(v36, "surfaceNotifications:", v32);

      }
      else
      {
        v33 = 0;
      }
      +[PLOperator entryKeyForType:andName:](PLEnergyIssuesService, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("UrsaSummary"), v43);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v37, v47);
      objc_msgSend(v38, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("requestId"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSObject count](v23, "count"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setObject:forKeyedSubscript:", v39, CFSTR("countBui"));

      v16 = v47;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v33);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setObject:forKeyedSubscript:", v40, CFSTR("countNotification"));

      v41 = objc_loadWeakRetained(location);
      objc_msgSend(v41, "logEntry:", v38);

      v42 = v54;
      v19 = v44;
      v18 = v45;
    }
    else
    {
      PLLogUrsa();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CAF47000, v42, OS_LOG_TYPE_ERROR, "No entries for ursa", buf, 2u);
      }
    }

  }
}

id __48__PLEnergyIssuesService_fetchForIssuesWithFlag___block_invoke_175(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("failed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __48__PLEnergyIssuesService_fetchForIssuesWithFlag___block_invoke_180(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("showing");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __48__PLEnergyIssuesService_fetchForIssuesWithFlag___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isCritical"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    v16[0] = CFSTR("Notification");
    v15[0] = CFSTR("source");
    v15[1] = CFSTR("radar");
    objc_msgSend(v3, "objectForKeyedSubscript:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = CFSTR("action");
    v16[1] = v6;
    v16[2] = CFSTR("seen");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = MEMORY[0x1E0C809B0];
    v14 = v7;
    v8 = v7;
    AnalyticsSendEventLazy();
    +[PLOperator entryKeyForType:andName:](PLEnergyIssuesService, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("UrsaInteraction"), v13, 3221225472, __48__PLEnergyIssuesService_fetchForIssuesWithFlag___block_invoke_3, &unk_1E8578178);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v9, v8);
    objc_msgSend(*(id *)(a1 + 32), "logEntry:", v10);
    v11 = *(void **)(a1 + 40);
    objc_msgSend(v3, "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

  }
}

id __48__PLEnergyIssuesService_fetchForIssuesWithFlag___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)invalidateIssues
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id obj;
  uint8_t buf[8];
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[PLOperator entryKeyForType:andName:](PLEnergyIssuesService, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("UrsaDefinition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entriesForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "storage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v9;
        v17[1] = 3221225472;
        v17[2] = __41__PLEnergyIssuesService_invalidateIssues__block_invoke;
        v17[3] = &unk_1E85780C8;
        v17[4] = v11;
        objc_msgSend(v13, "updateEntry:withBlock:", v11, v17);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  PLLogUrsa();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEFAULT, "Invalidated issues", buf, 2u);
  }

}

void __41__PLEnergyIssuesService_invalidateIssues__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, CFSTR("timestampInvalid"));

}

- (void)removeNotifications
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLQueryRegistered();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && (objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("UrsaNotificationState")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    PLLogUrsa();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Entire response from Notification Service: %@", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("UrsaNotificationState"));
    v6 = objc_claimAutoreleasedReturnValue();
    PLLogUrsa();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v9) = 0;
        _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "Response was successful", (uint8_t *)&v9, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_ERROR, "Response was failed", (uint8_t *)&v9, 2u);
    }

  }
  else
  {
    PLLogUrsa();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "Invalid response from Notification Service: %@", (uint8_t *)&v9, 0xCu);
    }
  }

}

- (void)surfaceNotifications:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ShowUrsaNotification"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("UrsaNotificationIssues"));
    PLQueryRegistered();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5
      && (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UrsaNotificationState")),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      PLLogUrsa();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v12 = 138412290;
        v13 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "Entire response from Notification Service: %@", (uint8_t *)&v12, 0xCu);
      }

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UrsaNotificationState"));
      v9 = objc_claimAutoreleasedReturnValue();
      PLLogUrsa();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v12) = 0;
          _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "Response was successful", (uint8_t *)&v12, 2u);
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v12) = 0;
        _os_log_error_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_ERROR, "Response was failed", (uint8_t *)&v12, 2u);
      }

    }
    else
    {
      PLLogUrsa();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v12 = 138412290;
        v13 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "Invalid response from Notification Service: %@", (uint8_t *)&v12, 0xCu);
      }
    }

  }
}

+ (id)createIssueEntriesFrom:(id)a3 forKey:(id)a4 now:(id)a5 midnight:(id)a6
{
  id v9;
  NSObject *v10;
  id v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  BOOL v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  int v40;
  NSObject *v41;
  const char *v42;
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
  void *v57;
  char v58;
  uint64_t v59;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t v80[128];
  uint8_t buf[4];
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v64 = a4;
  v65 = a5;
  v62 = a6;
  if (v9)
  {
    PLLogUrsa();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v82 = v9;
      _os_log_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEFAULT, "CloudKit function connected successfully: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v63 = (id)objc_claimAutoreleasedReturnValue();
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v61 = v9;
    v11 = v9;
    v68 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
    if (v68)
    {
      v12 = CFSTR("radar");
      v67 = *(_QWORD *)v77;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v77 != v67)
            objc_enumerationMutation(v11);
          v14 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v13);
          objc_msgSend(v14, "objectForKeyedSubscript:", v12, v61);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("impact"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("timestampStart"));
          v17 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("hitIn"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("fixedIn"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("isCritical"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("timestampInvalid"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("driMessage"));
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("notificationMessage"));
          v19 = objc_claimAutoreleasedReturnValue();
          v69 = (void *)v17;
          v70 = (void *)v19;
          if (!v15 || !v16 || !v17 || !v74 || !v73 || !v72 || !v18 || !v71 || !v75 || !v19)
          {
            PLLogUrsa();
            v32 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              goto LABEL_32;
            *(_DWORD *)buf = 138412290;
            v82 = v14;
            v41 = v32;
            v42 = "Insufficient information for issue. Given information: %@";
            goto LABEL_51;
          }
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v15;
          if (v15 == (void *)v20)
            goto LABEL_30;
          v22 = (void *)v20;
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v18;
          if (v18 == (void *)v23)
            goto LABEL_29;
          v25 = (void *)v23;
          v66 = v16;
          v26 = v12;
          v27 = v11;
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v28 = objc_claimAutoreleasedReturnValue();
          if (v75 == (void *)v28)
          {

            v24 = v25;
            v12 = v26;
LABEL_29:

            v21 = v22;
LABEL_30:

LABEL_31:
            PLLogUrsa();
            v32 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              goto LABEL_32;
            *(_DWORD *)buf = 138412290;
            v82 = v14;
            v41 = v32;
            v42 = "Null data found in issue: %@";
LABEL_51:
            _os_log_error_impl(&dword_1CAF47000, v41, OS_LOG_TYPE_ERROR, v42, buf, 0xCu);
            goto LABEL_32;
          }
          v29 = (void *)v28;
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          v31 = v70 == v30;
          v11 = v27;
          v12 = v26;
          v16 = v66;
          if (v31)
            goto LABEL_31;
          v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v64, v65);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v15, "unsignedIntValue"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v33, v26);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v18, "BOOLValue"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v34, CFSTR("isCritical"));

          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v75, CFSTR("driMessage"));
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v70, CFSTR("notificationMessage"));
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v71 == v35)
          {
            v37 = 0.0;
            v38 = v74;
LABEL_35:
            -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v62, CFSTR("timestampInvalid"));
            v40 = 0;
            goto LABEL_36;
          }
          objc_msgSend(v71, "doubleValue");
          v37 = v36;
          v38 = v74;
          if (v36 == 0.0)
            goto LABEL_35;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v36);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v39, CFSTR("timestampInvalid"));

          v40 = 1;
LABEL_36:
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if (v66 != v43)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v66, "unsignedIntValue"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v44, CFSTR("impact"));

          }
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (v69 != v45)
          {
            v46 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v69, "doubleValue");
            objc_msgSend(v46, "numberWithDouble:");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v47, CFSTR("timestampStart"));

          }
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38 != v48)
          {
            v49 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v38, "doubleValue");
            objc_msgSend(v49, "numberWithDouble:");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v50, CFSTR("timestampEnd"));

          }
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          if (v73 != v51)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v52, CFSTR("hitIn"));

          }
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v53 = (void *)objc_claimAutoreleasedReturnValue();

          if (v72 != v53)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v54, CFSTR("fixedIn"));

          }
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v37);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v55;
          if (!v40
            || (objc_msgSend(v55, "laterDate:", v65),
                v57 = (void *)objc_claimAutoreleasedReturnValue(),
                v58 = objc_msgSend(v57, "isEqualToDate:", v65),
                v57,
                (v58 & 1) == 0))
          {
            objc_msgSend(v63, "addObject:", v32);
          }

          v16 = v66;
LABEL_32:

          ++v13;
        }
        while (v68 != v13);
        v59 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
        v68 = v59;
      }
      while (v59);
    }

    v9 = v61;
  }
  else
  {
    v63 = 0;
  }

  return v63;
}

- (void)initializeSafeguardsSystem
{
  CSDaemon *v3;
  CSDaemon *safeguardsDaemon;
  PLStateTrackingComposition *v5;
  PLStateTrackingComposition *stateTrackerForSafeguards;
  PLStateTrackingComposition *v7;
  uint64_t v8;
  dispatch_time_t v9;
  _QWORD v10[5];
  _QWORD v11[5];

  if ((objc_msgSend(MEMORY[0x1E0D80020], "nonUIBuild") & 1) == 0)
  {
    initComputeSafeguards();
    v3 = (CSDaemon *)objc_claimAutoreleasedReturnValue();
    safeguardsDaemon = self->_safeguardsDaemon;
    self->_safeguardsDaemon = v3;

    objc_msgSend(MEMORY[0x1E0D80038], "sharedInstance");
    v5 = (PLStateTrackingComposition *)objc_claimAutoreleasedReturnValue();
    stateTrackerForSafeguards = self->_stateTrackerForSafeguards;
    self->_stateTrackerForSafeguards = v5;

    v7 = self->_stateTrackerForSafeguards;
    v8 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__PLEnergyIssuesService_initializeSafeguardsSystem__block_invoke;
    v11[3] = &unk_1E85780C8;
    v11[4] = self;
    -[PLStateTrackingComposition registerForStates:withOperator:withBlock:](v7, "registerForStates:withOperator:withBlock:", 5, self, v11);
    v9 = dispatch_time(0, 5000000000);
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __51__PLEnergyIssuesService_initializeSafeguardsSystem__block_invoke_2;
    v10[3] = &unk_1E85780C8;
    v10[4] = self;
    dispatch_after(v9, MEMORY[0x1E0C80D38], v10);
  }
}

uint64_t __51__PLEnergyIssuesService_initializeSafeguardsSystem__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleStateChangeForSafeguards");
}

uint64_t __51__PLEnergyIssuesService_initializeSafeguardsSystem__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateDisplayState");
  return objc_msgSend(*(id *)(a1 + 32), "updatePluggedInState");
}

- (void)handleStateChangeForSafeguards
{
  if (-[PLStateTrackingComposition stateChanged:](self->_stateTrackerForSafeguards, "stateChanged:", 4))
    -[PLEnergyIssuesService updateDisplayState](self, "updateDisplayState");
  if (-[PLStateTrackingComposition stateChanged:](self->_stateTrackerForSafeguards, "stateChanged:", 1))
    -[PLEnergyIssuesService updatePluggedInState](self, "updatePluggedInState");
}

- (void)updateDisplayState
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[PLStateTrackingComposition getCurrState:](self->_stateTrackerForSafeguards, "getCurrState:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogComputeSafeguards();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "Display state has changed to: %@", (uint8_t *)&v6, 0xCu);
  }

  if (objc_msgSend(v3, "intValue") == 1)
    v5 = &unk_1E8633588;
  else
    v5 = &unk_1E86335A0;
  -[CSDaemon updateContextForIdentifier:withState:](self->_safeguardsDaemon, "updateContextForIdentifier:withState:", CFSTR("Display"), v5);

}

- (void)updatePluggedInState
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[PLStateTrackingComposition getCurrState:](self->_stateTrackerForSafeguards, "getCurrState:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  PLLogComputeSafeguards();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "PluggedIn state has changed to: %d", (uint8_t *)v7, 8u);
  }

  if (v4)
    v6 = &unk_1E8633588;
  else
    v6 = &unk_1E86335A0;
  -[CSDaemon updateContextForIdentifier:withState:](self->_safeguardsDaemon, "updateContextForIdentifier:withState:", CFSTR("PluggedIn"), v6);
}

- (PLXPCListenerOperatorComposition)eventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEventListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLXPCListenerOperatorComposition)xpcListenerEnergyIssueTrigger
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setXpcListenerEnergyIssueTrigger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (_TtC21PowerlogLiteOperators10UrsaClient)ursaClient
{
  return (_TtC21PowerlogLiteOperators10UrsaClient *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUrsaClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLXPCListenerOperatorComposition)ursaInvocationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUrsaInvocationListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLXPCListenerOperatorComposition)ursaInteractionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setUrsaInteractionListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLStateTrackingComposition)stateTrackerForSafeguards
{
  return (PLStateTrackingComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStateTrackerForSafeguards:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CSDaemon)safeguardsDaemon
{
  return (CSDaemon *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSafeguardsDaemon:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safeguardsDaemon, 0);
  objc_storeStrong((id *)&self->_stateTrackerForSafeguards, 0);
  objc_storeStrong((id *)&self->_ursaInteractionListener, 0);
  objc_storeStrong((id *)&self->_ursaInvocationListener, 0);
  objc_storeStrong((id *)&self->_ursaClient, 0);
  objc_storeStrong((id *)&self->_xpcListenerEnergyIssueTrigger, 0);
  objc_storeStrong((id *)&self->_eventListener, 0);
}

@end
