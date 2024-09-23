uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E326490]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id PSUILogForCategory(unint64_t a1)
{
  if (a1 >= 4)
    PSUILogForCategory_cold_1();
  if (PSUILogForCategory_loggingToken != -1)
    dispatch_once(&PSUILogForCategory_loggingToken, &__block_literal_global_7);
  return (id)PSUILogForCategory_logObjects[a1];
}

Class __getPKPaymentWebServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  PassKitCoreLibrary();
  result = objc_getClass("PKPaymentWebService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPKPaymentWebServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getPKPaymentWebServiceClass_block_invoke_cold_1();
    return (Class)__getPKPaymentRegistrationUtilitiesClass_block_invoke(v3);
  }
  return result;
}

void __getPKPaymentRegistrationUtilitiesClass_block_invoke(uint64_t a1)
{
  PassKitCoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PKPaymentRegistrationUtilities");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPKPaymentRegistrationUtilitiesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPKPaymentRegistrationUtilitiesClass_block_invoke_cold_1();
    PassKitCoreLibrary();
  }
}

void PassKitCoreLibrary()
{
  void *v0;

  if (!PassKitCoreLibraryCore_frameworkLibrary)
    PassKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!PassKitCoreLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void sub_22E0CC838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22E0CCBB8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22E0CCF10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E0CD8D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E0CDAA4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22E0CE020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E0CF0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_22E0CFC84(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

Class __getBFFStyleClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SetupAssistantUILibraryCore_frameworkLibrary)
  {
    SetupAssistantUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SetupAssistantUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("BFFStyle");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getBFFStyleClass_block_invoke_cold_1();
    free(v3);
  }
  getBFFStyleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getPKWalletVisibilityClass_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  PassKitCoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PKWalletVisibility");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPKWalletVisibilityClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v10 = (void *)__getPKWalletVisibilityClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id PSUI_LocalizedStringForPearlPeriocular(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSPreferencesFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Pearl-Periocular"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSUI_LocalizedStringForPasscodePeriocular(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSUI_BundleForPreferencesUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Passcode-Periocular"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSUI_BundleForPreferencesUIFramework()
{
  if (PSUI_BundleForPreferencesUIFramework_onceToken != -1)
    dispatch_once(&PSUI_BundleForPreferencesUIFramework_onceToken, &__block_literal_global_0);
  return (id)PSUI_BundleForPreferencesUIFramework__preferencesUIFrameworkBundle;
}

id PSUI_LocalizedStringForPasscodeLock(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSUI_BundleForPreferencesUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Passcode Lock"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSUI_LocalizedStringForTouchID(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSUI_BundleForPreferencesUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("TouchID_Strings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSUI_LocalizedStringForPasscodeDimpleKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  PSUI_BundleForPreferencesUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("PasscodeLock-DimpleKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PSUI_RebrandedKeyForAppleID(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if ((objc_msgSend(v1, "containsString:", CFSTR("REBRAND")) & 1) != 0 || (_os_feature_enabled_impl() & 1) == 0)
  {
    v2 = v1;
  }
  else
  {
    objc_msgSend(v1, "stringByAppendingString:", CFSTR("_REBRAND"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  return v3;
}

void sub_22E0D0E3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E0D15E4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_22E0D183C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22E0D1B64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_22E0D29CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22E0D306C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getEREyeReliefClientClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!EyeReliefLibraryCore_frameworkLibrary)
  {
    EyeReliefLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!EyeReliefLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("EREyeReliefClient");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getEREyeReliefClientClass_block_invoke_cold_1();
    free(v3);
  }
  getEREyeReliefClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
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

void __credentialSetWithPasscodeCredential_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a2, a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = aks_verify_password(0, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"), objc_msgSend(*(id *)(a1 + 32), "length"), a2, a3);
  if ((_DWORD)v9)
  {
    v10 = v9;
    PSUILogForCategory(1uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __credentialSetWithPasscodeCredential_block_invoke_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);

  }
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_22E0D43AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E0D47B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E0D4944(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22E0D53B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E0D61C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E0D67C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E0D7220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22E0D8E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E0D90F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getLAContextClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!LocalAuthenticationLibraryCore_frameworkLibrary)
  {
    LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("LAContext");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getLAContextClass_block_invoke_cold_1();
    free(v3);
  }
  getLAContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_22E0D9E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E0DA4B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_22E0DA928(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_22E0DB7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22E0DBB00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E0DCC74(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22E0DD780(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

void sub_22E0DDE20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getLAContextClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!LocalAuthenticationLibraryCore_frameworkLibrary_0)
  {
    LocalAuthenticationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!LocalAuthenticationLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("LAContext");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getLAContextClass_block_invoke_cold_1();
    free(v3);
  }
  getLAContextClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBYFlowSkipControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  SetupAssistantLibrary();
  result = objc_getClass("BYFlowSkipController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBYFlowSkipControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getBYFlowSkipControllerClass_block_invoke_cold_1();
    return (Class)SetupAssistantLibrary();
  }
  return result;
}

uint64_t SetupAssistantLibrary()
{
  uint64_t v0;
  void *v2;

  if (!SetupAssistantLibraryCore_frameworkLibrary)
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = SetupAssistantLibraryCore_frameworkLibrary;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_22E0DEA70(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_22E0DEDAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E0DFB94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E0DFED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E0E0258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Block_object_dispose(&a21, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E0E07E4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void sub_22E0E0DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  id *v13;
  id *v14;
  id *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v17 - 112));
  _Unwind_Resume(a1);
}

void sub_22E0E0E24()
{
  JUMPOUT(0x22E0E0E0CLL);
}

uint64_t apple_numbers_changed_notification(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateGracePeriodSpecifier");
}

void dtoStatusChangedNotification(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  PSUILogForCategory(1uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22E0C8000, v3, OS_LOG_TYPE_DEFAULT, "DTO: Received notification: Changed arm/overall state", v5, 2u);
  }

  if (a2)
  {
    objc_msgSend(a2, "handleDTOStatusChanged");
  }
  else
  {
    PSUILogForCategory(1uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      dtoStatusChangedNotification_cold_1();

  }
}

void sub_22E0E2FA0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id getAFPreferencesClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAFPreferencesClass_softClass;
  v7 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAFPreferencesClass_block_invoke;
    v3[3] = &unk_24F9E3C20;
    v3[4] = &v4;
    __getAFPreferencesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22E0E3440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getLockdownModeManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getLockdownModeManagerClass_softClass;
  v7 = getLockdownModeManagerClass_softClass;
  if (!getLockdownModeManagerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getLockdownModeManagerClass_block_invoke;
    v3[3] = &unk_24F9E3C20;
    v3[4] = &v4;
    __getLockdownModeManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22E0E5A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22E0E5EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  uint64_t v9;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v9 - 112));
  _Unwind_Resume(a1);
}

void sub_22E0E7B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getHMHomeManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!HomeKitLibraryCore_frameworkLibrary)
  {
    HomeKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!HomeKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("HMHomeManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getHMHomeManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getHMHomeManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getAKAppleIDAuthenticationInAppContextClass_block_invoke(uint64_t a1)
{
  AuthKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AKAppleIDAuthenticationInAppContext");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAKAppleIDAuthenticationInAppContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1();
    AuthKitLibrary();
  }
}

void AuthKitLibrary()
{
  void *v0;

  if (!AuthKitLibraryCore_frameworkLibrary)
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getAKAppleIDAuthenticationControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AuthKitLibrary();
  result = objc_getClass("AKAppleIDAuthenticationController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAKAppleIDAuthenticationControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1();
    return (Class)__getAFPreferencesClass_block_invoke(v3);
  }
  return result;
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AssistantServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AFPreferences");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAFPreferencesClass_block_invoke_cold_1();
    free(v3);
  }
  getAFPreferencesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getLockdownModeManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!LockdownModeLibraryCore_frameworkLibrary)
  {
    LockdownModeLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!LockdownModeLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("LockdownModeManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getLockdownModeManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getLockdownModeManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_22E0E975C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_22E0EAAA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E0EB05C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_22E0EBC14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E0EC224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E0EC540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22E0ECFD8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_22E0ED090(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_22E0ED2F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getNRPairedDeviceRegistryClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!NanoRegistryLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getNRPairedDeviceRegistryClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("NRPairedDeviceRegistry");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getNRPairedDeviceRegistryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSFUnlockManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!SharingLibraryCore_frameworkLibrary)
  {
    SharingLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SharingLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getSFUnlockManagerClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("SFUnlockManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getSFUnlockManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getIDSDefaultPairedDeviceSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (IDSLibraryCore_frameworkLibrary)
  {
    v2 = (void *)IDSLibraryCore_frameworkLibrary;
  }
  else
  {
    IDSLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)IDSLibraryCore_frameworkLibrary;
    if (!IDSLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "IDSDefaultPairedDevice");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getIDSDefaultPairedDeviceSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_22E0EDC20(void *a1, uint64_t a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id result;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t inited;
  void **v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  _QWORD aBlock[6];

  v6 = sub_22E0F1B64();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_22E0F1B7C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(a1, sel_specifier);
  if (result)
  {
    v43 = a2;
    v44 = result;
    result = objc_msgSend(a1, sel_specifier);
    if (!result)
    {
      __break(1u);
      return result;
    }
    v15 = result;
    v16 = objc_msgSend(result, sel_target);

    v41 = v10;
    v42 = v7;
    v40 = v11;
    if (v16)
    {
      objc_opt_self();
      v17 = (void *)swift_dynamicCastObjCClass();
      if (v17)
      {
        v39 = v17;
        v18 = objc_msgSend(v17, sel_navigationItem);
LABEL_8:
        v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
        v20 = (void *)objc_opt_self();
        v21 = (void *)sub_22E0F1BA0();
        v22 = objc_msgSend(v20, sel_preferredFontForTextStyle_, v21);

        objc_msgSend(v19, sel_setFont_, v22);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255DF6F10);
        inited = swift_initStackObject();
        v24 = (void **)MEMORY[0x24BEBB368];
        *(_OWORD *)(inited + 16) = xmmword_22E0F3E10;
        v25 = *v24;
        *(_QWORD *)(inited + 32) = *v24;
        v26 = (void *)objc_opt_self();
        v27 = v19;
        swift_bridgeObjectRetain();
        v28 = v25;
        v29 = objc_msgSend(v26, sel_labelColor);
        v30 = objc_msgSend(v29, sel_colorWithAlphaComponent_, a3);

        *(_QWORD *)(inited + 64) = sub_22E0EF51C(0, &qword_255DF6F18);
        *(_QWORD *)(inited + 40) = v30;
        sub_22E0EE13C(inited, &qword_255DF6F48, &qword_255DF6F50, (uint64_t (*)(uint64_t))sub_22E0EEBE0);
        v31 = objc_allocWithZone(MEMORY[0x24BDD1458]);
        v32 = (void *)sub_22E0F1BA0();
        swift_bridgeObjectRelease();
        type metadata accessor for Key(0);
        sub_22E0EF4DC(&qword_255DF6F20, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22E0F4104);
        v33 = (void *)sub_22E0F1B94();
        swift_bridgeObjectRelease();
        v34 = objc_msgSend(v31, sel_initWithString_attributes_, v32, v33);

        objc_msgSend(v27, sel_setAttributedText_, v34);
        sub_22E0EF51C(0, &qword_255DF6F28);
        v35 = (void *)sub_22E0F1BF4();
        v36 = swift_allocObject();
        *(_QWORD *)(v36 + 16) = v18;
        *(_QWORD *)(v36 + 24) = v27;
        aBlock[4] = sub_22E0EF580;
        aBlock[5] = v36;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_22E0EE264;
        aBlock[3] = &block_descriptor;
        v37 = _Block_copy(aBlock);
        v38 = v18;
        swift_release();
        sub_22E0F1B70();
        aBlock[0] = MEMORY[0x24BEE4AF8];
        sub_22E0EF4DC(&qword_255DF6F30, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255DF6F38);
        sub_22E0EF5B4(&qword_255DF6F40, &qword_255DF6F38, MEMORY[0x24BEE12C8]);
        sub_22E0F1C0C();
        MEMORY[0x22E325CF8](0, v13, v9, v37);

        _Block_release(v37);
        (*(void (**)(char *, uint64_t))(v42 + 8))(v9, v6);
        return (id)(*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v13, v41);
      }
      swift_unknownObjectRelease();
    }
    v18 = 0;
    v39 = 0;
    goto LABEL_8;
  }
  return result;
}

unint64_t sub_22E0EE13C(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t result;
  char v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;

  if (!*(_QWORD *)(a1 + 16))
  {
    v8 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = sub_22E0F1C18();
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  v10 = v7 + 64;
  v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_22E0EF5F4(v11, (uint64_t)&v18, a3);
    v12 = v18;
    result = a4(v18);
    if ((v14 & 1) != 0)
      break;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v8[6] + 8 * result) = v12;
    result = (unint64_t)sub_22E0EF474(&v19, (_OWORD *)(v8[7] + 32 * result));
    v15 = v8[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v8[2] = v17;
    v11 += 40;
    if (!--v9)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_22E0EE264(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_22E0EE290()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_22E0F1BDC();
  sub_22E0F1BDC();
  sub_22E0F1BDC();
  sub_22E0F1BDC();
  sub_22E0F1BDC();
  swift_retain();
  return sub_22E0F1B88();
}

void sub_22E0EE3A4()
{
  void *v0;
  id v1;
  void *v2;
  unsigned int v3;
  id v4;
  void *v5;
  id v6;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_sharedApplication);
  v2 = (void *)sub_22E0F1B34();
  v3 = objc_msgSend(v1, sel_canOpenURL_, v2);

  if (v3)
  {
    v4 = objc_msgSend(v0, sel_sharedApplication);
    v5 = (void *)sub_22E0F1B34();
    sub_22E0EE13C(MEMORY[0x24BEE4AF8], &qword_255DF6F00, &qword_255DF6F08, (uint64_t (*)(uint64_t))sub_22E0EEBE0);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_22E0EF4DC(&qword_255DF6EF8, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22E0F4148);
    v6 = (id)sub_22E0F1B94();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_openURL_options_completionHandler_, v5, v6, 0);

  }
}

id sub_22E0EE550(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  void *v5;
  objc_class *ObjectType;
  void *v10;
  id v11;
  id v12;
  objc_super v14;

  v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    v10 = (void *)sub_22E0F1BA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v14.receiver = v5;
  v14.super_class = ObjectType;
  v11 = objc_msgSendSuper2(&v14, sel_initWithStyle_reuseIdentifier_specifier_, a1, v10, a4);

  v12 = v11;
  if (v12)

  return v12;
}

id sub_22E0EE740()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PasscodePlacardCell()
{
  return objc_opt_self();
}

uint64_t sub_22E0EE794(uint64_t a1, uint64_t a2)
{
  return sub_22E0EE8F0(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_22E0EE7AC(uint64_t a1, uint64_t a2)
{
  return sub_22E0EE8F0(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_22E0EE7C0(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_22E0F1BAC();
  *a2 = 0;
  return result;
}

uint64_t sub_22E0EE834(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_22E0F1BB8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_22E0EE8B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_22E0F1BC4();
  v2 = sub_22E0F1BA0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22E0EE8F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_22E0F1BC4();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22E0EE92C()
{
  sub_22E0F1BC4();
  sub_22E0F1BD0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22E0EE96C()
{
  uint64_t v0;

  sub_22E0F1BC4();
  sub_22E0F1C3C();
  sub_22E0F1BD0();
  v0 = sub_22E0F1C48();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22E0EE9E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_22E0F1BC4();
  v2 = v1;
  if (v0 == sub_22E0F1BC4() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_22E0F1C30();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_22E0EEA6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_22E0F1BC4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22E0EEA94()
{
  sub_22E0EF4DC(&qword_255DF6F20, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22E0F4104);
  sub_22E0EF4DC(&qword_255DF6F98, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22E0F4058);
  return sub_22E0F1C24();
}

uint64_t sub_22E0EEB18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_22E0F1BA0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22E0EEB5C()
{
  sub_22E0EF4DC(&qword_255DF6EF8, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22E0F4148);
  sub_22E0EF4DC(&qword_255DF6FA0, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22E0F3F38);
  return sub_22E0F1C24();
}

unint64_t sub_22E0EEBE0(uint64_t a1)
{
  uint64_t v2;

  sub_22E0F1BC4();
  sub_22E0F1C3C();
  sub_22E0F1BD0();
  v2 = sub_22E0F1C48();
  swift_bridgeObjectRelease();
  return sub_22E0EEC60(a1, v2);
}

unint64_t sub_22E0EEC60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_22E0F1BC4();
    v8 = v7;
    if (v6 == sub_22E0F1BC4() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_22E0F1C30();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_22E0F1BC4();
          v15 = v14;
          if (v13 == sub_22E0F1BC4() && v15 == v16)
            break;
          v18 = sub_22E0F1C30();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_22E0EEDD4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t ObjCClassFromMetadata;
  void *v4;
  id v5;
  uint64_t v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  id (*v32)(double);
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41[5];

  swift_getObjectType();
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DF6ED8);
  v39 = *(_QWORD *)(v1 - 8);
  v40 = v1;
  MEMORY[0x24BDAC7A8]();
  v38 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v0, sel_setSelectionStyle_, 0);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
  v32 = (id (*)(double))0x800000022E0FA9B0;
  v36 = (id)sub_22E0F1B28();
  v37 = v6;

  v7 = PSIsPearlAvailable();
  v8 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
  if (v7)
  {
    v35 = 0xD00000000000001ELL;
    v9 = sub_22E0F1B28();
    v11 = v10;

    v12 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
    v32 = (id (*)(double))0x800000022E0FA9B0;
    v13 = sub_22E0F1B28();
    v15 = v14;

    v16 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
    v17 = objc_msgSend(v16, sel_userInterfaceIdiom);

    if (v17)
      v18 = 0x800000022E0FAB10;
    else
      v18 = 0x800000022E0FAB40;
    v19 = "com.apple.graphic-icon.face-id";
  }
  else
  {
    v35 = 0xD00000000000001FLL;
    v9 = sub_22E0F1B28();
    v11 = v20;

    v21 = objc_msgSend(v4, sel_bundleForClass_, ObjCClassFromMetadata);
    v32 = (id (*)(double))0x800000022E0FA9B0;
    v13 = sub_22E0F1B28();
    v15 = v22;

    v23 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
    v24 = objc_msgSend(v23, sel_userInterfaceIdiom);

    if (v24)
      v18 = 0x800000022E0FAA40;
    else
      v18 = 0x800000022E0FAA70;
    v19 = "com.apple.graphic-icon.touch-id";
  }
  v25 = (unint64_t)(v19 - 32) | 0x8000000000000000;
  v26 = (_QWORD *)swift_allocObject();
  v26[2] = v0;
  v26[3] = v9;
  v26[4] = v11;
  v27 = MEMORY[0x24BDAC7A8]();
  *(&v34 - 12) = v9;
  *(&v34 - 11) = v11;
  *(&v34 - 10) = v13;
  *(&v34 - 9) = v15;
  v28 = v37;
  *(&v34 - 8) = (uint64_t)v36;
  *(&v34 - 7) = v28;
  *(&v34 - 6) = 0xD000000000000021;
  *(&v34 - 5) = v18;
  *(&v34 - 4) = v35;
  *(&v34 - 3) = v25;
  v32 = sub_22E0EF398;
  v33 = v27;
  v36 = v0;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DF6EE0);
  sub_22E0EF5B4(&qword_255DF6EE8, &qword_255DF6EE0, MEMORY[0x24BE855C8]);
  v29 = v38;
  sub_22E0F1B4C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22E0F1B58();
  v30 = v40;
  v41[3] = v40;
  v41[4] = sub_22E0EF5B4(&qword_255DF6EF0, &qword_255DF6ED8, MEMORY[0x24BDEFEA0]);
  __swift_allocate_boxed_opaque_existential_1(v41);
  sub_22E0F1B40();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v29, v30);
  MEMORY[0x22E325CE0](v41);
  return swift_release();
}

uint64_t sub_22E0EF36C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

id sub_22E0EF398(double a1)
{
  uint64_t v1;

  return sub_22E0EDC20(*(void **)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_22E0EF3A4()
{
  return sub_22E0EE290();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E32649C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
  sub_22E0EF498(a1, &qword_255DF6F60);
}

_OWORD *sub_22E0EF474(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_22E0EF498(a1, &qword_255DF6F58);
}

void sub_22E0EF498(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_22E0EF4DC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E3264A8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22E0EF51C(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_22E0EF554()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_22E0EF580()
{
  uint64_t v0;
  id result;

  result = *(id *)(v0 + 16);
  if (result)
    return objc_msgSend(result, sel_setTitleView_, *(_QWORD *)(v0 + 24));
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_22E0EF5B4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E3264A8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22E0EF5F4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22E0EF638()
{
  return sub_22E0EF4DC(&qword_255DF6F68, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22E0F3EFC);
}

uint64_t sub_22E0EF664()
{
  return sub_22E0EF4DC(&qword_255DF6F70, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22E0F3ED0);
}

uint64_t sub_22E0EF690()
{
  return sub_22E0EF4DC(&qword_255DF6F78, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22E0F401C);
}

uint64_t sub_22E0EF6BC()
{
  return sub_22E0EF4DC(&qword_255DF6F80, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22E0F3FF0);
}

uint64_t sub_22E0EF6E8()
{
  return sub_22E0EF4DC(&qword_255DF6F88, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22E0F408C);
}

uint64_t sub_22E0EF714()
{
  return sub_22E0EF4DC(&qword_255DF6F90, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22E0F3F6C);
}

uint64_t sub_22E0EF748()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t get_aks_client_connection()
{
  uint64_t result;

  if (get_aks_client_dispatch_queue_onceToken != -1)
    dispatch_once(&get_aks_client_dispatch_queue_onceToken, &__block_literal_global_168_0);
  dispatch_sync((dispatch_queue_t)get_aks_client_dispatch_queue_connection_queue, &__block_literal_global_150);
  result = get_aks_client_connection_connection;
  if (!get_aks_client_connection_connection)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return get_aks_client_connection_connection;
  }
  return result;
}

void __get_aks_client_connection_block_invoke()
{
  if (!get_aks_client_connection_connection)
    get_aks_client_connection_connection = _copy_aks_client_connection("IOService:/IOResources/AppleKeyStore", "AppleKeyStore");
}

dispatch_queue_t __get_aks_client_dispatch_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("aks-client-queue", 0);
  get_aks_client_dispatch_queue_connection_queue = (uint64_t)result;
  return result;
}

uint64_t _copy_aks_client_connection(char *path, const char *a2)
{
  mach_port_t v3;
  io_service_t v4;
  task_port_t *v5;
  io_object_t v6;
  kern_return_t v7;
  const __CFDictionary *v8;
  io_service_t MatchingService;
  io_object_t v10;
  uint64_t result;
  kern_return_t v12;
  io_connect_t connect;

  connect = 0;
  v3 = *MEMORY[0x24BDD8B20];
  v4 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B20], path);
  v5 = (task_port_t *)MEMORY[0x24BDAEC58];
  if (!v4 || (v6 = v4, v7 = IOServiceOpen(v4, *MEMORY[0x24BDAEC58], 0, &connect), IOObjectRelease(v6), v7))
  {
    v8 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(v3, v8);
    if (MatchingService)
    {
      v10 = MatchingService;
      IOServiceOpen(MatchingService, *v5, 0, &connect);
      IOObjectRelease(v10);
    }
  }
  result = connect;
  if (connect)
  {
    v12 = IOConnectCallMethod(connect, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    result = connect;
    if (v12)
    {
      IOServiceClose(connect);
      return 0;
    }
  }
  return result;
}

uint64_t _aks_verify_password(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  uint64_t v9;
  mach_port_t aks_client_connection;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  mach_port_t v16;
  const char *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  v9 = 3758097084;
  v21 = 0;
  v20 = 0;
  aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    v16 = aks_client_connection;
    if (a2)
      v17 = a2;
    else
      v17 = "";
    aks_pack_data((char **)&v21, (unsigned int *)&v20, 2, v11, v12, v13, v14, v15, (uint64_t)v17);
    if (v21)
    {
      input[0] = a1;
      input[1] = a6;
      input[2] = (uint64_t)v21;
      input[3] = v20;
      v9 = IOConnectCallMethod(v16, 0x2Au, input, 4u, 0, 0, 0, 0, 0, 0);
      v18 = v21;
    }
    else
    {
      v18 = 0;
      v9 = 3758097085;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8E8], "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_aks_verify_password", ":", 1807, "", 0, "", "");
    v18 = 0;
  }
  free(v18);
  return v9;
}

uint64_t aks_verify_password(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return _aks_verify_password(a1, a2, a3, a4, a5, 0);
}

char *aks_copy_packed_data(_DWORD *a1, const void *a2, int a3)
{
  char *v3;
  int v5;
  size_t v6;
  int __s;

  v3 = (char *)(a1 + 1);
  if (a2)
  {
    *a1 = a3;
    memcpy(a1 + 1, a2, a3);
    v3 += a3;
    v5 = -a3;
    v6 = -a3 & 3;
    if ((v5 & 3) != 0)
    {
      __s = 0;
      memset_s(&__s, 4uLL, 0, 4uLL);
      memcpy(v3, &__s, v6);
      v3 += v6;
    }
  }
  else
  {
    *a1 = 0;
  }
  return v3;
}

char *aks_pack_data(char **a1, unsigned int *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int v12;
  int v13;
  uint64_t *v14;
  char *result;
  char *v16;
  int v17;
  uint64_t v18;
  const void **v19;
  const void *v20;
  uint64_t *v21;
  const void **v22;

  v21 = &a9;
  v12 = 4;
  if (a3)
  {
    v13 = a3;
    do
    {
      v14 = v21;
      v21 += 2;
      v12 += *((_DWORD *)v14 + 2) + (-*((_DWORD *)v14 + 2) & 3) + 4;
      --v13;
    }
    while (v13);
  }
  result = (char *)calloc(1uLL, v12);
  v16 = result;
  v22 = (const void **)&a9;
  v17 = 0;
  if (a3)
  {
    v18 = 4;
    do
    {
      v19 = v22;
      v20 = *v22;
      v22 += 2;
      result = aks_copy_packed_data(&v16[v18], v20, *((_DWORD *)v19 + 2));
      v18 = result - v16;
      ++v17;
    }
    while (a3 != v17);
  }
  *(_DWORD *)v16 = v17;
  *a1 = v16;
  *a2 = v12;
  return result;
}

uint64_t __getBFFStyleClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPKWalletVisibilityClass_block_invoke_cold_1(v0);
}

uint64_t __getPKWalletVisibilityClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getPKPaymentRegistrationUtilitiesClass_block_invoke_cold_1();
}

uint64_t __getPKPaymentRegistrationUtilitiesClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getPKPaymentWebServiceClass_block_invoke_cold_1();
}

uint64_t __getPKPaymentWebServiceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[PSUIDeviceTakeOverController gateWithRatchetForOperation:forPresentingVC:completion:].cold.1(v0);
}

uint64_t __getEREyeReliefClientClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __credentialSetWithPasscodeCredential_block_invoke_cold_1(v0);
}

void __credentialSetWithPasscodeCredential_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_22E0C8000, a2, a3, "Could not ask verify password: %d", a5, a6, a7, a8, 0);
}

uint64_t __getLAContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[PSUITouchIDPasscodeController authContext].cold.1(v0);
}

uint64_t __getBYFlowSkipControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[PSUIPasscodeLockController turnOffPasscodeAlertMessage].cold.1(v0);
}

void dtoStatusChangedNotification_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22E0C8000, v0, v1, "DTO: Received notification: Changed arm/overall state but have no observer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t __getHMHomeManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1(v0);
}

uint64_t __getAKAppleIDAuthenticationInAppContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getAKAppleIDAuthenticationControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAFPreferencesClass_block_invoke_cold_1(v0);
}

