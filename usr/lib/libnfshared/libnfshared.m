uint64_t NFLogGetLogger(unint64_t a1)
{
  if (a1 >= 4)
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  return (uint64_t)*(&_NFLogCustomLoggers + a1);
}

uint64_t NFIsInternalBuild()
{
  if (NFIsInternalBuild_onceToken != -1)
    dispatch_once(&NFIsInternalBuild_onceToken, &__block_literal_global_49);
  return NFIsInternalBuild_bVal;
}

uint64_t NFSharedSignpostLog()
{
  void *specific;
  uint64_t *v1;

  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v1 = &_NFSecondarySignpostLog;
  if (specific != (void *)3)
    v1 = &_NFSharedSignpostLog;
  return *v1;
}

uint64_t NFSharedMiddlewareSignpostLog(int a1)
{
  uint64_t v2;

  if (qword_1ECFF6A68 != -1)
    dispatch_once(&qword_1ECFF6A68, &__block_literal_global_8);
  v2 = 24;
  if (a1)
    v2 = 16;
  return *(_QWORD *)&_MergedGlobals_4[v2];
}

uint64_t NFSharedLogGetLogger(uint64_t a1)
{
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  return _NFSharedLogClient[a1];
}

void sub_1C34DDE70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1C34DE88C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t NF_isFeatureSupported(unsigned int a1)
{
  if (a1 > 3)
    return 0;
  else
    return featureFuncs[a1]();
}

unint64_t GetElapsedTimeInMillisecondsFromMachTime(uint64_t a1, uint64_t a2)
{
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  return (a1 - a2) * (unint64_t)info.numer / (1000000 * (unint64_t)info.denom);
}

uint64_t NFProductIsDevBoard()
{
  if (qword_1ECFF6A00 != -1)
    dispatch_once(&qword_1ECFF6A00, &__block_literal_global_60);
  return byte_1ECFF698B;
}

uint64_t featureExpress()
{
  if (qword_1ECFF6A28 != -1)
    dispatch_once(&qword_1ECFF6A28, &__block_literal_global_83);
  return byte_1ECFF698D;
}

BOOL NFProductIsNED()
{
  const void *v0;
  const void *v1;
  const void *v2;

  v0 = (const void *)MGCopyAnswer();
  v1 = v0;
  v2 = (const void *)*MEMORY[0x1E0C9AE50];
  if (v0 == (const void *)*MEMORY[0x1E0C9AE50] || v0)
    CFRelease(v0);
  return v1 == v2;
}

void sub_1C34DF050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t featureESEReader()
{
  if (qword_1ECFF6A30 != -1)
    dispatch_once(&qword_1ECFF6A30, &__block_literal_global_85);
  return byte_1ECFF698E;
}

void sub_1C34DF408(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C34DF484(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C34DF780(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *__getAnalyticsSendEventLazySymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (qword_1ECFF6978)
  {
    v2 = (void *)qword_1ECFF6978;
  }
  else
  {
    qword_1ECFF6978 = _sl_dlopen();
    v2 = (void *)qword_1ECFF6978;
    if (!qword_1ECFF6978)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AnalyticsSendEventLazy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  off_1ECFF6970 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL NFProductIsPhone()
{
  if (qword_1ECFF6A38 != -1)
    dispatch_once(&qword_1ECFF6A38, &__block_literal_global_87);
  return dword_1ECFF6994 == 1;
}

BOOL NFProductIsPad()
{
  if (qword_1ECFF6A38 != -1)
    dispatch_once(&qword_1ECFF6A38, &__block_literal_global_87);
  return dword_1ECFF6994 == 3;
}

uint64_t NFProductIsWatch()
{
  return 0;
}

uint64_t NFProductIsBridge()
{
  return 0;
}

uint64_t NFProductIsMac()
{
  return 0;
}

uint64_t NFProductIsASMac()
{
  return 0;
}

uint64_t NFProductGetName()
{
  if (qword_1ECFF69A0 != -1)
    dispatch_once(&qword_1ECFF69A0, &__block_literal_global_0);
  return qword_1ECFF6998;
}

uint64_t NFIsChinaSku()
{
  if (qword_1ECFF69A8 != -1)
    dispatch_once(&qword_1ECFF69A8, &__block_literal_global_5);
  return _MergedGlobals_1;
}

uint64_t NFIsGreenTea()
{
  if (qword_1ECFF69B0 != -1)
    dispatch_once(&qword_1ECFF69B0, &__block_literal_global_11);
  return byte_1ECFF6981;
}

uint64_t NFProductHasNFCRadio()
{
  if (qword_1ECFF69B8 != -1)
    dispatch_once(&qword_1ECFF69B8, &__block_literal_global_15);
  return byte_1ECFF6982;
}

uint64_t NFProductHasThermistor()
{
  if (qword_1ECFF69C0 != -1)
    dispatch_once(&qword_1ECFF69C0, &__block_literal_global_19);
  return byte_1ECFF6983;
}

uint64_t NFGetProductType()
{
  if (qword_1ECFF6A18 != -1)
    dispatch_once(&qword_1ECFF6A18, &__block_literal_global_73);
  return dword_1ECFF6990;
}

uint64_t NFThermalMonitorProvidedBySMC()
{
  if (qword_1ECFF69C0 != -1)
    dispatch_once(&qword_1ECFF69C0, &__block_literal_global_19);
  return byte_1ECFF6983;
}

BOOL NFProductHasB0LPKey()
{
  if (qword_1ECFF69C8 != -1)
    dispatch_once(&qword_1ECFF69C8, &__block_literal_global_21);
  return (byte_1ECFF6984 & 1) == 0;
}

uint64_t NFProductIsSIP()
{
  return 0;
}

uint64_t NFProductSupportsNFCReader()
{
  if (qword_1ECFF69D0 != -1)
    dispatch_once(&qword_1ECFF69D0, &__block_literal_global_29);
  return byte_1ECFF6985;
}

uint64_t NFIsUIBuild()
{
  if (qword_1ECFF69D8 != -1)
    dispatch_once(&qword_1ECFF69D8, &__block_literal_global_33);
  return byte_1ECFF6986;
}

uint64_t NFIsDarwinOS()
{
  if (qword_1ECFF69E0 != -1)
    dispatch_once(&qword_1ECFF69E0, &__block_literal_global_37);
  return byte_1ECFF6987;
}

uint64_t NFIsRestoreOS()
{
  if (qword_1ECFF69E8 != -1)
    dispatch_once(&qword_1ECFF69E8, &__block_literal_global_45);
  return byte_1ECFF6988;
}

uint64_t NFIsSimulator()
{
  if (qword_1ECFF69F0 != -1)
    dispatch_once(&qword_1ECFF69F0, &__block_literal_global_52);
  return byte_1ECFF6989;
}

uint64_t NFProductIsVM()
{
  if (qword_1ECFF69F8 != -1)
    dispatch_once(&qword_1ECFF69F8, &__block_literal_global_56);
  return byte_1ECFF698A;
}

BOOL NFPlatformShouldLimitAccessoryReaderTime()
{
  if (qword_1ECFF6A18 != -1)
    dispatch_once(&qword_1ECFF6A18, &__block_literal_global_73);
  return (dword_1ECFF6990 - 73) < 0xD;
}

BOOL NFPlatformShouldUseLookbackRestrictor()
{
  if (qword_1ECFF6A18 != -1)
    dispatch_once(&qword_1ECFF6A18, &__block_literal_global_73);
  return dword_1ECFF6990 != 67
      && (dword_1ECFF6990 - 11) > 4
      && (dword_1ECFF6990 & 0x77) != 16
      && (dword_1ECFF6990 - 17) > 3
      && (dword_1ECFF6990 & 0x7C) != 68
      && dword_1ECFF6990 != 72;
}

uint64_t NFBuildVersion()
{
  if (qword_1ECFF6A10 != -1)
    dispatch_once(&qword_1ECFF6A10, &__block_literal_global_66);
  return qword_1ECFF6A08;
}

BOOL NFIsProductType(int a1)
{
  if (qword_1ECFF6A18 != -1)
    dispatch_once(&qword_1ECFF6A18, &__block_literal_global_73);
  return dword_1ECFF6990 == a1;
}

BOOL NFIsNonRFDeviceWithLPMSupport()
{
  if (qword_1ECFF6A18 != -1)
    dispatch_once(&qword_1ECFF6A18, &__block_literal_global_73);
  return dword_1ECFF6990 == 95 || dword_1ECFF6990 == 96;
}

uint64_t NFProductSupportsAC()
{
  if (qword_1ECFF6A20 != -1)
    dispatch_once(&qword_1ECFF6A20, &__block_literal_global_75);
  return byte_1ECFF698C;
}

BOOL NFProductAllowsWiredInDLMode(int a1)
{
  mach_port_t v1;
  const char *v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_object_t v5;
  const __CFData *CFProperty;
  const __CFData *v7;
  CFTypeID v8;
  int v9;
  char *v10;
  void *specific;
  void (*v12)(uint64_t, const char *, ...);
  void *v13;
  NSObject *v14;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = *MEMORY[0x1E0CBBAA8];
  if (a1)
    v2 = "hammerfest-spmi";
  else
    v2 = "stockholm-spmi";
  v3 = IOServiceNameMatching(v2);
  MatchingService = IOServiceGetMatchingService(v1, v3);
  if (MatchingService)
  {
    v5 = MatchingService;
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("nfccModel"), 0, 0);
    if (CFProperty)
    {
      v7 = CFProperty;
      v8 = CFGetTypeID(CFProperty);
      if (v8 == CFDataGetTypeID() && CFDataGetLength(v7))
        v9 = *CFDataGetBytePtr(v7);
      else
        v9 = 0;
      CFRelease(v7);
    }
    else
    {
      v9 = 0;
    }
    IOObjectRelease(v5);
  }
  else
  {
    v10 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v12 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v12)
    {
      v12(3, "%s:%i Failed find IOKit service", "NFProductAllowsWiredInDLMode", 1189);
      v10 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v13 = dispatch_get_specific(v10);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v14 = _NFSharedLogClient[(_QWORD)v13];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "NFProductAllowsWiredInDLMode";
      v18 = 1024;
      v19 = 1189;
      _os_log_impl(&dword_1C34DB000, v14, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed find IOKit service", buf, 0x12u);
    }
    v9 = 0;
  }
  return (v9 - 209) < 3;
}

uint64_t featureUnknown()
{
  return 0;
}

BOOL featurePlatformHostWakeSupported()
{
  if (qword_1ECFF6A38 != -1)
    dispatch_once(&qword_1ECFF6A38, &__block_literal_global_87);
  return dword_1ECFF6994 == 1;
}

void __featureExpress_block_invoke()
{
  if (qword_1ECFF69B8 != -1)
    dispatch_once(&qword_1ECFF69B8, &__block_literal_global_15);
  byte_1ECFF698D = byte_1ECFF6982;
}

void __featureESEReader_block_invoke()
{
  if (qword_1ECFF69D0 != -1)
    dispatch_once(&qword_1ECFF69D0, &__block_literal_global_29);
  byte_1ECFF698E = byte_1ECFF6985;
  if (byte_1ECFF6985)
  {
    if (qword_1ECFF6A18 != -1)
      dispatch_once(&qword_1ECFF6A18, &__block_literal_global_73);
    if ((dword_1ECFF6990 - 1) <= 8)
      byte_1ECFF698E = 0;
  }
}

void sub_1C34E2D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void postAnalyticsHardwareExceptionEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v10;

  v10 = (void *)MEMORY[0x1C3BD2368]();
  +[NFExceptionsCALogger postHardwareExceptionEventWithAssertionCounter:hardwareType:wdogDump:hwFltDump:wdgTickInfo:](NFExceptionsCALogger, "postHardwareExceptionEventWithAssertionCounter:hardwareType:wdogDump:hwFltDump:wdgTickInfo:", a2, a1, a3, a4, a5);
  objc_autoreleasePoolPop(v10);
}

void postAnalyticsMiddlewareExceptionEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const char *a7)
{
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;

  v13 = (void *)MEMORY[0x1C3BD2368]();
  v14 = strlen(a7);
  if (v14)
  {
    if (v14 >= 0xC8)
      v15 = 200;
    else
      v15 = v14;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a7, v15);
    v17 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v16, 4);

  }
  else
  {
    v17 = CFSTR("No description provided");
  }
  +[NFExceptionsCALogger postMiddlewareExceptionEvent:mwVersion:errorType:errorCode:breadcrumb:description:](NFExceptionsCALogger, "postMiddlewareExceptionEvent:mwVersion:errorType:errorCode:breadcrumb:description:", a1, a2, a3, a4, a5, v17);
  +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:](NFGeneralStatisticsCALogger, "updateAnalyticsGeneralTransactionStatistics:", &unk_1E7D88B48);

  objc_autoreleasePoolPop(v13);
}

void postAnalyticsMainSERemovedEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1C3BD2368]();
  +[NFExceptionsCALogger postAnalyticsSERemovedEvent:hasExpressTransactionStarted:hasCardEmulationStarted:hardwareType:](NFExceptionsCALogger, "postAnalyticsSERemovedEvent:hasExpressTransactionStarted:hasCardEmulationStarted:hardwareType:", a2, 0, a3, a1);
  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "generateDailyUUIDForCA");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v12[0] = CFSTR("seRemovedEvt0Count");
  v12[1] = CFSTR("dailyDeviceUUID");
  v10 = CFSTR("noUUID");
  if (v8)
    v10 = (const __CFString *)v8;
  v13[0] = &unk_1E7D88568;
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.deviceExceptionStatistic"), v11);

  objc_autoreleasePoolPop(v6);
}

void postAnalyticsTxLdoOverCurrentErrorEvent()
{
  void *v0;

  v0 = (void *)MEMORY[0x1C3BD2368]();
  +[NFGeneralStatisticsCALogger updateGeneralDeviceStatistic:](NFGeneralStatisticsCALogger, "updateGeneralDeviceStatistic:", &unk_1E7D88B70);
  objc_autoreleasePoolPop(v0);
}

void postAnalyticsTxLdoErrorEvent(uint64_t a1, int a2)
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  LODWORD(v2) = a2;
  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1C3BD2368]();
  if (v2 >= 0x32)
    v2 = 50;
  else
    v2 = v2;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a1, v2);
  objc_msgSend(v5, "NF_asHexString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("status");
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postCAEventFor:eventInput:", CFSTR("com.apple.nfcd.exceptions.txLdoErrors"), v8);

  }
  objc_autoreleasePoolPop(v4);
}

uint64_t ValidateAPDUWithAIDAllowList(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v9;
  void *v10;
  char *v11;
  void *specific;
  void (*v13)(uint64_t, const char *, ...);
  void *v14;
  NSObject *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "instruction") == 164
    && objc_msgSend(v3, "p1") == 4
    && (objc_msgSend(v3, "payload"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "member:", v5),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    objc_msgSend(v3, "payload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "NF_asHexString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v13 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v13)
    {
      v13(3, "%s:%i %{public}@ not in allow list", "ValidateAPDUWithAIDAllowList", 62, v10);
      v11 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v14 = dispatch_get_specific(v11);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v15 = (id)_NFSharedLogClient[(_QWORD)v14];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v17 = "ValidateAPDUWithAIDAllowList";
      v18 = 1024;
      v19 = 62;
      v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_1C34DB000, v15, OS_LOG_TYPE_ERROR, "%{public}s:%i %{public}@ not in allow list", buf, 0x1Cu);
    }

    v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

