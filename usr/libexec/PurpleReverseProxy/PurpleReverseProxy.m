void sub_100000DDC(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 24);
  if (v1)
    CFRelease(v1);
}

CFStringRef sub_100000DEC(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("<LogCtxRef: %p>"), a1);
}

uint64_t sub_100000E1C(uint64_t *a1)
{
  uint64_t (*v2)(int, int, char *);
  int v3;
  uint64_t result;

  if (isatty(2))
  {
    qword_10000C1B8 = (uint64_t)__stderrp;
    v2 = sub_100000ED0;
  }
  else
  {
    v2 = 0;
  }
  if (sub_10000156C())
  {
    v3 = open("/dev/console", 131073);
    qword_10000C1B8 = (uint64_t)fdopen(v3, "w");
    v2 = sub_100000ED0;
  }
  result = sub_100001244((dispatch_once_t *)&off_10000C000, 40);
  *(_DWORD *)(result + 16) = 5;
  *(_QWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 32) = v2;
  *a1 = result;
  byte_10000C1B0 = 1;
  return result;
}

uint64_t sub_100000ED0(int a1, int a2, char *a3)
{
  uint64_t result;

  if (qword_10000C1B8)
    return fputs(a3, (FILE *)qword_10000C1B8);
  return result;
}

void sub_100000EE8(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, const void *a6, const __CFString *a7, uint64_t a8, uint64_t a9)
{
  const char *v16;
  __CFArray *Mutable;
  CFStringRef v18;
  uint64_t v19;
  int v20;
  CFStringRef v21;
  CFStringRef v22;
  CFStringRef v23;
  const __CFString *v24;
  const __CFString *v25;
  const char *v26;
  CFIndex Length;
  CFIndex v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, _QWORD, const char *);
  size_t v33;
  int v34;
  CFStringRef v35;
  CFStringRef cf;
  CFTypeRef v37;
  tm v38;
  time_t v39;
  va_list arguments;
  char cStr[100];

  v16 = getprogname();
  Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  arguments = (va_list)&a9;
  if (*(_QWORD *)(a2 + 32))
  {
    v39 = time(0);
    memset(&v38, 0, sizeof(v38));
    localtime_r(&v39, &v38);
    if (strftime(cStr, 0x63uLL, "%b %d %H:%M:%S ", &v38)
      && (v18 = CFStringCreateWithCString(0, cStr, 0x8000100u)) != 0)
    {
      cf = v18;
      CFArrayAppendValue(Mutable, v18);
    }
    else
    {
      cf = 0;
    }
    v19 = getpid();
    if (a1 >= 7)
      v20 = 7;
    else
      v20 = a1;
    v21 = CFStringCreateWithFormat(0, 0, CFSTR("%s[%d] <%s>: "), v16, v19, (&off_100008440)[v20]);
    if (v21)
      CFArrayAppendValue(Mutable, v21);
  }
  else
  {
    cf = 0;
    v21 = 0;
  }
  v22 = CFStringCreateWithFormat(0, 0, CFSTR("%s:%d(%s): "), a3, a4, a5);
  if (v22)
    CFArrayAppendValue(Mutable, v22);
  v23 = CFStringCreateWithFormatAndArguments(0, 0, a7, arguments);
  if (v23)
    CFArrayAppendValue(Mutable, v23);
  if (a6)
  {
    CFArrayAppendValue(Mutable, CFSTR(": "));
    CFArrayAppendValue(Mutable, a6);
  }
  v35 = v21;
  v37 = a6;
  v24 = CFStringCreateByCombiningStrings(0, Mutable, &stru_100008918);
  v25 = v24;
  v26 = "failed to convert string\n";
  if (v24)
  {
    Length = CFStringGetLength(v24);
    v28 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 2;
    v29 = (char *)malloc_type_malloc(v28, 0x8D7FBDB6uLL);
    if (CFStringGetCString(v25, v29, v28, 0x8000100u))
      v26 = v29;
  }
  else
  {
    v29 = 0;
  }
  if (a1 >= 7)
    v30 = 7;
  else
    v30 = a1;
  v31 = a2;
  v32 = *(void (**)(uint64_t, _QWORD, const char *))(a2 + 32);
  if (v32)
  {
    v33 = strlen(v26);
    if (v26[v33 - 1] != 10)
    {
      *(_WORD *)&v26[v33] = 10;
      v32 = *(void (**)(uint64_t, _QWORD, const char *))(v31 + 32);
    }
    v32(v30, *(_QWORD *)(v31 + 24), v26);
  }
  else
  {
    if (a1 >= 5)
      v34 = 5;
    else
      v34 = a1;
    asl_log(0, 0, v34, "%s", v26);
  }
  if (v29)
    free(v29);
  if (cf)
    CFRelease(cf);
  if (v35)
    CFRelease(v35);
  if (v22)
    CFRelease(v22);
  if (v23)
    CFRelease(v23);
  if (v25)
    CFRelease(v25);
  if (Mutable)
    CFRelease(Mutable);
  if (v37)
    CFRelease(v37);
}

uint64_t sub_100001244(dispatch_once_t *context, uint64_t a2)
{
  dispatch_once_t *v4;
  dispatch_once_t v5;
  size_t v6;
  uint64_t Instance;
  uint64_t v8;

  v5 = context[16];
  v4 = context + 16;
  if (v5 != -1)
    dispatch_once_f(v4, context, (dispatch_function_t)sub_1000012B4);
  v6 = a2 - 16;
  Instance = _CFRuntimeCreateInstance(0, context[3], v6, 0);
  v8 = Instance;
  if (Instance)
    bzero((void *)(Instance + 16), v6);
  return v8;
}

uint64_t sub_1000012B4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = a1[1];
  a1[5] = *a1;
  a1[8] = v2;
  a1[12] = a1[2];
  result = _CFRuntimeRegisterClass(a1 + 4);
  a1[3] = result;
  return result;
}

__CFDictionary *sub_1000012F0(const void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *key, uint64_t a10)
{
  __CFDictionary *Mutable;
  uint64_t v12;
  const void *v13;
  const void **v14;
  const void **v15;
  const void **v17;
  const void **v18;

  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(Mutable, CFSTR("Command"), a1);
  v17 = (const void **)&a10;
  v13 = key;
  if (key)
  {
    while (1)
    {
      v14 = v17;
      v18 = v17 + 1;
      if (!*v14)
        break;
      CFDictionarySetValue(Mutable, v13, *v14);
      v15 = v18;
      v17 = v18 + 1;
      v13 = *v15;
      if (!*v15)
        return Mutable;
    }
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
      sub_100000EE8(3u, qword_10000C1A8, (uint64_t)"Utilities.c", 119, (uint64_t)"createCommandDictionaryWithArgs", 0, CFSTR("no value for key %@"), v12, (uint64_t)v13);
  }
  return Mutable;
}

void sub_100001408(__CFDictionary *a1, const void *a2, int a3)
{
  CFNumberRef v5;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

const __CFNumber *sub_100001468(const __CFDictionary *a1, const void *a2, void *a3)
{
  const __CFNumber *result;
  const __CFNumber *v5;
  CFTypeID v6;

  result = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v5 = result;
    v6 = CFGetTypeID(result);
    if (v6 == CFNumberGetTypeID())
      return (const __CFNumber *)(CFNumberGetValue(v5, kCFNumberIntType, a3) != 0);
    else
      return 0;
  }
  return result;
}

void sub_1000014CC(id a1)
{
  CFPropertyListRef v1;
  CFTypeID v2;

  v1 = CFPreferencesCopyAppValue(CFSTR("ClientListenerDelay"), CFSTR("com.apple.PurpleReverseProxy"));
  if (v1
    || (v1 = CFPreferencesCopyValue(CFSTR("ClientListenerDelay"), CFSTR("com.apple.PurpleReverseProxy"), CFSTR("mobile"), kCFPreferencesAnyHost)) != 0)
  {
    v2 = CFGetTypeID(v1);
    if (v2 == CFNumberGetTypeID())
      CFNumberGetValue((CFNumberRef)v1, kCFNumberSInt32Type, &dword_10000C088);
    CFRelease(v1);
  }
}

uint64_t sub_10000156C()
{
  const __CFString *v0;
  uint64_t v1;
  const void *v2;
  CFComparisonResult v3;
  uint64_t v4;
  _BOOL8 v5;
  CFComparisonResult v6;
  const __CFDictionary *v7;
  uint64_t v8;
  const void *Value;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  size_t v19;
  char __s1[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  *(_OWORD *)__s1 = 0u;
  v21 = 0u;
  v19 = 256;
  v18 = 0;
  v0 = (const __CFString *)MGCopyAnswerWithError(CFSTR("ReleaseType"), 0, &v18);
  if (v0)
  {
    v2 = v0;
    v3 = CFStringCompare(v0, CFSTR("Restore"), 0);
    v5 = v3 == kCFCompareEqualTo;
    if (byte_10000C1B0 == 1)
    {
      v6 = v3;
      if (qword_10000C1A0 != -1)
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
      if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 5)
        sub_100000EE8(5u, qword_10000C1A8, (uint64_t)"Utilities.c", 372, (uint64_t)"isRestoreOS", 0, CFSTR("Asking MobileGestalt for ReleaseType, isRestoreOS: %d\n"), v4, v6 == kCFCompareEqualTo);
    }
    goto LABEL_17;
  }
  if (byte_10000C1B0 == 1)
  {
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
      sub_100000EE8(3u, qword_10000C1A8, (uint64_t)"Utilities.c", 376, (uint64_t)"isRestoreOS", 0, CFSTR("Asking for kMGQReleaseType failed: %d\n"), v1, v18);
  }
  v7 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (!v7)
  {
    if (byte_10000C1B0 != 1)
      goto LABEL_38;
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
      sub_100000EE8(3u, qword_10000C1A8, (uint64_t)"Utilities.c", 318, (uint64_t)"isRestoreOSSystemVersion", 0, CFSTR("CFCopySystemVersionDictionary failed\n"), v8, v17);
LABEL_32:
    if (byte_10000C1B0 == 1)
    {
      if (qword_10000C1A0 != -1)
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
      if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
        sub_100000EE8(3u, qword_10000C1A8, (uint64_t)"Utilities.c", 383, (uint64_t)"isRestoreOS", 0, CFSTR("Checking SystemVersion failed: %d\n"), v8, 0xFFFFFFFFLL);
    }
LABEL_38:
    v18 = sysctlbyname("kern.bootargs", __s1, &v19, 0, 0);
    if (v18)
    {
      if (byte_10000C1B0 != 1)
        return 0;
      if (qword_10000C1A0 != -1)
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
      v13 = qword_10000C1A8;
      if (!qword_10000C1A8 || *(int *)(qword_10000C1A8 + 16) < 3)
        return 0;
      v17 = v18;
      v14 = CFSTR("Calling sysctlbyname for kern.bootargs failed: %d\n");
      v15 = 3;
      v16 = 392;
    }
    else
    {
      if (strstr(__s1, "rd=md0"))
        return 1;
      if (byte_10000C1B0 != 1)
        return 0;
      if (qword_10000C1A0 != -1)
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
      v13 = qword_10000C1A8;
      if (!qword_10000C1A8 || *(int *)(qword_10000C1A8 + 16) < 5)
        return 0;
      v14 = CFSTR("Did not find rd=md0 in bootargs, assuming not RestoreOS\n");
      v15 = 5;
      v16 = 390;
    }
    sub_100000EE8(v15, v13, (uint64_t)"Utilities.c", v16, (uint64_t)"isRestoreOS", 0, v14, v12, v17);
    return 0;
  }
  v2 = v7;
  Value = CFDictionaryGetValue(v7, CFSTR("ReleaseType"));
  if (!Value)
  {
    if (byte_10000C1B0 == 1)
    {
      if (qword_10000C1A0 != -1)
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
      if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
        sub_100000EE8(3u, qword_10000C1A8, (uint64_t)"Utilities.c", 325, (uint64_t)"isRestoreOSSystemVersion", 0, CFSTR("CFDictionaryGetValue for ReleaseType failed\n"), v10, v17);
    }
    CFRelease(v2);
    goto LABEL_32;
  }
  v5 = CFEqual(Value, CFSTR("Restore")) != 0;
LABEL_17:
  CFRelease(v2);
  return v5;
}