uint64_t __getAFPreferencesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getLockdownModeManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getLockdownModeManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[PSUIBiometrics init].cold.1(v0);
}

void __getNRPairedDeviceRegistryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getSFUnlockManagerClass_block_invoke_cold_1(v0);
}

void __getSFUnlockManagerClass_block_invoke_cold_1()
{
  abort_report_np();
  PSUILogForCategory_cold_1();
}

void PSUILogForCategory_cold_1()
{
  __assert_rtn("PSUILogForCategory", "PSUILogging.m", 13, "category < PSUILoggingCategoryCount");
}

uint64_t sub_22E0F1B28()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_22E0F1B34()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_22E0F1B40()
{
  return MEMORY[0x24BDEFE58]();
}

uint64_t sub_22E0F1B4C()
{
  return MEMORY[0x24BDEFE68]();
}

uint64_t sub_22E0F1B58()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_22E0F1B64()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_22E0F1B70()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_22E0F1B7C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_22E0F1B88()
{
  return MEMORY[0x24BE855A8]();
}

uint64_t sub_22E0F1B94()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_22E0F1BA0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22E0F1BAC()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_22E0F1BB8()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_22E0F1BC4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22E0F1BD0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22E0F1BDC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22E0F1BE8()
{
  return MEMORY[0x24BEBCBF0]();
}

