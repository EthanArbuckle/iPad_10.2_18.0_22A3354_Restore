uint64_t CAReportingClientCreateReporterID()
{
  void *v1;
  CAReporter *v2;
  CAReporter *v3;
  uint64_t v4;

  if (_os_feature_enabled_impl())
    return AudioAnalyticsCreateReporter();
  v1 = (void *)MEMORY[0x193FFFB10]();
  v2 = -[CAReporter initWithNewReporterID]([CAReporter alloc], "initWithNewReporterID");
  v3 = v2;
  if (v2)
    v4 = -[CAReporter reporterID](v2, "reporterID");
  else
    v4 = 0;

  objc_autoreleasePoolPop(v1);
  return v4;
}

void sub_18F190FA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__CFString *CAReportingUtilityRetrieveAppName(NSDictionary *a1)
{
  void *v2;
  uint64_t v3;
  __CFString *v4;

  v2 = (void *)MEMORY[0x193FFFB10]();
  -[NSDictionary objectForKeyedSubscript:](a1, "objectForKeyedSubscript:", CFSTR("HostApplicationDisplayID"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (__CFString *)v3;
  else
    v4 = CFSTR("Unknown");
  objc_autoreleasePoolPop(v2);
  return v4;
}

void sub_18F191164(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void CAReportingClientSetAudioServiceType(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  if (_os_feature_enabled_impl())
    JUMPOUT(0x193FFF87CLL);
  if (a1)
  {
    v4 = (void *)MEMORY[0x193FFFB10]();
    +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setServiceType:reporterID:", a2, a1);

    objc_autoreleasePoolPop(v4);
  }
}

void sub_18F191230(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18F1917B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const __CFString *CAReportingUtilityGenerateServiceNameFromServiceType(__int16 a1)
{
  if ((unsigned __int16)(a1 + 1) > 0x10u)
    return CFSTR("unknown");
  else
    return off_1E2933B10[(__int16)(a1 + 1)];
}

void sub_18F191A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  void *v10;

  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18F19231C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38,char a39)
{
  void *v39;

  _Unwind_Resume(a1);
}

void sub_18F1925C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18F1927DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t CAReportingUtilityIsInternalBuild()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)MEMORY[0x193FFFB10]();
  if (CAReportingUtilityIsInternalBuild::once != -1)
    dispatch_once(&CAReportingUtilityIsInternalBuild::once, &__block_literal_global_1);
  v1 = CAReportingUtilityIsInternalBuild::gCAReportingUtilityIsInternal;
  objc_autoreleasePoolPop(v0);
  return v1;
}

void sub_18F192AEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_18F192D7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F1931FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void *AA_ClientCategory(void)
{
  unsigned __int8 v0;

  {
    caulk::log_category::log_category((caulk::log_category *)&AA_ClientCategory(void)::category, "com.apple.coreaudio", "carc");
  }
  return &AA_ClientCategory(void)::category;
}

void sub_18F1932DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t CAReportingClientGetAudioServiceType(uint64_t a1)
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (_os_feature_enabled_impl())
    return AudioAnalyticsGetAudioServiceType();
  if (!a1)
    return 0xFFFFLL;
  v3 = (void *)MEMORY[0x193FFFB10]();
  +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getServiceTypeForReporterID:", a1);

  objc_autoreleasePoolPop(v3);
  return v5;
}

void sub_18F193388(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void CAReportingClientSendMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  void *v9;

  if (_os_feature_enabled_impl())
  {
    AudioAnalyticsSendMessage();
  }
  else if (a1)
  {
    v8 = (void *)MEMORY[0x193FFFB10]();
    +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendMessage:category:type:reporter:", a2, a3, a4, a1);

    objc_autoreleasePoolPop(v8);
  }
}

void sub_18F19345C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id GetLocalCAReporterObjectFromClient(CAReportingClient *a1, uint64_t a2)
{
  CAReportingClient *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a1;
  v4 = (void *)MEMORY[0x193FFFB10]();
  -[CAReportingClient clientReporters](v3, "clientReporters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v7;
}

void sub_18F1934FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18F193A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  va_list va;

  va_start(va, a7);

  caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::~sync_message((uint64_t)va);
  objc_sync_exit(v7);

  _Unwind_Resume(a1);
}