void sub_100001A54(uint64_t a1, CFStringRef format, ...)
{
  CFStringRef v3;
  uint64_t v4;
  const void *v5;
  va_list va;

  va_start(va, format);
  v3 = CFStringCreateWithFormatAndArguments(0, 0, format, va);
  v4 = *(_QWORD *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(v4 + 136));
  if (v3)
    CFRetain(v3);
  v5 = *(const void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v3;
  if (v5)
    CFRelease(v5);
  pthread_mutex_unlock((pthread_mutex_t *)(v4 + 136));
  if (v3)
    CFRelease(v3);
}

uint64_t sub_100001AE0(uint64_t a1, uint64_t a2, const void *a3)
{
  const void *v5;
  const void *v6;
  CFTypeRef v7;

  if (a2)
    v5 = a3;
  else
    v5 = 0;
  sub_100001B54(a1);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 136));
  *(_QWORD *)(a1 + 24) = a2;
  v6 = *(const void **)(a1 + 32);
  if (v6)
    CFRelease(v6);
  if (v5)
    v7 = CFRetain(v5);
  else
    v7 = 0;
  *(_QWORD *)(a1 + 32) = v7;
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 136));
  return sub_100001BA0(a1);
}

uint64_t sub_100001B54(uint64_t a1)
{
  pthread_mutex_t *v2;
  int v3;

  v2 = (pthread_mutex_t *)(a1 + 136);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 136));
  v3 = *(_DWORD *)(a1 + 216) - 1;
  *(_DWORD *)(a1 + 216) = v3;
  if (!v3)
    (*(void (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  return pthread_mutex_unlock(v2);
}

uint64_t sub_100001BA0(uint64_t a1)
{
  pthread_mutex_t *v2;
  int v3;

  v2 = (pthread_mutex_t *)(a1 + 136);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 136));
  v3 = *(_DWORD *)(a1 + 216);
  *(_DWORD *)(a1 + 216) = v3 + 1;
  if (!v3)
    (*(void (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  return pthread_mutex_unlock(v2);
}

void sub_100001BEC(uint64_t a1, void *aBlock)
{
  void *v3;

  v3 = _Block_copy(aBlock);
  sub_100001AE0(*(_QWORD *)(a1 + 16), (uint64_t)sub_100001C2C, v3);
  _Block_release(v3);
}

uint64_t sub_100001C2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

uint64_t sub_100001C38(uint64_t a1, NSObject *a2)
{
  NSObject *v4;

  sub_100001B54(a1);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 136));
  v4 = *(NSObject **)(a1 + 48);
  if (v4)
    dispatch_release(v4);
  if (a2)
  {
    *(_QWORD *)(a1 + 48) = a2;
    dispatch_retain(a2);
  }
  else
  {
    *(_QWORD *)(a1 + 48) = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 136));
  return sub_100001BA0(a1);
}

uint64_t sub_100001CA0(uint64_t a1)
{
  pthread_mutex_t *v2;
  const void *v3;

  v2 = (pthread_mutex_t *)(a1 + 136);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 136));
  *(_BYTE *)(a1 + 200) = 1;
  *(_QWORD *)(a1 + 24) = 0;
  v3 = *(const void **)(a1 + 32);
  if (v3)
    CFRelease(v3);
  *(_QWORD *)(a1 + 32) = 0;
  return pthread_mutex_unlock(v2);
}

uint64_t sub_100001CE8(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (void *)os_transaction_create("com.apple.PurpleReverseProxy.transaction");
  v5 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 16) + 48))(*(_QWORD *)(a1 + 16), a2);
  v6 = v5;
  if (v5)
    *(_QWORD *)(*(_QWORD *)(v5 + 16) + 208) = v4;
  else
    os_release(v4);
  return v6;
}

uint64_t sub_100001D54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v12;
  int *v13;
  char *v14;
  CFStringRef v15;
  uint64_t v16;
  uint64_t v17;

  if (!a3)
    return 1;
  v3 = a3;
  while (1)
  {
    v6 = (***(uint64_t (****)(_QWORD, uint64_t, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 16), a2, v3);
    v8 = *(_QWORD *)(a1 + 16);
    if (v6 == -1)
      break;
    v9 = *(unint64_t **)(v8 + 232);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + v6, v9));
    if (!v6)
    {
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40);
      if (v17)
        goto LABEL_20;
      if (qword_10000C1A0 != -1)
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
      v17 = qword_10000C1A8;
      if (qword_10000C1A8)
      {
LABEL_20:
        if (*(int *)(v17 + 16) >= 3)
          sub_100000EE8(3u, v17, (uint64_t)"RPSocket.cpp", 516, (uint64_t)"RPSocketReadBuffer", 0, CFSTR("EOF on %@\n"), v7, a1);
      }
      return 0;
    }
    a2 += v6;
    v3 -= v6;
    if (!v3)
      return 1;
  }
  v12 = *(_QWORD *)(v8 + 40);
  if (v12)
    goto LABEL_14;
  if (qword_10000C1A0 != -1)
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
  v12 = qword_10000C1A8;
  if (qword_10000C1A8)
  {
LABEL_14:
    if (*(int *)(v12 + 16) >= 3)
    {
      v13 = __error();
      v14 = strerror(*v13);
      v15 = CFStringCreateWithCString(0, v14, 0x8000100u);
      sub_100000EE8(3u, v12, (uint64_t)"RPSocket.cpp", 520, (uint64_t)"RPSocketReadBuffer", v15, CFSTR("read error on %@"), v16, a1);
    }
  }
  return 0;
}

const void *sub_100001F08(uint64_t a1)
{
  uint64_t v2;
  CFIndex v3;
  __CFData *Mutable;
  uint64_t v5;
  __CFData *v6;
  UInt8 *MutableBytePtr;
  uint64_t v8;
  CFPropertyListRef v9;
  uint64_t v10;
  const void *v11;
  CFTypeID v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  CFErrorRef error;
  int v21;

  error = 0;
  v21 = -1;
  if (!sub_100001D54(a1, (uint64_t)&v21, 4) || v21 == -1)
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40);
    if (v15)
      goto LABEL_19;
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v15 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_19:
      if (*(int *)(v15 + 16) >= 3)
        sub_100000EE8(3u, v15, (uint64_t)"RPSocket.cpp", 561, (uint64_t)"RPSocketReadDictionary", 0, CFSTR("failed to read length from %@\n"), v2, a1);
    }
  }
  else
  {
    v3 = v21;
    Mutable = CFDataCreateMutable(0, v21);
    if (Mutable)
    {
      v6 = Mutable;
      CFDataSetLength(Mutable, v3);
      MutableBytePtr = CFDataGetMutableBytePtr(v6);
      if ((sub_100001D54(a1, (uint64_t)MutableBytePtr, v3) & 1) != 0)
      {
        v9 = CFPropertyListCreateWithData(0, v6, 2uLL, 0, &error);
        v11 = v9;
        if (!v9 || error)
        {
          v19 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40);
          if (v19)
            goto LABEL_41;
          if (qword_10000C1A0 != -1)
            dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
          v19 = qword_10000C1A8;
          if (qword_10000C1A8)
          {
LABEL_41:
            if (*(int *)(v19 + 16) >= 3)
              sub_100000EE8(3u, v19, (uint64_t)"RPSocket.cpp", 579, (uint64_t)"RPSocketReadDictionary", 0, CFSTR("failed to deserialize dictionary from %@: %@\n"), v10, a1);
          }
          goto LABEL_35;
        }
        v12 = CFGetTypeID(v9);
        if (v12 == CFDictionaryGetTypeID())
        {
LABEL_35:
          CFRelease(v6);
          return v11;
        }
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40);
        if (v14)
          goto LABEL_12;
        if (qword_10000C1A0 != -1)
          dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
        v14 = qword_10000C1A8;
        if (qword_10000C1A8)
        {
LABEL_12:
          if (*(int *)(v14 + 16) >= 3)
            sub_100000EE8(3u, v14, (uint64_t)"RPSocket.cpp", 584, (uint64_t)"RPSocketReadDictionary", 0, CFSTR("plist from %@ was not a dictionary\n"), v13, a1);
        }
        CFRelease(v11);
      }
      else
      {
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40);
        if (v17)
          goto LABEL_32;
        if (qword_10000C1A0 != -1)
          dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
        v17 = qword_10000C1A8;
        if (qword_10000C1A8)
        {
LABEL_32:
          if (*(int *)(v17 + 16) >= 3)
            sub_100000EE8(3u, v17, (uint64_t)"RPSocket.cpp", 573, (uint64_t)"RPSocketReadDictionary", 0, CFSTR("RPSocketReadBuffer failed from %@\n"), v8, a1);
        }
      }
      v11 = 0;
      goto LABEL_35;
    }
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40);
    if (v16)
      goto LABEL_25;
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v16 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_25:
      if (*(int *)(v16 + 16) >= 3)
        sub_100000EE8(3u, v16, (uint64_t)"RPSocket.cpp", 567, (uint64_t)"RPSocketReadDictionary", 0, CFSTR("CFDataCreateMutable failed for len %d for %@\n"), v5, v3);
    }
  }
  return 0;
}

uint64_t sub_100002280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v11;

  if (!a3)
    return 1;
  v3 = a3;
  while (1)
  {
    v6 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(a1 + 16) + 8))(*(_QWORD *)(a1 + 16), a2, v3);
    if (v6 < 0)
      break;
    a2 += v6;
    v3 -= v6;
    v8 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 232) + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + v6, v8));
    if (!v3)
      return 1;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40);
  if (v11)
    goto LABEL_13;
  if (qword_10000C1A0 != -1)
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
  v11 = qword_10000C1A8;
  if (qword_10000C1A8)
  {
LABEL_13:
    if (*(int *)(v11 + 16) >= 3)
      sub_100000EE8(3u, v11, (uint64_t)"RPSocket.cpp", 602, (uint64_t)"RPSocketWrite", 0, CFSTR("failed to write %zu bytes to %@\n"), v7, v3);
  }
  return 0;
}