id NFBootUUID()
{
  if (_MergedGlobals_2 != -1)
    dispatch_once(&_MergedGlobals_2, &__block_literal_global_1);
  return (id)qword_1ECFF6A48;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1C34EDE44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1C34EE74C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void NFSimulateCrash(int a1, uint64_t a2)
{
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v4 = _NFSharedLogClient[0];
  if (os_log_type_enabled((os_log_t)_NFSharedLogClient[0], OS_LOG_TYPE_FAULT))
  {
    v5[0] = 67109378;
    v5[1] = a1;
    v6 = 2082;
    v7 = a2;
    _os_log_fault_impl(&dword_1C34DB000, v4, OS_LOG_TYPE_FAULT, "Error 0x%02X : %{public}s", (uint8_t *)v5, 0x12u);
  }
}

void sub_1C34F6A04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1C34F6AA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C34F6BEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void NFSharedLogInitialize()
{
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
}

void NFSharedDumpTransport(int a1, const char *a2, uint64_t a3, unint64_t a4, int a5)
{
  void *specific;
  void *v10;
  void (*v11)(uint64_t, const char *, ...);
  NSObject *v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  void *v19;
  NSObject *v20;
  os_log_t v21;
  uint64_t v22;
  os_log_t v23;
  NSObject *v24;
  uint8_t buf[4];
  uint8_t *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  unint64_t v33;
  uint8_t v34[32];
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (qword_1ECFF6AB0 != -1)
    dispatch_once(&qword_1ECFF6AB0, &__block_literal_global_31);
  if (_MergedGlobals_4[0])
  {
    v35 = 0u;
    memset(v34, 0, sizeof(v34));
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v10 = specific;
    v11 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v12 = _NFSharedLogClient[(_QWORD)v10];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v27 = (uint8_t *)"NFSharedDumpTransport";
      v28 = 1024;
      v29 = 137;
      v30 = 2082;
      v31 = a2;
      v32 = 2048;
      v33 = a4;
      _os_log_impl(&dword_1C34DB000, v12, OS_LOG_TYPE_ERROR, "%s:%i %{public}s %lu bytes", buf, 0x26u);
    }
    if (v11)
      v11(4, "%s:%i %s %lu bytes :", "NFSharedDumpTransport", 137, a2, a4);
    if (a4)
    {
      v13 = 0;
      do
      {
        v14 = 0;
        v15 = (char *)&v34[__sprintf_chk((char *)v34, 0, 0x30uLL, "%04lX: ", v13)];
        do
        {
          v16 = v14 + 1;
          v17 = v14 + 1 + v13;
          v18 = sprintf(v15, "0x%02X ", *(unsigned __int8 *)(a3 + v13 + v14));
          if (v14 > 6)
            break;
          v15 += v18;
          ++v14;
        }
        while (v17 < a4);
        v19 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if (NFSharedLogInitialize_onceToken != -1)
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        v20 = _NFSharedLogClient[(_QWORD)v19];
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          v27 = v34;
          _os_log_impl(&dword_1C34DB000, v20, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
        }
        if (v11)
          v11(4, "%s", (const char *)v34);
        v13 += v16;
      }
      while (v17 < a4);
    }
  }
  else
  {
    v21 = (os_log_t)qword_1ECFF6A80;
    if (!a1
      || qword_1ECFF6A80
      || (v21 = os_log_create("com.apple.nfc", "nci.primary.dump"), (qword_1ECFF6A80 = (uint64_t)v21) != 0))
    {
      v22 = qword_1ECFF6A88;
      if ((a1 & 1) == 0 && !qword_1ECFF6A88)
      {
        v23 = os_log_create("com.apple.nfc", "nci.secondary.dump");
        qword_1ECFF6A88 = (uint64_t)v23;
        if (!v23)
          return;
        v22 = (uint64_t)v23;
        v21 = (os_log_t)qword_1ECFF6A80;
      }
      if (a1)
        v24 = v21;
      else
        v24 = v22;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v34 = 136446722;
        *(_QWORD *)&v34[4] = a2;
        *(_WORD *)&v34[12] = 1040;
        *(_DWORD *)&v34[14] = a4;
        *(_WORD *)&v34[18] = 2098;
        *(_QWORD *)&v34[20] = a3;
        _os_log_impl(&dword_1C34DB000, v24, OS_LOG_TYPE_ERROR, "%{public}s %{public,stockholm:NCI}.*P", v34, 0x1Cu);
      }
      if (a5)
      {
        if (a1)
        {
          os_release((void *)qword_1ECFF6A80);
          qword_1ECFF6A80 = 0;
        }
        else
        {
          os_release((void *)qword_1ECFF6A88);
          qword_1ECFF6A88 = 0;
        }
      }
    }
  }
}

void NFSharedLogTransport(char a1, const char *a2, uint64_t a3, unint64_t a4)
{
  void *specific;
  void *v8;
  void (*v9)(uint64_t, const char *, ...);
  NSObject *v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  void *v17;
  NSObject *v18;
  _QWORD block[7];
  char v21;
  uint8_t buf[4];
  char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  unint64_t v29;
  char v30[16];
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (qword_1ECFF6AB0 != -1)
    dispatch_once(&qword_1ECFF6AB0, &__block_literal_global_31);
  if (_MergedGlobals_4[0])
  {
    v31 = 0u;
    v32 = 0u;
    *(_OWORD *)v30 = 0u;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v8 = specific;
    v9 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v10 = _NFSharedLogClient[(_QWORD)v8];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v23 = "NFSharedLogTransport";
      v24 = 1024;
      v25 = 179;
      v26 = 2082;
      v27 = a2;
      v28 = 2048;
      v29 = a4;
      _os_log_impl(&dword_1C34DB000, v10, OS_LOG_TYPE_DEFAULT, "%s:%i %{public}s %lu bytes", buf, 0x26u);
    }
    if (v9)
      v9(5, "%s:%i %s %lu bytes :", "NFSharedLogTransport", 179, a2, a4);
    if (a4)
    {
      v11 = 0;
      do
      {
        v12 = 0;
        v13 = &v30[__sprintf_chk(v30, 0, 0x30uLL, "%04lX: ", v11)];
        do
        {
          v14 = v12 + 1;
          v15 = v12 + 1 + v11;
          v16 = sprintf(v13, "0x%02X ", *(unsigned __int8 *)(a3 + v11 + v12));
          if (v12 > 6)
            break;
          v13 += v16;
          ++v12;
        }
        while (v15 < a4);
        v17 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if (NFSharedLogInitialize_onceToken != -1)
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        v18 = _NFSharedLogClient[(_QWORD)v17];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446210;
          v23 = v30;
          _os_log_impl(&dword_1C34DB000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        if (v9)
          v9(5, "%s", v30);
        v11 += v14;
      }
      while (v15 < a4);
    }
  }
  else
  {
    if (qword_1ECFF6A90 != -1)
      dispatch_once(&qword_1ECFF6A90, &__block_literal_global_19_0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = __NFSharedLogTransport_block_invoke_2;
    block[3] = &__block_descriptor_tmp_23;
    v21 = a1;
    block[4] = a2;
    block[5] = a4;
    block[6] = a3;
    dispatch_sync((dispatch_queue_t)qword_1ECFF6A98, block);
  }
}

unint64_t NFLogSetLogger(unint64_t result, void *a2)
{
  if (result >= 4)
    __assert_rtn("NFLogSetLogger", "NFSharedLog.c", 209, "category < NFLogCategoryMax");
  *(&_NFLogCustomLoggers + result) = a2;
  return result;
}

void ___isInRestoreOS_block_invoke()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;

  v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    _MergedGlobals_4[0] = CFBooleanGetValue(v0) != 0;
    CFRelease(v1);
  }
}

void sub_1C34F8EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void postCADynamicRFChangedEvent()
{
  void *v0;

  v0 = (void *)MEMORY[0x1C3BD2368]();
  +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:](NFGeneralStatisticsCALogger, "updateAnalyticsGeneralTransactionStatistics:", &unk_1E7D88BC0);
  objc_autoreleasePoolPop(v0);
}

