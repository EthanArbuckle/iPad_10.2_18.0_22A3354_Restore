void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_20E36714C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id extensionMatchingAttributes(int a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v6;
  const __CFString *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v1 = *MEMORY[0x24BDD0C48];
  if (a1)
  {
    v9[0] = CFSTR("com.apple.authentication-services-credential-provider-ui");
    v2 = *MEMORY[0x24BE72FE8];
    v8[0] = v1;
    v8[1] = v2;
    objc_msgSend(&unk_24C93C8D8, "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6 = *MEMORY[0x24BDD0C48];
    v7 = CFSTR("com.apple.authentication-services-credential-provider-ui");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

uint64_t extensionAndContainingAppHaveDeveloperEntitlement(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;

  v1 = a1;
  objc_msgSend(v1, "_plugIn");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safari_BOOLForKey:", CFSTR("com.apple.developer.authentication-services.autofill-credential-provider"));

  if ((v4 & 1) != 0)
  {
    v5 = objc_alloc(MEMORY[0x24BDC1540]);
    objc_msgSend(v1, "_plugIn");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containingUrl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithURL:allowPlaceholder:error:", v7, 0, 0);

    objc_msgSend(v8, "entitlements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:ofClass:", CFSTR("com.apple.developer.authentication-services.autofill-credential-provider"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", MEMORY[0x24BDBD1C8]);

    if ((v11 & 1) == 0)
    {
      v12 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        extensionAndContainingAppHaveDeveloperEntitlement_cold_1(v12, v1);
    }

  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      extensionAndContainingAppHaveDeveloperEntitlement_cold_2(v13, v1);
    v11 = 0;
  }

  return v11;
}

void sub_20E367598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXPasswords()
{
  if (WBS_LOG_CHANNEL_PREFIXPasswords_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPasswords_onceToken, &__block_literal_global_9);
  return WBS_LOG_CHANNEL_PREFIXPasswords_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXAutoFill()
{
  if (WBS_LOG_CHANNEL_PREFIXAutoFill_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAutoFill_onceToken, &__block_literal_global);
  return WBS_LOG_CHANNEL_PREFIXAutoFill_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCredentials()
{
  if (WBS_LOG_CHANNEL_PREFIXCredentials_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCredentials_onceToken, &__block_literal_global_5);
  return WBS_LOG_CHANNEL_PREFIXCredentials_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPasswordSharing()
{
  if (WBS_LOG_CHANNEL_PREFIXPasswordSharing_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPasswordSharing_onceToken, &__block_literal_global_11);
  return WBS_LOG_CHANNEL_PREFIXPasswordSharing_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension()
{
  if (WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension_onceToken, &__block_literal_global_13);
  return WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension_log;
}

void sub_20E367C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  uint64_t v19;

  _Block_object_dispose((const void *)(v19 - 80), 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20E3685E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_20E36A48C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t compareStringToString(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 == v4)
  {
    v6 = 0;
  }
  else if (v3 || !v4)
  {
    if (!v3 || v4)
      v6 = objc_msgSend(v3, "compare:", v4);
    else
      v6 = 1;
  }
  else
  {
    v6 = -1;
  }

  return v6;
}

void sub_20E36AA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getIMOneTimeCodeAcceleratorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!IMCoreLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24C9356F8;
    v5 = 0;
    IMCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IMCoreLibraryCore_frameworkLibrary)
    __getIMOneTimeCodeAcceleratorClass_block_invoke_cold_1(&v3);
  result = objc_getClass("IMOneTimeCodeAccelerator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getIMOneTimeCodeAcceleratorClass_block_invoke_cold_2();
  getIMOneTimeCodeAcceleratorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getEMOneTimeCodeAcceleratorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!EmailLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24C935710;
    v5 = 0;
    EmailLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!EmailLibraryCore_frameworkLibrary)
    __getEMOneTimeCodeAcceleratorClass_block_invoke_cold_1(&v3);
  result = objc_getClass("EMOneTimeCodeAccelerator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getEMOneTimeCodeAcceleratorClass_block_invoke_cold_2();
  getEMOneTimeCodeAcceleratorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

SFAutoFillPasskey *__corePasskeysToSFPasskeys_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SFAutoFillPasskey *v3;

  v2 = a2;
  v3 = -[SFAutoFillPasskey initWithCoreAutoFillPasskey:]([SFAutoFillPasskey alloc], "initWithCoreAutoFillPasskey:", v2);

  return v3;
}

void sub_20E36B870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNPSManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24C9357F8;
    v5 = 0;
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
    __getNPSManagerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("NPSManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getNPSManagerClass_block_invoke_cold_2();
  getNPSManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __isUsingEducationMode_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isUsingEducationMode_usingEducationMode = objc_msgSend(v0, "isEphemeralMultiUser");

}

void sub_20E36BF24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_20E36C9F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id fillCodeString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD17C8];
  v2 = a1;
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t IMSharedUtilitiesLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!IMSharedUtilitiesLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24C935880;
    v3 = 0;
    IMSharedUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IMSharedUtilitiesLibraryCore_frameworkLibrary)
    IMSharedUtilitiesLibrary_cold_1(&v1);
  return IMSharedUtilitiesLibraryCore_frameworkLibrary;
}

char *OUTLINED_FUNCTION_0_1()
{
  return dlerror();
}

id SFStringFromCredentialIdentityType(char a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("Password Credential"));
    objc_msgSend(v3, "addObject:", CFSTR("Passkey Credential"));
    objc_msgSend(v3, "addObject:", CFSTR("One-Time Code Credential"));
  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_20E36F4A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_2(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_3()
{
  uint64_t v0;

  return v0;
}

void sub_20E3709AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_20E370D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_20E3713A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

BOOL extensionIsEnabled(void *a1)
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_plugIn");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_msgSend(v1, "userElection") & 0xFFFFFFFFFFFF00FFLL) == 1;

  return v2;
}

void sub_20E371B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __findEnabledExtensions_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (extensionIsEnabled(v2) && extensionAndContainingAppHaveDeveloperEntitlement(v2))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_20E372D00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20E372DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_20E372FBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void credentialIdentityMatchesDomains(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  void *v5;
  const unsigned __int8 *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;

  if (a2 == 3)
  {
    v5 = (void *)MEMORY[0x212BBA31C]();
    v6 = sqlite3_value_text(*a3);
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        && ((v8 = sqlite3_value_int64(a3[1]), v8 >= 2) ? (v9 = 0) : (v9 = v8),
            (v10 = sqlite3_value_pointer(a3[2], "domainSet")) != 0))
      {
        v11 = v10;
        if (v9 == 1)
        {
          objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", v7);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "host");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "safari_highLevelDomainFromHost");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v16, "lowercaseString");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v11, "containsObject:", v19);

          }
          else
          {
            v17 = 0;
          }
        }
        else
        {
          objc_msgSend(v7, "safari_highLevelDomainFromHost");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          if (v12)
            v14 = (void *)v12;
          else
            v14 = v7;
          v15 = v14;

          objc_msgSend(v15, "lowercaseString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v11, "containsObject:", v16);
        }

        sqlite3_result_int(a1, v17);
      }
      else
      {
        sqlite3_result_int(a1, 0);
      }

    }
    else
    {
      sqlite3_result_int(a1, 0);
    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    sqlite3_result_int(a1, 0);
  }
}

void sub_20E37319C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_20E3732DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20E373434(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20E3735E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20E37366C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20E373838(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20E373DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

id SafariShared::WBSSQLiteDatabaseFetch<>(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82D98]), "initWithDatabase:query:", v3, v4);
  objc_msgSend(v5, "fetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_20E373F94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20E3740FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20E3742B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20E3744F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  uint64_t v15;

  _Block_object_dispose((const void *)(v15 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_20E3748B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_20E374A8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_20E374BD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20E374CC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20E374E5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20E3751F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_20E3756B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_20E3758A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_20E3759E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_20E375B34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_20E375C2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_20E375D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_20E375F18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_20E376270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_20E376468(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_20E37661C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20E37680C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20E3769A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(void *a1, _QWORD *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v13;

  v5 = a1;
  v6 = a3;
  v13 = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82D98]), "initWithDatabase:query:error:", v5, v6, &v13);
  v8 = v13;
  v9 = v8;
  if (v7)
  {
    v10 = objc_msgSend(v7, "execute");
    objc_msgSend(v7, "invalidate");
    if ((v10 - 100) >= 2 && (_DWORD)v10 != 0)
      objc_msgSend(v5, "reportErrorWithCode:statement:error:", v10, objc_msgSend(v7, "handle"), a2);
  }
  else
  {
    if (a2)
      *a2 = objc_retainAutorelease(v8);
    v10 = objc_msgSend(v9, "code");
  }

  return v10;
}

void sub_20E376B64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong}&,SFCredentialServiceIdentifierType &,NSString * {__strong}&,NSString * {__strong}&,long &,long &>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7)
{
  id v13;

  v13 = a1;
  objc_msgSend(v13, "bindString:atParameterIndex:", *a2, 2);
  SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType &,NSString * {__strong}&,NSString * {__strong}&,long &,long &>(v13, a3, a4, a5, a6, a7);

}

void sub_20E376C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType &,NSString * {__strong}&,NSString * {__strong}&,long &,long &>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  id v11;

  v11 = a1;
  objc_msgSend(v11, "bindInt64:atParameterIndex:", *a2, 3);
  SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong}&,NSString * {__strong}&,long &,long &>(v11, a3, a4, a5, a6);

}

void sub_20E376C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong}&,NSString * {__strong}&,long &,long &>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  id v9;

  v9 = a1;
  objc_msgSend(v9, "bindString:atParameterIndex:", *a2, 4);
  SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong}&,long &,long &>(v9, a3, a4, a5);

}

