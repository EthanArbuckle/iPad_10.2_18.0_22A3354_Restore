void STKAlertSessionManagerStart()
{
  if (STKAlertSessionManagerStartInternal___once != -1)
    dispatch_once(&STKAlertSessionManagerStartInternal___once, &__block_literal_global);
}

uint64_t STKAlertSessionManagerSetDeviceLanguage(uint64_t a1)
{
  uint64_t result;

  if (STKAlertSessionManagerStartInternal___once != -1)
    dispatch_once(&STKAlertSessionManagerStartInternal___once, &__block_literal_global);
  NSLog(CFSTR("STK lock screen notification language is set to '%@'"), a1);
  if (__stkSessionManager)
    objc_msgSend((id)__stkSessionManager, "setDeviceLanguage:", a1);
  if (__class0SessionManager)
    objc_msgSend((id)__class0SessionManager, "setDeviceLanguage:", a1);
  result = __ussdSessionManager;
  if (__ussdSessionManager)
    return objc_msgSend((id)__ussdSessionManager, "setDeviceLanguage:", a1);
  return result;
}

void sub_21643BD1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _queue_USSDHandler(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  _QWORD *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _STKUSSDResponseProvider *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _STKUSSDResponseProvider *v16;
  void *v17;
  void *v18;
  void *v19;

  if (!a2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _queue_USSDHandler(CTServerConnectionRef, CFStringRef, CFDictionaryRef, void *)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("STKUSSDAlertSessionManager.m"), 400, CFSTR("Received CT notification without name"));

  }
  v7 = a4;
  BSDispatchQueueAssert();
  objc_msgSend(v7, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    _queue_USSDHandler_cold_1((uint64_t)a2, a3, v8);

  v9 = (void *)MEMORY[0x24BDBD1B8];
  if (a3)
    v9 = (void *)a3;
  v10 = v9;
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC30E8]))
  {
    v11 = 1;
  }
  else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC3128]))
  {
    v11 = 2;
  }
  else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC30F0]))
  {
    v11 = 3;
  }
  else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC3100]))
  {
    v11 = 4;
  }
  else
  {
    if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC3130]))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v16 = (_STKUSSDResponseProvider *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _queue_USSDHandler(CTServerConnectionRef, CFStringRef, CFDictionaryRef, void *)");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[_STKUSSDResponseProvider handleFailureInFunction:file:lineNumber:description:](v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("STKUSSDAlertSessionManager.m"), 417, CFSTR("Unhandled CT notification: %@"), a2);

      goto LABEL_18;
    }
    v11 = 5;
  }
  v12 = [_STKUSSDResponseProvider alloc];
  v13 = v7[4];
  v14 = v7[6];
  objc_msgSend(v7, "log");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_STKUSSDResponseProvider initWithQueue:telephonyClient:options:logger:](v12, "initWithQueue:telephonyClient:options:logger:", v13, v14, v10, v15);

  objc_msgSend(v7, "_queue_handleUSSDEvent:responder:userInfo:", v11, v16, v10);
LABEL_18:

}

void sub_21643F568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_216441248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_216443844(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
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

void _queue_SIMToolkitHandler(uint64_t a1, const void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _STKSIMToolkitResponseProvider *v15;
  id v16;
  id v17;
  void *v18;
  _STKSIMToolkitResponseProvider *v19;
  id *v20;

  if (!a2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _queue_SIMToolkitHandler(CTServerConnectionRef, CFStringRef, CFDictionaryRef, void *)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("STKSIMToolkitAlertSessionManager.m"), 760, CFSTR("Received CT notification without name"));

  }
  v20 = a4;
  BSDispatchQueueAssert();
  v7 = (void *)MEMORY[0x24BDBD1B8];
  if (a3)
    v7 = a3;
  v8 = v7;
  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC2ED8]))
  {
    v9 = 1;
  }
  else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC2EE0]))
  {
    v9 = 2;
  }
  else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC2EF0]))
  {
    v9 = 3;
  }
  else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC2ED0]))
  {
    v9 = 4;
  }
  else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC2D70]))
  {
    v9 = 5;
  }
  else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC2DC0]))
  {
    v9 = 6;
  }
  else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC2E98]))
  {
    v9 = 7;
  }
  else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC2D68]))
  {
    v9 = 8;
  }
  else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC2D40]))
  {
    v9 = 9;
  }
  else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC2DE8]))
  {
    v9 = 10;
  }
  else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC2DF8]))
  {
    v9 = 11;
  }
  else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC2DF0]))
  {
    v9 = 12;
  }
  else if (CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC2F08]))
  {
    v9 = 13;
  }
  else
  {
    if (!CFEqual(a2, (CFTypeRef)*MEMORY[0x24BDC2EC8]))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void _queue_SIMToolkitHandler(CTServerConnectionRef, CFStringRef, CFDictionaryRef, void *)");
      v19 = (_STKSIMToolkitResponseProvider *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("STKSIMToolkitAlertSessionManager.m"), 775, CFSTR("Unhandled CT notification: %@"), a2);
      goto LABEL_34;
    }
    v9 = 14;
  }
  objc_msgSend(v8, "valueForKey:", *MEMORY[0x24BDC2F10]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (int)objc_msgSend(v12, "intValue");

  objc_msgSend(v20[18], "subscriptionContextForSlot:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [_STKSIMToolkitResponseProvider alloc];
  v16 = v20[4];
  v17 = v20[5];
  objc_msgSend(v20, "log");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[_STKSIMToolkitResponseProvider initWithQueue:telephonyClient:context:options:logger:](v15, "initWithQueue:telephonyClient:context:options:logger:", v16, v17, v14, v8, v18);

  objc_msgSend(v20, "_queue_handleSIMToolkitEvent:responder:userInfo:", v9, v19, v8);
LABEL_34:

}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void sub_216444CA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_1_2(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t STKUSSDHostCommunicationInterface()
{
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E41768);
}

id STKUSSDSessionCommunicationInterface()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E42C78);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BDBCF20];
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, v3, v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_sessionDidReceiveSupplementaryServicesEvent_, 0, 0);

  return v0;
}

