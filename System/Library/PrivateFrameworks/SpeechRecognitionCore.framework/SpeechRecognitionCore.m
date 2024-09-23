void RXCFType::~RXCFType(RXCFType *this)
{
  JUMPOUT(0x2207B89E4);
}

uint64_t RXCFCopy(const __CFAllocator *a1, char *a2)
{
  return (*(uint64_t (**)(char *, const __CFAllocator *))(*((_QWORD *)a2 + 2) + 16))(a2 + 16, a1);
}

void RXCFFinalize(_QWORD *a1)
{
  void (***v1)(_QWORD);
  void (**v2)(_QWORD);

  v1 = (void (***)(_QWORD))(a1 + 2);
  v2 = (void (**)(_QWORD))(*(uint64_t (**)(char *))(a1[2] + 56))((char *)a1 + 16);
  (**v1)(v1);
  if (v2)
  {
    v2[2](v2);
    _Block_release(v2);
  }
}

uint64_t RXCFEqual(char *a1, char *a2)
{
  return (*(uint64_t (**)(char *, char *))(*((_QWORD *)a1 + 2) + 24))(a1 + 16, a2 + 16);
}

uint64_t RXCFHash(char *a1)
{
  return (*(uint64_t (**)(char *))(*((_QWORD *)a1 + 2) + 32))(a1 + 16);
}

uint64_t RXCFCopyFormattingDesc(char *a1, const __CFDictionary *a2)
{
  return (*(uint64_t (**)(char *, const __CFDictionary *))(*((_QWORD *)a1 + 2) + 40))(a1 + 16, a2);
}

uint64_t RXCFCopyDebugDesc(char *a1)
{
  return (*(uint64_t (**)(char *))(*((_QWORD *)a1 + 2) + 48))(a1 + 16);
}

uint64_t RXCFType::Copy(RXCFType *this, const __CFAllocator *a2)
{
  return 0;
}

uint64_t RXCFType::Equal(RXCFType *this, const RXCFType *a2)
{
  return 0;
}

uint64_t RXCFType::Hash(RXCFType *this)
{
  return 0;
}

uint64_t RXCFType::CopyFormattingDesc(RXCFType *this, const __CFDictionary *a2)
{
  return 0;
}

uint64_t RXCFType::CopyDebugDesc(RXCFType *this)
{
  return 0;
}

uint64_t RXCFType::WillDestroy(RXCFType *this)
{
  return 0;
}

CFIndex RXDebugFlagsUpdate()
{
  int AppBooleanValue;
  BOOL v1;
  char v2;
  char AppIntegerValue;
  char v4;
  CFIndex result;
  Boolean keyExistsAndHasValidFormat;

  sRXDebug = CFPreferencesGetAppIntegerValue(CFSTR("RXDebugFlag"), CFSTR("com.apple.SpeechRecognitionCore.speechrecognitiond"), 0);
  sRXVeryVerbose = CFPreferencesGetAppBooleanValue(CFSTR("RXVeryVerbose"), CFSTR("com.apple.SpeechRecognitionCore.speechrecognitiond"), 0) != 0;
  sRXAutomationMode = CFPreferencesGetAppIntegerValue(CFSTR("RXDebugAutomationMode"), CFSTR("com.apple.SpeechRecognitionCore.speechrecognitiond"), 0);
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("RXDebugAutomationSimulateOpenMic"), CFSTR("com.apple.SpeechRecognitionCore.speechrecognitiond"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = AppBooleanValue == 0;
  else
    v1 = 0;
  v2 = !v1;
  sRXAutomationSimulateOpenMic = v2;
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("RXRecognitionResetTimeInSec"), CFSTR("com.apple.SpeechRecognitionCore.speechrecognitiond"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v4 = AppIntegerValue;
  else
    v4 = 5;
  sResetTimeInSec = v4;
  result = CFPreferencesGetAppIntegerValue(CFSTR("RXDebugAutomationSaveKeywordsAudio"), CFSTR("com.apple.SpeechRecognitionCore.speechrecognitiond"), 0);
  sRXAutomationSaveKeywordsAudio = result != 0;
  return result;
}

uint64_t RXLogServerResults()
{
  return sRXDebug >> 7;
}

uint64_t RXLogServerGrammar()
{
  return BYTE1(sRXDebug) & 1;
}

uint64_t RXLogSound()
{
  return (BYTE1(sRXDebug) >> 1) & 1;
}

uint64_t RXLogClientUpdates()
{
  return (BYTE1(sRXDebug) >> 2) & 1;
}

uint64_t RXLogPerformance()
{
  return (BYTE1(sRXDebug) >> 3) & 1;
}

uint64_t RXVeryVerbose()
{
  return sRXVeryVerbose;
}

BOOL RXAutomationModeSynthesis()
{
  return sRXAutomationMode == 1;
}

BOOL RXAutomationModeResult()
{
  return sRXAutomationMode == 2;
}

BOOL RXAutomationModeFileName()
{
  return sRXAutomationMode == 3;
}

uint64_t RXAutomationSimulateOpenMic()
{
  return sRXAutomationSimulateOpenMic;
}

uint64_t RXResetTimeInSec()
{
  return sResetTimeInSec;
}

uint64_t RXAutomationSaveKeywordsAudio()
{
  return sRXAutomationSaveKeywordsAudio;
}

void __RXAbort(int a1, uint64_t a2, uint64_t a3, uint64_t a4, CFStringRef format, ...)
{
  CFStringRef v9;
  CFStringRef v10;
  CFStringRef v11;
  const __CFString *v12;
  const __CFData *ExternalRepresentation;
  const UInt8 *BytePtr;
  size_t Length;
  va_list va;

  va_start(va, format);
  v9 = CFStringCreateWithFormatAndArguments(0, 0, format, va);
  v10 = v9;
  if (a4)
  else
    v11 = CFStringCreateWithFormat(0, 0, CFSTR("%s:%u: %@\n"), a2, a3, v9);
  v12 = v11;
  if (v10)
    CFRelease(v10);
  ExternalRepresentation = CFStringCreateExternalRepresentation(0, v12, 0x8000100u, 0);
  if (v12)
    CFRelease(v12);
  if (ExternalRepresentation)
  {
    BytePtr = CFDataGetBytePtr(ExternalRepresentation);
    Length = CFDataGetLength(ExternalRepresentation);
    write(1, BytePtr, Length);
    CFRelease(ExternalRepresentation);
  }
  if (a1)
    abort();
}

uint64_t RXIsAppleInternal()
{
  if (RXIsAppleInternal::onceToken != -1)
    dispatch_once(&RXIsAppleInternal::onceToken, &__block_literal_global);
  return RXIsAppleInternal::isAppleInternal;
}

void reportBacktrace()
{
  int v0;
  uint64_t v1;
  char **v2;
  char **v3;
  uint64_t i;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint32_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13[2];
  _OWORD v14[15];
  uint64_t v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  *(_OWORD *)v13 = 0u;
  memset(v14, 0, sizeof(v14));
  v0 = backtrace(v13, 33);
  v1 = (v0 - 2);
  v2 = backtrace_symbols((void *const *)v14, v1);
  if (v2)
  {
    v3 = v2;
    if (v0 >= 3)
    {
      for (i = 0; v1 != i; ++i)
      {
        v5 = v3[i];
        if (v5)
        {
          if (RXOSLog::onceToken != -1)
            dispatch_once(&RXOSLog::onceToken, &__block_literal_global_22);
          v6 = RXOSLog::signpostLog;
          if (!os_log_type_enabled((os_log_t)RXOSLog::signpostLog, OS_LOG_TYPE_ERROR))
            continue;
          v7 = *((_QWORD *)v14 + i);
          *(_DWORD *)buf = 67109634;
          v17 = i + 1;
          v18 = 2048;
          v19 = v7;
          v20 = 2080;
          v21 = v5;
          v8 = v6;
          v9 = "BACKTRACE: %-3d %p %s\n";
          v10 = 28;
        }
        else
        {
          if (RXOSLog::onceToken != -1)
            dispatch_once(&RXOSLog::onceToken, &__block_literal_global_22);
          v11 = RXOSLog::signpostLog;
          if (!os_log_type_enabled((os_log_t)RXOSLog::signpostLog, OS_LOG_TYPE_ERROR))
            continue;
          v12 = *((_QWORD *)v14 + i);
          *(_DWORD *)buf = 67109376;
          v17 = i + 1;
          v18 = 2048;
          v19 = v12;
          v8 = v11;
          v9 = "BACKTRACE: %-3d %p\n";
          v10 = 18;
        }
        _os_log_impl(&dword_21EBE7000, v8, OS_LOG_TYPE_ERROR, v9, buf, v10);
      }
    }
    free(v3);
  }
}

uint64_t RXSignpostLog()
{
  if (RXSignpostLog::onceToken != -1)
    dispatch_once(&RXSignpostLog::onceToken, &__block_literal_global_20);
  return RXSignpostLog::signpostLog;
}

uint64_t RXOSLog()
{
  if (RXOSLog::onceToken != -1)
    dispatch_once(&RXOSLog::onceToken, &__block_literal_global_22);
  return RXOSLog::signpostLog;
}

const char *RXPropertyKeyName(int a1)
{
  const char *result;

  if (a1 > 1919770999)
  {
    if (a1 <= 1936028273)
    {
      if (a1 <= 1935766883)
      {
        switch(a1)
        {
          case 1919771000:
            return "kRXRecognizerProperty_MaxResults";
          case 1919841645:
            return "kRXRecognizerProperty_NumberMode";
          case 1920168044:
            return "kRXRecognizerProperty_SpellingMode";
        }
      }
      else if (a1 > 1935832435)
      {
        if (a1 == 1935832436)
          return "kRXRecognitionSystemProperty_BeginUtteranceCallback";
        if (a1 == 1936027494)
          return "kRXRecognitionSystemProperty_EndOfFileCallback";
      }
      else
      {
        if (a1 == 1935766884)
          return "kRXRecognitionSystemProperty_AudioDevice";
        if (a1 == 1935766886)
          return "kRXRecognitionSystemProperty_AudioFormat";
      }
    }
    else if (a1 > 1936946545)
    {
      if (a1 > 1937006910)
      {
        if (a1 == 1937006911)
          return "kRXRecognitionSystemProperty_Status";
        if (a1 == 1937077355)
          return "kRXRecognitionSystemProperty_SupportedTasks";
      }
      else
      {
        if (a1 == 1936946546)
          return "kRXRecognitionSystemProperty_SourceURL";
        if (a1 == 1937006881)
          return "kRXRecognitionSystemProperty_StatusBlocking";
      }
    }
    else if (a1 > 1936749166)
    {
      if (a1 == 1936749167)
        return "kRXRecognitionSystemProperty_FilterProfanity";
      if (a1 == 1936941429)
        return "kRXRecognitionSystemProperty_SourceAudio";
    }
    else
    {
      if (a1 == 1936028274)
        return "kRXRecognitionSystemProperty_ServerErrorCallback";
      if (a1 == 1936487278)
        return "kRXRecognitionSystemProperty_CanListen";
    }
  }
  else if (a1 <= 1819439219)
  {
    if (a1 <= 1818588268)
    {
      switch(a1)
      {
        case 1818326372:
          return "kRXLanguageObjectProperty_Audio";
        case 1818391412:
          return "kRXLanguageObjectProperty_NBest";
        case 1818457208:
          return "kRXLanguageObjectProperty_Context";
      }
    }
    else if (a1 > 1819173228)
    {
      if (a1 == 1819173229)
        return "kRXLanguageObjectProperty_Name";
      if (a1 == 1819242612)
        return "kRXLanguageObjectProperty_Optional";
    }
    else
    {
      if (a1 == 1818588269)
        return "kRXLanguageObjectProperty_EndTime";
      if (a1 == 1818786160)
        return "kRXLanguageObjectProperty_Hypothesis";
    }
  }
  else if (a1 > 1919118444)
  {
    if (a1 > 1919705452)
    {
      if (a1 == 1919705453)
        return "kRXRecognizerProperty_LanguageModel";
      if (a1 == 1919710062)
        return "kRXRecognizerProperty_IsListening";
    }
    else
    {
      if (a1 == 1919118445)
        return "kRXRecognizerProperty_AllowCloseMatch";
      if (a1 == 1919120244)
        return "kRXRecognitionSystemProperty_TextToBeRecognized";
    }
  }
  else if (a1 > 1819571825)
  {
    if (a1 == 1819571826)
      return "kRXLanguageObjectProperty_TextVariants";
    if (a1 == 1819572340)
      return "kRXLanguageObjectProperty_Text";
  }
  else
  {
    if (a1 == 1819439220)
      return "kRXLanguageObjectProperty_Repeatable";
    if (a1 == 1819505773)
      return "kRXLanguageObjectProperty_StartTime";
  }
  result = (const char *)&RXPropertyKeyName::sTmpProp;
  byte_25547CF04 = 0;
  return result;
}

void RXObject::RXObject(RXObject *this)
{
  *(_QWORD *)this = &off_24E355978;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = -1;
  *((_QWORD *)this + 4) = 0;
}

void RXObject::~RXObject(RXObject *this, uint64_t a2, RXObject *a3)
{
  *(_QWORD *)this = &off_24E355978;
  RXRecognitionSystem::DeadObject(*((_QWORD *)this + 2), this, a3);
  RXCFProp<void const*>::~RXCFProp((const void **)this + 4);
  RXCFType::~RXCFType(this);
}

{
  RXObject::~RXObject(this, a2, a3);
  JUMPOUT(0x2207B89E4);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

CFTypeRef RXObject::CopyProperty(RXObject *this, int a2)
{
  const void *v3;
  const char *v5;
  CFStringRef v6;
  CFTypeRef v7;

  if (a2 == 1818457208)
  {
    v3 = (const void *)*((_QWORD *)this + 4);
    if (v3)
      return CFRetain(v3);
  }
  else
  {
    v5 = RXPropertyKeyName(a2);
    v6 = CFCopyDescription((char *)this - 16);
    v7 = CFAutorelease(v6);
    __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 90, 0, CFSTR("Property %s not defined for %@"), v5, v7);
  }
  return 0;
}

CFTypeRef RXObject::CopyPropertyWithLocale(RXObject *this, int a2, const __CFLocale *a3)
{
  const void *v4;
  const char *v6;
  CFStringRef v7;
  CFTypeRef v8;

  if (a2 == 1818457208)
  {
    v4 = (const void *)*((_QWORD *)this + 4);
    if (v4)
      return CFRetain(v4);
  }
  else
  {
    v6 = RXPropertyKeyName(a2);
    v7 = CFCopyDescription((char *)this - 16);
    v8 = CFAutorelease(v7);
    __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 103, 0, CFSTR("Property %s not defined for %@"), v6, v8);
  }
  return 0;
}

void RXObject::SetProperty(CFTypeRef *this, int a2, CFTypeRef cf)
{
  const char *v4;
  CFStringRef v5;
  CFTypeRef v6;

  if (a2 == 1818457208)
  {
    RXCFProp<void const*>::operator=(this + 4, cf);
  }
  else
  {
    v4 = RXPropertyKeyName(a2);
    v5 = CFCopyDescription(this - 2);
    v6 = CFAutorelease(v5);
    __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 120, 0, CFSTR("Property %s not defined for %@"), v4, v6);
  }
}

CFTypeRef RXCFProp<void const*>::operator=(CFTypeRef *a1, CFTypeRef cf)
{
  if (cf)
    CFRetain(cf);
  if (*a1)
    CFRelease(*a1);
  *a1 = cf;
  return cf;
}

void RXObject::PropertyReadOnly(RXObject *this, int a2)
{
  CFStringRef v3;
  const char *v4;

  v3 = CFCopyDescription((char *)this - 16);
  v4 = RXPropertyKeyName(a2);
  __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 128, 0, CFSTR("Property %s is read only for %@"), v4, v3);
  CFRelease(v3);
}

void RXObject::PropertyWriteOnly(RXObject *this, int a2)
{
  CFStringRef v3;
  const char *v4;

  v3 = CFCopyDescription((char *)this - 16);
  v4 = RXPropertyKeyName(a2);
  __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 136, 0, CFSTR("Property %s is write only for %@"), v4, v3);
  CFRelease(v3);
}

uint64_t RXObject::Smudge(uint64_t this)
{
  *(_QWORD *)(this + 24) |= *(_QWORD *)(this + 16);
  return this;
}

BOOL RXObject::ShouldSerialize(RXObject *this, RXRecognitionSystem *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 1 << *((_DWORD *)a2 + 10);
  RXRecognitionSystem::ReachableObject((uint64_t **)a2, this);
  v4 = *((_QWORD *)this + 2);
  if ((v4 & v3) != 0)
  {
    v5 = *((_QWORD *)this + 3);
  }
  else
  {
    v6 = v4 | v3;
    v5 = *((_QWORD *)this + 3) | v3;
    *((_QWORD *)this + 2) = v6;
    *((_QWORD *)this + 3) = v5;
  }
  if ((v5 & v3) != 0)
    *((_QWORD *)this + 3) = v5 & ~v3;
  return (v5 & v3) != 0;
}

void RXObject::Serialize(uint64_t a1)
{
  CFStringRef v1;

  v1 = CFCopyDescription((CFTypeRef)(a1 - 16));
  __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 173, 0, CFSTR("Can't serialize %@"), v1);
  CFRelease(v1);
}

xpc_object_t RXObject::CreateXPCDesc(RXObject *this, int64_t a2, uint64_t **a3)
{
  xpc_object_t v5;

  RXRecognitionSystem::LiveObject(a3, this);
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, kRDKeyObjectType, a2);
  xpc_dictionary_set_uint64(v5, kRDKeyObjectID, (uint64_t)this);
  return v5;
}

uint64_t RXGetSupportedQuasarLocaleIdentifiers()
{
  if (RXGetSupportedQuasarLocaleIdentifiers::onceToken != -1)
    dispatch_once(&RXGetSupportedQuasarLocaleIdentifiers::onceToken, &__block_literal_global_0);
  return RXGetSupportedQuasarLocaleIdentifiers::supportedQuasarLocaleIdentifiers;
}

uint64_t RXGetSupportedNashvilleLocaleIdentifiers()
{
  if (RXGetSupportedNashvilleLocaleIdentifiers::onceToken != -1)
    dispatch_once(&RXGetSupportedNashvilleLocaleIdentifiers::onceToken, &__block_literal_global_50);
  return RXGetSupportedNashvilleLocaleIdentifiers::supportedNashvilleLocaleIdentifiers;
}

uint64_t RXObjectCopyProperty(RXXPC *a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD block[6];
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  v4 = RXXPC::Queue(a1);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __RXObjectCopyProperty_block_invoke;
  block[3] = &unk_24E355A68;
  block[4] = &v9;
  block[5] = a1;
  v8 = a2;
  dispatch_sync(v4, block);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

void sub_21EBE9B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFArrayRef RXCopyGlobalProperty(RXXPC *a1)
{
  RXXPC *v2;
  __CFSet *v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  CFIndex Count;
  const void **v7;
  const __CFArray *v8;
  CFStringRef *v9;
  CFMutableStringRef MutableCopy;
  CFIndex v11;
  const void **v12;
  CFArrayRef v13;
  const char *v14;
  const void **v15;
  const void **v16;
  int valuePtr;
  CFRange v18;
  CFRange v19;

  if ((int)a1 > 1885957746)
  {
    switch((_DWORD)a1)
    {
      case 0x70696E73:
        valuePtr = RXXPC::PurgeInstalledAssets(a1);
        return CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      case 0x736E7067:
        byte_25547CF04 = 0;
        __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 333, 0, CFSTR("Global property %s is write only"), &RXPropertyKeyName::sTmpProp);
        break;
      case 0x73746C69:
        byte_25547CF04 = 0;
        __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 318, 0, CFSTR("Global property %s is write only"), &RXPropertyKeyName::sTmpProp);
        break;
      default:
LABEL_27:
        v14 = RXPropertyKeyName((int)a1);
        __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 337, 0, CFSTR("Global property %s not defined"), v14);
        return 0;
    }
    return 0;
  }
  if ((_DWORD)a1 == 1668049262)
  {
    byte_25547CF04 = 0;
    __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 322, 0, CFSTR("Global property %s is write only"), &RXPropertyKeyName::sTmpProp);
    return 0;
  }
  if ((_DWORD)a1 != 1818324583)
  {
    if ((_DWORD)a1 == 1819505779)
      return (CFArrayRef)RXXPC::CopyLanguageInstallationStatus(a1);
    goto LABEL_27;
  }
  v2 = RDCopyNashvilleModelLanguages();
  if (!v2)
    return CFArrayCreate(0, 0, 0, MEMORY[0x24BDBD690]);
  v3 = v2;
  v4 = (const __CFDictionary *)RXXPC::CopyLanguageInstallationStatus(v2);
  if (v4)
  {
    v5 = v4;
    Count = CFDictionaryGetCount(v4);
    v7 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
    v15 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
    v16 = v7;
    CFDictionaryGetKeysAndValues(v5, v7, v15);
    if (RXGetSupportedQuasarLocaleIdentifiers::onceToken != -1)
      dispatch_once(&RXGetSupportedQuasarLocaleIdentifiers::onceToken, &__block_literal_global_0);
    if (Count >= 1)
    {
      v8 = (const __CFArray *)RXGetSupportedQuasarLocaleIdentifiers::supportedQuasarLocaleIdentifiers;
      v9 = (CFStringRef *)v15;
      do
      {
        if (CFStringHasPrefix(*v9, CFSTR("Version:")))
        {
          MutableCopy = CFStringCreateMutableCopy(0, 0, (CFStringRef)*v7);
          v19.length = CFStringGetLength(MutableCopy);
          v19.location = 0;
          CFStringFindAndReplace(MutableCopy, CFSTR("-"), CFSTR("_"), v19, 0);
          if (v8)
          {
            v18.length = CFArrayGetCount(v8);
            v18.location = 0;
            if (CFArrayContainsValue(v8, v18, MutableCopy))
              CFSetAddValue(v3, MutableCopy);
          }
          CFRelease(MutableCopy);
        }
        ++v7;
        ++v9;
        --Count;
      }
      while (Count);
    }
    CFRelease(v5);
    free(v16);
    free(v15);
  }
  v11 = CFSetGetCount(v3);
  v12 = (const void **)operator new[]();
  CFSetGetValues(v3, v12);
  v13 = CFArrayCreate(0, v12, v11, MEMORY[0x24BDBD690]);
  CFRelease(v3);
  MEMORY[0x2207B89CC](v12, 0xC0C80B8AA526DLL);
  return v13;
}

const void *RXCopyLocaleProperty(const __CFString *a1, int a2)
{
  const char *v3;

  if (a2 == 1667326824)
    return RDCopyCacheVersion(a1);
  v3 = RXPropertyKeyName(a2);
  __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 350, 0, CFSTR("Per-locale property %s not defined"), v3);
  return 0;
}

uint64_t RXObjectCopyPropertyWithLocale(RXXPC *a1, int a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  _QWORD v9[7];
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = 0;
  v6 = RXXPC::Queue(a1);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 0x40000000;
  v9[2] = __RXObjectCopyPropertyWithLocale_block_invoke;
  v9[3] = &unk_24E355A90;
  v9[4] = &v11;
  v9[5] = a1;
  v10 = a2;
  v9[6] = a3;
  dispatch_sync(v6, v9);
  v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v7;
}

void sub_21EBEA0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void RXObjectSetProperty(RXXPC *a1, int a2, uint64_t a3)
{
  NSObject *v6;
  _QWORD block[6];
  int v8;

  v6 = RXXPC::Queue(a1);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __RXObjectSetProperty_block_invoke;
  block[3] = &__block_descriptor_tmp_60;
  v8 = a2;
  block[4] = a1;
  block[5] = a3;
  dispatch_sync(v6, block);
}

void sub_21EBEA52C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  RXTransaction<RXObject>::~RXTransaction((uint64_t)va);
  _Unwind_Resume(a1);
}

void RXSetLocaleProperty(const __CFString *a1, int a2, const void *a3)
{
  const char *v3;

  if (a2 == 1667326824)
  {
    if (!a3 || (const void *)*MEMORY[0x24BDBD268] == a3)
      RDNukeCache(a1);
  }
  else
  {
    v3 = RXPropertyKeyName(a2);
    __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXObject.cpp", 456, 0, CFSTR("Per-locale property %s not defined"), v3);
  }
}