uint64_t sub_22E0F1BF4()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_22E0F1C00()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_22E0F1C0C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_22E0F1C18()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_22E0F1C24()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_22E0F1C30()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22E0F1C3C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22E0F1C48()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t ACMContextCreate()
{
  return MEMORY[0x24BE75408]();
}

uint64_t ACMContextDelete()
{
  return MEMORY[0x24BE75410]();
}

uint64_t ACMContextGetExternalForm()
{
  return MEMORY[0x24BE75418]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC060]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
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

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

uint64_t PKIsUSBRestrictedModeDisabledByMobileAsset()
{
  return MEMORY[0x24BE757E8]();
}

uint64_t PKNearFieldRadioIsAvailable()
{
  return MEMORY[0x24BE6F488]();
}

uint64_t PSAuthorizationTokenForPasscode()
{
  return MEMORY[0x24BE75888]();
}

uint64_t PSHasStockholmPass()
{
  return MEMORY[0x24BE75A98]();
}

uint64_t PSIsBundleIDHiddenDueToRestrictions()
{
  return MEMORY[0x24BE75AE8]();
}

uint64_t PSIsPearlAvailable()
{
  return MEMORY[0x24BE75B18]();
}

uint64_t PSIsPearlInterlocked()
{
  return MEMORY[0x24BE75B20]();
}

