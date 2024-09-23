void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id OUTLINED_FUNCTION_0_2(id a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1DB4B9A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1DB4B9C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t TPSLog()
{
  if (TPSLog_onceToken != -1)
    dispatch_once(&TPSLog_onceToken, &__block_literal_global_1);
  return TPSLog_sLog;
}

__CFString *TPSLocalizedPhoneNumberString(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  const void *v6;
  __CFString *String;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = CFPhoneNumberCreate();
  if (!v5 || (v6 = (const void *)v5, String = (__CFString *)CFPhoneNumberCreateString(), CFRelease(v6), !String))
    String = &stru_1EA2CE0A0;
  TPSLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412802;
    v11 = v3;
    v12 = 2112;
    v13 = String;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1DB4B7000, v8, OS_LOG_TYPE_DEFAULT, "Localized '%@' to '%@' using ISO country code '%@'.", (uint8_t *)&v10, 0x20u);
  }

  return String;
}

__CFString *TPSNormalizedPhoneNumberString(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  const void *v6;
  __CFString *String;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = CFPhoneNumberCreate();
  if (!v5 || (v6 = (const void *)v5, String = (__CFString *)CFPhoneNumberCreateString(), CFRelease(v6), !String))
    String = &stru_1EA2CE0A0;
  TPSLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412802;
    v11 = v3;
    v12 = 2112;
    v13 = String;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1DB4B7000, v8, OS_LOG_TYPE_DEFAULT, "Normalized '%@' to '%@' using ISO country code '%@'.", (uint8_t *)&v10, 0x20u);
  }

  return String;
}

uint64_t CTCallingLineIdRestrictionValueForState(uint64_t a1)
{
  unsigned int v1;

  if (a1 == 2)
    v1 = 1;
  else
    v1 = 3;
  if (a1 == 1)
    return 0;
  else
    return v1;
}

uint64_t TPSCallingLineIdRestrictionStateForValue(int a1)
{
  if (a1)
    return 2 * (a1 == 1);
  else
    return 1;
}

JSValueRef provisioningDone(JSContextRef ctx, int a2, JSValueRef value)
{
  OpaqueJSClass *v5;
  void *v6;
  void *v7;
  JSValueRef Undefined;

  if (!value)
    return JSValueMakeUndefined(ctx);
  v5 = (OpaqueJSClass *)CloudCallingWebViewController_controllerClass;
  if (!CloudCallingWebViewController_controllerClass)
  {
    v5 = JSClassCreate(&CloudCallingWebViewController_classDefinition);
    CloudCallingWebViewController_controllerClass = (uint64_t)v5;
  }
  if (!JSValueIsObjectOfClass(ctx, value, v5))
    return JSValueMakeUndefined(ctx);
  JSObjectGetPrivate(value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WebThreadMakeNSInvocation();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WebThreadCallDelegate();

  Undefined = JSValueMakeUndefined(ctx);
  return Undefined;
}

JSValueRef provisioningCanceled(JSContextRef ctx, int a2, JSValueRef value)
{
  OpaqueJSClass *v5;
  void *v6;
  void *v7;
  JSValueRef Undefined;

  if (!value)
    return JSValueMakeUndefined(ctx);
  v5 = (OpaqueJSClass *)CloudCallingWebViewController_controllerClass;
  if (!CloudCallingWebViewController_controllerClass)
  {
    v5 = JSClassCreate(&CloudCallingWebViewController_classDefinition);
    CloudCallingWebViewController_controllerClass = (uint64_t)v5;
  }
  if (!JSValueIsObjectOfClass(ctx, value, v5))
    return JSValueMakeUndefined(ctx);
  JSObjectGetPrivate(value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WebThreadMakeNSInvocation();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WebThreadCallDelegate();

  Undefined = JSValueMakeUndefined(ctx);
  return Undefined;
}

void sub_1DB4C5934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB4C5A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getOBPrivacyLinkControllerClass_block_invoke(uint64_t a1)
{
  OnBoardingKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("OBPrivacyLinkController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getOBPrivacyLinkControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getOBPrivacyLinkControllerClass_block_invoke_cold_1();
    OnBoardingKitLibrary();
  }
}

void OnBoardingKitLibrary()
{
  void *v0;

  if (!OnBoardingKitLibraryCore_frameworkLibrary)
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

TPSSetCallWaitingRequest *__getOBPrivacyPresenterClass_block_invoke(uint64_t a1)
{
  TPSSetCallWaitingRequest *result;
  TPSSetCallWaitingRequest *v3;
  SEL v4;
  id v5;

  OnBoardingKitLibrary();
  result = (TPSSetCallWaitingRequest *)objc_getClass("OBPrivacyPresenter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getOBPrivacyPresenterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (TPSSetCallWaitingRequest *)__getOBPrivacyPresenterClass_block_invoke_cold_1();
    return -[TPSSetCallWaitingRequest initWithSubscriptionContext:](v3, v4, v5);
  }
  return result;
}

void sub_1DB4C7DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB4C810C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB4C849C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_1DB4C89B8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

__CFString *TPSStringForCTSuppServicesEventType(unsigned int a1)
{
  if (a1 > 6)
    return 0;
  else
    return off_1EA2CDB50[a1];
}

__CFString *TPSStringForCTSuppServicesSettingsType(unsigned int a1)
{
  if (a1 > 0xB)
    return 0;
  else
    return off_1EA2CDB88[a1];
}

__CFString *TPSStringForCTCallForwardingReason(unsigned int a1)
{
  if (a1 > 5)
    return 0;
  else
    return off_1EA2CDBE8[a1];
}

__CFString *TPSStringForCTCallingLineIdRestrictionValue(unsigned int a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_1EA2CDC18[a1];
}

uint64_t TPSCallForwardingLog()
{
  if (TPSCallForwardingLog_onceToken != -1)
    dispatch_once(&TPSCallForwardingLog_onceToken, &__block_literal_global_3);
  return TPSCallForwardingLog_sLog;
}

void sub_1DB4CC070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB4CC1B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1DB4CC5CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB4CC9CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB4CCEF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPSSimStatusCacheClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SettingsCellularLibraryCore_frameworkLibrary)
  {
    SettingsCellularLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SettingsCellularLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PSSimStatusCache");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPSSimStatusCacheClass_block_invoke_cold_1();
    free(v3);
  }
  getPSSimStatusCacheClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DB4CDB70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1DB4CE930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB4CEC34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1DB4CF16C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB4CF4E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DB4D3C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

uint64_t __getOBPrivacyLinkControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getOBPrivacyPresenterClass_block_invoke_cold_1(v0);
}

uint64_t __getOBPrivacyPresenterClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __53__TPSSubscriberTelephonyController_changePIN_newPin___block_invoke_cold_1(v0);
}