unint64_t RXEngineTypeForLocaleIdentifier(CFStringRef localeIdentifier)
{
  const __CFString *CanonicalLocaleIdentifierFromString;
  const __CFString *v2;
  const __CFString *MutableCopy;
  __CFString *v4;
  unint64_t v5;
  CFRange v7;
  CFRange v8;

  if (!localeIdentifier)
    return 0;
  CanonicalLocaleIdentifierFromString = CFLocaleCreateCanonicalLocaleIdentifierFromString(0, localeIdentifier);
  if (!CanonicalLocaleIdentifierFromString)
    return 0;
  v2 = CanonicalLocaleIdentifierFromString;
  MutableCopy = CFStringCreateMutableCopy(0, 0, CanonicalLocaleIdentifierFromString);
  if (MutableCopy)
  {
    v4 = (__CFString *)MutableCopy;
    v8.length = CFStringGetLength(MutableCopy);
    v8.location = 0;
    CFStringFindAndReplace(v4, CFSTR("-"), CFSTR("_"), v8, 0);
    if (RXGetSupportedQuasarLocaleIdentifiers::onceToken != -1)
      dispatch_once(&RXGetSupportedQuasarLocaleIdentifiers::onceToken, &__block_literal_global_0);
    v5 = RXGetSupportedQuasarLocaleIdentifiers::supportedQuasarLocaleIdentifiers;
    if (RXGetSupportedQuasarLocaleIdentifiers::supportedQuasarLocaleIdentifiers)
    {
      v7.length = CFArrayGetCount((CFArrayRef)RXGetSupportedQuasarLocaleIdentifiers::supportedQuasarLocaleIdentifiers);
      v7.location = 0;
      v5 = CFArrayContainsValue((CFArrayRef)v5, v7, v4) != 0;
    }
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  CFRelease(v2);
  return v5;
}

BOOL RXIsLocaleWithNoSpaceInPostITN(CFStringRef theString)
{
  const __CFString *MutableCopy;
  __CFString *v2;
  const __CFArray *v3;
  const __CFArray *v4;
  _BOOL8 v5;
  const void *v7[6];
  CFRange v8;
  CFRange v9;

  v7[5] = *(const void **)MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("zh_CN");
  v7[1] = CFSTR("zh_HK");
  v7[2] = CFSTR("zh_TW");
  v7[3] = CFSTR("ja_JP");
  v7[4] = CFSTR("yue_CN");
  MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  if (!MutableCopy)
    return 0;
  v2 = (__CFString *)MutableCopy;
  v9.length = CFStringGetLength(MutableCopy);
  v9.location = 0;
  CFStringFindAndReplace(v2, CFSTR("-"), CFSTR("_"), v9, 0);
  v3 = CFArrayCreate(0, v7, 5, MEMORY[0x24BDBD690]);
  if (v3)
  {
    v4 = v3;
    v8.length = CFArrayGetCount(v3);
    v8.location = 0;
    v5 = CFArrayContainsValue(v4, v8, v2) != 0;
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  CFRelease(v2);
  return v5;
}

BOOL RXIsLocaleWithSpecialHyphenHandling(CFStringRef theString)
{
  const __CFString *MutableCopy;
  __CFString *v2;
  const __CFArray *v3;
  const __CFArray *v4;
  _BOOL8 v5;
  void *values;
  CFRange v8;
  CFRange v9;

  values = CFSTR("de_DE");
  MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  if (!MutableCopy)
    return 0;
  v2 = (__CFString *)MutableCopy;
  v9.length = CFStringGetLength(MutableCopy);
  v9.location = 0;
  CFStringFindAndReplace(v2, CFSTR("-"), CFSTR("_"), v9, 0);
  v3 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
  if (v3)
  {
    v4 = v3;
    v8.length = CFArrayGetCount(v3);
    v8.location = 0;
    v5 = CFArrayContainsValue(v4, v8, v2) != 0;
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  CFRelease(v2);
  return v5;
}

BOOL RXIsLocaleSupportingOndeviceSpeechDetection(CFStringRef theString)
{
  const __CFString *MutableCopy;
  __CFString *v2;
  const __CFArray *v3;
  const __CFArray *v4;
  _BOOL8 v5;
  void *values[3];
  CFRange v8;
  CFRange v9;

  values[2] = *(void **)MEMORY[0x24BDAC8D0];
  values[0] = CFSTR("en_US");
  values[1] = CFSTR("en_CA");
  MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  if (!MutableCopy)
    return 0;
  v2 = (__CFString *)MutableCopy;
  v9.length = CFStringGetLength(MutableCopy);
  v9.location = 0;
  CFStringFindAndReplace(v2, CFSTR("-"), CFSTR("_"), v9, 0);
  v3 = CFArrayCreate(0, (const void **)values, 2, MEMORY[0x24BDBD690]);
  if (v3)
  {
    v4 = v3;
    v8.length = CFArrayGetCount(v3);
    v8.location = 0;
    v5 = CFArrayContainsValue(v4, v8, v2) != 0;
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  CFRelease(v2);
  return v5;
}

uint64_t RXIsVoiceActionsVisionKWSEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t RXIsSpeechSPIEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t RXIsKeywordSpotterEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t RXIsSpeechDetectorEnabled()
{
  if ((_os_feature_enabled_impl() & 1) != 0)
    return 0;
  else
    return _os_feature_enabled_impl();
}

uint64_t RXIsUseIndependentVADEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t RXIsAudioDonationSupported()
{
  return _os_feature_enabled_impl();
}

BOOL RXIsAudioDonationOptedIn()
{
  return _AXSAudioDonationSiriImprovementEnabled() != 0;
}

BOOL RXIsLocaleSupportingKeywordSpotter(CFStringRef theString)
{
  const __CFString *MutableCopy;
  __CFString *v2;
  const __CFArray *v3;
  const __CFArray *v4;
  _BOOL8 v5;
  void *values[3];
  CFRange v8;
  CFRange v9;

  values[2] = *(void **)MEMORY[0x24BDAC8D0];
  values[0] = CFSTR("en_US");
  values[1] = CFSTR("en_CA");
  MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  if (!MutableCopy)
    return 0;
  v2 = (__CFString *)MutableCopy;
  v9.length = CFStringGetLength(MutableCopy);
  v9.location = 0;
  CFStringFindAndReplace(v2, CFSTR("-"), CFSTR("_"), v9, 0);
  v3 = CFArrayCreate(0, (const void **)values, 2, MEMORY[0x24BDBD690]);
  if (v3)
  {
    v4 = v3;
    v8.length = CFArrayGetCount(v3);
    v8.location = 0;
    v5 = CFArrayContainsValue(v4, v8, v2) != 0;
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  CFRelease(v2);
  return v5;
}

__CFDictionary *RXGetAssetFallbackLocales()
{
  __CFBundle *v0;
  __CFDictionary *Mutable;
  CFIndex Count;
  CFIndex v3;
  const void **v4;
  uint64_t i;
  const __CFDictionary *Value;
  const void *v7;

  v0 = RXGetAllLocalesProperties();
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v0)
  {
    Count = CFDictionaryGetCount(v0);
    if (Count >= 1)
    {
      v3 = Count;
      v4 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
      CFDictionaryGetKeysAndValues(v0, v4, 0);
      for (i = 0; i != v3; ++i)
      {
        Value = (const __CFDictionary *)CFDictionaryGetValue(v0, v4[i]);
        if (Value)
        {
          v7 = CFDictionaryGetValue(Value, CFSTR("AssetFallbackLocaleIdentifier"));
          if (v7)
            CFDictionaryAddValue(Mutable, v4[i], v7);
        }
      }
      free(v4);
    }
  }
  return Mutable;
}

__CFBundle *RXGetAllLocalesProperties(void)
{
  __CFBundle *result;

  result = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.SpeechRecognitionCore"));
  if (result)
    return (__CFBundle *)CFBundleGetValueForInfoDictionaryKey(result, CFSTR("LocaleProperties"));
  return result;
}

__CFDictionary *RXGetAssetFallbackLocaleIdentifier(const void *a1)
{
  __CFDictionary *result;

  result = RXGetAssetFallbackLocales();
  if (result)
    return (__CFDictionary *)CFDictionaryGetValue(result, a1);
  return result;
}

__CFArray *RXLocalesSupportingSpellingMode()
{
  __CFArray *Mutable;
  __CFBundle *v1;
  const __CFDictionary *v2;
  CFIndex Count;
  CFIndex v4;
  const void **v5;
  uint64_t i;
  const __CFDictionary *Value;
  const __CFBoolean *v8;

  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v1 = RXGetAllLocalesProperties();
  if (v1)
  {
    v2 = v1;
    Count = CFDictionaryGetCount(v1);
    if (Count >= 1)
    {
      v4 = Count;
      v5 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
      CFDictionaryGetKeysAndValues(v2, v5, 0);
      for (i = 0; i != v4; ++i)
      {
        Value = (const __CFDictionary *)CFDictionaryGetValue(v2, v5[i]);
        if (Value)
        {
          v8 = (const __CFBoolean *)CFDictionaryGetValue(Value, CFSTR("SupportsSpellingMode"));
          if (v8)
          {
            if (CFBooleanGetValue(v8))
              CFArrayAppendValue(Mutable, v5[i]);
          }
        }
      }
      free(v5);
    }
  }
  return Mutable;
}

const void *RXLocalizedStringForSpacebar(const void *a1)
{
  __CFBundle *v2;
  const __CFDictionary *v3;
  CFIndex Count;
  const void **v5;
  const __CFDictionary *Value;
  const void *v7;

  v2 = RXGetAllLocalesProperties();
  if (!v2)
    return 0;
  v3 = v2;
  Count = CFDictionaryGetCount(v2);
  if (Count < 1)
  {
    v7 = 0;
    v5 = 0;
  }
  else
  {
    v5 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
    CFDictionaryGetKeysAndValues(v3, v5, 0);
    Value = (const __CFDictionary *)CFDictionaryGetValue(v3, a1);
    if (Value)
      v7 = CFDictionaryGetValue(Value, CFSTR("LocalizedSpacebar"));
    else
      v7 = 0;
  }
  free(v5);
  return v7;
}

const void **RXCFProp<void const*>::~RXCFProp(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

uint64_t RXTransaction<RXObject>::~RXTransaction(uint64_t a1)
{
  RXRecognitionSystem::CommitChanges(*(RXRecognitionSystem **)(*(_QWORD *)a1 + 16));
  return a1;
}

void RXCFInit_RXRecognitionSystem(char *a1)
{
  RXRecognitionSystem::RXRecognitionSystem((RXRecognitionSystem *)(a1 + 16));
}

uint64_t RXCFRegister_RXRecognitionSystem(void)
{
  return _CFRuntimeRegisterClass();
}

uint64_t RecognizerStillExists(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v1 = *(_QWORD *)(sSystems + 8) - *(_QWORD *)sSystems;
  if (!v1)
    return 0;
  v2 = 0;
  v3 = 0;
  v4 = v1 >> 3;
  while (1)
  {
    v5 = *(_QWORD *)(*(_QWORD *)sSystems + 8 * v2);
    if (v5)
    {
      v6 = (_QWORD *)(v5 + 104);
      do
      {
        v7 = *v6;
        v6 = (_QWORD *)(*v6 + 88);
      }
      while (v7 != a1 && v7 != 0);
      if (v7)
        break;
    }
    v2 = ++v3;
    if (v4 <= v3)
      return 0;
  }
  return 1;
}

BOOL RXRecognitionSystem::DoesOwnRecognizer(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)(a1 + 104);
  do
  {
    v3 = *v2;
    v2 = (_QWORD *)(*v2 + 88);
  }
  while (v3 != a2 && v3 != 0);
  return v3 != 0;
}

void RXRecognitionSystem::StartChanges(RXRecognitionSystem *this)
{
  unint64_t v1;
  unsigned int v2;
  _QWORD *v3;
  unsigned int v4;

  if (this)
  {
    v1 = (unint64_t)this;
    v2 = 0;
    v3 = (_QWORD *)sSystems;
    do
    {
      v4 = v2;
      if (v2 >= (unint64_t)((uint64_t)(v3[1] - *v3) >> 3))
        break;
      if ((v1 & (1 << v2)) != 0)
      {
        RXRecognitionSystem::StartChanges(*(RXRecognitionSystem **)(*v3 + 8 * v2));
        v1 &= ~(1 << v4);
        v3 = (_QWORD *)sSystems;
      }
      v2 = v4 + 1;
    }
    while (v1);
  }
}

{
  if (!*((_DWORD *)this + 11))
    RXXPC::StartChanges(*((_QWORD *)this + 11));
  if (++*((_DWORD *)this + 11) >= 0x100u)
    __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXRecognitionSystem.cpp", 475, (uint64_t)"fChangeNesting < 0x100", CFSTR("Out of control change nesting"));
}

void RXRecognitionSystem::CommitChanges(RXRecognitionSystem *this)
{
  unint64_t v1;
  unsigned int v2;
  _QWORD *v3;
  unsigned int v4;

  if (this)
  {
    v1 = (unint64_t)this;
    v2 = 0;
    v3 = (_QWORD *)sSystems;
    do
    {
      v4 = v2;
      if (v2 >= (unint64_t)((uint64_t)(v3[1] - *v3) >> 3))
        break;
      if ((v1 & (1 << v2)) != 0)
      {
        RXRecognitionSystem::CommitChanges(*(RXRecognitionSystem **)(*v3 + 8 * v2));
        v1 &= ~(1 << v4);
        v3 = (_QWORD *)sSystems;
      }
      v2 = v4 + 1;
    }
    while (v1);
  }
}

{
  xpc_object_t v2;
  xpc_object_t v3;
  uint64_t v4;
  const __CFURL *v5;
  const __CFString *v6;
  void *v7;
  const __CFData *v8;
  const char *v9;
  const UInt8 *BytePtr;
  size_t Length;
  const __CFString *v12;
  char *v13;
  _QWORD *v14;
  uint64_t v15;
  xpc_object_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  char *v22;
  unint64_t v23;
  BOOL v24;
  _QWORD *v25;
  void *__p;
  _BYTE *v27;
  uint64_t v28;
  void **p_p;
  char *v30;
  char *v31;
  _QWORD *v32;
  uint64_t v33;

  if (!*((_DWORD *)this + 11))
    __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXRecognitionSystem.cpp", 481, (uint64_t)"fChangeNesting > 0", CFSTR("Unbalanced change nesting"));
  if (!--*((_DWORD *)this + 11))
  {
    v2 = xpc_array_create(0, 0);
    if (*((_QWORD *)this + 3))
    {
      v3 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v3, kRDKeyObjectType, 0);
      xpc_dictionary_set_uint64(v3, kRDKeyObjectID, (uint64_t)this);
      if ((*((_BYTE *)this + 11) & 1) != 0)
        xpc_dictionary_set_BOOL(v3, kRDKeyIsListening, *((_BYTE *)this + 81));
      if (*((_QWORD *)this + 32))
        v4 = (*((_QWORD *)this + 31) != 0) | 2;
      else
        v4 = *((_QWORD *)this + 31) != 0;
      xpc_dictionary_set_uint64(v3, kRDKeyCallbacks, v4);
      if (*((_BYTE *)this + 80))
        xpc_dictionary_set_BOOL(v3, kRDKeyFilterProfanity, 1);
      if (*((_BYTE *)this + 82))
      {
        *((_BYTE *)this + 82) = 0;
        v7 = (void *)*((_QWORD *)this + 7);
        if (v7)
        {
          RXXPC::SerializeURL((RXXPC *)v3, v7, v5);
        }
        else
        {
          v8 = (const __CFData *)*((_QWORD *)this + 8);
          if (v8)
          {
            v9 = kRDKeyAudioData;
            BytePtr = CFDataGetBytePtr(v8);
            Length = CFDataGetLength(*((CFDataRef *)this + 8));
            xpc_dictionary_set_data(v3, v9, BytePtr, Length);
          }
          else
          {
            v12 = (const __CFString *)*((_QWORD *)this + 9);
            if (v12)
              RXXPC::SerializeCFString((RXXPC *)v3, kRDKeyTextToBeRecognized, v12, v6);
          }
        }
      }
      xpc_array_append_value(v2, v3);
      xpc_release(v3);
      *((_QWORD *)this + 3) = 0;
    }
    std::__tree<RXObject *>::destroy((uint64_t)this + 224, *((_QWORD **)this + 29));
    *((_QWORD *)this + 28) = (char *)this + 232;
    *((_QWORD *)this + 29) = 0;
    *((_QWORD *)this + 30) = 0;
    v13 = (char *)this + 232;
    v14 = (_QWORD *)*((_QWORD *)this + 13);
    if (v14)
    {
      do
      {
        (*(void (**)(_QWORD *, xpc_object_t, RXRecognitionSystem *))(*v14 + 96))(v14, v2, this);
        v14 = (_QWORD *)v14[11];
      }
      while (v14);
      v13 = (char *)*((_QWORD *)this + 28);
    }
    __p = 0;
    v27 = 0;
    v28 = 0;
    v15 = *((_QWORD *)this + 14);
    v32 = (_QWORD *)((char *)this + 120);
    v33 = v15;
    v30 = (char *)this + 232;
    v31 = v13;
    p_p = &__p;
    std::__set_difference[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long> &,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long> &,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long> &,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long> &,std::back_insert_iterator<std::vector<RXObject *>> &>((uint64_t)&v33, &v32, (uint64_t)&v31, &v30, &p_p);
    std::__tree<RXObject *>::swap((uint64_t *)this + 14, (uint64_t)this + 224);
    std::__tree<RXObject *>::destroy((uint64_t)this + 224, *((_QWORD **)this + 29));
    *((_QWORD *)this + 29) = 0;
    *((_QWORD *)this + 30) = 0;
    *((_QWORD *)this + 28) = (char *)this + 232;
    if (v27 == __p)
    {
      v16 = 0;
    }
    else
    {
      v16 = xpc_array_create(0, 0);
      v17 = (v27 - (_BYTE *)__p) >> 3;
      v18 = (char *)this + 144;
      v19 = ~(1 << *((_DWORD *)this + 10));
      while (v17)
      {
        --v17;
        xpc_array_set_uint64(v16, 0xFFFFFFFFFFFFFFFFLL, *((_QWORD *)__p + v17));
        pthread_mutex_lock((pthread_mutex_t *)((char *)this + 160));
        v20 = *(_QWORD **)v18;
        v21 = *((_QWORD *)__p + v17);
        if (!*(_QWORD *)v18)
          goto LABEL_37;
        v22 = (char *)this + 144;
        do
        {
          v23 = v20[4];
          v24 = v23 >= v21;
          if (v23 >= v21)
            v25 = v20;
          else
            v25 = v20 + 1;
          if (v24)
            v22 = (char *)v20;
          v20 = (_QWORD *)*v25;
        }
        while (*v25);
        if (v22 == v18 || v21 < *((_QWORD *)v22 + 4))
LABEL_37:
          *(_QWORD *)(v21 + 16) &= v19;
        pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 160));
      }
    }
    pthread_mutex_lock((pthread_mutex_t *)((char *)this + 160));
    std::__tree<RXObject *>::destroy((uint64_t)this + 136, *((_QWORD **)this + 18));
    *((_QWORD *)this + 17) = (char *)this + 144;
    *((_QWORD *)this + 18) = 0;
    *((_QWORD *)this + 19) = 0;
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 160));
    RXXPC::CommitChanges(*((RXXPC **)this + 11), v2, v16);
    xpc_release(v2);
    if (v16)
      xpc_release(v16);
    if (__p)
    {
      v27 = __p;
      operator delete(__p);
    }
  }
}

void sub_21EBEB480(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t RXRecognitionSystem::DeadObject(uint64_t this, RXObject *a2, RXObject *a3)
{
  uint64_t v4;
  unsigned int v5;
  _QWORD *v6;
  unsigned int v7;

  if (this)
  {
    v4 = this;
    v5 = 0;
    v6 = (_QWORD *)sSystems;
    do
    {
      v7 = v5;
      if (v5 >= (unint64_t)((uint64_t)(v6[1] - *v6) >> 3))
        break;
      if ((v4 & (1 << v5)) != 0)
      {
        this = RXRecognitionSystem::DeadObject(*(uint64_t ***)(*v6 + 8 * v5), a2);
        v4 &= ~(1 << v7);
        v6 = (_QWORD *)sSystems;
      }
      v5 = v7 + 1;
    }
    while (v4);
  }
  return this;
}

uint64_t RXRecognitionSystem::DeadObject(uint64_t **this, RXObject *a2)
{
  pthread_mutex_t *v3;
  RXObject *v5;

  v5 = a2;
  v3 = (pthread_mutex_t *)(this + 20);
  pthread_mutex_lock((pthread_mutex_t *)(this + 20));
  std::__tree<RXObject *>::__emplace_unique_key_args<RXObject *,RXObject * const&>(this + 17, (unint64_t *)&v5, (uint64_t *)&v5);
  return pthread_mutex_unlock(v3);
}

uint64_t RXRecognitionSystem::Callback(RXRecognitionSystem *this, void *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t uint64;

  result = xpc_dictionary_get_uint64(this, kRDKeyObjectID);
  v4 = *(_QWORD *)(sSystems + 8) - *(_QWORD *)sSystems;
  if (v4)
  {
    v5 = 0;
    v6 = v4 >> 3;
    v7 = 1;
    while (1)
    {
      v8 = *(_QWORD *)(*(_QWORD *)sSystems + 8 * v5);
      if (v8 && result == v8)
        break;
      v5 = v7;
      if (v6 <= v7++)
        return result;
    }
    uint64 = xpc_dictionary_get_uint64(this, kRDKeyCallbacks);
    return RXRecognitionSystem::Callback(v8, uint64, this);
  }
  return result;
}

uint64_t RXRecognitionSystem::Callback(uint64_t this, uint64_t a2, xpc_object_t xdict)
{
  uint64_t v3;
  uint64_t uint64;

  if (a2 == 2)
  {
    this = *(_QWORD *)(this + 256);
    if (this)
      return (*(uint64_t (**)(void))(this + 16))();
  }
  else if (a2 == 1)
  {
    v3 = *(_QWORD *)(this + 248);
    if (v3)
    {
      uint64 = xpc_dictionary_get_uint64(xdict, kRDKeyUtteranceID);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, uint64);
    }
  }
  return this;
}

CFDataRef RXRecognitionSystem::CopyProperty(RXRecognitionSystem *this, int a2)
{
  CFDataRef result;
  RXXPC *v4;
  const __CFString *v5;
  CFDataRef *v6;
  int valuePtr;

  if (a2 <= 1936946545)
  {
    if (a2 <= 1936487277)
    {
      if (a2 == 1935766884)
        return (CFDataRef)CFRetain(*(CFTypeRef *)(*((_QWORD *)this + 11) + 24));
      if (a2 == 1935766886)
        return CFDataCreate(0, RXRecognitionSystem::CopyProperty::sClientFormat, 40);
      return (CFDataRef)RXObject::CopyProperty(this, a2);
    }
    if (a2 == 1936487278)
    {
      if (*((_BYTE *)this + 81))
        v6 = (CFDataRef *)MEMORY[0x24BDBD270];
      else
        v6 = (CFDataRef *)MEMORY[0x24BDBD268];
      result = *v6;
      return (CFDataRef)CFRetain(result);
    }
    if (a2 == 1936941429)
    {
      result = (CFDataRef)*((_QWORD *)this + 8);
      if (!result)
        return result;
      return (CFDataRef)CFRetain(result);
    }
    return (CFDataRef)RXObject::CopyProperty(this, a2);
  }
  if (a2 > 1937006910)
  {
    if (a2 != 1937006911)
    {
      if (a2 == 1937077355)
      {
        RXXPC::WaitForServer(*((RXXPC **)this + 11));
        v4 = (RXXPC *)*((_QWORD *)this + 11);
        v5 = (const __CFString *)MEMORY[0x2207B863C](*((_QWORD *)this + 6));
        return (CFDataRef)RXXPC::CopyInstalledAssetSupportedTasksForLanguage(v4, v5);
      }
      return (CFDataRef)RXObject::CopyProperty(this, a2);
    }
    goto LABEL_17;
  }
  if (a2 != 1936946546)
  {
    if (a2 != 1937006881)
      return (CFDataRef)RXObject::CopyProperty(this, a2);
    RXXPC::WaitForServer(*((RXXPC **)this + 11));
LABEL_17:
    valuePtr = *(unsigned __int8 *)(*((_QWORD *)this + 11) + 1);
    return CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  }
  result = (CFDataRef)*((_QWORD *)this + 7);
  if (result)
    return (CFDataRef)CFRetain(result);
  return result;
}

void RXRecognitionSystem::SetProperty(CFTypeRef *this, int a2, __CFString *cf)
{
  const void **v5;
  __CFArray *Mutable;
  CFIndex v7;
  CFStringRef v8;
  NSObject *v9;
  CFIndex v10;
  NSObject *v11;
  __CFString *ValueAtIndex;
  uint8_t buf[4];
  __CFString *v14;
  uint64_t v15;
  CFRange v16;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a2 > 1936487277)
  {
    if (a2 > 1936946545)
    {
      if (a2 == 1937006911 || a2 == 1937006881)
      {
LABEL_20:
        RXObject::PropertyReadOnly((RXObject *)this, a2);
        goto LABEL_39;
      }
      if (a2 != 1936946546)
        goto LABEL_38;
      RXCFProp<void const*>::operator=(this + 7, cf);
    }
    else
    {
      if (a2 == 1936487278)
      {
        *((_BYTE *)this + 81) = CFBooleanGetValue((CFBooleanRef)cf) != 0;
        goto LABEL_39;
      }
      if (a2 == 1936749167)
      {
        *((_BYTE *)this + 80) = CFBooleanGetValue((CFBooleanRef)cf) != 0;
        goto LABEL_39;
      }
      if (a2 != 1936941429)
        goto LABEL_38;
      RXCFProp<void const*>::operator=(this + 8, cf);
    }
LABEL_32:
    *((_BYTE *)this + 82) = 1;
    goto LABEL_39;
  }
  if (a2 > 1935832435)
  {
    switch(a2)
    {
      case 1935832436:
        RXBlockProp<void({block_pointer})(unsigned long long)>::operator=(this + 31, cf);
        goto LABEL_39;
      case 1936027494:
        v5 = this + 32;
        goto LABEL_37;
      case 1936028274:
        v5 = this + 33;
LABEL_37:
        RXBlockProp<void({block_pointer})(unsigned long long)>::operator=(v5, cf);
        goto LABEL_39;
    }
LABEL_38:
    RXObject::SetProperty(this, a2, cf);
    goto LABEL_39;
  }
  if (a2 == 1919120244)
  {
    RXCFProp<void const*>::operator=(this + 9, cf);
    if (RXVeryVerbose())
    {
      Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
      if (CFStringGetLength(cf) >= 1)
      {
        v7 = 0;
        do
        {
          v16.location = v7;
          v16.length = 1;
          v8 = CFStringCreateWithSubstring(0, cf, v16);
          CFArrayAppendValue(Mutable, v8);
          ++v7;
        }
        while (v7 < CFStringGetLength(cf));
      }
      v9 = RXOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = cf;
        _os_log_impl(&dword_21EBE7000, v9, OS_LOG_TYPE_INFO, "input phrase=%@", buf, 0xCu);
      }
      if (CFArrayGetCount(Mutable) >= 1)
      {
        v10 = 0;
        do
        {
          v11 = RXOSLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            ValueAtIndex = (__CFString *)CFArrayGetValueAtIndex(Mutable, v10);
            *(_DWORD *)buf = 138412290;
            v14 = ValueAtIndex;
            _os_log_impl(&dword_21EBE7000, v11, OS_LOG_TYPE_INFO, "input phrase tokens=%@", buf, 0xCu);
          }
          ++v10;
        }
        while (CFArrayGetCount(Mutable) > v10);
      }
    }
    goto LABEL_32;
  }
  if (a2 != 1935766884)
  {
    if (a2 != 1935766886)
      goto LABEL_38;
    goto LABEL_20;
  }
LABEL_39:
  this[3] = (CFTypeRef)-1;
}

void *RXBlockProp<void({block_pointer})(unsigned long long)>::operator=(const void **a1, void *aBlock)
{
  void *v3;

  if (aBlock)
    v3 = _Block_copy(aBlock);
  else
    v3 = 0;
  if (*a1)
    _Block_release(*a1);
  *a1 = v3;
  return v3;
}

BOOL RXRecognitionSystem::Initialize(RXRecognitionSystem *this, const __CFLocale *a2, int64_t a3)
{
  RXXPC *Instance;
  void *v7;
  _QWORD aBlock[5];

  RXCFProp<void const*>::operator=((CFTypeRef *)this + 6, a2);
  *((_QWORD *)this + 1) = a3;
  *((_BYTE *)this + 81) = (a3 & 0x1000000) == 0;
  *((_BYTE *)this + 82) = 1;
  *((_QWORD *)this + 3) = -1;
  Instance = RXXPC::CreateInstance(a2, a3);
  *((_QWORD *)this + 11) = Instance;
  if (Instance)
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 0x40000000;
    aBlock[2] = ___ZN19RXRecognitionSystem10InitializeEPK10__CFLocalem_block_invoke;
    aBlock[3] = &__block_descriptor_tmp_1;
    aBlock[4] = this;
    v7 = _Block_copy(aBlock);
    *((_QWORD *)this + 12) = v7;
    RXXPC::AddHandler(*((_QWORD *)this + 11), v7);
  }
  return Instance != 0;
}

uint64_t ___ZN19RXRecognitionSystem10InitializeEPK10__CFLocalem_block_invoke(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned int v7;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  BOOL v14;

  if (sSystems)
  {
    v3 = *(_QWORD *)(sSystems + 8) - *(_QWORD *)sSystems;
    if (v3)
    {
      v4 = 0;
      v5 = *(_QWORD *)(result + 32);
      v6 = v3 >> 3;
      v7 = 1;
      while (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)sSystems + 8 * v4) + 88) != a3)
      {
        v4 = v7;
        if (v6 <= v7++)
          return result;
      }
      if (a2 == 1)
      {
        *(_QWORD *)(v5 + 24) = -1;
        *(_BYTE *)(v5 + 82) = 1;
        v9 = *(_QWORD **)(v5 + 104);
        if (v9)
        {
          v10 = *MEMORY[0x24BDBD268];
          do
          {
            (*(void (**)(_QWORD *, uint64_t, uint64_t))(*v9 + 80))(v9, 1919710062, v10);
            v9 = (_QWORD *)v9[11];
          }
          while (v9);
        }
        v11 = *(_QWORD **)(v5 + 112);
        if (v11 != (_QWORD *)(v5 + 120))
        {
          do
          {
            (*(void (**)(_QWORD))(*(_QWORD *)v11[4] + 88))(v11[4]);
            v12 = (_QWORD *)v11[1];
            if (v12)
            {
              do
              {
                v13 = v12;
                v12 = (_QWORD *)*v12;
              }
              while (v12);
            }
            else
            {
              do
              {
                v13 = (_QWORD *)v11[2];
                v14 = *v13 == (_QWORD)v11;
                v11 = v13;
              }
              while (!v14);
            }
            v11 = v13;
          }
          while (v13 != (_QWORD *)(v5 + 120));
        }
        result = *(_QWORD *)(v5 + 264);
        if (result)
          return (*(uint64_t (**)(void))(result + 16))();
      }
    }
  }
  return result;
}

void RXRecognitionSystem::RXRecognitionSystem(RXRecognitionSystem *this)
{
  uint64_t v2;
  void **v3;
  _QWORD *v4;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  RXObject::RXObject(this);
  *(_QWORD *)v2 = &off_24E355B18;
  *(_DWORD *)(v2 + 44) = 0;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_QWORD *)(v2 + 120) = 0;
  *(_QWORD *)(v2 + 112) = v2 + 120;
  *(_QWORD *)(v2 + 104) = 0;
  *(_QWORD *)(v2 + 128) = 0;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_QWORD *)(v2 + 144) = 0;
  *(_QWORD *)(v2 + 136) = v2 + 144;
  *(_QWORD *)(v2 + 232) = 0;
  *(_QWORD *)(v2 + 152) = 0;
  *(_QWORD *)(v2 + 224) = v2 + 232;
  *(_QWORD *)(v2 + 240) = 0;
  *(_QWORD *)(v2 + 248) = 0;
  *(_QWORD *)(v2 + 256) = 0;
  *(_QWORD *)(v2 + 264) = 0;
  v3 = (void **)sSystems;
  if (sSystems)
  {
    v4 = *(_QWORD **)sSystems;
  }
  else
  {
    v3 = (void **)operator new();
    v4 = 0;
    *v3 = 0;
    v3[1] = 0;
    v3[2] = 0;
    sSystems = (uint64_t)v3;
  }
  v5 = v3[1];
  v6 = v5 - v4;
  if (v5 == v4)
  {
LABEL_8:
    v9 = (unint64_t)v3[2];
    if ((unint64_t)v5 >= v9)
    {
      if ((v6 + 1) >> 61)
        std::vector<RXRecognitionSystem *>::__throw_length_error[abi:ne180100]();
      v11 = v9 - (_QWORD)v4;
      v12 = v11 >> 2;
      if (v11 >> 2 <= v6 + 1)
        v12 = v6 + 1;
      if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
        v13 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v13 = v12;
      if (v13)
        v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RXRecognitionSystem *>>((uint64_t)(v3 + 2), v13);
      else
        v14 = 0;
      v15 = &v14[8 * v6];
      v16 = &v14[8 * v13];
      *(_QWORD *)v15 = this;
      v10 = v15 + 8;
      v18 = (char *)*v3;
      v17 = (char *)v3[1];
      if (v17 != *v3)
      {
        do
        {
          v19 = *((_QWORD *)v17 - 1);
          v17 -= 8;
          *((_QWORD *)v15 - 1) = v19;
          v15 -= 8;
        }
        while (v17 != v18);
        v17 = (char *)*v3;
      }
      *v3 = v15;
      v3[1] = v10;
      v3[2] = v16;
      if (v17)
        operator delete(v17);
    }
    else
    {
      *v5 = this;
      v10 = v5 + 1;
    }
    v3[1] = v10;
    v8 = ((*(_QWORD *)(sSystems + 8) - *(_QWORD *)sSystems) >> 3) - 1;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    while (v4[v7])
    {
      v7 = ++v8;
      if (v6 <= v8)
        goto LABEL_8;
    }
    v4[v7] = this;
  }
  *((_DWORD *)this + 10) = v8;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 160), 0);
  *((_QWORD *)this + 2) |= 1 << *((_DWORD *)this + 10);
}

void sub_21EBEBFC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  uint64_t v10;
  const void **v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void **v15;
  uint64_t v16;
  RXObject *v17;

  RXBlockProp<void({block_pointer})(void)>::~RXBlockProp((const void **)(v10 + 264));
  RXBlockProp<void({block_pointer})(void)>::~RXBlockProp((const void **)(v10 + 256));
  RXBlockProp<void({block_pointer})(unsigned long long)>::~RXBlockProp(v15);
  std::__tree<RXObject *>::destroy(v14, *(_QWORD **)(v10 + 232));
  std::__tree<RXObject *>::destroy(v13, *(_QWORD **)(v10 + 144));
  std::__tree<RXObject *>::destroy(v12, *(_QWORD **)(v10 + 120));
  RXCFProp<__CFString const*>::~RXCFProp((const void **)(v10 + 72));
  RXCFProp<__CFData const*>::~RXCFProp((const void **)(v10 + 64));
  RXCFProp<__CFURL const*>::~RXCFProp((const void **)(v10 + 56));
  RXCFProp<__CFLocale const*>::~RXCFProp(v11);
  RXObject::~RXObject((RXObject *)v10, v16, v17);
  _Unwind_Resume(a1);
}

void RXRecognitionSystem::~RXRecognitionSystem(const void **this)
{
  NSObject *v2;
  uint64_t v3;
  RXObject *v4;
  _QWORD block[5];

  *this = &off_24E355B18;
  v2 = RXXPC::Queue((RXXPC *)this);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN19RXRecognitionSystemD2Ev_block_invoke;
  block[3] = &__block_descriptor_tmp_6;
  block[4] = this;
  dispatch_sync(v2, block);
  RXBlockProp<void({block_pointer})(void)>::~RXBlockProp(this + 33);
  RXBlockProp<void({block_pointer})(void)>::~RXBlockProp(this + 32);
  RXBlockProp<void({block_pointer})(unsigned long long)>::~RXBlockProp(this + 31);
  std::__tree<RXObject *>::destroy((uint64_t)(this + 28), this[29]);
  std::__tree<RXObject *>::destroy((uint64_t)(this + 17), this[18]);
  std::__tree<RXObject *>::destroy((uint64_t)(this + 14), this[15]);
  RXCFProp<__CFString const*>::~RXCFProp(this + 9);
  RXCFProp<__CFData const*>::~RXCFProp(this + 8);
  RXCFProp<__CFURL const*>::~RXCFProp(this + 7);
  RXCFProp<__CFLocale const*>::~RXCFProp(this + 6);
  RXObject::~RXObject((RXObject *)this, v3, v4);
}

{
  RXRecognitionSystem::~RXRecognitionSystem(this);
  JUMPOUT(0x2207B89E4);
}

uint64_t RXRecognitionSystem::AddRecognizer(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(a2 + 88) = *(_QWORD *)(result + 104);
  *(_QWORD *)(result + 104) = a2;
  *(_QWORD *)(a2 + 16) |= 1 << *(_DWORD *)(result + 40);
  return result;
}

uint64_t RXRecognitionSystem::DelRecognizer(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 104);
  if (v2)
  {
    while (v2 != a2)
    {
      v2 = *(_QWORD *)(v2 + 88);
      *(_QWORD *)(result + 104) = v2;
      if (!v2)
        return result;
    }
    *(_QWORD *)(result + 104) = *(_QWORD *)(a2 + 88);
  }
  return result;
}

void RXRecognitionSystem::AddTraining(RXXPC **this, const void *a2, const __CFString *a3)
{
  xpc_object_t Message;
  void *v6;
  const __CFString *v7;
  void *v8;

  RXXPC::WaitForServer(this[11]);
  Message = RXXPC::CreateMessage((RXXPC *)0x68);
  v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v6)
  {
    v8 = v6;
    xpc_dictionary_set_value(Message, kRDKeyText, v6);
    xpc_release(v8);
  }
  RXXPC::SerializeCFString((RXXPC *)Message, kRDKeyCategory, a3, v7);
  RXXPC::SendMessage(this[11], Message, 0);
  xpc_release(Message);
}

void RXRecognitionSystem::SetSecureFieldFocused(RXXPC **this, BOOL a2)
{
  xpc_object_t Message;

  RXXPC::WaitForServer(this[11]);
  Message = RXXPC::CreateMessage((RXXPC *)0x70);
  xpc_dictionary_set_BOOL(Message, kRDKeyFocusOnSecureField, a2);
  RXXPC::SendMessage(this[11], Message, 0);
  xpc_release(Message);
}

void RXRecognitionSystem::AddLeadingContext(RXXPC **this, const __CFString *a2)
{
  RXXPC *Message;
  const __CFString *v5;

  RXXPC::WaitForServer(this[11]);
  Message = (RXXPC *)RXXPC::CreateMessage((RXXPC *)0x6A);
  RXXPC::SerializeCFString(Message, kRDKeyText, a2, v5);
  RXXPC::SendMessage(this[11], Message, 0);
  xpc_release(Message);
}

void RXRecognitionSystem::AddOtherContext(RXXPC **this, const __CFArray *a2)
{
  xpc_object_t Message;
  void *v4;
  void *v5;

  RXXPC::WaitForServer(this[11]);
  Message = RXXPC::CreateMessage((RXXPC *)0x6B);
  v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (v4)
  {
    v5 = v4;
    xpc_dictionary_set_value(Message, kRDKeyText, v4);
    xpc_release(v5);
  }
  RXXPC::SendMessage(this[11], Message, 0);
  xpc_release(Message);
}

void RXRecognitionSystem::ResetRecognition(RXXPC **this)
{
  xpc_object_t Message;

  RXXPC::WaitForServer(this[11]);
  Message = RXXPC::CreateMessage((RXXPC *)0x6C);
  RXXPC::SendMessage(this[11], Message, 0);
  xpc_release(Message);
}

void RXRecognitionSystem::SetResetMode(uint64_t a1, unsigned int a2)
{
  xpc_object_t Message;
  void *v5;

  RXXPC::WaitForServer(*(RXXPC **)(a1 + 88));
  Message = RXXPC::CreateMessage((RXXPC *)0x6D);
  v5 = Message;
  if (a2 <= 3)
    xpc_dictionary_set_uint64(Message, kRDKeyRecognitionResetMode, a2);
  RXXPC::SendMessage(*(RXXPC **)(a1 + 88), v5, 0);
  xpc_release(v5);
}

void RXRecognitionSystem::SaveUserProfileToFile(RXXPC **this, const __CFString *a2)
{
  RXXPC *Message;
  const __CFString *v5;

  if (a2)
  {
    RXXPC::WaitForServer(this[11]);
    Message = (RXXPC *)RXXPC::CreateMessage((RXXPC *)0x6E);
    RXXPC::SerializeCFString(Message, kRDKeyUserProfileSavePath, a2, v5);
    RXXPC::SendMessage(this[11], Message, 0);
    xpc_release(Message);
  }
}

