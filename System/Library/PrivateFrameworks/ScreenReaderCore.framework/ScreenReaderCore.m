BOOL SCRCIsUInt32BitSafe(unint64_t a1)
{
  return a1 < 0xFFFFFFFF;
}

BOOL SCRCIsInt32BitSafe(uint64_t a1)
{
  return a1 != (int)a1;
}

void SCRCArgumentParserRunWithClassName(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  v6 = MEMORY[0x212BD40C0](0);
  v7 = objc_msgSend(objc_alloc(NSClassFromString((NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a3))), "initWithArgc:argv:", a1, a2);
  v8 = (void *)_Parser;
  _Parser = v7;

  if ((objc_msgSend((id)_Parser, "parse") & 1) != 0)
  {
    MEMORY[0x212BD40B4](v6);
    v9 = _mainProc();
    v10 = (void *)_Parser;
    _Parser = 0;

    exit(v9);
  }
  v11 = (void *)_Parser;
  _Parser = 0;

  MEMORY[0x212BD40B4](v6);
  exit(1);
}

uint64_t _mainProc()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = MEMORY[0x212BD40C0](0);
  MEMORY[0x212BD40B4](v0);
  v1 = MEMORY[0x212BD40C0](0);
  v2 = objc_msgSend((id)_Parser, "run");
  MEMORY[0x212BD40B4](v1);
  return v2;
}

void SCRCEnableProcessKeepAlive()
{
  if (vproc_swap_integer())
    NSLog(CFSTR("VoiceOver could not toggle keep alive: "));
}

id _SCRCArgumentParserShowHelp()
{
  return (id)objc_msgSend((id)_Parser, "_displayHelp:", 0);
}

void _consoleUserChanged()
{
  id v0;
  const char *v1;
  pid_t v2;
  mach_msg_header_t msg;

  objc_msgSend((id)_Parser, "appName");
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = (const char *)objc_msgSend(v0, "UTF8String");
  v2 = getpid();
  syslog(3, "%s[%d]: Stopping because login happened\n", v1, v2);

  *(_OWORD *)&msg.msgh_bits = xmmword_211014E90;
  *(_QWORD *)&msg.msgh_voucher_port = 0x100000000;
  if (mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0) == 268435460)
    mach_msg_destroy(&msg);
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

id SCRCFileHandleForTempFile(void *a1)
{
  void *v1;
  void *v2;
  id v3;

  _GetTempFile(a1, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

id _GetTempFile(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  size_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;

  v3 = a1;
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingString:", CFSTR("XXXXXX"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length");
  v8 = 2 * v7;
  v9 = malloc_type_malloc(2 * v7, 0x100004077774924uLL);
  if (!v9)
    goto LABEL_12;
  v10 = v9;
  if ((objc_msgSend(v6, "getFileSystemRepresentation:maxLength:", v9, v8) & 1) != 0)
    goto LABEL_8;
  free(v10);
  v11 = v8 >= 0x200 ? 4 * v7 : 1024;
  v12 = malloc_type_malloc(v11, 0x100004077774924uLL);
  if (!v12)
  {
LABEL_12:
    v15 = 0;
    goto LABEL_17;
  }
  v10 = v12;
  objc_msgSend(v6, "getFileSystemRepresentation:maxLength:", v12, v11);
LABEL_8:
  v13 = 15;
  while (1)
  {
    v14 = mkstemp((char *)v10);
    if ((_DWORD)v14 != -1)
      break;
    if (!--v13)
    {
      v15 = 0;
      goto LABEL_16;
    }
  }
  v16 = v14;
  if (a2)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1578]), "initWithFileDescriptor:closeOnDealloc:", v14, 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFileSystemRepresentation:length:", v10, strlen((const char *)v10));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    close(v16);

  }
LABEL_16:
  free(v10);
LABEL_17:

  return v15;
}