void resetCALoadStackExceptionCount()
{
  void *v0;
  void *v1;

  v0 = (void *)MEMORY[0x1C3BD2368]();
  +[NFCALogger sharedCALogger](NFCALogger, "sharedCALogger");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resetCALoadStackExceptionCount");

  objc_autoreleasePoolPop(v0);
}

_QWORD *TLVCreateWithData(_QWORD *a1)
{
  unint64_t v2;

  return _TLVCreateWithBytes(&v2, *a1 + a1[1], 0);
}

_QWORD *_TLVCreateWithBytes(unint64_t *a1, unint64_t a2, _WORD *a3)
{
  _QWORD *result;
  unsigned __int8 *v5;
  _QWORD *v8;
  unsigned __int8 *v9;
  unsigned int v10;
  int v11;
  unsigned __int8 *v12;
  int v13;
  int v14;
  unsigned __int8 *v15;
  unsigned int v16;
  _WORD *v17;
  int v18;
  int v19;
  int v20;
  void **v21;
  _DWORD *v22;
  _QWORD *Child;
  size_t v24;
  unsigned __int8 *v25;
  unsigned __int8 *v26;
  char *v27;
  void *specific;
  void (*v29)(uint64_t, const char *, ...);
  void *v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  char *v35;
  void *v36;
  void (*v37)(uint64_t, const char *, ...);
  void *v38;
  NSObject *v39;
  char *v40;
  void *v41;
  void (*v42)(uint64_t, const char *, ...);
  void *v43;
  char *v44;
  void *v45;
  void (*v46)(uint64_t, const char *, ...);
  void *v47;
  NSObject *v48;
  char *v49;
  void *v50;
  void (*v51)(uint64_t, const char *, ...);
  void *v52;
  NSObject *v53;
  char *v54;
  void *v55;
  void (*v56)(uint64_t, const char *, ...);
  void *v57;
  char *v58;
  void *v59;
  void (*v60)(uint64_t, const char *, ...);
  void *v61;
  char *v62;
  void *v63;
  void (*v64)(uint64_t, const char *, ...);
  void *v65;
  char *v66;
  void *v67;
  void (*v68)(uint64_t, const char *, ...);
  void *v69;
  _QWORD *v70;
  _QWORD *v71;
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  int v75;
  __int16 v76;
  int v77;
  __int16 v78;
  unsigned int v79;
  uint64_t v80;

  result = 0;
  v80 = *MEMORY[0x1E0C80C00];
  v71 = 0;
  v5 = (unsigned __int8 *)*a1;
  if (*a1 >= a2)
    return result;
  v8 = 0;
  while (1)
  {
    v9 = v5 + 1;
    *a1 = (unint64_t)(v5 + 1);
    v10 = *v5;
    if ((~v10 & 0x1F) == 0)
    {
      v11 = v10;
      while ((unint64_t)v9 < a2)
      {
        v12 = v9 + 1;
        *a1 = (unint64_t)(v9 + 1);
        v13 = (char)*v9;
        v14 = *v9++ | (v11 << 8);
        v11 = v14;
        if ((v13 & 0x80000000) == 0)
          goto LABEL_9;
      }
      v27 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)specific < 4)
      {
        v29 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
        if (v29)
        {
          v29(3, "%s:%i Underflow", "_TLVCreateWithBytes", 126);
          v27 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v30 = dispatch_get_specific(v27);
        if (NFSharedLogInitialize_onceToken != -1)
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        v31 = _NFSharedLogClient[(_QWORD)v30];
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          goto LABEL_70;
        *(_DWORD *)buf = 136446466;
        v73 = "_TLVCreateWithBytes";
        v74 = 1024;
        v75 = 126;
        v32 = "%{public}s:%i Underflow";
        v33 = v31;
        v34 = 18;
LABEL_69:
        _os_log_impl(&dword_1C34DB000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
        goto LABEL_70;
      }
LABEL_117:
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    }
    v12 = v9;
    v14 = v10;
LABEL_9:
    if ((unint64_t)v12 >= a2)
      break;
    v15 = v12 + 1;
    *a1 = (unint64_t)(v12 + 1);
    v16 = *v12;
    if (a3)
    {
      v17 = a3;
      do
      {
        v18 = (unsigned __int16)*v17;
        if (!*v17)
          goto LABEL_19;
        ++v17;
      }
      while (v18 != (unsigned __int16)v14);
      if (v16 == 255)
      {
        if ((unint64_t)v15 >= a2)
        {
          v62 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          v63 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          if ((unint64_t)v63 >= 4)
            goto LABEL_117;
          v64 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v63);
          if (v64)
          {
            v64(3, "%s:%i Underflow: tag=0x%x", "_TLVCreateWithBytes", 152, v14);
            v62 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v65 = dispatch_get_specific(v62);
          if (NFSharedLogInitialize_onceToken != -1)
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          v39 = _NFSharedLogClient[(_QWORD)v65];
          if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            goto LABEL_70;
          *(_DWORD *)buf = 136446722;
          v73 = "_TLVCreateWithBytes";
          v74 = 1024;
          v75 = 152;
          v76 = 1024;
          v77 = v14;
          v32 = "%{public}s:%i Underflow: tag=0x%x";
        }
        else
        {
          *a1 = (unint64_t)(v12 + 2);
          if ((unint64_t)(v12 + 2) < a2)
          {
            v19 = (char)v12[1];
            v15 = v12 + 3;
            *a1 = (unint64_t)(v12 + 3);
            v16 = v12[2] | (v19 << 8);
            goto LABEL_18;
          }
          v66 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          v67 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          if ((unint64_t)v67 >= 4)
            goto LABEL_117;
          v68 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v67);
          if (v68)
          {
            v68(3, "%s:%i Underflow: tag=0x%x", "_TLVCreateWithBytes", 154, v14);
            v66 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v69 = dispatch_get_specific(v66);
          if (NFSharedLogInitialize_onceToken != -1)
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          v39 = _NFSharedLogClient[(_QWORD)v69];
          if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            goto LABEL_70;
          *(_DWORD *)buf = 136446722;
          v73 = "_TLVCreateWithBytes";
          v74 = 1024;
          v75 = 154;
          v76 = 1024;
          v77 = v14;
          v32 = "%{public}s:%i Underflow: tag=0x%x";
        }
LABEL_68:
        v33 = v39;
        v34 = 24;
        goto LABEL_69;
      }
LABEL_18:
      v20 = 1;
      goto LABEL_21;
    }
LABEL_19:
    if ((v16 & 0x80) == 0)
    {
      v20 = 0;
      goto LABEL_21;
    }
    v20 = v16 & 0x7F;
    if ((v16 & 0x7F) != 0)
    {
      v16 = 0;
      while ((unint64_t)v15 < a2)
      {
        v26 = v15 + 1;
        *a1 = (unint64_t)(v15 + 1);
        v16 = *v15++ | (v16 << 8);
        if (!--v20)
        {
          v15 = v26;
          goto LABEL_21;
        }
      }
      v35 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      v36 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      if ((unint64_t)v36 < 4)
      {
        v37 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v36);
        if (v37)
        {
          v37(3, "%s:%i Underflow: tag=0x%x", "_TLVCreateWithBytes", 143, v14);
          v35 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v38 = dispatch_get_specific(v35);
        if (NFSharedLogInitialize_onceToken != -1)
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        v39 = _NFSharedLogClient[(_QWORD)v38];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v73 = "_TLVCreateWithBytes";
          v74 = 1024;
          v75 = 143;
          v76 = 1024;
          v77 = v14;
          v32 = "%{public}s:%i Underflow: tag=0x%x";
          goto LABEL_68;
        }
        goto LABEL_70;
      }
      goto LABEL_117;
    }
    v16 = 0;
LABEL_21:
    if (!(v14 | v16))
      return v71;
    if (((v20 ^ 1) & (v10 >> 5) & 1) != 0)
    {
      if (v16 == 128)
      {
        v24 = 128;
        v25 = (unsigned __int8 *)a2;
      }
      else
      {
        if ((uint64_t)(a2 - (_QWORD)v15) < v16)
        {
          v58 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          v59 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          if ((unint64_t)v59 >= 4)
            goto LABEL_117;
          v60 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v59);
          if (v60)
          {
            v60(3, "%s:%i Underflow: tag=0x%x len=%u", "_TLVCreateWithBytes", 184, v14, v16);
            v58 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v61 = dispatch_get_specific(v58);
          if (NFSharedLogInitialize_onceToken != -1)
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          v48 = _NFSharedLogClient[(_QWORD)v61];
          if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            goto LABEL_70;
          *(_DWORD *)buf = 136446978;
          v73 = "_TLVCreateWithBytes";
          v74 = 1024;
          v75 = 184;
          v76 = 1024;
          v77 = v14;
          v78 = 1024;
          v79 = v16;
          v32 = "%{public}s:%i Underflow: tag=0x%x len=%u";
LABEL_102:
          v33 = v48;
          v34 = 30;
          goto LABEL_69;
        }
        v24 = v16;
        v25 = &v15[v16];
      }
      v21 = NFDataCreateWithBytes(v15, v24);
      v70 = 0;
      v70 = (_QWORD *)_TLVCreateWithBytes(a1, v25, a3);
      Child = TLVCreateWithFirstChild(v14, v70);
      TLVRelease(&v70);
      if (!Child)
      {
        v49 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v50 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v50 >= 4)
          goto LABEL_117;
        v51 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v50);
        if (v51)
        {
          v51(3, "%s:%i NULL error: tag=0x%x len=%u", "_TLVCreateWithBytes", 196, v14, v16);
          v49 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v52 = dispatch_get_specific(v49);
        if (NFSharedLogInitialize_onceToken != -1)
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        v53 = _NFSharedLogClient[(_QWORD)v52];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          v73 = "_TLVCreateWithBytes";
          v74 = 1024;
          v75 = 196;
          v76 = 1024;
          v77 = v14;
          v78 = 1024;
          v79 = v16;
          goto LABEL_93;
        }
LABEL_94:
        NFDataRelease(v21);
        goto LABEL_70;
      }
      Child[5] = v21;
      if (v8)
        v8[3] = Child;
      else
        v71 = Child;
      v5 = (unsigned __int8 *)*a1;
    }
    else
    {
      if ((uint64_t)(a2 - (_QWORD)v15) < v16)
      {
        v44 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v45 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v45 >= 4)
          goto LABEL_117;
        v46 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v45);
        if (v46)
        {
          v46(3, "%s:%i Underflow: tag=0x%x len=%u", "_TLVCreateWithBytes", 169, v14, v16);
          v44 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v47 = dispatch_get_specific(v44);
        if (NFSharedLogInitialize_onceToken != -1)
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        v48 = _NFSharedLogClient[(_QWORD)v47];
        if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          goto LABEL_70;
        *(_DWORD *)buf = 136446978;
        v73 = "_TLVCreateWithBytes";
        v74 = 1024;
        v75 = 169;
        v76 = 1024;
        v77 = v14;
        v78 = 1024;
        v79 = v16;
        v32 = "%{public}s:%i Underflow: tag=0x%x len=%u";
        goto LABEL_102;
      }
      v21 = NFDataCreateWithBytes(v15, v16);
      v22 = TLVCreateWithValue(v14, (uint64_t)v21);
      if (!v22)
      {
        v54 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        v55 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        if ((unint64_t)v55 >= 4)
          goto LABEL_117;
        v56 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v55);
        if (v56)
        {
          v56(3, "%s:%i NULL error: tag=0x%x len=%u", "_TLVCreateWithBytes", 172, v14, v16);
          v54 = kNFLOG_DISPATCH_SPECIFIC_KEY;
        }
        v57 = dispatch_get_specific(v54);
        if (NFSharedLogInitialize_onceToken != -1)
          dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
        v53 = _NFSharedLogClient[(_QWORD)v57];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446978;
          v73 = "_TLVCreateWithBytes";
          v74 = 1024;
          v75 = 172;
          v76 = 1024;
          v77 = v14;
          v78 = 1024;
          v79 = v16;