__CFArray *RXRecognitionSystem::PhoneticNeighborsForText(RXXPC **this, const __CFString *a2)
{
  RXXPC *Message;
  const __CFString *v5;
  xpc_object_t v6;
  __CFArray *Mutable;
  xpc_object_t value;
  size_t v9;
  const char *string;
  CFStringRef v11;

  if (!a2)
    return 0;
  RXXPC::WaitForServer(this[11]);
  Message = (RXXPC *)RXXPC::CreateMessage((RXXPC *)0x6F);
  RXXPC::SerializeCFString(Message, kRDKeyText, a2, v5);
  v6 = RXXPC::SendMessageWithReplySync((pthread_mutex_t *)this[11], Message);
  xpc_release(Message);
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  value = xpc_dictionary_get_value(v6, kRDKeyText);
  if (xpc_array_get_count(value))
  {
    v9 = 0;
    do
    {
      string = xpc_array_get_string(value, v9);
      v11 = CFStringCreateWithCString(0, string, 0x8000100u);
      CFArrayAppendValue(Mutable, v11);
      CFRelease(v11);
      ++v9;
    }
    while (xpc_array_get_count(value) > v9);
  }
  return Mutable;
}

uint64_t *RXRecognitionSystem::LiveObject(uint64_t **this, RXObject *a2)
{
  RXObject *v3;

  v3 = a2;
  return std::__tree<RXObject *>::__emplace_unique_key_args<RXObject *,RXObject * const&>(this + 14, (unint64_t *)&v3, (uint64_t *)&v3);
}

uint64_t *RXRecognitionSystem::ReachableObject(uint64_t **this, RXObject *a2)
{
  RXObject *v3;

  v3 = a2;
  return std::__tree<RXObject *>::__emplace_unique_key_args<RXObject *,RXObject * const&>(this + 28, (unint64_t *)&v3, (uint64_t *)&v3);
}

void RXRecognitionSystem::BrokerEvent(RXRecognitionSystem *this, void *a2)
{
  int64_t int64;
  int64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  RXRecognizer *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint8_t v21[16];

  if (this == (RXRecognitionSystem *)MEMORY[0x24BDACF30])
  {
    v13 = sSystems;
    if (sSystems)
    {
      v14 = *(_QWORD *)sSystems;
      if (*(_QWORD *)(sSystems + 8) != *(_QWORD *)sSystems)
      {
        v15 = 0;
        v16 = 0;
        do
        {
          v17 = *(_QWORD *)(v14 + 8 * v15);
          if (v17)
          {
            v18 = *(_QWORD *)(v17 + 104);
            if (v18)
            {
              do
              {
                RXRecognizer::BrokerReset(v18);
                v18 = *(_QWORD *)(v18 + 88);
              }
              while (v18);
              v13 = sSystems;
              v14 = *(_QWORD *)sSystems;
            }
          }
          v15 = ++v16;
        }
        while (v16 < (unint64_t)((*(_QWORD *)(v13 + 8) - v14) >> 3));
      }
    }
    else
    {
      v19 = RXOSLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_21EBE7000, v19, OS_LOG_TYPE_ERROR, "BrokerEvent: brokerd connection interrupted and recognition system have not started so not doing anything", v21, 2u);
      }
    }
  }
  else if (MEMORY[0x2207B8D68](this, a2) == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(this, kRDKeyMessage);
    if (int64 == 601)
    {
      xpc_retain(this);
      RXXPC::DownloadCallback(this, v20);
      xpc_release(this);
    }
    else if (int64 == 600)
    {
      v4 = xpc_dictionary_get_int64(this, kRDKeyRecognizerID);
      v5 = xpc_dictionary_get_BOOL(this, kRDKeyBlocked);
      v6 = sSystems;
      v7 = *(_QWORD *)sSystems;
      if (*(_QWORD *)(sSystems + 8) != *(_QWORD *)sSystems)
      {
        v8 = v5;
        v9 = 0;
        v10 = 0;
        while (1)
        {
          v11 = *(_QWORD *)(v7 + 8 * v9);
          if (v11)
          {
            v12 = *(RXRecognizer **)(v11 + 104);
            if (v12)
              break;
          }
LABEL_12:
          v9 = ++v10;
          if (v10 >= (unint64_t)((*(_QWORD *)(v6 + 8) - v7) >> 3))
            return;
        }
        while (!RXRecognizer::Choke(v12, v4, v8))
        {
          v12 = (RXRecognizer *)*((_QWORD *)v12 + 11);
          if (!v12)
          {
            v6 = sSystems;
            v7 = *(_QWORD *)sSystems;
            goto LABEL_12;
          }
        }
      }
    }
  }
}

uint64_t RXRecognitionSystem::BrokerReset(uint64_t this)
{
  uint64_t i;

  for (i = *(_QWORD *)(this + 104); i; i = *(_QWORD *)(i + 88))
    this = RXRecognizer::BrokerReset(i);
  return this;
}

BOOL RXRecognitionSystem::ChokeRecognizer(RXRecognitionSystem *this, uint64_t a2, int a3)
{
  RXRecognizer *v3;
  _BOOL8 result;

  v3 = (RXRecognizer *)*((_QWORD *)this + 13);
  if (!v3)
    return 0;
  do
  {
    result = RXRecognizer::Choke(v3, a2, a3);
    if (result)
      break;
    v3 = (RXRecognizer *)*((_QWORD *)v3 + 11);
  }
  while (v3);
  return result;
}

uint64_t RXRecognitionSystemGetTypeID()
{
  uint64_t result;

  result = gRXCFTypeID_RXRecognitionSystem;
  if (!gRXCFTypeID_RXRecognitionSystem)
  {
    result = _CFRuntimeRegisterClass();
    gRXCFTypeID_RXRecognitionSystem = result;
  }
  return result;
}

const void *RXRecognitionSystemCreate(uint64_t a1, const __CFLocale *a2, int64_t a3)
{
  uint64_t Instance;
  const void *v6;

  if (!gRXCFTypeID_RXRecognitionSystem)
    gRXCFTypeID_RXRecognitionSystem = _CFRuntimeRegisterClass();
  Instance = _CFRuntimeCreateInstance();
  v6 = (const void *)Instance;
  if (Instance && !RXRecognitionSystem::Initialize((RXRecognitionSystem *)(Instance + 16), a2, a3))
  {
    CFRelease(v6);
    return 0;
  }
  return v6;
}

void RXRecognitionSystemAddTraining(uint64_t a1, const void *a2, const __CFString *a3)
{
  RXXPC **v3;

  if (a1)
    v3 = (RXXPC **)(a1 + 16);
  else
    v3 = 0;
  RXRecognitionSystem::AddTraining(v3, a2, a3);
}

void RXRecognitionSystemSetSecureFieldFocused(uint64_t a1, BOOL a2)
{
  RXXPC **v2;

  if (a1)
    v2 = (RXXPC **)(a1 + 16);
  else
    v2 = 0;
  RXRecognitionSystem::SetSecureFieldFocused(v2, a2);
}

void RXRecognitionSystemAddLeadingContext(uint64_t a1, const __CFString *a2)
{
  RXXPC **v2;

  if (a1)
    v2 = (RXXPC **)(a1 + 16);
  else
    v2 = 0;
  RXRecognitionSystem::AddLeadingContext(v2, a2);
}

void RXRecognitionSystemAddOtherContext(uint64_t a1, const __CFArray *a2)
{
  RXXPC **v2;

  if (a1)
    v2 = (RXXPC **)(a1 + 16);
  else
    v2 = 0;
  RXRecognitionSystem::AddOtherContext(v2, a2);
}

void RXRecognitionSystemReset(uint64_t a1)
{
  if (a1)
    RXRecognitionSystem::ResetRecognition((RXXPC **)(a1 + 16));
  else
    RXRecognitionSystem::ResetRecognition(0);
}

void RXRecognitionSystemSetResetMode(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  if (a1)
    v2 = a1 + 16;
  else
    v2 = 0;
  RXRecognitionSystem::SetResetMode(v2, a2);
}

void RXRecognitionSystemSaveUserProfileToFile(uint64_t a1, const __CFString *a2)
{
  RXXPC **v2;

  if (a1)
    v2 = (RXXPC **)(a1 + 16);
  else
    v2 = 0;
  RXRecognitionSystem::SaveUserProfileToFile(v2, a2);
}

__CFArray *RXRecognitionSystemCopyPhoneticNeighborsForText(uint64_t a1, const __CFString *a2)
{
  RXXPC **v2;

  if (a1)
    v2 = (RXXPC **)(a1 + 16);
  else
    v2 = 0;
  return RXRecognitionSystem::PhoneticNeighborsForText(v2, a2);
}

void std::vector<RXRecognitionSystem *>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24E3554F8, MEMORY[0x24BEDAAF0]);
}

void sub_21EBECA54(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RXRecognitionSystem *>>(uint64_t a1, unint64_t a2)
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
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

const void **RXCFProp<__CFLocale const*>::~RXCFProp(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **RXCFProp<__CFURL const*>::~RXCFProp(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **RXCFProp<__CFData const*>::~RXCFProp(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **RXCFProp<__CFString const*>::~RXCFProp(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void std::__tree<RXObject *>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<RXObject *>::destroy(a1, *a2);
    std::__tree<RXObject *>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

const void **RXBlockProp<void({block_pointer})(unsigned long long)>::~RXBlockProp(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    _Block_release(v2);
  return a1;
}

const void **RXBlockProp<void({block_pointer})(void)>::~RXBlockProp(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    _Block_release(v2);
  return a1;
}

uint64_t *std::__tree<RXObject *>::__emplace_unique_key_args<RXObject *,RXObject * const&>(uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  unint64_t v7;
  uint64_t **v8;
  unint64_t v9;
  uint64_t *v10;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = v5[4];
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    std::__tree<RXObject *>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t *std::__tree<RXObject *>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

_QWORD *std::__set_difference[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long> &,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long> &,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long> &,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long> &,std::back_insert_iterator<std::vector<RXObject *>> &>(uint64_t a1, _QWORD **a2, uint64_t a3, _QWORD *a4, void ***a5)
{
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v11;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  BOOL v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  char v27;

  v8 = *(_QWORD **)a1;
  v9 = *a2;
  if (*(_QWORD **)a1 == *a2)
  {
LABEL_31:
    v9 = v8;
    return std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long>,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long>,std::back_insert_iterator<std::vector<RXObject *>>>((uint64_t)&v27, v8, v9, *a5);
  }
  v11 = *(_QWORD **)a3;
  if (*(_QWORD *)a3 != *a4)
  {
    while (1)
    {
      v13 = v8[4];
      v14 = v11[4];
      if (v13 >= v14)
      {
        if (v14 >= v13)
        {
          v21 = (_QWORD *)v8[1];
          if (v21)
          {
            do
            {
              v22 = v21;
              v21 = (_QWORD *)*v21;
            }
            while (v21);
          }
          else
          {
            do
            {
              v22 = (_QWORD *)v8[2];
              v18 = *v22 == (_QWORD)v8;
              v8 = v22;
            }
            while (!v18);
          }
          *(_QWORD *)a1 = v22;
          v23 = *(_QWORD **)a3;
          v24 = *(_QWORD **)(*(_QWORD *)a3 + 8);
          if (v24)
          {
            do
            {
              v25 = v24;
              v24 = (_QWORD *)*v24;
            }
            while (v24);
          }
          else
          {
            do
            {
              v25 = (_QWORD *)v23[2];
              v18 = *v25 == (_QWORD)v23;
              v23 = v25;
            }
            while (!v18);
          }
          *(_QWORD *)a3 = v25;
        }
        else
        {
          v19 = (_QWORD *)v11[1];
          if (v19)
          {
            do
            {
              v20 = v19;
              v19 = (_QWORD *)*v19;
            }
            while (v19);
          }
          else
          {
            do
            {
              v20 = (_QWORD *)v11[2];
              v18 = *v20 == (_QWORD)v11;
              v11 = v20;
            }
            while (!v18);
          }
          *(_QWORD *)a3 = v20;
        }
      }
      else
      {
        std::back_insert_iterator<std::vector<RXObject *>>::operator=[abi:ne180100](a5, v8 + 4);
        v15 = *(_QWORD **)a1;
        v16 = *(_QWORD **)(*(_QWORD *)a1 + 8);
        if (v16)
        {
          do
          {
            v17 = v16;
            v16 = (_QWORD *)*v16;
          }
          while (v16);
        }
        else
        {
          do
          {
            v17 = (_QWORD *)v15[2];
            v18 = *v17 == (_QWORD)v15;
            v15 = v17;
          }
          while (!v18);
        }
        *(_QWORD *)a1 = v17;
      }
      v8 = *(_QWORD **)a1;
      v9 = *a2;
      if (*(_QWORD **)a1 == *a2)
        break;
      v11 = *(_QWORD **)a3;
      if (*(_QWORD *)a3 == *a4)
        return std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long>,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long>,std::back_insert_iterator<std::vector<RXObject *>>>((uint64_t)&v27, v8, v9, *a5);
    }
    goto LABEL_31;
  }
  return std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long>,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long>,std::back_insert_iterator<std::vector<RXObject *>>>((uint64_t)&v27, v8, v9, *a5);
}

void ***std::back_insert_iterator<std::vector<RXObject *>>::operator=[abi:ne180100](void ***a1, _QWORD *a2)
{
  void **v4;
  _QWORD *v5;
  void **v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;

  v4 = *a1;
  v5 = (*a1)[1];
  v6 = *a1;
  v9 = (unint64_t)v6[2];
  v7 = (uint64_t)(v6 + 2);
  v8 = v9;
  if ((unint64_t)v5 >= v9)
  {
    v11 = ((char *)v5 - (_BYTE *)*v4) >> 3;
    if ((unint64_t)(v11 + 1) >> 61)
      std::vector<RXRecognitionSystem *>::__throw_length_error[abi:ne180100]();
    v12 = v8 - (_QWORD)*v4;
    v13 = v12 >> 2;
    if (v12 >> 2 <= (unint64_t)(v11 + 1))
      v13 = v11 + 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v13;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RXRecognitionSystem *>>(v7, v14);
    else
      v15 = 0;
    v16 = &v15[8 * v11];
    v17 = &v15[8 * v14];
    *(_QWORD *)v16 = *a2;
    v10 = v16 + 8;
    v19 = (char *)*v4;
    v18 = (char *)v4[1];
    if (v18 != *v4)
    {
      do
      {
        v20 = *((_QWORD *)v18 - 1);
        v18 -= 8;
        *((_QWORD *)v16 - 1) = v20;
        v16 -= 8;
      }
      while (v18 != v19);
      v18 = (char *)*v4;
    }
    *v4 = v16;
    v4[1] = v10;
    v4[2] = v17;
    if (v18)
      operator delete(v18);
  }
  else
  {
    *v5 = *a2;
    v10 = v5 + 1;
  }
  v4[1] = v10;
  return a1;
}

_QWORD *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long>,std::__tree_const_iterator<RXObject *,std::__tree_node<RXObject *,void *> *,long>,std::back_insert_iterator<std::vector<RXObject *>>>(uint64_t a1, _QWORD *a2, _QWORD *a3, void **a4)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  BOOL v8;
  void **v10;

  v4 = a2;
  v10 = a4;
  if (a2 == a3)
    return a2;
  v5 = a3;
  do
  {
    std::back_insert_iterator<std::vector<RXObject *>>::operator=[abi:ne180100](&v10, v4 + 4);
    v6 = (_QWORD *)v4[1];
    if (v6)
    {
      do
      {
        v7 = v6;
        v6 = (_QWORD *)*v6;
      }
      while (v6);
    }
    else
    {
      do
      {
        v7 = (_QWORD *)v4[2];
        v8 = *v7 == (_QWORD)v4;
        v4 = v7;
      }
      while (!v8);
    }
    v4 = v7;
  }
  while (v7 != v5);
  return v5;
}

uint64_t *std::__tree<RXObject *>::swap(uint64_t *result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = *result;
  *result = *(_QWORD *)a2;
  *(_QWORD *)a2 = v2;
  v5 = result[1];
  v4 = result[2];
  v3 = result + 1;
  *(_OWORD *)(result + 1) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 16) = v4;
  if (result[2])
    result = (uint64_t *)(*v3 + 16);
  *result = (uint64_t)v3;
  v6 = (_QWORD *)(*(_QWORD *)(a2 + 8) + 16);
  if (!v4)
    v6 = (_QWORD *)a2;
  *v6 = a2 + 8;
  return result;
}

double RXCFInit_RXRecognizer(_QWORD *a1)
{
  double result;

  RXObject::RXObject((RXObject *)(a1 + 2));
  a1[2] = &off_24E355C28;
  *((_DWORD *)a1 + 14) = 0;
  *((_WORD *)a1 + 30) = 0;
  a1[8] = 1;
  *((_DWORD *)a1 + 18) = 0;
  result = 0.0;
  *((_OWORD *)a1 + 5) = 0u;
  *((_OWORD *)a1 + 6) = 0u;
  *((_OWORD *)a1 + 7) = 0u;
  a1[16] = -1;
  a1[17] = 0;
  return result;
}

void RXRecognizer::RXRecognizer(RXRecognizer *this)
{
  uint64_t v1;

  RXObject::RXObject(this);
  *(_QWORD *)v1 = &off_24E355C28;
  *(_DWORD *)(v1 + 40) = 0;
  *(_WORD *)(v1 + 44) = 0;
  *(_QWORD *)(v1 + 48) = 1;
  *(_DWORD *)(v1 + 56) = 0;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  *(_OWORD *)(v1 + 96) = 0u;
  *(_QWORD *)(v1 + 112) = -1;
  *(_QWORD *)(v1 + 120) = 0;
}

uint64_t RXCFRegister_RXRecognizer(void)
{
  return _CFRuntimeRegisterClass();
}

void *RXRecognizer::WillDestroy(RXRecognizer *this)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[5];
  _QWORD block[5];

  v2 = RXXPC::Queue(this);
  v3 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN12RXRecognizer11WillDestroyEv_block_invoke;
  block[3] = &__block_descriptor_tmp_2;
  block[4] = this;
  dispatch_sync(v2, block);
  v4 = *((_QWORD *)this + 2);
  v6[0] = v3;
  v6[1] = 0x40000000;
  v6[2] = ___ZN12RXRecognizer11WillDestroyEv_block_invoke_2;
  v6[3] = &__block_descriptor_tmp_3;
  v6[4] = v4;
  return _Block_copy(v6);
}

void ___ZN12RXRecognizer11WillDestroyEv_block_invoke(uint64_t a1)
{
  RXRecognitionSystem::StartChanges(*(RXRecognitionSystem **)(*(_QWORD *)(a1 + 32) + 16));
}

void ___ZN12RXRecognizer11WillDestroyEv_block_invoke_2(RXXPC *a1)
{
  NSObject *v2;
  _QWORD block[5];

  v2 = RXXPC::Queue(a1);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN12RXRecognizer11WillDestroyEv_block_invoke_3;
  block[3] = &__block_descriptor_tmp_2;
  block[4] = *((_QWORD *)a1 + 4);
  dispatch_sync(v2, block);
}

void ___ZN12RXRecognizer11WillDestroyEv_block_invoke_3(uint64_t a1)
{
  RXRecognitionSystem::CommitChanges(*(RXRecognitionSystem **)(a1 + 32));
}

CFNumberRef RXRecognizer::CopyProperty(RXRecognizer *this, int a2)
{
  uint64_t v2;
  CFNumberRef result;
  char *v4;
  CFNumberType v5;
  uint64_t v6;

  if (a2 > 1919705452)
  {
    if (a2 <= 1919770999)
    {
      if (a2 == 1919705453)
      {
        v6 = *((_QWORD *)this + 10);
        if (v6)
          return (CFNumberRef)CFRetain((CFTypeRef)(v6 - 16));
        else
          return 0;
      }
      if (a2 == 1919710062)
      {
        v2 = MEMORY[0x24BDBD270];
        if (!*((_BYTE *)this + 40))
          v2 = MEMORY[0x24BDBD268];
        return *(CFNumberRef *)v2;
      }
      return (CFNumberRef)RXObject::CopyProperty(this, a2);
    }
    if (a2 == 1919771000)
      return CFNumberCreate(0, kCFNumberCFIndexType, (char *)this + 48);
    if (a2 != 1919969636)
      return (CFNumberRef)RXObject::CopyProperty(this, a2);
    v4 = (char *)this + 56;
    v5 = kCFNumberSInt32Type;
    return CFNumberCreate(0, v5, v4);
  }
  if (a2 == 1918985076)
  {
    v4 = (char *)this + 96;
LABEL_22:
    v5 = kCFNumberSInt64Type;
    return CFNumberCreate(0, v5, v4);
  }
  if (a2 == 1919312491)
  {
    v4 = (char *)this + 104;
    goto LABEL_22;
  }
  if (a2 != 1919512166)
    return (CFNumberRef)RXObject::CopyProperty(this, a2);
  result = (CFNumberRef)*((_QWORD *)this + 15);
  if (result)
    return (CFNumberRef)CFRetain(result);
  return result;
}

void RXRecognizer::SetProperty(RXRecognizer *this, int a2, const __CFBoolean *cf)
{
  char *v5;
  char *v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t valuePtr;

  if (a2 > 1919710061)
  {
    if (a2 <= 1919841644)
    {
      if (a2 == 1919710062)
      {
        v11 = CFBooleanGetValue(cf) != 0;
        if (*((unsigned __int8 *)this + 40) != v11)
        {
          (*(void (**)(RXRecognizer *))(*(_QWORD *)this + 88))(this);
          *((_BYTE *)this + 40) = v11;
        }
      }
      else
      {
        if (a2 != 1919771000)
          goto LABEL_41;
        valuePtr = 0;
        if (!CFNumberGetValue(cf, kCFNumberCFIndexType, &valuePtr) || (v9 = valuePtr, valuePtr <= 0))
        {
          v9 = 1;
          valuePtr = 1;
        }
        if (v9 != *((_QWORD *)this + 6))
        {
          (*(void (**)(RXRecognizer *))(*(_QWORD *)this + 88))(this);
          *((_QWORD *)this + 6) = valuePtr;
        }
      }
    }
    else
    {
      switch(a2)
      {
        case 1919841645:
          v10 = CFBooleanGetValue(cf) != 0;
          if (*((unsigned __int8 *)this + 43) != v10)
          {
            (*(void (**)(RXRecognizer *))(*(_QWORD *)this + 88))(this);
            *((_BYTE *)this + 43) = v10;
          }
          break;
        case 1919969636:
          LODWORD(valuePtr) = 0;
          CFNumberGetValue(cf, kCFNumberSInt32Type, &valuePtr);
          if ((_DWORD)valuePtr != *((_DWORD *)this + 14))
            *((_DWORD *)this + 14) = valuePtr;
          break;
        case 1920168044:
          v7 = CFBooleanGetValue(cf) != 0;
          if (*((unsigned __int8 *)this + 42) != v7)
          {
            (*(void (**)(RXRecognizer *))(*(_QWORD *)this + 88))(this);
            *((_BYTE *)this + 42) = v7;
          }
          break;
        default:
          goto LABEL_41;
      }
    }
  }
  else
  {
    if (a2 > 1919312490)
    {
      switch(a2)
      {
        case 1919312491:
          return;
        case 1919512166:
          RXCFProp<void const*>::operator=((CFTypeRef *)this + 15, cf);
          return;
        case 1919705453:
          v5 = (char *)cf + 16;
          if (!cf)
            v5 = 0;
          v6 = (char *)this + 80;
          if (*((char **)this + 10) != v5)
          {
            if (*((_BYTE *)this + 40) && !*((_BYTE *)this + 44))
              (*(void (**)(RXRecognizer *))(*(_QWORD *)this + 88))(this);
            RXProp<RXLanguageObject *>::operator=((_QWORD *)this + 10, cf);
            if (*(_QWORD *)v6)
              *(_QWORD *)(*(_QWORD *)v6 + 8) |= 1uLL;
          }
          return;
      }
LABEL_41:
      RXObject::SetProperty((CFTypeRef *)this, a2, cf);
      return;
    }
    if (a2 == 1918985076)
    {
      valuePtr = 0;
      CFNumberGetValue(cf, kCFNumberSInt64Type, &valuePtr);
      if (valuePtr != *((_QWORD *)this + 12))
        *((_QWORD *)this + 12) = valuePtr;
    }
    else
    {
      if (a2 != 1919118445)
        goto LABEL_41;
      v8 = CFBooleanGetValue(cf) != 0;
      if (*((unsigned __int8 *)this + 41) != v8)
      {
        (*(void (**)(RXRecognizer *))(*(_QWORD *)this + 88))(this);
        *((_BYTE *)this + 41) = v8;
      }
    }
  }
}

uint64_t RXProp<RXLanguageObject *>::operator=(_QWORD *a1, CFTypeRef cf)
{
  uint64_t result;

  if (cf)
    CFRetain(cf);
  if (*a1)
    CFRelease((CFTypeRef)(*a1 - 16));
  if (cf)
    result = (uint64_t)cf + 16;
  else
    result = 0;
  *a1 = result;
  return result;
}

uint64_t RXRecognizer::ClaimLanguageModel(uint64_t this)
{
  uint64_t v1;

  v1 = *(_QWORD *)(this + 80);
  if (v1)
    *(_QWORD *)(v1 + 8) |= 1uLL;
  return this;
}

uint64_t RXRecognizer::Initialize(_QWORD *a1, uint64_t a2, const void *a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;

  RXProp<RXRecognitionSystem *>::operator=(a1 + 8, a2);
  a1[9] = _Block_copy(a3);
  a1[1] = a4;
  CFRetain((CFTypeRef)(a1[8] - 16));
  result = RXRecognitionSystem::AddRecognizer(a1[8], (uint64_t)a1);
  if ((*(_BYTE *)(a1[8] + 8) & 1) == 0)
  {
    v8 = a1[13] | 3;
    a1[12] = 1;
    a1[13] = v8;
  }
  return result;
}

uint64_t RXProp<RXRecognitionSystem *>::operator=(_QWORD *a1, uint64_t a2)
{
  if (a2)
    CFRetain((CFTypeRef)(a2 - 16));
  if (*a1)
    CFRelease((CFTypeRef)(*a1 - 16));
  *a1 = a2;
  return a2;
}

void RXRecognizer::~RXRecognizer(const void **this)
{
  NSObject *v2;
  uint64_t v3;
  RXObject *v4;
  _QWORD block[5];

  *this = &off_24E355C28;
  v2 = RXXPC::Queue((RXXPC *)this);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___ZN12RXRecognizerD2Ev_block_invoke;
  block[3] = &__block_descriptor_tmp_4;
  block[4] = this;
  dispatch_sync(v2, block);
  _Block_release(this[9]);
  CFRelease((char *)this[8] - 16);
  RXCFProp<__CFDictionary const*>::~RXCFProp(this + 15);
  RXProp<RXLanguageObject *>::~RXProp(this + 10);
  RXProp<RXRecognitionSystem *>::~RXProp(this + 8);
  RXObject::~RXObject((RXObject *)this, v3, v4);
}

{
  RXRecognizer::~RXRecognizer(this);
  JUMPOUT(0x2207B89E4);
}

uint64_t ___ZN12RXRecognizerD2Ev_block_invoke(uint64_t a1)
{
  return RXRecognitionSystem::DelRecognizer(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(_QWORD *)(a1 + 32));
}

void RXRecognizer::Serialize(RXRecognizer *this, void *a2, uint64_t **a3)
{
  _BOOL4 v6;
  uint64_t v7;
  xpc_object_t XPCDesc;
  _QWORD v9[7];
  BOOL v10;

  if (*((_BYTE *)this + 40))
    v6 = *((_BYTE *)this + 44) == 0;
  else
    v6 = 0;
  RXRecognitionSystem::ReachableObject(*((uint64_t ***)this + 8), this);
  v7 = *((_QWORD *)this + 10);
  if (v7)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = ___ZN12RXRecognizer9SerializeEPvP19RXRecognitionSystem_block_invoke;
    v9[3] = &__block_descriptor_tmp_6_0;
    v10 = v6;
    v9[4] = this;
    v9[5] = a2;
    v9[6] = a3;
    RXLanguageObject::ApplyBlock(v7, (uint64_t)v9, 0x10uLL);
  }
  if (*((_QWORD *)this + 3) && (v6 || *((_BYTE *)this + 45)))
  {
    *((_QWORD *)this + 3) = 0;
    *((_BYTE *)this + 45) = v6;
    XPCDesc = RXObject::CreateXPCDesc(this, 1, a3);
    xpc_dictionary_set_BOOL(XPCDesc, kRDKeyIsListening, v6);
    xpc_dictionary_set_uint64(XPCDesc, kRDKeyMaxResults, *((_QWORD *)this + 6));
    xpc_dictionary_set_BOOL(XPCDesc, kRDKeyAllowCloseMatch, *((_BYTE *)this + 41));
    xpc_dictionary_set_BOOL(XPCDesc, kRDKeySpellingMode, *((_BYTE *)this + 42));
    xpc_dictionary_set_BOOL(XPCDesc, kRDKeyNumberMode, *((_BYTE *)this + 43));
    if (v6)
      xpc_dictionary_set_uint64(XPCDesc, kRDKeyLanguageModel, *((_QWORD *)this + 10));
    xpc_dictionary_set_BOOL(XPCDesc, kRDKeyUseStreaming, *((_DWORD *)this + 2) & 1);
    xpc_array_append_value(a2, XPCDesc);
    xpc_release(XPCDesc);
  }
}

uint64_t ___ZN12RXRecognizer9SerializeEPvP19RXRecognitionSystem_block_invoke(uint64_t a1, uint64_t a2)
{
  RXObject *v3;
  uint64_t v4;
  RXObject *v5;

  if (a2)
    v3 = (RXObject *)(a2 + 16);
  else
    v3 = 0;
  if (*(_BYTE *)(a1 + 56))
  {
    (*(void (**)(RXObject *, _QWORD, _QWORD))(*(_QWORD *)v3 + 96))(v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 32);
    RXRecognitionSystem::ReachableObject(*(uint64_t ***)(v4 + 64), v3);
    *((_QWORD *)v3 + 2) |= 1 << *(_DWORD *)(*(_QWORD *)(a1 + 48) + 40);
    v5 = (RXObject *)*((_QWORD *)v3 + 19);
    if (v5)
      RXRecognitionSystem::ReachableObject(*(uint64_t ***)(v4 + 64), v5);
  }
  return 0;
}

void RXRecognizer::Recognized(RXRecognizer *this, void *a2)
{
  RXRecognizer *uint64;
  xpc_object_t value;
  uint64_t v5;
  BOOL v6;
  RXResultDesc *v7;
  uint64_t v8;
  RXResultDesc *v9;
  NSObject *global_queue;
  _QWORD block[6];
  unint64_t v12;

  uint64 = (RXRecognizer *)xpc_dictionary_get_uint64(this, kRDKeyObjectID);
  if (RecognizerStillExists((uint64_t)uint64))
  {
    value = xpc_dictionary_get_value(this, kRDKeyLanguageModel);
    v12 = 0;
    GetDaemonLMID(value, &v12);
    v5 = 0;
    if (value)
      v6 = v12 == *((_QWORD *)uint64 + 10);
    else
      v6 = 0;
    if (v6)
    {
      v7 = (RXResultDesc *)operator new();
      v8 = xpc_dictionary_get_uint64(value, kRDKeyResultID);
      RXResultDesc::RXResultDesc(v7, uint64, v8);
      v5 = RXLanguageObject::CreateFromSerialized((RXLanguageObject *)value, v7, v9);
      RXResultDesc::DeleteRef(v7);
    }
    CFRetain((char *)uint64 - 16);
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZN12RXRecognizer10RecognizedEPv_block_invoke;
    block[3] = &__block_descriptor_tmp_7;
    block[4] = uint64;
    block[5] = v5;
    dispatch_async(global_queue, block);
  }
}

void sub_21EBEDD74(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2207B89E4](v1, 0x1020C403ED2C137);
  _Unwind_Resume(a1);
}

void *GetDaemonLMID(void *result, unint64_t *a2)
{
  void *v3;
  _QWORD applier[5];

  if (result)
  {
    v3 = result;
    if (xpc_dictionary_get_int64(result, kRDKeyObjectType) == 14
      || xpc_dictionary_get_int64(v3, kRDKeyObjectType) == 15)
    {
      result = xpc_dictionary_get_value(v3, kRDKeyChildren);
      if (result)
      {
        applier[0] = MEMORY[0x24BDAC760];
        applier[1] = 0x40000000;
        applier[2] = ___ZL13GetDaemonLMIDPvRy_block_invoke;
        applier[3] = &__block_descriptor_tmp_10;
        applier[4] = a2;
        return (void *)xpc_array_apply(result, applier);
      }
    }
    else
    {
      result = (void *)xpc_dictionary_get_uint64(v3, kRDKeyObjectID);
      *a2 = (unint64_t)result;
    }
  }
  return result;
}

BOOL RXRecognizer::LMStillExists(RXRecognizer *this, uint64_t a2)
{
  return *((_QWORD *)this + 10) == a2;
}

RXResultDesc *RXResultDesc::DeleteRef(RXResultDesc *this)
{
  if ((*(_QWORD *)this)-- <= 1)
  {
    RXResultDesc::~RXResultDesc(this);
    JUMPOUT(0x2207B89E4);
  }
  return this;
}

void ___ZN12RXRecognizer10RecognizedEPv_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  if (v2)
    v4 = v2 - 16;
  else
    v4 = 0;
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    CFRelease((CFTypeRef)(v5 - 16));
  CFRelease((CFTypeRef)(*(_QWORD *)(a1 + 32) - 16));
}

uint64_t RXRecognizer::Recognized(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 72);
  if (a2)
    v3 = a2 - 16;
  else
    v3 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

CFDataRef RXRecognizer::CopyAudio(RXRecognizer *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  pthread_mutex_t *v7;
  xpc_object_t Message;
  xpc_object_t v9;
  const __CFData *value;
  CFDataRef v11;
  const UInt8 *bytes_ptr;
  size_t length;

  v7 = *(pthread_mutex_t **)(*((_QWORD *)this + 8) + 88);
  Message = RXXPC::CreateMessage((RXXPC *)0x66);
  xpc_dictionary_set_uint64(Message, kRDKeyResultID, a2);
  xpc_dictionary_set_uint64(Message, kRDKeyStartTime, a3);
  xpc_dictionary_set_uint64(Message, kRDKeyEndTime, a4);
  v9 = RXXPC::SendMessageWithReplySync(v7, Message);
  xpc_release(Message);
  value = (const __CFData *)xpc_dictionary_get_value(v9, kRDKeyAudioData);
  v11 = value;
  if (value)
  {
    bytes_ptr = (const UInt8 *)xpc_data_get_bytes_ptr(value);
    length = xpc_data_get_length(v11);
    v11 = CFDataCreate(0, bytes_ptr, length);
  }
  xpc_release(v9);
  return v11;
}

void RXRecognizer::ReleaseResult(RXRecognizer *this, uint64_t a2)
{
  RXXPC *v3;
  xpc_object_t Message;

  v3 = *(RXXPC **)(*((_QWORD *)this + 8) + 88);
  Message = RXXPC::CreateMessage((RXXPC *)0x67);
  xpc_dictionary_set_uint64(Message, kRDKeyResultID, a2);
  RXXPC::SendMessage(v3, Message, 0);
  xpc_release(Message);
}

uint64_t RXRecognizer::BrokerReset(uint64_t this)
{
  *(_QWORD *)(this + 112) = -1;
  *(_BYTE *)(this + 44) = 0;
  return this;
}

BOOL RXRecognizer::Choke(RXRecognizer *this, uint64_t a2, int a3)
{
  uint64_t v4;
  NSObject *v6;
  _QWORD block[5];

  v4 = *((_QWORD *)this + 14);
  if (v4 == a2 && *((unsigned __int8 *)this + 44) != a3)
  {
    *((_BYTE *)this + 44) = a3;
    v6 = RXXPC::Queue(this);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZN12RXRecognizer5ChokeExb_block_invoke;
    block[3] = &__block_descriptor_tmp_8;
    block[4] = this;
    dispatch_async(v6, block);
  }
  return v4 == a2;
}

void ___ZN12RXRecognizer5ChokeExb_block_invoke(uint64_t a1)
{
  RXRecognitionSystem **v1;

  v1 = *(RXRecognitionSystem ***)(a1 + 32);
  RXRecognitionSystem::StartChanges(v1[2]);
  (*((void (**)(RXRecognitionSystem **))*v1 + 11))(v1);
  RXRecognitionSystem::CommitChanges(v1[2]);
}

void sub_21EBEE158(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  RXTransaction<RXRecognizer>::~RXTransaction((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t RXRecognizerGetTypeID()
{
  uint64_t result;

  result = gRXCFTypeID_RXRecognizer;
  if (!gRXCFTypeID_RXRecognizer)
  {
    result = _CFRuntimeRegisterClass();
    gRXCFTypeID_RXRecognizer = result;
  }
  return result;
}

uint64_t RXRecognizerCreate(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  uint64_t Instance;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  if (!gRXCFTypeID_RXRecognizer)
    gRXCFTypeID_RXRecognizer = _CFRuntimeRegisterClass();
  Instance = _CFRuntimeCreateInstance();
  v8 = Instance;
  if (Instance)
    v9 = (_QWORD *)(Instance + 16);
  else
    v9 = 0;
  if (a2)
    v10 = a2 + 16;
  else
    v10 = 0;
  RXRecognizer::Initialize(v9, v10, a3, a4);
  return v8;
}

void RXRecognizerSetFeedbackText()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = RXOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21EBE7000, v0, OS_LOG_TYPE_ERROR, "RXRecognizerSetFeedbackText is only valid for macOS", v1, 2u);
  }
}

uint64_t ___ZL13GetDaemonLMIDPvRy_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2)
    GetDaemonLMID(a3, *(unint64_t **)(a1 + 32));
  return 1;
}