uint64_t sub_100002390(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFData *v9;
  uint64_t v10;
  const __CFData *v11;
  CFIndex Length;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const UInt8 *BytePtr;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CFErrorRef error;
  int v26;

  error = 0;
  if (a2)
  {
    v9 = CFPropertyListCreateData(0, a2, kCFPropertyListBinaryFormat_v1_0, 0, &error);
    v11 = v9;
    if (v9 && !error)
    {
      Length = CFDataGetLength(v9);
      v14 = Length;
      if (Length < 0x80000000)
      {
        v26 = Length;
        if ((sub_100002280(a1, (uint64_t)&v26, 4) & 1) != 0)
        {
          BytePtr = CFDataGetBytePtr(v11);
          if ((sub_100002280(a1, (uint64_t)BytePtr, v14) & 1) != 0)
          {
            v17 = 1;
LABEL_42:
            CFRelease(v11);
            goto LABEL_43;
          }
          v23 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40);
          if (v23)
            goto LABEL_39;
          if (qword_10000C1A0 != -1)
            dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
          v23 = qword_10000C1A8;
          if (qword_10000C1A8)
          {
LABEL_39:
            if (*(int *)(v23 + 16) >= 3)
              sub_100000EE8(3u, v23, (uint64_t)"RPSocket.cpp", 652, (uint64_t)"RPSocketWriteDictionary", 0, CFSTR("failed to write length to %@\n"), v21, a1);
          }
        }
        else
        {
          v22 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40);
          if (v22)
            goto LABEL_33;
          if (qword_10000C1A0 != -1)
            dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
          v22 = qword_10000C1A8;
          if (qword_10000C1A8)
          {
LABEL_33:
            if (*(int *)(v22 + 16) >= 3)
              sub_100000EE8(3u, v22, (uint64_t)"RPSocket.cpp", 647, (uint64_t)"RPSocketWriteDictionary", 0, CFSTR("failed to write length to %@\n"), v19, a1);
          }
        }
      }
      else
      {
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40);
        if (v15)
          goto LABEL_9;
        if (qword_10000C1A0 != -1)
          dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
        v15 = qword_10000C1A8;
        if (qword_10000C1A8)
        {
LABEL_9:
          if (*(int *)(v15 + 16) >= 3)
            sub_100000EE8(3u, v15, (uint64_t)"RPSocket.cpp", 642, (uint64_t)"RPSocketWriteDictionary", 0, CFSTR("data too big for %@: %lu\n"), v13, a1);
        }
      }
      v17 = 0;
      goto LABEL_42;
    }
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40);
    if (v18)
      goto LABEL_22;
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v18 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_22:
      if (*(int *)(v18 + 16) >= 3)
        sub_100000EE8(3u, v18, (uint64_t)"RPSocket.cpp", 636, (uint64_t)"RPSocketWriteDictionary", 0, CFSTR("failed to serialize dictionary to %@: %@\n"), v10, a1);
    }
    v17 = 0;
    if (v11)
      goto LABEL_42;
  }
  else
  {
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 40);
    if (v16)
      goto LABEL_15;
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v16 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_15:
      if (*(int *)(v16 + 16) >= 3)
        sub_100000EE8(3u, v16, (uint64_t)"RPSocket.cpp", 630, (uint64_t)"RPSocketWriteDictionary", 0, CFSTR("no dictionary to send to %@\n"), a8, a1);
    }
    v17 = 0;
  }
LABEL_43:
  if (error)
    CFRelease(error);
  return v17;
}

void sub_1000026E8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;

  v9 = (_QWORD *)a1[29];
  if (*v9 || v9[1])
  {
    v10 = a1[5];
    if (v10)
      goto LABEL_7;
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v10 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_7:
      if (*(int *)(v10 + 16) >= 5)
        sub_100000EE8(5u, v10, (uint64_t)"RPSocket.cpp", 157, (uint64_t)"reset_stats", 0, CFSTR("Reset stats for %@ after reading %lld bytes and writing %lld bytes\n"), a8, a1[1]);
    }
    v11 = (_QWORD *)a1[29];
    v11[1] = 0;
    *v11 = v11[1];
  }
}

void sub_1000027C0(uint64_t *cf, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  unsigned int v15;
  uint64_t v16;
  CFStringRef v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  char *v26;
  uint64_t *v27;

  v11 = cf[2];
  if (!*(_QWORD *)(v11 + 224))
  {
    v12 = malloc_type_calloc(1uLL, 0x10000uLL, 0xB166416DuLL);
    v11 = cf[2];
    *(_QWORD *)(v11 + 224) = v12;
  }
  if (a2 != 1)
  {
    if (a2 == 16)
    {
      v13 = *(_QWORD *)(v11 + 40);
      if (!v13)
      {
        if (qword_10000C1A0 != -1)
          dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
        v13 = qword_10000C1A8;
        if (!qword_10000C1A8)
          goto LABEL_31;
      }
      if (*(int *)(v13 + 16) < 3)
        goto LABEL_31;
      v27 = cf;
      v14 = CFSTR("kCFStreamEventEndEncountered from %@\n");
      v15 = 3;
      v16 = 675;
    }
    else
    {
      v19 = (**(uint64_t (***)(uint64_t))v11)(v11);
      v20 = cf[2];
      if (v19 == -1)
      {
        v24 = *(_QWORD *)(v20 + 40);
        if (!v24)
        {
          if (qword_10000C1A0 != -1)
            dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
          v24 = qword_10000C1A8;
          if (!qword_10000C1A8)
            goto LABEL_31;
        }
        if (*(int *)(v24 + 16) < 3)
          goto LABEL_31;
        v25 = __error();
        v26 = strerror(*v25);
        v17 = CFStringCreateWithCString(0, v26, 0x8000100u);
        v27 = cf;
        v14 = CFSTR("RPSocketRead from %@");
        v15 = 3;
        v13 = v24;
        v16 = 687;
        goto LABEL_30;
      }
      v21 = *(unint64_t **)(v20 + 232);
      do
        v22 = __ldxr(v21);
      while (__stxr(v22 + v19, v21));
      v23 = cf[2];
      if (v19)
      {
        if ((sub_100002280((uint64_t)a3, *(_QWORD *)(v23 + 224), v19) & 1) != 0)
          return;
        v13 = *(_QWORD *)(cf[2] + 40);
        if (!v13)
        {
          if (qword_10000C1A0 != -1)
            dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
          v13 = qword_10000C1A8;
          if (!qword_10000C1A8)
            goto LABEL_31;
        }
        if (*(int *)(v13 + 16) < 5)
          goto LABEL_31;
        v27 = a3;
        v14 = CFSTR("RPSocketWrite failed to %@");
        v15 = 5;
        v16 = 695;
      }
      else
      {
        v13 = *(_QWORD *)(v23 + 40);
        if (!v13)
        {
          if (qword_10000C1A0 != -1)
            dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
          v13 = qword_10000C1A8;
          if (!qword_10000C1A8)
            goto LABEL_31;
        }
        if (*(int *)(v13 + 16) < 5)
          goto LABEL_31;
        v27 = cf;
        v14 = CFSTR("EOF from %@\n");
        v15 = 5;
        v16 = 691;
      }
    }
    v17 = 0;
LABEL_30:
    sub_100000EE8(v15, v13, (uint64_t)"RPSocket.cpp", v16, (uint64_t)"ExchangeDataHelper", v17, v14, a8, (uint64_t)v27);
LABEL_31:
    CFRetain(cf);
    CFRetain(a3);
    (*(void (**)(uint64_t))(*(_QWORD *)cf[2] + 32))(cf[2]);
    sub_100001CA0(cf[2]);
    if (a3)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)a3[2] + 32))(a3[2]);
      sub_100001CA0(a3[2]);
    }
    CFRelease(cf);
    CFRelease(a3);
    return;
  }
  v18 = *(_QWORD *)(v11 + 40);
  if (v18)
    goto LABEL_16;
  if (qword_10000C1A0 != -1)
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
  v18 = qword_10000C1A8;
  if (qword_10000C1A8)
  {
LABEL_16:
    if (*(int *)(v18 + 16) >= 3)
      sub_100000EE8(3u, v18, (uint64_t)"RPSocket.cpp", 681, (uint64_t)"ExchangeDataHelper", 0, CFSTR("wrong kCFStreamEventOpenCompleted from %@\n"), a8, (uint64_t)cf);
  }
}

void sub_100002B70()
{
  operator new();
}

void sub_100002BC4()
{
  operator delete();
}

uint64_t sub_100002BE8(uint64_t a1, int a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  char *v9;
  CFStringRef v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  char *v14;
  CFStringRef v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  char *v20;
  CFStringRef v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uintptr_t v25;
  NSObject *global_queue;
  NSObject *v27;
  socklen_t v29;
  socklen_t v30;
  int v31;
  sockaddr v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[1025];
  _BYTE v41[1025];

  v6 = sub_1000030DC(a1);
  *(_QWORD *)v6 = off_100008550;
  *(_QWORD *)(v6 + 376) = 0;
  *(_OWORD *)(v6 + 248) = 0u;
  *(_OWORD *)(v6 + 264) = 0u;
  *(_OWORD *)(v6 + 280) = 0u;
  *(_OWORD *)(v6 + 296) = 0u;
  *(_OWORD *)(v6 + 312) = 0u;
  *(_OWORD *)(v6 + 328) = 0u;
  *(_OWORD *)(v6 + 344) = 0u;
  *(_OWORD *)(v6 + 360) = 0u;
  *(_DWORD *)(v6 + 240) = a2;
  *(_QWORD *)(v6 + 248) = dispatch_queue_create("com.apple.PurpleReverseProxy.FDQueue", 0);
  v31 = 1;
  if (setsockopt(*(_DWORD *)(a1 + 240), 0xFFFF, 4130, &v31, 4u) == -1)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      goto LABEL_6;
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v7 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_6:
      if (*(int *)(v7 + 16) >= 3)
      {
        v8 = __error();
        v9 = strerror(*v8);
        v10 = CFStringCreateWithCString(0, v9, 0x8000100u);
        sub_100000EE8(3u, v7, (uint64_t)"RPSocket.cpp", 922, (uint64_t)"RPSocket_fd", v10, CFSTR("setsockopt for %@"), v11, *(_QWORD *)(a1 + 8));
      }
    }
  }
  bzero(v41, 0x401uLL);
  bzero(v40, 0x401uLL);
  v30 = 128;
  if (getsockname(a2, (sockaddr *)(a1 + 256), &v30))
  {
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      goto LABEL_13;
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v12 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_13:
      if (*(int *)(v12 + 16) >= 3)
      {
        v13 = __error();
        v14 = strerror(*v13);
        v15 = CFStringCreateWithCString(0, v14, 0x8000100u);
        sub_100000EE8(3u, v12, (uint64_t)"RPSocket.cpp", 933, (uint64_t)"RPSocket_fd", v15, CFSTR("getsockname for %@"), v16, *(_QWORD *)(a1 + 8));
      }
    }
  }
  sub_1000031E8((uint64_t)v41, (sockaddr *)(a1 + 256));
  if ((a3 & 0xFFFFFFFE) == 2)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = (sockaddr)0;
    v33 = 0u;
    v29 = 128;
    if (getpeername(a2, &v32, &v29))
    {
      v18 = *(_QWORD *)(a1 + 40);
      if (v18)
        goto LABEL_21;
      if (qword_10000C1A0 != -1)
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
      v18 = qword_10000C1A8;
      if (qword_10000C1A8)
      {
LABEL_21:
        if (*(int *)(v18 + 16) >= 3)
        {
          v19 = __error();
          v20 = strerror(*v19);
          v21 = CFStringCreateWithCString(0, v20, 0x8000100u);
          sub_100000EE8(3u, v18, (uint64_t)"RPSocket.cpp", 943, (uint64_t)"RPSocket_fd", v21, CFSTR("getpeername for %@"), v22, *(_QWORD *)(a1 + 8));
        }
      }
    }
    sub_1000031E8((uint64_t)v40, &v32);
  }
  if (a3 == 2)
  {
    v24 = *(_QWORD *)(a1 + 40);
    if (v24)
      goto LABEL_36;
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v24 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_36:
      if (*(int *)(v24 + 16) >= 5)
        sub_100000EE8(5u, v24, (uint64_t)"RPSocket.cpp", 956, (uint64_t)"RPSocket_fd", 0, CFSTR("%@: accepted %s <- %s"), v17, *(_QWORD *)(a1 + 8));
    }
  }
  else if (a3 == 1)
  {
    v23 = *(_QWORD *)(a1 + 40);
    if (v23)
      goto LABEL_30;
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v23 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_30:
      if (*(int *)(v23 + 16) >= 5)
        sub_100000EE8(5u, v23, (uint64_t)"RPSocket.cpp", 953, (uint64_t)"RPSocket_fd", 0, CFSTR("%@: listening on %s"), v17, *(_QWORD *)(a1 + 8));
    }
  }
  CFRetain(*(CFTypeRef *)(a1 + 8));
  v25 = *(int *)(a1 + 240);
  global_queue = dispatch_get_global_queue(0, 0);
  v27 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v25, 0, global_queue);
  *(_QWORD *)(a1 + 384) = v27;
  dispatch_set_context(v27, (void *)a1);
  dispatch_source_set_cancel_handler_f(*(dispatch_source_t *)(a1 + 384), (dispatch_function_t)sub_1000033A0);
  dispatch_source_set_event_handler_f(*(dispatch_source_t *)(a1 + 384), (dispatch_function_t)sub_1000033DC);
  return a1;
}