void sub_20E376D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong}&,long &,long &>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  id v7;

  v7 = a1;
  objc_msgSend(v7, "bindString:atParameterIndex:", *a2, 5);
  SafariShared::_WBSSQLiteStatementBindAllParameters<6,long &,long &>(v7, a3, a4);

}

void sub_20E376D78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<6,long &,long &>(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;

  v5 = a1;
  objc_msgSend(v5, "bindInt64:atParameterIndex:", *a2, 6);
  objc_msgSend(v5, "bindInt64:atParameterIndex:", *a3, 7);

}

void sub_20E376DDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong}&,SFCredentialServiceIdentifierType &,NSString * {__strong}&,NSString * {__strong}&,long &,NSString * {__strong}&,NSString * {__strong}&,long &>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9)
{
  id v16;

  v16 = a1;
  objc_msgSend(v16, "bindString:atParameterIndex:", *a2, 2);
  SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType &,NSString * {__strong}&,NSString * {__strong}&,long &,NSString * {__strong}&,NSString * {__strong}&,long &>(v16, a3, a4, a5, a6, a7, a8, a9);

}

void sub_20E376E84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType &,NSString * {__strong}&,NSString * {__strong}&,long &,NSString * {__strong}&,NSString * {__strong}&,long &>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8)
{
  id v15;

  v15 = a1;
  objc_msgSend(v15, "bindInt64:atParameterIndex:", *a2, 3);
  SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong}&,NSString * {__strong}&,long &,NSString * {__strong}&,NSString * {__strong}&,long &>(v15, a3, a4, a5, a6, a7, a8);

}