id SCRCPathForTempFile(void *a1)
{
  void *v1;
  void *v2;
  id v3;

  _GetTempFile(a1, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;
  v3 = v2;

  return v3;
}

UInt8 *SCRCCopyStringToUChar32Array(const __CFString *a1, unint64_t *a2)
{
  CFIndex Length;
  CFIndex v5;
  uint64_t v6;
  UInt8 *v7;
  CFStringEncoding v8;
  unint64_t v9;
  CFIndex usedBufLen;
  CFRange v12;

  *a2 = 0;
  if (!a1)
    return 0;
  Length = CFStringGetLength(a1);
  if (!Length)
    return 0;
  v5 = Length;
  v6 = 4 * Length + 4;
  v7 = (UInt8 *)malloc_type_malloc(v6, 0xDFD578FDuLL);
  usedBufLen = 0;
  if (v7)
  {
    v8 = SCRCUTF32Encoding();
    v12.location = 0;
    v12.length = v5;
    CFStringGetBytes(a1, v12, v8, 0, 0, v7, v6, &usedBufLen);
    v9 = (unint64_t)usedBufLen >> 2;
  }
  else
  {
    v9 = 0;
  }
  *a2 = v9;
  return v7;
}

__CFString *_CopyUnicodeDescriptionStringForCharacter(UChar32 a1)
{
  const __CFAllocator *v2;
  const __CFString *v3;
  const __CFString *v4;
  __CFString *MutableCopy;
  const __CFLocale *System;
  int v8;
  char buffer[500];
  uint64_t v10;
  CFRange v11;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  if (u_charName(a1, U_EXTENDED_CHAR_NAME, buffer, 500, (UErrorCode *)&v8) < 1 || v8 != 0)
    return 0;
  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], buffer, 0x8000100u);
  if (!v3)
    return 0;
  v4 = v3;
  v11.location = 0;
  v11.length = 1;
  if (CFStringCompareWithOptions(v3, CFSTR("<"), v11, 0))
  {
    MutableCopy = CFStringCreateMutableCopy(v2, 0, v4);
    System = CFLocaleGetSystem();
    CFStringLowercase(MutableCopy, System);
  }
  else
  {
    MutableCopy = 0;
  }
  CFRelease(v4);
  return MutableCopy;
}

UInt8 *SCRCCopyStringToUniCharArray(const __CFString *a1, unint64_t *a2)
{
  CFIndex Length;
  CFIndex v5;
  uint64_t v6;
  UInt8 *v7;
  CFStringEncoding v8;
  unint64_t v9;
  CFIndex usedBufLen;
  CFRange v12;

  *a2 = 0;
  if (!a1)
    return 0;
  Length = CFStringGetLength(a1);
  if (!Length)
    return 0;
  v5 = Length;
  v6 = (4 * Length) | 2;
  v7 = (UInt8 *)malloc_type_malloc(v6, 0xA346DC12uLL);
  usedBufLen = 0;
  if (v7)
  {
    v8 = SCRCUTF16Encoding();
    v12.location = 0;
    v12.length = v5;
    CFStringGetBytes(a1, v12, v8, 0, 0, v7, v6, &usedBufLen);
    v9 = (unint64_t)usedBufLen >> 1;
  }
  else
  {
    v9 = 0;
  }
  *a2 = v9;
  return v7;
}

id SCRCDeepMutableCopyClasses()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)_SCRCDeepMutableCopyClassesSet;
  if (!_SCRCDeepMutableCopyClassesSet)
  {
    v1 = objc_alloc(MEMORY[0x24BDBCF20]);
    v2 = objc_opt_class();
    v3 = objc_opt_class();
    v4 = objc_msgSend(v1, "initWithObjects:", v2, v3, objc_opt_class(), 0);
    v5 = (void *)_SCRCDeepMutableCopyClassesSet;
    _SCRCDeepMutableCopyClassesSet = v4;

    v0 = (void *)_SCRCDeepMutableCopyClassesSet;
  }
  return v0;
}

uint64_t SCRCGestureStateToString()
{
  return 0;
}

void sub_210FF6678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SCRCLogInitializeWithKeys(void *a1)
{
  _SCRCSetLogKeyArray(a1);
  return _SCRCLogInitializeCommonMasks();
}