uint64_t PSJoinedCDPCircleAccount()
{
  return MEMORY[0x24BE75B48]();
}

uint64_t PSKeychainSyncGetStatus()
{
  return MEMORY[0x24BE75B58]();
}

uint64_t PSLocalizableMesaStringForKey()
{
  return MEMORY[0x24BE75BB0]();
}

uint64_t PSLocalizablePearlStringForKey()
{
  return MEMORY[0x24BE75BB8]();
}

uint64_t PSLocalizableStockholmStringForKey()
{
  return MEMORY[0x24BE75BC0]();
}

uint64_t PSPointImageOfColor()
{
  return MEMORY[0x24BE75C00]();
}

uint64_t PSPreferencesFrameworkBundle()
{
  return MEMORY[0x24BE75C08]();
}

uint64_t PSPreferencesUIFrameworkBundle()
{
  return MEMORY[0x24BE75C10]();
}

uint64_t PSSupportsMesa()
{
  return MEMORY[0x24BE75CF8]();
}

uint64_t PSUsedByHSA2Account()
{
  return MEMORY[0x24BE75D78]();
}

uint64_t PSUsedByManagedAccount()
{
  return MEMORY[0x24BE75D80]();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x24BE85770]();
}

uint64_t SOSCCRemoveThisDeviceFromCircle()
{
  return MEMORY[0x24BDE85C0]();
}