void sub_1000030B4(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1000033E4(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000030DC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  *(_QWORD *)a1 = &off_100008608;
  *(_BYTE *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 208) = 0;
  *(_DWORD *)(a1 + 216) = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  v2 = malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
  *(_QWORD *)(a1 + 224) = 0;
  *(_QWORD *)(a1 + 232) = v2;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 136), 0);
  pthread_mutex_init((pthread_mutex_t *)(a1 + 64), 0);
  v3 = sub_100001244((dispatch_once_t *)&off_10000C090, 24);
  *(_QWORD *)(a1 + 8) = v3;
  if (v3)
  {
    *(_QWORD *)(v3 + 16) = a1;
  }
  else
  {
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
      sub_100000EE8(3u, qword_10000C1A8, (uint64_t)"RPSocket.cpp", 130, (uint64_t)"RPSocket", 0, CFSTR("could not allocate socket\n"), v4, v6);
  }
  return a1;
}

uint64_t sub_1000031E8(uint64_t result, sockaddr *a2)
{
  uint64_t v3;
  int sa_family;
  uint64_t v5;
  int v6;
  int v7;
  socklen_t sa_len;
  unsigned int v9;
  char v10[2];
  char v11[1025];

  v3 = result;
  sa_family = a2->sa_family;
  if (sa_family != 30 && sa_family != 1 && !a2->sa_family)
  {
    *(_WORD *)(result + 8) = 62;
    v5 = *(_QWORD *)"<unknown>";
LABEL_21:
    *(_QWORD *)v3 = v5;
    return result;
  }
  if (sa_family == 30)
    v6 = 28;
  else
    v6 = 0;
  if (sa_family == 2)
    v7 = 16;
  else
    v7 = v6;
  if (a2->sa_len)
    sa_len = a2->sa_len;
  else
    sa_len = v7;
  result = getnameinfo(a2, sa_len, v11, 0x401u, v10, 0x20u, 10);
  if ((_DWORD)result)
  {
    if (a2->sa_family == 1)
    {
      v9 = a2->sa_len - 2;
      if (v9 >= 0x68)
        v9 = 104;
      if (v9)
        return snprintf((char *)v3, 0x401uLL, "%s%.*s%s");
    }
    *(_WORD *)(v3 + 8) = 62;
    v5 = *(_QWORD *)"<unknown>";
    goto LABEL_21;
  }
  if (!v10[0] || *(unsigned __int16 *)v10 == 48)
    v10[0] = 0;
  return snprintf((char *)v3, 0x401uLL, "%s%s%s%s%s");
}

void sub_1000033A0(uint64_t a1)
{
  sub_1000034AC(a1, 8);
  dispatch_sync_f(*(dispatch_queue_t *)(a1 + 248), (void *)a1, (dispatch_function_t)sub_10000362C);
  CFRelease(*(CFTypeRef *)(a1 + 8));
}

void sub_1000033DC(uint64_t a1)
{
  sub_1000034AC(a1, 2);
}

uint64_t sub_1000033E4(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  NSObject *v5;
  void *v6;
  void *v7;

  *(_QWORD *)a1 = &off_100008608;
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 16);
  if (v4)
    CFRelease(v4);
  v5 = *(NSObject **)(a1 + 48);
  if (v5)
    dispatch_release(v5);
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 136));
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 64));
  v6 = *(void **)(a1 + 232);
  if (v6)
    free(v6);
  v7 = *(void **)(a1 + 224);
  if (v7)
    free(v7);
  return a1;
}

void sub_10000346C(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t sub_10000347C()
{
  return 0;
}

uint64_t sub_100003484()
{
  return 0;
}

uint64_t sub_10000348C()
{
  return 0;
}

uint64_t sub_100003494()
{
  return 0;
}

void sub_1000034AC(uint64_t a1, uint64_t a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  void (*v6)(CFTypeRef, uint64_t, const void *);
  const void *v7;
  NSObject *v8;
  CFTypeRef v9;
  uint64_t v10;
  uint64_t context;
  CFTypeRef cf;
  uint64_t v13;
  CFTypeRef v14;

  v4 = (pthread_mutex_t *)(a1 + 136);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 136));
  v6 = *(void (**)(CFTypeRef, uint64_t, const void *))(a1 + 24);
  if (v6)
  {
    v7 = *(const void **)(a1 + 32);
    context = *(_QWORD *)(a1 + 24);
    v14 = v7;
    v8 = *(NSObject **)(a1 + 48);
    if (v7)
      CFRetain(v7);
    if (v8)
      dispatch_retain(v8);
    v9 = *(CFTypeRef *)(a1 + 8);
    cf = v9;
    v13 = a2;
    CFRetain(v9);
    pthread_mutex_unlock(v4);
    if (v8)
    {
      dispatch_sync_f(v8, &context, (dispatch_function_t)sub_10000361C);
      dispatch_release(v8);
      v9 = cf;
    }
    else
    {
      v6(v9, a2, v7);
    }
    CFRelease(v9);
    if (v14)
      CFRelease(v14);
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      goto LABEL_12;
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v10 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_12:
      if (*(int *)(v10 + 16) >= 3)
        sub_100000EE8(3u, v10, (uint64_t)"RPSocket.cpp", 228, (uint64_t)"signal", 0, CFSTR("No client callback, missing event %d for socket %p\n"), v5, a2);
    }
    pthread_mutex_unlock(v4);
  }
}

uint64_t sub_10000361C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))a1)(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t sub_10000362C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 120))(a1);
}

ssize_t sub_100003638(uint64_t a1, void *a2, size_t a3)
{
  return read(*(_DWORD *)(a1 + 240), a2, a3);
}

ssize_t sub_100003640(uint64_t a1, const void *a2, size_t a3)
{
  return write(*(_DWORD *)(a1 + 240), a2, a3);
}

void sub_100003648(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(a1 + 384));
}

void sub_100003650(uint64_t a1)
{
  dispatch_resume(*(dispatch_object_t *)(a1 + 384));
}

void sub_100003658(dispatch_queue_t *context)
{
  dispatch_sync_f(context[31], context, (dispatch_function_t)sub_100003E40);
  dispatch_source_cancel(context[48]);
}

CFStringRef sub_10000368C(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("fd=%d"), *(unsigned int *)(a1 + 240));
}

uint64_t sub_1000036C0(uint64_t a1, unint64_t a2)
{
  uintptr_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  int *v10;
  char *v11;
  CFStringRef v12;
  uint64_t v13;
  char *v14;
  const char *v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  char *v21;
  uint64_t v22;
  int *v23;
  char *v24;
  CFStringRef v25;
  uint64_t v26;
  uint64_t v28;
  timespec timeout;
  kevent eventlist;

  if (!a2)
  {
LABEL_5:
    if (accept(*(_DWORD *)(a1 + 240), 0, 0) != -1)
      sub_100002B70();
    v19 = *(_QWORD *)(a1 + 40);
    if (v19)
      goto LABEL_16;
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v19 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_16:
      if (*(int *)(v19 + 16) >= 3)
      {
        v20 = __error();
        v21 = strerror(*v20);
        v12 = CFStringCreateWithCString(0, v21, 0x8000100u);
        v14 = "RPSocket.cpp";
        v28 = *(_QWORD *)(a1 + 8);
        v15 = "accept";
        v16 = CFSTR("accept for %@");
        v17 = v19;
        v18 = 1050;
        goto LABEL_18;
      }
    }
    return 0;
  }
  v4 = *(int *)(a1 + 240);
  v5 = kqueue();
  if (v5 != -1)
  {
    v6 = v5;
    timeout.tv_sec = (int)(a2 / 0x3B9ACA00);
    timeout.tv_nsec = a2 % 0x3B9ACA00;
    eventlist.ident = v4;
    *(_DWORD *)&eventlist.filter = 1179647;
    memset(&eventlist.fflags, 0, 20);
    v7 = kevent(v5, &eventlist, 1, &eventlist, 1, &timeout);
    if (v7 == -1)
    {
      if (qword_10000C1A0 != -1)
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
      v22 = qword_10000C1A8;
      if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
      {
        v23 = __error();
        v24 = strerror(*v23);
        v25 = CFStringCreateWithCString(0, v24, 0x8000100u);
        sub_100000EE8(3u, v22, (uint64_t)"Utilities.c", 216, (uint64_t)"WaitSocket", v25, CFSTR("kevent"), v26, v28);
      }
      close(v6);
      return 0;
    }
    v8 = v7;
    close(v6);
    if (v8 < 1)
      return 0;
    goto LABEL_5;
  }
  if (qword_10000C1A0 != -1)
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
  v9 = qword_10000C1A8;
  if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
  {
    v10 = __error();
    v11 = strerror(*v10);
    v12 = CFStringCreateWithCString(0, v11, 0x8000100u);
    v14 = "Utilities.c";
    v15 = "WaitSocket";
    v16 = CFSTR("kqueue");
    v17 = v9;
    v18 = 206;
LABEL_18:
    sub_100000EE8(3u, v17, (uint64_t)v14, v18, (uint64_t)v15, v12, v16, v13, v28);
  }
  return 0;
}