void SCRCDebugPrint(void *a1)
{
  id v1;
  NSObject *v2;

  v1 = a1;
  if (SCRCLogVoiceOver_onceToken != -1)
    dispatch_once(&SCRCLogVoiceOver_onceToken, &__block_literal_global_1);
  v2 = SCRCLogVoiceOver_Log;
  if (os_log_type_enabled((os_log_t)SCRCLogVoiceOver_Log, OS_LOG_TYPE_DEBUG))
    SCRCDebugPrint_cold_1((uint64_t)v1, v2);

}

void SCRCDebugPrintToFile(void *a1, void *a2)
{
  id v3;
  const char *v4;
  FILE *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  objc_msgSend(a1, "stringByExpandingTildeInPath");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");

  v5 = fopen(v4, "at");
  if (v5 || (v5 = fopen(v4, "wt")) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v7, "setDateFormat:", CFSTR("MM/dd/yy HH:mm:ss.SSS"));
    objc_msgSend(v7, "stringFromDate:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("[ %@ ] %@"), v8, v10));
    fprintf(v5, "%s\n", (const char *)objc_msgSend(v9, "UTF8String"));
    fclose(v5);

  }
}

uint64_t SCRCAddInformationToCrashTracerLog(void *a1)
{
  uint64_t result;

  result = objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  qword_254A8F550 = result;
  return result;
}

void _SCRCSetLogKeyArray(void *a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(a1, "copy");
  v2 = (void *)_SCRCLogKeyArray;
  _SCRCLogKeyArray = v1;

}