const __CFString *NSStringFromSTKSIMToolkitEvent(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xD)
    return CFSTR("unknown");
  else
    return off_24D563620[a1 - 1];
}

const __CFString *NSStringFromSTKSessionResponseType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
    return CFSTR("Success");
  else
    return off_24D563690[a1 - 1];
}

void sub_216446B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void _STKWithLock(os_unfair_lock_s *a1, void *a2)
{
  os_unfair_lock_s *v3;
  void (**v4)(_QWORD);
  os_unfair_lock_s *v5;

  v3 = a1 + 2;
  v4 = a2;
  v5 = a1;
  os_unfair_lock_lock(v3);
  v4[2](v4);

  os_unfair_lock_unlock(v3);
}

void sub_216446EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_216447B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2164488B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_216448F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_216448F78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_216449170(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_216449520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_216449668(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id STKCommonLog()
{
  if (STKCommonLog_onceToken != -1)
    dispatch_once(&STKCommonLog_onceToken, &__block_literal_global_5);
  return (id)STKCommonLog___log;
}

id STKSIMToolkitLog()
{
  if (STKSIMToolkitLog_onceToken != -1)
    dispatch_once(&STKSIMToolkitLog_onceToken, &__block_literal_global_3);
  return (id)STKSIMToolkitLog___log;
}

id STKUSSDLog()
{
  if (STKUSSDLog_onceToken != -1)
    dispatch_once(&STKUSSDLog_onceToken, &__block_literal_global_6);
  return (id)STKUSSDLog___log;
}

id STKClass0SMSLog()
{
  if (STKClass0SMSLog_onceToken != -1)
    dispatch_once(&STKClass0SMSLog_onceToken, &__block_literal_global_8);
  return (id)STKClass0SMSLog___log;
}

void _queue_USSDHandler_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  int v7;
  __CFString *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isInternalInstall");
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %@"), a2);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_24D563A28;
  }
  *(_DWORD *)buf = 138412546;
  v10 = a1;
  v11 = 2112;
  v12 = v8;
  _os_log_debug_impl(&dword_216439000, a3, OS_LOG_TYPE_DEBUG, "Received CT USSD notification: %@%@", buf, 0x16u);
  if (v7)

}

void AudioServicesPlaySystemSound(SystemSoundID inSystemSoundID)
{
  MEMORY[0x24BDB6980](*(_QWORD *)&inSystemSoundID);
}

uint64_t AudioServicesStartSystemSound()
{
  return MEMORY[0x24BDB69A8]();
}

uint64_t AudioServicesStopSystemSound()
{
  return MEMORY[0x24BDB69B0]();
}

uint64_t BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BAE8]();
}

uint64_t BSDeserializeStringFromXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BB28]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x24BE0BB38]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x24BE0BB78]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x24BE0BBA0]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x24BE0BBB0]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x24BE0BC08]();
}

uint64_t BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BCD8]();
}

uint64_t BSSerializeStringToXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BD18]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x24BDBBA30](bundle);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x24BDBBA60](locArray, prefArray);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x24BDBBA70]();
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x24BDBBAA8](bundleID);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF28]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x24BDBBF98](locale, key);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t CTCopyCurrentCalls()
{
  return MEMORY[0x24BDC25C0]();
}

uint64_t CTSubscriptionSlotAsString()
{
  return MEMORY[0x24BDC26D0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67160]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t SBSSetIdleText()
{
  return MEMORY[0x24BEB0D30]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x24BDC2878]();
}

uint64_t _CTServerConnectionRegisterForNotification()
{
  return MEMORY[0x24BDC2928]();
}

uint64_t _CTServerConnectionSetTargetQueue()
{
  return MEMORY[0x24BDC2978]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
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

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x24BDB0930](xdict, key);
  return result;
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x24BDB0998](xdict, key, value);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