_QWORD *RXProp<RXRecognitionSystem *>::~RXProp(_QWORD *a1)
{
  if (*a1)
    CFRelease((CFTypeRef)(*a1 - 16));
  return a1;
}

_QWORD *RXProp<RXLanguageObject *>::~RXProp(_QWORD *a1)
{
  if (*a1)
    CFRelease((CFTypeRef)(*a1 - 16));
  return a1;
}

const void **RXCFProp<__CFDictionary const*>::~RXCFProp(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

uint64_t RXTransaction<RXRecognizer>::~RXTransaction(uint64_t a1)
{
  RXRecognitionSystem::CommitChanges(*(RXRecognitionSystem **)(*(_QWORD *)a1 + 16));
  return a1;
}

void RXCFInit_RXVocabulary(_QWORD *a1)
{
  RXObject::RXObject((RXObject *)(a1 + 2));
  a1[2] = &off_24E355D58;
  a1[7] = 0;
  a1[8] = 0;
}

void RXVocabulary::RXVocabulary(RXVocabulary *this)
{
  _QWORD *v1;

  RXObject::RXObject(this);
  *v1 = &off_24E355D58;
  v1[5] = 0;
  v1[6] = 0;
}

uint64_t RXCFRegister_RXVocabulary(void)
{
  return _CFRuntimeRegisterClass();
}

CFTypeRef RXVocabulary::Initialize(CFTypeRef *this, const __CFLocale *a2, const __CFURL *a3)
{
  CFTypeRef result;

  RXCFProp<void const*>::operator=(this + 5, a2);
  result = RXCFProp<void const*>::operator=(this + 6, a3);
  this[3] = (CFTypeRef)-1;
  return result;
}

void RXVocabulary::~RXVocabulary(const void **this)
{
  const void **v2;
  uint64_t v3;
  RXObject *v4;

  *this = &off_24E355D58;
  v2 = this + 5;
  RXCFProp<__CFURL const*>::~RXCFProp(this + 6);
  RXCFProp<__CFLocale const*>::~RXCFProp(v2);
  RXObject::~RXObject((RXObject *)this, v3, v4);
}

{
  RXVocabulary::~RXVocabulary(this);
  JUMPOUT(0x2207B89E4);
}

void RXVocabulary::Serialize(RXVocabulary *this, void *a2, uint64_t **a3)
{
  RXXPC *XPCDesc;
  const __CFURL *v6;
  RXXPC *v7;
  void *v8;

  XPCDesc = (RXXPC *)RXObject::CreateXPCDesc(this, 5, a3);
  v7 = XPCDesc;
  v8 = (void *)*((_QWORD *)this + 6);
  if (v8)
    RXXPC::SerializeURL(XPCDesc, v8, v6);
  xpc_array_append_value(a2, v7);
  xpc_release(v7);
}

uint64_t RXVocabularyGetTypeID()
{
  uint64_t result;

  result = gRXCFTypeID_RXVocabulary;
  if (!gRXCFTypeID_RXVocabulary)
  {
    result = _CFRuntimeRegisterClass();
    gRXCFTypeID_RXVocabulary = result;
  }
  return result;
}

uint64_t RXVocabularyCreateWithLocale(uint64_t a1, const void *a2)
{
  uint64_t Instance;
  uint64_t v4;
  uint64_t v5;
  const void *v6;

  if (!gRXCFTypeID_RXVocabulary)
    gRXCFTypeID_RXVocabulary = _CFRuntimeRegisterClass();
  Instance = _CFRuntimeCreateInstance();
  v4 = Instance;
  if (Instance)
    v5 = Instance + 16;
  else
    v5 = 0;
  RXCFProp<void const*>::operator=((CFTypeRef *)(v5 + 40), a2);
  v6 = *(const void **)(v5 + 48);
  if (v6)
    CFRelease(v6);
  *(_QWORD *)(v5 + 48) = 0;
  *(_QWORD *)(v5 + 24) = -1;
  return v4;
}

uint64_t RXVocabularyCreateWithURL(uint64_t a1, const void *a2)
{
  uint64_t Instance;
  uint64_t v4;
  uint64_t v5;
  const void *v6;

  if (!gRXCFTypeID_RXVocabulary)
    gRXCFTypeID_RXVocabulary = _CFRuntimeRegisterClass();
  Instance = _CFRuntimeCreateInstance();
  v4 = Instance;
  if (Instance)
    v5 = Instance + 16;
  else
    v5 = 0;
  v6 = *(const void **)(v5 + 40);
  if (v6)
    CFRelease(v6);
  *(_QWORD *)(v5 + 40) = 0;
  RXCFProp<void const*>::operator=((CFTypeRef *)(v5 + 48), a2);
  *(_QWORD *)(v5 + 24) = -1;
  return v4;
}

double RXCFInit_RXLanguageObject(_QWORD *a1)
{
  double result;

  RXObject::RXObject((RXObject *)(a1 + 2));
  a1[2] = &off_24E355E08;
  *((_DWORD *)a1 + 14) = 0;
  result = 0.0;
  *((_OWORD *)a1 + 4) = 0u;
  *((_OWORD *)a1 + 5) = 0u;
  *((_OWORD *)a1 + 6) = 0u;
  *((_OWORD *)a1 + 7) = 0u;
  *((_OWORD *)a1 + 8) = 0u;
  *((_OWORD *)a1 + 9) = 0u;
  *((_OWORD *)a1 + 10) = 0u;
  *((_OWORD *)a1 + 11) = 0u;
  *((_OWORD *)a1 + 12) = 0u;
  *((_OWORD *)a1 + 13) = 0u;
  a1[28] = 0;
  return result;
}

void RXLanguageObject::RXLanguageObject(RXLanguageObject *this)
{
  uint64_t v1;

  RXObject::RXObject(this);
  *(_QWORD *)v1 = &off_24E355E08;
  *(_DWORD *)(v1 + 40) = 0;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  *(_OWORD *)(v1 + 96) = 0u;
  *(_OWORD *)(v1 + 112) = 0u;
  *(_OWORD *)(v1 + 128) = 0u;
  *(_OWORD *)(v1 + 144) = 0u;
  *(_OWORD *)(v1 + 160) = 0u;
  *(_OWORD *)(v1 + 176) = 0u;
  *(_OWORD *)(v1 + 192) = 0u;
  *(_QWORD *)(v1 + 208) = 0;
}

uint64_t RXCFRegister_RXLanguageObject(void)
{
  qword_25547CCF0 = (uint64_t)RXCFCopyFormattingDesc;
  unk_25547CCF8 = RXCFCopyDebugDesc;
  return _CFRuntimeRegisterClass();
}

CFArrayRef RXLanguageObject::CopyProperty(RXLanguageObject *this, int a2)
{
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  void **v11;
  void **v12;
  void **v13;
  void *v14;
  CFArrayRef v15;
  const void *v16;
  const void **v18;
  const void **v19;
  BOOL v20;
  _QWORD *v21;
  uint64_t v22;
  const void **v23;
  unint64_t v24;
  void **values;
  void **v26;
  uint64_t *v27;

  if ((*((_DWORD *)this + 10) & 0xFFFFFFFE) == 4)
  {
    if (a2 == 1970563428)
      return CFNumberCreate(0, kCFNumberSInt64Type, (char *)this + 208);
    if (a2 != 1818786160)
    {
      if (a2 == 1818391412)
      {
        v3 = 0;
        v4 = 0;
        *(double *)&values = 0.0;
        v26 = 0;
        v27 = 0;
        v5 = *((_QWORD *)this + 20);
        do
        {
          v6 = *(_QWORD *)(v5 + 8 * v4) - 16;
          if (v3 >= v27)
          {
            v7 = ((char *)v3 - (char *)values) >> 3;
            if ((unint64_t)(v7 + 1) >> 61)
              std::vector<RXRecognitionSystem *>::__throw_length_error[abi:ne180100]();
            v8 = ((char *)v27 - (char *)values) >> 2;
            if (v8 <= v7 + 1)
              v8 = v7 + 1;
            if ((unint64_t)((char *)v27 - (char *)values) >= 0x7FFFFFFFFFFFFFF8)
              v9 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v9 = v8;
            if (v9)
              v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RXRecognitionSystem *>>((uint64_t)&v27, v9);
            else
              v10 = 0;
            v11 = (void **)&v10[8 * v7];
            *v11 = (void *)v6;
            v3 = (uint64_t *)(v11 + 1);
            v13 = values;
            v12 = v26;
            if (v26 != values)
            {
              do
              {
                v14 = *--v12;
                *--v11 = v14;
              }
              while (v12 != v13);
              v12 = values;
            }
            values = v11;
            v26 = (void **)v3;
            v27 = (uint64_t *)&v10[8 * v9];
            if (v12)
              operator delete(v12);
          }
          else
          {
            *v3++ = v6;
          }
          v26 = (void **)v3;
          ++v4;
          v5 = *((_QWORD *)this + 20);
        }
        while (v4 < (*((_QWORD *)this + 21) - v5) >> 3);
        v15 = CFArrayCreate(0, (const void **)values, ((char *)v3 - (char *)values) >> 3, MEMORY[0x24BDBD690]);
        if (*(double *)&values != 0.0)
        {
          v26 = values;
          operator delete(values);
        }
        return v15;
      }
      v21 = (_QWORD *)*((_QWORD *)this + 20);
      if (v21 != *((_QWORD **)this + 21))
        return (CFArrayRef)(*(uint64_t (**)(_QWORD))(*(_QWORD *)*v21 + 64))(*v21);
      return 0;
    }
    v18 = (const void **)MEMORY[0x24BDBD270];
    v19 = (const void **)MEMORY[0x24BDBD268];
    v20 = (*((_QWORD *)this + 1) & 2) == 0;
    goto LABEL_50;
  }
  if (a2 > 1819242611)
  {
    if (a2 <= 1819505772)
    {
      if (a2 == 1819242612)
      {
        v18 = (const void **)MEMORY[0x24BDBD270];
        v19 = (const void **)MEMORY[0x24BDBD268];
        v20 = (*((_QWORD *)this + 1) & 4) == 0;
      }
      else
      {
        if (a2 != 1819439220)
          return (CFArrayRef)RXObject::CopyProperty(this, a2);
        v18 = (const void **)MEMORY[0x24BDBD270];
        v19 = (const void **)MEMORY[0x24BDBD268];
        v20 = (*((_QWORD *)this + 1) & 8) == 0;
      }
LABEL_50:
      if (v20)
        v23 = v19;
      else
        v23 = v18;
      v16 = *v23;
      return (CFArrayRef)CFRetain(v16);
    }
    switch(a2)
    {
      case 1819505773:
        v24 = *((_QWORD *)this + 24);
        if (!v24)
          return 0;
LABEL_57:
        *(double *)&values = (double)v24 / 1000.0;
        return CFNumberCreate(0, kCFNumberDoubleType, &values);
      case 1819571826:
        return RXLanguageObject::CopyTextVariantsWithLocale(this, 0);
      case 1819572340:
        return (CFArrayRef)RXLanguageObject::CopyTextWithLocale(this, 0);
    }
  }
  else
  {
    if (a2 > 1818457192)
    {
      if (a2 != 1818457193)
      {
        if (a2 != 1818588269)
        {
          if (a2 == 1819173229)
          {
            v16 = (const void *)*((_QWORD *)this + 6);
            if (v16)
              return (CFArrayRef)CFRetain(v16);
            return 0;
          }
          return (CFArrayRef)RXObject::CopyProperty(this, a2);
        }
        v24 = *((_QWORD *)this + 25);
        if (!v24)
          return 0;
        goto LABEL_57;
      }
      return (CFArrayRef)*((_QWORD *)this + 11);
    }
    if (a2 == 1818326372)
    {
      v22 = *((_QWORD *)this + 23);
      if (v22)
        return RXRecognizer::CopyAudio(*(RXRecognizer **)(v22 + 16), *(_QWORD *)(v22 + 8), *((_QWORD *)this + 24), *((_QWORD *)this + 25));
      return 0;
    }
    if (a2 == 1818453097)
      return (CFArrayRef)*((_QWORD *)this + 12);
  }
  return (CFArrayRef)RXObject::CopyProperty(this, a2);
}

void sub_21EBEEB0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

CFMutableStringRef RXLanguageObject::CopyText(RXLanguageObject *this)
{
  return RXLanguageObject::CopyTextWithLocale(this, 0);
}

CFArrayRef RXLanguageObject::CopyTextVariants(RXLanguageObject *this)
{
  return RXLanguageObject::CopyTextVariantsWithLocale(this, 0);
}

CFArrayRef RXLanguageObject::CopyPropertyWithLocale(RXLanguageObject *this, int a2, const __CFLocale *a3)
{
  if (a2 == 1819571826)
    return RXLanguageObject::CopyTextVariantsWithLocale(this, a3);
  if (a2 == 1819572340)
    return (CFArrayRef)RXLanguageObject::CopyTextWithLocale(this, a3);
  return (CFArrayRef)(*(uint64_t (**)(RXLanguageObject *))(*(_QWORD *)this + 64))(this);
}

CFMutableStringRef RXLanguageObject::CopyTextWithLocale(RXLanguageObject *this, const __CFLocale *a2)
{
  int v3;
  const void *v5;
  CFMutableStringRef Mutable;
  const __CFString *v8;
  _BOOL4 v9;
  const __CFString *v10;
  const __CFString *v11;
  int v12;
  _QWORD v13[8];

  v3 = *((_DWORD *)this + 10);
  if ((v3 - 2) < 2 || v3 == 1 && *((_QWORD *)this + 7))
  {
    v5 = (const void *)*((_QWORD *)this + 7);
    if (v5)
      return (CFMutableStringRef)CFRetain(v5);
    return 0;
  }
  else
  {
    Mutable = CFStringCreateMutable(0, 0);
    if (a2)
      v8 = (const __CFString *)MEMORY[0x2207B863C](a2);
    else
      v8 = CFSTR("en_US");
    v9 = RXIsLocaleWithNoSpaceInPostITN(v8);
    v10 = CFSTR(" ");
    if (v9)
      v10 = &stru_24E356820;
    v11 = CFSTR("|");
    if (!v9)
      v11 = CFSTR(" | ");
    v13[0] = MEMORY[0x24BDAC760];
    v13[2] = ___ZN16RXLanguageObject18CopyTextWithLocaleEPK10__CFLocale_block_invoke;
    v13[3] = &__block_descriptor_tmp_3;
    v12 = *((_DWORD *)this + 10);
    v13[1] = 0x40000000;
    v13[4] = (char *)this - 16;
    v13[5] = a2;
    if (v12 != 1)
      v10 = v11;
    v13[6] = Mutable;
    v13[7] = v10;
    RXLanguageObject::ApplyBlock((uint64_t)this, (uint64_t)v13, 2uLL);
  }
  return Mutable;
}

CFArrayRef RXLanguageObject::CopyTextVariantsWithLocale(RXLanguageObject *this, const __CFLocale *a2)
{
  const __CFArray *v3;
  RXLanguageObject *v5;
  unsigned int v6;
  RXLanguageObject **v7;
  const void **v9;
  uint64_t v10;
  const CFArrayCallBacks *v11;
  const __CFArray *Mutable;
  uint64_t v13;
  unint64_t v14;
  const CFArrayCallBacks *v15;
  const __CFArray *v16;
  CFIndex Count;
  CFIndex v18;
  CFIndex v19;
  const __CFArray *ValueAtIndex;
  const __CFArray *v21;
  CFIndex v22;
  BOOL v23;
  const __CFString *v24;
  const __CFString *v25;
  __CFString *v26;
  const __CFString *v27;
  CFArrayRef v28;
  uint64_t v29;
  unint64_t v30;
  const __CFArray *v31;
  CFIndex v32;
  CFIndex v33;
  unint64_t v34;
  unint64_t i;
  const __CFArray *v36;
  __CFArray *v37;
  CFMutableArrayRef MutableCopy;
  void *values;
  CFRange v40;
  CFRange v41;

  v3 = (const __CFArray *)*((_QWORD *)this + 10);
  if (v3)
    return CFArrayCreateCopy(0, v3);
  v5 = this;
  while (1)
  {
    v6 = *((_DWORD *)v5 + 10);
    if (v6 != 1)
      break;
    if (*((_QWORD *)v5 + 7))
    {
LABEL_15:
      v10 = *((_QWORD *)v5 + 7);
      v9 = (const void **)((char *)v5 + 56);
      if (v10)
      {
        v11 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
        values = CFArrayCreate(0, v9, 1, MEMORY[0x24BDBD690]);
        Mutable = CFArrayCreate(0, (const void **)&values, 1, v11);
        CFRelease(values);
        return Mutable;
      }
      return CFArrayCreate(0, 0, 0, MEMORY[0x24BDBD690]);
    }
    v7 = (RXLanguageObject **)*((_QWORD *)v5 + 20);
    if (*((_QWORD *)v5 + 21) - (_QWORD)v7 != 8)
    {
      Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
      v13 = *((_QWORD *)v5 + 20);
      if (*((_QWORD *)v5 + 21) == v13)
        return Mutable;
      v14 = 0;
      v15 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
      while (2)
      {
        v16 = (const __CFArray *)RXLanguageObject::CopyTextVariantsWithLocale(*(RXLanguageObject **)(v13 + 8 * v14), 0);
        Count = CFArrayGetCount(v16);
        v18 = CFArrayGetCount(Mutable);
        v19 = v18;
        if (v18)
          ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(Mutable, v18 - 1);
        else
          ValueAtIndex = 0;
        if (Count == 1)
        {
          v21 = (const __CFArray *)CFArrayGetValueAtIndex(v16, 0);
          if (!v19)
            goto LABEL_37;
        }
        else
        {
          v21 = 0;
          if (!v19)
            goto LABEL_37;
        }
        v22 = CFArrayGetCount(ValueAtIndex);
        v23 = Count == 1 && v22 == 1;
        if (v23 && CFArrayGetCount(v21) == 1)
        {
          values = 0;
          v24 = (const __CFString *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
          values = CFStringCreateMutableCopy(0, 0, v24);
          if (a2)
            v25 = (const __CFString *)MEMORY[0x2207B863C](a2);
          else
            v25 = CFSTR("en_US");
          if (!RXIsLocaleWithNoSpaceInPostITN(v25))
            CFStringAppend((CFMutableStringRef)values, CFSTR(" "));
          v26 = (__CFString *)values;
          v27 = (const __CFString *)CFArrayGetValueAtIndex(v21, 0);
          CFStringAppend(v26, v27);
          v28 = CFArrayCreate(0, (const void **)&values, 1, v15);
          CFArraySetValueAtIndex(Mutable, v19 - 1, v28);
          CFRelease(v28);
          CFRelease(values);
        }
        else
        {
LABEL_37:
          v40.location = 0;
          v40.length = Count;
          CFArrayAppendArray(Mutable, v16, v40);
        }
        CFRelease(v16);
        ++v14;
        v13 = *((_QWORD *)v5 + 20);
        if (v14 >= (*((_QWORD *)v5 + 21) - v13) >> 3)
          return Mutable;
        continue;
      }
    }
LABEL_13:
    a2 = 0;
    v5 = *v7;
    v3 = (const __CFArray *)*((_QWORD *)*v7 + 10);
    if (v3)
      return CFArrayCreateCopy(0, v3);
  }
  if (v6 - 2 < 2)
    goto LABEL_15;
  v7 = (RXLanguageObject **)*((_QWORD *)v5 + 20);
  if (v6 <= 1 && *((_QWORD *)v5 + 21) - (_QWORD)v7 == 8)
    goto LABEL_13;
  if (v6)
    return 0;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v29 = *((_QWORD *)v5 + 20);
  if (*((_QWORD *)v5 + 21) != v29)
  {
    v30 = 0;
    do
    {
      v31 = (const __CFArray *)RXLanguageObject::CopyTextVariantsWithLocale(*(RXLanguageObject **)(v29 + 8 * v30), 0);
      v32 = CFArrayGetCount(v31);
      v33 = CFArrayGetCount(Mutable);
      if (v33 >= v32)
        v34 = v32;
      else
        v34 = v33;
      if (v32)
      {
        for (i = 0; i != v32; ++i)
        {
          v36 = (const __CFArray *)CFArrayGetValueAtIndex(v31, i);
          if (i >= v34)
          {
            MutableCopy = CFArrayCreateMutableCopy(0, 0, v36);
            CFArrayAppendValue(Mutable, MutableCopy);
            CFRelease(MutableCopy);
          }
          else
          {
            v37 = (__CFArray *)CFArrayGetValueAtIndex(Mutable, i);
            v41.length = CFArrayGetCount(v36);
            v41.location = 0;
            CFArrayAppendArray(v37, v31, v41);
          }
        }
      }
      if (v31)
        CFRelease(v31);
      ++v30;
      v29 = *((_QWORD *)v5 + 20);
    }
    while (v30 < (*((_QWORD *)v5 + 21) - v29) >> 3);
  }
  return Mutable;
}

void RXLanguageObject::SetProperty(RXLanguageObject *this, uint64_t a2, CFTypeRef cf)
{
  int v5;
  _QWORD *v6;
  int v7;
  uint64_t v8;
  CFTypeRef *v9;
  const void *v10;
  uint64_t v11;
  CFTypeRef *v12;
  int v13;

  v5 = *((_DWORD *)this + 10);
  if ((v5 & 0xFFFFFFFE) == 4)
  {
    v6 = (_QWORD *)*((_QWORD *)this + 20);
    if (v6 != *((_QWORD **)this + 21))
      (*(void (**)(_QWORD, uint64_t, CFTypeRef))(*(_QWORD *)*v6 + 80))(*v6, a2, cf);
    return;
  }
  if ((int)a2 <= 1819173228)
  {
    switch((_DWORD)a2)
    {
      case 0x6C617564:
        RXObject::PropertyReadOnly(this, 1818326372);
        return;
      case 0x6C636469:
        v9 = (CFTypeRef *)((char *)this + 96);
        break;
      case 0x6C637469:
        v9 = (CFTypeRef *)((char *)this + 88);
        break;
      default:
        goto LABEL_24;
    }
LABEL_33:
    RXCFProp<void const*>::operator=(v9, cf);
    return;
  }
  if ((int)a2 <= 1819439219)
  {
    if ((_DWORD)a2 != 1819173229)
    {
      if ((_DWORD)a2 == 1819242612)
      {
        v7 = (*((_QWORD *)this + 1) & 4) == 0;
        if (CFBooleanGetValue((CFBooleanRef)cf) != v7)
          return;
        (*(void (**)(RXLanguageObject *))(*(_QWORD *)this + 88))(this);
        v8 = *((_QWORD *)this + 1) ^ 4;
LABEL_29:
        *((_QWORD *)this + 1) = v8;
        return;
      }
      goto LABEL_24;
    }
    v12 = (CFTypeRef *)((char *)this + 48);
    v11 = *(_QWORD *)this;
    goto LABEL_32;
  }
  if ((_DWORD)a2 == 1819439220)
  {
    v13 = (*((_QWORD *)this + 1) & 8) == 0;
    if (CFBooleanGetValue((CFBooleanRef)cf) != v13)
      return;
    (*(void (**)(RXLanguageObject *))(*(_QWORD *)this + 88))(this);
    v8 = *((_QWORD *)this + 1) ^ 8;
    goto LABEL_29;
  }
  if ((_DWORD)a2 != 1819572340)
  {
LABEL_24:
    RXObject::SetProperty((CFTypeRef *)this, a2, cf);
    return;
  }
  if (v5 == 1)
  {
    v12 = (CFTypeRef *)((char *)this + 56);
    v11 = *(_QWORD *)this;
LABEL_32:
    (*(void (**)(RXLanguageObject *))(v11 + 88))(this);
    v9 = v12;
    goto LABEL_33;
  }
  if (v5 == 2)
  {
    if (!cf)
      __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXLanguageObject.cpp", 146, (uint64_t)"value", CFSTR("Word cannot have NULL text"));
    (*(void (**)(RXLanguageObject *))(*(_QWORD *)this + 88))(this);
    RXCFProp<void const*>::operator=((CFTypeRef *)this + 7, cf);
    v10 = (const void *)*((_QWORD *)this + 8);
    if (v10)
      CFRelease(v10);
    *((_QWORD *)this + 8) = 0;
  }
  else
  {
    __RXAbort(0, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXLanguageObject.cpp", 154, 0, CFSTR("kRXLanguageObjectProperty_Text is settable only on words or paths"));
  }
}

BOOL RXLanguageObject::ApplyBlock(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unsigned int i;
  uint64_t *v7;
  char v8;
  unint64_t v9;
  _QWORD *j;
  unint64_t v11;
  uint64_t v12;
  char v13;

  v5 = a1;
  for (i = *(_DWORD *)(a1 + 40); (i & 0xFFFFFFFE) == 4; i = *(_DWORD *)(*v7 + 40))
  {
    v7 = *(uint64_t **)(v5 + 160);
    if (v7 == *(uint64_t **)(v5 + 168))
      return 1;
    v5 = *v7;
  }
  if ((a3 & 1) != 0 || i > 1)
  {
    v11 = a3 & 0xFFFFFFFFFFFFFFE7;
    v12 = v5 - 16;
    return ((*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(a2 + 16))(a2, v12, v11) & 4) == 0;
  }
  v8 = a3 & 2;
  if ((a3 & 8) == 0)
  {
LABEL_8:
    if ((v8 & 2) != 0)
      v9 = a3 & 0xFFFFFFFFFFFFFFFCLL | 1;
    else
      v9 = a3;
    for (j = *(_QWORD **)(v5 + 160); j != *(_QWORD **)(v5 + 168); ++j)
    {
      if ((RXLanguageObject::ApplyBlock(*j, a2, v9) & 1) == 0)
        return 0;
    }
    if ((a3 & 0x10) == 0)
      return 1;
    v12 = v5 - 16;
    v11 = a3 & 0xFFFFFFFFFFFFFFF7;
    return ((*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(a2 + 16))(a2, v12, v11) & 4) == 0;
  }
  v13 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(a2 + 16))(a2, v5 - 16, a3 & 0xFFFFFFFFFFFFFFEFLL);
  if ((v13 & 4) != 0)
    return 0;
  if ((v13 & 1) == 0)
  {
    v8 |= v13;
    goto LABEL_8;
  }
  return 1;
}

uint64_t ___ZN16RXLanguageObject18CopyTextWithLocaleEPK10__CFLocale_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;

  if (*(_QWORD *)(a1 + 32) != a2)
  {
    if (a2)
      v3 = a2 + 16;
    else
      v3 = 0;
    v4 = (const __CFString *)(*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v3 + 72))(v3, 1819572340, *(_QWORD *)(a1 + 40));
    if (CFStringGetLength(*(CFStringRef *)(a1 + 48)))
      CFStringAppend(*(CFMutableStringRef *)(a1 + 48), *(CFStringRef *)(a1 + 56));
    if (v4)
      v5 = v4;
    else
      v5 = CFSTR("\"\"");
    CFStringAppend(*(CFMutableStringRef *)(a1 + 48), v5);
    if (v4)
      CFRelease(v4);
  }
  return 0;
}