uint64_t SCRCLogMaskForKey(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  if ((objc_msgSend((id)_SCRCLogKeyArray, "containsObject:", v1) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "hasPrefix:", CFSTR("SCRCLogMask")))
  {
    objc_msgSend(v1, "substringFromIndex:", 11);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend((id)_SCRCLogKeyArray, "containsObject:", v3);

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t _SCRCLogInitializeCommonMasks()
{
  uint64_t result;

  result = objc_msgSend((id)_SCRCLogKeyArray, "count");
  if (result)
  {
    SCRCLogMaskAppleScript = SCRCLogMaskForKey(CFSTR("SCRCLogMaskAppleScript"));
    SCRCLogMaskBraille = SCRCLogMaskForKey(CFSTR("SCRCLogMaskBraille"));
    SCRCLogMaskBrailleAnnounce = SCRCLogMaskForKey(CFSTR("SCRCLogMaskBrailleAnnounce"));
    SCRCLogMaskBrailleVariant = SCRCLogMaskForKey(CFSTR("SCRCLogMaskBrailleVariant"));
    SCRCLogMaskBusySignal = SCRCLogMaskForKey(CFSTR("SCRCLogMaskBusySignal"));
    SCRCLogMaskConfiguration = SCRCLogMaskForKey(CFSTR("SCRCLogMaskConfiguration"));
    SCRCLogMaskElement = SCRCLogMaskForKey(CFSTR("SCRCLogMaskElement"));
    SCRCLogMaskElementHistory = SCRCLogMaskForKey(CFSTR("SCRCLogMaskElementHistory"));
    SCRCLogMaskElementRestoration = SCRCLogMaskForKey(CFSTR("SCRCLogMaskElementRestoration"));
    SCRCLogMaskError = SCRCLogMaskForKey(CFSTR("SCRCLogMaskError"));
    SCRCLogMaskEvent = SCRCLogMaskForKey(CFSTR("SCRCLogMaskEvent"));
    SCRCLogMaskFindText = SCRCLogMaskForKey(CFSTR("SCRCLogMaskFindText"));
    SCRCLogMaskGuide = SCRCLogMaskForKey(CFSTR("SCRCLogMaskGuide"));
    SCRCLogMaskHotSpot = SCRCLogMaskForKey(CFSTR("SCRCLogMaskHotSpot"));
    SCRCLogMaskInvalidElements = SCRCLogMaskForKey(CFSTR("SCRCLogMaskInvalidElements"));
    SCRCLogMaskKeyboard = SCRCLogMaskForKey(CFSTR("SCRCLogMaskKeyboard"));
    SCRCLogMaskKeyboardFocus = SCRCLogMaskForKey(CFSTR("SCRCLogMaskKeyboardFocus"));
    SCRCLogMaskKeyEcho = SCRCLogMaskForKey(CFSTR("SCRCLogMaskKeyEcho"));
    SCRCLogMaskKeyNames = SCRCLogMaskForKey(CFSTR("SCRCLogMaskKeyNames"));
    SCRCLogMaskLocalization = SCRCLogMaskForKey(CFSTR("SCRCLogMaskLocalization"));
    SCRCLogMaskMenu = SCRCLogMaskForKey(CFSTR("SCRCLogMaskMenu"));
    SCRCLogMaskObserverDispatches = SCRCLogMaskForKey(CFSTR("SCRCLogMaskObserverDispatches"));
    SCRCLogMaskObserverRegistrations = SCRCLogMaskForKey(CFSTR("SCRCLogMaskObserverRegistrations"));
    SCRCLogMaskOutput = SCRCLogMaskForKey(CFSTR("SCRCLogMaskOutput"));
    SCRCLogMaskOutputCompact = SCRCLogMaskForKey(CFSTR("SCRCLogMaskOutputCompact"));
    SCRCLogMaskOutputCompactWithBraille = SCRCLogMaskForKey(CFSTR("SCRCLogMaskOutputCompactWithBraille"));
    SCRCLogMaskOutputRequest = SCRCLogMaskForKey(CFSTR("SCRCLogMaskOutputRequest"));
    SCRCLogMaskSpeechArbitration = SCRCLogMaskForKey(CFSTR("SCRCLogMaskSpeechArbitration"));
    SCRCLogMaskSpeechMessages = SCRCLogMaskForKey(CFSTR("SCRCLogMaskSpeechMessages"));
    SCRCLogMaskSpeechSynthesisDaemonStatus = SCRCLogMaskForKey(CFSTR("SCRCLogMaskSpeechSynthesisDaemonStatus"));
    SCRCLogMaskTextAttributesManager = SCRCLogMaskForKey(CFSTR("SCRCLogMaskTextAttributesManager"));
    SCRCLogMaskTextDisplay = SCRCLogMaskForKey(CFSTR("SCRCLogMaskTextDisplay"));
    SCRCLogMaskThread = SCRCLogMaskForKey(CFSTR("SCRCLogMaskThread"));
    SCRCLogMaskUIElement = SCRCLogMaskForKey(CFSTR("SCRCLogMaskUIElement"));
    SCRCLogMaskUIElementErrors = SCRCLogMaskForKey(CFSTR("SCRCLogMaskUIElementErrors"));
    SCRCLogMaskUserDefaults = SCRCLogMaskForKey(CFSTR("SCRCLogMaskUserDefaults"));
    SCRCLogMaskUserDefaultsSynching = SCRCLogMaskForKey(CFSTR("SCRCLogMaskUserDefaultsSynching"));
    SCRCLogMaskVoiceOverCursor = SCRCLogMaskForKey(CFSTR("SCRCLogMaskVoiceOverCursor"));
    SCRCLogMaskWebGroups = SCRCLogMaskForKey(CFSTR("SCRCLogMaskWebGroups"));
    SCRCLogMaskWebText = SCRCLogMaskForKey(CFSTR("SCRCLogMaskWebText"));
    SCRCLogMaskWindow = SCRCLogMaskForKey(CFSTR("SCRCLogMaskWindow"));
    result = SCRCLogMaskForKey(CFSTR("SCRCLogMaskWorkspace"));
    SCRCLogMaskWorkspace = result;
  }
  return result;
}

uint64_t _SCRCMathUpdateAverage(uint64_t result, unsigned int a2, uint64_t a3, double a4)
{
  double v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;

  *(double *)(result + 432) = a4;
  v4 = *(double *)(result + 416) + a4;
  *(double *)(result + 416) = v4;
  v5 = *(_DWORD *)result + 1;
  *(_DWORD *)result = v5;
  if (a2 >= 0x32)
    v6 = 50;
  else
    v6 = a2;
  v7 = *(int *)(result + 408);
  if (v5 > v6)
  {
    *(double *)(result + 416) = v4 - *(double *)(result + 8 * v7 + 8);
    *(_DWORD *)result = v6;
    v5 = v6;
  }
  *(double *)(result + 8 * v7 + 8) = a4;
  if ((_DWORD)v7 + 1 == v6)
    v8 = 0;
  else
    v8 = v7 + 1;
  *(_DWORD *)(result + 408) = v8;
  if (a3 == 1)
  {
    if (v8 >= 2)
      a4 = (float)((int)(a4 + 360.0 + (double)((int)(*(double *)(result + 424) - a4 + 180.0 + 360.0) % 360 - 180) * 0.5)
                 % 360);
  }
  else
  {
    if (a3)
      return result;
    a4 = *(double *)(result + 416) / (double)v5;
  }
  *(double *)(result + 424) = a4;
  return result;
}

uint64_t SCRCMathUpdateAverage(uint64_t a1, unsigned int a2, double a3)
{
  return _SCRCMathUpdateAverage(a1, a2, 0, a3);
}

uint64_t SCRCMathUpdateAngleAverage(uint64_t a1, unsigned int a2, double a3)
{
  return _SCRCMathUpdateAverage(a1, a2, 1, a3);
}

double SCRCMathGetAverage(uint64_t a1)
{
  return *(double *)(a1 + 424);
}

double SCRCMathClearAverage(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 432) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 400) = 0u;
  *(_OWORD *)(a1 + 416) = 0u;
  *(_OWORD *)(a1 + 368) = 0u;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_OWORD *)(a1 + 352) = 0u;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