void sub_18F193BB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18F194080(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_18F1942EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

id CAReportingUtilityAddDates(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v2 = (void *)MEMORY[0x193FFFB10]();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("careporting_timestamp"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemUptime");
  LODWORD(v10) = llround(v9);
  objc_msgSend(v7, "numberWithInt:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("systemuptime_sec"));

  v12 = (void *)MEMORY[0x1E0CB37E8];
  LODWORD(v13) = llroundf((float)((float)clock() / 1000000.0) * 1000.0);
  objc_msgSend(v12, "numberWithInt:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("processuptime_ms"));

  objc_autoreleasePoolPop(v2);
  return v3;
}

void sub_18F19445C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18F194724(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18F1947E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void CAReportingClientSetConfiguration(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;

  if (_os_feature_enabled_impl())
  {
    AudioAnalyticsSetConfiguration();
  }
  else if (a1 && a2)
  {
    if (objc_msgSend(a2, "count"))
    {
      v4 = (void *)MEMORY[0x193FFFB10]();
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setConfiguration:reporterID:", v5, a1);

      objc_autoreleasePoolPop(v4);
    }
  }
}

void sub_18F1948CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18F194A24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v3);
  _Unwind_Resume(a1);
}

void *AA_PerformanceUtilityCategory(void)
{
  unsigned __int8 v0;

  {
    caulk::log_category::log_category((caulk::log_category *)&AA_PerformanceUtilityCategory(void)::category, "com.apple.coreaudio", "capu");
  }
  return &AA_PerformanceUtilityCategory(void)::category;
}

void sub_18F194AD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<pc_session *>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<pc_session *>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<pc_session *>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_QWORD *)v10 - 1);
        v10 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

caulk::log_category *caulk::log_category::log_category(caulk::log_category *this, const char *subsystem, const char *category)
{
  os_log_t v4;
  void *v5;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  v4 = os_log_create(subsystem, category);
  v5 = *(void **)this;
  *(_QWORD *)this = v4;

  return this;
}

BOOL CAReportingUtilityReadBooleanPref(NSString *a1, NSString *a2)
{
  __CFString *v3;
  __CFString *v4;
  const __CFBoolean *v5;
  const __CFBoolean *v6;
  int Value;

  v3 = a1;
  v4 = a2;
  CFPreferencesAppSynchronize(v4);
  v5 = (const __CFBoolean *)CFPreferencesCopyValue(v3, v4, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  v6 = v5;
  if (v5)
  {
    Value = CFBooleanGetValue(v5);
    CFRelease(v6);
  }
  else
  {
    Value = 0;
  }

  return Value != 0;
}

void sub_18F194C78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18F1952B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_18F1955D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void CAReportingClientStopReporter(uint64_t a1)
{
  void *v2;
  void *v3;

  if (_os_feature_enabled_impl())
    JUMPOUT(0x193FFF8A0);
  if (a1)
  {
    v2 = (void *)MEMORY[0x193FFFB10]();
    +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopReporter:", a1);

    objc_autoreleasePoolPop(v2);
  }
}

void sub_18F1956B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18F195A88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18F1961D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  void *v26;

  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_18F196464(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_18F1966D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void CAReportingClientStartReporter(uint64_t a1)
{
  void *v2;
  void *v3;

  if (_os_feature_enabled_impl())
    JUMPOUT(0x193FFF894);
  if (a1)
  {
    v2 = (void *)MEMORY[0x193FFFB10]();
    +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startReporter:", a1);

    objc_autoreleasePoolPop(v2);
  }
}

void sub_18F1967B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18F196940(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_18F196AA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)CAReporter;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_18F196E24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CAReportingClientDestroyReporterID(uint64_t a1)
{
  void *v2;
  void *v3;

  if (_os_feature_enabled_impl())
    JUMPOUT(0x193FFF840);
  if (a1)
  {
    v2 = (void *)MEMORY[0x193FFFB10]();
    +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "destroyReporterWithID:", a1);

    objc_autoreleasePoolPop(v2);
  }
}

void sub_18F196F48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18F19701C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void sub_18F197190(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);

  _Unwind_Resume(a1);
}

void sub_18F197254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_18F197434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  objc_sync_exit(v10);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_18F197648(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18F1978E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_18F197B6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F197E0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

std::string *caulk::slog::detail::string_converter::string_converter<NSString * {__strong}>(std::string *a1)
{
  void *__p[2];
  char v4;

  _ZZN5caulk4slog6detail16string_converterC1IU8__strongP8NSStringEERKT_PNSt3__19enable_ifIXsr14has_extract_opIS7_EE5valueEvE4typeEENKUlvE_clEv(__p);
  caulk::slog::detail::string_converter::string_converter(a1, (__int128 *)__p);
  if (v4 < 0)
    operator delete(__p[0]);
  return a1;
}

void sub_18F197EB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_18F197FB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_18F19859C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  va_list va;

  va_start(va, a5);

  caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::~sync_message((uint64_t)va);
  objc_sync_exit(v5);

  _Unwind_Resume(a1);
}

id caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_proxy(void **a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v10[4];
  _BYTE v11[24];
  _BYTE *v12;
  _QWORD v13[3];
  _QWORD *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v13, (uint64_t)(a1 + 1));
  v2 = *a1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3321888768;
  v10[2] = ___ZN5caulk3xpc7messageIU8__strongPU25objcproto14ServerProtocol11objc_objectJU8__strongP12NSDictionaryEE10sync_proxyEv_block_invoke;
  v10[3] = &__block_descriptor_64_ea8_32c75_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryEEEEEE_e17_v16__0__NSError_8l;
  v3 = v11;
  v4 = (uint64_t)v14;
  if (!v14)
    goto LABEL_4;
  if (v14 != v13)
  {
    v4 = (*(uint64_t (**)(_QWORD *))(*v14 + 16))(v14);
LABEL_4:
    v12 = (_BYTE *)v4;
    goto LABEL_6;
  }
  v12 = v11;
  (*(void (**)(_QWORD *, _BYTE *))(v13[0] + 24))(v13, v11);
LABEL_6:
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v11)
  {
    v6 = 4;
  }
  else
  {
    if (!v12)
      goto LABEL_11;
    v6 = 5;
    v3 = v12;
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v6))(v3);
LABEL_11:
  v7 = v14;
  if (v14 == v13)
  {
    v8 = 4;
    v7 = v13;
    goto LABEL_15;
  }
  if (v14)
  {
    v8 = 5;
LABEL_15:
    (*(void (**)(void))(*v7 + 8 * v8))();
  }
  return v5;
}

void sub_18F1987F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;
  _QWORD *v19;
  uint64_t v20;

  v19 = *(_QWORD **)(v17 - 32);
  if (v19 == (_QWORD *)(v17 - 56))
  {
    v20 = 4;
    v19 = (_QWORD *)(v17 - 56);
  }
  else
  {
    if (!v19)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*v19 + 8 * v20))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

id caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::reply(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[4];
  _BYTE v9[24];
  _BYTE *v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v11, a1 + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3321888768;
  v8[2] = ___ZN5caulk3xpc7messageIU8__strongPU25objcproto14ServerProtocol11objc_objectJU8__strongP12NSDictionaryEE5replyEv_block_invoke;
  v8[3] = &__block_descriptor_64_ea8_32c75_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryEEEEEE_e34_v24__0__NSError_8__NSDictionary_16l;
  v1 = v9;
  v2 = (uint64_t)v12;
  if (!v12)
    goto LABEL_4;
  if (v12 != v11)
  {
    v2 = (*(uint64_t (**)(_QWORD *))(*v12 + 16))(v12);
LABEL_4:
    v10 = (_BYTE *)v2;
    goto LABEL_6;
  }
  v10 = v9;
  (*(void (**)(_QWORD *, _BYTE *))(v11[0] + 24))(v11, v9);
LABEL_6:
  v3 = (void *)MEMORY[0x193FFFC54](v8);
  if (v10 == v9)
  {
    v4 = 4;
  }
  else
  {
    if (!v10)
      goto LABEL_11;
    v4 = 5;
    v1 = v10;
  }
  (*(void (**)(_QWORD *))(*v1 + 8 * v4))(v1);
LABEL_11:
  v5 = v12;
  if (v12 == v11)
  {
    v6 = 4;
    v5 = v11;
    goto LABEL_15;
  }
  if (v12)
  {
    v6 = 5;
LABEL_15:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return v3;
}

void sub_18F1989AC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = *(_QWORD **)(v1 - 32);
  if (v3 == (_QWORD *)(v1 - 56))
  {
    v4 = 4;
    v3 = (_QWORD *)(v1 - 56);
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::~sync_message(uint64_t a1)
{

  return caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::~message(a1);
}

id caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_proxy(void **a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v10[4];
  _BYTE v11[24];
  _BYTE *v12;
  _QWORD v13[3];
  _QWORD *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v13, (uint64_t)(a1 + 1));
  v2 = *a1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3321888768;
  v10[2] = ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJU8__strongP12NSDictionaryEE10sync_proxyEv_block_invoke;
  v10[3] = &__block_descriptor_64_ea8_32c75_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryEEEEEE_e17_v16__0__NSError_8l;
  v3 = v11;
  v4 = (uint64_t)v14;
  if (!v14)
    goto LABEL_4;
  if (v14 != v13)
  {
    v4 = (*(uint64_t (**)(_QWORD *))(*v14 + 16))(v14);
LABEL_4:
    v12 = (_BYTE *)v4;
    goto LABEL_6;
  }
  v12 = v11;
  (*(void (**)(_QWORD *, _BYTE *))(v13[0] + 24))(v13, v11);
LABEL_6:
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v11)
  {
    v6 = 4;
  }
  else
  {
    if (!v12)
      goto LABEL_11;
    v6 = 5;
    v3 = v12;
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v6))(v3);
LABEL_11:
  v7 = v14;
  if (v14 == v13)
  {
    v8 = 4;
    v7 = v13;
    goto LABEL_15;
  }
  if (v14)
  {
    v8 = 5;
LABEL_15:
    (*(void (**)(void))(*v7 + 8 * v8))();
  }
  return v5;
}