uint64_t SecPasswordIsPasswordWeak2()
{
  return MEMORY[0x24BDE8BD8]();
}

uint64_t TCCAccessCopyInformation()
{
  return MEMORY[0x24BEB3770]();
}

uint64_t _AXSAttentionAwarenessFeaturesEnabled()
{
  return MEMORY[0x24BED20A0]();
}

uint64_t _AXSGetUSBRMDisablers()
{
  return MEMORY[0x24BED2210]();
}

uint64_t _AXSSetAttentionAwarenessFeaturesEnabled()
{
  return MEMORY[0x24BED2420]();
}

uint64_t _AXSSetUSBRMDisablers()
{
  return MEMORY[0x24BED24D0]();
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

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
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

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int fls(int a1)
{
  return MEMORY[0x24BDAE3C8](*(_QWORD *)&a1);
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

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x24BDAEEC8](__s, __smax, *(_QWORD *)&__c, __n);
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x24BDE17F0]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x24BDE1828]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x24BDE1938](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
  MEMORY[0x24BDE1A08](monitor);
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x24BDE1A10]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
  MEMORY[0x24BDE1A38](monitor, queue);
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
  MEMORY[0x24BDE1A48](monitor, update_handler);
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
  MEMORY[0x24BDE1A50](monitor);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
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

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