double SCRCMathGetDistanceBetweenPoints(double a1, double a2, double a3, double a4)
{
  return fabs(hypot(a1 - a3, a2 - a4));
}

void SCRCMathGetVectorAndDistanceForPoints(double *a1, long double *a2, double a3, double a4, double a5, double a6)
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v9 = a3 - a5;
  v10 = vabdd_f64(a3, a5);
  v11 = vabdd_f64(a4, a6);
  *a2 = hypot(v10, v11);
  if (v9 == 0.0)
    v12 = 90.0;
  else
    v12 = atan(v11 / v10) * 57.2957795;
  v13 = a4 - a6;
  if (v9 >= 0.0)
  {
    if (v13 >= 0.0)
      goto LABEL_11;
    v12 = 90.0 - v12;
    v14 = 270.0;
  }
  else if (v13 <= 0.0)
  {
    v14 = 180.0;
  }
  else
  {
    v14 = 90.0;
    v12 = 90.0 - v12;
  }
  v12 = v12 + v14;
LABEL_11:
  v15 = *a1;
  v16 = v12 + floor(*a1 / 360.0) * 360.0;
  *a1 = v16;
  if (v12 <= 270.0)
  {
    if (v12 >= 90.0)
      return;
    if (v15 <= 180.0 || v15 >= 360.0)
    {
      if (v15 > 0.0)
        return;
    }
    else
    {
      v12 = v16 + 360.0;
    }
    goto LABEL_23;
  }
  if (v15 > 0.0 && v15 < 180.0)
  {
    v12 = v12 + -360.0;
LABEL_23:
    *a1 = v12;
    return;
  }
  if (v15 > 360.0 || v15 == 0.0)
    goto LABEL_23;
}

BOOL SCRCFloatAlmostEqual(float a1, float a2)
{
  return vabds_f32(a1, a2) <= 0.00000011921;
}

BOOL SCRCDoubleAlmostEqual(double a1, double a2)
{
  return vabdd_f64(a1, a2) <= 2.22044605e-16;
}

BOOL SCRCCGFloatAlmostEqual(double a1, double a2)
{
  return vabdd_f64(a1, a2) <= 2.22044605e-16;
}

