uint64_t TelephonyBasebandAddFreqListExt(uint64_t a1, unsigned int a2, char *a3, uint64_t a4)
{
  return TelephonyBasebandControllerAddFreqListExt((mach_port_t *)(a1 + 16), a2, a3, a4);
}

uint64_t TelephonyBasebandRemoveFreqListExt(uint64_t a1, unsigned int a2, char *a3, uint64_t a4)
{
  return TelephonyBasebandControllerRemoveFreqListExt((unsigned int *)(a1 + 16), a2, a3, a4);
}

uint64_t TelephonyBasebandControllerRemoveFreqListExt(unsigned int *a1, unsigned int a2, char *a3, uint64_t a4)
{
  uint64_t v8;
  int v9;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  _TelephonyUtilDebugPrint();
  input[1] = a4;
  if (!a2)
    return 0;
  v8 = a2;
  if (a2 < 9)
  {
    v9 = 1;
  }
  else
  {
    v9 = 1;
    do
    {
      v8 -= 8;
      input[0] = 8;
      v9 &= _TelephonyBasebandControllerCallMethodGeneric(a1, 0x22u, (int)"Remove frequency list", input, 2u, a3, 0x80uLL, 0, 0, 0, 0, 1);
      a3 += 128;
    }
    while (v8 > 8);
  }
  input[0] = v8;
  return _TelephonyBasebandControllerCallMethodGeneric(a1, 0x22u, (int)"Remove frequency list", input, 2u, a3, 16 * v8, 0, 0, 0, 0, 1) & v9;
}

uint64_t _TelephonyBasebandControllerCallMethodGeneric(unsigned int *a1, uint32_t a2, int a3, uint64_t *input, uint32_t inputCnt, void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *a11, char a12)
{
  uint64_t result;
  kern_return_t v13;
  BOOL v14;

  result = *a1;
  if ((_DWORD)result)
  {
    v13 = IOConnectCallMethod(result, a2, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, a11);
    result = v13 == 0;
    if (v13)
      v14 = a12 == 0;
    else
      v14 = 1;
    if (!v14)
    {
      _TelephonyUtilDebugPrintError();
      return 0;
    }
  }
  return result;
}

uint64_t TelephonyBasebandControllerAddFreqListExt(mach_port_t *a1, unsigned int a2, char *a3, uint64_t a4)
{
  uint64_t v8;
  unsigned int v9;
  _BOOL4 v10;
  uint64_t result;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  _TelephonyUtilDebugPrint();
  input[1] = a4;
  if (!a2)
    return 0;
  v8 = a2;
  if (a2 < 9)
  {
    v9 = 1;
  }
  else
  {
    v9 = 1;
    do
    {
      input[0] = 8;
      if (*a1)
        v10 = IOConnectCallMethod(*a1, 0x21u, input, 2u, a3, 0x80uLL, 0, 0, 0, 0) == 0;
      else
        v10 = 0;
      v8 -= 8;
      v9 &= v10;
      a3 += 128;
    }
    while (v8 > 8);
  }
  input[0] = v8;
  result = *a1;
  if ((_DWORD)result)
  {
    if (IOConnectCallMethod(result, 0x21u, input, 2u, a3, 16 * v8, 0, 0, 0, 0))
      return 0;
    else
      return v9;
  }
  return result;
}

BOOL TelephonyBasebandSetPowerDebugOptionsInternal(uint64_t a1)
{
  _BOOL8 v2;
  void **v4;
  _BOOL8 v5;
  void **v6;
  void **v7;
  void **v8;
  void **v9;
  void *__p[2];
  char v11;

  if (!a1)
    goto LABEL_7;
  if (*(_DWORD *)a1 < 0x80u && *(_DWORD *)(a1 + 4) < 4u)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sPowerDebugOptionsLock);
    std::string::basic_string[abi:ne180100]<0>(__p, "CommandMask");
    if (v11 >= 0)
      v4 = __p;
    else
      v4 = (void **)__p[0];
    v5 = ctu::cf::plist_adapter::set<unsigned int>(*(_DWORD *)a1, (const char *)v4);
    v2 = v5;
    if (v11 < 0)
    {
      operator delete(__p[0]);
      if (!v2)
      {
LABEL_39:
        sPowerDebugOptions = *(_OWORD *)a1;
        os_unfair_lock_unlock((os_unfair_lock_t)&sPowerDebugOptionsLock);
        return v2;
      }
    }
    else if (!v5)
    {
      goto LABEL_39;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "Intervention");
    if (v11 >= 0)
      v6 = __p;
    else
      v6 = (void **)__p[0];
    v2 = ctu::cf::plist_adapter::set<unsigned int>(*(_DWORD *)(a1 + 4), (const char *)v6);
    if (v11 < 0)
      operator delete(__p[0]);
    if (v2)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, "TimeoutMilliseconds");
      if (v11 >= 0)
        v7 = __p;
      else
        v7 = (void **)__p[0];
      v2 = ctu::cf::plist_adapter::set<unsigned int>(*(_DWORD *)(a1 + 8), (const char *)v7);
      if (v11 < 0)
        operator delete(__p[0]);
      if (v2)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "ShouldOnlyInterveneOnce");
        if (v11 >= 0)
          v8 = __p;
        else
          v8 = (void **)__p[0];
        v2 = ctu::cf::plist_adapter::set<BOOL>(*(unsigned __int8 *)(a1 + 12), (const char *)v8, 0);
        if (v11 < 0)
          operator delete(__p[0]);
        if (v2)
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "DidInterveneOnce");
          if (v11 >= 0)
            v9 = __p;
          else
            v9 = (void **)__p[0];
          v2 = ctu::cf::plist_adapter::set<BOOL>(*(unsigned __int8 *)(a1 + 13), (const char *)v9, 1);
          if (v11 < 0)
            operator delete(__p[0]);
        }
      }
    }
    goto LABEL_39;
  }
  _TelephonyUtilDebugPrintError();
LABEL_7:
  _TelephonyUtilDebugPrintError();
  return 0;
}

void sub_20E5DF204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  os_unfair_lock_unlock((os_unfair_lock_t)&sPowerDebugOptionsLock);
  _Unwind_Resume(a1);
}

BOOL TelephonyBasebandGetPowerDebugOptionsInternal(_OWORD *a1)
{
  if (TelephonyBasebandGetPowerDebugOptionsInternal::sOnce != -1)
  {
    dispatch_once(&TelephonyBasebandGetPowerDebugOptionsInternal::sOnce, &__block_literal_global);
    if (a1)
      goto LABEL_3;
LABEL_5:
    _TelephonyUtilDebugPrintError();
    return a1 != 0;
  }
  if (!a1)
    goto LABEL_5;
LABEL_3:
  *a1 = sPowerDebugOptions;
  return a1 != 0;
}

void sub_20E5DF420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  os_unfair_lock_unlock((os_unfair_lock_t)&sPowerDebugOptionsLock);
  _Unwind_Resume(a1);
}

uint64_t PowerDebugOptionsAdapter::getPreference<unsigned int>(uint64_t a1, ctu::cf *a2)
{
  const char *v3;
  unsigned int *v4;
  unsigned int *v5;
  CFTypeID v6;
  const __CFNumber *v7;
  uint64_t v9;

  if (*(char *)(a1 + 23) >= 0)
    v3 = (const char *)a1;
  else
    v3 = *(const char **)a1;
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v9, v3);
  v4 = (unsigned int *)(*(uint64_t (**)(void))optionsAdapter)();
  v5 = v4;
  if (v4)
  {
    v6 = CFGetTypeID(v4);
    if (v6 == CFNumberGetTypeID())
      ctu::cf::assign(a2, v5, v7);
    CFRelease(v5);
  }
  return MEMORY[0x212BC09F4](&v9);
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
  std::__throw_length_error[abi:ne180100]();
}

void std::__throw_length_error[abi:ne180100]()
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_24C971D70, MEMORY[0x24BEDAAF0]);
}

void sub_20E5DF608(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

BOOL ctu::cf::plist_adapter::set<unsigned int>(unsigned int a1, const char *a2)
{
  const __CFString *v3;
  const __CFAllocator *v4;
  CFNumberRef v5;
  const __CFString *v7;
  CFNumberRef v8;
  uint64_t valuePtr;

  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v7, a2);
  v3 = v7;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  valuePtr = a1;
  v5 = CFNumberCreate(v4, kCFNumberLongLongType, &valuePtr);
  v8 = v5;
  if (v5)
    CFPreferencesSetValue(v3, v5, (CFStringRef)qword_253D92558, unk_253D92560, (CFStringRef)*MEMORY[0x24BDBD588]);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)&v8);
  MEMORY[0x212BC09F4](&v7);
  return v5 != 0;
}

void sub_20E5DF6F4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va1);
  MEMORY[0x212BC09F4]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

BOOL ctu::cf::plist_adapter::set<BOOL>(int a1, const char *a2, int a3)
{
  const void **v5;
  const void *v6;
  const __CFString *v7;
  _BOOL8 v8;
  CFStringRef key;
  const void *v11;

  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&key, a2);
  v5 = (const void **)MEMORY[0x24BDBD270];
  if (!a1)
    v5 = (const void **)MEMORY[0x24BDBD268];
  v6 = *v5;
  v11 = v6;
  if (v6)
  {
    v7 = (const __CFString *)*MEMORY[0x24BDBD588];
    CFPreferencesSetValue(key, v6, (CFStringRef)qword_253D92558, unk_253D92560, (CFStringRef)*MEMORY[0x24BDBD588]);
    if (a3)
      v8 = CFPreferencesSynchronize((CFStringRef)qword_253D92558, unk_253D92560, v7) != 0;
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&v11);
  MEMORY[0x212BC09F4](&key);
  return v8;
}

void sub_20E5DF804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, const void *a10)
{
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&a10);
  MEMORY[0x212BC09F4](&a9);
  _Unwind_Resume(a1);
}

uint64_t PowerDebugOptionsAdapter::getPreference<BOOL>(uint64_t a1, ctu::cf *a2)
{
  const char *v3;
  BOOL *v4;
  BOOL *v5;
  CFTypeID v6;
  const __CFBoolean *v7;
  uint64_t v8;
  uint64_t v10;

  if (*(char *)(a1 + 23) >= 0)
    v3 = (const char *)a1;
  else
    v3 = *(const char **)a1;
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v10, v3);
  v4 = (BOOL *)(*(uint64_t (**)(void))optionsAdapter)();
  v5 = v4;
  if (v4)
  {
    v6 = CFGetTypeID(v4);
    if (v6 == CFBooleanGetTypeID())
      v8 = ctu::cf::assign(a2, v5, v7);
    else
      v8 = 0;
    CFRelease(v5);
  }
  else
  {
    v8 = 0;
  }
  MEMORY[0x212BC09F4](&v10);
  return v8;
}