void sub_18F198B6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;
  _QWORD *v19;
  uint64_t v20;

  v19 = *(_QWORD **)(v17 - 32);
  if (v19 == (_QWORD *)(v17 - 56))
  {
    v20 = 4;
    v19 = (_QWORD *)(v17 - 56);
  }
  else
  {
    if (!v19)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*v19 + 8 * v20))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

id caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::reply(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[4];
  _BYTE v9[24];
  _BYTE *v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v11, a1 + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3321888768;
  v8[2] = ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJU8__strongP12NSDictionaryEE5replyEv_block_invoke;
  v8[3] = &__block_descriptor_64_ea8_32c75_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryEEEEEE_e34_v24__0__NSError_8__NSDictionary_16l;
  v1 = v9;
  v2 = (uint64_t)v12;
  if (!v12)
    goto LABEL_4;
  if (v12 != v11)
  {
    v2 = (*(uint64_t (**)(_QWORD *))(*v12 + 16))(v12);
LABEL_4:
    v10 = (_BYTE *)v2;
    goto LABEL_6;
  }
  v10 = v9;
  (*(void (**)(_QWORD *, _BYTE *))(v11[0] + 24))(v11, v9);
LABEL_6:
  v3 = (void *)MEMORY[0x193FFFC54](v8);
  if (v10 == v9)
  {
    v4 = 4;
  }
  else
  {
    if (!v10)
      goto LABEL_11;
    v4 = 5;
    v1 = v10;
  }
  (*(void (**)(_QWORD *))(*v1 + 8 * v4))(v1);
LABEL_11:
  v5 = v12;
  if (v12 == v11)
  {
    v6 = 4;
    v5 = v11;
    goto LABEL_15;
  }
  if (v12)
  {
    v6 = 5;
LABEL_15:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return v3;
}

void sub_18F198D24(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = *(_QWORD **)(v1 - 32);
  if (v3 == (_QWORD *)(v1 - 56))
  {
    v4 = 4;
    v3 = (_QWORD *)(v1 - 56);
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void sub_18F199260(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_18F19945C(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

id caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::async_proxy(void **a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v10[4];
  _BYTE v11[24];
  _BYTE *v12;
  _QWORD v13[3];
  _QWORD *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v13, (uint64_t)(a1 + 1));
  v2 = *a1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3321888768;
  v10[2] = ___ZN5caulk3xpc7messageIU8__strongPU25objcproto14ServerProtocol11objc_objectJU8__strongP12NSDictionaryEE11async_proxyEv_block_invoke;
  v10[3] = &__block_descriptor_64_ea8_32c75_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryEEEEEE_e17_v16__0__NSError_8l;
  v3 = v11;
  v4 = (uint64_t)v14;
  if (!v14)
    goto LABEL_4;
  if (v14 != v13)
  {
    v4 = (*(uint64_t (**)(_QWORD *))(*v14 + 16))(v14);
LABEL_4:
    v12 = (_BYTE *)v4;
    goto LABEL_6;
  }
  v12 = v11;
  (*(void (**)(_QWORD *, _BYTE *))(v13[0] + 24))(v13, v11);
LABEL_6:
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v11)
  {
    v6 = 4;
  }
  else
  {
    if (!v12)
      goto LABEL_11;
    v6 = 5;
    v3 = v12;
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v6))(v3);
LABEL_11:
  v7 = v14;
  if (v14 == v13)
  {
    v8 = 4;
    v7 = v13;
    goto LABEL_15;
  }
  if (v14)
  {
    v8 = 5;
LABEL_15:
    (*(void (**)(void))(*v7 + 8 * v8))();
  }
  return v5;
}

void sub_18F1995BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;
  _QWORD *v19;
  uint64_t v20;

  v19 = *(_QWORD **)(v17 - 32);
  if (v19 == (_QWORD *)(v17 - 56))
  {
    v20 = 4;
    v19 = (_QWORD *)(v17 - 56);
  }
  else
  {
    if (!v19)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*v19 + 8 * v20))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

id caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::async_proxy(void **a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v10[4];
  _BYTE v11[24];
  _BYTE *v12;
  _QWORD v13[3];
  _QWORD *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v13, (uint64_t)(a1 + 1));
  v2 = *a1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3321888768;
  v10[2] = ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJU8__strongP12NSDictionaryEE11async_proxyEv_block_invoke;
  v10[3] = &__block_descriptor_64_ea8_32c75_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryEEEEEE_e17_v16__0__NSError_8l;
  v3 = v11;
  v4 = (uint64_t)v14;
  if (!v14)
    goto LABEL_4;
  if (v14 != v13)
  {
    v4 = (*(uint64_t (**)(_QWORD *))(*v14 + 16))(v14);
LABEL_4:
    v12 = (_BYTE *)v4;
    goto LABEL_6;
  }
  v12 = v11;
  (*(void (**)(_QWORD *, _BYTE *))(v13[0] + 24))(v13, v11);
LABEL_6:
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v11)
  {
    v6 = 4;
  }
  else
  {
    if (!v12)
      goto LABEL_11;
    v6 = 5;
    v3 = v12;
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v6))(v3);
LABEL_11:
  v7 = v14;
  if (v14 == v13)
  {
    v8 = 4;
    v7 = v13;
    goto LABEL_15;
  }
  if (v14)
  {
    v8 = 5;
LABEL_15:
    (*(void (**)(void))(*v7 + 8 * v8))();
  }
  return v5;
}

void sub_18F199784(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;
  _QWORD *v19;
  uint64_t v20;

  v19 = *(_QWORD **)(v17 - 32);
  if (v19 == (_QWORD *)(v17 - 56))
  {
    v20 = 4;
    v19 = (_QWORD *)(v17 - 56);
  }
  else
  {
    if (!v19)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*v19 + 8 * v20))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void sub_18F199868(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F199BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  va_list va;

  va_start(va, a5);
  v9 = v7;

  caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::~sync_message((uint64_t)va);
  objc_sync_exit(v5);

  _Unwind_Resume(a1);
}

id caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_proxy(void **a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v10[4];
  _BYTE v11[24];
  _BYTE *v12;
  _QWORD v13[3];
  _QWORD *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v13, (uint64_t)(a1 + 1));
  v2 = *a1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3321888768;
  v10[2] = ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJU8__strongP7NSArrayIP8NSNumberEEE10sync_proxyEv_block_invoke;
  v10[3] = &__block_descriptor_64_ea8_32c81_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP7NSArrayIP8NSNumberEEEEEEE_e17_v16__0__NSError_8l;
  v3 = v11;
  v4 = (uint64_t)v14;
  if (!v14)
    goto LABEL_4;
  if (v14 != v13)
  {
    v4 = (*(uint64_t (**)(_QWORD *))(*v14 + 16))(v14);
LABEL_4:
    v12 = (_BYTE *)v4;
    goto LABEL_6;
  }
  v12 = v11;
  (*(void (**)(_QWORD *, _BYTE *))(v13[0] + 24))(v13, v11);