uint64_t SCRCIsConsoleSessionEnabled()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  const __CFDictionary *v4;
  const void **v5;
  void *v6;
  const __CFBoolean *Value;
  _BOOL8 v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v0 = getCGSSessionCopyCurrentSessionPropertiesSymbolLoc_ptr;
  v13 = getCGSSessionCopyCurrentSessionPropertiesSymbolLoc_ptr;
  if (!getCGSSessionCopyCurrentSessionPropertiesSymbolLoc_ptr)
  {
    v1 = (void *)CoreGraphicsLibrary();
    v0 = dlsym(v1, "CGSSessionCopyCurrentSessionProperties");
    v11[3] = (uint64_t)v0;
    getCGSSessionCopyCurrentSessionPropertiesSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v10, 8);
  if (!v0)
    SCRCIsConsoleSessionEnabled_cold_1();
  v3 = ((uint64_t (*)(uint64_t))v0)(v2);
  if (!v3)
    return 1;
  v4 = (const __CFDictionary *)v3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v5 = (const void **)getkCGSSessionOnConsoleKeySymbolLoc_ptr;
  v13 = (void *)getkCGSSessionOnConsoleKeySymbolLoc_ptr;
  if (!getkCGSSessionOnConsoleKeySymbolLoc_ptr)
  {
    v6 = (void *)CoreGraphicsLibrary();
    v5 = (const void **)dlsym(v6, "kCGSSessionOnConsoleKey");
    v11[3] = (uint64_t)v5;
    getkCGSSessionOnConsoleKeySymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v10, 8);
  if (!v5)
    SCRCIsConsoleSessionEnabled_cold_2();
  Value = (const __CFBoolean *)CFDictionaryGetValue(v4, *v5);
  if (Value)
    v8 = CFBooleanGetValue(Value) != 0;
  else
    v8 = 1;
  CFRelease(v4);
  return v8;
}

void sub_2110051C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t CoreGraphicsLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!CoreGraphicsLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24CB255F8;
    v3 = 0;
    CoreGraphicsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreGraphicsLibraryCore_frameworkLibrary)
    CoreGraphicsLibrary_cold_1(&v1);
  return CoreGraphicsLibraryCore_frameworkLibrary;
}

id SCRCStringForVariableArray(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        if (objc_msgSend(v5, "length", (_QWORD)v13))
          objc_msgSend(v5, "appendString:", v3);
        objc_msgSend(v5, "appendString:", v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

id SCRCAttributedStringForVariables(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id *v15;
  id v16;
  void *v17;
  id *v19;

  v11 = a2;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", &stru_24CB26880);
  if (objc_msgSend(v12, "length"))
    objc_msgSend(v13, "appendAttributedString:", v12);
  objc_opt_class();
  v19 = (id *)&a9;
  if (a1 >= 2)
  {
    v14 = a1 - 1;
    do
    {
      v15 = v19++;
      v16 = *v15;
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v16, "length"))
      {
        if (objc_msgSend(v13, "length"))
        {
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v11);
          objc_msgSend(v13, "appendAttributedString:", v17);

        }
        objc_msgSend(v13, "appendAttributedString:", v16);
      }

      --v14;
    }
    while (v14);
  }

  return v13;
}

id SCRCStringForVariables(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id *v15;
  id v16;
  id *v18;

  v11 = a2;
  v12 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
    objc_msgSend(v13, "appendString:", v12);
  objc_opt_class();
  v18 = (id *)&a9;
  if (a1 >= 2)
  {
    v14 = a1 - 1;
    do
    {
      v15 = v18++;
      v16 = *v15;
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v16, "length"))
      {
        if (objc_msgSend(v13, "length"))
          objc_msgSend(v13, "appendString:", v11);
        objc_msgSend(v13, "appendString:", v16);
      }

      --v14;
    }
    while (v14);
  }

  return v13;
}

uint64_t SCRCUTF32Encoding()
{
  return 469762304;
}

uint64_t SCRCUTF16Encoding()
{
  return 335544576;
}