uint64_t _GLOBAL__sub_I_TelephonyBasebandPowerDebugOptionsInternal_cpp()
{
  MEMORY[0x212BC0A00](&optionsAdapter, CFSTR("com.apple.telephony.powerdebugoptions"), CFSTR("_wireless"));
  return __cxa_atexit((void (*)(void *))PowerDebugOptionsAdapter::~PowerDebugOptionsAdapter, &optionsAdapter, &dword_20E5DE000);
}

const char *TelephonyBasebandPMUTraceToString(int a1)
{
  if ((a1 - 1) > 0xC)
    return "kTelephonyBasebandPMUTrace_Invalid";
  else
    return off_24C972020[a1 - 1];
}

const void *TelephonyBasebandCreateController()
{
  uint64_t Instance;
  const void *v1;
  _OWORD *v2;
  uint8_t buf[4];
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (!TelephonyRadiosGetRadio())
  {
    _TelephonyUtilDebugPrintError();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20E5DE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Device not supported", buf, 2u);
    }
    return 0;
  }
  pthread_once(&_TelephonyBasebandControllerRegisterOnce, (void (*)(void))_TelephonyBasebandControllerRegisterClass);
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
  {
    _TelephonyUtilDebugPrintError();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v5 = "TelephonyUtilBasebandController";
      _os_log_error_impl(&dword_20E5DE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to create %s instance", buf, 0xCu);
    }
    _TelephonyUtilDebugPrintError();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20E5DE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to allocate baseband controller.", buf, 2u);
    }
    goto LABEL_11;
  }
  v1 = (const void *)Instance;
  *(_OWORD *)(Instance + 16) = 0u;
  v2 = (_OWORD *)(Instance + 16);
  v2[5] = 0u;
  v2[6] = 0u;
  v2[3] = 0u;
  v2[4] = 0u;
  v2[1] = 0u;
  v2[2] = 0u;
  if ((TelephonyBasebandControllerInitContext((uint64_t)v2) & 1) == 0)
  {
    CFRelease(v1);
LABEL_11:
    _TelephonyUtilDebugPrintError();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20E5DE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to communicate with AppleBaseband driver", buf, 2u);
    }
    __TUAssertTrigger();
    return 0;
  }
  return v1;
}

uint64_t TelephonyBasebandPowerDebugUnblock(uint64_t a1)
{
  unsigned int *v1;

  v1 = (unsigned int *)(a1 + 16);
  _TelephonyUtilDebugPrint();
  return _TelephonyBasebandControllerCallMethod(v1, 0x2Eu, (int)"unblock command", 0, 0, 0, 0);
}

BOOL TelephonyBasebandSetPowerDebugOptions(__int128 *a1)
{
  __int128 v2;

  if (a1)
  {
    v2 = *a1;
    BYTE13(v2) = 0;
    return TelephonyBasebandSetPowerDebugOptionsInternal((uint64_t)&v2);
  }
  else
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
}

uint64_t TelephonyBasebandNoOp()
{
  return TelephonyBasebandControllerNoOp();
}

uint64_t TelephonyBasebandResetModem(uint64_t a1)
{
  return TelephonyBasebandControllerResetModem(a1 + 16);
}

uint64_t TelephonyBasebandDebugCommand(uint64_t a1, _OWORD *a2)
{
  __int128 v2;
  _OWORD v4[3];

  v2 = a2[1];
  v4[0] = *a2;
  v4[1] = v2;
  v4[2] = a2[2];
  return TelephonyBasebandControllerDebugCommand((unsigned int *)(a1 + 16), v4);
}

uint64_t TelephonyBasebandForceResetModem(uint64_t a1)
{
  return TelephonyBasebandControllerForceResetModem((unsigned int *)(a1 + 16));
}

uint64_t TelephonyBasebandPowercycleModem(uint64_t a1)
{
  return TelephonyBasebandControllerPowercycleModem((unsigned int *)(a1 + 16));
}