LABEL_93:
          _os_log_impl(&dword_1C34DB000, v53, OS_LOG_TYPE_ERROR, "%{public}s:%i NULL error: tag=0x%x len=%u", buf, 0x1Eu);
        }
        goto LABEL_94;
      }
      Child = v22;
      NFDataRelease(v21);
      if (v8)
        v8[3] = Child;
      else
        v71 = Child;
      v5 = (unsigned __int8 *)(*a1 + v16);
      *a1 = (unint64_t)v5;
    }
    v8 = Child;
    if ((unint64_t)v5 >= a2)
      return v71;
  }
  v40 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v41 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v41 >= 4)
    goto LABEL_117;
  v42 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v41);
  if (v42)
  {
    v42(3, "%s:%i Underflow: tag=0x%x", "_TLVCreateWithBytes", 134, v14);
    v40 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v43 = dispatch_get_specific(v40);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v39 = _NFSharedLogClient[(_QWORD)v43];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446722;
    v73 = "_TLVCreateWithBytes";
    v74 = 1024;
    v75 = 134;
    v76 = 1024;
    v77 = v14;
    v32 = "%{public}s:%i Underflow: tag=0x%x";
    goto LABEL_68;
  }
LABEL_70:
  TLVRelease(&v71);
  return 0;
}

_DWORD *TLVCreateWithValue(int a1, uint64_t a2)
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = malloc_type_calloc(1uLL, 0x30uLL, 0x102004093326106uLL);
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)v4 = 1;
    v4[8] = a1;
    NFDataRetain(a2);
    *((_QWORD *)v5 + 5) = a2;
  }
  return v5;
}

_DWORD *TLVCreateWithFirstChild(int a1, _QWORD *a2)
{
  _DWORD *result;

  result = malloc_type_calloc(1uLL, 0x30uLL, 0x102004093326106uLL);
  if (result)
  {
    *(_QWORD *)result = 1;
    result[8] = a1;
    if (a2)
      ++*a2;
    *((_QWORD *)result + 2) = a2;
  }
  return result;
}

_QWORD *TLVRetain(_QWORD *result)
{
  if (result)
    ++*result;
  return result;
}

_QWORD *TLVCreateWithDataMixed(_QWORD *a1, _WORD *a2)
{
  unint64_t v3;

  return _TLVCreateWithBytes(&v3, *a1 + a1[1], a2);
}

void TLVRelease(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a1)
  {
    v2 = *a1;
    if (*a1)
    {
      if ((*v2)-- == 1)
      {
        v4 = v2[2];
        v5 = v2[3];
        v6 = v4;
        NFDataRelease((_QWORD *)v2[5]);
        TLVRelease(&v6);
        TLVRelease(&v5);
        free(v2);
        *a1 = 0;
      }
    }
  }
}

BOOL NFDataScannerEOF(_QWORD *a1)
{
  unint64_t v1;

  return !a1 || !*a1 || (v1 = *(_QWORD *)(*a1 + 8)) == 0 || a1[1] >= v1;
}

BOOL NFDataScannerRead(uint64_t **a1, uint64_t a2, _BYTE *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t *v5;
  uint64_t v6;

  v3 = (unint64_t)a1[1] + a2;
  v4 = (*a1)[1];
  if (a2 && v3 <= v4)
  {
    do
    {
      v5 = a1[1];
      v6 = **a1;
      a1[1] = (uint64_t *)((char *)v5 + 1);
      *a3++ = *((_BYTE *)v5 + v6);
      --a2;
    }
    while (a2);
  }
  return v3 <= v4;
}