LABEL_6:
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v11)
  {
    v6 = 4;
  }
  else
  {
    if (!v12)
      goto LABEL_11;
    v6 = 5;
    v3 = v12;
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v6))(v3);
LABEL_11:
  v7 = v14;
  if (v14 == v13)
  {
    v8 = 4;
    v7 = v13;
    goto LABEL_15;
  }
  if (v14)
  {
    v8 = 5;
LABEL_15:
    (*(void (**)(void))(*v7 + 8 * v8))();
  }
  return v5;
}

void sub_18F199DA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;
  _QWORD *v19;
  uint64_t v20;

  v19 = *(_QWORD **)(v17 - 32);
  if (v19 == (_QWORD *)(v17 - 56))
  {
    v20 = 4;
    v19 = (_QWORD *)(v17 - 56);
  }
  else
  {
    if (!v19)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*v19 + 8 * v20))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

id caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::reply(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[4];
  _BYTE v9[24];
  _BYTE *v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v11, a1 + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3321888768;
  v8[2] = ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJU8__strongP7NSArrayIP8NSNumberEEE5replyEv_block_invoke;
  v8[3] = &__block_descriptor_64_ea8_32c81_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP7NSArrayIP8NSNumberEEEEEEE_e29_v24__0__NSError_8__NSArray_16l;
  v1 = v9;
  v2 = (uint64_t)v12;
  if (!v12)
    goto LABEL_4;
  if (v12 != v11)
  {
    v2 = (*(uint64_t (**)(_QWORD *))(*v12 + 16))(v12);
LABEL_4:
    v10 = (_BYTE *)v2;
    goto LABEL_6;
  }
  v10 = v9;
  (*(void (**)(_QWORD *, _BYTE *))(v11[0] + 24))(v11, v9);
LABEL_6:
  v3 = (void *)MEMORY[0x193FFFC54](v8);
  if (v10 == v9)
  {
    v4 = 4;
  }
  else
  {
    if (!v10)
      goto LABEL_11;
    v4 = 5;
    v1 = v10;
  }
  (*(void (**)(_QWORD *))(*v1 + 8 * v4))(v1);
LABEL_11:
  v5 = v12;
  if (v12 == v11)
  {
    v6 = 4;
    v5 = v11;
    goto LABEL_15;
  }
  if (v12)
  {
    v6 = 5;
LABEL_15:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return v3;
}

void sub_18F199F58(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = *(_QWORD **)(v1 - 32);
  if (v3 == (_QWORD *)(v1 - 56))
  {
    v4 = 4;
    v3 = (_QWORD *)(v1 - 56);
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void sub_18F19A4C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t *a13, id a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t *v19;
  uint64_t v20;

  v19 = a13;
  if (a13 == &a10)
  {
    v20 = 4;
    v19 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*v19 + 8 * v20))();
LABEL_6:

  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

id caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_proxy(void **a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v10[4];
  _BYTE v11[24];
  _BYTE *v12;
  _QWORD v13[3];
  _QWORD *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v13, (uint64_t)(a1 + 1));
  v2 = *a1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3321888768;
  v10[2] = ___ZN5caulk3xpc7messageIU8__strongPU25objcproto14ServerProtocol11objc_objectJbEE10sync_proxyEv_block_invoke;
  v10[3] = &__block_descriptor_64_ea8_32c51_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJbEEEEEE_e17_v16__0__NSError_8l;
  v3 = v11;
  v4 = (uint64_t)v14;
  if (!v14)
    goto LABEL_4;
  if (v14 != v13)
  {
    v4 = (*(uint64_t (**)(_QWORD *))(*v14 + 16))(v14);
LABEL_4:
    v12 = (_BYTE *)v4;
    goto LABEL_6;
  }
  v12 = v11;
  (*(void (**)(_QWORD *, _BYTE *))(v13[0] + 24))(v13, v11);
LABEL_6:
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v11)
  {
    v6 = 4;
  }
  else
  {
    if (!v12)
      goto LABEL_11;
    v6 = 5;
    v3 = v12;
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v6))(v3);
LABEL_11:
  v7 = v14;
  if (v14 == v13)
  {
    v8 = 4;
    v7 = v13;
    goto LABEL_15;
  }
  if (v14)
  {
    v8 = 5;
LABEL_15:
    (*(void (**)(void))(*v7 + 8 * v8))();
  }
  return v5;
}

void sub_18F19A784(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;
  _QWORD *v19;
  uint64_t v20;

  v19 = *(_QWORD **)(v17 - 32);
  if (v19 == (_QWORD *)(v17 - 56))
  {
    v20 = 4;
    v19 = (_QWORD *)(v17 - 56);
  }
  else
  {
    if (!v19)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*v19 + 8 * v20))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

id caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::sync_proxy(void **a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v10[4];
  _BYTE v11[24];
  _BYTE *v12;
  _QWORD v13[3];
  _QWORD *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v13, (uint64_t)(a1 + 1));
  v2 = *a1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3321888768;
  v10[2] = ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJbEE10sync_proxyEv_block_invoke;
  v10[3] = &__block_descriptor_64_ea8_32c51_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJbEEEEEE_e17_v16__0__NSError_8l;
  v3 = v11;
  v4 = (uint64_t)v14;
  if (!v14)
    goto LABEL_4;
  if (v14 != v13)
  {
    v4 = (*(uint64_t (**)(_QWORD *))(*v14 + 16))(v14);
LABEL_4:
    v12 = (_BYTE *)v4;
    goto LABEL_6;
  }
  v12 = v11;
  (*(void (**)(_QWORD *, _BYTE *))(v13[0] + 24))(v13, v11);
LABEL_6:
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v11)
  {
    v6 = 4;
  }
  else
  {
    if (!v12)
      goto LABEL_11;
    v6 = 5;
    v3 = v12;
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v6))(v3);
LABEL_11:
  v7 = v14;
  if (v14 == v13)
  {
    v8 = 4;
    v7 = v13;
    goto LABEL_15;
  }
  if (v14)
  {
    v8 = 5;
LABEL_15:
    (*(void (**)(void))(*v7 + 8 * v8))();
  }
  return v5;
}

void sub_18F19A94C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;
  _QWORD *v19;
  uint64_t v20;

  v19 = *(_QWORD **)(v17 - 32);
  if (v19 == (_QWORD *)(v17 - 56))
  {
    v20 = 4;
    v19 = (_QWORD *)(v17 - 56);
  }
  else
  {
    if (!v19)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*v19 + 8 * v20))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

id caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::reply(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[4];
  _BYTE v9[24];
  _BYTE *v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)v11, a1 + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3321888768;
  v8[2] = ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJbEE5replyEv_block_invoke;
  v8[3] = &__block_descriptor_64_ea8_32c51_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJbEEEEEE_e20_v20__0__NSError_8B16l;
  v1 = v9;
  v2 = (uint64_t)v12;
  if (!v12)
    goto LABEL_4;
  if (v12 != v11)
  {
    v2 = (*(uint64_t (**)(_QWORD *))(*v12 + 16))(v12);
LABEL_4:
    v10 = (_BYTE *)v2;
    goto LABEL_6;
  }
  v10 = v9;
  (*(void (**)(_QWORD *, _BYTE *))(v11[0] + 24))(v11, v9);