CFIndex _findMatchingParen(CFStringRef theString, uint64_t a2, CFIndex idx, CFIndex a4)
{
  CFIndex v5;
  int CharacterAtIndex;
  uint64_t v9;

  if (idx < a4)
  {
    v5 = idx;
    while (1)
    {
      CharacterAtIndex = CFStringGetCharacterAtIndex(theString, v5);
      if (CharacterAtIndex == 41)
        break;
      if (CharacterAtIndex == 40)
      {
        v9 = 1;
LABEL_10:
        a2 += v9;
      }
      if (++v5 >= a4)
        return -1;
    }
    if (a2 == 1)
      return v5;
    v9 = -1;
    goto LABEL_10;
  }
  return -1;
}

void sub_21100743C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21100767C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *SCRCFormattedString(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  __CFString *v16;
  id v18[2];

  v10 = a1;
  v11 = a2;
  v18[1] = &a9;
  v12 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = 0;
  v14 = (void *)objc_msgSend(v12, "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", v10, v11, v13, &a9, v18);
  v15 = v18[0];

  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      SCRCFormattedString_cold_1((uint64_t)v15, (uint64_t)v10, (uint64_t)v11);
    v16 = &stru_24CB26880;
  }
  else
  {
    v16 = v14;
  }

  return v16;
}

void _handlerMainThread(uint64_t a1, void *a2)
{
  MEMORY[0x212BD40C0](0);
  objc_msgSend(a2, "_dispatchMainThread");
  JUMPOUT(0x212BD40B4);
}

void *_timerRetain(void *cf)
{
  if (cf)
    CFRetain(cf);
  objc_msgSend(cf, "_createdTimer");
  return cf;
}

void _timerRelease(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

void _handlerSCRCThread(uint64_t a1, void *a2)
{
  MEMORY[0x212BD40C0](0);
  objc_msgSend(a2, "_dispatchSCRCThread");
  JUMPOUT(0x212BD40B4);
}

void _handler(uint64_t a1, void *a2)
{
  MEMORY[0x212BD40C0](0);
  objc_msgSend(a2, "_dispatch");
  JUMPOUT(0x212BD40B4);
}

void sub_211009DB4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_211009DD4(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x211009D60);
}

void sub_21100A290()
{
  __break(1u);
}

void sub_21100A2F0()
{
  objc_end_catch();
  JUMPOUT(0x21100A2C4);
}

void _handler_0(void *a1)
{
  MEMORY[0x212BD40C0](0);
  objc_msgSend(a1, "_processQueue");
  JUMPOUT(0x212BD40B4);
}

void sub_21100ADF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

id SCRCPerformSelector(void *a1, const char *a2)
{
  if (!a2)
    return 0;
  objc_msgSend(a1, a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void *___appendInfoToRecentTaskBuffer_block_invoke()
{
  void *result;

  result = malloc_type_calloc(1uLL, 0x267uLL, 0xDACF183CuLL);
  qmemcpy(result, "Recent tasks -\n", 15);
  _appendInfoToRecentTaskBuffer__recentTaskBuffer = (uint64_t)result + 15;
  return result;
}

id SCRCLinkRelationshipStringForType(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = SCRCLinkRelationshipStringForType_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&SCRCLinkRelationshipStringForType_onceToken, &__block_literal_global_9);
  objc_msgSend((id)SCRCLinkRelationshipStringForType_map, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void SCRCDebugPrint_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_210FEB000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

void SCRCIsConsoleSessionEnabled_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFDictionaryRef soft_CGSSessionCopyCurrentSessionProperties(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SCRCSessionUtilities.m"), 16, CFSTR("%s"), dlerror());

  __break(1u);
}

void SCRCIsConsoleSessionEnabled_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFStringRef getkCGSSessionOnConsoleKey(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SCRCSessionUtilities.m"), 14, CFSTR("%s"), dlerror());

  __break(1u);
}

void CoreGraphicsLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreGraphicsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SCRCSessionUtilities.m"), 13, CFSTR("%s"), *a1);

  __break(1u);
}

void SCRCFormattedString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 138412802;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  v7 = 2112;
  v8 = a3;
  _os_log_fault_impl(&dword_210FEB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Error creating string: %@ [%@/%@]", (uint8_t *)&v3, 0x20u);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB7E8](theArray, range.location, range.length, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB838](theArray, range.location, range.length, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
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

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x24BDBBE40](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF88]();
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2D0](rl, timer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

CFAbsoluteTime CFRunLoopGetNextTimerFireDate(CFRunLoopRef rl, CFRunLoopMode mode)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBC308](rl, mode);
  return result;
}