BOOL NFDataScannerRead8(uint64_t **a1, _BYTE *a2)
{
  uint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  *a2 = 0;
  v2 = a1[1];
  v3 = (unint64_t)v2 + 1;
  v4 = (*a1)[1];
  if ((unint64_t)v2 + 1 <= v4)
  {
    v5 = **a1;
    a1[1] = (uint64_t *)v3;
    *a2 = *((_BYTE *)v2 + v5);
  }
  return v3 <= v4;
}

BOOL NFDataScannerRead16(uint64_t **a1, uint64_t a2, _WORD *a3)
{
  uint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  int v6;
  uint64_t v7;

  *a3 = 0;
  v3 = a1[1];
  v4 = (unint64_t)v3 + a2;
  v5 = (*a1)[1];
  if (a2 && v4 <= v5)
  {
    v6 = 0;
    v7 = **a1;
    do
    {
      a1[1] = (uint64_t *)((char *)v3 + 1);
      v6 = *((unsigned __int8 *)v3 + v7) | (v6 << 8);
      *a3 = v6;
      v3 = (uint64_t *)((char *)v3 + 1);
      --a2;
    }
    while (a2);
  }
  return v4 <= v5;
}

BOOL NFDataScannerRead32(uint64_t **a1, uint64_t a2, int *a3)
{
  uint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  int v6;
  uint64_t v7;

  *a3 = 0;
  v3 = a1[1];
  v4 = (unint64_t)v3 + a2;
  v5 = (*a1)[1];
  if (a2 && v4 <= v5)
  {
    v6 = 0;
    v7 = **a1;
    do
    {
      a1[1] = (uint64_t *)((char *)v3 + 1);
      v6 = *((unsigned __int8 *)v3 + v7) | (v6 << 8);
      *a3 = v6;
      v3 = (uint64_t *)((char *)v3 + 1);
      --a2;
    }
    while (a2);
  }
  return v4 <= v5;
}

void **NFDataScannerReadData(_QWORD *a1, size_t a2)
{
  uint64_t v2;
  void **result;

  v2 = a1[1];
  if (v2 + a2 > *(_QWORD *)(*a1 + 8))
    return 0;
  result = NFDataCreateWithBytes((const void *)(*(_QWORD *)*a1 + v2), a2);
  a1[1] += a2;
  return result;
}

_QWORD *NFDataScannerCreateWithData(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;

  v2 = malloc_type_calloc(1uLL, 0x18uLL, 0x10A00409D8FE3EAuLL);
  if (v2)
  {
    v3 = malloc_type_calloc(1uLL, 0x48uLL, 0x1000040FF89C88EuLL);
    v2[2] = v3;
    if (!v3)
    {
      free(v2);
      return 0;
    }
    NFDataRetain(a1);
    *v2 = a1;
    v2[1] = 0;
    v4 = v2[2];
    *(_QWORD *)v4 = 1;
    if (pthread_mutex_init((pthread_mutex_t *)(v4 + 8), 0))
    {
      _NFDataScannerDestroy((_QWORD **)v2);
      return 0;
    }
  }
  return v2;
}

void _NFDataScannerDestroy(_QWORD **a1)
{
  pthread_mutex_destroy((pthread_mutex_t *)(a1[2] + 1));
  free(a1[2]);
  a1[2] = 0;
  if (*a1)
    NFDataRelease(*a1);
  free(a1);
}

uint64_t NFDataScannerRetain(uint64_t a1)
{
  uint64_t v2;

  if (a1)
  {
    pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 16) + 8));
    v2 = *(_QWORD *)(a1 + 16);
    ++*(_QWORD *)v2;
    pthread_mutex_unlock((pthread_mutex_t *)(v2 + 8));
  }
  return a1;
}

void NFDataScannerRelease(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  if (a1)
  {
    pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 16) + 8));
    v2 = *(_QWORD *)(a1 + 16);
    v3 = *(_QWORD *)v2 - 1;
    *(_QWORD *)v2 = v3;
    pthread_mutex_unlock((pthread_mutex_t *)(v2 + 8));
    if (!v3)
      _NFDataScannerDestroy((_QWORD **)a1);
  }
}

_QWORD *NFDataCreateWithBytesNoCopy(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v6;
  _QWORD *v7;
  char *v8;

  v6 = malloc_type_calloc(1uLL, 0x18uLL, 0x1080040EEF68E16uLL);
  v7 = v6;
  if (v6)
  {
    *v6 = 0;
    v8 = (char *)malloc_type_calloc(1uLL, 0x50uLL, 0x100004092262432uLL);
    v7[2] = v8;
    if (v8)
    {
      *(_QWORD *)v8 = 1;
      v8[72] = a3;
      if (!pthread_mutex_init((pthread_mutex_t *)(v8 + 8), 0))
      {
        *v7 = a1;
        v7[1] = a2;
        return v7;
      }
      _NFDataDestroy(v7);
    }
    else
    {
      free(v7);
    }
    return 0;
  }
  return v7;
}

void _NFDataDestroy(void *a1)
{
  uint64_t v2;
  void *v3;

  v2 = *((_QWORD *)a1 + 2);
  if (*(_BYTE *)(v2 + 72))
  {
    v3 = *(void **)a1;
    if (*(_QWORD *)a1)
    {
      free(v3);
      v2 = *((_QWORD *)a1 + 2);
    }
  }
  *(_QWORD *)a1 = 0;
  pthread_mutex_destroy((pthread_mutex_t *)(v2 + 8));
  free(*((void **)a1 + 2));
  free(a1);
}

void *NFDataCreateWithLength(size_t size)
{
  void *result;
  void *v3;

  if (size)
  {
    result = malloc_type_calloc(1uLL, size, 0x100004077774924uLL);
    v3 = result;
    if (!result)
      return result;
  }
  else
  {
    v3 = 0;
  }
  result = NFDataCreateWithBytesNoCopy((uint64_t)v3, size, 1);
  if (v3)
  {
    if (!result)
    {
      free(v3);
      return 0;
    }
  }
  return result;
}

void **NFDataCreateWithBytes(const void *a1, size_t size)
{
  void **v4;
  void **v5;

  v4 = (void **)NFDataCreateWithLength(size);
  v5 = v4;
  if (v4)
    memcpy(*v4, a1, size);
  return v5;
}

void *NFDataCreateWithHexString(const char *a1)
{
  size_t v2;
  size_t v3;
  _QWORD *v4;
  void *v5;
  _BYTE *v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  char __str[3];

  if (!a1)
    return 0;
  v2 = strlen(a1);
  v3 = v2;
  if ((v2 & 1) != 0)
    return 0;
  v4 = NFDataCreateWithLength(v2 >> 1);
  v5 = v4;
  if (v4)
  {
    v6 = (_BYTE *)*v4;
    if (*v4)
    {
      __str[2] = 0;
      if (v3)
      {
        v7 = 0;
        v8 = MEMORY[0x1E0C80978];
        while (1)
        {
          __str[0] = a1[v7];
          v9 = a1[v7 + 1];
          __str[1] = a1[v7 + 1];
          if (__str[0] < 0
            || (*(_DWORD *)(v8 + 4 * __str[0] + 60) & 0x10000) == 0
            || (char)v9 < 0
            || (*(_DWORD *)(v8 + 4 * v9 + 60) & 0x10000) == 0)
          {
            break;
          }
          *v6++ = strtoul(__str, 0, 16);
          v7 += 2;
          if (v3 <= v7)
            return v5;
        }
        _NFDataDestroy(v5);
        return 0;
      }
    }
  }
  return v5;
}