void sub_20E376F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong}&,NSString * {__strong}&,long &,NSString * {__strong}&,NSString * {__strong}&,long &>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7)
{
  id v13;

  v13 = a1;
  objc_msgSend(v13, "bindString:atParameterIndex:", *a2, 4);
  SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong}&,long &,NSString * {__strong}&,NSString * {__strong}&,long &>(v13, a3, a4, a5, a6, a7);

}

void sub_20E376FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong}&,long &,NSString * {__strong}&,NSString * {__strong}&,long &>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  id v11;

  v11 = a1;
  objc_msgSend(v11, "bindString:atParameterIndex:", *a2, 5);
  SafariShared::_WBSSQLiteStatementBindAllParameters<6,long &,NSString * {__strong}&,NSString * {__strong}&,long &>(v11, a3, a4, a5, a6);

}

void sub_20E37703C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<6,long &,NSString * {__strong}&,NSString * {__strong}&,long &>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  id v9;

  v9 = a1;
  objc_msgSend(v9, "bindInt64:atParameterIndex:", *a2, 6);
  SafariShared::_WBSSQLiteStatementBindAllParameters<7,NSString * {__strong}&,NSString * {__strong}&,long &>(v9, a3, a4, a5);

}

void sub_20E3770B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<7,NSString * {__strong}&,NSString * {__strong}&,long &>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  id v7;

  v7 = a1;
  objc_msgSend(v7, "bindString:atParameterIndex:", *a2, 7);
  SafariShared::_WBSSQLiteStatementBindAllParameters<8,NSString * {__strong}&,long &>(v7, a3, a4);

}