LABEL_6:
  v3 = (void *)MEMORY[0x193FFFC54](v8);
  if (v10 == v9)
  {
    v4 = 4;
  }
  else
  {
    if (!v10)
      goto LABEL_11;
    v4 = 5;
    v1 = v10;
  }
  (*(void (**)(_QWORD *))(*v1 + 8 * v4))(v1);
LABEL_11:
  v5 = v12;
  if (v12 == v11)
  {
    v6 = 4;
    v5 = v11;
    goto LABEL_15;
  }
  if (v12)
  {
    v6 = 5;
LABEL_15:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return v3;
}

void sub_18F19AB04(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = *(_QWORD **)(v1 - 32);
  if (v3 == (_QWORD *)(v1 - 56))
  {
    v4 = 4;
    v3 = (_QWORD *)(v1 - 56);
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void sub_18F19B044(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F19B51C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_18F19B768(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F19BB04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18F19BC14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  _Unwind_Resume(exception_object);
}

uint64_t caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::~message(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = (_QWORD *)(a1 + 8);
  v3 = *(_QWORD **)(a1 + 32);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
    goto LABEL_5;
  }
  if (v3)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }

  return a1;
}

uint64_t _ZZN5caulk4slog6detail16string_converterC1IU8__strongP8NSStringEERKT_PNSt3__19enable_ifIXsr14has_extract_opIS7_EE5valueEvE4typeEENKUlvE_clEv@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v3;
  _QWORD v4[10];
  char v5;
  uint64_t v6;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v3);
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v4, a1);
  v3 = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)&v4[-1] + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v4[0] = MEMORY[0x1E0DE4FB8] + 16;
  if (v5 < 0)
    operator delete((void *)v4[8]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x193FFF9A8](&v6);
}

void sub_18F19BDA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  std::ios_base *v6;

  v2 = MEMORY[0x1E0DE4FE0];
  v3 = MEMORY[0x1E0DE4FE0] + 64;
  *(_QWORD *)(a1 + 112) = MEMORY[0x1E0DE4FE0] + 64;
  v4 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 8);
  v5 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 16);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + *(_QWORD *)(v4 - 24)) = v5;
  v6 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v6, (void *)(a1 + 8));
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 112) = v3;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 8) = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_18F19BE7C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x193FFF9A8](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x1E0DE4F60];
  v3 = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)a1 = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 8) = MEMORY[0x1E0DE4FB8] + 16;
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x193FFF9A8](a1 + 112);
  return a1;
}

uint64_t std::stringbuf::str[abi:ne180100]<std::allocator<char>>@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  unint64_t v4;
  const void *v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  result = std::stringbuf::view[abi:ne180100](a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = (const void *)result;
  v6 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v9 = operator new(v7 + 1);
    a2[1] = v6;
    a2[2] = v8 | 0x8000000000000000;
    *a2 = v9;
    a2 = v9;
  }
  else
  {
    *((_BYTE *)a2 + 23) = v4;
    if (!v4)
      goto LABEL_9;
  }
  result = (uint64_t)memmove(a2, v5, v6);
LABEL_9:
  *((_BYTE *)a2 + v6) = 0;
  return result;
}

uint64_t std::stringbuf::view[abi:ne180100](uint64_t a1)
{
  int v1;
  unint64_t v3;

  v1 = *(_DWORD *)(a1 + 96);
  if ((v1 & 0x10) != 0)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 88) < v3)
      *(_QWORD *)(a1 + 88) = v3;
    return *(_QWORD *)(a1 + 40);
  }
  else if ((v1 & 8) != 0)
  {
    return *(_QWORD *)(a1 + 16);
  }
  else
  {
    return 0;
  }
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E2933028, MEMORY[0x1E0DE42D0]);
}

void sub_18F19C060(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

std::string *caulk::slog::detail::string_converter::string_converter(std::string *this, __int128 *a2)
{
  __int128 v3;
  std::string *v4;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v3 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
  }
  this[1].__r_.__value_.__s.__data_[0] = 1;
  v4 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    v4 = (std::string *)this->__r_.__value_.__r.__words[0];
  this[1].__r_.__value_.__l.__size_ = (std::string::size_type)v4;
  return this;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

_QWORD *caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(_QWORD *a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6[0] = &off_1E2933508;
  v6[1] = a1;
  v7 = v6;
  caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::message(a1, a2, (uint64_t)v6);
  v3 = v7;
  if (v7 == v6)
  {
    v4 = 4;
    v3 = v6;
    goto LABEL_5;
  }
  if (v7)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  a1[5] = 0;
  a1[6] = 0;
  return a1;
}

void sub_18F19C22C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_QWORD *caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::message(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  *a1 = v5;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)(a1 + 1), a3);

  return a1;
}

void sub_18F19C2B0(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::~__func()
{
  JUMPOUT(0x193FFF9D8);
}

_QWORD *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E2933508;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E2933508;
  a2[1] = v2;
  return result;
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::operator()(uint64_t a1, id *a2, id *a3)
{
  std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1} &,NSError {__strong},std::tuple>((uint64_t *)(a1 + 8), a2, a3);
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::target_type()
{
}

void std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1} &,NSError {__strong},std::tuple>(uint64_t *a1, id *a2, id *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = *a2;
  v6 = *a1;
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  objc_storeStrong((id *)(v6 + 48), *a3);
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

uint64_t std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 24) + 24))(*(_QWORD *)(a2 + 24), a1);
    }
    else
    {
      *(_QWORD *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 24) = 0;
  }
  return a1;
}

void ___ZN5caulk3xpc7messageIU8__strongPU25objcproto14ServerProtocol11objc_objectJU8__strongP12NSDictionaryEE10sync_proxyEv_block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = 0;
  std::function<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::operator()(a1 + 32, a2, (uint64_t)&v2);

}

void sub_18F19C4C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void std::function<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::operator()(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  v6 = a2;
  v5 = *(_QWORD *)(a1 + 24);
  if (!v5)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, id *, uint64_t))(*(_QWORD *)v5 + 48))(v5, &v6, a3);

}

void sub_18F19C538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c75_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryEEEEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
}

_QWORD *__destroy_helper_block_ea8_32c75_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP12NSDictionaryEEEEEE(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 56);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x193FFF9D8);
}

void ___ZN5caulk3xpc7messageIU8__strongPU25objcproto14ServerProtocol11objc_objectJU8__strongP12NSDictionaryEE5replyEv_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  std::function<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::operator()(a1 + 32, a2, (uint64_t)&v5);

}

void sub_18F19C630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

_QWORD *caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(_QWORD *a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6[0] = &off_1E2933610;
  v6[1] = a1;
  v7 = v6;
  caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::message(a1, a2, (uint64_t)v6);
  v3 = v7;
  if (v7 == v6)
  {
    v4 = 4;
    v3 = v6;
    goto LABEL_5;
  }
  if (v7)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  a1[5] = 0;
  a1[6] = 0;
  return a1;
}