uint64_t TelephonyBasebandPowerOnModem(uint64_t a1, unsigned int a2)
{
  return TelephonyBasebandControllerPowerOnModem((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandSetModemCoredumpGPIO(uint64_t a1, unsigned int a2)
{
  return TelephonyBasebandControllerSetModemCoredumpGPIO((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandCrashModemWithSPMI(uint64_t a1)
{
  return TelephonyBasebandControllerCrashModemWithSPMI((unsigned int *)(a1 + 16));
}

uint64_t TelephonyBasebandCrashModemWithSPMIWithReason(uint64_t a1, const void *a2)
{
  return TelephonyBasebandControllerCrashModemWithSPMIWithReason((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandGetPMUTrace(uint64_t a1, int *a2)
{
  return TelephonyBasebandControllerGetPMUTrace((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandAPTimeSync(uint64_t a1, _OWORD *a2)
{
  return TelephonyBasebandControllerAPTimeSync((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandEnableModemVBUS(uint64_t a1, unsigned int a2)
{
  return TelephonyBasebandControllerEnableModemVBUS((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandEnableModemMux(uint64_t a1, unsigned int a2)
{
  return TelephonyBasebandControllerEnableModemMux((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandEnableModemUSBEnumerationWithAP(uint64_t a1, int a2)
{
  return TelephonyBasebandControllerEnableModemUSBEnumerationWithAP(a1 + 16, a2);
}

uint64_t TelephonyBasebandGetReset(uint64_t a1, char *a2)
{
  return TelephonyBasebandControllerGetReset((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandRegisterForReset(uint64_t a1, __CFRunLoop *a2, uint64_t a3, uint64_t a4)
{
  return TelephonyBasebandControllerRegisterForReset(a1 + 16, a2, a3, a4);
}

BOOL TelephonyBasebandRegisterForEvents(uint64_t a1, __CFRunLoop *a2, uint64_t a3, uint64_t a4)
{
  return TelephonyBasebandControllerRegisterForEvents(a1 + 16, a2, a3, a4);
}

uint64_t TelephonyBasebandDeregisterForEvents(uint64_t a1)
{
  return TelephonyBasebandControllerDeregisterForEvents(a1 + 16);
}

uint64_t TelephonyBasebandClearFreqList(uint64_t a1)
{
  return TelephonyBasebandControllerClearFreqListExt((unsigned int *)(a1 + 16), 3uLL);
}

uint64_t TelephonyBasebandClearFreqListExt(uint64_t a1, uint64_t a2)
{
  return TelephonyBasebandControllerClearFreqListExt((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandAddFreqList(uint64_t a1, unsigned int a2, char *a3)
{
  return TelephonyBasebandControllerAddFreqListExt((mach_port_t *)(a1 + 16), a2, a3, 3uLL);
}

uint64_t TelephonyBasebandRemoveFreqList(uint64_t a1, unsigned int a2, char *a3)
{
  return TelephonyBasebandControllerRemoveFreqListExt((unsigned int *)(a1 + 16), a2, a3, 3uLL);
}

uint64_t TelephonyBasebandGetPowercycleDelay(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = _TelephonyBasebandControllerLoadConfig();
  if ((_DWORD)result)
    *a2 = sTelephonyBasebandControllerBasebandConfiguration;
  return result;
}

uint64_t TelephonyBasebandGetRadioOnDelay(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = _TelephonyBasebandControllerLoadConfig();
  if ((_DWORD)result)
    *a2 = dword_254A2AC84;
  return result;
}

uint64_t TelephonyBasebandGetMaximumBootupTime(uint64_t a1, int *a2)
{
  int v3;

  if (a2)
  {
    switch(TelephonyRadiosGetRadio())
    {
      case 2u:
      case 3u:
      case 4u:
      case 7u:
      case 8u:
        v3 = 5000;
        break;
      case 9u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
      case 0xDu:
      case 0xEu:
      case 0xFu:
        v3 = 10000;
        break;
      default:
        *a2 = 0;
        goto LABEL_4;
    }
    *a2 = v3;
    return 1;
  }
  else
  {
LABEL_4:
    _TelephonyUtilDebugPrint();
    return 0;
  }
}

uint64_t TelephonyBasebandGetUsbDischargeTime(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = _TelephonyBasebandControllerLoadConfig();
  if ((_DWORD)result)
    *a2 = dword_254A2AC8C;
  return result;
}

uint64_t TelephonyBasebandGetResetAssertHoldTime(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = _TelephonyBasebandControllerLoadConfig();
  if ((_DWORD)result)
    *a2 = dword_254A2AC90;
  return result;
}

uint64_t TelephonyBasebandGetResetDeassertDelay(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = _TelephonyBasebandControllerLoadConfig();
  if ((_DWORD)result)
    *a2 = dword_254A2AC94;
  return result;
}

uint64_t TelephonyBasebandGetMaximumRecoveryTime(uint64_t a1, _DWORD *a2)
{
  return TelephonyBasebandControllerGetMaximumRecoveryTime(a1 + 16, a2);
}

uint64_t TelephonyBasebandGetPMUExtOn(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  char v4;
  uint32_t outputCnt;
  uint64_t output;

  output = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = 1;
  result = _TelephonyBasebandControllerCallMethod((unsigned int *)(a1 + 16), 0xBu, (int)"get pmuext on", 0, 0, &output, &outputCnt);
  if (output)
    v4 = result;
  else
    v4 = 0;
  *a2 = v4;
  return result;
}

uint64_t TelephonyBasebandGetDiagReady(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  char v4;
  uint32_t outputCnt;
  uint64_t output;

  output = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = 1;
  result = _TelephonyBasebandControllerCallMethod((unsigned int *)(a1 + 16), 0x10u, (int)"get diag ready", 0, 0, &output, &outputCnt);
  if (output)
    v4 = result;
  else
    v4 = 0;
  *a2 = v4;
  return result;
}

uint64_t TelephonyBasebandGetFSEraseDone(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  char v4;
  uint32_t outputCnt;
  uint64_t output;

  output = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = 1;
  result = _TelephonyBasebandControllerCallMethod((unsigned int *)(a1 + 16), 0x11u, (int)"get efs-erase done", 0, 0, &output, &outputCnt);
  if (output)
    v4 = result;
  else
    v4 = 0;
  *a2 = v4;
  return result;
}

uint64_t TelephonyBasebandPollGPIO(uint64_t a1, int a2, int a3, int a4, int a5)
{
  return TelephonyBasebandControllerPollGPIO((unsigned int *)(a1 + 16), a2, a3, a4, a5);
}

BOOL TelephonyBasebandSupportsRadio()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_service_t v3;

  v0 = *MEMORY[0x24BDD8B18];
  v1 = IOServiceMatching("AppleBaseband");
  MatchingService = IOServiceGetMatchingService(v0, v1);
  v3 = MatchingService;
  if (MatchingService)
    IOObjectRelease(MatchingService);
  return v3 != 0;
}

uint64_t TelephonyBasebandGetResetReq(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  char v4;
  uint32_t outputCnt;
  uint64_t output;

  output = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = 1;
  result = _TelephonyBasebandControllerCallMethod((unsigned int *)(a1 + 16), 0x12u, (int)"get reset request", 0, 0, &output, &outputCnt);
  if (output)
    v4 = result;
  else
    v4 = 0;
  *a2 = v4;
  return result;
}

uint64_t TelephonyBasebandSetManagerState(uint64_t a1, unsigned int a2)
{
  return TelephonyBasebandControllerSetManagerState((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandGetManagerState(uint64_t a1, _DWORD *a2)
{
  return TelephonyBasebandControllerGetManagerState((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandSetChargerDesense(uint64_t a1, unsigned int a2)
{
  return TelephonyBasebandControllerSetChargerDesense((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandGetCoredumpReadyStatus(uint64_t a1, BOOL *a2)
{
  return TelephonyBasebandControllerGetCoredumpReadyStatus((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandGetBasebandState(uint64_t a1, _DWORD *a2)
{
  return TelephonyBasebandControllerGetBasebandState((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandSetBasebandState(uint64_t a1, unsigned int a2)
{
  return TelephonyBasebandControllerSetBasebandState((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandGetBasebandProperty(uint64_t a1, unsigned int a2, uint64_t *a3)
{
  return TelephonyBasebandControllerGetBasebandProperty((unsigned int *)(a1 + 16), a2, a3);
}

uint64_t TelephonyBasebandSetBasebandProperty(uint64_t a1, unsigned int a2, uint64_t a3)
{
  return TelephonyBasebandControllerSetBasebandProperty((unsigned int *)(a1 + 16), a2, a3);
}

uint64_t TelephonyBasebandReportThermalData(uint64_t a1, const void *a2, unsigned int a3, _DWORD *a4)
{
  if (a1 && a2 && a4)
    return TelephonyBasebandControllerReportThermalData((unsigned int *)(a1 + 16), a2, a3, a4);
  _TelephonyUtilDebugPrint();
  return 0;
}

uint64_t TelephonyBasebandResetSPMI(uint64_t a1, uint64_t a2)
{
  return TelephonyBasebandControllerResetSPMI((unsigned int *)(a1 + 16), a2);
}

uint64_t TelephonyBasebandGNSSTrapTrigger(uint64_t a1)
{
  return TelephonyBasebandControllerGNSSTrapTrigger((unsigned int *)(a1 + 16));
}

uint64_t TelephonyBasebandGNSSWakeTrigger(uint64_t a1)
{
  return TelephonyBasebandControllerGNSSWakeTrigger((unsigned int *)(a1 + 16));
}

uint64_t TelephonyBasebandSPMIRawWrite(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, unsigned int a5)
{
  return TelephonyBasebandControllerSPMIRawWrite((unsigned int *)(a1 + 16), a2, a3, a4, a5);
}

uint64_t TelephonyBasebandSPMIRawRead(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, void *a5)
{
  return TelephonyBasebandControllerSPMIRawRead((unsigned int *)(a1 + 16), a2, a3, a4, a5);
}

uint64_t TelephonyBasebandSPMIReg0Write(uint64_t a1, unsigned int a2, unsigned int a3)
{
  return TelephonyBasebandControllerSPMIReg0Write((unsigned int *)(a1 + 16), a2, a3);
}

uint64_t TelephonyBasebandSPMIGetEvents(uint64_t a1, void *a2, unsigned int *a3)
{
  return TelephonyBasebandControllerSPMIGetEvents((unsigned int *)(a1 + 16), a2, a3);
}

uint64_t _TelephonyBasebandControllerRegisterClass()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  _TelephonyBasebandControllerTypeID = result;
  return result;
}

BOOL _TelephonyBasebandControllerHandleDestroy(uint64_t a1)
{
  return TelephonyBasebandControllerFreeContext(a1 + 16);
}

uint64_t TelephonyBasebandControllerInitContext(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  io_object_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v14[6];
  _QWORD v15[6];
  _QWORD block[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v18 = &v17;
  v19 = 0x2000000000;
  v20 = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  if (_MergedGlobals != -1)
    dispatch_once(&_MergedGlobals, &__block_literal_global_0);
  v2 = qword_253D92508;
  if (!qword_253D92508)
  {
    __TUAssertTrigger();
    v2 = qword_253D92508;
  }
  *(_QWORD *)(a1 + 72) = v2;
  dispatch_retain(v2);
  v3 = *(NSObject **)(a1 + 72);
  v4 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1107296256;
  block[2] = __TelephonyBasebandControllerInitContext_block_invoke_2;
  block[3] = &__block_descriptor_tmp_5;
  block[4] = &v17;
  block[5] = a1;
  dispatch_sync(v3, block);
  if (*(_QWORD *)(a1 + 24) && !*(_DWORD *)(a1 + 4))
  {
    v5 = dispatch_group_create();
    *(_QWORD *)(a1 + 16) = v5;
    dispatch_group_enter(v5);
    v6 = *(NSObject **)(a1 + 72);
    v15[0] = v4;
    v15[1] = 1107296256;
    v15[2] = __TelephonyBasebandControllerInitContext_block_invoke_6;
    v15[3] = &__block_descriptor_tmp_8;
    v15[4] = &v17;
    v15[5] = a1;
    dispatch_async(v6, v15);
    v7 = *(NSObject **)(a1 + 16);
    v8 = dispatch_time(0, 15000000000);
    if (dispatch_group_wait(v7, v8))
    {
      _TelephonyUtilDebugPrintError();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "TelephonyBasebandController";
        _os_log_error_impl(&dword_20E5DE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: Timeout for waiting for the driver!", buf, 0xCu);
      }
      *((_BYTE *)v18 + 24) = 0;
    }
    v9 = *(_DWORD *)(a1 + 8);
    if (v9)
    {
      IOObjectRelease(v9);
      *(_DWORD *)(a1 + 8) = 0;
    }
    v10 = *(NSObject **)(a1 + 16);
    if (v10)
    {
      dispatch_release(v10);
      *(_QWORD *)(a1 + 16) = 0;
    }
  }
  if (*((_BYTE *)v18 + 24))
  {
    v11 = *(NSObject **)(a1 + 72);
    v14[0] = v4;
    v14[1] = 1107296256;
    v14[2] = __TelephonyBasebandControllerInitContext_block_invoke_10;
    v14[3] = &__block_descriptor_tmp_11;
    v14[4] = &v17;
    v14[5] = a1;
    dispatch_sync(v11, v14);
  }
  else
  {
    TelephonyBasebandControllerFreeContext(a1);
  }
  v12 = *((unsigned __int8 *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return v12;
}

void __copy_helper_block_8_32r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
}

void __destroy_helper_block_8_32r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 32), 8);
}

BOOL TelephonyBasebandControllerFreeContext(uint64_t a1)
{
  _BOOL8 v2;
  NSObject *v3;
  uint64_t v4;
  CFRunLoopRef Current;
  __CFRunLoop *v6;
  CFRunLoopMode v7;
  CFRunLoopMode v8;
  NSObject *v9;
  __CFRunLoop *v10;
  const void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD block[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  v2 = 1;
  v21 = 1;
  v3 = *(NSObject **)(a1 + 72);
  if (v3)
  {
    v4 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1107296256;
    block[2] = __TelephonyBasebandControllerFreeContext_block_invoke;
    block[3] = &__block_descriptor_tmp_12;
    block[4] = &v18;
    block[5] = a1;
    dispatch_sync(v3, block);
    if (*(_QWORD *)(a1 + 48))
    {
      Current = CFRunLoopGetCurrent();
      v6 = *(__CFRunLoop **)(a1 + 48);
      if (Current != v6)
      {
        v7 = CFRunLoopCopyCurrentMode(v6);
        if (v7)
        {
          v8 = v7;
          v9 = dispatch_semaphore_create(0);
          v10 = *(__CFRunLoop **)(a1 + 48);
          v11 = (const void *)*MEMORY[0x24BDBD5A0];
          v16[0] = v4;
          v16[1] = 0x40000000;
          v16[2] = __TelephonyBasebandControllerFreeContext_block_invoke_13;
          v16[3] = &__block_descriptor_tmp_14;
          v16[4] = v9;
          CFRunLoopPerformBlock(v10, v11, v16);
          CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 48));
          dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
          dispatch_release(v9);
          CFRelease(v8);
        }
      }
      *(_QWORD *)(a1 + 48) = 0;
    }
    v12 = *(NSObject **)(a1 + 16);
    if (v12)
    {
      dispatch_release(v12);
      *(_QWORD *)(a1 + 16) = 0;
    }
    v13 = *(NSObject **)(a1 + 72);
    v15[0] = v4;
    v15[1] = 0x40000000;
    v15[2] = __TelephonyBasebandControllerFreeContext_block_invoke_2;
    v15[3] = &__block_descriptor_tmp_15;
    v15[4] = a1;
    dispatch_sync(v13, v15);
    dispatch_release(*(dispatch_object_t *)(a1 + 72));
    *(_QWORD *)(a1 + 72) = 0;
    v2 = *((_BYTE *)v19 + 24) != 0;
  }
  _Block_object_dispose(&v18, 8);
  return v2;
}

uint64_t TelephonyBasebandControllerResetModem(uint64_t a1)
{
  unsigned int SafeResetTime;
  NSObject *v4;
  uint64_t v5;
  int v6;
  NSObject **v7;
  NSObject **v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  int v14;
  unsigned int i;
  NSObject **v16;
  dispatch_time_t v17;
  char v18;
  uint64_t input;
  uint32_t outputCnt[2];
  uint32_t *v21;
  uint64_t v22;
  char v23;
  char v24;
  char v25;
  uint64_t block;
  uint64_t v27;
  void *v28;
  void *v29;
  uint32_t *v30;
  uint64_t v31;

  input = 0;
  SafeResetTime = TelephonyCapabilitiesRadioGetSafeResetTime();
  v18 = 0;
  if (_TelephonyBasebandHandlePowerDebugIntervention(16, &v18) && v18)
  {
    _TelephonyUtilDebugPrint();
    return 1;
  }
  _TelephonyUtilDebugPrint();
  if (!SafeResetTime)
    return _TelephonyBasebandControllerCallMethod((unsigned int *)a1, 0, (int)"reset modem", &input, 1u, 0, 0);
  *(_QWORD *)outputCnt = 0;
  v21 = outputCnt;
  v22 = 0x2000000000;
  v23 = 1;
  v4 = *(NSObject **)(a1 + 72);
  v5 = MEMORY[0x24BDAC760];
  block = MEMORY[0x24BDAC760];
  v27 = 1107296256;
  v28 = ___TelephonyBasebandControllerIsEmptyEventQueue_block_invoke;
  v29 = &__block_descriptor_tmp_197;
  v30 = outputCnt;
  v31 = a1;
  dispatch_sync(v4, &block);
  v6 = *((unsigned __int8 *)v21 + 24);
  _Block_object_dispose(outputCnt, 8);
  if (v6)
  {
    _TelephonyUtilDebugPrint();
    v25 = -86;
    if ((TelephonyBasebandControllerIsBootStageDown((uint64_t)&v25) & 1) != 0)
    {
      if (v25)
        goto LABEL_61;
      block = 0xAAAAAAAAAAAAAAAALL;
      outputCnt[0] = 1;
      if ((_TelephonyBasebandControllerCallMethod((unsigned int *)a1, 3u, (int)"get reset", 0, 0, &block, outputCnt) & 1) != 0)
      {
        if (!block)
          _TelephonyUtilDebugPrint();
        v14 = TelephonyCapabilitiesRadioCoreDumpSupportsSPMISignalling();
        for (i = 0; i < SafeResetTime; i += 500)
        {
          if (v14)
          {
            LOBYTE(block) = 0;
            if ((TelephonyBasebandControllerGetCoredumpReadyStatus((unsigned int *)a1, (BOOL *)&block) & 1) == 0)
              goto LABEL_42;
            if ((_BYTE)block)
              goto LABEL_61;
          }
          else
          {
            block = 0xAAAAAAAAAAAAAAAALL;
            outputCnt[0] = 1;
            if ((_TelephonyBasebandControllerCallMethod((unsigned int *)a1, 0xBu, (int)"get pmuext on", 0, 0, &block, outputCnt) & 1) == 0)goto LABEL_42;
            if (!block)
              goto LABEL_61;
          }
          usleep(0x7A120u);
        }
        _TelephonyUtilDebugPrint();
        goto LABEL_61;
      }
    }
    goto LABEL_42;
  }
  v24 = 0;
  if ((TelephonyCapabilitiesRadioCoreDumpSupportsSPMISignalling() & 1) != 0)
  {
    _TelephonyUtilDebugPrint();
    if (CFRunLoopGetCurrent() == *(CFRunLoopRef *)(a1 + 48)
      || !TelephonyBasebandControllerIsBootStageDown((uint64_t)&v24))
    {
      goto LABEL_42;
    }
    if (v24)
      goto LABEL_61;
    block = 0xAAAAAAAAAAAAAAAALL;
    outputCnt[0] = 1;
    if (!_TelephonyBasebandControllerCallMethod((unsigned int *)a1, 3u, (int)"get reset", 0, 0, &block, outputCnt))goto LABEL_42;
    if (!block)
      _TelephonyUtilDebugPrint();
    v16 = (NSObject **)malloc(0x18uLL);
    if (!v16)
    {
LABEL_42:
      _TelephonyUtilDebugPrintError();
LABEL_43:
      _TelephonyUtilDebugPrintError();
      return 0;
    }
    v8 = v16;
    LOBYTE(block) = 0;
    v9 = dispatch_group_create();
    *v8 = v9;
    _TelephonyBasebandControllerInsertInCoredumpReadyQueue(a1, (uint64_t)v8);
    if (!TelephonyBasebandControllerGetCoredumpReadyStatus((unsigned int *)a1, (BOOL *)&block))
    {
      _TelephonyUtilDebugPrintError();
      _TelephonyBasebandControllerRemoveFromCoredumpReadyQueue(a1, (uint64_t)v8);
      goto LABEL_43;
    }
    if ((_BYTE)block)
    {
      _TelephonyUtilDebugPrint();
      _TelephonyBasebandControllerRemoveFromCoredumpReadyQueue(a1, (uint64_t)v8);
    }
    v17 = dispatch_time(0, 1000000 * SafeResetTime);
    if (dispatch_group_wait(v9, v17))
    {
      _TelephonyUtilDebugPrint();
      _TelephonyBasebandControllerRemoveFromCoredumpReadyQueue(a1, (uint64_t)v8);
    }
  }
  else
  {
    _TelephonyUtilDebugPrint();
    if (CFRunLoopGetCurrent() == *(CFRunLoopRef *)(a1 + 48))
      goto LABEL_61;
    v25 = -86;
    if (!TelephonyBasebandControllerIsBootStageDown((uint64_t)&v25))
      goto LABEL_61;
    if (v25)
      goto LABEL_61;
    block = 0xAAAAAAAAAAAAAAAALL;
    outputCnt[0] = 1;
    if ((_TelephonyBasebandControllerCallMethod((unsigned int *)a1, 3u, (int)"get reset", 0, 0, &block, outputCnt) & 1) == 0)
      goto LABEL_61;
    if (!block)
      goto LABEL_61;
    v7 = (NSObject **)malloc(0x18uLL);
    if (!v7)
      goto LABEL_61;
    v8 = v7;
    v9 = dispatch_group_create();
    *v8 = v9;
    v10 = *(NSObject **)(a1 + 72);
    block = v5;
    v27 = 0x40000000;
    v28 = ___TelephonyBasebandControllerInsertInWakeQueue_block_invoke;
    v29 = &__block_descriptor_tmp_230;
    v30 = (uint32_t *)v8;
    v31 = a1;
    dispatch_sync(v10, &block);
    block = 0xAAAAAAAAAAAAAAAALL;
    outputCnt[0] = 1;
    if (!_TelephonyBasebandControllerCallMethod((unsigned int *)a1, 0xBu, (int)"get pmuext on", 0, 0, &block, outputCnt)|| !block)
    {
      _TelephonyUtilDebugPrint();
      v11 = *(NSObject **)(a1 + 72);
      block = v5;
      v27 = 0x40000000;
      v28 = ___TelephonyBasebandControllerRemoveFromWakeQueue_block_invoke;
      v29 = &__block_descriptor_tmp_231;
      v30 = (uint32_t *)v8;
      v31 = a1;
      dispatch_sync(v11, &block);
    }
    v12 = dispatch_time(0, 1000000 * SafeResetTime);
    if (dispatch_group_wait(v9, v12))
    {
      _TelephonyUtilDebugPrint();
      v13 = *(NSObject **)(a1 + 72);
      block = v5;
      v27 = 0x40000000;
      v28 = ___TelephonyBasebandControllerRemoveFromWakeQueue_block_invoke;
      v29 = &__block_descriptor_tmp_231;
      v30 = (uint32_t *)v8;
      v31 = a1;
      dispatch_sync(v13, &block);
    }
  }
  dispatch_release(v9);
  free(v8);
LABEL_61:
  _TelephonyUtilDebugPrint();
  return _TelephonyBasebandControllerCallMethod((unsigned int *)a1, 0, (int)"reset modem", &input, 1u, 0, 0);
}

BOOL _TelephonyBasebandHandlePowerDebugIntervention(int a1, char *a2)
{
  char v4;
  __int128 v5;
  unint64_t v6;
  const char *v7;
  int v8;
  double v9;
  const char *v10;
  __int128 v12;
  pthread_t v13;
  pthread_attr_t __attr;
  _OWORD v15[16];
  char __str[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!a2)
    goto LABEL_8;
  *a2 = 0;
  if (TelephonyBasebandGetPowerDebugOptionsInternal::sOnce != -1)
    dispatch_once(&TelephonyBasebandGetPowerDebugOptionsInternal::sOnce, &__block_literal_global);
  v12 = sPowerDebugOptions;
  if ((sPowerDebugOptions & a1) != 0)
  {
    if (BYTE12(v12))
    {
      if (BYTE13(v12))
        goto LABEL_10;
      _TelephonyUtilDebugPrint();
      BYTE13(v12) = 1;
      if (!TelephonyBasebandSetPowerDebugOptionsInternal((uint64_t)&v12))
        _TelephonyUtilDebugPrintError();
    }
    v4 = BYTE4(v12);
    if (DWORD1(v12) == 3)
    {
      v13 = (pthread_t)0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&__attr.__sig = v5;
      *(_OWORD *)&__attr.__opaque[8] = v5;
      *(_OWORD *)&__attr.__opaque[24] = v5;
      *(_OWORD *)&__attr.__opaque[40] = v5;
      pthread_attr_init(&__attr);
      pthread_attr_set_qos_class_np(&__attr, QOS_CLASS_USER_INITIATED, 0);
      if (pthread_create(&v13, &__attr, (void *(__cdecl *)(void *))_TelephonyBasebandPowerDebugBlockingThread, &v12))
      {
        _TelephonyUtilDebugPrintError();
      }
      else
      {
        LODWORD(v6) = DWORD2(v12);
        v9 = (double)v6 / 1000.0;
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        *(_OWORD *)__str = 0u;
        v17 = 0u;
        memset(v15, 0, sizeof(v15));
        v10 = _TelephonyBasebandPowerDebugCommandMaskToString(a1);
        snprintf(__str, 0x80uLL, "Telephony Baseband Command \"%s\" Detected", v10);
        if (v9 == 0.0)
          strcpy((char *)v15, "This command will be blocked until the baseband driver sends an out-of-band notification (e.g. bbutil debug power unblock)");
        else
          snprintf((char *)v15, 0x100uLL, "This command will be blocked until the baseband driver sends an out-of-band notification (e.g. bbutil debug power unblock) or until after %.0f s.", v9);
        TelephonyUtilDisplayAlert();
        pthread_join(v13, 0);
      }
      pthread_attr_destroy(&__attr);
      return a2 != 0;
    }
    if (DWORD1(v12) != 2)
    {
      if (DWORD1(v12) == 1)
LABEL_27:
        *a2 = v4;
      return a2 != 0;
    }
    if (isatty(0) || isatty(1) || isatty(2))
    {
      v7 = _TelephonyBasebandPowerDebugCommandMaskToString(a1);
      printf("(power-debug) %s detected\n(power-debug) [continue] c; [skip] s\n(power-debug) ", v7);
      while (1)
      {
        v8 = getchar();
        if (v8 == -1 || v8 == 99)
          return a2 != 0;
        if (v8 == 115)
        {
          v4 = 1;
          goto LABEL_27;
        }
      }
    }
LABEL_8:
    _TelephonyUtilDebugPrintError();
    return a2 != 0;
  }
  if ((_DWORD)sPowerDebugOptions)
LABEL_10:
    _TelephonyUtilDebugPrint();
  return a2 != 0;
}

uint64_t _TelephonyBasebandControllerCallMethod(unsigned int *a1, uint32_t a2, int a3, uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  uint64_t result;

  result = *a1;
  if ((_DWORD)result)
  {
    if (IOConnectCallScalarMethod(result, a2, input, inputCnt, output, outputCnt))
    {
      _TelephonyUtilDebugPrintError();
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t TelephonyBasebandControllerNoOp()
{
  char v1;

  v1 = 0;
  _TelephonyBasebandHandlePowerDebugIntervention(1, &v1);
  _TelephonyUtilDebugPrint();
  return 1;
}

uint64_t TelephonyBasebandControllerDebugCommand(unsigned int *a1, const void *a2)
{
  uint64_t result;

  _TelephonyUtilDebugPrint();
  result = *a1;
  if ((_DWORD)result)
    return IOConnectCallMethod(result, 0x1Fu, 0, 0, a2, 0x30uLL, 0, 0, 0, 0) == 0;
  return result;
}

uint64_t TelephonyBasebandControllerForceResetModem(unsigned int *a1)
{
  char v3;
  uint64_t input;

  input = 16;
  v3 = 0;
  if (_TelephonyBasebandHandlePowerDebugIntervention(16, &v3) && v3)
  {
    _TelephonyUtilDebugPrint();
    return 1;
  }
  else
  {
    _TelephonyUtilDebugPrint();
    return _TelephonyBasebandControllerCallMethod(a1, 0, (int)"reset modem", &input, 1u, 0, 0);
  }
}

uint64_t TelephonyBasebandControllerPowercycleModem(unsigned int *a1)
{
  char v3;

  v3 = 0;
  if (_TelephonyBasebandHandlePowerDebugIntervention(8, &v3) && v3)
  {
    _TelephonyUtilDebugPrint();
    return 1;
  }
  else
  {
    _TelephonyUtilDebugPrint();
    return _TelephonyBasebandControllerCallMethod(a1, 6u, (int)"powercycle modem", 0, 0, 0, 0);
  }
}

uint64_t TelephonyBasebandControllerPowerOnModem(unsigned int *a1, unsigned int a2)
{
  int v4;
  const char *v6;
  char v8;
  uint64_t input;

  input = a2;
  v8 = 0;
  if (a2)
    v4 = 4;
  else
    v4 = 2;
  if (!_TelephonyBasebandHandlePowerDebugIntervention(v4, &v8) || v8 == 0)
  {
    _TelephonyUtilDebugPrint();
    if (a2)
      v6 = "power on";
    else
      v6 = "power off";
    return _TelephonyBasebandControllerCallMethod(a1, 1u, (int)v6, &input, 1u, 0, 0);
  }
  else
  {
    _TelephonyUtilDebugPrint();
    return 1;
  }
}

uint64_t TelephonyBasebandControllerSetModemCoredumpGPIO(unsigned int *a1, unsigned int a2)
{
  const char *v5;
  char v6;
  uint64_t input;

  input = a2;
  v6 = 0;
  if (_TelephonyBasebandHandlePowerDebugIntervention(64, &v6) && v6)
  {
    _TelephonyUtilDebugPrint();
    return 1;
  }
  else
  {
    _TelephonyUtilDebugPrint();
    if (a2)
      v5 = "coredump on";
    else
      v5 = "coredump off";
    return _TelephonyBasebandControllerCallMethod(a1, 0x13u, (int)v5, &input, 1u, 0, 0);
  }
}

uint64_t TelephonyBasebandControllerCrashModemWithSPMI(unsigned int *a1)
{
  char v3;

  v3 = 0;
  if (_TelephonyBasebandHandlePowerDebugIntervention(32, &v3) && v3)
  {
    _TelephonyUtilDebugPrint();
    return 1;
  }
  else
  {
    _TelephonyUtilDebugPrint();
    return _TelephonyBasebandControllerCallMethod(a1, 0x2Bu, (int)"crash modem via spmi", 0, 0, 0, 0);
  }
}

uint64_t TelephonyBasebandControllerCrashModemWithSPMIWithReason(unsigned int *a1, const void *a2)
{
  uint64_t result;
  char v5;

  v5 = 0;
  if (_TelephonyBasebandHandlePowerDebugIntervention(32, &v5) && v5)
  {
    _TelephonyUtilDebugPrint();
    return 1;
  }
  else
  {
    _TelephonyUtilDebugPrint();
    result = *a1;
    if ((_DWORD)result)
      return IOConnectCallMethod(result, 0x2Cu, 0, 0, a2, 0x40uLL, 0, 0, 0, 0) == 0;
  }
  return result;
}

uint64_t TelephonyBasebandControllerGetPMUTrace(unsigned int *a1, int *a2)
{
  int RadioVendor;
  uint64_t v5;
  int v6;
  int v7;
  int v9;

  _TelephonyUtilDebugPrint();
  RadioVendor = TelephonyRadiosGetRadioVendor();
  v5 = 0;
  if (a2 && RadioVendor == 3)
  {
    v9 = 0;
    v5 = TelephonyBasebandControllerSPMIRawRead(a1, 2u, 0xD0u, 4u, &v9);
    if ((v5 & 1) != 0)
    {
      v6 = v9;
      _TelephonyUtilDebugPrint();
      switch(v6)
      {
        case -2147483648:
          v7 = 12;
          goto LABEL_20;
        case -2147483647:
          v7 = 13;
          goto LABEL_20;
        case -2147483646:
          v7 = 5;
          goto LABEL_20;
        case -2147483645:
          v7 = 6;
          goto LABEL_20;
        case -2147483644:
          v7 = 8;
          goto LABEL_20;
        case -2147483643:
          v7 = 9;
          goto LABEL_20;
        case -2147483642:
          v7 = 1;
          goto LABEL_20;
        case -2147483641:
          v7 = 2;
          goto LABEL_20;
        case -2147483640:
          v7 = 3;
          goto LABEL_20;
        case -2147483639:
          v7 = 4;
          goto LABEL_20;
        case -2147483638:
          v7 = 10;
          goto LABEL_20;
        case -2147483637:
          v7 = 11;
          goto LABEL_20;
        case -2147483629:
          v7 = 7;
LABEL_20:
          *a2 = v7;
          break;
        default:
          *a2 = 0;
          break;
      }
    }
    else
    {
      _TelephonyUtilDebugPrintError();
    }
  }
  return v5;
}

uint64_t TelephonyBasebandControllerAPTimeSync(unsigned int *a1, _OWORD *a2)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output[3];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (!a2)
    return 0;
  output[0] = 0;
  output[1] = 0;
  outputCnt = 2;
  result = _TelephonyBasebandControllerCallMethod(a1, 0x14u, (int)"timesync", 0, 0, output, &outputCnt);
  *a2 = *(_OWORD *)output;
  return result;
}

uint64_t TelephonyBasebandControllerEnableModemVBUS(unsigned int *a1, unsigned int a2)
{
  uint64_t v4;
  const char *v5;
  uint64_t input;

  v4 = a2;
  _TelephonyUtilDebugPrint();
  input = v4;
  if (a2)
    v5 = "usb on";
  else
    v5 = "usb off";
  return _TelephonyBasebandControllerCallMethod(a1, 8u, (int)v5, &input, 1u, 0, 0);
}

uint64_t TelephonyBasebandControllerEnableModemMux(unsigned int *a1, unsigned int a2)
{
  uint64_t v4;
  const char *v5;
  uint64_t input;

  v4 = a2;
  _TelephonyUtilDebugPrint();
  input = v4;
  if (a2)
    v5 = "mux on";
  else
    v5 = "mux off";
  return _TelephonyBasebandControllerCallMethod(a1, 2u, (int)v5, &input, 1u, 0, 0);
}

uint64_t TelephonyBasebandControllerEnableModemUSBEnumerationWithAP(uint64_t a1, int a2)
{
  mach_port_t v3;
  const __CFDictionary *v4;
  uint64_t v5;
  const void **v6;
  io_object_t v7;
  io_registry_entry_t v8;
  char v9;
  const void *v10;
  io_iterator_t existing;

  _TelephonyUtilDebugPrint();
  existing = -1431655766;
  v3 = *MEMORY[0x24BDD8B18];
  v4 = IOServiceMatching("AppleS5L8930XUSBArbitrator");
  if (IOServiceGetMatchingServices(v3, v4, &existing))
  {
    _TelephonyUtilDebugPrintError();
    v5 = 0;
  }
  else
  {
    if (a2)
      v6 = (const void **)MEMORY[0x24BDBD270];
    else
      v6 = (const void **)MEMORY[0x24BDBD268];
    v7 = IOIteratorNext(existing);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *v6;
      do
      {
        if (IORegistryEntrySetCFProperty(v8, CFSTR("EnableBBUSB"), v10))
          _TelephonyUtilDebugPrintError();
        else
          v9 = 1;
        IOObjectRelease(v8);
        v8 = IOIteratorNext(existing);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
    _TelephonyUtilDebugPrint();
    v5 = v9 & 1;
  }
  if (existing)
    IOObjectRelease(existing);
  return v5;
}

uint64_t TelephonyBasebandControllerGetReset(unsigned int *a1, char *a2)
{
  uint64_t result;
  char v4;
  uint32_t outputCnt;
  uint64_t output;

  output = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = 1;
  result = _TelephonyBasebandControllerCallMethod(a1, 3u, (int)"get reset", 0, 0, &output, &outputCnt);
  v4 = result ^ 1;
  if (output)
    v4 = 1;
  *a2 = v4;
  return result;
}

uint64_t TelephonyBasebandControllerRegisterForReset(uint64_t a1, __CFRunLoop *a2, uint64_t a3, uint64_t a4)
{
  const void *v6;
  uint64_t result;
  _QWORD v8[6];

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 0x40000000;
  v8[2] = __TelephonyBasebandControllerRegisterForReset_block_invoke;
  v8[3] = &__block_descriptor_tmp_63;
  v8[4] = a3;
  v8[5] = a4;
  v6 = *(const void **)(a1 + 80);
  if (v6)
    _Block_release(v6);
  *(_QWORD *)(a1 + 80) = _Block_copy(v8);
  result = _TelephonyBasebandControllerRegisterForService(*(IONotificationPort **)(a1 + 24), (io_object_t *)(a1 + 32), *(_DWORD *)(a1 + 4), *(__CFRunLoopSource **)(a1 + 40), a2, (IOServiceInterestCallback)_TelephonyBasebandResetCallback, (void *)a1);
  if ((_DWORD)result)
  {
    *(_QWORD *)(a1 + 48) = a2;
    return _TelephonyBasebandControllerInsertInEventQueue(a1, (uint64_t)a2);
  }
  return result;
}

uint64_t _TelephonyBasebandControllerRegisterForService(IONotificationPort *a1, io_object_t *notification, io_service_t service, __CFRunLoopSource *a4, __CFRunLoop *a5, IOServiceInterestCallback callback, void *refCon)
{
  if (a1 && a4 && !IOServiceAddInterestNotification(a1, service, "IOGeneralInterest", callback, refCon, notification))
  {
    CFRunLoopAddSource(a5, a4, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
    return 1;
  }
  else
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
}

uint64_t _TelephonyBasebandResetCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v8;
  void (*v9)(uint64_t);
  void *v10;
  uint64_t result;
  uint64_t block;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  uint64_t v16;

  if (!a1)
    return _TelephonyUtilDebugPrintError();
  if ((_DWORD)a3 == -469794803)
  {
    _TelephonyUtilDebugPrint();
    v8 = *(NSObject **)(a1 + 72);
    block = MEMORY[0x24BDAC760];
    v9 = ___TelephonyBasebandControllerRemoveAllFromCoredumpReadyQueue_block_invoke;
    v13 = 0x40000000;
    v10 = &__block_descriptor_tmp_244;
  }
  else
  {
    if ((_DWORD)a3 != -469794809)
      goto LABEL_8;
    _TelephonyUtilDebugPrint();
    v8 = *(NSObject **)(a1 + 72);
    block = MEMORY[0x24BDAC760];
    v9 = ___TelephonyBasebandControllerRemoveAllFromWakeQueue_block_invoke;
    v13 = 0x40000000;
    v10 = &__block_descriptor_tmp_243;
  }
  v14 = v9;
  v15 = v10;
  v16 = a1;
  dispatch_sync(v8, &block);
LABEL_8:
  result = *(_QWORD *)(a1 + 80);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a4);
  return result;
}

BOOL _TelephonyBasebandControllerInsertInEventQueue(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  _QWORD block[7];

  v4 = malloc(0x18uLL);
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 72);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___TelephonyBasebandControllerInsertInEventQueue_block_invoke;
    block[3] = &__block_descriptor_tmp_246;
    block[4] = v4;
    block[5] = a2;
    block[6] = a1;
    dispatch_sync(v5, block);
  }
  else
  {
    _TelephonyUtilDebugPrintError();
  }
  return v4 != 0;
}

BOOL TelephonyBasebandControllerRegisterForEvents(uint64_t a1, __CFRunLoop *a2, uint64_t a3, uint64_t a4)
{
  const void *v6;
  _BOOL8 v7;
  _QWORD v9[6];

  if (a1)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = __TelephonyBasebandControllerRegisterForEvents_block_invoke;
    v9[3] = &__block_descriptor_tmp_65;
    v9[4] = a3;
    v9[5] = a4;
    v6 = *(const void **)(a1 + 80);
    if (v6)
      _Block_release(v6);
    *(_QWORD *)(a1 + 80) = _Block_copy(v9);
    if (_TelephonyBasebandControllerRegisterForService(*(IONotificationPort **)(a1 + 24), (io_object_t *)(a1 + 32), *(_DWORD *)(a1 + 4), *(__CFRunLoopSource **)(a1 + 40), a2, (IOServiceInterestCallback)_TelephonyBasebandEventCallback, (void *)a1))
    {
      *(_QWORD *)(a1 + 48) = a2;
      v7 = _TelephonyBasebandControllerInsertInEventQueue(a1, (uint64_t)a2);
    }
    else
    {
      v7 = 0;
    }
    _TelephonyUtilDebugPrint();
  }
  else
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
  return v7;
}

uint64_t _TelephonyBasebandEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  NSObject *v9;
  void (*v10)(uint64_t);
  void *v11;
  uint64_t block;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  uint64_t v16;

  if (!a1)
    return _TelephonyUtilDebugPrintError();
  switch(a3)
  {
    case 0xE3FF8007:
      _TelephonyUtilDebugPrint();
      v9 = *(NSObject **)(a1 + 72);
      block = MEMORY[0x24BDAC760];
      v10 = ___TelephonyBasebandControllerRemoveAllFromWakeQueue_block_invoke;
      v13 = 0x40000000;
      v11 = &__block_descriptor_tmp_243;
      goto LABEL_6;
    case 0xE3FF800D:
      _TelephonyUtilDebugPrint();
      v9 = *(NSObject **)(a1 + 72);
      block = MEMORY[0x24BDAC760];
      v10 = ___TelephonyBasebandControllerRemoveAllFromCoredumpReadyQueue_block_invoke;
      v13 = 0x40000000;
      v11 = &__block_descriptor_tmp_244;
LABEL_6:
      v14 = v10;
      v15 = v11;
      v16 = a1;
      dispatch_sync(v9, &block);
      break;
    default:
      _TelephonyUtilDebugPrint();
      break;
  }
  result = *(_QWORD *)(a1 + 80);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a4);
  return result;
}

uint64_t TelephonyBasebandControllerDeregisterForEvents(uint64_t a1)
{
  NSObject *v2;
  const void *v3;
  io_object_t v4;
  uint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 72);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 1107296256;
    v7[2] = __TelephonyBasebandControllerDeregisterForEvents_block_invoke;
    v7[3] = &__block_descriptor_tmp_68;
    v7[4] = &v8;
    v7[5] = a1;
    dispatch_sync(v2, v7);
    if (*(_QWORD *)(a1 + 48))
      *(_QWORD *)(a1 + 48) = 0;
    v3 = *(const void **)(a1 + 80);
    if (v3)
    {
      _Block_release(v3);
      *(_QWORD *)(a1 + 80) = 0;
    }
    v4 = *(_DWORD *)(a1 + 32);
    if (v4)
    {
      IOObjectRelease(v4);
      *(_DWORD *)(a1 + 32) = 0;
    }
    _TelephonyUtilDebugPrint();
  }
  else
  {
    _TelephonyUtilDebugPrintError();
  }
  v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t _TelephonyBasebandControllerRemoveFromEventQueue_sync(uint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  _QWORD *v5;

  result = *a1;
  if (result)
  {
    while (1)
    {
      v4 = *(_QWORD *)(result + 8);
      if (*(_QWORD *)result == a2)
        break;
      result = *(_QWORD *)(result + 8);
      if (!v4)
        return result;
    }
    v5 = *(_QWORD **)(result + 16);
    if (v4)
    {
      *(_QWORD *)(v4 + 16) = v5;
      v5 = *(_QWORD **)(result + 16);
    }
    else
    {
      a1[1] = (uint64_t)v5;
    }
    *v5 = v4;
    free((void *)result);
    return 1;
  }
  return result;
}

uint64_t TelephonyBasebandControllerClearFreqListExt(unsigned int *a1, uint64_t a2)
{
  uint64_t input;

  input = a2;
  _TelephonyUtilDebugPrint();
  return _TelephonyBasebandControllerCallMethod(a1, 0x20u, (int)"clear frequency list", &input, 1u, 0, 0);
}

uint64_t _TelephonyBasebandControllerLoadConfig()
{
  uint64_t v0;
  _QWORD block[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  char v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2000000000;
  v6 = 1;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 1107296256;
  block[2] = ___TelephonyBasebandControllerLoadConfig_block_invoke;
  block[3] = &__block_descriptor_tmp_264;
  block[4] = &v3;
  if (_TelephonyBasebandControllerLoadConfig_sLoadOnce != -1)
    dispatch_once(&_TelephonyBasebandControllerLoadConfig_sLoadOnce, block);
  v0 = *((unsigned __int8 *)v4 + 24);
  _Block_object_dispose(&v3, 8);
  return v0;
}

uint64_t TelephonyBasebandControllerGetMaximumRecoveryTime(uint64_t a1, _DWORD *a2)
{
  uint64_t Config;
  int v4;

  Config = _TelephonyBasebandControllerLoadConfig();
  if ((_DWORD)Config)
  {
    v4 = dword_254A2AC88;
    *a2 = dword_254A2AC88;
    if (v4)
      *a2 += TelephonyCapabilitiesRadioCoreDumpCaptureTime() + 30000;
  }
  return Config;
}

uint64_t TelephonyBasebandControllerPollGPIO(unsigned int *a1, int a2, int a3, int a4, int a5)
{
  unsigned int v10;
  useconds_t v11;
  const char *v12;
  uint32_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  BOOL v18;
  useconds_t v19;
  unsigned int v20;
  int v21;
  unsigned int v22;
  uint64_t result;
  uint32_t outputCnt;
  time_t v25;
  time_t v26;

  v26 = 0;
  time(&v26);
  if (!a4)
    return 0;
  v10 = 1000 * a4;
  if (a5)
    v11 = 1000 * a5;
  else
    v11 = 1000 * a4;
  v12 = "EFS_ERASE_DONE";
  v13 = 17;
  v14 = 16;
  v15 = 1;
  switch(a2)
  {
    case 1:
      goto LABEL_17;
    case 2:
    case 4:
      goto LABEL_8;
    case 8:
      v13 = 18;
      v12 = "RESET_REQUEST";
      goto LABEL_17;
    default:
      _TelephonyUtilDebugPrintError();
      v15 = 0;
      v14 = 0;
LABEL_8:
      switch(a2)
      {
        case 8:
          v12 = "RESET_REQUEST";
          if ((v15 & 1) == 0)
            goto LABEL_12;
          break;
        case 4:
          v12 = "DIAG_READY_DONE";
          if ((v15 & 1) == 0)
            goto LABEL_12;
          break;
        case 2:
          v12 = "EFS_RECONSTRUCTION_DONE";
          if ((v15 & 1) == 0)
          {
LABEL_12:
            LOBYTE(v16) = 0;
            v17 = 0;
            goto LABEL_26;
          }
          break;
        default:
          v12 = "UNDEFINED_PIN";
          if (!v15)
            goto LABEL_12;
          break;
      }
      v13 = v14;
LABEL_17:
      v18 = 0;
      v25 = 0;
      outputCnt = 1;
      v19 = v11;
      do
      {
        v20 = v19;
        v16 = _TelephonyBasebandControllerCallMethod(a1, v13, (int)v12, 0, 0, (uint64_t *)&v25, &outputCnt);
        if (v16)
          v18 = v25 != 0;
        else
          _TelephonyUtilDebugPrintError();
        if (((!v18 ^ a3) & 1) != 0)
          break;
        if (v20 >= v10)
          break;
        if (((v16 ^ 1) & 1) != 0)
          break;
        usleep(v11);
        v19 = v20 + v11;
      }
      while ((v16 & 1) != 0);
      v17 = v18;
LABEL_26:
      v21 = v16 & (v17 == a3);
      _TelephonyUtilDebugPrint();
      if (!v21)
        return 0;
      v25 = 0;
      time(&v25);
      v22 = (difftime(v25, v26) * 1000.0);
      if (v22 <= 1)
        result = 1;
      else
        result = v22;
      break;
  }
  return result;
}

uint64_t TelephonyBasebandControllerSetManagerState(unsigned int *a1, unsigned int a2)
{
  const char *v4;
  uint64_t input;

  input = a2;
  _TelephonyUtilDebugPrint();
  if (a2)
    v4 = "Started";
  else
    v4 = "Stopped";
  return _TelephonyBasebandControllerCallMethod(a1, 0x16u, (int)v4, &input, 1u, 0, 0);
}

uint64_t TelephonyBasebandControllerGetManagerState(unsigned int *a1, _DWORD *a2)
{
  int v3;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;

  outputCnt = 1;
  if (!a2)
    return 0;
  output = 0xAAAAAAAAAAAAAAAALL;
  v3 = _TelephonyBasebandControllerCallMethod(a1, 0x17u, (int)"get manager state", 0, 0, &output, &outputCnt);
  result = 0;
  if (v3)
  {
    *a2 = output;
    return 1;
  }
  return result;
}

uint64_t TelephonyBasebandControllerSetChargerDesense(unsigned int *a1, unsigned int a2)
{
  const char *v3;
  uint64_t input;

  input = a2;
  if (a2)
    v3 = "Charger Desense On";
  else
    v3 = "Charger Desense Off";
  _TelephonyUtilDebugPrint();
  return _TelephonyBasebandControllerCallMethod(a1, 0x19u, (int)v3, &input, 1u, 0, 0);
}

uint64_t TelephonyBasebandControllerGetCoredumpReadyStatus(unsigned int *a1, BOOL *a2)
{
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  if (a2
    && _TelephonyBasebandControllerCallMethod(a1, 0x2Au, (int)"get coredump ready status", 0, 0, &output, &outputCnt))
  {
    *a2 = output != 0;
    _TelephonyUtilDebugPrint();
    return 1;
  }
  else
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
}

uint64_t TelephonyBasebandControllerGetBasebandState(unsigned int *a1, _DWORD *a2)
{
  uint64_t v3;
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  if (!a2)
    return 0;
  v3 = _TelephonyBasebandControllerCallMethod(a1, 0x1Au, (int)"get baseband state", 0, 0, &output, &outputCnt);
  if ((_DWORD)v3)
    *a2 = output;
  _TelephonyUtilDebugPrint();
  return v3;
}

uint64_t TelephonyBasebandControllerSetBasebandState(unsigned int *a1, unsigned int a2)
{
  uint32_t outputCnt;
  uint64_t input;

  input = a2;
  outputCnt = 0;
  _TelephonyUtilDebugPrint();
  return _TelephonyBasebandControllerCallMethod(a1, 0x1Bu, (int)"Set Baseband State", &input, 1u, 0, &outputCnt);
}

uint64_t TelephonyBasebandControllerGetBasebandProperty(unsigned int *a1, unsigned int a2, uint64_t *a3)
{
  uint64_t v4;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input;

  input = a2;
  outputCnt = 1;
  if (!a3)
    return 0;
  output = 0xAAAAAAAAAAAAAAAALL;
  v4 = _TelephonyBasebandControllerCallMethod(a1, 0x1Cu, (int)"get baseband property", &input, 1u, &output, &outputCnt);
  if ((_DWORD)v4)
    *a3 = output;
  _TelephonyUtilDebugPrint();
  return v4;
}

uint64_t TelephonyBasebandControllerSetBasebandProperty(unsigned int *a1, unsigned int a2, uint64_t a3)
{
  uint32_t outputCnt;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  outputCnt = 0;
  _TelephonyUtilDebugPrint();
  return _TelephonyBasebandControllerCallMethod(a1, 0x1Du, (int)"set baseband property", input, 2u, 0, &outputCnt);
}

uint64_t TelephonyBasebandControllerReportThermalData(unsigned int *a1, const void *a2, unsigned int a3, _DWORD *a4)
{
  uint64_t result;
  kern_return_t v9;
  uint32_t outputCnt;
  uint64_t output;

  _TelephonyUtilDebugPrint();
  if (a1 && a2 && a4)
  {
    output = 0xAAAAAAAAAAAAAAAALL;
    outputCnt = 1;
    *a4 = 255;
    result = *a1;
    if ((_DWORD)result)
    {
      v9 = IOConnectCallMethod(result, 0x1Eu, 0, 0, a2, a3, &output, &outputCnt, 0, 0);
      result = 0;
      if (!v9)
      {
        *a4 = output;
        return 1;
      }
    }
  }
  else
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
  return result;
}

uint64_t TelephonyBasebandControllerResetSPMI(unsigned int *a1, uint64_t a2)
{
  uint64_t input;

  input = a2;
  _TelephonyUtilDebugPrint();
  return _TelephonyBasebandControllerCallMethod(a1, 0x23u, (int)"Reset SPMI", &input, 1u, 0, 0);
}

uint64_t TelephonyBasebandControllerGNSSTrapTrigger(unsigned int *a1)
{
  uint64_t input[3];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  _TelephonyUtilDebugPrint();
  *(_OWORD *)input = __const_TelephonyBasebandControllerGNSSTrapTrigger_data;
  return _TelephonyBasebandControllerCallMethodGeneric(a1, 0x2Du, (int)"GNSS trigger trap", input, 2u, 0, 0, 0, 0, 0, 0, 1);
}

uint64_t TelephonyBasebandControllerGNSSWakeTrigger(unsigned int *a1)
{
  uint64_t input[3];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  _TelephonyUtilDebugPrint();
  *(_OWORD *)input = __const_TelephonyBasebandControllerGNSSWakeTrigger_data;
  return _TelephonyBasebandControllerCallMethodGeneric(a1, 0x2Du, (int)"GNSS trigger wake", input, 2u, 0, 0, 0, 0, 0, 0, 1);
}

uint64_t TelephonyBasebandControllerSPMIRawWrite(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4, unsigned int a5)
{
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  _OWORD inputStruct[4];
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  _TelephonyUtilDebugPrint();
  if (!a4)
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
  if (a5 >= 0x41)
  {
    _TelephonyUtilDebugPrint();
    return 0;
  }
  _TelephonyUtilDebugPrint();
  if (a5)
  {
    v11 = a4;
    v12 = a5;
    do
    {
      ++v11;
      _TelephonyUtilDebugPrint();
      --v12;
    }
    while (v12);
  }
  _TelephonyUtilDebugPrint();
  input[0] = a2;
  input[1] = a3;
  input[2] = a5;
  *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  inputStruct[2] = v13;
  inputStruct[3] = v13;
  inputStruct[0] = v13;
  inputStruct[1] = v13;
  __memcpy_chk();
  return _TelephonyBasebandControllerCallMethodGeneric(a1, 0x24u, (int)"SPMI raw-write", input, 3u, inputStruct, 0x40uLL, 0, 0, 0, 0, 1);
}

uint64_t TelephonyBasebandControllerSPMIRawRead(unsigned int *a1, unsigned int a2, unsigned int a3, unsigned int a4, void *a5)
{
  uint64_t v10;
  _OWORD *v12;
  uint64_t v13;
  size_t v14;
  _OWORD __src[4];
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  _TelephonyUtilDebugPrint();
  if (!a5)
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
  if (a4 >= 0x41)
  {
    _TelephonyUtilDebugPrint();
    return 0;
  }
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  memset(__src, 0, sizeof(__src));
  v14 = 64;
  v10 = _TelephonyBasebandControllerCallMethodGeneric(a1, 0x25u, (int)"SPMI raw-read", input, 3u, 0, 0, 0, 0, __src, &v14, 1);
  if ((v10 & 1) != 0)
  {
    _TelephonyUtilDebugPrint();
    if (a4)
    {
      v12 = __src;
      v13 = a4;
      do
      {
        v12 = (_OWORD *)((char *)v12 + 1);
        _TelephonyUtilDebugPrint();
        --v13;
      }
      while (v13);
    }
    _TelephonyUtilDebugPrint();
    memcpy(a5, __src, a4);
  }
  else
  {
    _TelephonyUtilDebugPrintError();
  }
  return v10;
}

uint64_t TelephonyBasebandControllerSPMIReg0Write(unsigned int *a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  _TelephonyUtilDebugPrint();
  input[0] = a2;
  input[1] = a3;
  return _TelephonyBasebandControllerCallMethodGeneric(a1, 0x2Du, (int)"SPMI reg0write", input, 2u, 0, 0, 0, 0, 0, 0, 1);
}

uint64_t TelephonyBasebandControllerSPMIGetEvents(unsigned int *a1, void *a2, unsigned int *a3)
{
  __int128 v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  __int128 v11;
  tm *v12;
  time_t v14;
  size_t __n;
  char v16[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD __src[10];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  _TelephonyUtilDebugPrint();
  if (a2 && a3)
  {
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __src[8] = v6;
    __src[9] = v6;
    __src[6] = v6;
    __src[7] = v6;
    __src[4] = v6;
    __src[5] = v6;
    __src[2] = v6;
    __src[3] = v6;
    __src[0] = v6;
    __src[1] = v6;
    __n = 16 * *a3;
    v7 = _TelephonyBasebandControllerCallMethodGeneric(a1, 0x29u, (int)"SPMI get-events", 0, 0, 0, 0, 0, 0, __src, &__n, 1);
    if ((_DWORD)v7)
    {
      v8 = *a3;
      if ((_DWORD)v8)
      {
        v9 = 0;
        v10 = (char *)__src + 8;
        do
        {
          if (*((_QWORD *)v10 - 1))
          {
            v14 = *((_QWORD *)v10 - 1);
            *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v18 = v11;
            v19 = v11;
            *(_OWORD *)v16 = v11;
            v17 = v11;
            v12 = localtime(&v14);
            strftime(v16, 0x40uLL, "%Y-%m-%d %H:%M:%S", v12);
            _TelephonyUtilDebugPrint();
            _TelephonyUtilDebugPrint();
            _TelephonyUtilDebugPrint();
            v8 = *a3;
          }
          ++v9;
          v10 += 16;
        }
        while (v9 < v8);
      }
      memcpy(a2, __src, __n);
    }
    else
    {
      _TelephonyUtilDebugPrintError();
    }
  }
  else
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
  return v7;
}

void _TelephonyBasebandControllerServiceNotifyCallback(uint64_t a1, io_iterator_t iterator)
{
  io_object_t v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    _TelephonyUtilDebugPrintError();
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 136315138;
    v8 = "TelephonyBasebandController";
    v5 = MEMORY[0x24BDACB70];
    v6 = "%s: context cannot be NULL";
    goto LABEL_10;
  }
  v3 = IOIteratorNext(iterator);
  if (!v3)
  {
    _TelephonyUtilDebugPrintError();
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 136315138;
    v8 = "TelephonyBasebandController";
    v5 = MEMORY[0x24BDACB70];
    v6 = "%s: no service is found";
LABEL_10:
    _os_log_error_impl(&dword_20E5DE000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
    return;
  }
  *(_DWORD *)(a1 + 4) = v3;
  v4 = *(NSObject **)(a1 + 16);
  if (v4)
    dispatch_group_leave(v4);
}

const char *_TelephonyBasebandPowerDebugCommandMaskToString(int a1)
{
  int v1;
  const char *result;

  if (a1 > 15)
  {
    switch(a1)
    {
      case 16:
        return "warm-reset";
      case 32:
        return "crash-modem-with-spmi";
      case 64:
        return "coredump";
      default:
        return "???";
    }
  }
  else
  {
    v1 = a1 - 1;
    result = "no-op";
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        result = "power-off";
        break;
      case 3:
        result = "power-on";
        break;
      case 7:
        result = "cold-reset";
        break;
      default:
        return "???";
    }
  }
  return result;
}

uint64_t _TelephonyBasebandPowerDebugBlockingThread(uint64_t a1)
{
  int v2;
  __CFRunLoop *Current;
  CFAbsoluteTime v4;
  unint64_t v5;
  double v6;
  __CFRunLoopTimer *v7;
  __CFRunLoopTimer *v8;
  const __CFString *v9;
  const void *Controller;
  const void *v11;
  FILE **v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  CFRunLoopTimerContext v16;
  uint64_t v17;
  __CFRunLoopTimer *v18;

  v2 = isatty(1);
  Current = CFRunLoopGetCurrent();
  v17 = 0;
  v18 = 0;
  atomic_store(0, (unsigned __int8 *)&v17);
  atomic_store(0, (unsigned __int8 *)&v17 + 1);
  v16.version = 0;
  memset(&v16.retain, 0, 24);
  v16.info = &v17;
  if (*(_DWORD *)(a1 + 8))
  {
    v4 = CFAbsoluteTimeGetCurrent();
    LODWORD(v5) = *(_DWORD *)(a1 + 8);
    v6 = v4 + (double)v5 / 1000.0;
  }
  else
  {
    v6 = 1.79769313e308;
  }
  v7 = CFRunLoopTimerCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v6, 0.0, 0, 0, (CFRunLoopTimerCallBack)_TelephonyBasebandPowerDebugTimeoutCallback, &v16);
  if (v7)
  {
    v8 = v7;
    v18 = v7;
    v9 = (const __CFString *)*MEMORY[0x24BDBD5A0];
    CFRunLoopAddTimer(Current, v7, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    Controller = TelephonyBasebandCreateController();
    if (Controller)
    {
      v11 = Controller;
      if ((TelephonyBasebandControllerRegisterForReset((uint64_t)Controller + 16, Current, (uint64_t)_TelephonyBasebandPowerDebugUnblockCallback, (uint64_t)&v17) & 1) == 0)goto LABEL_15;
      _TelephonyUtilDebugPrint();
      if (v2)
      {
        puts("================== POWER DEBUG BLOCKING ==================");
        v12 = (FILE **)MEMORY[0x24BDAC8E8];
        fflush((FILE *)*MEMORY[0x24BDAC8E8]);
        CFRunLoopRun();
        _TelephonyUtilDebugPrint();
        puts("================== POWER DEBUG UNBLOCKED =================");
        fflush(*v12);
      }
      else
      {
        CFRunLoopRun();
        _TelephonyUtilDebugPrint();
      }
      v13 = atomic_load((unsigned __int8 *)&v17);
      if ((v13 & 1) != 0 || (v14 = atomic_load((unsigned __int8 *)&v17 + 1), (v14 & 1) != 0))
        _TelephonyUtilDebugPrint();
      else
LABEL_15:
        _TelephonyUtilDebugPrintError();
      CFRelease(v11);
    }
    else
    {
      _TelephonyUtilDebugPrintError();
    }
    CFRunLoopRemoveTimer(Current, v8, v9);
    CFRelease(v8);
  }
  else
  {
    _TelephonyUtilDebugPrintError();
  }
  return 0;
}

void _TelephonyBasebandPowerDebugTimeoutCallback(uint64_t a1, unsigned __int8 *a2)
{
  unsigned __int8 v3;
  __CFRunLoop *Current;

  _TelephonyUtilDebugPrint();
  v3 = atomic_load(a2);
  if ((v3 & 1) == 0)
  {
    atomic_store(1u, a2 + 1);
    Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
  }
}

void _TelephonyBasebandPowerDebugUnblockCallback(uint64_t a1, uint64_t a2, int a3)
{
  unsigned __int8 v4;
  __CFRunLoop *Current;

  if (a3 == -469794798)
  {
    _TelephonyUtilDebugPrint();
    v4 = atomic_load((unsigned __int8 *)(a1 + 1));
    if ((v4 & 1) == 0)
    {
      atomic_store(1u, (unsigned __int8 *)a1);
      CFRunLoopTimerInvalidate(*(CFRunLoopTimerRef *)(a1 + 8));
      Current = CFRunLoopGetCurrent();
      CFRunLoopStop(Current);
    }
  }
}

uint64_t TelephonyBasebandControllerIsBootStageDown(uint64_t a1)
{
  if (qword_253D92510 != -1)
    dispatch_once(&qword_253D92510, &__block_literal_global_207);
  if (qword_253D92518)
    return (*(uint64_t (**)(_QWORD, uint64_t))(qword_253D92518 + 8))(*(_QWORD *)qword_253D92518, a1);
  _TelephonyUtilDebugPrintError();
  return 0;
}

uint64_t TelephonyBasebandControllerIsBootStageDownABP(const char *a1, BOOL *a2)
{
  mach_port_t v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  io_object_t v6;
  const __CFNumber *CFProperty;
  const __CFNumber *v8;
  CFTypeID v9;
  uint64_t v10;
  unsigned int valuePtr;

  v3 = *MEMORY[0x24BDD8B18];
  v4 = IOServiceMatching(a1);
  MatchingService = IOServiceGetMatchingService(v3, v4);
  if (MatchingService)
  {
    v6 = MatchingService;
    CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("bootstage"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    valuePtr = -1431655766;
    if (CFProperty)
    {
      v8 = CFProperty;
      v9 = CFGetTypeID(CFProperty);
      if (v9 == CFNumberGetTypeID() && CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr))
      {
        *a2 = valuePtr < 2;
        v10 = 1;
      }
      else
      {
        _TelephonyUtilDebugPrintError();
        v10 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      _TelephonyUtilDebugPrintError();
      v10 = 0;
    }
    IOObjectRelease(v6);
  }
  else
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
  return v10;
}

uint64_t TelephonyBasebandControllerIsBootStageDownACIPC(const char *a1, BOOL *a2)
{
  mach_port_t v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  io_object_t v6;
  const __CFNumber *CFProperty;
  const __CFNumber *v8;
  CFTypeID v9;
  uint64_t v10;
  int valuePtr;

  v3 = *MEMORY[0x24BDD8B18];
  v4 = IOServiceMatching(a1);
  MatchingService = IOServiceGetMatchingService(v3, v4);
  if (MatchingService)
  {
    v6 = MatchingService;
    CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("bootstage"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    valuePtr = -1431655766;
    if (CFProperty)
    {
      v8 = CFProperty;
      v9 = CFGetTypeID(CFProperty);
      if (v9 == CFNumberGetTypeID() && CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr))
      {
        *a2 = (valuePtr + 1) < 2;
        v10 = 1;
      }
      else
      {
        _TelephonyUtilDebugPrintError();
        v10 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      _TelephonyUtilDebugPrintError();
      v10 = 0;
    }
    IOObjectRelease(v6);
  }
  else
  {
    _TelephonyUtilDebugPrintError();
    return 0;
  }
  return v10;
}

void _TelephonyBasebandControllerInsertInCoredumpReadyQueue(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD v3[6];

  v2 = *(NSObject **)(a1 + 72);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 0x40000000;
  v3[2] = ___TelephonyBasebandControllerInsertInCoredumpReadyQueue_block_invoke;
  v3[3] = &__block_descriptor_tmp_232;
  v3[4] = a2;
  v3[5] = a1;
  dispatch_sync(v2, v3);
}

void _TelephonyBasebandControllerRemoveFromCoredumpReadyQueue(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD v3[6];

  v2 = *(NSObject **)(a1 + 72);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 0x40000000;
  v3[2] = ___TelephonyBasebandControllerRemoveFromCoredumpReadyQueue_block_invoke;
  v3[3] = &__block_descriptor_tmp_233;
  v3[4] = a2;
  v3[5] = a1;
  dispatch_sync(v2, v3);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
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

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2D0](rl, timer, mode);
}

Boolean CFRunLoopContainsSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  return MEMORY[0x24BDBC2E0](rl, source, mode);
}

CFRunLoopMode CFRunLoopCopyCurrentMode(CFRunLoopRef rl)
{
  return (CFRunLoopMode)MEMORY[0x24BDBC2F0](rl);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x24BDBC338](rl, mode, block);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

void CFRunLoopRemoveTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC350](rl, timer, mode);
}

void CFRunLoopRun(void)
{
  MEMORY[0x24BDBC358]();
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC388](rl);
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x24BDBC390](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
  MEMORY[0x24BDBC3A8](timer);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x24BDD8938](*(_QWORD *)&entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89B0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t TelephonyCapabilitiesRadioCoreDumpCaptureTime()
{
  return MEMORY[0x24BED96B0]();
}

uint64_t TelephonyCapabilitiesRadioCoreDumpSupportsSPMISignalling()
{
  return MEMORY[0x24BED96B8]();
}

uint64_t TelephonyCapabilitiesRadioGetSafeResetTime()
{
  return MEMORY[0x24BED96C0]();
}

uint64_t TelephonyRadiosGetRadio()
{
  return MEMORY[0x24BED96E0]();
}

uint64_t TelephonyRadiosGetRadioVendor()
{
  return MEMORY[0x24BED96E8]();
}

uint64_t TelephonyUtilDisplayAlert()
{
  return MEMORY[0x24BED9708]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
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

uint64_t _TelephonyUtilDebugPrint()
{
  return MEMORY[0x24BED97C0]();
}

uint64_t _TelephonyUtilDebugPrintError()
{
  return MEMORY[0x24BED97D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t ctu::cf::MakeCFString::MakeCFString(ctu::cf::MakeCFString *this, const char *a2)
{
  return MEMORY[0x24BED9A78](this, a2);
}

void ctu::cf::MakeCFString::~MakeCFString(ctu::cf::MakeCFString *this)
{
  MEMORY[0x24BED9A80](this);
}

uint64_t ctu::cf::plist_adapter::plist_adapter(ctu::cf::plist_adapter *this, const __CFString *a2, const __CFString *a3)
{
  return MEMORY[0x24BED9AB8](this, a2, a3);
}

void ctu::cf::plist_adapter::~plist_adapter(ctu::cf::plist_adapter *this)
{
  MEMORY[0x24BED9AC0](this);
}

uint64_t ctu::cf::assign(ctu::cf *this, BOOL *a2, const __CFBoolean *a3)
{
  return MEMORY[0x24BED9AF8](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, unsigned int *a2, const __CFNumber *a3)
{
  return MEMORY[0x24BED9B10](this, a2, a3);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24C971D80(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C971D88(__sz);
}

uint64_t __TUAssertTrigger()
{
  return MEMORY[0x24BED9EF0]();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
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

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

double difftime(time_t a1, time_t a2)
{
  double result;

  MEMORY[0x24BDADC30](a1, a2);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int getchar(void)
{
  return MEMORY[0x24BDAE5D0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

int isatty(int a1)
{
  return MEMORY[0x24BDAE8E0](*(_QWORD *)&a1);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x24BDAEA98](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF778](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF790](a1);
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x24BDAF798](__attr, *(_QWORD *)&__qos_class, *(_QWORD *)&__relative_priority);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x24BDAFF28](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