uint64_t sub_100003990(uint64_t a1)
{
  int v1;

  v1 = *(unsigned __int8 *)(a1 + 257);
  if (v1 == 30 || v1 == 2)
    return bswap32(*(unsigned __int16 *)(a1 + 258)) >> 16;
  else
    return 0;
}

const void *sub_1000039B8(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int *v3;
  char *v4;
  CFStringRef v5;
  uint64_t v6;
  uint64_t v7;
  UInt8 *v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  const void *v16;
  unsigned int v18;
  CFIndex v19;
  const __CFData *v20;
  const __CFData *v21;
  CFPropertyListRef v22;
  CFTypeID v23;
  uint64_t v24;
  socklen_t v25;
  unsigned int v26;
  uint64_t v27;

  v1 = *(_DWORD *)(a1 + 240);
  v25 = 4;
  if (qword_10000C1C0 != -1)
    dispatch_once(&qword_10000C1C0, &stru_1000084A0);
  v26 = 0;
  usleep(1000 * dword_10000C088);
  if (getsockopt(v1, 6, 516, &v26, &v25))
  {
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v2 = qword_10000C1A8;
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
    {
      v3 = __error();
      v4 = strerror(*v3);
      v5 = CFStringCreateWithCString(0, v4, 0x8000100u);
      sub_100000EE8(3u, v2, (uint64_t)"Utilities.c", 298, (uint64_t)"copyEntitlementsForSocketPeer", v5, CFSTR("getsockopt"), v6, v24);
    }
    return 0;
  }
  v7 = v26;
  v27 = 0;
  if (!csops(v26, 7, &v27, 8))
    return 0;
  if (*__error() != 34)
  {
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v13 = qword_10000C1A8;
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
    {
      v14 = __error();
      strerror(*v14);
      sub_100000EE8(3u, v13, (uint64_t)"Utilities.c", 244, (uint64_t)"copyEntitlementsForPid", 0, CFSTR("csops1(%d): %s\n"), v15, v7);
    }
    return 0;
  }
  v8 = (UInt8 *)malloc_type_calloc(1uLL, bswap32(HIDWORD(v27)), 0x59FBFC9DuLL);
  if (csops(v7, 7, v8, bswap32(HIDWORD(v27))))
  {
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v10 = qword_10000C1A8;
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
    {
      v11 = __error();
      strerror(*v11);
      sub_100000EE8(3u, v10, (uint64_t)"Utilities.c", 252, (uint64_t)"copyEntitlementsForPid", 0, CFSTR("csops2(%d): %s\n"), v12, v7);
    }
    if (!v8)
      return 0;
    goto LABEL_18;
  }
  if (*(_DWORD *)v8 != 1903288058)
  {
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
      sub_100000EE8(3u, qword_10000C1A8, (uint64_t)"Utilities.c", 257, (uint64_t)"copyEntitlementsForPid", 0, CFSTR("bad magic 0x%08x\n"), v9, *(unsigned int *)v8);
    goto LABEL_18;
  }
  v18 = bswap32(*((_DWORD *)v8 + 1));
  if (v18 < 9
    || (v19 = v18 - 8,
        *((_DWORD *)v8 + 1) = v19,
        (v20 = CFDataCreateWithBytesNoCopy(0, v8 + 8, v19, kCFAllocatorNull)) == 0))
  {
LABEL_18:
    free(v8);
    return 0;
  }
  v21 = v20;
  v22 = CFPropertyListCreateWithData(0, v20, 0, 0, 0);
  v16 = v22;
  if (v22)
  {
    v23 = CFGetTypeID(v22);
    if (v23 != CFDictionaryGetTypeID())
    {
      CFRelease(v16);
      v16 = 0;
    }
  }
  free(v8);
  CFRelease(v21);
  return v16;
}

void sub_100003D8C(uint64_t a1)
{
  sub_100003DFC(a1);
  operator delete();
}

uint64_t sub_100003DB0(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned int *)(a1 + 240);
  if ((_DWORD)result != -1)
    return shutdown(result, 2);
  return result;
}

uint64_t sub_100003DC8(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned int *)(a1 + 240);
  if ((_DWORD)result != -1)
    result = close(result);
  *(_DWORD *)(a1 + 240) = -1;
  return result;
}

uint64_t sub_100003DFC(uint64_t a1)
{
  *(_QWORD *)a1 = off_100008550;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 384));
  dispatch_release(*(dispatch_object_t *)(a1 + 384));
  dispatch_release(*(dispatch_object_t *)(a1 + 248));
  return sub_1000033E4(a1);
}

uint64_t sub_100003E40(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 112))(a1);
}

uint64_t sub_100003E4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v9 = *(_QWORD *)(a1 + 16);
  v10 = *(_QWORD *)(v9 + 40);
  if (v10)
    goto LABEL_5;
  if (qword_10000C1A0 != -1)
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
  v10 = qword_10000C1A8;
  if (qword_10000C1A8)
  {
LABEL_5:
    if (*(int *)(v10 + 16) >= 5)
      sub_100000EE8(5u, v10, (uint64_t)"RPSocket.cpp", 368, (uint64_t)"FinalizeRPSocket", 0, CFSTR("Closed %@ after reading %lld bytes and writing %lld bytes\n"), a8, a1);
  }
  if (*(_QWORD *)(v9 + 208))
  {
    v11 = *(_QWORD *)(v9 + 40);
    if (v11)
      goto LABEL_12;
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v11 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
LABEL_12:
      if (*(int *)(v11 + 16) >= 5)
        sub_100000EE8(5u, v11, (uint64_t)"RPSocket.cpp", 371, (uint64_t)"FinalizeRPSocket", 0, CFSTR("Ending os transaction for %@\n"), a8, a1);
    }
    os_release(*(void **)(v9 + 208));
    *(_QWORD *)(v9 + 208) = 0;
  }
  result = *(_QWORD *)(a1 + 16);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 88))(result);
  return result;
}

CFStringRef sub_100003FB0(uint64_t a1)
{
  uint64_t v1;
  const void *v2;
  uint64_t v3;
  const void *v4;
  CFStringRef v5;
  CFStringRef v6;

  v1 = *(_QWORD *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(v1 + 136));
  v2 = *(const void **)(v1 + 16);
  if (v2)
    CFRetain(*(CFTypeRef *)(v1 + 16));
  pthread_mutex_unlock((pthread_mutex_t *)(v1 + 136));
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 40))(v1);
  v4 = (const void *)v3;
  if (v3)
    v5 = CFStringCreateWithFormat(0, 0, CFSTR("<RPSocket %p: %@ %@>"), *(_QWORD *)(v1 + 8), v2, v3);
  else
    v5 = CFStringCreateWithFormat(0, 0, CFSTR("<RPSocket %p: %@>"), *(_QWORD *)(v1 + 8), v2);
  v6 = v5;
  if (v2)
    CFRelease(v2);
  if (v4)
    CFRelease(v4);
  return v6;
}

uint64_t sub_100004068(uint64_t a1)
{
  return off_10000C1D0(*(_QWORD *)(a1 + 392));
}

uint64_t sub_100004078(uint64_t a1)
{
  return off_10000C1C8(*(_QWORD *)(a1 + 392));
}

CFStringRef sub_100004088(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("lockdown fd=%d"), *(unsigned int *)(a1 + 240));
}

void sub_1000040C0(uint64_t a1)
{
  sub_100003DFC(a1);
  operator delete();
}

uint64_t sub_1000040E4(uint64_t a1)
{
  return off_10000C1D8(*(_QWORD *)(a1 + 392));
}

void sub_1000040F4(id a1)
{
  void *v1;
  void *v2;

  v1 = dlopen("/usr/lib/liblockdown.dylib", 1);
  if (v1)
  {
    v2 = v1;
    off_10000C1C8 = (uint64_t (*)(_QWORD))dlsym(v1, "lockdown_send");
    off_10000C1D0 = (uint64_t (*)(_QWORD))dlsym(v2, "lockdown_recv");
    off_10000C1D8 = (uint64_t (*)(_QWORD))dlsym(v2, "lockdown_disconnect");
    off_10000C1E0 = dlsym(v2, "lockdown_get_socket");
  }
}

uint64_t sub_100004180()
{
  if (qword_10000C1F8 != -1)
    dispatch_once(&qword_10000C1F8, &stru_100008520);
  if (off_10000C1F0)
    operator new();
  return 0;
}

void sub_100004248()
{
  operator delete();
}

void sub_10000427C()
{
  abort();
}

void sub_100004288()
{
  abort();
}

void sub_100004294()
{
  abort();
}

uint64_t sub_1000042A0(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[5];

  if (!*(_BYTE *)(result + 248))
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 240);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 0x40000000;
    v3[2] = sub_1000045DC;
    v3[3] = &unk_1000087B8;
    v3[4] = v1;
    result = off_10000C1F0(v2, 0, 0, v3);
    *(_BYTE *)(v1 + 248) = 1;
  }
  return result;
}

void sub_100004320()
{
  abort();
}

CFStringRef sub_10000432C(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("service=%s"), *(_QWORD *)(a1 + 240));
}

const void *sub_100004360(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  __darwin_time_t tv_sec;
  pthread_mutex_t *v6;
  __darwin_time_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *ValueAtIndex;
  int v14;
  timespec v15;
  timeval v16;

  if (a2)
  {
    gettimeofday(&v16, 0);
    v4 = a2 + 1000 * v16.tv_usec;
    tv_sec = v16.tv_sec;
    v6 = (pthread_mutex_t *)(a1 + 264);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 264));
    if (v4)
    {
      v7 = tv_sec + v4 / 0x3B9ACA00;
      while (!CFArrayGetCount(*(CFArrayRef *)(a1 + 256)))
      {
        v15.tv_sec = v7;
        v15.tv_nsec = v4 % 0x3B9ACA00;
        v8 = pthread_cond_timedwait((pthread_cond_t *)(a1 + 328), (pthread_mutex_t *)(a1 + 264), &v15);
        if (v8)
        {
          v9 = *(_QWORD *)(a1 + 40);
          if (v9)
            goto LABEL_10;
          if (qword_10000C1A0 != -1)
          {
            v14 = v8;
            dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
            v8 = v14;
          }
          v9 = qword_10000C1A8;
          if (qword_10000C1A8)
          {
LABEL_10:
            if (*(int *)(v9 + 16) >= 3)
            {
              v10 = *(_QWORD *)(a1 + 8);
              strerror(v8);
              sub_100000EE8(3u, v9, (uint64_t)"RPSocket.cpp", 1256, (uint64_t)"accept", 0, CFSTR("pthread_cond_timedwait from %@: %s\n"), v11, v10);
            }
          }
          break;
        }
      }
    }
  }
  else
  {
    v6 = (pthread_mutex_t *)(a1 + 264);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 264));
  }
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 256)) < 1)
  {
    ValueAtIndex = 0;
  }
  else
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 256), 0);
    CFRetain(ValueAtIndex);
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 256), 0);
  }
  pthread_mutex_unlock(v6);
  return ValueAtIndex;
}

void sub_10000450C(uint64_t a1)
{
  sub_100004530(a1);
  operator delete();
}