void RXLanguageObject::~RXLanguageObject(RXLanguageObject *this)
{
  _QWORD *i;
  _QWORD *v3;
  RXResultDesc *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  RXObject *v9;

  *(_QWORD *)this = &off_24E355E08;
  v3 = (_QWORD *)*((_QWORD *)this + 20);
  for (i = (_QWORD *)*((_QWORD *)this + 21); v3 != i; i = (_QWORD *)*((_QWORD *)this + 21))
    CFRelease((CFTypeRef)(*v3++ - 16));
  v4 = (RXResultDesc *)*((_QWORD *)this + 23);
  if (v4)
    RXResultDesc::DeleteRef(v4);
  v5 = (void *)*((_QWORD *)this + 20);
  if (v5)
  {
    *((_QWORD *)this + 21) = v5;
    operator delete(v5);
  }
  RXProp<RXVocabulary *>::~RXProp((_QWORD *)this + 19);
  v6 = (void *)*((_QWORD *)this + 16);
  if (v6)
  {
    *((_QWORD *)this + 17) = v6;
    operator delete(v6);
  }
  v7 = (void *)*((_QWORD *)this + 13);
  if (v7)
  {
    *((_QWORD *)this + 14) = v7;
    operator delete(v7);
  }
  RXCFProp<__CFString const*>::~RXCFProp((const void **)this + 12);
  RXCFProp<__CFString const*>::~RXCFProp((const void **)this + 11);
  RXCFProp<__CFArray const*>::~RXCFProp((const void **)this + 10);
  RXCFProp<__CFURL const*>::~RXCFProp((const void **)this + 9);
  RXCFProp<__CFString const*>::~RXCFProp((const void **)this + 8);
  RXCFProp<__CFString const*>::~RXCFProp((const void **)this + 7);
  RXCFProp<__CFString const*>::~RXCFProp((const void **)this + 6);
  RXObject::~RXObject(this, v8, v9);
}

{
  RXLanguageObject::~RXLanguageObject(this);
  JUMPOUT(0x2207B89E4);
}

CFTypeRef RXLanguageObject::InitializeModel(RXLanguageObject *this, const __CFString *a2, const __CFURL *a3, const void *a4)
{
  *((_DWORD *)this + 10) = 0;
  RXCFProp<void const*>::operator=((CFTypeRef *)this + 6, a2);
  RXCFProp<void const*>::operator=((CFTypeRef *)this + 9, a3);
  return RXCFProp<void const*>::operator=((CFTypeRef *)this + 4, a4);
}

CFTypeRef RXLanguageObject::InitializePath(RXLanguageObject *this, const __CFString *a2, const void *a3)
{
  *((_DWORD *)this + 10) = 1;
  RXCFProp<void const*>::operator=((CFTypeRef *)this + 6, a2);
  return RXCFProp<void const*>::operator=((CFTypeRef *)this + 4, a3);
}

CFTypeRef RXLanguageObject::InitializeWord(RXLanguageObject *this, RXVocabulary *a2, const __CFString *a3, const void *a4)
{
  *((_DWORD *)this + 10) = 2;
  RXProp<RXRecognitionSystem *>::operator=((_QWORD *)this + 19, (uint64_t)a2);
  RXCFProp<void const*>::operator=((CFTypeRef *)this + 7, a3);
  return RXCFProp<void const*>::operator=((CFTypeRef *)this + 4, a4);
}

CFTypeRef RXLanguageObject::InitializeAdLib(RXLanguageObject *this, const __CFString *a2, RXVocabulary *a3, const void *a4)
{
  CFTypeRef result;

  *((_DWORD *)this + 10) = 3;
  RXProp<RXRecognitionSystem *>::operator=((_QWORD *)this + 19, (uint64_t)a3);
  result = RXCFProp<void const*>::operator=((CFTypeRef *)this + 4, a4);
  *((_QWORD *)this + 1) |= 8uLL;
  return result;
}

uint64_t RXLanguageObject::GetCount(RXLanguageObject *this)
{
  unsigned int v1;
  RXLanguageObject **v2;

  while (1)
  {
    v1 = *((_DWORD *)this + 10);
    if ((v1 & 0xFFFFFFFE) != 4)
      break;
    v2 = (RXLanguageObject **)*((_QWORD *)this + 20);
    if (v2 == *((RXLanguageObject ***)this + 21))
      return -1;
    this = *v2;
  }
  if (v1 <= 1)
    return (uint64_t)(*((_QWORD *)this + 21) - *((_QWORD *)this + 20)) >> 3;
  return -1;
}

void RXLanguageObject::AddObject(RXLanguageObject *this, RXLanguageObject *a2)
{
  RXLanguageObject *v3;
  unsigned int i;
  RXLanguageObject **v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v3 = this;
  for (i = *((_DWORD *)this + 10); (i & 0xFFFFFFFE) == 4; i = *((_DWORD *)*v5 + 10))
  {
    v5 = (RXLanguageObject **)*((_QWORD *)v3 + 20);
    if (v5 == *((RXLanguageObject ***)v3 + 21))
      return;
    v3 = *v5;
  }
  if (i >= 2)
    __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXLanguageObject.cpp", 489, (uint64_t)"CanBeParent()", &stru_24E356820);
  CFRetain((char *)a2 - 16);
  (*(void (**)(RXLanguageObject *))(*(_QWORD *)v3 + 88))(v3);
  v6 = *((_QWORD *)v3 + 22);
  v7 = (_QWORD *)*((_QWORD *)v3 + 21);
  if ((unint64_t)v7 >= v6)
  {
    v9 = *((_QWORD *)v3 + 20);
    v10 = ((uint64_t)v7 - v9) >> 3;
    if ((unint64_t)(v10 + 1) >> 61)
      std::vector<RXRecognitionSystem *>::__throw_length_error[abi:ne180100]();
    v11 = v6 - v9;
    v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1))
      v12 = v10 + 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    if (v13)
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RXRecognitionSystem *>>((uint64_t)v3 + 176, v13);
    else
      v14 = 0;
    v15 = &v14[8 * v10];
    v16 = &v14[8 * v13];
    *(_QWORD *)v15 = a2;
    v8 = v15 + 8;
    v18 = (char *)*((_QWORD *)v3 + 20);
    v17 = (char *)*((_QWORD *)v3 + 21);
    if (v17 != v18)
    {
      do
      {
        v19 = *((_QWORD *)v17 - 1);
        v17 -= 8;
        *((_QWORD *)v15 - 1) = v19;
        v15 -= 8;
      }
      while (v17 != v18);
      v17 = (char *)*((_QWORD *)v3 + 20);
    }
    *((_QWORD *)v3 + 20) = v15;
    *((_QWORD *)v3 + 21) = v8;
    *((_QWORD *)v3 + 22) = v16;
    if (v17)
      operator delete(v17);
  }
  else
  {
    *v7 = a2;
    v8 = v7 + 1;
  }
  *((_QWORD *)v3 + 21) = v8;
}

uint64_t RXLanguageObject::GetObject(RXLanguageObject *this, unint64_t a2)
{
  RXLanguageObject *v3;
  RXLanguageObject **v4;
  uint64_t v5;

  v3 = this;
  if ((*((_DWORD *)this + 10) & 0xFFFFFFFE) == 4)
  {
    do
    {
      v4 = (RXLanguageObject **)*((_QWORD *)v3 + 20);
      if (v4 == *((RXLanguageObject ***)v3 + 21))
      {
        __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXLanguageObject.cpp", 500, (uint64_t)"!fChildren.empty()", &stru_24E356820);
        v4 = (RXLanguageObject **)*((_QWORD *)v3 + 20);
      }
      v3 = *v4;
    }
    while ((*((_DWORD *)*v4 + 10) & 0xFFFFFFFE) == 4);
  }
  if ((a2 & 0x8000000000000000) != 0 || (v5 = *((_QWORD *)v3 + 20), a2 >= (*((_QWORD *)v3 + 21) - v5) >> 3))
  {
    __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXLanguageObject.cpp", 504, (uint64_t)"at >= 0 && at < fChildren.size()", &stru_24E356820);
    v5 = *((_QWORD *)v3 + 20);
  }
  return *(_QWORD *)(v5 + 8 * a2);
}

void RXLanguageObject::SetObject(RXLanguageObject *this, unint64_t a2, RXLanguageObject *a3)
{
  RXLanguageObject *v5;
  RXLanguageObject **v6;
  CFIndex v7;
  uint64_t v8;

  v5 = this;
  if ((*((_DWORD *)this + 10) & 0xFFFFFFFE) == 4)
  {
    do
    {
      v6 = (RXLanguageObject **)*((_QWORD *)v5 + 20);
      if (v6 == *((RXLanguageObject ***)v5 + 21))
      {
        __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXLanguageObject.cpp", 514, (uint64_t)"!fChildren.empty()", &stru_24E356820);
        v6 = (RXLanguageObject **)*((_QWORD *)v5 + 20);
      }
      v5 = *v6;
    }
    while ((*((_DWORD *)*v6 + 10) & 0xFFFFFFFE) == 4);
  }
  if ((a2 & 0x8000000000000000) != 0 || a2 >= (uint64_t)(*((_QWORD *)v5 + 21) - *((_QWORD *)v5 + 20)) >> 3)
    __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXLanguageObject.cpp", 520, (uint64_t)"at >= 0 && at < fChildren.size()", &stru_24E356820);
  (*(void (**)(RXLanguageObject *))(*(_QWORD *)v5 + 88))(v5);
  CFRetain((char *)a3 - 16);
  v7 = CFGetRetainCount((CFTypeRef)(*(_QWORD *)(*((_QWORD *)v5 + 20) + 8 * a2) - 16));
  v8 = *(_QWORD *)(*((_QWORD *)v5 + 20) + 8 * a2);
  if (v7 > 1)
    *(_QWORD *)(v8 + 16) &= ~*((_QWORD *)v5 + 2);
  CFRelease((CFTypeRef)(v8 - 16));
  *(_QWORD *)(*((_QWORD *)v5 + 20) + 8 * a2) = a3;
}

void RXLanguageObject::RemoveObject(RXLanguageObject *this, unint64_t a2)
{
  RXLanguageObject *v3;
  RXLanguageObject **v4;
  CFIndex v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = this;
  if ((*((_DWORD *)this + 10) & 0xFFFFFFFE) == 4)
  {
    do
    {
      v4 = (RXLanguageObject **)*((_QWORD *)v3 + 20);
      if (v4 == *((RXLanguageObject ***)v3 + 21))
      {
        __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXLanguageObject.cpp", 539, (uint64_t)"!fChildren.empty()", &stru_24E356820);
        v4 = (RXLanguageObject **)*((_QWORD *)v3 + 20);
      }
      v3 = *v4;
    }
    while ((*((_DWORD *)*v4 + 10) & 0xFFFFFFFE) == 4);
  }
  if ((a2 & 0x8000000000000000) != 0 || a2 >= (uint64_t)(*((_QWORD *)v3 + 21) - *((_QWORD *)v3 + 20)) >> 3)
    __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXLanguageObject.cpp", 545, (uint64_t)"at >= 0 && at < fChildren.size()", &stru_24E356820);
  (*(void (**)(RXLanguageObject *))(*(_QWORD *)v3 + 88))(v3);
  v5 = CFGetRetainCount((CFTypeRef)(*(_QWORD *)(*((_QWORD *)v3 + 20) + 8 * a2) - 16));
  v6 = *(_QWORD *)(*((_QWORD *)v3 + 20) + 8 * a2);
  if (v5 > 1)
    *(_QWORD *)(v6 + 16) &= ~*((_QWORD *)v3 + 2);
  CFRelease((CFTypeRef)(v6 - 16));
  v7 = *((_QWORD *)v3 + 21);
  v8 = *((_QWORD *)v3 + 20) + 8 * a2;
  v9 = v7 - (v8 + 8);
  if (v7 != v8 + 8)
    memmove((void *)v8, (const void *)(v8 + 8), v7 - (v8 + 8));
  *((_QWORD *)v3 + 21) = v8 + v9;
}

void RXLanguageObject::Serialize(RXLanguageObject *this, void *a2, RXRecognitionSystem *a3)
{
  RXXPC *XPCDesc;
  const __CFString *v7;
  RXXPC *v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  xpc_object_t v15;
  uint64_t v16;
  unint64_t v17;

  if (RXObject::ShouldSerialize(this, a3))
  {
    XPCDesc = (RXXPC *)RXObject::CreateXPCDesc(this, *((int *)this + 10) + 10, (uint64_t **)a3);
    v8 = XPCDesc;
    v9 = *((_QWORD *)this + 1);
    if ((v9 & 0xC) != 0)
      xpc_dictionary_set_uint64(XPCDesc, kRDKeyOptions, v9);
    if (*((_QWORD *)this + 7))
    {
      RXLanguageObject::NormalizeText(this, *((const __CFLocale **)a3 + 6));
      RXXPC::SerializeCFString(v8, kRDKeyText, *((CFStringRef *)this + 8), v10);
    }
    v11 = (const __CFString *)*((_QWORD *)this + 12);
    if (v11)
      RXXPC::SerializeCFString(v8, kRDKeyCommandID, v11, v7);
    v12 = (const __CFString *)*((_QWORD *)this + 11);
    if (v12)
      RXXPC::SerializeCFString(v8, kRDKeyCategoryID, v12, v7);
    v13 = (void *)*((_QWORD *)this + 9);
    if (v13)
      RXXPC::SerializeURL(v8, v13, (const __CFURL *)v12);
    v14 = *((_QWORD *)this + 19);
    if (v14)
    {
      xpc_dictionary_set_uint64(v8, kRDKeyVocabulary, v14);
      RXRecognitionSystem::ReachableObject((uint64_t **)a3, *((RXObject **)this + 19));
    }
    if (*((_DWORD *)this + 10) <= 1u)
    {
      v15 = xpc_array_create(0, 0);
      v16 = *((_QWORD *)this + 20);
      if (*((_QWORD *)this + 21) != v16)
      {
        v17 = 0;
        do
        {
          xpc_array_set_uint64(v15, 0xFFFFFFFFFFFFFFFFLL, *(_QWORD *)(v16 + 8 * v17++));
          v16 = *((_QWORD *)this + 20);
        }
        while (v17 < (*((_QWORD *)this + 21) - v16) >> 3);
      }
      xpc_dictionary_set_value(v8, kRDKeyChildren, v15);
      xpc_release(v15);
    }
    if ((*((_BYTE *)this + 8) & 1) != 0)
      xpc_dictionary_set_BOOL(v8, kRDKeyTopLevelLM, 1);
    xpc_array_append_value(a2, v8);
    xpc_release(v8);
  }
}

void RXLanguageObject::NormalizeText(RXLanguageObject *this, const __CFLocale *a2)
{
  const __CFString *v3;
  CFTypeRef *v4;
  CFIndex Length;
  const __CFString *v7;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFIndex v16;
  UniChar v17;
  BOOL v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  CFIndex v26;
  const void *v27;
  CFTypeRef *v28;
  __CFString *v29;
  __CFString *MutableCopy;
  UniChar buffer[64];
  CFStringRef theString;
  const UniChar *v33;
  const char *v34;
  uint64_t v35;
  CFIndex v36;
  int64_t v37;
  int64_t v38;
  CFRange v39;

  v3 = (const __CFString *)*((_QWORD *)this + 7);
  if (v3)
  {
    v4 = (CFTypeRef *)((char *)this + 64);
    if (!*((_QWORD *)this + 8))
    {
      Length = CFStringGetLength(v3);
      v7 = (const __CFString *)*((_QWORD *)this + 7);
      theString = v7;
      v35 = 0;
      v36 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v7);
      CStringPtr = 0;
      v33 = CharactersPtr;
      if (!CharactersPtr)
        CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
      v37 = 0;
      v38 = 0;
      v34 = CStringPtr;
      if (Length < 1)
      {
        v12 = 0;
        v13 = 0;
      }
      else
      {
        v10 = 0;
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 64;
        do
        {
          if ((unint64_t)v11 >= 4)
            v15 = 4;
          else
            v15 = v11;
          v16 = v36;
          if (v36 <= v11)
          {
            v17 = 0;
          }
          else if (v33)
          {
            v17 = v33[v11 + v35];
          }
          else if (v34)
          {
            v17 = v34[v35 + v11];
          }
          else
          {
            v20 = v37;
            if (v38 <= v11 || v37 > v11)
            {
              v22 = -v15;
              v23 = v15 + v10;
              v24 = v14 - v15;
              v25 = v11 + v22;
              v26 = v25 + 64;
              if (v25 + 64 >= v36)
                v26 = v36;
              v37 = v25;
              v38 = v26;
              if (v36 >= v24)
                v16 = v24;
              v39.length = v16 + v23;
              v39.location = v25 + v35;
              CFStringGetCharacters(theString, v39, buffer);
              v20 = v37;
            }
            v17 = buffer[v11 - v20];
          }
          switch(u_charType(v17))
          {
            case 1:
            case 3:
              if (v12)
                v18 = v13 == 0;
              else
                v18 = 0;
              v19 = 1;
              if (v18)
                v19 = 2;
              v13 += v19;
              break;
            case 2:
              ++v12;
              break;
            case 9:
              MutableCopy = CFStringCreateMutableCopy(0, 0, *((CFStringRef *)this + 7));
              goto LABEL_47;
            default:
              break;
          }
          if (++v11 >= Length)
            break;
          --v10;
          ++v14;
        }
        while (v13 < 2);
        if (v13 >= 1)
        {
          v27 = (const void *)*((_QWORD *)this + 7);
          v28 = (CFTypeRef *)((char *)this + 64);
LABEL_43:
          RXCFProp<void const*>::operator=(v28, v27);
          return;
        }
      }
      if (!v13 && v12 != 1)
      {
        v28 = (CFTypeRef *)((char *)this + 64);
        v27 = (const void *)*((_QWORD *)this + 7);
        goto LABEL_43;
      }
      v29 = CFStringCreateMutableCopy(0, 0, *((CFStringRef *)this + 7));
      MutableCopy = v29;
      if (v13)
        CFStringLowercase(v29, a2);
      else
LABEL_47:
        CFStringUppercase(MutableCopy, a2);
      RXCFProp<void const*>::operator=(v4, MutableCopy);
      CFRelease(MutableCopy);
    }
  }
}

uint64_t RXLanguageObject::CreateFromSerialized(RXLanguageObject *this, _QWORD *a2, RXResultDesc *a3)
{
  uint64_t Instance;
  uint64_t v6;
  uint64_t uint64;
  xpc_object_t value;
  const char *string_ptr;
  CFStringRef v10;
  void **v11;
  xpc_object_t v12;
  void *v13;
  size_t v14;
  xpc_object_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  _QWORD *v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  _QWORD *v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  uint64_t *v52;
  uint64_t v53;
  CFArrayRef v54;
  CFTypeRef *i;
  xpc_object_t v56;
  _QWORD *v58;
  void **v59;
  _QWORD applier[6];
  void *__p;
  uint64_t *v62;
  uint64_t *v63;

  if (!gRXCFTypeID_RXLanguageObject)
  {
    qword_25547CCF0 = (uint64_t)RXCFCopyFormattingDesc;
    unk_25547CCF8 = RXCFCopyDebugDesc;
    gRXCFTypeID_RXLanguageObject = _CFRuntimeRegisterClass();
  }
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
    v6 = Instance + 16;
  else
    v6 = 0;
  if (a2)
  {
    ++*a2;
    *(_QWORD *)(v6 + 184) = a2;
  }
  v58 = a2;
  if (xpc_dictionary_get_int64(this, kRDKeyObjectType) == 14)
  {
    *(_DWORD *)(v6 + 40) = 4;
    if (xpc_dictionary_get_BOOL(this, kRDKeyIsHypothesis))
      *(_QWORD *)(v6 + 8) |= 2uLL;
  }
  else if (xpc_dictionary_get_int64(this, kRDKeyObjectType) == 15)
  {
    *(_DWORD *)(v6 + 40) = 5;
  }
  else
  {
    uint64 = xpc_dictionary_get_uint64(this, kRDKeyObjectID);
    *(_DWORD *)(v6 + 40) = *(_DWORD *)(uint64 + 40);
    RXCFProp<void const*>::operator=((CFTypeRef *)(v6 + 32), *(CFTypeRef *)(uint64 + 32));
    RXCFProp<void const*>::operator=((CFTypeRef *)(v6 + 48), *(CFTypeRef *)(uint64 + 48));
    RXCFProp<void const*>::operator=((CFTypeRef *)(v6 + 56), *(CFTypeRef *)(uint64 + 56));
    RXCFProp<void const*>::operator=((CFTypeRef *)(v6 + 72), *(CFTypeRef *)(uint64 + 72));
    RXProp<RXRecognitionSystem *>::operator=((_QWORD *)(v6 + 152), *(_QWORD *)(uint64 + 152));
    value = xpc_dictionary_get_value(this, kRDKeyText);
    if (value)
    {
      string_ptr = xpc_string_get_string_ptr(value);
      v10 = CFStringCreateWithCString(0, string_ptr, 0x8000100u);
      RXCFProp<void const*>::operator=((CFTypeRef *)(v6 + 56), v10);
      if (v10)
        CFRelease(v10);
    }
    v11 = (void **)(v6 + 104);
    *(_QWORD *)(v6 + 112) = *(_QWORD *)(v6 + 104);
    v59 = (void **)(v6 + 128);
    *(_QWORD *)(v6 + 136) = *(_QWORD *)(v6 + 128);
    v12 = xpc_dictionary_get_value(this, kRDKeyTextVariants);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      __p = 0;
      v62 = 0;
      v63 = 0;
      while (v14 < xpc_array_get_count(v13))
      {
        v15 = xpc_array_get_value(v13, v14);
        xpc_dictionary_get_value(v15, kRDKeyText);
        v16 = _CFXPCCreateCFObjectFromXPCObject();
        v17 = v16;
        v18 = v62;
        if (v62 >= v63)
        {
          v20 = ((char *)v62 - (_BYTE *)__p) >> 3;
          if ((unint64_t)(v20 + 1) >> 61)
            std::vector<RXRecognitionSystem *>::__throw_length_error[abi:ne180100]();
          v21 = ((char *)v63 - (_BYTE *)__p) >> 2;
          if (v21 <= v20 + 1)
            v21 = v20 + 1;
          if ((unint64_t)((char *)v63 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
            v22 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v22 = v21;
          if (v22)
            v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RXRecognitionSystem *>>((uint64_t)&v63, v22);
          else
            v23 = 0;
          v24 = (uint64_t *)&v23[8 * v20];
          *v24 = v17;
          v19 = v24 + 1;
          v26 = (char *)__p;
          v25 = (char *)v62;
          if (v62 != __p)
          {
            do
            {
              v27 = *((_QWORD *)v25 - 1);
              v25 -= 8;
              *--v24 = v27;
            }
            while (v25 != v26);
            v25 = (char *)__p;
          }
          __p = v24;
          v62 = v19;
          v63 = (uint64_t *)&v23[8 * v22];
          if (v25)
            operator delete(v25);
        }
        else
        {
          *v62 = v16;
          v19 = v18 + 1;
        }
        v62 = v19;
        v28 = xpc_dictionary_get_uint64(v15, kRDKeyStartTime);
        v29 = v28;
        v31 = *(char **)(v6 + 112);
        v30 = *(_QWORD *)(v6 + 120);
        if ((unint64_t)v31 >= v30)
        {
          v33 = (char *)*v11;
          v34 = (v31 - (_BYTE *)*v11) >> 3;
          v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 61)
            std::vector<RXRecognitionSystem *>::__throw_length_error[abi:ne180100]();
          v36 = v30 - (_QWORD)v33;
          if (v36 >> 2 > v35)
            v35 = v36 >> 2;
          if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8)
            v37 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v37 = v35;
          if (v37)
          {
            v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RXRecognitionSystem *>>(v6 + 120, v37);
            v33 = *(char **)(v6 + 104);
            v31 = *(char **)(v6 + 112);
          }
          else
          {
            v38 = 0;
          }
          v39 = (uint64_t *)&v38[8 * v34];
          *v39 = v29;
          v32 = v39 + 1;
          while (v31 != v33)
          {
            v40 = *((_QWORD *)v31 - 1);
            v31 -= 8;
            *--v39 = v40;
          }
          *(_QWORD *)(v6 + 104) = v39;
          *(_QWORD *)(v6 + 112) = v32;
          *(_QWORD *)(v6 + 120) = &v38[8 * v37];
          if (v33)
            operator delete(v33);
        }
        else
        {
          *(_QWORD *)v31 = v28;
          v32 = v31 + 8;
        }
        *(_QWORD *)(v6 + 112) = v32;
        v41 = xpc_dictionary_get_uint64(v15, kRDKeyEndTime);
        v42 = v41;
        v44 = *(char **)(v6 + 136);
        v43 = *(_QWORD *)(v6 + 144);
        if ((unint64_t)v44 >= v43)
        {
          v46 = (char *)*v59;
          v47 = (v44 - (_BYTE *)*v59) >> 3;
          v48 = v47 + 1;
          if ((unint64_t)(v47 + 1) >> 61)
            std::vector<RXRecognitionSystem *>::__throw_length_error[abi:ne180100]();
          v49 = v43 - (_QWORD)v46;
          if (v49 >> 2 > v48)
            v48 = v49 >> 2;
          if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF8)
            v50 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v50 = v48;
          if (v50)
          {
            v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RXRecognitionSystem *>>(v6 + 144, v50);
            v46 = *(char **)(v6 + 128);
            v44 = *(char **)(v6 + 136);
          }
          else
          {
            v51 = 0;
          }
          v52 = (uint64_t *)&v51[8 * v47];
          *v52 = v42;
          v45 = v52 + 1;
          while (v44 != v46)
          {
            v53 = *((_QWORD *)v44 - 1);
            v44 -= 8;
            *--v52 = v53;
          }
          *(_QWORD *)(v6 + 128) = v52;
          *(_QWORD *)(v6 + 136) = v45;
          *(_QWORD *)(v6 + 144) = &v51[8 * v50];
          if (v46)
            operator delete(v46);
        }
        else
        {
          *(_QWORD *)v44 = v41;
          v45 = v44 + 8;
        }
        *(_QWORD *)(v6 + 136) = v45;
        ++v14;
      }
      v54 = CFArrayCreate(0, (const void **)__p, ((char *)v62 - (_BYTE *)__p) >> 3, MEMORY[0x24BDBD690]);
      for (i = (CFTypeRef *)__p; i != (CFTypeRef *)v62; ++i)
        CFRelease(*i);
      RXCFProp<void const*>::operator=((CFTypeRef *)(v6 + 80), v54);
      CFRelease(v54);
      if (__p)
      {
        v62 = (uint64_t *)__p;
        operator delete(__p);
      }
    }
  }
  *(_QWORD *)(v6 + 192) = xpc_dictionary_get_uint64(this, kRDKeyStartTime);
  *(_QWORD *)(v6 + 200) = xpc_dictionary_get_uint64(this, kRDKeyEndTime);
  *(_QWORD *)(v6 + 208) = xpc_dictionary_get_uint64(this, kRDKeyUtteranceID);
  v56 = xpc_dictionary_get_value(this, kRDKeyChildren);
  if (v56)
  {
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 0x40000000;
    applier[2] = ___ZN16RXLanguageObject20CreateFromSerializedEPvP12RXResultDesc_block_invoke;
    applier[3] = &__block_descriptor_tmp_23;
    applier[4] = v6;
    applier[5] = v58;
    xpc_array_apply(v56, applier);
  }
  return v6;
}

void sub_21EBF055C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN16RXLanguageObject20CreateFromSerializedEPvP12RXResultDesc_block_invoke(uint64_t a1, int a2, RXLanguageObject *this)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v3 = *(_QWORD **)(a1 + 32);
  v4 = RXLanguageObject::CreateFromSerialized(this, *(void **)(a1 + 40), this);
  v5 = (uint64_t *)v3[21];
  v6 = v3[22];
  if ((unint64_t)v5 >= v6)
  {
    v8 = v3[20];
    v9 = ((uint64_t)v5 - v8) >> 3;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<RXRecognitionSystem *>::__throw_length_error[abi:ne180100]();
    v10 = v6 - v8;
    v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RXRecognitionSystem *>>((uint64_t)(v3 + 22), v12);
    else
      v13 = 0;
    v14 = (uint64_t *)&v13[8 * v9];
    v15 = &v13[8 * v12];
    *v14 = v4;
    v7 = v14 + 1;
    v17 = (char *)v3[20];
    v16 = (char *)v3[21];
    if (v16 != v17)
    {
      do
      {
        v18 = *((_QWORD *)v16 - 1);
        v16 -= 8;
        *--v14 = v18;
      }
      while (v16 != v17);
      v16 = (char *)v3[20];
    }
    v3[20] = v14;
    v3[21] = v7;
    v3[22] = v15;
    if (v16)
      operator delete(v16);
  }
  else
  {
    *v5 = v4;
    v7 = v5 + 1;
  }
  v3[21] = v7;
  return 1;
}

const __CFString *RXLanguageObject::CopyFormattingDesc(RXLanguageObject *this, const __CFDictionary *a2)
{
  const void *v2;

  v2 = (const void *)*((_QWORD *)this + 7);
  if (v2)
    return (const __CFString *)CFRetain(v2);
  else
    return &stru_24E356820;
}

CFStringRef RXLanguageObject::CopyDebugDesc(CFArrayRef *this)
{
  __CFString *MutableCopy;
  __CFString *v3;
  CFIndex v4;
  const __CFArray *ValueAtIndex;
  CFIndex v6;
  const __CFString *v7;
  const void *v8;
  const __CFArray *v9;
  unint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  BOOL v14;
  const char *v15;
  const char *v16;
  const char *v17;
  BOOL v18;
  const __CFString *v19;
  const char *v20;
  const char *v21;
  BOOL v22;
  const char *v23;
  CFStringRef v24;
  UniChar v26;
  UniChar chars;
  UniChar v28;
  CFRange v29;

  if (!this[10] && this[21] == this[20])
  {
    v3 = &stru_24E356820;
  }
  else
  {
    v28 = 10;
    chars = 123;
    v26 = 125;
    MutableCopy = CFStringCreateMutableCopy(0, 0, CFSTR("\n  "));
    v3 = MutableCopy;
    if (this[10])
    {
      CFStringAppend(MutableCopy, CFSTR("{ "));
      if (CFArrayGetCount(this[10]) >= 1)
      {
        v4 = 0;
        do
        {
          ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(this[10], v4);
          if (v4)
            CFStringAppend(v3, CFSTR("  "));
          if (CFArrayGetCount(ValueAtIndex) != 1)
            CFStringAppendCharacters(v3, &chars, 1);
          if (CFArrayGetCount(ValueAtIndex) >= 1)
          {
            v6 = 0;
            do
            {
              if (v6)
                v7 = CFSTR(", ");
              else
                v7 = &stru_24E356820;
              v8 = CFArrayGetValueAtIndex(ValueAtIndex, v6);
              CFStringAppendFormat(v3, 0, CFSTR("%@\"%@\""), v7, v8);
              ++v6;
            }
            while (v6 < CFArrayGetCount(ValueAtIndex));
          }
          if (CFArrayGetCount(ValueAtIndex) != 1)
            CFStringAppendCharacters(v3, &v26, 1);
          CFStringAppendFormat(v3, 0, CFSTR(" (%llu:%llu)\n"), *((_QWORD *)this[13] + v4), *((_QWORD *)this[16] + v4));
          ++v4;
        }
        while (v4 < CFArrayGetCount(this[10]));
      }
      CFStringAppendCharacters(v3, &v26, 1);
      CFStringAppendCharacters(v3, &v28, 1);
    }
    v9 = this[20];
    if (this[21] != v9)
    {
      v10 = 0;
      do
      {
        v11 = (const __CFString *)(*(uint64_t (**)(_QWORD))(**((_QWORD **)v9 + v10) + 48))(*((_QWORD *)v9 + v10));
        CFStringAppend(v3, v11);
        CFStringAppendCharacters(v3, &v28, 1);
        CFRelease(v11);
        ++v10;
        v9 = this[20];
      }
      while (v10 < (this[21] - v9) >> 3);
    }
    v29.length = CFStringGetLength(v3) - 2;
    v29.location = 1;
    CFStringFindAndReplace(v3, CFSTR("\n"), CFSTR("\n  "), v29, 0);
  }
  v12 = (const __CFString *)this[6];
  v13 = (const __CFString *)this[7];
  v14 = v13 == 0;
  v15 = "";
  v16 = "\" ";
  if (!v13)
  {
    v13 = &stru_24E356820;
    v16 = "";
  }
  v17 = "\"";
  if (v14)
    v17 = "";
  v18 = v12 == 0;
  if (!v12)
    v12 = &stru_24E356820;
  v19 = (const __CFString *)this[4];
  v20 = "] ";
  if (v18)
    v20 = "";
  v21 = "[";
  if (v18)
    v21 = "";
  v22 = v19 == 0;
  if (!v19)
    v19 = &stru_24E356820;
  v23 = " [";
  if (v22)
    v23 = "";
  else
    v15 = "]";
  v24 = CFStringCreateWithFormat(0, 0, CFSTR("<%@ %p %s%@%s%s%@%s(%llu:%llu) <%llu> %s%@%s%@>"), sRXTypeNames[*((unsigned int *)this + 10)], this - 2, v21, v12, v20, v17, v13, v16, *((_OWORD *)this + 12), this[26], v23, v19, v15, v3);
  CFRelease(v3);
  return v24;
}