uint64_t CFRunLoopRunSpecific()
{
  return MEMORY[0x24BDBC368]();
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC370](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC380](source);
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

void CFRunLoopTimerSetNextFireDate(CFRunLoopTimerRef timer, CFAbsoluteTime fireDate)
{
  MEMORY[0x24BDBC3B0](timer, fireDate);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4E0](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
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

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x24BDBC5E8](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x24BDBC618](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x24BDBC620](theString, range.location, range.length, buffer);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFRange CFStringGetRangeOfComposedCharactersAtIndex(CFStringRef theString, CFIndex theIndex)
{
  CFIndex v2;
  CFIndex v3;
  CFRange result;

  v2 = MEMORY[0x24BDBC680](theString, theIndex);
  result.length = v3;
  result.location = v2;
  return result;
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x24BDBC6C8](theString, locale);
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
  MEMORY[0x24BDBC6D0](theString, theForm);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
  MEMORY[0x24BDBC740](theString);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x24BDBF058]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t NSPopAutoreleasePool()
{
  return MEMORY[0x24BDD1158]();
}

uint64_t NSPushAutoreleasePool()
{
  return MEMORY[0x24BDD11C0]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x24BDD11E8]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x24BDD1260]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x24BDF5678](allocator, name, callout, context);
}

CFRunLoopSourceRef SCDynamicStoreCreateRunLoopSource(CFAllocatorRef allocator, SCDynamicStoreRef store, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDF5680](allocator, store, order);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x24BDF56D0](store, keys, patterns);
}

int SCError(void)
{
  return MEMORY[0x24BDF56E0]();
}

const char *__cdecl SCErrorString(int status)
{
  return (const char *)MEMORY[0x24BDF56E8](*(_QWORD *)&status);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x24BDAD218](__x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x24BEDCEC0](cls);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE838](__x, __y);
  return result;
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x24BDAEB90](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

int mkstemp(char *a1)
{
  return MEMORY[0x24BDAEF70](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x24BDAF858](a1, a2, a3);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x24BDAF9A0](a1, *(_QWORD *)&a2, a3);
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x24BEDD500](sel);
}

void srand(unsigned int a1)
{
  MEMORY[0x24BDAFE80](*(_QWORD *)&a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

int32_t u_charName(UChar32 code, UCharNameChoice nameChoice, char *buffer, int32_t bufferLength, UErrorCode *pErrorCode)
{
  return MEMORY[0x24BEDBF48](*(_QWORD *)&code, *(_QWORD *)&nameChoice, buffer, *(_QWORD *)&bufferLength, pErrorCode);
}

int32_t u_strlen(const UChar *s)
{
  return MEMORY[0x24BEDC020](s);
}

UChar *__cdecl u_uastrcpy(UChar *dst, const char *src)
{
  return (UChar *)MEMORY[0x24BEDC048](dst, src);
}

uint64_t ubrk_close()
{
  return MEMORY[0x24BEDC070]();
}

uint64_t ubrk_first()
{
  return MEMORY[0x24BEDC078]();
}

uint64_t ubrk_last()
{
  return MEMORY[0x24BEDC098]();
}

uint64_t ubrk_next()
{
  return MEMORY[0x24BEDC0A0]();
}

uint64_t ubrk_open()
{
  return MEMORY[0x24BEDC0A8]();
}

uint64_t ubrk_previous()
{
  return MEMORY[0x24BEDC0B8]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

uint64_t vproc_swap_integer()
{
  return MEMORY[0x24BDB0438]();
}