uint64_t sub_100004530(uint64_t a1)
{
  CFIndex Count;
  CFIndex v3;
  _QWORD **ValueAtIndex;
  _QWORD **v5;

  *(_QWORD *)a1 = off_100008730;
  Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 256));
  if (Count >= 1)
  {
    v3 = 0;
    do
    {
      ValueAtIndex = (_QWORD **)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 256), v3);
      v5 = ValueAtIndex;
      if (ValueAtIndex)
      {
        (*(void (**)(_QWORD *))(*ValueAtIndex[2] + 32))(ValueAtIndex[2]);
        sub_100001CA0((uint64_t)v5[2]);
      }
      ++v3;
    }
    while (Count != v3);
  }
  CFRelease(*(CFTypeRef *)(a1 + 256));
  free(*(void **)(a1 + 240));
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 264));
  pthread_cond_destroy((pthread_cond_t *)(a1 + 328));
  return sub_1000033E4(a1);
}

void sub_1000045DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(v8 + 40);
  if (v9)
    goto LABEL_5;
  if (qword_10000C1A0 != -1)
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
  v9 = qword_10000C1A8;
  if (qword_10000C1A8)
  {
LABEL_5:
    if (*(int *)(v9 + 16) >= 7)
      sub_100000EE8(7u, v9, (uint64_t)"RPSocket.cpp", 1217, (uint64_t)"unpause_block_invoke", 0, CFSTR("got a %s connection for %@\n"), a8, *(_QWORD *)(v8 + 240));
  }
  if (qword_10000C1E8 != -1)
    dispatch_once(&qword_10000C1E8, &stru_1000084E0);
  if (off_10000C1C8 && off_10000C1D0 && off_10000C1D8 && off_10000C1E0)
    operator new();
  pthread_mutex_lock((pthread_mutex_t *)(v8 + 264));
  CFArrayAppendValue(*(CFMutableArrayRef *)(v8 + 256), 0);
  CFRelease(0);
  pthread_cond_broadcast((pthread_cond_t *)(v8 + 328));
  pthread_mutex_unlock((pthread_mutex_t *)(v8 + 264));
  sub_1000034AC(v8, 2);
}

void sub_100004770()
{
  operator delete();
}

void sub_100004794(id a1)
{
  void *v1;

  v1 = dlopen("/usr/lib/liblockdown.dylib", 1);
  if (v1)
    off_10000C1F0 = dlsym(v1, "lockdown_checkin_xpc");
}

void start(int a1, uint64_t a2)
{
  const char *v2;
  _BOOL4 v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int *v15;
  char *v16;
  CFStringRef v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int *v21;
  char *v22;
  CFStringRef v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  char *v27;
  CFStringRef v28;
  uint64_t v29;
  BOOL v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[5];
  __int16 v35;
  _BYTE v36[32];
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  _QWORD aBlock[5];
  BOOL v41;

  v3 = a1 >= 2 && (v2 = *(const char **)(a2 + 8)) != 0 && strcmp(v2, "--ramdisk") == 0;
  v4 = sub_100004E1C("notify");
  if (!v4)
  {
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v6 = qword_10000C1A8;
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
    {
      v7 = CFSTR("notify socket checkin failed\n");
      v8 = 381;
LABEL_51:
      sub_100000EE8(3u, v6, (uint64_t)"PurpleReverseProxyService.c", v8, (uint64_t)"main", 0, v7, v5, v33);
      goto LABEL_52;
    }
    goto LABEL_52;
  }
  v9 = (uint64_t)v4;
  v10 = sub_100004E1C("socks");
  if (!v10)
  {
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v6 = qword_10000C1A8;
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
    {
      v7 = CFSTR("socks socket checkin failed\n");
      v8 = 387;
      goto LABEL_51;
    }
LABEL_52:
    exit(1);
  }
  v11 = (uint64_t)v10;
  if (v3)
  {
    *(_OWORD *)v36 = xmmword_100006CA0;
    *(_OWORD *)&v36[12] = *(__int128 *)((char *)&xmmword_100006CA0 + 12);
    v12 = (uint64_t)sub_100004E1C("ctrl");
    v13 = socket(30, 1, 0);
    if (v13 != -1)
    {
      v19 = v13;
      if (bind(v13, (const sockaddr *)v36, 0x1Cu) == -1)
      {
        if (qword_10000C1A0 != -1)
          dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
        v20 = qword_10000C1A8;
        if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
        {
          v21 = __error();
          v22 = strerror(*v21);
          v23 = CFStringCreateWithCString(0, v22, 0x8000100u);
          sub_100000EE8(3u, v20, (uint64_t)"RPSocket.cpp", 1113, (uint64_t)"RPCreateSocketAcceptingWithAddress", v23, CFSTR("bind(port=%d)"), v24, 0);
        }
      }
      else
      {
        if (listen(v19, 128) != -1)
          sub_100002B70();
        if (qword_10000C1A0 != -1)
          dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
        v25 = qword_10000C1A8;
        if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
        {
          v26 = __error();
          v27 = strerror(*v26);
          v28 = CFStringCreateWithCString(0, v27, 0x8000100u);
          sub_100000EE8(3u, v25, (uint64_t)"RPSocket.cpp", 1118, (uint64_t)"RPCreateSocketAcceptingWithAddress", v28, CFSTR("listen(port=%d)"), v29, 0);
        }
      }
      close(v19);
LABEL_44:
      v14 = 0;
      if (v12)
      {
LABEL_45:
        if (v14)
        {
          v30 = (sub_10000156C() & 1) == 0 && (MGGetBoolAnswer(CFSTR("OBqqs000I0SR+EbJ7VO8UQ")) & 1) != 0 && !v3;
          v31 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v14 + 16) + 56))(*(_QWORD *)(v14 + 16));
          qword_10000C200 = (uint64_t)CFSetCreateMutable(0, 0, &kCFTypeSetCallBacks);
          aBlock[0] = _NSConcreteStackBlock;
          aBlock[1] = 0x40000000;
          aBlock[2] = sub_100004F84;
          aBlock[3] = &unk_1000087F8;
          aBlock[4] = v9;
          v41 = v30;
          sub_100001BEC(v9, aBlock);
          *(_QWORD *)v36 = _NSConcreteStackBlock;
          *(_QWORD *)&v36[8] = 0x40000000;
          *(_QWORD *)&v36[16] = sub_100005090;
          *(_QWORD *)&v36[24] = &unk_100008818;
          v39 = v30;
          v37 = v11;
          v38 = v14;
          sub_100001BEC(v11, v36);
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 0x40000000;
          v34[2] = sub_1000056D0;
          v34[3] = &unk_100008858;
          v34[4] = v12;
          v35 = v31;
          sub_100001BEC(v12, v34);
          sub_100001BA0(*(_QWORD *)(v9 + 16));
          sub_100001BA0(*(_QWORD *)(v12 + 16));
          sub_100001BA0(*(_QWORD *)(v11 + 16));
          if (!v3)
            sub_100001BA0(*(_QWORD *)(v14 + 16));
          if (qword_10000C1A0 != -1)
            dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
          if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 7)
            sub_100000EE8(7u, qword_10000C1A8, (uint64_t)"PurpleReverseProxyService.c", 443, (uint64_t)"main", 0, CFSTR("proxy running\n"), v32, v33);
          CFRunLoopRun();
          exit(0);
        }
        if (qword_10000C1A0 != -1)
          dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
        v6 = qword_10000C1A8;
        if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
        {
          v7 = CFSTR("no conn listener\n");
          v8 = 426;
          goto LABEL_51;
        }
        goto LABEL_52;
      }
LABEL_26:
      if (qword_10000C1A0 != -1)
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
      v6 = qword_10000C1A8;
      if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
      {
        v7 = CFSTR("no ctrl listener\n");
        v8 = 421;
        goto LABEL_51;
      }
      goto LABEL_52;
    }
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v14 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
      if (*(int *)(qword_10000C1A8 + 16) >= 3)
      {
        v15 = __error();
        v16 = strerror(*v15);
        v17 = CFStringCreateWithCString(0, v16, 0x8000100u);
        sub_100000EE8(3u, v14, (uint64_t)"RPSocket.cpp", 1100, (uint64_t)"RPCreateSocketAcceptingWithAddress", v17, CFSTR("socket(%d, SOCK_STREAM)"), v18, 30);
      }
      goto LABEL_44;
    }
  }
  else
  {
    v12 = sub_100004180();
    v14 = sub_100004180();
  }
  if (v12)
    goto LABEL_45;
  goto LABEL_26;
}

int *sub_100004E1C(const char *a1)
{
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int *result;
  int v8;
  char *v9;
  size_t cnt;
  int *fds;

  cnt = 0;
  fds = 0;
  v2 = launch_activate_socket(a1, &fds, &cnt);
  if (v2)
  {
    v4 = v2;
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v5 = qword_10000C1A8;
    if (qword_10000C1A8)
    {
      if (*(int *)(qword_10000C1A8 + 16) >= 3)
      {
        v9 = strerror(v4);
        sub_100000EE8(3u, v5, (uint64_t)"PurpleReverseProxyService.c", 21, (uint64_t)"get_launchd_socket", 0, CFSTR("launch_activate_socket: %s\n"), v6, (uint64_t)v9);
      }
    }
  }
  else
  {
    if (cnt)
    {
      v8 = *fds;
      free(fds);
      if (v8 != -1)
        sub_100002B70();
      return 0;
    }
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
      sub_100000EE8(3u, qword_10000C1A8, (uint64_t)"PurpleReverseProxyService.c", 25, (uint64_t)"get_launchd_socket", 0, CFSTR("launch_activate_socket: no sockets for %s\n"), v3, (uint64_t)a1);
  }
  result = fds;
  if (fds)
  {
    free(fds);
    return 0;
  }
  return result;
}

void sub_100004F84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  _QWORD aBlock[5];

  v9 = sub_100005BC4(*(_QWORD *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40), a4, a5, a6, a7, a8);
  if (v9)
  {
    v11 = v9;
    sub_100001A54((uint64_t)v9, CFSTR("NotifyConn"));
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 0x40000000;
    aBlock[2] = sub_10000623C;
    aBlock[3] = &unk_1000087D8;
    aBlock[4] = v11;
    sub_100001BEC((uint64_t)v11, aBlock);
    sub_100001BA0(v11[2]);
    CFRelease(v11);
  }
  else
  {
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    if (qword_10000C1A8)
    {
      if (*(int *)(qword_10000C1A8 + 16) >= 3)
        sub_100000EE8(3u, qword_10000C1A8, (uint64_t)"PurpleReverseProxyService.c", 131, (uint64_t)"startProxy_block_invoke", 0, CFSTR("acceptConnection failed\n"), v10, a9);
    }
  }
}