void sub_18F19C6E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_QWORD *caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::message(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  *a1 = v5;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)(a1 + 1), a3);

  return a1;
}

void sub_18F19C768(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::~__func()
{
  JUMPOUT(0x193FFF9D8);
}

_QWORD *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E2933610;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E2933610;
  a2[1] = v2;
  return result;
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::operator()(uint64_t a1, id *a2, id *a3)
{
  std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1} &,NSError {__strong},std::tuple>((uint64_t *)(a1 + 8), a2, a3);
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1},std::allocator<std::tuple<NSDictionary *> &>,void ()(NSError,std::tuple<NSDictionary *>)>::target_type()
{
}

void ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJU8__strongP12NSDictionaryEE10sync_proxyEv_block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = 0;
  std::function<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::operator()(a1 + 32, a2, (uint64_t)&v2);

}

void sub_18F19C870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJU8__strongP12NSDictionaryEE5replyEv_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  std::function<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::operator()(a1 + 32, a2, (uint64_t)&v5);

}

void sub_18F19C8CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_18F19CC40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void ___ZN5caulk3xpc7messageIU8__strongPU25objcproto14ServerProtocol11objc_objectJU8__strongP12NSDictionaryEE11async_proxyEv_block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = 0;
  std::function<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::operator()(a1 + 32, a2, (uint64_t)&v2);

}

void sub_18F19CD0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJU8__strongP12NSDictionaryEE11async_proxyEv_block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = 0;
  std::function<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::operator()(a1 + 32, a2, (uint64_t)&v2);

}

void sub_18F19CD58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

_QWORD *caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(_QWORD *a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6[0] = &off_1E2933560;
  v6[1] = a1;
  v7 = v6;
  caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::message(a1, a2, (uint64_t)v6);
  v3 = v7;
  if (v7 == v6)
  {
    v4 = 4;
    v3 = v6;
    goto LABEL_5;
  }
  if (v7)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  a1[5] = 0;
  a1[6] = 0;
  return a1;
}

void sub_18F19CE0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_QWORD *caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::message(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  *a1 = v5;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)(a1 + 1), a3);

  return a1;
}

void sub_18F19CE90(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::~__func()
{
  JUMPOUT(0x193FFF9D8);
}

_QWORD *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E2933560;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E2933560;
  a2[1] = v2;
  return result;
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::operator()(uint64_t a1, id *a2, id *a3)
{
  std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1} &,NSError {__strong},std::tuple>((uint64_t *)(a1 + 8), a2, a3);
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::target_type()
{
}

_QWORD *caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(_QWORD *a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6[0] = &off_1E2933668;
  v6[1] = a1;
  v7 = v6;
  caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::message(a1, a2, (uint64_t)v6);
  v3 = v7;
  if (v7 == v6)
  {
    v4 = 4;
    v3 = v6;
    goto LABEL_5;
  }
  if (v7)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  a1[5] = 0;
  a1[6] = 0;
  return a1;
}

void sub_18F19D000(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_QWORD *caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::message(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  *a1 = v5;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)(a1 + 1), a3);

  return a1;
}

void sub_18F19D084(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::~__func()
{
  JUMPOUT(0x193FFF9D8);
}

_QWORD *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E2933668;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E2933668;
  a2[1] = v2;
  return result;
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::operator()(uint64_t a1, id *a2, id *a3)
{
  std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},NSDictionary * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSDictionary *> &&)#1} &,NSError {__strong},std::tuple>((uint64_t *)(a1 + 8), a2, a3);
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},NSArray<NSNumber *> * {__strong}>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<NSArray<NSNumber *> *> &&)#1},std::allocator<std::tuple<NSArray<NSNumber *> *> &>,void ()(NSError,std::tuple<NSArray<NSNumber *> *>)>::target_type()
{
}

void ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJU8__strongP7NSArrayIP8NSNumberEEE10sync_proxyEv_block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = 0;
  std::function<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::operator()(a1 + 32, a2, (uint64_t)&v2);

}

void sub_18F19D18C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void std::function<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::operator()(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  v6 = a2;
  v5 = *(_QWORD *)(a1 + 24);
  if (!v5)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, id *, uint64_t))(*(_QWORD *)v5 + 48))(v5, &v6, a3);

}

void sub_18F19D1FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c81_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP7NSArrayIP8NSNumberEEEEEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
}

_QWORD *__destroy_helper_block_ea8_32c81_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJU8__strongP7NSArrayIP8NSNumberEEEEEEE(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 56);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJU8__strongP7NSArrayIP8NSNumberEEE5replyEv_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a3;
  std::function<void ()(NSError *,std::tuple<NSArray<NSNumber *> * {__strong}> &&)>::operator()(a1 + 32, a2, (uint64_t)&v5);

}

void sub_18F19D298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

uint64_t caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6[0] = &off_1E29335B8;
  v6[1] = a1;
  v7 = v6;
  caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::message((_QWORD *)a1, a2, (uint64_t)v6);
  v3 = v7;
  if (v7 == v6)
  {
    v4 = 4;
    v3 = v6;
    goto LABEL_5;
  }
  if (v7)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  *(_QWORD *)(a1 + 40) = 0;
  *(_BYTE *)(a1 + 48) = 0;
  return a1;
}

void sub_18F19D350(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_QWORD *caulk::xpc::message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::message(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  *a1 = v5;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)(a1 + 1), a3);

  return a1;
}

void sub_18F19D3D4(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::~__func()
{
  JUMPOUT(0x193FFF9D8);
}

_QWORD *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E29335B8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E29335B8;
  a2[1] = v2;
  return result;
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::operator()(uint64_t a1, id *a2, _BYTE *a3)
{
  std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1} &,NSError {__strong},std::tuple>((uint64_t *)(a1 + 8), a2, a3);
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::target_type()
{
}

void std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1} &,NSError {__strong},std::tuple>(uint64_t *a1, id *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = *a2;
  v6 = *a1;
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  *(_BYTE *)(v6 + 48) = *a3;
}

void ___ZN5caulk3xpc7messageIU8__strongPU25objcproto14ServerProtocol11objc_objectJbEE10sync_proxyEv_block_invoke(uint64_t a1, void *a2)
{
  char v2;

  v2 = 0;
  std::function<void ()(NSError *,std::tuple<BOOL> &&)>::operator()(a1 + 32, a2, (uint64_t)&v2);
}

void std::function<void ()(NSError *,std::tuple<BOOL> &&)>::operator()(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  v6 = a2;
  v5 = *(_QWORD *)(a1 + 24);
  if (!v5)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, id *, uint64_t))(*(_QWORD *)v5 + 48))(v5, &v6, a3);

}

void sub_18F19D584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_ea8_32c51_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJbEEEEEE(uint64_t a1, uint64_t a2)
{
  return std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100](a1 + 32, a2 + 32);
}