uint64_t RXLanguageObjectGetTypeID()
{
  uint64_t result;

  result = gRXCFTypeID_RXLanguageObject;
  if (!gRXCFTypeID_RXLanguageObject)
  {
    qword_25547CCF0 = (uint64_t)RXCFCopyFormattingDesc;
    unk_25547CCF8 = RXCFCopyDebugDesc;
    result = _CFRuntimeRegisterClass();
    gRXCFTypeID_RXLanguageObject = result;
  }
  return result;
}

uint64_t RXLanguageModelCreate(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t Instance;
  uint64_t v6;
  uint64_t v7;
  const void *v8;

  if (!gRXCFTypeID_RXLanguageObject)
  {
    qword_25547CCF0 = (uint64_t)RXCFCopyFormattingDesc;
    unk_25547CCF8 = RXCFCopyDebugDesc;
    gRXCFTypeID_RXLanguageObject = _CFRuntimeRegisterClass();
  }
  Instance = _CFRuntimeCreateInstance();
  v6 = Instance;
  if (Instance)
    v7 = Instance + 16;
  else
    v7 = 0;
  *(_DWORD *)(v7 + 40) = 0;
  RXCFProp<void const*>::operator=((CFTypeRef *)(v7 + 48), a2);
  v8 = *(const void **)(v7 + 72);
  if (v8)
    CFRelease(v8);
  *(_QWORD *)(v7 + 72) = 0;
  RXCFProp<void const*>::operator=((CFTypeRef *)(v7 + 32), a3);
  return v6;
}

uint64_t RXLanguageModelCreateWithURL(uint64_t a1, const __CFURL *a2, const void *a3)
{
  uint64_t Instance;
  const __CFString *PathComponent;
  CFStringRef v7;
  const __CFString *v8;
  CFIndex Length;
  CFStringRef v10;
  uint64_t v11;
  CFRange v13;

  if (!gRXCFTypeID_RXLanguageObject)
  {
    qword_25547CCF0 = (uint64_t)RXCFCopyFormattingDesc;
    unk_25547CCF8 = RXCFCopyDebugDesc;
    gRXCFTypeID_RXLanguageObject = _CFRuntimeRegisterClass();
  }
  Instance = _CFRuntimeCreateInstance();
  PathComponent = CFURLCopyLastPathComponent(a2);
  v7 = CFURLCopyPathExtension(a2);
  if (v7)
  {
    v8 = v7;
    Length = CFStringGetLength(PathComponent);
    v13.length = Length + ~CFStringGetLength(v8);
    v13.location = 0;
    v10 = CFStringCreateWithSubstring(0, PathComponent, v13);
    CFRelease(PathComponent);
    CFRelease(v8);
    PathComponent = v10;
  }
  if (Instance)
    v11 = Instance + 16;
  else
    v11 = 0;
  *(_DWORD *)(v11 + 40) = 0;
  RXCFProp<void const*>::operator=((CFTypeRef *)(v11 + 48), PathComponent);
  RXCFProp<void const*>::operator=((CFTypeRef *)(v11 + 72), a2);
  RXCFProp<void const*>::operator=((CFTypeRef *)(v11 + 32), a3);
  CFRelease(PathComponent);
  return Instance;
}

uint64_t RXPathCreate(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t Instance;
  uint64_t v6;
  uint64_t v7;

  if (!gRXCFTypeID_RXLanguageObject)
  {
    qword_25547CCF0 = (uint64_t)RXCFCopyFormattingDesc;
    unk_25547CCF8 = RXCFCopyDebugDesc;
    gRXCFTypeID_RXLanguageObject = _CFRuntimeRegisterClass();
  }
  Instance = _CFRuntimeCreateInstance();
  v6 = Instance;
  if (Instance)
    v7 = Instance + 16;
  else
    v7 = 0;
  *(_DWORD *)(v7 + 40) = 1;
  RXCFProp<void const*>::operator=((CFTypeRef *)(v7 + 48), a2);
  RXCFProp<void const*>::operator=((CFTypeRef *)(v7 + 32), a3);
  return v6;
}

uint64_t RXWordCreate(uint64_t a1, uint64_t a2, const void *a3, const void *a4)
{
  uint64_t Instance;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!gRXCFTypeID_RXLanguageObject)
  {
    qword_25547CCF0 = (uint64_t)RXCFCopyFormattingDesc;
    unk_25547CCF8 = RXCFCopyDebugDesc;
    gRXCFTypeID_RXLanguageObject = _CFRuntimeRegisterClass();
  }
  Instance = _CFRuntimeCreateInstance();
  v8 = Instance;
  if (Instance)
    v9 = Instance + 16;
  else
    v9 = 0;
  if (a2)
    v10 = a2 + 16;
  else
    v10 = 0;
  *(_DWORD *)(v9 + 40) = 2;
  RXProp<RXRecognitionSystem *>::operator=((_QWORD *)(v9 + 152), v10);
  RXCFProp<void const*>::operator=((CFTypeRef *)(v9 + 56), a3);
  RXCFProp<void const*>::operator=((CFTypeRef *)(v9 + 32), a4);
  return v8;
}

uint64_t RXAdLibCreate(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t Instance;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (!gRXCFTypeID_RXLanguageObject)
  {
    qword_25547CCF0 = (uint64_t)RXCFCopyFormattingDesc;
    unk_25547CCF8 = RXCFCopyDebugDesc;
    gRXCFTypeID_RXLanguageObject = _CFRuntimeRegisterClass();
  }
  Instance = _CFRuntimeCreateInstance();
  v7 = Instance;
  if (Instance)
    v8 = Instance + 16;
  else
    v8 = 0;
  if (a3)
    v9 = a3 + 16;
  else
    v9 = 0;
  *(_DWORD *)(v8 + 40) = 3;
  RXProp<RXRecognitionSystem *>::operator=((_QWORD *)(v8 + 152), v9);
  RXCFProp<void const*>::operator=((CFTypeRef *)(v8 + 32), a4);
  *(_QWORD *)(v8 + 8) |= 8uLL;
  return v7;
}

uint64_t RXLanguageModelWriteToURL()
{
  __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXLanguageObject.cpp", 888, 0, CFSTR("RXLanguageModelWriteToURL not implemented yet"));
  return 0;
}

uint64_t RXLanguageObjectGetType(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 16;
  if (!a1)
    v1 = 0;
  return (*(_DWORD *)(v1 + 40) + 1);
}

uint64_t RXLanguageObjectGetCount(RXXPC *a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  v2 = RXXPC::Queue(a1);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 0x40000000;
  v5[2] = __RXLanguageObjectGetCount_block_invoke;
  v5[3] = &unk_24E355EC0;
  v5[4] = &v6;
  v5[5] = a1;
  dispatch_sync(v2, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_21EBF0EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void RXLanguageObjectAddObject(RXXPC *a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD v5[6];

  v4 = RXXPC::Queue(a1);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 0x40000000;
  v5[2] = __RXLanguageObjectAddObject_block_invoke;
  v5[3] = &__block_descriptor_tmp_51;
  v5[4] = a1;
  v5[5] = a2;
  dispatch_sync(v4, v5);
}

void sub_21EBF100C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  RXTransaction<RXLanguageObject>::~RXTransaction((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t RXLanguageObjectGetObjectAtIndex(RXXPC *a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  v4 = RXXPC::Queue(a1);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __RXLanguageObjectGetObjectAtIndex_block_invoke;
  block[3] = &unk_24E355F08;
  block[5] = a2;
  block[6] = a1;
  block[4] = &v8;
  dispatch_sync(v4, block);
  v5 = v9[3] - 16;
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_21EBF10C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void RXLanguageObjectSetObjectAtIndex(RXXPC *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  _QWORD block[7];

  v6 = RXXPC::Queue(a1);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __RXLanguageObjectSetObjectAtIndex_block_invoke;
  block[3] = &__block_descriptor_tmp_53;
  block[4] = a1;
  block[5] = a2;
  block[6] = a3;
  dispatch_sync(v6, block);
}

void sub_21EBF1214(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  RXTransaction<RXLanguageObject>::~RXTransaction((uint64_t)va);
  _Unwind_Resume(a1);
}

void RXLanguageObjectRemoveObjectAtIndex(RXXPC *a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD v5[6];

  v4 = RXXPC::Queue(a1);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 0x40000000;
  v5[2] = __RXLanguageObjectRemoveObjectAtIndex_block_invoke;
  v5[3] = &__block_descriptor_tmp_54;
  v5[4] = a1;
  v5[5] = a2;
  dispatch_sync(v4, v5);
}

void sub_21EBF12E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  RXTransaction<RXLanguageObject>::~RXTransaction((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL RXLanguageObjectApplyBlock(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  if (a1)
    v3 = a1 + 16;
  else
    v3 = 0;
  return RXLanguageObject::ApplyBlock(v3, a2, a3);
}

CFMutableStringRef RXReplaceHyphensWithSpace(__CFString *a1, _DWORD *a2)
{
  CFMutableStringRef MutableCopy;
  const __CFAllocator *v4;
  CFIndex Length;
  uint64_t i;
  const __CFString *v7;
  _QWORD v9[6];
  CFRange v10;

  MutableCopy = a1;
  v9[5] = *MEMORY[0x24BDAC8D0];
  if (a1 && a2)
  {
    MEMORY[0x24BDAC7A8]();
    v9[0] = CFSTR("-");
    v9[1] = CFSTR("­");
    v9[2] = CFSTR("‐");
    v9[3] = CFSTR("‑");
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Length = CFStringGetLength(MutableCopy);
    MutableCopy = CFStringCreateMutableCopy(v4, Length, MutableCopy);
    for (i = 0; i != 4; ++i)
    {
      v7 = (const __CFString *)v9[i];
      v10.length = CFStringGetLength(MutableCopy);
      v10.location = 0;
      *a2 += CFStringFindAndReplace(MutableCopy, v7, CFSTR(" "), v10, 0);
    }
  }
  return MutableCopy;
}

void RXLanguageObjectAddPhrase(uint64_t a1, RXXPC *a2, uint64_t a3, const __CFString *a4, const __CFLocale *a5)
{
  RXXPC *v9;
  const __CFString *v10;
  const __CFLocale *v11;
  __CFArray *v12;
  const __CFArray *v13;
  CFIndex Count;
  uint64_t v15;
  CFIndex v16;
  CFIndex i;
  const void *ValueAtIndex;
  RXXPC *v19;
  NSObject *v20;
  RXXPC *v21;
  NSObject *v22;
  uint64_t block;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  RXXPC *v28;
  RXXPC *v29;

  v9 = (RXXPC *)RXPathCreate(0, 0, 0);
  RXObjectSetProperty(v9, 1819572340, (uint64_t)a4);
  v10 = (const __CFString *)MEMORY[0x2207B863C](a5);
  if (RXIsLocaleWithNoSpaceInPostITN(v10))
    v12 = RXLanguageObjectCharacterTokenize(a4, v11);
  else
    v12 = RXLanguageObjectCFTokenizerTokenize(a4, a5);
  v13 = v12;
  Count = CFArrayGetCount(v12);
  v15 = MEMORY[0x24BDAC760];
  if (Count >= 1)
  {
    v16 = Count;
    for (i = 0; i != v16; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v13, i);
      v19 = (RXXPC *)RXWordCreate(a1, a3, ValueAtIndex, 0);
      v20 = RXXPC::Queue(v19);
      block = v15;
      v25 = 0x40000000;
      v26 = __RXLanguageObjectAddObject_block_invoke;
      v27 = &__block_descriptor_tmp_51;
      v28 = v9;
      v29 = v19;
      dispatch_sync(v20, &block);
      CFRelease(v19);
    }
  }
  CFRelease(v13);
  v22 = RXXPC::Queue(v21);
  block = v15;
  v25 = 0x40000000;
  v26 = __RXLanguageObjectAddObject_block_invoke;
  v27 = &__block_descriptor_tmp_51;
  v28 = a2;
  v29 = v9;
  dispatch_sync(v22, &block);
  CFRelease(v9);
}

__CFArray *RXLanguageObjectCharacterTokenize(const __CFString *a1, const __CFLocale *a2)
{
  __CFArray *Mutable;
  unsigned __int8 *p_p;
  uint64_t v5;
  CFIndex v6;
  const __CFCharacterSet *v7;
  UniChar CharacterAtIndex;
  CFStringRef v9;
  void *__p;
  uint64_t v12;
  unsigned __int8 v13;
  CFRange v14;

  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  CreateCppStringFromCFString(a1, &__p);
  if ((char)v13 < 0)
  {
    p_p = (unsigned __int8 *)__p;
    v5 = v12;
    if (v12)
      goto LABEL_5;
  }
  else
  {
    if (!v13)
      goto LABEL_14;
    p_p = (unsigned __int8 *)&__p;
    v5 = v13;
LABEL_5:
    while (((char)*p_p & 0x80000000) == 0 && (*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * *p_p + 60) & 0x400) != 0)
    {
      ++p_p;
      if (!--v5)
      {
        if ((v13 & 0x80) != 0)
          operator delete(__p);
        CFArrayAppendValue(Mutable, a1);
        return Mutable;
      }
    }
    if ((v13 & 0x80) == 0)
      goto LABEL_14;
    p_p = (unsigned __int8 *)__p;
  }
  operator delete(p_p);
LABEL_14:
  if (CFStringGetLength(a1) >= 1)
  {
    v6 = 0;
    do
    {
      if (RXGetLegitimateCharacters(void)::sInitCharSet != -1)
        dispatch_once(&RXGetLegitimateCharacters(void)::sInitCharSet, &__block_literal_global_1);
      v7 = (const __CFCharacterSet *)RXGetLegitimateCharacters(void)::sLegitChars;
      CharacterAtIndex = CFStringGetCharacterAtIndex(a1, v6);
      if (CFCharacterSetIsCharacterMember(v7, CharacterAtIndex))
      {
        v14.location = v6;
        v14.length = 1;
        v9 = CFStringCreateWithSubstring(0, a1, v14);
        CFArrayAppendValue(Mutable, v9);
      }
      ++v6;
    }
    while (v6 < CFStringGetLength(a1));
  }
  return Mutable;
}

__CFArray *RXLanguageObjectCFTokenizerTokenize(const __CFString *a1, const __CFLocale *a2)
{
  __CFArray *Mutable;
  CFIndex Length;
  const void *v6;
  void *Value;
  CFRange CurrentTokenRange;
  CFIndex v9;
  CFIndex v10;
  const __CFCharacterSet *v11;
  UniChar CharacterAtIndex;
  int v13;
  CFRange v14;
  CFStringRef v15;
  CFRange v17;
  CFRange v18;
  CFRange v19;
  CFRange v20;

  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  Length = CFStringGetLength(a1);
  if (RXLanguageObjectCFTokenizerTokenize(__CFString const*,__CFLocale const*)::onceToken != -1)
    dispatch_once(&RXLanguageObjectCFTokenizerTokenize(__CFString const*,__CFLocale const*)::onceToken, &__block_literal_global_78);
  pthread_mutex_lock(&RXLanguageObjectCFTokenizerTokenize(__CFString const*,__CFLocale const*)::sMutexAroundSharedCFStringTokenizer);
  if (WordBoundaryUnitStringTokenizerForLocale(__CFLocale const*)::onceToken != -1)
    dispatch_once(&WordBoundaryUnitStringTokenizerForLocale(__CFLocale const*)::onceToken, &__block_literal_global_80);
  v6 = (const void *)MEMORY[0x2207B863C](a2);
  Value = (void *)CFDictionaryGetValue((CFDictionaryRef)WordBoundaryUnitStringTokenizerForLocale(__CFLocale const*)::sStringTokenizerForLocaleIdentifierTable, v6);
  if (!Value)
  {
    v18.location = 0;
    v18.length = 0;
    Value = CFStringTokenizerCreate(0, &stru_24E356820, v18, 4uLL, a2);
    if (Value)
    {
      CFDictionaryAddValue((CFMutableDictionaryRef)WordBoundaryUnitStringTokenizerForLocale(__CFLocale const*)::sStringTokenizerForLocaleIdentifierTable, v6, Value);
      CFRelease(Value);
    }
  }
  v19.location = 0;
  v19.length = Length;
  CFStringTokenizerSetString((CFStringTokenizerRef)Value, a1, v19);
  while (CFStringTokenizerAdvanceToNextToken((CFStringTokenizerRef)Value))
  {
    CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)Value);
    v9 = CurrentTokenRange.length;
    if (RXGetLegitimateCharacters(void)::sInitCharSet != -1)
      dispatch_once(&RXGetLegitimateCharacters(void)::sInitCharSet, &__block_literal_global_1);
    if (CFStringFindCharacterFromSet(a1, (CFCharacterSetRef)RXGetLegitimateCharacters(void)::sLegitChars, CurrentTokenRange, 0, &v17))
    {
      v10 = CurrentTokenRange.length + CurrentTokenRange.location;
LABEL_13:
      if (v10 < Length - 1)
      {
        if (RXGetLegitimateCharacters(void)::sInitCharSet != -1)
          dispatch_once(&RXGetLegitimateCharacters(void)::sInitCharSet, &__block_literal_global_1);
        v11 = (const __CFCharacterSet *)RXGetLegitimateCharacters(void)::sLegitChars;
        CharacterAtIndex = CFStringGetCharacterAtIndex(a1, v10 + 1);
        if (CFCharacterSetIsCharacterMember(v11, CharacterAtIndex))
        {
          v13 = CFStringGetCharacterAtIndex(a1, v10);
          if ((v13 - 8208) < 2 || v13 == 173 || v13 == 45)
          {
            while (CFStringTokenizerAdvanceToNextToken((CFStringTokenizerRef)Value))
            {
              v14 = CFStringTokenizerGetCurrentTokenRange((CFStringTokenizerRef)Value);
              if (v14.location > v10)
              {
                v9 = v14.length - CurrentTokenRange.location + v14.location;
                v10 = v14.length + v14.location;
                goto LABEL_13;
              }
            }
          }
        }
      }
      v20.location = CurrentTokenRange.location;
      v20.length = v9;
      v15 = CFStringCreateWithSubstring(0, a1, v20);
      CFArrayAppendValue(Mutable, v15);
      CFRelease(v15);
    }
  }
  pthread_mutex_unlock(&RXLanguageObjectCFTokenizerTokenize(__CFString const*,__CFLocale const*)::sMutexAroundSharedCFStringTokenizer);
  return Mutable;
}

void RXLanguageObjectAddPhraseAndAlternatives(uint64_t a1, RXXPC *a2, uint64_t a3, __CFString *a4, const __CFLocale *a5)
{
  RXXPC *v9;
  const __CFString *v10;
  _BOOL4 v11;
  uint64_t v12;
  CFMutableStringRef v13;
  CFMutableStringRef v14;
  RXXPC *v15;
  RXXPC *v16;
  NSObject *v17;
  const __CFString *v18;
  const __CFLocale *v19;
  __CFArray *v20;
  const __CFArray *v21;
  CFIndex Count;
  CFIndex v23;
  CFIndex i;
  const void *ValueAtIndex;
  RXXPC *v26;
  NSObject *v27;
  RXXPC *v28;
  NSObject *v29;
  int v31;
  uint64_t block;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  RXXPC *v36;
  RXXPC *v37;

  v9 = (RXXPC *)RXPathCreate(0, 0, 0);
  RXObjectSetProperty(v9, 1819572340, (uint64_t)a4);
  v10 = (const __CFString *)MEMORY[0x2207B863C](a5);
  v11 = RXIsLocaleWithSpecialHyphenHandling(v10);
  v12 = MEMORY[0x24BDAC760];
  if (v11)
  {
    v31 = 0;
    v13 = RXReplaceHyphensWithSpace(a4, &v31);
    if (v31 >= 1)
    {
      v14 = v13;
      v15 = (RXXPC *)RXLanguageModelCreate(0, 0, 0);
      v16 = (RXXPC *)RXLanguageObjectAddPhraseAndAlternatives(a1, v15, a3, v14, a5);
      v17 = RXXPC::Queue(v16);
      block = v12;
      v33 = 0x40000000;
      v34 = __RXLanguageObjectAddObject_block_invoke;
      v35 = &__block_descriptor_tmp_51;
      v36 = a2;
      v37 = v15;
      dispatch_sync(v17, &block);
      CFRelease(v15);
      a2 = v15;
    }
  }
  v18 = (const __CFString *)MEMORY[0x2207B863C](a5);
  if (RXIsLocaleWithNoSpaceInPostITN(v18))
    v20 = RXLanguageObjectCharacterTokenize(a4, v19);
  else
    v20 = RXLanguageObjectCFTokenizerTokenize(a4, a5);
  v21 = v20;
  Count = CFArrayGetCount(v20);
  if (Count >= 1)
  {
    v23 = Count;
    for (i = 0; i != v23; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v21, i);
      v26 = (RXXPC *)RXWordCreate(a1, a3, ValueAtIndex, 0);
      v27 = RXXPC::Queue(v26);
      block = v12;
      v33 = 0x40000000;
      v34 = __RXLanguageObjectAddObject_block_invoke;
      v35 = &__block_descriptor_tmp_51;
      v36 = v9;
      v37 = v26;
      dispatch_sync(v27, &block);
      CFRelease(v26);
    }
  }
  CFRelease(v21);
  v29 = RXXPC::Queue(v28);
  block = v12;
  v33 = 0x40000000;
  v34 = __RXLanguageObjectAddObject_block_invoke;
  v35 = &__block_descriptor_tmp_51;
  v36 = a2;
  v37 = v9;
  dispatch_sync(v29, &block);
  CFRelease(v9);
}

void RXResultDesc::RXResultDesc(RXResultDesc *this, RXRecognizer *a2, uint64_t a3)
{
  *(_QWORD *)this = 1;
  *((_QWORD *)this + 1) = a3;
  *((_QWORD *)this + 2) = a2;
  CFRetain((char *)a2 - 16);
}

void RXResultDesc::~RXResultDesc(RXResultDesc *this)
{
  RXRecognizer::ReleaseResult(*((RXRecognizer **)this + 2), *((_QWORD *)this + 1));
  CFRelease((CFTypeRef)(*((_QWORD *)this + 2) - 16));
}

_QWORD *CreateCppStringFromCFString@<X0>(const __CFString *a1@<X0>, _QWORD *a2@<X8>)
{
  CFIndex Length;
  uint64_t v5;
  char *v6;
  CFIndex v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return std::string::basic_string[abi:ne180100]<0>(a2, 0);
  Length = CFStringGetLength(a1);
  CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v9 - v5;
  CFStringGetCString(a1, (char *)v9 - v5, v7, 0x8000100u);
  return std::string::basic_string[abi:ne180100]<0>(a2, v6);
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void ___ZL25RXGetLegitimateCharactersv_block_invoke()
{
  const __CFCharacterSet *Predefined;
  __CFCharacterSet *MutableCopy;
  const __CFCharacterSet *v2;

  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  MutableCopy = CFCharacterSetCreateMutableCopy(0, Predefined);
  v2 = CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  CFCharacterSetUnion(MutableCopy, v2);
  CFCharacterSetInvert(MutableCopy);
  CFCharacterSetAddCharactersInString(MutableCopy, CFSTR("&"));
  RXGetLegitimateCharacters(void)::sLegitChars = (uint64_t)MutableCopy;
}

uint64_t ___ZL35RXLanguageObjectCFTokenizerTokenizePK10__CFStringPK10__CFLocale_block_invoke()
{
  return pthread_mutex_init(&RXLanguageObjectCFTokenizerTokenize(__CFString const*,__CFLocale const*)::sMutexAroundSharedCFStringTokenizer, 0);
}

CFMutableDictionaryRef ___ZL40WordBoundaryUnitStringTokenizerForLocalePK10__CFLocale_block_invoke()
{
  CFMutableDictionaryRef result;

  result = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  WordBoundaryUnitStringTokenizerForLocale(__CFLocale const*)::sStringTokenizerForLocaleIdentifierTable = (uint64_t)result;
  return result;
}

const void **RXCFProp<__CFArray const*>::~RXCFProp(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

_QWORD *RXProp<RXVocabulary *>::~RXProp(_QWORD *a1)
{
  if (*a1)
    CFRelease((CFTypeRef)(*a1 - 16));
  return a1;
}

uint64_t RXTransaction<RXLanguageObject>::~RXTransaction(uint64_t a1)
{
  RXRecognitionSystem::CommitChanges(*(RXRecognitionSystem **)(*(_QWORD *)a1 + 16));
  return a1;
}

RXXPC *RXXPC::CreateInstance(RXXPC *this, int64_t a2)
{
  __CFString *v4;
  const __CFString *v5;
  xpc_object_t v6;
  const char *v7;
  const __CFString *v8;
  const __CFString *v9;
  RXXPC *v10;

  v4 = (__CFString *)MEMORY[0x2207B863C]();
  if (RXEngineTypeForLocaleIdentifier(v4) != 1)
  {
    v4 = (__CFString *)RDCopyBestNashvilleLocaleIdentifier(v4);
    if (!v4)
      goto LABEL_4;
LABEL_7:
    v10 = (RXXPC *)operator new();
    RXXPC::RXXPC(v10, v4, a2);
    return v10;
  }
  if (RXXPC::RDIsQuasarModelLanguageInstalledForLocaleIdentifier((RXXPC *)v4, v5))
  {
    a2 |= 0x400000uLL;
    if (v4)
      goto LABEL_7;
  }
LABEL_4:
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v6, kRDKeyMessage, 502);
  v7 = kRDKeyLocale;
  v8 = (const __CFString *)MEMORY[0x2207B863C](this);
  RXXPC::SerializeCFString((RXXPC *)v6, v7, v8, v9);
  v10 = (RXXPC *)RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v6, (void *)1);
  xpc_release(v6);
  if (v10)
  {
    xpc_release(v10);
    return 0;
  }
  return v10;
}

void sub_21EBF202C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2207B89E4](v1, 0x1060C40C4633D05);
  _Unwind_Resume(a1);
}

BOOL RXXPC::RDIsQuasarModelLanguageInstalledForLocaleIdentifier(RXXPC *this, const __CFString *a2)
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  CFIndex Count;
  const void **v6;
  const void **v7;
  uint64_t v8;
  CFMutableStringRef Mutable;
  const __CFURL *v10;
  const __CFURL *v11;
  __CFBundle *v12;
  __CFBundle *v13;
  const __CFDictionary *ValueForInfoDictionaryKey;
  _BOOL8 v15;

  v3 = (const __CFDictionary *)RXXPC::CopyLanguageInstallationStatus(this);
  if (!v3)
  {
LABEL_8:
    Mutable = CFStringCreateMutable(0, 0);
    CFStringAppend(Mutable, CFSTR("/System/Library/Speech/Recognizers/SpeechRecognitionCoreLanguages/"));
    CFStringAppend(Mutable, (CFStringRef)this);
    CFStringAppend(Mutable, CFSTR(".SpeechRecognition"));
    if (!Mutable)
      return 0;
    v10 = CFURLCreateWithFileSystemPath(0, Mutable, kCFURLPOSIXPathStyle, 1u);
    if (v10)
    {
      v11 = v10;
      v12 = CFBundleCreate(0, v10);
      if (v12)
      {
        v13 = v12;
        ValueForInfoDictionaryKey = (const __CFDictionary *)CFBundleGetValueForInfoDictionaryKey(v12, CFSTR("RXConfig"));
        if (ValueForInfoDictionaryKey)
          v15 = CFDictionaryContainsKey(ValueForInfoDictionaryKey, CFSTR("QuasarConfig")) != 0;
        else
          v15 = 0;
        CFRelease(v13);
      }
      else
      {
        v15 = 0;
      }
      CFRelease(v11);
    }
    else
    {
      v15 = 0;
    }
    CFRelease(Mutable);
    return v15;
  }
  v4 = v3;
  Count = CFDictionaryGetCount(v3);
  v6 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
  v7 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
  CFDictionaryGetKeysAndValues(v4, v6, v7);
  if (Count < 1)
  {
LABEL_7:
    CFRelease(v4);
    free(v6);
    free(v7);
    goto LABEL_8;
  }
  v8 = 0;
  while (!RDDoLocaleIdentifiersMatch((CFLocaleIdentifier)this, (const __CFString *)v6[v8])
       || !CFStringHasPrefix((CFStringRef)v7[v8], CFSTR("Version:")))
  {
    if (Count == ++v8)
      goto LABEL_7;
  }
  CFRelease(v4);
  free(v6);
  free(v7);
  return 1;
}

xpc_object_t RXXPC::CreateMessage(RXXPC *this)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, kRDKeyMessage, (int64_t)this);
  return v2;
}

void RXXPC::SerializeCFString(RXXPC *this, const char *a2, CFStringRef theString, const __CFString *a4)
{
  const char *CStringPtr;
  CFIndex Length;
  CFIndex v9;
  char *v10;

  if (theString)
  {
    CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
    if (!CStringPtr)
    {
      Length = CFStringGetLength(theString);
      v9 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
      v10 = (char *)operator new[]();
      CFStringGetCString(theString, v10, v9, 0x8000100u);
      xpc_dictionary_set_string(this, a2, v10);
      JUMPOUT(0x2207B89CCLL);
    }
    xpc_dictionary_set_string(this, a2, CStringPtr);
  }
}

xpc_object_t RXXPC::SendBrokerMessageWithReplySync(RXXPC *this, void *a2)
{
  int v2;
  void *v4;
  NSObject *v5;
  xpc_object_t v6;
  void *v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v2 = (int)a2;
  v12 = *MEMORY[0x24BDAC8D0];
  if (RXXPC::SendBrokerMessageWithReplySync(void *,BOOL)::sRXXBrokerInit != -1)
    dispatch_once(&RXXPC::SendBrokerMessageWithReplySync(void *,BOOL)::sRXXBrokerInit, &__block_literal_global_10);
  v4 = (void *)MEMORY[0x2207B8CB4](this);
  if (RXLogClientUpdates())
  {
    v5 = RXOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = v4;
      _os_log_impl(&dword_21EBE7000, v5, OS_LOG_TYPE_INFO, "Broker <- %s", (uint8_t *)&v10, 0xCu);
    }
  }
  free(v4);
  if (v2)
  {
    v6 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)RXXPC::SendBrokerMessageWithReplySync(void *,BOOL)::sRXXBrokerConn, this);
    v7 = (void *)MEMORY[0x2207B8CB4]();
    if (RXLogClientUpdates())
    {
      v8 = RXOSLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = 136315138;
        v11 = v7;
        _os_log_impl(&dword_21EBE7000, v8, OS_LOG_TYPE_INFO, "Broker -> %s", (uint8_t *)&v10, 0xCu);
      }
    }
    free(v7);
  }
  else
  {
    xpc_connection_send_message((xpc_connection_t)RXXPC::SendBrokerMessageWithReplySync(void *,BOOL)::sRXXBrokerConn, this);
    return 0;
  }
  return v6;
}

uint64_t RXXPC::Queue(RXXPC *this)
{
  if (RXXPC::Queue(void)::sRXXGlobalQueueInit != -1)
    dispatch_once(&RXXPC::Queue(void)::sRXXGlobalQueueInit, &__block_literal_global_2);
  return RXXPC::Queue(void)::sRXXGlobalQueue;
}

dispatch_queue_t ___ZN5RXXPC5QueueEv_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("RXXPCGlobal", 0);
  RXXPC::Queue(void)::sRXXGlobalQueue = (uint64_t)result;
  return result;
}