void sub_20E377124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<8,NSString * {__strong}&,long &>(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;

  v5 = a1;
  objc_msgSend(v5, "bindString:atParameterIndex:", *a2, 8);
  objc_msgSend(v5, "bindInt64:atParameterIndex:", *a3, 9);

}

void sub_20E377188(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  id v11;

  v11 = a1;
  objc_msgSend(v11, "bindString:atParameterIndex:", *a2, 1);
  SafariShared::_WBSSQLiteStatementBindAllParameters<2,SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(v11, a3, a4, a5, a6);

}

void sub_20E377210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  id v9;

  v9 = a1;
  objc_msgSend(v9, "bindInt64:atParameterIndex:", *a2, 2);
  SafariShared::_WBSSQLiteStatementBindAllParameters<3,NSString * {__strong},NSString * {__strong},long>(v9, a3, a4, a5);

}

void sub_20E377288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<3,NSString * {__strong},NSString * {__strong},long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  id v7;

  v7 = a1;
  objc_msgSend(v7, "bindString:atParameterIndex:", *a2, 3);
  SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong},long>(v7, a3, a4);

}

void sub_20E3772F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong},long>(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;

  v5 = a1;
  objc_msgSend(v5, "bindString:atParameterIndex:", *a2, 4);
  objc_msgSend(v5, "bindInt64:atParameterIndex:", *a3, 5);

}

void sub_20E37735C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,long &,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7)
{
  id v13;

  v13 = a1;
  objc_msgSend(v13, "bindInt64:atParameterIndex:", *a2, 1);
  SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(v13, a3, a4, a5, a6, a7);

}

void sub_20E3773EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  id v11;

  v11 = a1;
  objc_msgSend(v11, "bindString:atParameterIndex:", *a2, 2);
  SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(v11, a3, a4, a5, a6);

}

void sub_20E377474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  id v9;

  v9 = a1;
  objc_msgSend(v9, "bindInt64:atParameterIndex:", *a2, 3);
  SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong},NSString * {__strong},long>(v9, a3, a4, a5);

}

void sub_20E3774EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong},NSString * {__strong},long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  id v7;

  v7 = a1;
  objc_msgSend(v7, "bindString:atParameterIndex:", *a2, 4);
  SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong},long>(v7, a3, a4);

}

void sub_20E37755C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong},long>(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;

  v5 = a1;
  objc_msgSend(v5, "bindString:atParameterIndex:", *a2, 5);
  objc_msgSend(v5, "bindInt64:atParameterIndex:", *a3, 6);

}

void sub_20E3775C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,long &,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9)
{
  id v16;

  v16 = a1;
  objc_msgSend(v16, "bindInt64:atParameterIndex:", *a2, 1);
  SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(v16, a3, a4, a5, a6, a7, a8, a9);

}

void sub_20E377668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8)
{
  id v15;

  v15 = a1;
  objc_msgSend(v15, "bindString:atParameterIndex:", *a2, 2);
  SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(v15, a3, a4, a5, a6, a7, a8);

}

void sub_20E377708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7)
{
  id v13;

  v13 = a1;
  objc_msgSend(v13, "bindInt64:atParameterIndex:", *a2, 3);
  SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(v13, a3, a4, a5, a6, a7);

}

void sub_20E377798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  id v11;

  v11 = a1;
  objc_msgSend(v11, "bindString:atParameterIndex:", *a2, 4);
  SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(v11, a3, a4, a5, a6);

}

void sub_20E377820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong},long,NSString * {__strong},NSString * {__strong}>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  id v9;

  v9 = a1;
  objc_msgSend(v9, "bindString:atParameterIndex:", *a2, 5);
  SafariShared::_WBSSQLiteStatementBindAllParameters<6,long,NSString * {__strong},NSString * {__strong}>(v9, a3, a4, a5);

}