_QWORD *__destroy_helper_block_ea8_32c51_ZTSNSt3__18functionIFvP7NSErrorONS_5tupleIJbEEEEEE(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *result;
  uint64_t v3;

  v1 = (_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 56);
  if (result == v1)
  {
    v3 = 4;
    result = v1;
  }
  else
  {
    if (!result)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

uint64_t caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::sync_message(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6[0] = &off_1E29336C0;
  v6[1] = a1;
  v7 = v6;
  caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::message((_QWORD *)a1, a2, (uint64_t)v6);
  v3 = v7;
  if (v7 == v6)
  {
    v4 = 4;
    v3 = v6;
    goto LABEL_5;
  }
  if (v7)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  *(_QWORD *)(a1 + 40) = 0;
  *(_BYTE *)(a1 + 48) = 0;
  return a1;
}

void sub_18F19D67C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_QWORD *caulk::xpc::message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::message(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  *a1 = v5;
  std::__function::__value_func<void ()(NSError *,std::tuple<NSDictionary * {__strong}> &&)>::__value_func[abi:ne180100]((uint64_t)(a1 + 1), a3);

  return a1;
}

void sub_18F19D700(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::~__func()
{
  JUMPOUT(0x193FFF9D8);
}

_QWORD *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E29336C0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E29336C0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::operator()(uint64_t a1, id *a2, _BYTE *a3)
{
  std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<caulk::xpc::sync_message<objc_object  {objcproto14ServerProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1} &,NSError {__strong},std::tuple>((uint64_t *)(a1 + 8), a2, a3);
}

uint64_t std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<caulk::xpc::sync_message<objc_object  {objcproto26CAReportingServiceProtocol}* {__strong},BOOL>::sync_message(NSXPCConnection *)::{lambda(NSError *,std::tuple<BOOL> &&)#1},std::allocator<std::tuple<BOOL> &>,void ()(NSError,std::tuple<BOOL>)>::target_type()
{
}

void ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJbEE10sync_proxyEv_block_invoke(uint64_t a1, void *a2)
{
  char v2;

  v2 = 0;
  std::function<void ()(NSError *,std::tuple<BOOL> &&)>::operator()(a1 + 32, a2, (uint64_t)&v2);
}

void ___ZN5caulk3xpc7messageIU8__strongPU37objcproto26CAReportingServiceProtocol11objc_objectJbEE5replyEv_block_invoke(uint64_t a1, void *a2, char a3)
{
  char v3;

  v3 = a3;
  std::function<void ()(NSError *,std::tuple<BOOL> &&)>::operator()(a1 + 32, a2, (uint64_t)&v3);
}

void CreateSharedCAReportingClient()
{
  void *v0;
  id v1;

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v0 = (void *)MEMORY[0x193FFFB10]();
    v1 = +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
    objc_autoreleasePoolPop(v0);
  }
}

uint64_t CAReportingClientCreateReporterIDFromSessionID(uint64_t a1)
{
  void *v3;
  CAReporter *v4;
  CAReporter *v5;
  uint64_t v6;

  if (_os_feature_enabled_impl())
    return AudioAnalyticsCreateReporterFromSessionID();
  v3 = (void *)MEMORY[0x193FFFB10]();
  v4 = -[CAReporter initWithSessionID:serviceType:]([CAReporter alloc], "initWithSessionID:serviceType:", a1, 0xFFFFLL);
  v5 = v4;
  if (v4)
    v6 = -[CAReporter reporterID](v4, "reporterID");
  else
    v6 = 0;

  objc_autoreleasePoolPop(v3);
  return v6;
}

void sub_18F19D918(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t CAReportingClientCreateTestReporterID()
{
  NSObject *v0;
  void *v1;
  CATestReporter *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v0 = objc_retainAutorelease(*(id *)AA_ClientCategory());
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "CAReportingClientWrap.mm";
    v9 = 1024;
    v10 = 67;
    _os_log_impl(&dword_18F18F000, v0, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CAReportingClientCreateTestReporterID called", (uint8_t *)&v7, 0x12u);
  }
  v1 = (void *)MEMORY[0x193FFFB10]();
  v2 = -[CATestReporter initWithNewReporterID]([CATestReporter alloc], "initWithNewReporterID");
  v3 = objc_retainAutorelease(*(id *)AA_ClientCategory());
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[CAReporter reporterID](v2, "reporterID");
    v7 = 136315650;
    v8 = "CAReportingClientWrap.mm";
    v9 = 1024;
    v10 = 71;
    v11 = 2048;
    v12 = v4;
    _os_log_impl(&dword_18F18F000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d CAReportingClientCreateTestReporterID { careporter_id=%lli }", (uint8_t *)&v7, 0x1Cu);
  }

  if (v2)
    v5 = -[CAReporter reporterID](v2, "reporterID");
  else
    v5 = 0;

  objc_autoreleasePoolPop(v1);
  return v5;
}

void sub_18F19DAB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t CAReportingClientCopyConfiguration(uint64_t a1)
{
  void *v2;
  void *v3;

  if (_os_feature_enabled_impl())
    JUMPOUT(0x193FFF81CLL);
  if (a1)
  {
    v2 = (void *)MEMORY[0x193FFFB10]();
    +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getConfigurationForReporterID:", a1);
    a1 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v2);
  }
  return a1;
}

void sub_18F19DB68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void CAReportingClientSendSingleMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;

  if (_os_feature_enabled_impl())
  {
    AudioAnalyticsSendSessionlessMessage();
  }
  else
  {
    v6 = (void *)MEMORY[0x193FFFB10]();
    +[CAReporter sendSingleMessage:category:type:](CAReporter, "sendSingleMessage:category:type:", a1, a2, a3);
    objc_autoreleasePoolPop(v6);
  }
}

void CAReportingClientRequestMessage(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  if (_os_feature_enabled_impl())
  {
    AudioAnalyticsRequestMessage();
  }
  else if (a1)
  {
    v7 = (void *)MEMORY[0x193FFFB10]();
    +[CAReportingClient sharedInstance](CAReportingClient, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requestMessageWithID:category:type:callback:", a1, a2, a3, v9);

    objc_autoreleasePoolPop(v7);
  }

}

void sub_18F19DCB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

std::string *caulk::slog::detail::string_converter::string_converter<char *>(std::string *a1, const char **a2)
{
  const char **v4;
  void *__p[2];
  char v6;

  v4 = a2;
  _ZZN5caulk4slog6detail16string_converterC1IPcEERKT_PNSt3__19enable_ifIXsr14has_extract_opIS5_EE5valueEvE4typeEENKUlvE_clEv(&v4, __p);
  caulk::slog::detail::string_converter::string_converter(a1, (__int128 *)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  return a1;
}

void sub_18F19DD28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
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

void sub_18F19E0A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::vector<pc_session *>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<pc_session *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

char *std::vector<pc_session *>::__assign_with_size[abi:ne180100]<pc_session **,pc_session **>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 3)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 61)
      std::vector<pc_session *>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 2;
    if (v8 >> 2 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<pc_session *>::__vallocate[abi:ne180100](v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 3;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[8 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

char *std::vector<pc_session *>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<pc_session *>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<pc_session *>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

uint64_t _ZZN5caulk4slog6detail16string_converterC1IPcEERKT_PNSt3__19enable_ifIXsr14has_extract_opIS5_EE5valueEvE4typeEENKUlvE_clEv@<X0>(const char ***a1@<X0>, _QWORD *a2@<X8>)
{
  const char *v4;
  size_t v5;
  uint64_t v7;
  _QWORD v8[10];
  char v9;
  uint64_t v10;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v7);
  v4 = **a1;
  v5 = strlen(v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v7, (uint64_t)v4, v5);
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v8, a2);
  v7 = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)&v8[-1] + *(_QWORD *)(v7 - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v8[0] = MEMORY[0x1E0DE4FB8] + 16;
  if (v9 < 0)
    operator delete((void *)v8[8]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x193FFF9A8](&v10);
}

void sub_18F19E3BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x193FFF930](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x1E0DE4A90]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x193FFF93C](v13);
  return a1;
}