void RXXPC::RXXPC(RXXPC *this, const __CFString *a2, uint64_t a3)
{
  *(_BYTE *)this = (a3 & 3) == 0;
  *(_WORD *)((char *)this + 1) = 0;
  *((_BYTE *)this + 3) = 0;
  *((_QWORD *)this + 1) = a3;
  *((_QWORD *)this + 2) = a2;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  if (pthread_mutex_init((pthread_mutex_t *)this + 2, 0))
    __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXXPC.cpp", 81, (uint64_t)"err == 0", CFSTR("Could not initialize the server mutex"));
  if (pthread_cond_init((pthread_cond_t *)this + 4, 0))
    __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXXPC.cpp", 84, (uint64_t)"err == 0", CFSTR("Could not initialize the server condition variable"));
  if (pthread_mutex_init((pthread_mutex_t *)this + 1, 0))
    __RXAbort(1, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SpeechRecognitionCore/Sources/RXXPC.cpp", 87, (uint64_t)"err == 0", CFSTR("Could not initialize the content mutex"));
  *((_QWORD *)this + 6) = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
}

void RXXPC::SetAudioDevice(RXXPC *this, AudioObjectID inObjectID)
{
  AudioObjectID v2;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  NSObject *v8;
  CFTypeRef cf;
  UInt32 ioDataSize;
  AudioObjectPropertyAddress inAddress;
  AudioObjectID outData;
  uint8_t buf[4];
  AudioObjectID v14;
  uint64_t v15;

  v2 = inObjectID;
  v15 = *MEMORY[0x24BDAC8D0];
  outData = inObjectID;
  if (inObjectID)
  {
LABEL_2:
    ioDataSize = 8;
    cf = 0;
    *(_QWORD *)&inAddress.mSelector = *(_QWORD *)" diubolg";
    inAddress.mElement = 0;
    if (AudioObjectGetPropertyData(v2, &inAddress, 0, 0, &ioDataSize, &cf))
    {
      v4 = RXOSLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v14 = outData;
        v5 = "Unable to obtain device UID for audio input device %d\n";
        v6 = v4;
        v7 = 8;
LABEL_8:
        _os_log_impl(&dword_21EBE7000, v6, OS_LOG_TYPE_ERROR, v5, buf, v7);
        return;
      }
    }
    else
    {
      RXXPC::SetAudioDevice(this, cf);
    }
    return;
  }
  LODWORD(cf) = 4;
  *(_QWORD *)&inAddress.mSelector = *(_QWORD *)" nIdbolg";
  inAddress.mElement = 0;
  if (!AudioObjectGetPropertyData(1u, &inAddress, 0, 0, (UInt32 *)&cf, &outData))
  {
    v2 = outData;
    goto LABEL_2;
  }
  v8 = RXOSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v5 = "Unable to obtain default input device\n";
    v6 = v8;
    v7 = 2;
    goto LABEL_8;
  }
}

void RXXPC::SetAudioDevice(RXXPC *this, CFTypeRef cf)
{
  const void *v4;

  if (cf)
    CFRetain(cf);
  v4 = (const void *)*((_QWORD *)this + 3);
  if (v4)
    CFRelease(v4);
  *((_QWORD *)this + 3) = cf;
}

{
  CFTypeID v4;
  CFTypeID v5;
  uint64_t valuePtr;

  v4 = CFGetTypeID(cf);
  if (v4 == CFStringGetTypeID())
  {
    RXXPC::SetAudioDevice(this, cf);
  }
  else
  {
    v5 = CFGetTypeID(cf);
    if (v5 == CFNumberGetTypeID())
    {
      valuePtr = 0;
      if (CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt64Type, &valuePtr))
        RXXPC::SetAudioDevice(this, valuePtr);
    }
  }
}

void ___ZN5RXXPC30SendBrokerMessageWithReplySyncEPvb_block_invoke()
{
  NSObject *global_queue;

  global_queue = dispatch_get_global_queue(0, 0);
  RXXPC::SendBrokerMessageWithReplySync(void *,BOOL)::sRXXBrokerConn = (uint64_t)xpc_connection_create("com.apple.SpeechRecognitionCore.brokerd", global_queue);
  xpc_connection_set_event_handler((xpc_connection_t)RXXPC::SendBrokerMessageWithReplySync(void *,BOOL)::sRXXBrokerConn, &__block_literal_global_14);
  xpc_connection_resume((xpc_connection_t)RXXPC::SendBrokerMessageWithReplySync(void *,BOOL)::sRXXBrokerConn);
}

void ___ZN5RXXPC30SendBrokerMessageWithReplySyncEPvb_block_invoke_2(uint64_t a1, RXRecognitionSystem *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x2207B8CB4](a2);
  if (RXLogClientUpdates())
  {
    v4 = RXOSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = v3;
      _os_log_impl(&dword_21EBE7000, v4, OS_LOG_TYPE_INFO, "Broker -> %s", (uint8_t *)&v6, 0xCu);
    }
  }
  free(v3);
  RXRecognitionSystem::BrokerEvent(a2, v5);
}

void RXXPC::EstablishConnection(RXXPC *this)
{
  xpc_object_t v2;
  const __CFString *v3;
  void *v4;
  xpc_object_t v5;
  uint64_t v6;
  uint64_t v7;
  _xpc_connection_s *connection;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  xpc_object_t v15;
  xpc_object_t v16;
  _QWORD handler[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, kRDKeyMessage, 101);
  xpc_dictionary_set_uint64(v2, kRDKeyObjectID, (uint64_t)this);
  xpc_dictionary_set_BOOL(v2, kRDKeyLiveAudio, *(_BYTE *)this);
  if (*(_BYTE *)this && *((_QWORD *)this + 3))
  {
    v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v2, kRDKeyAudioDevice, v4);
    xpc_release(v4);
  }
  RXXPC::SerializeCFString((RXXPC *)v2, kRDKeyLocale, *((CFStringRef *)this + 2), v3);
  xpc_dictionary_set_uint64(v2, kRDKeyOptions, *((_QWORD *)this + 1));
  v5 = RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v2, (void *)1);
  v6 = MEMORY[0x2207B8D68]();
  v7 = MEMORY[0x24BDACFA0];
  if (v6 == MEMORY[0x24BDACFA0])
  {
    v9 = MEMORY[0x24BDAC760];
    while (1)
    {
      connection = xpc_dictionary_create_connection(v5, kRDKeyConnection);
      *((_QWORD *)this + 5) = xpc_dictionary_get_uint64(v5, kRDKeyObjectID);
      handler[0] = v9;
      handler[1] = 0x40000000;
      handler[2] = ___ZN5RXXPC19EstablishConnectionEv_block_invoke;
      handler[3] = &__block_descriptor_tmp_15;
      handler[4] = this;
      xpc_connection_set_event_handler(connection, handler);
      xpc_release(v5);
      xpc_connection_resume(connection);
      v5 = xpc_connection_send_message_with_reply_sync(connection, v2);
      if (MEMORY[0x2207B8D68]() == v7)
        break;
      v5 = RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v2, (void *)1);
      if (MEMORY[0x2207B8D68]() != v7)
        goto LABEL_9;
    }
    v10 = RXOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "broker connection to daemon succedded";
      goto LABEL_11;
    }
  }
  else
  {
    connection = 0;
LABEL_9:
    v10 = RXOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v11 = "broker connection to daemon failed";
LABEL_11:
      _os_log_impl(&dword_21EBE7000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
    }
  }
  if (MEMORY[0x2207B8D68](v5) == v7)
  {
    v12 = (void *)MEMORY[0x2207B8CB4](v2);
    v13 = (void *)MEMORY[0x2207B8CB4](v5);
    v14 = RXOSLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v19 = v12;
      v20 = 2080;
      v21 = v13;
      _os_log_impl(&dword_21EBE7000, v14, OS_LOG_TYPE_INFO, "Hello %s -> %s\n", buf, 0x16u);
    }
    free(v12);
    free(v13);
    pthread_mutex_lock((pthread_mutex_t *)this + 1);
    if (*((_BYTE *)this + 2))
    {
      xpc_connection_cancel(connection);
      xpc_release(connection);
    }
    else
    {
      *((_QWORD *)this + 4) = connection;
    }
    pthread_mutex_unlock((pthread_mutex_t *)this + 1);
    xpc_release(v5);
    RXDebugFlagsUpdate();
    if (RXLogClientUpdates())
    {
      v15 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v15, kRDKeyMessage, 911);
      RXXPC::SendMessage(this, v15, 0);
      xpc_release(v15);
    }
    v16 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v16, kRDKeyMessage, 105);
    RXXPC::SendMessage(this, v16, 1);
    xpc_release(v16);
  }
  else
  {
    pthread_mutex_lock((pthread_mutex_t *)this + 1);
    *((_QWORD *)this + 4) = 0;
    *((_BYTE *)this + 2) = 1;
    pthread_mutex_unlock((pthread_mutex_t *)this + 1);
  }
  xpc_release(v2);
}

void ___ZN5RXXPC19EstablishConnectionEv_block_invoke(uint64_t a1, void *a2)
{
  RXXPC::ClientEvent(*(pthread_mutex_t **)(a1 + 32), a2);
}

void RXXPC::ClientEvent(pthread_mutex_t *this, void *a2)
{
  uint64_t v4;
  int64_t int64;
  NSObject *global_queue;
  _QWORD *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  _QWORD v11[5];
  _QWORD block[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  uint8_t buf[16];

  v4 = MEMORY[0x2207B8D68](a2);
  if (v4 != MEMORY[0x24BDACFB8])
  {
    if (v4 != MEMORY[0x24BDACFA0])
      RXXPC::ClientEvent();
    int64 = xpc_dictionary_get_int64(a2, kRDKeyMessage);
    if (int64 > 204)
    {
      if (int64 == 205)
      {
        xpc_retain(a2);
        if (RXXPC::Queue(void)::sRXXGlobalQueueInit != -1)
          dispatch_once(&RXXPC::Queue(void)::sRXXGlobalQueueInit, &__block_literal_global_2);
        global_queue = RXXPC::Queue(void)::sRXXGlobalQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 0x40000000;
        block[2] = ___ZN5RXXPC11ClientEventEPv_block_invoke_5;
        block[3] = &__block_descriptor_tmp_22;
        block[4] = a2;
        v7 = block;
      }
      else
      {
        if (int64 != 601)
          return;
        xpc_retain(a2);
        if (RXXPC::Queue(void)::sRXXGlobalQueueInit != -1)
          dispatch_once(&RXXPC::Queue(void)::sRXXGlobalQueueInit, &__block_literal_global_2);
        global_queue = RXXPC::Queue(void)::sRXXGlobalQueue;
        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 0x40000000;
        v11[2] = ___ZN5RXXPC11ClientEventEPv_block_invoke_6;
        v11[3] = &__block_descriptor_tmp_23_0;
        v11[4] = a2;
        v7 = v11;
      }
    }
    else if (int64 == 200)
    {
      xpc_retain(a2);
      if (RXXPC::Queue(void)::sRXXGlobalQueueInit != -1)
        dispatch_once(&RXXPC::Queue(void)::sRXXGlobalQueueInit, &__block_literal_global_2);
      global_queue = RXXPC::Queue(void)::sRXXGlobalQueue;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 0x40000000;
      v13[2] = ___ZN5RXXPC11ClientEventEPv_block_invoke_4;
      v13[3] = &__block_descriptor_tmp_21_0;
      v13[4] = a2;
      v7 = v13;
    }
    else
    {
      if (int64 != 204)
        return;
      global_queue = dispatch_get_global_queue(2, 0);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 0x40000000;
      v14[2] = ___ZN5RXXPC11ClientEventEPv_block_invoke_3;
      v14[3] = &__block_descriptor_tmp_20;
      v14[4] = this;
      v7 = v14;
    }
    goto LABEL_28;
  }
  if (a2 == (void *)MEMORY[0x24BDACF38])
  {
    v9 = RXOSLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      return;
    *(_WORD *)buf = 0;
    v10 = "client received XPC_ERROR_CONNECTION_INVALID";
LABEL_32:
    _os_log_impl(&dword_21EBE7000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
    return;
  }
  if (a2 != (void *)MEMORY[0x24BDACF48])
  {
    if (a2 != (void *)MEMORY[0x24BDACF30])
      return;
    v8 = RXOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EBE7000, v8, OS_LOG_TYPE_ERROR, "client received XPC_ERROR_CONNECTION_INTERRUPTED", buf, 2u);
    }
    pthread_mutex_lock(this + 1);
    if (*(_QWORD *)&this->__opaque[24])
      BYTE3(this->__sig) = 1;
    pthread_mutex_unlock(this + 1);
    global_queue = dispatch_get_global_queue(2, 0);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 0x40000000;
    v15[2] = ___ZN5RXXPC11ClientEventEPv_block_invoke;
    v15[3] = &__block_descriptor_tmp_17;
    v15[4] = this;
    v7 = v15;
LABEL_28:
    dispatch_async(global_queue, v7);
    return;
  }
  v9 = RXOSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v10 = "client received XPC_ERROR_TERMINATION_IMMINENT";
    goto LABEL_32;
  }
}

uint64_t RXXPC::SendMessage(RXXPC *this, void *a2, int a3)
{
  pthread_mutex_t *v6;
  _xpc_connection_s *v7;
  NSObject *global_queue;

  v6 = (pthread_mutex_t *)((char *)this + 64);
  pthread_mutex_lock((pthread_mutex_t *)this + 1);
  v7 = (_xpc_connection_s *)*((_QWORD *)this + 4);
  if (a3)
  {
    if (v7 && !*((_BYTE *)this + 3))
    {
      global_queue = dispatch_get_global_queue(0, 0);
      xpc_connection_send_message_with_reply(v7, a2, global_queue, &__block_literal_global_25);
    }
  }
  else if (v7 && !*((_BYTE *)this + 3))
  {
    xpc_connection_send_message(*((xpc_connection_t *)this + 4), a2);
  }
  return pthread_mutex_unlock(v6);
}

void ___ZN5RXXPC11ClientEventEPv_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _xpc_connection_s *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  pthread_mutex_lock((pthread_mutex_t *)(v1 + 128));
  pthread_mutex_lock((pthread_mutex_t *)(v1 + 64));
  v2 = *(_xpc_connection_s **)(v1 + 32);
  if (v2)
  {
    xpc_connection_cancel(v2);
    xpc_release(*(xpc_object_t *)(v1 + 32));
    *(_QWORD *)(v1 + 32) = 0;
    *(_BYTE *)(v1 + 3) = 0;
    *(_WORD *)(v1 + 1) = 256;
    pthread_mutex_unlock((pthread_mutex_t *)(v1 + 64));
    pthread_cond_broadcast((pthread_cond_t *)(v1 + 192));
    pthread_mutex_unlock((pthread_mutex_t *)(v1 + 128));
    if (RXXPC::Queue(void)::sRXXGlobalQueueInit != -1)
      dispatch_once(&RXXPC::Queue(void)::sRXXGlobalQueueInit, &__block_literal_global_2);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___ZN5RXXPC11ClientEventEPv_block_invoke_2;
    block[3] = &__block_descriptor_tmp_16;
    block[4] = v1;
    dispatch_async((dispatch_queue_t)RXXPC::Queue(void)::sRXXGlobalQueue, block);
  }
  else
  {
    *(_BYTE *)(v1 + 1) = 0;
    pthread_mutex_unlock((pthread_mutex_t *)(v1 + 64));
    pthread_cond_broadcast((pthread_cond_t *)(v1 + 192));
    pthread_mutex_unlock((pthread_mutex_t *)(v1 + 128));
  }
}

uint64_t ___ZN5RXXPC11ClientEventEPv_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v4;
  CFIndex i;
  void (**ValueAtIndex)(const void *, uint64_t, _QWORD);

  v1 = *(_QWORD *)(a1 + 32);
  pthread_mutex_lock((pthread_mutex_t *)(v1 + 64));
  v2 = *(const __CFArray **)(v1 + 48);
  if (v2)
  {
    Count = CFArrayGetCount(v2);
    if (Count >= 1)
    {
      v4 = Count;
      for (i = 0; i != v4; ++i)
      {
        ValueAtIndex = (void (**)(const void *, uint64_t, _QWORD))CFArrayGetValueAtIndex(*(CFArrayRef *)(v1 + 48), i);
        ValueAtIndex[2](ValueAtIndex, 1, v1);
      }
    }
  }
  return pthread_mutex_unlock((pthread_mutex_t *)(v1 + 64));
}

uint64_t ___ZN5RXXPC11ClientEventEPv_block_invoke_3(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  pthread_mutex_lock((pthread_mutex_t *)(v1 + 128));
  *(_BYTE *)(v1 + 1) = 1;
  pthread_cond_broadcast((pthread_cond_t *)(v1 + 192));
  return pthread_mutex_unlock((pthread_mutex_t *)(v1 + 128));
}

void ___ZN5RXXPC11ClientEventEPv_block_invoke_4(uint64_t a1)
{
  RXRecognizer *value;
  void *v3;

  value = (RXRecognizer *)xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), kRDKeyRecognizer);
  RXRecognizer::Recognized(value, v3);
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

void ___ZN5RXXPC11ClientEventEPv_block_invoke_5(uint64_t a1, void *a2)
{
  RXRecognitionSystem::Callback(*(RXRecognitionSystem **)(a1 + 32), a2);
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

void ___ZN5RXXPC11ClientEventEPv_block_invoke_6(uint64_t a1, void *a2)
{
  RXXPC::DownloadCallback(*(RXXPC **)(a1 + 32), a2);
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

void RXXPC::DownloadCallback(RXXPC *this, void *a2)
{
  uint64_t v2;
  const void *v3;

  if (xpc_dictionary_get_value(this, kRDKeyDownloadStatus) && MEMORY[0x2207B8D68]() == MEMORY[0x24BDACFA0])
  {
    v2 = _CFXPCCreateCFObjectFromXPCObject();
    if (v2)
    {
      v3 = (const void *)v2;
      (*(void (**)(uint64_t, uint64_t))(RXXPC::sDownloadCB + 16))(RXXPC::sDownloadCB, v2);
      CFRelease(v3);
    }
  }
}

BOOL RXXPC::WaitForServer(RXXPC *this)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = (pthread_mutex_t *)((char *)this + 128);
  pthread_mutex_lock((pthread_mutex_t *)this + 2);
  pthread_mutex_lock((pthread_mutex_t *)this + 1);
  if (*((_BYTE *)this + 3))
  {
    pthread_mutex_unlock((pthread_mutex_t *)this + 1);
  }
  else
  {
    v3 = *((_QWORD *)this + 4);
    *((_BYTE *)this + 2) = 0;
    pthread_mutex_unlock((pthread_mutex_t *)this + 1);
    if (!v3)
      RXXPC::EstablishConnection(this);
    if (*((_BYTE *)this + 1))
    {
LABEL_6:
      if (!*((_BYTE *)this + 2))
      {
LABEL_13:
        v4 = *((_BYTE *)this + 3) == 0;
        goto LABEL_8;
      }
    }
    else
    {
      while (!*((_BYTE *)this + 2))
      {
        if (*((_BYTE *)this + 3))
          goto LABEL_13;
        pthread_cond_wait((pthread_cond_t *)this + 4, v2);
        if (*((_BYTE *)this + 1))
          goto LABEL_6;
      }
    }
  }
  v4 = 0;
LABEL_8:
  pthread_mutex_unlock(v2);
  return v4;
}

void RXXPC::~RXXPC(RXXPC *this)
{
  pthread_mutex_t *v2;
  xpc_object_t v3;
  xpc_object_t v4;
  const void *v5;
  const void *v6;

  v2 = (pthread_mutex_t *)((char *)this + 64);
  pthread_mutex_lock((pthread_mutex_t *)this + 1);
  if (*((_QWORD *)this + 4))
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v3, kRDKeyMessage, 503);
    xpc_dictionary_set_uint64(v3, kRDKeyObjectID, *((_QWORD *)this + 5));
    v4 = RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v3, (void *)1);
    xpc_release(v3);
    xpc_release(v4);
    xpc_connection_cancel(*((xpc_connection_t *)this + 4));
    xpc_release(*((xpc_object_t *)this + 4));
    *((_QWORD *)this + 4) = 0;
  }
  v5 = (const void *)*((_QWORD *)this + 6);
  if (v5)
  {
    CFRelease(v5);
    *((_QWORD *)this + 6) = 0;
  }
  pthread_mutex_unlock(v2);
  CFRelease(*((CFTypeRef *)this + 2));
  v6 = (const void *)*((_QWORD *)this + 3);
  if (v6)
    CFRelease(v6);
}

uint64_t RXXPC::StartChanges(uint64_t this)
{
  ++*(_QWORD *)(this + 56);
  return this;
}

void RXXPC::CommitChanges(RXXPC *this, void *a2, void *a3)
{
  _BOOL4 v6;
  xpc_object_t v7;

  if (RXXPC::WaitForServer(this))
  {
    v6 = a3 && xpc_array_get_count(a3) != 0;
    if (xpc_array_get_count(a2) || v6)
    {
      v7 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v7, kRDKeyMessage, 100);
      xpc_dictionary_set_uint64(v7, kRDKeyEpoch, *((_QWORD *)this + 7));
      if (xpc_array_get_count(a2))
        xpc_dictionary_set_value(v7, kRDKeyObjects, a2);
      if (v6)
        xpc_dictionary_set_value(v7, kRDKeyDead, a3);
      RXXPC::SendMessage(this, v7, 0);
      xpc_release(v7);
    }
  }
}

xpc_object_t RXXPC::SendMessageWithReplySync(pthread_mutex_t *this, void *a2)
{
  pthread_mutex_t *v4;
  _xpc_connection_s *v5;
  xpc_object_t v6;

  v4 = this + 1;
  pthread_mutex_lock(this + 1);
  v5 = *(_xpc_connection_s **)&this->__opaque[24];
  if (v5 && !BYTE3(this->__sig))
    v6 = xpc_connection_send_message_with_reply_sync(v5, a2);
  else
    v6 = 0;
  pthread_mutex_unlock(v4);
  return v6;
}

uint64_t RXXPC::AddHandler(uint64_t a1, const void *a2)
{
  pthread_mutex_t *v4;
  __CFArray *v5;

  v4 = (pthread_mutex_t *)(a1 + 64);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 64));
  v5 = *(__CFArray **)(a1 + 48);
  if (v5)
    CFArrayAppendValue(v5, a2);
  return pthread_mutex_unlock(v4);
}

uint64_t RXXPC::RemoveHandler(uint64_t a1, const void *a2)
{
  pthread_mutex_t *v4;
  const __CFArray *v5;
  CFIndex FirstIndexOfValue;
  CFRange v8;

  v4 = (pthread_mutex_t *)(a1 + 64);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 64));
  v5 = *(const __CFArray **)(a1 + 48);
  if (v5)
  {
    v8.length = CFArrayGetCount(v5);
    v8.location = 0;
    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(*(CFArrayRef *)(a1 + 48), v8, a2);
    if (FirstIndexOfValue != -1)
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 48), FirstIndexOfValue);
  }
  return pthread_mutex_unlock(v4);
}

void RXXPC::SerializeCFArray(RXXPC *this, const char *a2, const __CFArray *a3, const __CFArray *a4)
{
  xpc_object_t empty;
  CFIndex v8;
  const __CFString *ValueAtIndex;
  const __CFString *v10;
  const char *CStringPtr;
  char *v12;
  CFIndex Length;
  CFIndex v14;
  xpc_object_t v15;

  if (a3)
  {
    empty = xpc_array_create_empty();
    if (CFArrayGetCount(a3) >= 1)
    {
      v8 = 0;
      do
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a3, v8);
        if (ValueAtIndex)
        {
          v10 = ValueAtIndex;
          CStringPtr = CFStringGetCStringPtr(ValueAtIndex, 0x8000100u);
          v12 = (char *)CStringPtr;
          if (!CStringPtr)
          {
            Length = CFStringGetLength(v10);
            v14 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
            v12 = (char *)operator new[]();
            CFStringGetCString(v10, v12, v14, 0x8000100u);
          }
          v15 = xpc_string_create(v12);
          xpc_array_append_value(empty, v15);
          if (!CStringPtr)
            MEMORY[0x2207B89CC](v12, 0x1000C8077774924);
        }
        ++v8;
      }
      while (CFArrayGetCount(a3) > v8);
    }
    xpc_dictionary_set_value(this, a2, empty);
  }
}

void RXXPC::SerializeURL(RXXPC *this, void *a2, const __CFURL *a3)
{
  const __CFData *v4;
  const __CFData *v5;
  const char *v6;
  const UInt8 *BytePtr;
  size_t Length;

  v4 = (const __CFData *)MEMORY[0x2207B88AC](0, a2, 0, 0, 0, 0);
  if (v4)
  {
    v5 = v4;
    v6 = kRDKeyURL;
    BytePtr = CFDataGetBytePtr(v4);
    Length = CFDataGetLength(v5);
    xpc_dictionary_set_data(this, v6, BytePtr, Length);
    CFRelease(v5);
  }
}

uint64_t RXXPC::CopyLanguageInstallationStatus(RXXPC *this)
{
  xpc_object_t v1;
  xpc_object_t v2;
  uint64_t v3;

  v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v1, kRDKeyMessage, 504);
  v2 = RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v1, (void *)1);
  xpc_release(v1);
  if (!v2)
    return 0;
  if (MEMORY[0x2207B8D68](v2) == MEMORY[0x24BDACFA0] && xpc_dictionary_get_value(v2, kRDKeyAssetStatus))
    v3 = _CFXPCCreateCFObjectFromXPCObject();
  else
    v3 = 0;
  xpc_release(v2);
  return v3;
}

void RXXPC::StartInstallationForLanguage(const __CFString *this, const __CFString *a2)
{
  xpc_object_t v3;
  const __CFString *v4;
  xpc_object_t v5;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, kRDKeyMessage, 505);
  RXXPC::SerializeCFString((RXXPC *)v3, kRDKeyLocale, this, v4);
  v5 = RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v3, (void *)1);
  xpc_release(v3);
  if (v5)
    xpc_release(v5);
}

void RXXPC::SetNonPurgeabilityForLanguages(RXXPC *this, const __CFArray *a2)
{
  xpc_object_t v3;
  const __CFArray *v4;
  xpc_object_t v5;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, kRDKeyMessage, 511);
  RXXPC::SerializeCFArray((RXXPC *)v3, kRDKeyLocales, this, v4);
  v5 = RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v3, (void *)1);
  xpc_release(v3);
  if (v5)
    xpc_release(v5);
}

uint64_t RXXPC::CopyInstalledAssetPathForLanguage(const __CFString *this, const __CFString *a2)
{
  xpc_object_t v3;
  const __CFString *v4;
  xpc_object_t v5;
  uint64_t v6;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, kRDKeyMessage, 509);
  RXXPC::SerializeCFString((RXXPC *)v3, kRDKeyLocale, this, v4);
  v5 = RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v3, (void *)1);
  xpc_release(v3);
  if (!v5)
    return 0;
  if (MEMORY[0x2207B8D68](v5) == MEMORY[0x24BDACFA0])
  {
    xpc_dictionary_get_value(v5, kRDKeyInstalledAssetPath);
    v6 = _CFXPCCreateCFObjectFromXPCObject();
  }
  else
  {
    v6 = 0;
  }
  xpc_release(v5);
  return v6;
}

uint64_t RXXPC::CopyInstalledAssetSupportedTasksForLanguage(RXXPC *this, const __CFString *a2)
{
  xpc_object_t v3;
  const __CFString *v4;
  xpc_object_t v5;
  uint64_t v6;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, kRDKeyMessage, 510);
  RXXPC::SerializeCFString((RXXPC *)v3, kRDKeyLocale, a2, v4);
  v5 = RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v3, (void *)1);
  xpc_release(v3);
  if (!v5)
    return 0;
  if (MEMORY[0x2207B8D68](v5) == MEMORY[0x24BDACFA0])
  {
    xpc_dictionary_get_value(v5, kRDKeyInstalledAssetSupportedTasks);
    v6 = _CFXPCCreateCFObjectFromXPCObject();
  }
  else
  {
    v6 = 0;
  }
  xpc_release(v5);
  return v6;
}

void RXXPC::CancelInstallationForLanguage(const __CFString *this, const __CFString *a2)
{
  xpc_object_t v3;
  const __CFString *v4;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, kRDKeyMessage, 508);
  RXXPC::SerializeCFString((RXXPC *)v3, kRDKeyLocale, this, v4);
  RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v3, (void *)1);
  xpc_release(v3);
}

int64_t RXXPC::PurgeInstalledAssets(RXXPC *this)
{
  xpc_object_t v1;
  xpc_object_t v2;
  int64_t int64;

  v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v1, kRDKeyMessage, 506);
  v2 = RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v1, (void *)1);
  xpc_release(v1);
  if (!v2)
    return 0;
  if (MEMORY[0x2207B8D68](v2) == MEMORY[0x24BDACFD0])
    int64 = xpc_dictionary_get_int64(v2, kRDKeyAssetStatus);
  else
    int64 = 0;
  xpc_release(v2);
  return int64;
}

void RXXPC::SetDownloadCallback(const void *a1)
{
  xpc_object_t v2;

  RXXPC::sDownloadCB = (uint64_t)_Block_copy(a1);
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, kRDKeyMessage, 507);
  xpc_dictionary_set_BOOL(v2, kRDKeyDownloadProgress, a1 != 0);
  RXXPC::SendBrokerMessageWithReplySync((RXXPC *)v2, 0);
  xpc_release(v2);
}

CFStringRef RDCopyModelPath(void)
{
  const __CFArray *v0;
  const __CFURL *ValueAtIndex;
  CFStringRef v2;
  CFStringRef v3;

  v0 = (const __CFArray *)CFCopySearchPathForDirectoriesInDomains();
  ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v0, 0);
  v2 = CFURLCopyFileSystemPath(ValueAtIndex, kCFURLPOSIXPathStyle);
  v3 = CFStringCreateWithFormat(0, 0, CFSTR("%@/Speech/Recognizers/SpeechRecognitionCoreLanguages"), v2);
  CFRelease(v2);
  CFRelease(v0);
  return v3;
}

const __CFURL *RDCopyCacheURL(void)
{
  const __CFArray *v0;
  const __CFURL *ValueAtIndex;
  const __CFURL *v2;
  const __CFString *v3;
  const __CFString *v4;
  DIR *v5;
  NSObject *v7;
  int v8;
  const __CFURL *v9;
  char buffer[2000];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = (const __CFArray *)CFCopySearchPathForDirectoriesInDomains();
  ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v0, 0);
  v2 = CFURLCreateCopyAppendingPathComponent(0, ValueAtIndex, CFSTR("com.apple.SpeechRecognitionCore"), 1u);
  CFRelease(v0);
  v3 = CFURLCopyPath(v2);
  if (v3)
  {
    v4 = v3;
    CFStringGetCString(v3, buffer, 2000, 0x8000100u);
    v5 = opendir(buffer);
    if (v5)
    {
      closedir(v5);
    }
    else if (mkdir(buffer, 0x1EDu))
    {
      v7 = RXOSLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = 138412290;
        v9 = v2;
        _os_log_impl(&dword_21EBE7000, v7, OS_LOG_TYPE_ERROR, "Error creating %@", (uint8_t *)&v8, 0xCu);
      }
    }
    CFRelease(v4);
  }
  return v2;
}

const __CFDictionary *RDCopyInfoDict(CFURLRef url)
{
  const __CFURL *v1;

  v1 = CFURLCreateCopyAppendingPathComponent(0, url, CFSTR("Info.plist"), 0);
  return RDCopyInfoDictWithInfoURL(v1);
}

const __CFDictionary *RDCopyInfoDictWithInfoURL(CFURLRef fileURL)
{
  __CFReadStream *v2;
  __CFReadStream *v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  const __CFString *Value;
  CFErrorRef error;

  if (!fileURL)
    return 0;
  v2 = CFReadStreamCreateWithFile(0, fileURL);
  if (v2)
  {
    v3 = v2;
    CFReadStreamOpen(v2);
    error = 0;
    v4 = (const __CFDictionary *)CFPropertyListCreateWithStream(0, v3, 0, 0, 0, &error);
    v5 = v4;
    if (v4)
    {
      Value = (const __CFString *)CFDictionaryGetValue(v4, CFSTR("CFBundleShortVersionString"));
      if (CFStringGetCharacterAtIndex(Value, 0) <= 0x31u)
      {
        CFRelease(v5);
        v5 = 0;
      }
    }
    CFReadStreamClose(v3);
    CFRelease(v3);
  }
  else
  {
    v5 = 0;
  }
  CFRelease(fileURL);
  return v5;
}

const void *RDCopyCacheVersion(const __CFString *a1)
{
  const __CFURL *v1;
  const __CFURL *v2;
  const __CFURL *v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  const void *Value;
  const void *v7;
  void **v8;
  void *__p[2];
  char v11;
  stat v12;

  v1 = RDCopyLanguageCacheURL(a1);
  if (v1)
  {
    v2 = v1;
    v3 = CFURLCreateCopyAppendingPathComponent(0, v1, CFSTR("Info.plist"), 0);
    v4 = RDCopyInfoDictWithInfoURL(v3);
    if (v4)
    {
      v5 = v4;
      Value = CFDictionaryGetValue(v4, CFSTR("CFBundleShortVersionString"));
      if (Value)
      {
        v7 = Value;
        CFRetain(Value);
        CFRelease(v5);
LABEL_15:
        CFRelease(v2);
        return v7;
      }
      CFRelease(v5);
    }
    RDURL::RDURL((RDURL *)__p, v2, 0);
    if (v11 >= 0)
      v8 = __p;
    else
      v8 = (void **)__p[0];
    if (stat((const char *)v8, &v12))
      v7 = 0;
    else
      v7 = (const void *)*MEMORY[0x24BDBD270];
    if (v11 < 0)
      operator delete(__p[0]);
    goto LABEL_15;
  }
  return 0;
}