void sub_20E377898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<6,long,NSString * {__strong},NSString * {__strong}>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  id v7;

  v7 = a1;
  objc_msgSend(v7, "bindInt64:atParameterIndex:", *a2, 6);
  SafariShared::_WBSSQLiteStatementBindAllParameters<7,NSString * {__strong},NSString * {__strong}>(v7, a3, a4);

}

void sub_20E377908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<7,NSString * {__strong},NSString * {__strong}>(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;

  v5 = a1;
  objc_msgSend(v5, "bindString:atParameterIndex:", *a2, 7);
  objc_msgSend(v5, "bindString:atParameterIndex:", *a3, 8);

}

void sub_20E37796C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,long &,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8)
{
  id v15;

  v15 = a1;
  objc_msgSend(v15, "bindInt64:atParameterIndex:", *a2, 1);
  SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,long>(v15, a3, a4, a5, a6, a7, a8);

}

void sub_20E377A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7)
{
  id v13;

  v13 = a1;
  objc_msgSend(v13, "bindString:atParameterIndex:", *a2, 2);
  SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,long>(v13, a3, a4, a5, a6, a7);

}

void sub_20E377A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  id v11;

  v11 = a1;
  objc_msgSend(v11, "bindInt64:atParameterIndex:", *a2, 3);
  SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong},NSString * {__strong},long,long>(v11, a3, a4, a5, a6);

}

void sub_20E377B24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong},NSString * {__strong},long,long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  id v9;

  v9 = a1;
  objc_msgSend(v9, "bindString:atParameterIndex:", *a2, 4);
  SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong},long,long>(v9, a3, a4, a5);

}

void sub_20E377B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong},long,long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  id v7;

  v7 = a1;
  objc_msgSend(v7, "bindString:atParameterIndex:", *a2, 5);
  SafariShared::_WBSSQLiteStatementBindAllParameters<6,long,long>(v7, a3, a4);

}

void sub_20E377C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<6,long,long>(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;

  v5 = a1;
  objc_msgSend(v5, "bindInt64:atParameterIndex:", *a2, 6);
  objc_msgSend(v5, "bindInt64:atParameterIndex:", *a3, 7);

}

void sub_20E377C70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,long &,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong},long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9, _QWORD *a10)
{
  id v17;

  v17 = a1;
  objc_msgSend(v17, "bindInt64:atParameterIndex:", *a2, 1);
  SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong},long>(v17, a3, a4, a5, a6, a7, a8, a9, a10);

}

void sub_20E377D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong},long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9)
{
  id v16;

  v16 = a1;
  objc_msgSend(v16, "bindString:atParameterIndex:", *a2, 2);
  SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong},long>(v16, a3, a4, a5, a6, a7, a8, a9);

}

void sub_20E377DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<3,SFCredentialServiceIdentifierType,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong},long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8)
{
  id v15;

  v15 = a1;
  objc_msgSend(v15, "bindInt64:atParameterIndex:", *a2, 3);
  SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong},long>(v15, a3, a4, a5, a6, a7, a8);

}

void sub_20E377E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<4,NSString * {__strong},NSString * {__strong},long,NSString * {__strong},NSString * {__strong},long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7)
{
  id v13;

  v13 = a1;
  objc_msgSend(v13, "bindString:atParameterIndex:", *a2, 4);
  SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong},long,NSString * {__strong},NSString * {__strong},long>(v13, a3, a4, a5, a6, a7);

}

void sub_20E377EFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<5,NSString * {__strong},long,NSString * {__strong},NSString * {__strong},long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  id v11;

  v11 = a1;
  objc_msgSend(v11, "bindString:atParameterIndex:", *a2, 5);
  SafariShared::_WBSSQLiteStatementBindAllParameters<6,long,NSString * {__strong},NSString * {__strong},long>(v11, a3, a4, a5, a6);

}

void sub_20E377F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<6,long,NSString * {__strong},NSString * {__strong},long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  id v9;

  v9 = a1;
  objc_msgSend(v9, "bindInt64:atParameterIndex:", *a2, 6);
  SafariShared::_WBSSQLiteStatementBindAllParameters<7,NSString * {__strong},NSString * {__strong},long>(v9, a3, a4, a5);

}