uint64_t __getPSSimStatusCacheClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[TPSCellularNetworkController networkItemAtIndex:].cold.1(v0);
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x1E0D17838]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x1E0D17848]();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return MEMORY[0x1E0CFA330]();
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1E0CA7A70](descriptor, matrix, size);
}

uint64_t CTFontDescriptorCreateForUIType()
{
  return MEMORY[0x1E0CA7AD8]();
}

uint64_t CTFontRemoveFromCaches()
{
  return MEMORY[0x1E0CA7D58]();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1E0CA7E88](attrString);
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0CA7EC0](line, options);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

JSClassRef JSClassCreate(const JSClassDefinition *definition)
{
  return (JSClassRef)MEMORY[0x1E0CBDDD0](definition);
}

void *__cdecl JSObjectGetPrivate(JSObjectRef object)
{
  return (void *)MEMORY[0x1E0CBDE58](object);
}

JSObjectRef JSObjectMake(JSContextRef ctx, JSClassRef jsClass, void *data)
{
  return (JSObjectRef)MEMORY[0x1E0CBDEB0](ctx, jsClass, data);
}

void JSObjectSetProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef value, JSPropertyAttributes attributes, JSValueRef *exception)
{
  MEMORY[0x1E0CBDF10](ctx, object, propertyName, value, *(_QWORD *)&attributes, exception);
}

JSStringRef JSStringCreateWithCFString(CFStringRef string)
{
  return (JSStringRef)MEMORY[0x1E0CBDFA8](string);
}

BOOL JSValueIsObjectOfClass(JSContextRef ctx, JSValueRef value, JSClassRef jsClass)
{
  return MEMORY[0x1E0CBE040](ctx, value, jsClass);
}

JSValueRef JSValueMakeUndefined(JSContextRef ctx)
{
  return (JSValueRef)MEMORY[0x1E0CBE080](ctx);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t TUStringKeyForNetwork()
{
  return MEMORY[0x1E0DBD6D8]();
}

uint64_t UIPhoneNumberSuggestionForString()
{
  return MEMORY[0x1E0CEBA18]();
}

uint64_t WebThreadCallDelegate()
{
  return MEMORY[0x1E0DD9838]();
}

uint64_t WebThreadMakeNSInvocation()
{
  return MEMORY[0x1E0DD9870]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t uset_close()
{
  return MEMORY[0x1E0DE6988]();
}

uint64_t uset_containsAllCodePoints()
{
  return MEMORY[0x1E0DE69A0]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x1E0DE69E0]();
}