_QWORD *NFDataCreateWithFile(const char *a1)
{
  FILE *v2;
  FILE *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  size_t v7;
  char *v9;
  void *specific;
  void (*v11)(uint64_t, const char *, ...);
  int *v12;
  char *v13;
  int *v14;
  void *v15;
  NSObject *v16;
  int *v17;
  char *v18;
  int v19;
  char *v20;
  void *v21;
  void (*v22)(uint64_t, const char *, ...);
  void *v23;
  NSObject *v24;
  size_t v25;
  char *v26;
  void *v27;
  void (*v28)(uint64_t, const char *, ...);
  int *v29;
  char *v30;
  int *v31;
  void *v32;
  NSObject *v33;
  int *v34;
  char *v35;
  int v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = fopen(a1, "r");
  if (!v2)
  {
    v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific < 4)
    {
      v11 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
      if (v11)
      {
        v12 = __error();
        v13 = strerror(*v12);
        v14 = __error();
        v11(3, "%s:%i \"%s\" errno=%d Failed to open %s", "NFDataCreateWithFile", 121, v13, *v14, a1);
        v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v15 = dispatch_get_specific(v9);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v16 = _NFSharedLogClient[(_QWORD)v15];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = __error();
        v18 = strerror(*v17);
        v19 = *__error();
        *(_DWORD *)buf = 136447234;
        v38 = "NFDataCreateWithFile";
        v39 = 1024;
        v40 = 121;
        v41 = 2080;
        v42 = (uint64_t)v18;
        v43 = 1024;
        v44 = v19;
        v45 = 2080;
        v46 = a1;
        _os_log_impl(&dword_1C34DB000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d Failed to open %s", buf, 0x2Cu);
      }
      return 0;
    }
    goto LABEL_29;
  }
  v3 = v2;
  fseek(v2, 0, 2);
  v4 = MEMORY[0x1C3BD22FC](v3);
  fseek(v3, 0, 0);
  v5 = malloc_type_calloc(1uLL, v4, 0x100004077774924uLL);
  if (!v5)
  {
    v20 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    v21 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)v21 < 4)
    {
      v22 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v21);
      if (v22)
      {
        v22(3, "%s:%i Failed to alloc %ld", "NFDataCreateWithFile", 133, v4);
        v20 = kNFLOG_DISPATCH_SPECIFIC_KEY;
      }
      v23 = dispatch_get_specific(v20);
      if (NFSharedLogInitialize_onceToken != -1)
        dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
      v24 = _NFSharedLogClient[(_QWORD)v23];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v38 = "NFDataCreateWithFile";
        v39 = 1024;
        v40 = 133;
        v41 = 2048;
        v42 = v4;
        _os_log_impl(&dword_1C34DB000, v24, OS_LOG_TYPE_ERROR, "%{public}s:%i Failed to alloc %ld", buf, 0x1Cu);
      }
      fclose(v3);
      return 0;
    }
LABEL_29:
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  }
  v6 = v5;
  v7 = fread(v5, 1uLL, v4, v3);
  if (v7 == v4)
  {
    fclose(v3);
    return NFDataCreateWithBytesNoCopy((uint64_t)v6, v4, 1);
  }
  v25 = v7;
  v26 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  v27 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)v27 >= 4)
    goto LABEL_29;
  v28 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)v27);
  if (v28)
  {
    v29 = __error();
    v30 = strerror(*v29);
    v31 = __error();
    v28(3, "%s:%i \"%s\" errno=%d Failed to read data %ld/%ld", "NFDataCreateWithFile", 140, v30, *v31, v25, v4);
    v26 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v32 = dispatch_get_specific(v26);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v33 = _NFSharedLogClient[(_QWORD)v32];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    v34 = __error();
    v35 = strerror(*v34);
    v36 = *__error();
    *(_DWORD *)buf = 136447490;
    v38 = "NFDataCreateWithFile";
    v39 = 1024;
    v40 = 140;
    v41 = 2080;
    v42 = (uint64_t)v35;
    v43 = 1024;
    v44 = v36;
    v45 = 2048;
    v46 = (const char *)v25;
    v47 = 2048;
    v48 = v4;
    _os_log_impl(&dword_1C34DB000, v33, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d Failed to read data %ld/%ld", buf, 0x36u);
  }
  fclose(v3);
  free(v6);
  return 0;
}

uint64_t NFDataRetain(uint64_t a1)
{
  uint64_t v2;

  if (a1)
  {
    pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 16) + 8));
    v2 = *(_QWORD *)(a1 + 16);
    ++*(_QWORD *)v2;
    pthread_mutex_unlock((pthread_mutex_t *)(v2 + 8));
  }
  return a1;
}

void NFDataRelease(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  if (a1)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a1[2] + 8));
    v2 = a1[2];
    v3 = *(_QWORD *)v2 - 1;
    *(_QWORD *)v2 = v3;
    pthread_mutex_unlock((pthread_mutex_t *)(v2 + 8));
    if (!v3)
      _NFDataDestroy(a1);
  }
}

BOOL NFDataAppendBytes(_BOOL8 result, const void *a2, size_t a3)
{
  uint64_t v4;
  char *v6;
  char *v7;
  size_t v8;
  char *v9;
  void *specific;
  void (*v11)(uint64_t, const char *, ...);
  int *v12;
  char *v13;
  int *v14;
  void *v15;
  NSObject *v16;
  int *v17;
  char *v18;
  int v19;
  size_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  size_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = result;
    result = 1;
    if (a2)
    {
      if (a3)
      {
        v6 = (char *)malloc_type_calloc(1uLL, *(_QWORD *)(v4 + 8) + a3, 0x100004077774924uLL);
        if (v6)
        {
          v7 = v6;
          memcpy(v6, *(const void **)v4, *(_QWORD *)(v4 + 8));
          memcpy(&v7[*(_QWORD *)(v4 + 8)], a2, a3);
          free(*(void **)v4);
          v8 = *(_QWORD *)(v4 + 8) + a3;
          *(_QWORD *)v4 = v7;
          *(_QWORD *)(v4 + 8) = v8;
          return 1;
        }
        else
        {
          v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
          if ((unint64_t)specific >= 4)
            __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
          v11 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
          if (v11)
          {
            v12 = __error();
            v13 = strerror(*v12);
            v14 = __error();
            v11(3, "%s:%i \"%s\" errno=%d Failed to realloc to %zu bytes", "NFDataAppendBytes", 180, v13, *v14, *(_QWORD *)(v4 + 8) + a3);
            v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
          }
          v15 = dispatch_get_specific(v9);
          if (NFSharedLogInitialize_onceToken != -1)
            dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
          v16 = _NFSharedLogClient[(_QWORD)v15];
          result = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
          if (result)
          {
            v17 = __error();
            v18 = strerror(*v17);
            v19 = *__error();
            v20 = *(_QWORD *)(v4 + 8) + a3;
            *(_DWORD *)buf = 136447234;
            v22 = "NFDataAppendBytes";
            v23 = 1024;
            v24 = 180;
            v25 = 2080;
            v26 = v18;
            v27 = 1024;
            v28 = v19;
            v29 = 2048;
            v30 = v20;
            _os_log_impl(&dword_1C34DB000, v16, OS_LOG_TYPE_ERROR, "%{public}s:%i \"%s\" errno=%d Failed to realloc to %zu bytes", buf, 0x2Cu);
            return 0;
          }
        }
      }
    }
  }
  return result;
}

BOOL NFDataAppend(_BOOL8 a1, uint64_t a2)
{
  return !a2 || NFDataAppendBytes(a1, *(const void **)a2, *(_QWORD *)(a2 + 8));
}

char *NFDataAsHexString(uint64_t *a1)
{
  uint64_t v2;
  char *v3;
  char *v4;
  unint64_t v5;
  uint64_t v6;
  char *v7;

  if (!a1)
    return 0;
  v2 = a1[1];
  if (!v2 || !*a1)
    return 0;
  v3 = (char *)malloc_type_calloc(1uLL, (2 * v2) | 1, 0x100004077774924uLL);
  v4 = v3;
  if (a1[1])
  {
    v5 = 0;
    v6 = *a1;
    v7 = v3;
    do
    {
      sprintf(v7, "%02X", *(unsigned __int8 *)(v6 + v5++));
      v7 += 2;
    }
    while (a1[1] > v5);
  }
  return v4;
}