void sub_20E377FFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<7,NSString * {__strong},NSString * {__strong},long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  id v7;

  v7 = a1;
  objc_msgSend(v7, "bindString:atParameterIndex:", *a2, 7);
  SafariShared::_WBSSQLiteStatementBindAllParameters<8,NSString * {__strong},long>(v7, a3, a4);

}

void sub_20E37806C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<8,NSString * {__strong},long>(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;

  v5 = a1;
  objc_msgSend(v5, "bindString:atParameterIndex:", *a2, 8);
  objc_msgSend(v5, "bindInt64:atParameterIndex:", *a3, 9);

}

void sub_20E3780D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * {__strong},SFCredentialServiceIdentifierType,NSString * {__strong},long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  id v9;

  v9 = a1;
  objc_msgSend(v9, "bindString:atParameterIndex:", *a2, 1);
  SafariShared::_WBSSQLiteStatementBindAllParameters<2,SFCredentialServiceIdentifierType,NSString * {__strong},long>(v9, a3, a4, a5);

}

void sub_20E378148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<2,SFCredentialServiceIdentifierType,NSString * {__strong},long>(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  id v7;

  v7 = a1;
  objc_msgSend(v7, "bindInt64:atParameterIndex:", *a2, 2);
  SafariShared::_WBSSQLiteStatementBindAllParameters<3,NSString * {__strong},long>(v7, a3, a4);

}

void sub_20E3781B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void SafariShared::_WBSSQLiteStatementBindAllParameters<3,NSString * {__strong},long>(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;

  v5 = a1;
  objc_msgSend(v5, "bindString:atParameterIndex:", *a2, 3);
  objc_msgSend(v5, "bindInt64:atParameterIndex:", *a3, 4);

}

void sub_20E37821C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  return result;
}

id SFCredentialIdentityStoreIdentifierCreateWithApplicationBundleIdentifier(void *a1)
{
  return a1;
}

id SFCredentialIdentityStoreIdentifierGetApplicationBundleIdentifier(void *a1)
{
  return a1;
}

id SFCredentialIdentityStoreIdentifierCreateWithConnectionToExtension(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v1 = (void *)MEMORY[0x24BE72FB8];
  v2 = a1;
  objc_msgSend(v1, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "containingAppForPlugInConnectedTo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;

  return v5;
}

id containerForCredentialIdentityStoreWithIdentifier(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  SFCredentialIdentityStoreIdentifierGetApplicationBundleIdentifier(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v1, 0, 0);
  objc_msgSend(v2, "dataContainerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("/SystemData/com.apple.AuthenticationServices"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_20E378BD8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 96));
  _Unwind_Resume(a1);
}

id getFinishHandlersForExtension(void *a1, char *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  char v6;

  v3 = a1;
  objc_getAssociatedObject(v3, (const void *)getFinishHandlersForExtension_extensionFinishHandlersAssociationKey);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (id)v4;
    v6 = 0;
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v6 = 1;
    objc_setAssociatedObject(v3, (const void *)getFinishHandlersForExtension_extensionFinishHandlersAssociationKey, v5, (void *)1);
  }
  *a2 = v6;

  return v5;
}

void callHandler(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;
  char v9;

  v5 = a2;
  v6 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&registrationLock);
  v9 = 0;
  getFinishHandlersForExtension(v6, &v9);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v5);

  os_unfair_lock_unlock((os_unfair_lock_t)&registrationLock);
  if (v7)
    v7[2](v7, a3);

}

