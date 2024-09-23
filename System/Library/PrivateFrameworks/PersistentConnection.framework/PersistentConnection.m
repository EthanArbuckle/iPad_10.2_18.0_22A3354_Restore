void sub_1CBC1D09C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1CBC1D300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CBC1D4B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC1D514(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

__CFString *PCStringFromDate(void *a1)
{
  id v1;
  __CFString *v2;

  v1 = a1;
  if (v1)
  {
    if (PCStringFromDate_onceToken != -1)
      dispatch_once(&PCStringFromDate_onceToken, &__block_literal_global_5);
    objc_msgSend((id)PCStringFromDate_formatter, "stringFromDate:", v1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = CFSTR("(null)");
  }

  return v2;
}

void sub_1CBC1DC90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC1E060(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC1E618(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC1E87C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC1EDC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC1EEBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _GetPowerMonitoringQueue()
{
  if (_GetPowerMonitoringQueue_onceToken != -1)
    dispatch_once(&_GetPowerMonitoringQueue_onceToken, &__block_literal_global_143);
  return (id)sPowerMonitoringQueue;
}

void sub_1CBC1F4C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC1F888(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC207B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC208A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  uint64_t v8;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v7);
  _Block_object_dispose((const void *)(v8 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1CBC20C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CBC20D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void __loadPCPrefsIfNeeded_block_invoke(_BYTE *a1)
{
  const __CFString *Copy;
  const __CFString *v3;
  const __CFString *v4;

  if (a1[32] && PCPrefsNeedLoading == 1)
  {
    Copy = CFStringCreateCopy(0, CFSTR("com.apple.persistentconnection"));
    CFPreferencesAppSynchronize(Copy);
    CFRelease(Copy);
    PCPrefsNeedLoading = 0;
  }
  if (a1[33] && PCPrefsNeedLoadingConnectionClassNoSettings == 1)
  {
    v3 = CFStringCreateCopy(0, CFSTR("com.apple.persistentconnection-nosettings"));
    CFPreferencesAppSynchronize(v3);
    CFRelease(v3);
    PCPrefsNeedLoadingConnectionClassNoSettings = 0;
  }
  if (a1[34])
  {
    if (PCPrefsNeedLoadingConnectionClassMailContactsCalendars == 1)
    {
      v4 = CFStringCreateCopy(0, CFSTR("com.apple.persistentconnection-mcc"));
      CFPreferencesAppSynchronize(v4);
      CFRelease(v4);
      PCPrefsNeedLoadingConnectionClassMailContactsCalendars = 0;
    }
  }
}

uint64_t PCSettingsGetPollInterval(uint64_t a1, const __CFString *a2)
{
  int v2;

  v2 = a1;
  if (PCSettingsGetStyle(a1, a2) == 2)
    return 0xFFFFFFFFLL;
  else
    return PCSettingsGetClassPollInterval(v2);
}

uint64_t PCSettingsGetStyle(uint64_t result, const __CFString *a2)
{
  int v2;

  if ((_DWORD)result)
  {
    v2 = result;
    if (a2)
    {
      result = (uint64_t)_PCSettingsGetStyle(result, a2);
      if ((_DWORD)result == 1)
      {
LABEL_7:
        if ((int)PCSettingsGetClassPollInterval(v2) >= 0)
          return 1;
        else
          return 2;
      }
      if ((_DWORD)result)
        return result;
    }
    if (PCSettingsGetClassPushEnabled(v2))
      return 0;
    goto LABEL_7;
  }
  return result;
}

uint64_t PCSettingsGetClassPushEnabled(int a1)
{
  const __CFString *v2;
  const __CFString *Copy;
  const __CFString *v4;
  const __CFBoolean *v5;
  const __CFBoolean *v6;
  CFTypeID v7;
  uint64_t Value;
  const __CFString *v9;
  const __CFBoolean *v10;
  CFTypeID v11;

  if (registerForPCPrefChanges_onceToken != -1)
    dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
  loadPCPrefsIfNeeded(a1 == 0, a1 == 1);
  if (!a1)
  {
    v2 = CFSTR("com.apple.persistentconnection-nosettings");
    goto LABEL_7;
  }
  if (a1 == 1)
  {
    v2 = CFSTR("com.apple.persistentconnection-mcc");
LABEL_7:
    Copy = CFStringCreateCopy(0, v2);
    goto LABEL_9;
  }
  Copy = 0;
LABEL_9:
  v4 = (const __CFString *)*MEMORY[0x1E0C9B230];
  v5 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("PCEnablePush"), Copy, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v5)
  {
    v6 = v5;
    v7 = CFGetTypeID(v5);
    if (v7 == CFBooleanGetTypeID())
    {
      Value = CFBooleanGetValue(v6);
      if (!Copy)
        goto LABEL_20;
LABEL_19:
      CFRelease(Copy);
      goto LABEL_20;
    }
LABEL_18:
    Value = 1;
    if (!Copy)
      goto LABEL_20;
    goto LABEL_19;
  }
  if (a1 != 1)
  {
    v6 = 0;
    goto LABEL_18;
  }
  v9 = CFStringCreateCopy(0, CFSTR("com.apple.persistentconnection"));
  v10 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("PCEnablePush"), v9, CFSTR("mobile"), v4);
  v6 = v10;
  if (v10 && (v11 = CFGetTypeID(v10), v11 == CFBooleanGetTypeID()))
    Value = CFBooleanGetValue(v6);
  else
    Value = 1;
  CFRelease(v9);
  if (Copy)
    goto LABEL_19;
LABEL_20:
  if (v6)
    CFRelease(v6);
  return Value;
}

uint64_t PCSettingsGetClassPollInterval(int a1)
{
  const __CFString *v2;
  const __CFString *Copy;
  const __CFString *v4;
  const __CFNumber *v5;
  const __CFNumber *v6;
  CFTypeID v7;
  const void *v8;
  const __CFString *v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  CFTypeID v13;
  int valuePtr;

  if (registerForPCPrefChanges_onceToken != -1)
    dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
  loadPCPrefsIfNeeded(a1 == 0, a1 == 1);
  valuePtr = 0;
  if (!a1)
  {
    v2 = CFSTR("com.apple.persistentconnection-nosettings");
    goto LABEL_7;
  }
  if (a1 == 1)
  {
    v2 = CFSTR("com.apple.persistentconnection-mcc");
LABEL_7:
    Copy = CFStringCreateCopy(0, v2);
    goto LABEL_9;
  }
  Copy = 0;
LABEL_9:
  v4 = (const __CFString *)*MEMORY[0x1E0C9B230];
  v5 = (const __CFNumber *)CFPreferencesCopyValue(CFSTR("PCDefaultPollInterval"), Copy, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v5)
  {
    v6 = v5;
    v7 = CFGetTypeID(v5);
    if (v7 == CFNumberGetTypeID())
      CFNumberGetValue(v6, kCFNumberIntType, &valuePtr);
    v8 = v6;
LABEL_13:
    CFRelease(v8);
    goto LABEL_14;
  }
  if (a1)
  {
    if (a1 == 1)
    {
      v10 = CFStringCreateCopy(0, CFSTR("com.apple.persistentconnection"));
      v11 = (const __CFNumber *)CFPreferencesCopyValue(CFSTR("PCDefaultPollInterval"), v10, CFSTR("mobile"), v4);
      if (v11)
      {
        v12 = v11;
        v13 = CFGetTypeID(v11);
        if (v13 == CFNumberGetTypeID())
          CFNumberGetValue(v12, kCFNumberIntType, &valuePtr);
        CFRelease(v10);
        v8 = v12;
      }
      else
      {
        v8 = v10;
      }
      goto LABEL_13;
    }
  }
  else
  {
    valuePtr = 1800;
  }
LABEL_14:
  if (Copy)
    CFRelease(Copy);
  if (valuePtr < 0)
    return 0xFFFFFFFFLL;
  else
    return valuePtr;
}

void loadPCPrefsIfNeeded(char a1, char a2)
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[4];
  char v7;
  char v8;
  char v9;

  PCPrefsQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    block[1] = 3221225472;
    block[2] = __loadPCPrefsIfNeeded_block_invoke;
    block[3] = &__block_descriptor_35_e5_v8__0l;
    v7 = 1;
    v8 = a1;
    v9 = a2;
    v5 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    dispatch_sync(v4, block);
    v4 = v5;
  }

}

id PCPrefsQueue()
{
  if (PCPrefsQueue_onceToken != -1)
    dispatch_once(&PCPrefsQueue_onceToken, &__block_literal_global_35);
  return (id)PCPrefsQueue_prefsQueue;
}

const __CFNumber *_PCSettingsGetStyle(int a1, const __CFString *a2)
{
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  const __CFNumber *Value;
  const __CFNumber *v7;
  CFTypeID v8;
  void *v10;
  void *v11;
  uint64_t valuePtr;

  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PCConnectionStyle _PCSettingsGetStyle(PCConnectionClassType, CFStringRef)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PCSettings.m"), 314, CFSTR("%s requires a non-NULL serviceIdentifier"), "PCConnectionStyle _PCSettingsGetStyle(PCConnectionClassType, CFStringRef)");

  }
  if (registerForPCPrefChanges_onceToken != -1)
    dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
  loadPCPrefsIfNeeded(a1 == 0, a1 == 1);
  v4 = (const __CFDictionary *)copyServiceIdentifierDictionary(a1, a2);
  if (!v4)
    return 0;
  v5 = v4;
  Value = (const __CFNumber *)CFDictionaryGetValue(v4, CFSTR("PCStyle"));
  v7 = Value;
  if (Value)
  {
    v8 = CFGetTypeID(Value);
    if (v8 == CFNumberGetTypeID())
    {
      valuePtr = 0;
      CFNumberGetValue(v7, kCFNumberLongType, &valuePtr);
      v7 = (const __CFNumber *)valuePtr;
    }
    else
    {
      v7 = 0;
    }
  }
  CFRelease(v5);
  return v7;
}

CFPropertyListRef copyServiceIdentifierDictionary(int a1, const __CFString *a2)
{
  CFMutableStringRef MutableCopy;
  const __CFString *Copy;
  const __CFString *v6;
  const __CFString *v7;
  CFPropertyListRef v8;
  CFPropertyListRef v9;
  const __CFString *v10;
  CFTypeID v11;

  if (registerForPCPrefChanges_onceToken != -1)
    dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
  loadPCPrefsIfNeeded(a1 == 0, a1 == 1);
  MutableCopy = CFStringCreateMutableCopy(0, 0, CFSTR("PCServiceIdentifier-"));
  CFStringAppend(MutableCopy, a2);
  if (!a1)
  {
    v6 = CFSTR("com.apple.persistentconnection-nosettings");
    goto LABEL_7;
  }
  Copy = 0;
  if (a1 == 1)
  {
    v6 = CFSTR("com.apple.persistentconnection-mcc");
LABEL_7:
    Copy = CFStringCreateCopy(0, v6);
  }
  v7 = (const __CFString *)*MEMORY[0x1E0C9B230];
  v8 = CFPreferencesCopyValue(MutableCopy, Copy, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  v9 = v8;
  if (a1 == 1 && !v8)
  {
    v10 = CFStringCreateCopy(0, CFSTR("com.apple.persistentconnection"));
    v9 = CFPreferencesCopyValue(MutableCopy, v10, CFSTR("mobile"), v7);
    CFRelease(v10);
  }
  CFRelease(MutableCopy);
  if (v9)
  {
    v11 = CFGetTypeID(v9);
    if (v11 != CFDictionaryGetTypeID())
    {
      CFRelease(v9);
      v9 = 0;
    }
  }
  CFRelease(Copy);
  return v9;
}

void sub_1CBC21B6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

double PCScheduledWakeRTCPrecision()
{
  if (PCScheduledWakeRTCPrecision_onceToken != -1)
    dispatch_once(&PCScheduledWakeRTCPrecision_onceToken, &__block_literal_global_9);
  return *(double *)&PCScheduledWakeRTCPrecision_scheduledWakeRTCPrecision;
}

void sub_1CBC21C2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2277C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC230F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC231AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC23C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CBC23E8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC23EE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC24074(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC24280(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC246D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC24808(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC24940(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC24A78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __registerForPCPrefChanges_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_PCPrefsChangedNotification, CFSTR("PCPreferencesDidChangeNotificationInternal"), 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_1CBC25094(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC25344(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1CBC25464(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC279AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CBC292F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CBC29370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CBC2956C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CBC295D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC29634(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC29698(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2A100(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2A15C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2A2C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CBC2A930(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2B0D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CBC2B140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CBC2B1AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CBC2B270(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2B2CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CBC2B370(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2B484(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1CBC2B5BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2B634(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2B748(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1CBC2B8C4(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1CBC2B93C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2B9AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2BA1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2BA8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2BF98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2C38C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2C4A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2C5B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CBC2C64C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CBC2DB50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2DCAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CBC2DE2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2E2B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2E3FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2E470(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2E6B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC2EB40(_Unwind_Exception *a1, int a2)
{
  id v2;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(a1);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      __49__PCConnectionManager__saveWWANKeepAliveInterval__block_invoke_2_cold_1((uint64_t)v2);
    objc_end_catch();
    JUMPOUT(0x1CBC2EB04);
  }
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 8u);
}

void PCSettingsSetClassPushEnabled(int a1, int a2)
{
  const __CFString *Copy;
  CFPropertyListRef *v5;
  PCDistributedLock *v6;

  if (a1)
  {
    v6 = -[PCDistributedLock initWithName:]([PCDistributedLock alloc], "initWithName:", CFSTR("com.apple.persistentconnection.settings.lock"));
    -[PCDistributedLock lock](v6, "lock");
    if (registerForPCPrefChanges_onceToken != -1)
      dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
    loadPCPrefsIfNeeded(0, a1 == 1);
    if (a1 == 1)
      Copy = CFStringCreateCopy(0, CFSTR("com.apple.persistentconnection-mcc"));
    else
      Copy = 0;
    v5 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
    if (!a2)
      v5 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
    CFPreferencesSetValue(CFSTR("PCEnablePush"), *v5, Copy, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
    synchronizeAndNotify(Copy);
    CFRelease(Copy);
    -[PCDistributedLock unlock](v6, "unlock");

  }
}

void synchronizeAndNotify(const __CFString *a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (a1 && CFStringGetLength(a1) >= 1)
    CFPreferencesAppSynchronize(a1);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("PCPreferencesDidChangeNotificationInternal"), 0, 0, 1u);
}

void PCSettingsSetClassPollInterval(int a1, int a2)
{
  PCDistributedLock *v3;
  const __CFString *Copy;
  CFNumberRef v5;
  int valuePtr;

  valuePtr = a2;
  if (a1)
  {
    v3 = -[PCDistributedLock initWithName:]([PCDistributedLock alloc], "initWithName:", CFSTR("com.apple.persistentconnection.settings.lock"));
    -[PCDistributedLock lock](v3, "lock");
    if (registerForPCPrefChanges_onceToken != -1)
      dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
    loadPCPrefsIfNeeded(0, a1 == 1);
    if (a1 == 1)
      Copy = CFStringCreateCopy(0, CFSTR("com.apple.persistentconnection-mcc"));
    else
      Copy = 0;
    v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFPreferencesSetValue(CFSTR("PCDefaultPollInterval"), v5, Copy, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
    CFRelease(v5);
    synchronizeAndNotify(Copy);
    CFRelease(Copy);
    -[PCDistributedLock unlock](v3, "unlock");

  }
}

void PCSettingsSetStyle(int a1, const __CFString *a2, int a3)
{
  PCDistributedLock *v5;
  CFNumberRef v6;
  int valuePtr;

  valuePtr = a3;
  if (a1)
  {
    v5 = -[PCDistributedLock initWithName:]([PCDistributedLock alloc], "initWithName:", CFSTR("com.apple.persistentconnection.settings.lock"));
    -[PCDistributedLock lock](v5, "lock");
    if (registerForPCPrefChanges_onceToken != -1)
      dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
    loadPCPrefsIfNeeded(0, a1 == 1);
    v6 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    setServiceIdentifierKeyAndValue(a1, a2, CFSTR("PCStyle"), v6);
    CFRelease(v6);
    -[PCDistributedLock unlock](v5, "unlock");

  }
}

void setServiceIdentifierKeyAndValue(int a1, const __CFString *a2, const void *a3, const void *a4)
{
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  __CFDictionary *MutableCopy;
  const __CFString *v11;
  const __CFString *Copy;
  CFMutableStringRef v13;
  const __CFString *v14;
  CFPropertyListRef v15;
  const void *v16;

  if (registerForPCPrefChanges_onceToken != -1)
    dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
  loadPCPrefsIfNeeded(0, a1 == 1);
  v8 = (const __CFDictionary *)copyServiceIdentifierDictionary(a1, a2);
  if (v8)
  {
    v9 = v8;
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v8);
    CFRelease(v9);
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  }
  CFDictionarySetValue(MutableCopy, a3, a4);
  if (registerForPCPrefChanges_onceToken != -1)
    dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
  loadPCPrefsIfNeeded(0, a1 == 1);
  if (!a1)
  {
    v11 = CFSTR("com.apple.persistentconnection-nosettings");
    goto LABEL_12;
  }
  if (a1 == 1)
  {
    v11 = CFSTR("com.apple.persistentconnection-mcc");
LABEL_12:
    Copy = CFStringCreateCopy(0, v11);
    goto LABEL_14;
  }
  Copy = 0;
LABEL_14:
  v13 = CFStringCreateMutableCopy(0, 0, CFSTR("PCServiceIdentifier-"));
  CFStringAppend(v13, a2);
  v14 = (const __CFString *)*MEMORY[0x1E0C9B230];
  v15 = CFPreferencesCopyValue(v13, Copy, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v15)
  {
    v16 = v15;
    if (!CFEqual(v15, MutableCopy))
    {
      CFPreferencesSetValue(v13, MutableCopy, Copy, CFSTR("mobile"), v14);
      synchronizeAndNotify(Copy);
    }
    CFRelease(v16);
  }
  else
  {
    CFPreferencesSetValue(v13, MutableCopy, Copy, CFSTR("mobile"), v14);
    synchronizeAndNotify(Copy);
  }
  CFRelease(Copy);
  CFRelease(v13);
  CFRelease(MutableCopy);
}

void PCSettingsSetDefaultStyle(int a1, const __CFString *a2, int a3)
{
  PCDistributedLock *v5;
  const __CFDictionary *v6;
  CFNumberRef v7;
  CFNumberRef v8;
  int valuePtr;

  valuePtr = a3;
  if (a1)
  {
    v5 = -[PCDistributedLock initWithName:]([PCDistributedLock alloc], "initWithName:", CFSTR("com.apple.persistentconnection.settings.lock"));
    -[PCDistributedLock lock](v5, "lock");
    if (registerForPCPrefChanges_onceToken != -1)
      dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
    loadPCPrefsIfNeeded(0, a1 == 1);
    v6 = (const __CFDictionary *)copyServiceIdentifierDictionary(a1, a2);
    if (v6)
    {
      v7 = v6;
      if (!CFDictionaryContainsKey(v6, CFSTR("PCStyle")))
      {
        v8 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
        setServiceIdentifierKeyAndValue(a1, a2, CFSTR("PCStyle"), v8);
        CFRelease(v8);
      }
    }
    else
    {
      v7 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      setServiceIdentifierKeyAndValue(a1, a2, CFSTR("PCStyle"), v7);
    }
    CFRelease(v7);
    -[PCDistributedLock unlock](v5, "unlock");

  }
}

void PCSettingsPurgeDictionariesExceptForCurrent(int a1, void *a2)
{
  PCDistributedLock *v4;
  const __CFString *Copy;
  CFArrayRef v6;
  CFIndex Length;
  const __CFArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  const __CFString *hostName;
  void *context;
  const __CFString *applicationID;
  PCDistributedLock *v19;
  __CFArray *theArray;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = -[PCDistributedLock initWithName:]([PCDistributedLock alloc], "initWithName:", CFSTR("com.apple.persistentconnection.settings.lock"));
    -[PCDistributedLock lock](v4, "lock");
    if (a1 == 1)
      Copy = CFStringCreateCopy(0, CFSTR("com.apple.persistentconnection-mcc"));
    else
      Copy = 0;
    v19 = v4;
    if (registerForPCPrefChanges_onceToken != -1)
      dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
    loadPCPrefsIfNeeded(0, a1 == 1);
    applicationID = Copy;
    hostName = (const __CFString *)*MEMORY[0x1E0C9B230];
    v6 = CFPreferencesCopyKeyList(Copy, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
    theArray = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    Length = CFStringGetLength(CFSTR("PCServiceIdentifier-"));
    context = (void *)MEMORY[0x1D17A4604]();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v6;
    v9 = -[__CFArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v13, "hasPrefix:", CFSTR("PCServiceIdentifier-")))
          {
            objc_msgSend(v13, "substringFromIndex:", Length);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(a2, "containsObject:", v14);

            if ((v15 & 1) == 0)
              CFArrayAppendValue(theArray, v13);
          }
        }
        v10 = -[__CFArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

    objc_autoreleasePoolPop(context);
    if (CFArrayGetCount(theArray) >= 1)
    {
      CFPreferencesSetMultiple(0, theArray, applicationID, CFSTR("mobile"), hostName);
      CFPreferencesAppSynchronize(applicationID);
    }
    if (v8)
      CFRelease(v8);
    CFRelease(theArray);
    CFRelease(applicationID);
    -[PCDistributedLock unlock](v19, "unlock");

  }
}

uint64_t PCSettingsGetGlobalMCCForceManualWhenRoaming()
{
  const __CFString *Copy;
  const __CFBoolean *v1;
  const __CFBoolean *v2;
  CFTypeID v3;
  uint64_t Value;

  if (registerForPCPrefChanges_onceToken != -1)
    dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
  loadPCPrefsIfNeeded(0, 1);
  Copy = CFStringCreateCopy(0, CFSTR("com.apple.persistentconnection-mcc"));
  v1 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("PCForceManualWhenRoaming"), Copy, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v1)
  {
    v2 = v1;
    v3 = CFGetTypeID(v1);
    if (v3 == CFBooleanGetTypeID())
      Value = CFBooleanGetValue(v2);
    else
      Value = 0;
    CFRelease(v2);
  }
  else
  {
    Value = 0;
  }
  CFRelease(Copy);
  return Value;
}

void PCSettingsSetGlobalMCCForceManualWhenRoaming(int a1)
{
  const __CFString *Copy;
  CFPropertyListRef *v3;
  PCDistributedLock *v4;

  v4 = -[PCDistributedLock initWithName:]([PCDistributedLock alloc], "initWithName:", CFSTR("com.apple.persistentconnection.settings.lock"));
  -[PCDistributedLock lock](v4, "lock");
  if (registerForPCPrefChanges_onceToken != -1)
    dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
  loadPCPrefsIfNeeded(0, 1);
  Copy = CFStringCreateCopy(0, CFSTR("com.apple.persistentconnection-mcc"));
  v3 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  if (!a1)
    v3 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  CFPreferencesSetValue(CFSTR("PCForceManualWhenRoaming"), *v3, Copy, CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  synchronizeAndNotify(Copy);
  CFRelease(Copy);
  -[PCDistributedLock unlock](v4, "unlock");

}

const __CFBoolean *PCSettingsGetForceManualWhenRoamingForMCCAccount(const __CFString *a1)
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  const __CFBoolean *Value;
  const __CFBoolean *v5;
  CFTypeID v6;

  if (registerForPCPrefChanges_onceToken != -1)
    dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
  loadPCPrefsIfNeeded(0, 1);
  v2 = (const __CFDictionary *)copyServiceIdentifierDictionary(1, a1);
  if (!v2)
    return 0;
  v3 = v2;
  Value = (const __CFBoolean *)CFDictionaryGetValue(v2, CFSTR("PCForceManualWhenRoaming"));
  v5 = Value;
  if (Value)
  {
    v6 = CFGetTypeID(Value);
    if (v6 == CFBooleanGetTypeID())
      v5 = (const __CFBoolean *)(CFBooleanGetValue(v5) != 0);
    else
      v5 = 0;
  }
  CFRelease(v3);
  return v5;
}

void PCSettingsSetForceManualWhenRoamingForMCCAccount(const __CFString *a1, int a2)
{
  const void **v4;
  PCDistributedLock *v5;

  v5 = -[PCDistributedLock initWithName:]([PCDistributedLock alloc], "initWithName:", CFSTR("com.apple.persistentconnection.settings.lock"));
  -[PCDistributedLock lock](v5, "lock");
  if (registerForPCPrefChanges_onceToken != -1)
    dispatch_once(&registerForPCPrefChanges_onceToken, &__block_literal_global_2);
  loadPCPrefsIfNeeded(0, 1);
  v4 = (const void **)MEMORY[0x1E0C9AE50];
  if (!a2)
    v4 = (const void **)MEMORY[0x1E0C9AE40];
  setServiceIdentifierKeyAndValue(1, a1, CFSTR("PCForceManualWhenRoaming"), *v4);
  -[PCDistributedLock unlock](v5, "unlock");

}

void _PCPrefsChangedNotification()
{
  NSObject *v0;
  __CFNotificationCenter *DarwinNotifyCenter;

  PCPrefsQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v0, &__block_literal_global_34);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("PCPreferencesDidChangeNotification"), 0, 0, 1u);
}

void __setPCPrefsNeedLoad_block_invoke()
{
  PCPrefsNeedLoading = 1;
  PCPrefsNeedLoadingConnectionClassNoSettings = 1;
  PCPrefsNeedLoadingConnectionClassMailContactsCalendars = 1;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x12u);
}

id PCSharedSerialQueue()
{
  if (PCSharedSerialQueue_onceToken != -1)
    dispatch_once(&PCSharedSerialQueue_onceToken, &__block_literal_global_4);
  return (id)PCSharedSerialQueue_sQueue;
}

NSObject *PCCreateQueue(const char *a1)
{
  NSObject *v1;
  NSObject *v2;

  v1 = dispatch_queue_create(a1, 0);
  PCSharedSerialQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v1, v2);

  return v1;
}

void *PCWeakLinkSymbol(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  const char *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a2;
  v4 = _PCDLHandleForLibrary_onceToken;
  v5 = a1;
  if (v4 != -1)
    dispatch_once(&_PCDLHandleForLibrary_onceToken, &__block_literal_global_6);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v6 = _PCDLHandleForLibrary_queue;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = ___PCDLHandleForLibrary_block_invoke_2;
  v16 = &unk_1E87435D0;
  v17 = v3;
  v18 = &v19;
  v7 = v3;
  dispatch_sync(v6, &v13);
  v8 = (void *)v20[3];

  _Block_object_dispose(&v19, 8);
  v9 = objc_retainAutorelease(v5);
  v10 = (const char *)objc_msgSend(v9, "UTF8String", v13, v14, v15, v16);

  v11 = dlsym(v8, v10);
  return v11;
}

void sub_1CBC31994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _dynamicStoreCallback(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1D17A4604]();
  v6 = a2;
  objc_msgSend(a3, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_dynamicStoreCallbackForKeys:", v6);

  objc_autoreleasePoolPop(v5);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
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

void __ServerConnectionCallback(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  void *v7;
  void *v8;

  v7 = (void *)MEMORY[0x1D17A4604]();
  objc_msgSend(a4, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x1E0CA7148]))
    objc_msgSend(v8, "_processCallStatusChanged:", a3);

  objc_autoreleasePoolPop(v7);
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

void sub_1CBC34AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1CBC35A18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC35A84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC35C3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC35E28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC36010(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC361F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC366C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC36850(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC3698C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC36A0C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC36B80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC37614(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CBC3769C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CBC376F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1CBC3774C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void _powerChangedHandler(uint64_t a1, uint64_t a2, int a3, intptr_t a4)
{
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[8];
  _QWORD block[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  v20 = 0;
  _GetPowerMonitoringQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___powerChangedHandler_block_invoke;
  block[3] = &unk_1E8743900;
  block[4] = &v15;
  dispatch_sync(v6, block);

  HIDWORD(v7) = a3;
  LODWORD(v7) = a3 + 536870288;
  switch((v7 >> 4))
  {
    case 0u:
      +[PCLog timer](PCLog, "timer");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1CBC1B000, v10, OS_LOG_TYPE_DEFAULT, "System can sleep query received: kIOMessageCanSystemSleep", v13, 2u);
      }

      goto LABEL_18;
    case 1u:
      +[PCLog timer](PCLog, "timer");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1CBC1B000, v12, OS_LOG_TYPE_DEFAULT, "System will sleep: kIOMessageSystemWillSleep", v13, 2u);
      }

      _CallTimersWithSelector((void *)v16[5], (uint64_t)sel__powerNotificationSleepIsImminent);
LABEL_18:
      IOAllowPowerChange(sPMConnection, a4);
      goto LABEL_19;
    case 2u:
    case 9u:
      if (a3 == -536870256)
      {
        +[PCLog timer](PCLog, "timer");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        *(_WORD *)v13 = 0;
        v9 = "System will not sleep: kIOMessageSystemWillNotSleep";
      }
      else
      {
        +[PCLog timer](PCLog, "timer");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        *(_WORD *)v13 = 0;
        v9 = "System woke: kIOMessageSystemHasPoweredOn";
      }
      _os_log_impl(&dword_1CBC1B000, v8, OS_LOG_TYPE_DEFAULT, v9, v13, 2u);
LABEL_14:

      _CallTimersWithSelector((void *)v16[5], (uint64_t)sel__powerNotificationSleepIsNotImminent);
LABEL_19:
      _Block_object_dispose(&v15, 8);

      return;
    case 0xBu:
      +[PCLog timer](PCLog, "timer");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1CBC1B000, v11, OS_LOG_TYPE_DEFAULT, "System is waking: kIOMessageSystemWillPowerOn", v13, 2u);
      }

      goto LABEL_19;
    default:
      goto LABEL_19;
  }
}

void sub_1CBC37C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void ___powerChangedHandler_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend((id)sPowerMonitoringTimers, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void _CallTimersWithSelector(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1D17A4604]();
        objc_msgSend(v8, "_getTimerRunLoop");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_getTimerMode");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v10)
          v13 = v11 == 0;
        else
          v13 = 1;
        if (v13)
        {
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = ___CallTimersWithSelector_block_invoke;
          v15[3] = &unk_1E8743700;
          v15[4] = v8;
          v15[5] = a2;
          objc_msgSend(v8, "_performBlockOnQueue:", v15);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "performSelector:target:argument:order:modes:", a2, v8, 0, 0, v14);

          CFRunLoopWakeUp((CFRunLoopRef)objc_msgSend(v10, "getCFRunLoop"));
        }

        objc_autoreleasePoolPop(v9);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
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

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x1E0C98A50](applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A88](keysToSet, keysToRemove, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1E0C98DA8](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DE0](theSet, value);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

uint64_t CTCallGetCallSubType()
{
  return MEMORY[0x1E0CA6BC8]();
}

uint64_t CUTWeakLinkClass()
{
  return MEMORY[0x1E0D131E0]();
}

uint64_t CUTWeakLinkSymbol()
{
  return MEMORY[0x1E0D131E8]();
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

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB700](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB708](AssertionType, *(_QWORD *)&AssertionLevel, AssertionName, AssertionID);
}

uint64_t IOPMAssertionDeclareSystemActivity()
{
  return MEMORY[0x1E0CBB720]();
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1E0CBB738](*(_QWORD *)&AssertionID);
}

IOReturn IOPMCancelScheduledPowerEvent(CFDateRef time_to_wake, CFStringRef my_id, CFStringRef type)
{
  return MEMORY[0x1E0CBB750](time_to_wake, my_id, type);
}

CFArrayRef IOPMCopyScheduledPowerEvents(void)
{
  return (CFArrayRef)MEMORY[0x1E0CBB7A8]();
}

uint64_t IOPMRequestSysWake()
{
  return MEMORY[0x1E0CBB7E0]();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1E0CBB8D8](refcon, thePortRef, callback, notifier);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1E0CE8768](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1E0CE8770](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1E0CE87A8](allocator, domain, ifname, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x1E0CE87C8](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1E0CE87D8](store, keys, patterns);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x1E0CE89D0](allocator, name, prefsID, authorization);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1E0CE89E0](prefs, key);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x1E0CA6F18]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x1E0CA6F30]();
}

uint64_t _CTServerConnectionGetCDRXWithLTEState()
{
  return MEMORY[0x1E0CA6F70]();
}

uint64_t _CTServerConnectionHandleReply()
{
  return MEMORY[0x1E0CA6FE0]();
}

uint64_t _CTServerConnectionRegisterForNotification()
{
  return MEMORY[0x1E0CA7030]();
}

uint64_t _CTServerConnectionSetTargetQueue()
{
  return MEMORY[0x1E0CA7078]();
}

uint64_t _CTServerConnectionUnregisterForNotification()
{
  return MEMORY[0x1E0CA7098]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

uint64_t nw_interface_copy_delegate_interface()
{
  return MEMORY[0x1E0CCF6E8]();
}

uint32_t nw_interface_get_index(nw_interface_t interface)
{
  return MEMORY[0x1E0CCF700](interface);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x1E0CCF710](interface);
}

uint64_t nw_interface_shallow_compare()
{
  return MEMORY[0x1E0CCF738]();
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF930]();
}

uint64_t nw_parameters_set_allow_ultra_constrained()
{
  return MEMORY[0x1E0CCFA60]();
}

uint64_t nw_parameters_set_prohibited_interface_subtypes()
{
  return MEMORY[0x1E0CCFBB8]();
}

uint64_t nw_parameters_set_prohibited_interface_types()
{
  return MEMORY[0x1E0CCFBC0]();
}

void nw_parameters_set_required_interface_type(nw_parameters_t parameters, nw_interface_type_t interface_type)
{
  MEMORY[0x1E0CCFBF8](parameters, *(_QWORD *)&interface_type);
}

uint64_t nw_path_copy_interface()
{
  return MEMORY[0x1E0CCFCD0]();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x1E0CCFD10]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x1E0CCFD20]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x1E0CCFD38]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x1E0CCFD58]();
}

uint64_t nw_path_get_reason_description()
{
  return MEMORY[0x1E0CCFDD8]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x1E0CCFDE0](path);
}

uint64_t nw_path_is_ultra_constrained()
{
  return MEMORY[0x1E0CCFE40]();
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
  MEMORY[0x1E0C85ED8](xarray, index, value);
}