void sub_21EBF4270(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

CFURLRef RDCopyLanguageCacheURL(const __CFString *a1)
{
  CFStringRef v1;
  const __CFString *v2;
  const __CFURL *v3;
  const __CFURL *v4;
  const __CFURL *v5;
  const __CFURL *v6;
  CFURLRef v7;

  v1 = RDCopyBestNashvilleLocaleIdentifier(a1);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = RDCopyCacheURL();
  if (v3)
  {
    v4 = v3;
    v5 = CFURLCreateCopyAppendingPathComponent(0, v3, CFSTR("Users"), 1u);
    if (v5)
    {
      v6 = v5;
      v7 = CFURLCreateCopyAppendingPathComponent(0, v5, v2, 1u);
      CFRelease(v6);
    }
    else
    {
      v7 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v2);
  return v7;
}

void RDNukeCache(const __CFString *a1)
{
  const __CFURL *v1;
  void **v2;
  const __CFURL *v3;
  void *__p[2];
  char v5;

  if (a1)
  {
    v1 = RDCopyLanguageCacheURL(a1);
    if (!v1)
      return;
    RDURL::RDURL((RDURL *)__p, v1, 1);
    if (v5 >= 0)
      v2 = __p;
    else
      v2 = (void **)__p[0];
  }
  else
  {
    v3 = RDCopyCacheURL();
    if (!v3)
      return;
    RDURL::RDURL((RDURL *)__p, v3, 1);
    if (v5 >= 0)
      v2 = __p;
    else
      v2 = (void **)__p[0];
  }
  removefile((const char *)v2, 0, 1u);
  if (v5 < 0)
    operator delete(__p[0]);
}

void sub_21EBF43DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

__CFSet *RDCopyNashvilleModelLanguages(void)
{
  const __CFString *v0;
  void **v1;
  DIR *v2;
  CFMutableSetRef Mutable;
  __CFSet *v4;
  BOOL v5;
  dirent *v6;
  std::string::value_type *d_name;
  char *v8;
  char *v9;
  size_t v10;
  std::string *v11;
  void **v12;
  std::string *v13;
  __int128 v14;
  BOOL v15;
  CFStringRef v16;
  char *v17;
  CFStringRef v18;
  std::string v20;
  std::string __p;
  void *v22[2];
  unsigned __int8 v23;

  v0 = RDCopyModelPath();
  RDString::RDString((RDString *)v22, v0, 1);
  if ((v23 & 0x80u) == 0)
    v1 = v22;
  else
    v1 = (void **)v22[0];
  v2 = opendir((const char *)v1);
  Mutable = CFSetCreateMutable(0, 0, MEMORY[0x24BDBD6B8]);
  v4 = Mutable;
  if (v2)
    v5 = Mutable == 0;
  else
    v5 = 1;
  if (!v5)
  {
    while (1)
    {
      while (1)
      {
        do
        {
          v6 = readdir(v2);
          if (!v6)
          {
            closedir(v2);
            goto LABEL_30;
          }
          d_name = v6->d_name;
          v8 = strstr(v6->d_name, ".SpeechRecognition");
        }
        while (!v8);
        v9 = v8;
        if ((v23 & 0x80u) == 0)
          v10 = v23;
        else
          v10 = (size_t)v22[1];
        std::string::basic_string[abi:ne180100]((uint64_t)&v20, v10 + 1);
        if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v11 = &v20;
        else
          v11 = (std::string *)v20.__r_.__value_.__r.__words[0];
        if (v10)
        {
          if ((v23 & 0x80u) == 0)
            v12 = v22;
          else
            v12 = (void **)v22[0];
          memmove(v11, v12, v10);
        }
        *(_WORD *)((char *)&v11->__r_.__value_.__l.__data_ + v10) = 47;
        v13 = std::string::append(&v20, d_name);
        v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
        __p.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v14;
        v13->__r_.__value_.__l.__size_ = 0;
        v13->__r_.__value_.__r.__words[2] = 0;
        v13->__r_.__value_.__r.__words[0] = 0;
        v15 = CheckLocale(&__p);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
          break;
        if (v15)
          goto LABEL_27;
      }
      operator delete(v20.__r_.__value_.__l.__data_);
      if (v15)
      {
LABEL_27:
        v16 = CFStringCreateWithBytes(0, (const UInt8 *)d_name, v9 - d_name, 0x8000100u, 0);
        CFSetAddValue(v4, v16);
        CFRelease(v16);
        v17 = strchr(d_name, 95);
        if (v17)
        {
          v18 = CFStringCreateWithBytes(0, (const UInt8 *)d_name, v17 - d_name, 0x8000100u, 0);
          CFSetAddValue(v4, v18);
          CFRelease(v18);
        }
      }
    }
  }
LABEL_30:
  if ((char)v23 < 0)
    operator delete(v22[0]);
  return v4;
}

void sub_21EBF4614(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL CheckLocale(std::string *a1)
{
  std::string *v1;
  const char *v2;
  _BOOL8 v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFURL *v6;
  const __CFDictionary *v7;
  stat v9;

  v1 = a1;
  std::string::append(a1, "/Contents/Info.plist");
  v2 = (const char *)v1;
  if (SHIBYTE(v1->__r_.__value_.__r.__words[2]) < 0)
    v2 = (const char *)v1->__r_.__value_.__r.__words[0];
  if (stat(v2, &v9))
    return 0;
  if (SHIBYTE(v1->__r_.__value_.__r.__words[2]) < 0)
    v1 = (std::string *)v1->__r_.__value_.__r.__words[0];
  v4 = CFStringCreateWithCStringNoCopy(0, (const char *)v1, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = CFURLCreateWithFileSystemPath(0, v4, kCFURLPOSIXPathStyle, 0);
  v7 = RDCopyInfoDictWithInfoURL(v6);
  v3 = v7 != 0;
  if (v7)
    CFRelease(v7);
  CFRelease(v5);
  return v3;
}

CFStringRef RDCopyBestNashvilleLocaleIdentifier(CFStringRef theString)
{
  const __CFString *v1;
  std::string *v2;
  const std::string::value_type *v3;
  std::string::size_type v4;
  std::string *v5;
  __int128 v6;
  _BOOL4 v7;
  std::string::size_type v8;
  char *v9;
  std::string *v10;
  const std::string::value_type *v11;
  std::string::size_type v12;
  std::string *v13;
  __int128 v14;
  _BOOL4 v15;
  std::string *v16;
  std::string::size_type size;
  unsigned __int8 *v18;
  std::string *v19;
  uint64_t v20;
  char *v21;
  const std::string::value_type *v22;
  std::string::size_type v23;
  std::string *v24;
  __int128 v25;
  _BOOL4 v26;
  std::string *v27;
  const char *v28;
  std::string::size_type v29;
  const std::string::value_type *v30;
  std::string::size_type v31;
  std::string *v32;
  __int128 v33;
  _BOOL4 v34;
  const char *v35;
  DIR *v36;
  dirent *v37;
  const std::string::value_type *d_name;
  int64_t v39;
  int v40;
  std::string *p_s1;
  std::string *v42;
  void **v43;
  int64_t v44;
  char *v45;
  int v46;
  std::string *v47;
  int64_t v48;
  char *v49;
  char *v50;
  std::string::size_type v51;
  unint64_t v52;
  std::string *v53;
  size_t v54;
  size_t v56;
  std::string *v57;
  const void **v58;
  std::string *v59;
  __int128 v60;
  BOOL v61;
  std::string *p_cStr;
  CFStringRef v63;
  std::string::size_type v65;
  std::string v66;
  std::string v67;
  std::string cStr;
  std::string v69;
  std::string v70;
  std::string __s1;
  std::string __p;
  std::string v73;
  std::string v74;
  std::string v75;
  std::string v76;
  void **v77;
  std::string::size_type v78;
  unsigned __int8 v79;
  const void *v80[2];
  unsigned __int8 v81;

  RDString::RDString((RDString *)&v66, theString, 0);
  v67 = v66;
  memset(&v66, 0, sizeof(v66));
  v1 = RDCopyModelPath();
  if (!v1)
  {
    std::string::basic_string[abi:ne180100]<0>(&cStr, "");
    goto LABEL_169;
  }
  RDString::RDString((RDString *)v80, v1, 1);
  std::string::push_back(v2, 47);
  std::string::basic_string[abi:ne180100]<0>(&v77, ".SpeechRecognition");
  std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v80, (const void **)&v67.__r_.__value_.__l.__data_, (uint64_t)&v75);
  if ((v79 & 0x80u) == 0)
    v3 = (const std::string::value_type *)&v77;
  else
    v3 = (const std::string::value_type *)v77;
  if ((v79 & 0x80u) == 0)
    v4 = v79;
  else
    v4 = v78;
  v5 = std::string::append(&v75, v3, v4);
  v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  v76.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v76.__r_.__value_.__l.__data_ = v6;
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  v7 = CheckLocale(&v76);
  if (SHIBYTE(v76.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v76.__r_.__value_.__l.__data_);
  if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v75.__r_.__value_.__l.__data_);
    if (v7)
      goto LABEL_59;
  }
  else if (v7)
  {
    goto LABEL_59;
  }
  v8 = std::string::find(&v67, 46, 0);
  if (v8 != -1)
  {
    v9 = (char *)&v67 + HIBYTE(v67.__r_.__value_.__r.__words[2]);
    if ((v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      v10 = &v67;
    }
    else
    {
      v9 = (char *)(v67.__r_.__value_.__r.__words[0] + v67.__r_.__value_.__l.__size_);
      v10 = (std::string *)v67.__r_.__value_.__r.__words[0];
    }
    std::string::erase(&v67, v8, v9 - ((char *)v10 + v8));
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v80, (const void **)&v67.__r_.__value_.__l.__data_, (uint64_t)&v74);
    if ((v79 & 0x80u) == 0)
      v11 = (const std::string::value_type *)&v77;
    else
      v11 = (const std::string::value_type *)v77;
    if ((v79 & 0x80u) == 0)
      v12 = v79;
    else
      v12 = v78;
    v13 = std::string::append(&v74, v11, v12);
    v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v75.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v75.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    v15 = CheckLocale(&v75);
    if (SHIBYTE(v75.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v75.__r_.__value_.__l.__data_);
    if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v74.__r_.__value_.__l.__data_);
      if (v15)
        goto LABEL_59;
    }
    else if (v15)
    {
      goto LABEL_59;
    }
  }
  if ((v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v16 = &v67;
  else
    v16 = (std::string *)v67.__r_.__value_.__r.__words[0];
  if ((v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v67.__r_.__value_.__r.__words[2]);
  else
    size = v67.__r_.__value_.__l.__size_;
  if (size)
  {
    v18 = (unsigned __int8 *)v16 + size;
    v19 = v16;
LABEL_39:
    v20 = 0;
    while (v19->__r_.__value_.__s.__data_[0] != asc_21EBF724C[v20])
    {
      if (++v20 == 2)
      {
        v19 = (std::string *)((char *)v19 + 1);
        if (v19 == (std::string *)v18)
          goto LABEL_60;
        goto LABEL_39;
      }
    }
    if (v19 != (std::string *)v18 && (char *)v19 - (char *)v16 != -1)
    {
      v21 = (char *)&v67 + HIBYTE(v67.__r_.__value_.__r.__words[2]);
      if ((v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v21 = (char *)(v67.__r_.__value_.__r.__words[0] + v67.__r_.__value_.__l.__size_);
      std::string::erase(&v67, (char *)v19 - (char *)v16, v21 - (char *)v19);
      std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v80, (const void **)&v67.__r_.__value_.__l.__data_, (uint64_t)&v73);
      if ((v79 & 0x80u) == 0)
        v22 = (const std::string::value_type *)&v77;
      else
        v22 = (const std::string::value_type *)v77;
      if ((v79 & 0x80u) == 0)
        v23 = v79;
      else
        v23 = v78;
      v24 = std::string::append(&v73, v22, v23);
      v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
      v74.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v74.__r_.__value_.__l.__data_ = v25;
      v24->__r_.__value_.__l.__size_ = 0;
      v24->__r_.__value_.__r.__words[2] = 0;
      v24->__r_.__value_.__r.__words[0] = 0;
      v26 = CheckLocale(&v74);
      if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v74.__r_.__value_.__l.__data_);
      if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v73.__r_.__value_.__l.__data_);
      if (v26)
      {
LABEL_59:
        cStr = v67;
        memset(&v67, 0, sizeof(v67));
        goto LABEL_165;
      }
    }
  }
LABEL_60:
  std::string::basic_string[abi:ne180100]<0>(&v73, "");
  if ((SHIBYTE(v67.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) != 2)
      goto LABEL_76;
    if (LOWORD(v67.__r_.__value_.__l.__data_) != 28261)
    {
      if (LOWORD(v67.__r_.__value_.__l.__data_) != 29286)
      {
        if (LOWORD(v67.__r_.__value_.__l.__data_) != 29541)
        {
          v27 = &v67;
          goto LABEL_70;
        }
LABEL_74:
        v28 = "es_US";
        goto LABEL_75;
      }
LABEL_73:
      v28 = "fr_FR";
      goto LABEL_75;
    }
LABEL_72:
    v28 = "en_US";
    goto LABEL_75;
  }
  if (v67.__r_.__value_.__l.__size_ != 2)
    goto LABEL_76;
  v27 = (std::string *)v67.__r_.__value_.__r.__words[0];
  switch(*(_WORD *)v67.__r_.__value_.__l.__data_)
  {
    case 0x6E65:
      goto LABEL_72;
    case 0x7266:
      goto LABEL_73;
    case 0x7365:
      goto LABEL_74;
  }
LABEL_70:
  if (LOWORD(v27->__r_.__value_.__l.__data_) == 25956)
  {
    v28 = "de_DE";
LABEL_75:
    MEMORY[0x2207B8990](&v73, v28);
  }
LABEL_76:
  v29 = HIBYTE(v73.__r_.__value_.__r.__words[2]);
  if ((v73.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v29 = v73.__r_.__value_.__l.__size_;
  if (v29)
  {
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v80, (const void **)&v73.__r_.__value_.__l.__data_, (uint64_t)&__s1);
    if ((v79 & 0x80u) == 0)
      v30 = (const std::string::value_type *)&v77;
    else
      v30 = (const std::string::value_type *)v77;
    if ((v79 & 0x80u) == 0)
      v31 = v79;
    else
      v31 = v78;
    v32 = std::string::append(&__s1, v30, v31);
    v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
    __p.__r_.__value_.__r.__words[2] = v32->__r_.__value_.__r.__words[2];
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v33;
    v32->__r_.__value_.__l.__size_ = 0;
    v32->__r_.__value_.__r.__words[2] = 0;
    v32->__r_.__value_.__r.__words[0] = 0;
    v34 = CheckLocale(&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(__s1.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__s1.__r_.__value_.__l.__data_);
      if (v34)
        goto LABEL_89;
    }
    else if (v34)
    {
LABEL_89:
      cStr = v73;
      memset(&v73, 0, sizeof(v73));
      goto LABEL_163;
    }
  }
  if ((v81 & 0x80u) == 0)
    v35 = (const char *)v80;
  else
    v35 = (const char *)v80[0];
  v36 = opendir(v35);
  if (!v36)
  {
LABEL_162:
    std::string::basic_string[abi:ne180100]<0>(&cStr, "");
    goto LABEL_163;
  }
  while (1)
  {
    v37 = readdir(v36);
    if (!v37)
    {
      closedir(v36);
      goto LABEL_162;
    }
    d_name = v37->d_name;
    std::string::basic_string[abi:ne180100]<0>(&__s1, v37->d_name);
    v39 = HIBYTE(__s1.__r_.__value_.__r.__words[2]);
    v40 = SHIBYTE(__s1.__r_.__value_.__r.__words[2]);
    p_s1 = (std::string *)__s1.__r_.__value_.__r.__words[0];
    v42 = (__s1.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &__s1
        : (std::string *)__s1.__r_.__value_.__r.__words[0];
    v43 = (v79 & 0x80u) == 0 ? (void **)&v77 : v77;
    v44 = (v79 & 0x80u) == 0 ? v79 : v78;
    if (!v44)
      goto LABEL_140;
    if ((__s1.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v39 = __s1.__r_.__value_.__l.__size_;
    if (v39 >= v44)
    {
      v45 = (char *)v42 + v39;
      v46 = *(char *)v43;
      v47 = v42;
      while (1)
      {
        v48 = v39 - v44;
        if (v48 == -1)
          goto LABEL_159;
        v49 = (char *)memchr(v47, v46, v48 + 1);
        if (!v49)
          goto LABEL_159;
        v50 = v49;
        if (!memcmp(v49, v43, v44))
          break;
        v47 = (std::string *)(v50 + 1);
        v39 = v45 - (v50 + 1);
        if (v39 < v44)
          goto LABEL_159;
      }
      if (v50 != v45 && v50 - (char *)v42 != -1)
      {
LABEL_140:
        v51 = (v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? HIBYTE(v67.__r_.__value_.__r.__words[2])
            : v67.__r_.__value_.__l.__size_;
        if (v40 < 0)
        {
          if (v51 == -1)
LABEL_186:
            std::string::__throw_out_of_range[abi:ne180100]();
          v52 = __s1.__r_.__value_.__l.__size_ >= 2 ? 2 : __s1.__r_.__value_.__l.__size_;
        }
        else
        {
          if (v51 == -1)
            goto LABEL_186;
          v52 = (v40 & 0xFE) != 0 ? 2 : v40;
          p_s1 = &__s1;
        }
        v53 = (v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
            ? &v67
            : (std::string *)v67.__r_.__value_.__r.__words[0];
        v54 = v52 >= v51 ? v51 : v52;
        if (!memcmp(p_s1, v53, v54) && v52 == v51)
          break;
      }
    }
LABEL_159:
    if ((v40 & 0x80) != 0)
      operator delete(__s1.__r_.__value_.__l.__data_);
  }
  if ((v81 & 0x80u) == 0)
    v56 = v81;
  else
    v56 = (size_t)v80[1];
  std::string::basic_string[abi:ne180100]((uint64_t)&v69, v56 + 1);
  if ((v69.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v57 = &v69;
  else
    v57 = (std::string *)v69.__r_.__value_.__r.__words[0];
  if (v56)
  {
    if ((v81 & 0x80u) == 0)
      v58 = v80;
    else
      v58 = (const void **)v80[0];
    memmove(v57, v58, v56);
  }
  *(_WORD *)((char *)&v57->__r_.__value_.__l.__data_ + v56) = 47;
  v59 = std::string::append(&v69, d_name);
  v60 = *(_OWORD *)&v59->__r_.__value_.__l.__data_;
  v70.__r_.__value_.__r.__words[2] = v59->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v70.__r_.__value_.__l.__data_ = v60;
  v59->__r_.__value_.__l.__size_ = 0;
  v59->__r_.__value_.__r.__words[2] = 0;
  v59->__r_.__value_.__r.__words[0] = 0;
  v61 = CheckLocale(&v70);
  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v70.__r_.__value_.__l.__data_);
  if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v69.__r_.__value_.__l.__data_);
  if (!v61)
  {
    LOBYTE(v40) = *((_BYTE *)&__s1.__r_.__value_.__s + 23);
    goto LABEL_159;
  }
  closedir(v36);
  v65 = std::string::find[abi:ne180100]((uint64_t *)&__s1, (char *)&v77, 0);
  std::string::basic_string(&cStr, &__s1, 0, v65, (std::allocator<char> *)&v69);
  if (SHIBYTE(__s1.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s1.__r_.__value_.__l.__data_);
LABEL_163:
  if (SHIBYTE(v73.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v73.__r_.__value_.__l.__data_);
LABEL_165:
  if ((char)v79 < 0)
    operator delete(v77);
  if ((char)v81 < 0)
    operator delete((void *)v80[0]);
LABEL_169:
  if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v67.__r_.__value_.__l.__data_);
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v66.__r_.__value_.__l.__data_);
  if (SHIBYTE(cStr.__r_.__value_.__r.__words[2]) < 0)
  {
    if (cStr.__r_.__value_.__l.__size_)
    {
      p_cStr = (std::string *)cStr.__r_.__value_.__r.__words[0];
LABEL_178:
      v63 = CFStringCreateWithCString(0, (const char *)p_cStr, 0x8000100u);
      if ((SHIBYTE(cStr.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        return v63;
    }
    else
    {
      v63 = 0;
    }
    operator delete(cStr.__r_.__value_.__l.__data_);
    return v63;
  }
  if (*((_BYTE *)&cStr.__r_.__value_.__s + 23))
  {
    p_cStr = &cStr;
    goto LABEL_178;
  }
  return 0;
}

void sub_21EBF4F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,uint64_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,void *__p,uint64_t a45,int a46,__int16 a47,char a48,char a49)
{
  uint64_t v49;

  if (a49 < 0)
    operator delete(__p);
  if (a43 < 0)
    operator delete(a38);
  if (*(char *)(v49 - 129) < 0)
    operator delete(*(void **)(v49 - 152));
  if (*(char *)(v49 - 105) < 0)
    operator delete(*(void **)(v49 - 128));
  if (a21 < 0)
    operator delete(a16);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(a1);
}

uint64_t RDDoLocaleIdentifiersMatch(CFLocaleIdentifier localeIdentifier, const __CFString *a2)
{
  const __CFLocale *v3;
  CFLocaleRef v4;
  const __CFLocale *v5;
  const __CFString *v6;
  const __CFString *Value;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  BOOL v12;
  const __CFString *v13;
  uint64_t v14;
  BOOL v16;

  v3 = CFLocaleCreate(0, localeIdentifier);
  v4 = CFLocaleCreate(0, a2);
  if (v3)
  {
    v5 = v4;
    if (!v4)
    {
      v14 = 0;
      goto LABEL_12;
    }
    v6 = (const __CFString *)*MEMORY[0x24BDBD418];
    Value = (const __CFString *)CFLocaleGetValue(v3, (CFLocaleKey)*MEMORY[0x24BDBD418]);
    v8 = (const __CFString *)*MEMORY[0x24BDBD3D8];
    v9 = (const __CFString *)CFLocaleGetValue(v3, (CFLocaleKey)*MEMORY[0x24BDBD3D8]);
    v10 = (const __CFString *)CFLocaleGetValue(v5, v6);
    v11 = (const __CFString *)CFLocaleGetValue(v5, v8);
    if (Value)
      v12 = v10 == 0;
    else
      v12 = 1;
    if (v12)
      goto LABEL_8;
    v13 = v11;
    if (CFStringCompare(Value, v10, 0))
      goto LABEL_8;
    if (v9)
      v16 = v13 == 0;
    else
      v16 = 1;
    if (v16)
    {
      if (!((unint64_t)v9 | (unint64_t)v13))
        goto LABEL_22;
    }
    else if (CFStringCompare(v9, v13, 0) == kCFCompareEqualTo)
    {
LABEL_22:
      v14 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v14 = 0;
LABEL_9:
    CFRelease(v5);
LABEL_12:
    CFRelease(v3);
    return v14;
  }
  return 0;
}

void RDString::RDString(RDString *this, CFStringRef theString, int a3)
{
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  char *v8;
  const char *v9;
  size_t v10;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  if (theString)
  {
    if (CFStringGetCStringPtr(theString, 0x8000100u))
    {
      MEMORY[0x2207B8990](this);
    }
    else
    {
      Length = CFStringGetLength(theString);
      MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      std::string::resize((std::string *)this, MaximumSizeForEncoding + 2, 0);
      v8 = (char *)this;
      if (*((char *)this + 23) < 0)
        v8 = *(char **)this;
      CFStringGetCString(theString, v8, MaximumSizeForEncoding + 1, 0x8000100u);
      v9 = (const char *)this;
      if (*((char *)this + 23) < 0)
        v9 = *(const char **)this;
      v10 = strlen(v9);
      std::string::resize((std::string *)this, v10, 0);
    }
    if (a3)
      CFRelease(theString);
  }
}

void sub_21EBF52D4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void RDInt::RDInt(RDInt *this, CFNumberRef number, int a3)
{
  if (number)
  {
    CFNumberGetValue(number, kCFNumberIntType, this);
    if (a3)
      CFRelease(number);
  }
  else
  {
    *(_DWORD *)this = 0;
  }
}

void RDURL::RDURL(RDURL *this, CFURLRef anURL, int a3)
{
  const __CFString *v6;

  if (anURL)
  {
    v6 = CFURLCopyFileSystemPath(anURL, kCFURLPOSIXPathStyle);
    RDString::RDString(this, v6, 1);
    if (a3)
      CFRelease(anURL);
  }
  else
  {
    *(_QWORD *)this = 0;
    *((_QWORD *)this + 1) = 0;
    *((_QWORD *)this + 2) = 0;
  }
}

void sub_21EBF53BC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

std::string *RDURL::DirName(std::string *this)
{
  std::string *result;

  result = (std::string *)std::string::rfind(this, 47, 0xFFFFFFFFFFFFFFFFLL);
  if (result != (std::string *)-1)
    return std::string::erase(this, (std::string::size_type)result, 0xFFFFFFFFFFFFFFFFLL);
  return result;
}

uint64_t std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>@<X0>(const void **a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  size_t v5;
  size_t v6;
  uint64_t result;
  char *v8;
  const void *v9;
  char *v10;
  const void *v11;

  if (*((char *)a1 + 23) >= 0)
    v5 = *((unsigned __int8 *)a1 + 23);
  else
    v5 = (size_t)a1[1];
  if (*((char *)a2 + 23) >= 0)
    v6 = *((unsigned __int8 *)a2 + 23);
  else
    v6 = (size_t)a2[1];
  result = std::string::basic_string[abi:ne180100](a3, v6 + v5);
  if (*(char *)(result + 23) >= 0)
    v8 = (char *)result;
  else
    v8 = *(char **)result;
  if (v5)
  {
    if (*((char *)a1 + 23) >= 0)
      v9 = a1;
    else
      v9 = *a1;
    result = (uint64_t)memmove(v8, v9, v5);
  }
  v10 = &v8[v5];
  if (v6)
  {
    if (*((char *)a2 + 23) >= 0)
      v11 = a2;
    else
      v11 = *a2;
    result = (uint64_t)memmove(v10, v11, v6);
  }
  v10[v6] = 0;
  return result;
}

uint64_t std::string::find[abi:ne180100](uint64_t *a1, char *a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  int v5;
  char *v6;
  int64_t v7;
  void *v8;
  char *v9;
  int64_t v10;
  char *v11;
  int v13;
  uint64_t v14;
  char *v15;

  v3 = (uint64_t)a1;
  if (*((char *)a1 + 23) < 0)
  {
    v3 = *a1;
    v4 = a1[1];
  }
  else
  {
    v4 = *((unsigned __int8 *)a1 + 23);
  }
  v5 = a2[23];
  if (v5 >= 0)
    v6 = a2;
  else
    v6 = *(char **)a2;
  if (v5 >= 0)
    v7 = a2[23];
  else
    v7 = *((_QWORD *)a2 + 1);
  if (v4 < a3)
    return -1;
  if (v7)
  {
    v8 = (void *)(v3 + a3);
    v9 = (char *)(v3 + v4);
    v10 = v4 - a3;
    if (v10 >= v7)
    {
      v13 = *v6;
      do
      {
        v14 = v10 - v7;
        if (v14 == -1)
          break;
        v15 = (char *)memchr(v8, v13, v14 + 1);
        if (!v15)
          break;
        v11 = v15;
        if (!memcmp(v15, v6, v7))
          goto LABEL_15;
        v8 = v11 + 1;
        v10 = v9 - (v11 + 1);
      }
      while (v10 >= v7);
    }
    v11 = v9;
LABEL_15:
    if (v11 == v9)
      return -1;
    else
      return (uint64_t)&v11[-v3];
  }
  return a3;
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a2 > 0x16)
  {
    v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17)
      v4 = a2 | 7;
    v5 = v4 + 1;
    v6 = operator new(v4 + 1);
    *(_QWORD *)(a1 + 8) = a2;
    *(_QWORD *)(a1 + 16) = v5 | 0x8000000000000000;
    *(_QWORD *)a1 = v6;
  }
  else
  {
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    *(_BYTE *)(a1 + 23) = a2;
  }
  return a1;
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
  std::__throw_out_of_range[abi:ne180100]("basic_string");
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24E355500, MEMORY[0x24BEDAB00]);
}

void sub_21EBF5694(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

void RXXPC::ClientEvent()
{
  __assert_rtn("ClientEvent", "RXXPC.cpp", 332, "type == XPC_TYPE_DICTIONARY");
}

OSStatus AudioObjectGetPropertyData(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 *ioDataSize, void *outData)
{
  return MEMORY[0x24BDBAF38](*(_QWORD *)&inObjectID, inAddress, *(_QWORD *)&inQualifierDataSize, inQualifierData, ioDataSize, outData);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x24BDBB7C0](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB7E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB810](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB838](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB898](theArray, idx, value);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x24BDBBA98](allocator, bundleURL);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x24BDBBAA8](bundleID);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDBBAE0](bundle, key);
}

void CFCharacterSetAddCharactersInString(CFMutableCharacterSetRef theSet, CFStringRef theString)
{
  MEMORY[0x24BDBBBE8](theSet, theString);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFMutableCharacterSetRef)MEMORY[0x24BDBBC08](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x24BDBBC20](theSetIdentifier);
}

void CFCharacterSetInvert(CFMutableCharacterSetRef theSet)
{
  MEMORY[0x24BDBBC28](theSet);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x24BDBBC30](theSet, theChar);
}

void CFCharacterSetUnion(CFMutableCharacterSetRef theSet, CFCharacterSetRef theOtherSet)
{
  MEMORY[0x24BDBBC50](theSet, theOtherSet);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x24BDBBC58](cf);
}

uint64_t CFCopySearchPathForDirectoriesInDomains()
{
  return MEMORY[0x24BDBBC70]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEE8](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF48](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x24BDBBF58](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x24BDBBF78](locale);
}

CFTypeID CFLocaleGetTypeID(void)
{
  return MEMORY[0x24BDBBF90]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x24BDBBF98](locale, key);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1F0](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x24BDBC218](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x24BDBC230](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x24BDBC258](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x24BDBC3F8](theSet);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
  MEMORY[0x24BDBC418](theSet, values);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
  MEMORY[0x24BDBC4B8](theString, chars, numChars);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x24BDBC528](alloc, theString, *(_QWORD *)&encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC578](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x24BDBC5A0](alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC5D8](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x24BDBC5E0](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x24BDBC618](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x24BDBC620](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x24BDBC628](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x24BDBC6A8](theString, prefix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x24BDBC6C8](theString, locale);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x24BDBC6F8](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x24BDBC710](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x24BDBC718](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
  MEMORY[0x24BDBC728](tokenizer, string, range.location, range.length);
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x24BDBC748](theString, locale);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x24BDBC798](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x24BDBC7A8](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7B8](anURL);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x24BDBC7C0](url);
}

CFDataRef CFURLCreateBookmarkData(CFAllocatorRef allocator, CFURLRef url, CFURLBookmarkCreationOptions options, CFArrayRef resourcePropertiesToInclude, CFURLRef relativeToURL, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC7F0](allocator, url, options, resourcePropertiesToInclude, relativeToURL, error);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC7F8](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

uint64_t _AXSAudioDonationSiriImprovementEnabled()
{
  return MEMORY[0x24BED20A8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x24BDBD148]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x24BEDA9B0](this, __c, __pos);
}

std::string::size_type std::string::rfind(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x24BEDA9B8](this, __c, __pos);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC20](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x24BEDACE8](this, __str, __pos, __n, __a);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24E355520();
}

void operator delete(void *__p)
{
  off_24E355528(__p);
}

uint64_t operator delete()
{
  return off_24E355530();
}

uint64_t operator new[]()
{
  return off_24E355538();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24E355540(__sz);
}

uint64_t operator new()
{
  return off_24E355548();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x24BDAD288](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x24BDAD2A0](a1, *(_QWORD *)&a2);
}

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7C8](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x24BDAFA88](a1);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x24BDAFB40](path, state, *(_QWORD *)&flags);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

int8_t u_charType(UChar32 c)
{
  return MEMORY[0x24BEDBF50](*(_QWORD *)&c);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x24BDB0638](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0648]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x24BDB0688](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
  MEMORY[0x24BDB06C8](xarray, index, value);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x24BDB0730](name, targetq);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x24BDB0880](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x24BDB0888](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_connection_t xpc_dictionary_create_connection(xpc_object_t xdict, const char *key)
{
  return (xpc_connection_t)MEMORY[0x24BDB08C8](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