void sub_100005090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  _WORD *v18;
  uint64_t v19;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CFStringRef v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  CFStringRef v34;
  __CFDictionary *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  void *key;
  int v63;

  v10 = sub_100005BC4(*(_QWORD *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 48), a4, a5, a6, a7, a8);
  if (v10)
  {
    v12 = v10;
    pthread_mutex_lock(&stru_10000C158);
    v13 = (uint64_t *)qword_10000C208;
    if (qword_10000C208)
    {
      CFRetain((CFTypeRef)qword_10000C208);
      v14 = dword_10000C198;
      pthread_mutex_unlock(&stru_10000C158);
      v63 = 1;
      if ((sub_100002280((uint64_t)v13, (uint64_t)&v63, 4) & 1) != 0)
      {
        v15 = sub_100001CE8(*(_QWORD *)(a1 + 40), 10000000000);
        if (v15)
        {
          v17 = (uint64_t *)v15;
          v18 = malloc_type_malloc(0xAuLL, 0x76998600uLL);
          if (sub_100001D54((uint64_t)v17, (uint64_t)v18, 10))
          {
            if (*(_QWORD *)v18 == 0x6E6F436F6C6C6548 && v18[4] == 110)
            {
              v22 = 1;
              if (!v18)
              {
LABEL_18:
                if (v22)
                {
                  v23 = random();
                  v24 = random();
                  v25 = random();
                  v26 = CFStringCreateWithFormat(0, 0, CFSTR("%08x%08x%08x"), v23, v24, v25);
                  v34 = v26;
                  if (v14 == 1)
                  {
                    v35 = 0;
                    if ((sub_100002280((uint64_t)v17, (uint64_t)"HelloConn", 10) & 1) != 0)
                    {
LABEL_53:
                      sub_100001A54((uint64_t)v17, CFSTR("Host-%@"), v34);
                      sub_100001A54((uint64_t)v12, CFSTR("Client-%@"), v34);
                      v44 = *(_QWORD *)(v17[2] + 40);
                      if (v44)
                        goto LABEL_57;
                      if (qword_10000C1A0 != -1)
                        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
                      v44 = qword_10000C1A8;
                      if (qword_10000C1A8)
                      {
LABEL_57:
                        if (*(int *)(v44 + 16) >= 5)
                          sub_100000EE8(5u, v44, (uint64_t)"RPSocket.cpp", 711, (uint64_t)"RPSocketExchangeData", 0, CFSTR("RPSocketExchangeData:   %p  <==>  %p\n"), v43, v17[2]);
                      }
                      sub_100001B54(v17[2]);
                      sub_100001B54(v12[2]);
                      sub_1000026E8((uint64_t *)v17[2], v45, v46, v47, v48, v49, v50, v51);
                      sub_1000026E8((uint64_t *)v12[2], v52, v53, v54, v55, v56, v57, v58);
                      v60 = *(_QWORD *)(v17[2] + 40);
                      if (v60)
                        goto LABEL_63;
                      if (qword_10000C1A0 != -1)
                        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
                      v60 = qword_10000C1A8;
                      if (qword_10000C1A8)
                      {
LABEL_63:
                        if (*(int *)(v60 + 16) >= 5)
                          sub_100000EE8(5u, v60, (uint64_t)"RPSocket.cpp", 719, (uint64_t)"RPSocketExchangeData", 0, CFSTR("Beginning data exchange:   %@  <==>  %@\n"), v59, (uint64_t)v17);
                      }
                      sub_100001AE0(v17[2], (uint64_t)sub_1000027C0, v12);
                      sub_100001AE0(v12[2], (uint64_t)sub_1000027C0, v17);
                      v61 = dispatch_queue_create("com.apple.PurpleReverseProxy.ExchangeData", 0);
                      sub_100001C38(v17[2], v61);
                      sub_100001C38(v12[2], v61);
                      dispatch_release(v61);
                      sub_100001BA0(v17[2]);
                      sub_100001BA0(v12[2]);
                      sub_100001BA0(v17[2]);
                      sub_100001BA0(v12[2]);
                      CFRelease(v12);
LABEL_39:
                      CFRelease(v13);
LABEL_40:
                      if (v17)
                        CFRelease(v17);
                      if (v34)
                        CFRelease(v34);
                      if (v35)
                        CFRelease(v35);
                      return;
                    }
                  }
                  else
                  {
                    v35 = sub_1000012F0(CFSTR("HelloConn"), v27, v28, v29, v30, v31, v32, v33, CFSTR("Identifier"), (uint64_t)v26);
                    sub_100001408(v35, CFSTR("ConnProtoVersion"), 2);
                    if (sub_100002390((uint64_t)v17, v35, v37, v38, v39, v40, v41, v42))
                      goto LABEL_53;
                  }
LABEL_36:
                  (*(void (**)(uint64_t))(*(_QWORD *)v12[2] + 32))(v12[2]);
                  sub_100001CA0(v12[2]);
                  if (v17)
                  {
                    (*(void (**)(uint64_t))(*(_QWORD *)v17[2] + 32))(v17[2]);
                    sub_100001CA0(v17[2]);
                  }
                  CFRelease(v12);
                  if (!v13)
                    goto LABEL_40;
                  goto LABEL_39;
                }
LABEL_35:
                v34 = 0;
                v35 = 0;
                goto LABEL_36;
              }
LABEL_17:
              free(v18);
              goto LABEL_18;
            }
            v21 = *(_QWORD *)(v17[2] + 40);
            if (v21)
              goto LABEL_14;
            if (qword_10000C1A0 != -1)
              dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
            v21 = qword_10000C1A8;
            if (qword_10000C1A8)
            {
LABEL_14:
              if (*(int *)(v21 + 16) >= 3)
                sub_100000EE8(3u, v21, (uint64_t)"RPSocket.cpp", 543, (uint64_t)"RPSocketReceiveExpectedMessage", 0, CFSTR("invalid message from %@, expecting '%s'\n"), v19, (uint64_t)v17);
            }
          }
          v22 = 0;
          if (!v18)
            goto LABEL_18;
          goto LABEL_17;
        }
        if (qword_10000C1A0 != -1)
          dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
        if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
          sub_100000EE8(3u, qword_10000C1A8, (uint64_t)"PurpleReverseProxyService.c", 231, (uint64_t)"startProxy_block_invoke_3", 0, CFSTR("RPSocketCreateAccepted failed\n"), v16, (uint64_t)key);
      }
      else
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v13[2] + 32))(v13[2]);
        sub_100001CA0(v13[2]);
      }
    }
    else
    {
      pthread_mutex_unlock(&stru_10000C158);
      if (qword_10000C1A0 != -1)
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
      if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
        sub_100000EE8(3u, qword_10000C1A8, (uint64_t)"PurpleReverseProxyService.c", 218, (uint64_t)"startProxy_block_invoke_3", 0, CFSTR("no current ctrl connection exists from the host so we can't accept socks connections right now\n"), v36, (uint64_t)key);
      v13 = 0;
    }
    v17 = 0;
    goto LABEL_35;
  }
  if (qword_10000C1A0 != -1)
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
  if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
    sub_100000EE8(3u, qword_10000C1A8, (uint64_t)"PurpleReverseProxyService.c", 206, (uint64_t)"startProxy_block_invoke_3", 0, CFSTR("acceptConnection failed\n"), v11, a9);
}

void sub_1000056D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  const __CFDictionary *v15;
  __CFDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFDictionary *v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *key;
  uint64_t v34;
  _QWORD aBlock[5];
  unsigned int v36;
  uint64_t v37;
  __int16 v38;

  v36 = -1;
  v9 = sub_100005BC4(*(_QWORD *)(a1 + 32), a2, 0, a4, a5, a6, a7, a8);
  if (v9)
  {
    v11 = v9;
    sub_100001A54((uint64_t)v9, CFSTR("CtrlConn"));
    if (sub_100001D54((uint64_t)v11, (uint64_t)&v37, 10))
    {
      if (v37 == 0x7274436E69676542 && v38 == 108)
      {
        v19 = (const __CFDictionary *)sub_100001F08((uint64_t)v11);
        v15 = v19;
        if (v19)
        {
          if ((sub_100001468(v19, CFSTR("CtrlProtoVersion"), &v36) & 1) != 0)
          {
            if (v36 != 2)
            {
              if (qword_10000C1A0 != -1)
                dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
              v20 = qword_10000C1A8;
              if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
              {
                v34 = v36;
                sub_100000EE8(3u, qword_10000C1A8, (uint64_t)"PurpleReverseProxyService.c", 303, (uint64_t)"startProxy_block_invoke_4", 0, CFSTR("Mismatched ctrl proto version (expected %d, got %d); this may or may not work\n"),
                  v26,
                  2);
              }
            }
            v16 = sub_1000012F0(CFSTR("BeginCtrl"), v20, v21, v22, v23, v24, v25, v26, 0, v34);
            sub_100001408(v16, CFSTR("CtrlProtoVersion"), 2);
            sub_100001408(v16, CFSTR("ConnPort"), *(unsigned __int16 *)(a1 + 40));
            if ((sub_100002390((uint64_t)v11, v16, v27, v28, v29, v30, v31, v32) & 1) != 0)
              goto LABEL_12;
LABEL_45:
            (*(void (**)(uint64_t))(*(_QWORD *)v11[2] + 32))(v11[2]);
            sub_100001CA0(v11[2]);
LABEL_46:
            CFRelease(v11);
            if (v15)
              CFRelease(v15);
            if (v16)
              CFRelease(v16);
            return;
          }
          if (qword_10000C1A0 != -1)
            dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
          if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
            sub_100000EE8(3u, qword_10000C1A8, (uint64_t)"PurpleReverseProxyService.c", 298, (uint64_t)"startProxy_block_invoke_4", 0, CFSTR("Host didn't specify ctrl proto version\n"), v26, (uint64_t)key);
        }
LABEL_44:
        v16 = 0;
        goto LABEL_45;
      }
      if (v37 != 0x7274436F6C6C6548 || v38 != 108)
      {
        v15 = 0;
        v16 = 0;
LABEL_12:
        pthread_mutex_lock(&stru_10000C158);
        v18 = qword_10000C208;
        if (qword_10000C208)
        {
          (*(void (**)(_QWORD))(**(_QWORD **)(qword_10000C208 + 16) + 32))(*(_QWORD *)(qword_10000C208 + 16));
          sub_100001CA0(*(_QWORD *)(v18 + 16));
          CFRelease((CFTypeRef)qword_10000C208);
        }
        qword_10000C208 = (uint64_t)v11;
        dword_10000C198 = v36;
        if (qword_10000C1A0 != -1)
          dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
        if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 5)
          sub_100000EE8(5u, qword_10000C1A8, (uint64_t)"PurpleReverseProxyService.c", 327, (uint64_t)"startProxy_block_invoke_4", 0, CFSTR("got a ctrl connection from a host so we can now accept socks connections\n"), v17, (uint64_t)key);
        sub_100005E3C(1);
        CFRetain((CFTypeRef)qword_10000C208);
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 0x40000000;
        aBlock[2] = sub_100005EA4;
        aBlock[3] = &unk_100008838;
        aBlock[4] = v11;
        sub_100001BEC((uint64_t)v11, aBlock);
        sub_100001BA0(v11[2]);
        notify_post("com.apple.PurpleReverseProxy.ProxyOnline");
        pthread_mutex_unlock(&stru_10000C158);
        goto LABEL_46;
      }
      if (qword_10000C1A0 != -1)
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
      if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
        sub_100000EE8(3u, qword_10000C1A8, (uint64_t)"PurpleReverseProxyService.c", 314, (uint64_t)"startProxy_block_invoke_4", 0, CFSTR("Host is using deprecated ReverseProxy protocol; allowing for now\n"),
          v12,
          (uint64_t)key);
      if (sub_100002280((uint64_t)v11, (uint64_t)"HelloCtrl", 10)
        && sub_100002280((uint64_t)v11, a1 + 40, 2))
      {
        v15 = 0;
        v16 = 0;
        v36 = 1;
        goto LABEL_12;
      }
    }
    v15 = 0;
    goto LABEL_44;
  }
  if (qword_10000C1A0 != -1)
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
  if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
    sub_100000EE8(3u, qword_10000C1A8, (uint64_t)"PurpleReverseProxyService.c", 282, (uint64_t)"startProxy_block_invoke_4", 0, CFSTR("acceptConnection failed\n"), v10, (uint64_t)key);
}