void sub_18F19E4D8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x193FFF93C](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x18F19E4B8);
}

void sub_18F19E520(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_18F19E654(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

uint64_t CAReportingUtilityShouldSendMessage()
{
  return 1;
}

uint64_t CAReportingUtilityGenerateServiceTypeFromServiceName(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int16 v6;

  v1 = a1;
  v2 = (void *)MEMORY[0x193FFFB10]();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", &unk_1E2935EE0, CFSTR("generic"), &unk_1E2935EF8, CFSTR("siri"), &unk_1E2935F10, CFSTR("telephony"), &unk_1E2935F28, CFSTR("haptics"), &unk_1E2935F40, CFSTR("alarms"), &unk_1E2935F58, CFSTR("standalone"), &unk_1E2935F70, CFSTR("soundautoconfig"), &unk_1E2935F88, CFSTR("longformaudio"), &unk_1E2935FA0,
    CFSTR("nonlongformaudio"),
    &unk_1E2935FB8,
    CFSTR("audiodeviceusage"),
    &unk_1E2935FD0,
    CFSTR("alerts"),
    &unk_1E2935FE8,
    CFSTR("test"),
    &unk_1E2936000,
    CFSTR("apiusage"),
    &unk_1E2936018,
    CFSTR("systemsounds"),
    &unk_1E2936030,
    CFSTR("secure"),
    &unk_1E2936048,
    CFSTR("soundanalysis"),
    &unk_1E2936060,
    CFSTR("unknown"),
    0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v3, "objectForKey:", v1);
  else
    objc_msgSend(v3, "objectForKey:", CFSTR("unknown"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_autoreleasePoolPop(v2);
  return v6;
}

void sub_18F19E934(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id CAReportingUtilityCategoryString(int a1)
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  const __CFString *v7;

  v2 = (void *)MEMORY[0x193FFFB10]();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((a1 - 0x10000) > 0xFFFEFFFE)
    goto LABEL_17;
  v5 = a1 & 0xFFFF0000;
  if ((int)(a1 & 0xFFFF0000) > 0xFFFFFFF)
  {
    switch(v5)
    {
      case 0x10000000u:
        v6 = CFSTR("DSP");
        goto LABEL_15;
      case 0x20000000u:
        v6 = CFSTR("HAL");
        goto LABEL_15;
      case 0x40000000u:
        v6 = CFSTR("Routing");
        goto LABEL_15;
    }
  }
  else
  {
    switch(v5)
    {
      case 0x80000000:
        v6 = CFSTR("Toolbox");
        goto LABEL_15;
      case 0x4000000u:
        v6 = CFSTR("MIDI");
        goto LABEL_15;
      case 0x8000000u:
        v6 = CFSTR("Session");
LABEL_15:
        objc_msgSend(v3, "appendString:", v6);
        break;
    }
  }
  objc_msgSend(v4, "appendString:", CFSTR("_"));
LABEL_17:
  if ((unsigned __int16)(a1 - 1) > 0x12u)
    v7 = CFSTR("Undefined");
  else
    v7 = off_1E2933B98[(__int16)(a1 - 1)];
  objc_msgSend(v4, "appendString:", v7);
  objc_autoreleasePoolPop(v2);
  return v4;
}

void sub_18F19EAB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

const __CFString *CAReportingUtilityTypeString(__int16 a1)
{
  void *v2;
  const __CFString *v3;

  v2 = (void *)MEMORY[0x193FFFB10]();
  if ((unsigned __int16)(a1 + 1) > 0x16u)
    v3 = CFSTR("Generic");
  else
    v3 = off_1E2933C30[(__int16)(a1 + 1)];
  objc_autoreleasePoolPop(v2);
  return v3;
}

id CAReportingUtilityGetReportingServerQueue()
{
  if (CAReportingUtilityGetReportingServerQueue::onceToken != -1)
    dispatch_once(&CAReportingUtilityGetReportingServerQueue::onceToken, &__block_literal_global_393);
  return (id)CAReportingUtilityGetReportingServerQueue::gReportingServerQueue;
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15430]();
}

uint64_t AudioAnalyticsCopyConfiguration()
{
  return MEMORY[0x1E0CFEF20]();
}

uint64_t AudioAnalyticsCreateReporter()
{
  return MEMORY[0x1E0CFEF28]();
}

uint64_t AudioAnalyticsCreateReporterFromSessionID()
{
  return MEMORY[0x1E0CFEF30]();
}

uint64_t AudioAnalyticsDestroyReporter()
{
  return MEMORY[0x1E0CFEF38]();
}

uint64_t AudioAnalyticsGetAudioServiceType()
{
  return MEMORY[0x1E0CFEF40]();
}

uint64_t AudioAnalyticsRequestMessage()
{
  return MEMORY[0x1E0CFEF48]();
}

uint64_t AudioAnalyticsSendMessage()
{
  return MEMORY[0x1E0CFEF50]();
}

uint64_t AudioAnalyticsSendSessionlessMessage()
{
  return MEMORY[0x1E0CFEF58]();
}

uint64_t AudioAnalyticsSetAudioServiceType()
{
  return MEMORY[0x1E0CFEF60]();
}

uint64_t AudioAnalyticsSetConfiguration()
{
  return MEMORY[0x1E0CFEF68]();
}

uint64_t AudioAnalyticsStartReporter()
{
  return MEMORY[0x1E0CFEF70]();
}

uint64_t AudioAnalyticsStopReporter()
{
  return MEMORY[0x1E0CFEF78]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46E0]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E2933058(__p);
}

uint64_t operator delete()
{
  return off_1E2933060();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E2933068(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

clock_t clock(void)
{
  return MEMORY[0x1E0C82650]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
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

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1E0C84A08]();
}

uint64_t pc_session_add_metric()
{
  return MEMORY[0x1E0DE8148]();
}

uint64_t pc_session_begin()
{
  return MEMORY[0x1E0DE8160]();
}

uint64_t pc_session_create()
{
  return MEMORY[0x1E0DE8168]();
}

uint64_t pc_session_destroy()
{
  return MEMORY[0x1E0DE8180]();
}

uint64_t pc_session_end()
{
  return MEMORY[0x1E0DE8190]();
}

uint64_t pc_session_get_procname()
{
  return MEMORY[0x1E0DE8198]();
}

uint64_t pc_session_get_values()
{
  return MEMORY[0x1E0DE81B0]();
}

uint64_t pc_session_set_procpid()
{
  return MEMORY[0x1E0DE81B8]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