void NFDataPrintAsHexString(uint64_t a1, const char *a2, uint64_t *a3)
{
  char *v5;
  char *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  const char *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = NFDataAsHexString(a3);
  if (v5)
  {
    v6 = v5;
    if (_NFLogCustomLoggers)
    {
      if (a2)
        v7 = a2;
      else
        v7 = "";
      _NFLogCustomLoggers(a1, "%s:%i %s: %s", "NFDataPrintAsHexString", 219, v7, v5);
    }
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v8 = _NFSharedLogClient[0];
    if ((a1 - 3) >= 6)
      v9 = OS_LOG_TYPE_DEFAULT;
    else
      v9 = (0x20200001010uLL >> (8 * (a1 - 3)));
    if (os_log_type_enabled((os_log_t)_NFSharedLogClient[0], (os_log_type_t)(v9 & 0xFE)))
    {
      if (a2)
        v10 = a2;
      else
        v10 = "";
      *(_DWORD *)buf = 136446978;
      v12 = "NFDataPrintAsHexString";
      v13 = 1024;
      v14 = 219;
      v15 = 2080;
      v16 = v10;
      v17 = 2080;
      v18 = v6;
      _os_log_impl(&dword_1C34DB000, v8, v9, "%{public}s:%i %s: %s", buf, 0x26u);
    }
    free(v6);
  }
}

CFDataRef NFDataToCFDataCreateOwnership(uint64_t a1, char a2)
{
  BOOL v3;
  const __CFAllocator **v4;
  const __CFAllocator *v5;
  CFDataRef result;

  if ((a2 & 1) != 0)
  {
    v3 = *(_BYTE *)(*(_QWORD *)(a1 + 16) + 72) == 0;
    v4 = (const __CFAllocator **)MEMORY[0x1E0C9AE00];
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 16) + 72))
      v4 = (const __CFAllocator **)MEMORY[0x1E0C9AE20];
    v5 = *v4;
  }
  else
  {
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
    v3 = 1;
  }
  result = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)a1, *(_QWORD *)(a1 + 8), v5);
  if (!v3)
  {
    if (result)
      *(_BYTE *)(*(_QWORD *)(a1 + 16) + 72) = 0;
  }
  return result;
}

void sub_1C34FD75C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void NFPreferencesChangedHandler(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)MEMORY[0x1C3BD2368]();
  objc_msgSend(a2, "handlePreferencesOrProfileChanged");
  objc_autoreleasePoolPop(v3);
}

void sub_1C34FD818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1C34FD878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t NFSetThreadPriority(int a1)
{
  _opaque_pthread_t *v2;
  int v4;
  sched_param v5;

  v5 = 0;
  v4 = 0;
  v2 = pthread_self();
  pthread_getschedparam(v2, &v4, &v5);
  v5.sched_priority = a1;
  return pthread_setschedparam(v2, v4, &v5);
}

uint64_t NFGetThreadPriority()
{
  _opaque_pthread_t *v0;
  int v2;
  sched_param v3;

  v3 = 0;
  v2 = 0;
  v0 = pthread_self();
  pthread_getschedparam(v0, &v2, &v3);
  return v3.sched_priority;
}

uint64_t NFGetRootQueue()
{
  uint64_t v0;

  pthread_mutex_lock(&gRootQueueMutex);
  v0 = gRootQueue;
  pthread_mutex_unlock(&gRootQueueMutex);
  return v0;
}

NSObject *NFGetOrCreateRootQueue(uint64_t a1, int a2)
{
  NSObject *v3;
  sched_param v5;
  pthread_attr_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(&gRootQueueMutex);
  v3 = gRootQueue;
  if (!gRootQueue)
  {
    memset(&v6, 0, sizeof(v6));
    pthread_attr_init(&v6);
    v5 = 0;
    pthread_attr_getschedparam(&v6, &v5);
    v5.sched_priority = a2;
    pthread_attr_setschedpolicy(&v6, 2);
    pthread_attr_setschedparam(&v6, &v5);
    pthread_attr_setinheritsched(&v6, 2);
    v3 = dispatch_pthread_root_queue_create();
    pthread_attr_destroy(&v6);
    dispatch_set_finalizer_f(v3, (dispatch_function_t)_NFRootQueueFinalizer);
    gRootQueue = (uint64_t)v3;
  }
  pthread_mutex_unlock(&gRootQueueMutex);
  return v3;
}

NSObject *NFCreateWorkLoop(const char *a1)
{
  NSObject *inactive;

  inactive = dispatch_workloop_create_inactive(a1);
  dispatch_workloop_set_scheduler_priority();
  dispatch_activate(inactive);
  return inactive;
}

void _NFRootQueueFinalizer()
{
  char *v0;
  void *specific;
  void (*v2)(uint64_t, const char *, ...);
  void *v3;
  NSObject *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  if ((unint64_t)specific >= 4)
    __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
  v2 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
  if (v2)
  {
    v2(3, "%s:%i Dispatch queue has been destroyed !", "_NFRootQueueFinalizer", 43);
    v0 = kNFLOG_DISPATCH_SPECIFIC_KEY;
  }
  v3 = dispatch_get_specific(v0);
  if (NFSharedLogInitialize_onceToken != -1)
    dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
  v4 = _NFSharedLogClient[(_QWORD)v3];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v6 = "_NFRootQueueFinalizer";
    v7 = 1024;
    v8 = 43;
    _os_log_impl(&dword_1C34DB000, v4, OS_LOG_TYPE_ERROR, "%{public}s:%i Dispatch queue has been destroyed !", buf, 0x12u);
  }
  NFSimulateCrash(65261, (uint64_t)"Root queue has been destroyed");
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98028](url);
}

CFDictionaryRef CFBundleCopyInfoDictionaryInDirectory(CFURLRef bundleURL)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98030](bundleURL);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1E0C99190](theString, suffix);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1E0CBAD20](*(_QWORD *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1E0CBAE38](notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB718](AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1E0CBB738](*(_QWORD *)&AssertionID);
}

uint64_t IOPSGetPercentRemaining()
{
  return MEMORY[0x1E0CBB8A0]();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1E0CBB8D8](refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA08](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1E0C80BE8](a1, *(_QWORD *)&a2, a3, a4);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

BOOL class_isMetaClass(Class cls)
{
  return MEMORY[0x1E0DE7AE8](cls);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

uint64_t dispatch_pthread_root_queue_create()
{
  return MEMORY[0x1E0C82E18]();
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
  MEMORY[0x1E0C82EE8](object, finalizer);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

uint64_t dispatch_time_to_nsec()
{
  return MEMORY[0x1E0C82FC0]();
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FE0](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x1E0C83010]();
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1E0DE8000](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x1E0C84910](object);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CB0](a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x1E0C84CB8](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CC8](a1);
}

int pthread_attr_setinheritsched(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1E0C84CE0](a1, *(_QWORD *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x1E0C84CE8](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1E0C84CF0](a1, *(_QWORD *)&a2);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1E0C84DB8](a1, a2, a3);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x1E0C84F10](a1, *(_QWORD *)&a2, a3);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85460](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

uint64_t ucurr_getDefaultFractionDigits()
{
  return MEMORY[0x1E0DE60A8]();
}

uint64_t ucurr_getNumericCode()
{
  return MEMORY[0x1E0DE60B8]();
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1E0C85A38](in, uu);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

uint64_t xpc_connection_send_notification()
{
  return MEMORY[0x1E0C86058]();
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C86270](xdict);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

uint64_t xpc_event_publisher_activate()
{
  return MEMORY[0x1E0C86428]();
}

uint64_t xpc_event_publisher_create()
{
  return MEMORY[0x1E0C86438]();
}

uint64_t xpc_event_publisher_fire()
{
  return MEMORY[0x1E0C86448]();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return MEMORY[0x1E0C86470]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x1E0C86488]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C86568](value);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C86710]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x1E0C867A0](type);
}