uint64_t *sub_100005BC4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  const __CFDictionary *v12;
  uint64_t v13;
  const __CFDictionary *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v20;

  if (a2 != 2)
  {
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
      sub_100000EE8(3u, qword_10000C1A8, (uint64_t)"PurpleReverseProxyService.c", 47, (uint64_t)"acceptConnection", 0, CFSTR("unknown event type %lu\n"), a8, a2);
LABEL_30:
    exit(1);
  }
  v9 = sub_100001CE8(a1, 0);
  if (!v9)
  {
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
      sub_100000EE8(3u, qword_10000C1A8, (uint64_t)"PurpleReverseProxyService.c", 53, (uint64_t)"acceptConnection", 0, CFSTR("RPSocketCreateAccepted failed\n"), v10, v20);
    goto LABEL_30;
  }
  v11 = (uint64_t *)v9;
  if (!a3)
    return v11;
  v12 = (const __CFDictionary *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(v9 + 16) + 72))(*(_QWORD *)(v9 + 16));
  v14 = v12;
  if (v12)
  {
    if (CFDictionaryGetValue(v12, CFSTR("com.apple.private.PurpleReverseProxy.allowed")) == kCFBooleanTrue)
    {
LABEL_18:
      CFRelease(v14);
      return v11;
    }
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v15 = qword_10000C1A8;
    if (!qword_10000C1A8 || *(int *)(qword_10000C1A8 + 16) < 3)
      goto LABEL_17;
    v16 = CFSTR("client not entitled to use proxy\n");
    v17 = 66;
    goto LABEL_16;
  }
  if (qword_10000C1A0 != -1)
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
  v15 = qword_10000C1A8;
  if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
  {
    v16 = CFSTR("RPSocketCopyEntitlements failed\n");
    v17 = 61;
LABEL_16:
    sub_100000EE8(3u, v15, (uint64_t)"PurpleReverseProxyService.c", v17, (uint64_t)"acceptConnection", 0, v16, v13, v20);
  }
LABEL_17:
  (*(void (**)(uint64_t))(*(_QWORD *)v11[2] + 32))(v11[2]);
  sub_100001CA0(v11[2]);
  CFRelease(v11);
  v11 = 0;
  if (v14)
    goto LABEL_18;
  return v11;
}

void sub_100005E3C(char a1)
{
  NSObject *global_queue;
  _QWORD block[4];
  char v4;

  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_1000060F8;
  block[3] = &unk_100008878;
  v4 = a1;
  dispatch_async(global_queue, block);
}

uint64_t sub_100005EA4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  CFStringRef v13;
  int *v14;
  char *v15;
  uint64_t v16;
  const void *v17;
  uint64_t v19;
  _BYTE v20[10];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (***(uint64_t (****)(_QWORD, _BYTE *, uint64_t))(v2 + 16))(*(_QWORD *)(v2 + 16), v20, 10);
  v5 = v3;
  if (v3 == -1)
    goto LABEL_10;
  v6 = *(unint64_t **)(*(_QWORD *)(v2 + 16) + 232);
  do
    v7 = __ldxr(v6);
  while (__stxr(v7 + v3, v6));
  if (v3 < 1)
  {
LABEL_10:
    if (qword_10000C1A0 != -1)
      dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
    v12 = qword_10000C1A8;
    if (v5 == -1)
    {
      if (!qword_10000C1A8 || *(int *)(qword_10000C1A8 + 16) < 3)
        goto LABEL_21;
      v14 = __error();
      v15 = strerror(*v14);
      v13 = CFStringCreateWithCString(0, v15, 0x8000100u);
      v9 = CFSTR("ctrl socket read");
      v10 = 3;
      v8 = v12;
      v11 = 339;
      goto LABEL_20;
    }
    if (!qword_10000C1A8 || *(int *)(qword_10000C1A8 + 16) < 7)
      goto LABEL_21;
    v9 = CFSTR("ctrl socket eof\n");
    v10 = 7;
    v8 = qword_10000C1A8;
    v11 = 341;
LABEL_16:
    v13 = 0;
LABEL_20:
    sub_100000EE8(v10, v8, (uint64_t)"PurpleReverseProxyService.c", v11, (uint64_t)"startProxy_block_invoke_5", v13, v9, v4, v19);
    goto LABEL_21;
  }
  if (qword_10000C1A0 != -1)
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
  v8 = qword_10000C1A8;
  if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 3)
  {
    v9 = CFSTR("unexpected data on ctrl socket\n");
    v10 = 3;
    v11 = 337;
    goto LABEL_16;
  }
LABEL_21:
  pthread_mutex_lock(&stru_10000C158);
  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
  {
    (*(void (**)(_QWORD))(**(_QWORD **)(v16 + 16) + 32))(*(_QWORD *)(v16 + 16));
    sub_100001CA0(*(_QWORD *)(v16 + 16));
    v17 = *(const void **)(a1 + 32);
  }
  else
  {
    v17 = 0;
  }
  if ((const void *)qword_10000C208 == v17)
  {
    CFRelease(v17);
    qword_10000C208 = 0;
    dword_10000C198 = -1;
    sub_100005E3C(0);
  }
  return pthread_mutex_unlock(&stru_10000C158);
}

uint64_t sub_1000060F8(uint64_t a1)
{
  pthread_mutex_lock(&stru_10000C118);
  CFSetApplyFunction((CFSetRef)qword_10000C200, (CFSetApplierFunction)sub_100006140, (void *)(a1 + 32));
  return pthread_mutex_unlock(&stru_10000C118);
}

uint64_t sub_100006140(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100006148(a1, *a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_100006148(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *v10;
  uint64_t result;
  int v12;

  if (qword_10000C1A0 != -1)
    dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
  if (qword_10000C1A8 && *(int *)(qword_10000C1A8 + 16) >= 5)
  {
    v10 = "is not";
    if (a2)
      v10 = "is";
    sub_100000EE8(5u, qword_10000C1A8, (uint64_t)"PurpleReverseProxyService.c", 94, (uint64_t)"sendANotification", 0, CFSTR("sending a client notification that the proxy %s online\n"), a8, (uint64_t)v10);
  }
  v12 = a2;
  result = sub_100002280(a1, (uint64_t)&v12, 4);
  if ((result & 1) == 0)
  {
    if (a1)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16));
      return sub_100001CA0(*(_QWORD *)(a1 + 16));
    }
  }
  return result;
}

void sub_10000623C(uint64_t a1)
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  const void *Value;
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;

  v2 = (const __CFDictionary *)sub_100001F08(*(_QWORD *)(a1 + 32));
  if (v2)
  {
    v3 = v2;
    Value = CFDictionaryGetValue(v2, CFSTR("Command"));
    if (Value)
    {
      v6 = Value;
      if (CFEqual(Value, CFSTR("RegisterNotify")))
      {
        pthread_mutex_lock(&stru_10000C118);
        CFSetAddValue((CFMutableSetRef)qword_10000C200, *(const void **)(a1 + 32));
        pthread_mutex_unlock(&stru_10000C118);
        pthread_mutex_lock(&stru_10000C158);
        sub_100006148(*(_QWORD *)(a1 + 32), qword_10000C208 != 0, v7, v8, v9, v10, v11, v12);
        pthread_mutex_unlock(&stru_10000C158);
        CFRelease(v3);
        return;
      }
      if (CFEqual(v6, CFSTR("SetLogLevel")))
      {
        v22 = 0;
        if ((sub_100001468(v3, CFSTR("Level"), &v22) & 1) != 0)
        {
          v17 = v22;
          if (qword_10000C1A0 != -1)
            dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
          v18 = qword_10000C1A8;
          if (v17 >= 7)
            LODWORD(v19) = 7;
          else
            LODWORD(v19) = v17;
          if (v17 < 0)
            LODWORD(v19) = 0;
          if (v17 == -1)
            v19 = 5;
          else
            v19 = v19;
          *(_DWORD *)(qword_10000C1A8 + 16) = v19;
          if (v19 >= 3)
            sub_100000EE8(3u, v18, (uint64_t)"Logging.c", 111, (uint64_t)"SetDefaultLogLevel", 0, CFSTR("set default log level to %d (%s)\n"), v5, v19);
          goto LABEL_38;
        }
        if (qword_10000C1A0 != -1)
          dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
        v14 = qword_10000C1A8;
        if (!qword_10000C1A8 || *(int *)(qword_10000C1A8 + 16) < 3)
          goto LABEL_38;
        v15 = CFSTR("client dictionary has invalid level\n");
        v16 = 166;
      }
      else
      {
        if (qword_10000C1A0 != -1)
          dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
        v14 = qword_10000C1A8;
        if (!qword_10000C1A8 || *(int *)(qword_10000C1A8 + 16) < 3)
          goto LABEL_38;
        v15 = CFSTR("unknown command from client\n");
        v16 = 172;
      }
    }
    else
    {
      if (qword_10000C1A0 != -1)
        dispatch_once_f(&qword_10000C1A0, &qword_10000C1A8, (dispatch_function_t)sub_100000E1C);
      v14 = qword_10000C1A8;
      if (!qword_10000C1A8 || *(int *)(qword_10000C1A8 + 16) < 3)
        goto LABEL_38;
      v15 = CFSTR("client dictionary doesn't contain a command\n");
      v16 = 146;
    }
    sub_100000EE8(3u, v14, (uint64_t)"PurpleReverseProxyService.c", v16, (uint64_t)"startProxy_block_invoke_2", 0, v15, v5, v21);
LABEL_38:
    v20 = *(_QWORD *)(a1 + 32);
    if (v20)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)(v20 + 16) + 32))(*(_QWORD *)(v20 + 16));
      sub_100001CA0(*(_QWORD *)(v20 + 16));
    }
    pthread_mutex_lock(&stru_10000C118);
    CFSetRemoveValue((CFMutableSetRef)qword_10000C200, *(const void **)(a1 + 32));
    pthread_mutex_unlock(&stru_10000C118);
    CFRelease(v3);
    return;
  }
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
  {
    (*(void (**)(_QWORD))(**(_QWORD **)(v13 + 16) + 32))(*(_QWORD *)(v13 + 16));
    sub_100001CA0(*(_QWORD *)(v13 + 16));
  }
  pthread_mutex_lock(&stru_10000C118);
  CFSetRemoveValue((CFMutableSetRef)qword_10000C200, *(const void **)(a1 + 32));
  pthread_mutex_unlock(&stru_10000C118);
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}