void sub_20E37A348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_20E37AA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20E37AF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id usernameAndWebsiteStringFromCredential(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x24BDD17C8];
  v2 = a1;
  objc_msgSend(v2, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "site");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@@%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_20E37BB14(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t numberOfDotsInString(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = 0;
    do
    {
      if (objc_msgSend(v1, "characterAtIndex:", v4) == 46)
        ++v5;
      ++v4;
    }
    while (v3 != v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

unint64_t lengthOfLongestCommonSubstring(void *a1, void *a2)
{
  id v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int v15;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "length"))
  {
    v5 = 0;
    v6 = 0;
    do
    {
      if (objc_msgSend(v4, "length"))
      {
        v7 = 0;
        do
        {
          v8 = objc_msgSend(v3, "length") - v5;
          v9 = objc_msgSend(v4, "length") - v7;
          if (v8 >= v9)
            v10 = v4;
          else
            v10 = v3;
          if (v8 >= v9)
            v11 = v7;
          else
            v11 = v5;
          v12 = objc_msgSend(v10, "length");
          v13 = 0;
          v14 = v12 - v11;
          if (v12 != v11)
          {
            while (1)
            {
              v15 = objc_msgSend(v3, "characterAtIndex:", v5 + v13);
              if (v15 != objc_msgSend(v4, "characterAtIndex:", v7 + v13))
                break;
              if (v14 == ++v13)
              {
                v13 = v14;
                break;
              }
            }
          }
          if (v6 <= v13)
            v6 = v13;
          ++v7;
        }
        while (v7 < objc_msgSend(v4, "length"));
      }
      ++v5;
    }
    while (v5 < objc_msgSend(v3, "length"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_20E37F724(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20E37F8E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_20E37F9A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void __getIMOneTimeCodeAcceleratorClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *IMCoreLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SFAppAutoFillOneTimeCodeProvider.m"), 36, CFSTR("%s"), *a1);

  __break(1u);
}

void __getIMOneTimeCodeAcceleratorClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getIMOneTimeCodeAcceleratorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SFAppAutoFillOneTimeCodeProvider.m"), 37, CFSTR("Unable to find class %s"), "IMOneTimeCodeAccelerator");

  __break(1u);
}

void __getEMOneTimeCodeAcceleratorClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *EmailLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SFAppAutoFillOneTimeCodeProvider.m"), 40, CFSTR("%s"), *a1);

  __break(1u);
}

void __getEMOneTimeCodeAcceleratorClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getEMOneTimeCodeAcceleratorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SFAppAutoFillOneTimeCodeProvider.m"), 41, CFSTR("Unable to find class %s"), "EMOneTimeCodeAccelerator");

  __break(1u);
}

void __getNPSManagerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *NanoPreferencesSyncLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SFAutoFillFeatureManager.m"), 59, CFSTR("%s"), *a1);

  __break(1u);
}

void __getNPSManagerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getNPSManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SFAutoFillFeatureManager.m"), 60, CFSTR("Unable to find class %s"), "NPSManager");

  __break(1u);
}

void IMSharedUtilitiesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *IMSharedUtilitiesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("SFAutoFillOneTimeCode.m"), 14, CFSTR("%s"), *a1);

  __break(1u);
}

void extensionAndContainingAppHaveDeveloperEntitlement_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a1;
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_20E365000, v5, v6, "Skipping extension %{public}@ because its containing app is missing the %{public}@ entitlement", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_1();
}

void extensionAndContainingAppHaveDeveloperEntitlement_cold_2(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a1;
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_20E365000, v5, v6, "Skipping extension %{public}@ because it is missing the %{public}@ entitlement", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1_1();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x24BE04668]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t SecCopyLastError()
{
  return MEMORY[0x24BDE89F8]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x24BDE8AC8](key);
}

CFDataRef SecKeyCreateDecryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef ciphertext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8AE8](key, algorithm, ciphertext, error);
}

CFDataRef SecKeyCreateEncryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef plaintext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8B00](key, algorithm, plaintext, error);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x24BDE8B30](parameters, error);
}

uint64_t WBSApplicationIdentifierFromAuditToken()
{
  return MEMORY[0x24BE82E18]();
}

uint64_t WBSIsEqual()
{
  return MEMORY[0x24BE82E88]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _WBSLocalizedString()
{
  return MEMORY[0x24BE82FF8]();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x24BDACB10](dso, description, *(_QWORD *)&flags, activity_block);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
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

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x24BDAF490]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x24BDAF4A8]();
}

int sqlite3_bind_pointer(sqlite3_stmt *a1, int a2, void *a3, const char *a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF90](a1, *(_QWORD *)&a2, a3, a4, a5);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x24BEDE0B0](db, zFunctionName, *(_QWORD *)&nArg, *(_QWORD *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
  MEMORY[0x24BEDE210](a1, *(_QWORD *)&a2);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x24BEDE340](a1);
}

void *__cdecl sqlite3_value_pointer(sqlite3_value *a1, const char *a2)
{
  return (void *)MEMORY[0x24BEDE348](a1, a2);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE358](a1);
}

