void sub_246214048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getTUCallProviderManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
    TelephonyUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("TUCallProviderManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getTUCallProviderManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getTUDialRequestClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
    TelephonyUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("TUDialRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getTUDialRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getTUCallSourceIdentifierSpeakerRouteSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (TelephonyUtilitiesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)TelephonyUtilitiesLibraryCore_frameworkLibrary;
  }
  else
  {
    TelephonyUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)TelephonyUtilitiesLibraryCore_frameworkLibrary;
    if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "TUCallSourceIdentifierSpeakerRoute");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getTUCallSourceIdentifierSpeakerRouteSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_246214A88(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _SCDAAssertionCreateDescriptionOfProperties(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  void *v20;
  void *v21;

  v1 = (objc_class *)MEMORY[0x24BDD17C8];
  v2 = a1;
  v19 = [v1 alloc];
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v21, "timestamp");
  objc_msgSend(v2, "context");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectiveDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "effectiveDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceNow");
  v11 = v10;
  objc_msgSend(v2, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "expirationDuration");
  v14 = v13;
  objc_msgSend(v2, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("uuid = %@, timestamp = %llu, reason = %@, effectiveDate = %@ (%f), expirationDuration = %f, userInfo = %@"), v3, v4, v5, v7, v11, v14, v16);

  return v17;
}

void sub_24621A9D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24621AE1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  id *v23;

  _Block_object_dispose(&a23, 8);
  objc_destroyWeak(v23);
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

void SCDALogInitIfNeeded()
{
  if (SCDALogInitIfNeeded_once != -1)
    dispatch_once(&SCDALogInitIfNeeded_once, &__block_literal_global_512);
}

id SCDALogForCategory(int a1)
{
  if (SCDALogForCategory_onceToken != -1)
    dispatch_once(&SCDALogForCategory_onceToken, &__block_literal_global_3);
  return (id)SCDALogForCategory_oslog[a1];
}

void extractMyriadDataFromAudioContext(void *a1, _WORD *a2, _BYTE *a3, _BYTE *a4, _QWORD *a5, _BYTE *a6)
{
  id v11;
  void *v12;
  int v13;
  unsigned __int16 v14;
  NSObject *v15;
  NSObject *v16;
  unint64_t v17;
  uint64_t v18;
  _BYTE buf[12];
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v11 = a1;
  v12 = v11;
  if (!v11 || (unint64_t)objc_msgSend(v11, "length") < 4)
  {
    v15 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "extractMyriadDataFromAudioContext";
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_246211000, v15, OS_LOG_TYPE_INFO, "%s SCDARecord invalid data during init: %@", buf, 0x16u);
    }
    if (a2)
      *a2 = 0;
    if (a3)
      *a3 = 0;
    if (a4)
      *a4 = 0;
    goto LABEL_32;
  }
  if (!a2)
    goto LABEL_28;
  v13 = (unsigned __int16)arc4random_uniform(0x10000u);
  while (!v13 || v13 == (unsigned __int16)*a2)
  {
    v14 = arc4random_uniform(0x10000u);
    if ((v14 & 0xFFFB) == 0xF0)
      goto LABEL_11;
    v13 = v14;
    if (v14 > 0xF9F8u)
    {
      if (v14 == 63993 || v14 == 0xFFFF)
        goto LABEL_11;
    }
    else if (v14 - 208 <= 0x2F && ((1 << (v14 + 48)) & 0x830080010001) != 0 || !v14)
    {
LABEL_11:
      v13 = 0;
    }
  }
  v16 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "_generateRandomHash";
    v20 = 1024;
    LODWORD(v21) = v13;
    _os_log_impl(&dword_246211000, v16, OS_LOG_TYPE_INFO, "%s Generated myriad hash: %hu", buf, 0x12u);
  }
  *a2 = v13;
LABEL_28:
  if (a3)
    objc_msgSend(v12, "getBytes:range:", a3, 2, 1);
  if (a4)
    objc_msgSend(v12, "getBytes:range:", a4, 3, 1);
LABEL_32:
  if (a5)
  {
    *(_QWORD *)buf = 0;
    v17 = objc_msgSend(v12, "length");
    v18 = 0;
    if (v17 >= 0xC)
    {
      objc_msgSend(v12, "getBytes:range:", buf, 4, 8, 0.0);
      v18 = *(_QWORD *)buf;
    }
    *a5 = v18;
  }
  if (a6)
  {
    if ((unint64_t)objc_msgSend(v12, "length") < 0xD)
      *a6 = 0;
    else
      objc_msgSend(v12, "getBytes:range:", a6, 12, 1);
  }

}

void _SCDAAssistantPreferencesSetValueForKeyWithContext(void *a1, const __CFString *a2, const __CFString *a3, void *a4)
{
  void *v7;
  __CFString *v8;
  id value;

  value = a1;
  objc_msgSend(a4, "preferencesSubdomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@/%@"), v7, a2);
    CFPreferencesSetAppValue(v8, value, a3);

  }
  else
  {
    CFPreferencesSetAppValue(a2, value, a3);
  }

}

id _SCDAAssistantPreferencesValueForKeyWithContext(const __CFString *a1, const __CFString *a2, void *a3)
{
  void *v5;
  __CFString *v6;
  void *v7;

  objc_msgSend(a3, "preferencesSubdomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@/%@"), v5, a1);
    v7 = (void *)CFPreferencesCopyAppValue(v6, a2);

  }
  else
  {
    v7 = (void *)CFPreferencesCopyAppValue(a1, a2);
  }

  return v7;
}

uint64_t _SCDAAssistantPreferencesBoolFromValueWithDefault(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    a3 = objc_msgSend(v5, "BOOLValue");
  }
  else if (v5)
  {
    v6 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315906;
      v9 = "_SCDAAssistantPreferencesBoolFromValueWithDefault";
      v10 = 1024;
      v11 = a3;
      v12 = 2112;
      v13 = a2;
      v14 = 2112;
      v15 = v5;
      _os_log_error_impl(&dword_246211000, v6, OS_LOG_TYPE_ERROR, "%s Expected a value responding to -BOOLValue, but found something else. Returning %{BOOL}d. {key: %@, value: %@}", (uint8_t *)&v8, 0x26u);
    }
  }

  return a3;
}

uint64_t _SCDAAssistantPreferencesDidChangeCallback(uint64_t a1, void *a2)
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "_SCDAAssistantPreferencesDidChangeCallback";
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s Preferences Changed!", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(a2, "_preferencesDidChangeExternally");
}

void _SCDAAssistantPreferencesSetValueForKey(void *a1, const __CFString *a2)
{
  _SCDAAssistantPreferencesSetValueForKeyWithContext(a1, a2, CFSTR("com.apple.assistant"), 0);
}

id _SCDAAssistantPreferencesValueForKey(const __CFString *a1)
{
  return _SCDAAssistantPreferencesValueForKeyWithContext(a1, CFSTR("com.apple.assistant"), 0);
}

uint64_t SCDASupportPreferencesSynchronize()
{
  return CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.support"));
}

uint64_t SCDABackedUpPreferencesSynchronize()
{
  return CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.backedup"));
}

uint64_t SCDAInternalPreferencesSynchronize()
{
  return CFPreferencesAppSynchronize(CFSTR("com.apple.assistant"));
}

double SCDAMaxNoOperationDelay()
{
  if (SCDAMaxNoOperationDelay_onceToken != -1)
    dispatch_once(&SCDAMaxNoOperationDelay_onceToken, &__block_literal_global_1009);
  return *(double *)&SCDAMaxNoOperationDelay_noopDelay;
}

uint64_t SCDAMaxNoOperationAccessoryMessageCount()
{
  return 3;
}

double SCDADecisionGetWaitTime()
{
  return 2.9000001;
}

double SCDAMonitorDecisionGetWaitTime()
{
  return 5.80000019;
}

double SCDAPreheatGetWaitTime()
{
  return 2.0;
}

void sub_246220B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1106(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1107(uint64_t a1)
{

}

uint64_t SCDAAssertionRelinquishmentOptionsValidate(char a1)
{
  return a1 & 1;
}

id SCDAAssertionRelinquishmentOptionsGetNames(uint64_t a1)
{
  char v1;
  id v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v3 = v2;
    if ((v1 & 1) != 0)
      objc_msgSend(v2, "addObject:", CFSTR("inactiveOnly"));
    v4 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v4;
}

uint64_t SCDAAssertionRelinquishmentOptionsGetFromNames(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v12 = v1;
    v2 = v1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = *(_QWORD *)v14;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v2);
          v8 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * v7);
          if (objc_msgSend(v8, "length"))
          {
            if (_SCDAAssertionRelinquishmentOptionsGetFromName_onceToken != -1)
              dispatch_once(&_SCDAAssertionRelinquishmentOptionsGetFromName_onceToken, &__block_literal_global_1223);
            objc_msgSend((id)_SCDAAssertionRelinquishmentOptionsGetFromName_map, "objectForKey:", v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "unsignedIntegerValue");

          }
          else
          {
            v10 = 0;
          }

          v5 |= v10;
          ++v7;
        }
        while (v4 != v7);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v4);
    }
    else
    {
      v5 = 0;
    }

    v1 = v12;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_246222E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2462230F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_MKBGetDeviceLockState()
{
  uint64_t (*v0)(_QWORD);
  _Unwind_Exception *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (uint64_t (*)(_QWORD))getMKBGetDeviceLockStateSymbolLoc_ptr;
  v7 = getMKBGetDeviceLockStateSymbolLoc_ptr;
  if (!getMKBGetDeviceLockStateSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMKBGetDeviceLockStateSymbolLoc_block_invoke;
    v3[3] = &unk_25174AB98;
    v3[4] = &v4;
    __getMKBGetDeviceLockStateSymbolLoc_block_invoke((uint64_t)v3);
    v0 = (uint64_t (*)(_QWORD))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v2 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v2);
  }
  return v0(0);
}

void *__getMKBGetDeviceLockStateSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
  }
  else
  {
    MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
    if (!MobileKeyBagLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "MKBGetDeviceLockState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMKBGetDeviceLockStateSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SCDAIsInternalInstall()
{
  if (SCDAIsInternalInstall_onceToken != -1)
    dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1256);
  return SCDAIsInternalInstall_isInternal;
}

dispatch_queue_t SCDADispatchSerialQueueWithRelativePriority(const char *a1, dispatch_qos_class_t a2, int a3)
{
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v6, a2, a3);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = dispatch_queue_create(a1, v7);
  return v8;
}

dispatch_queue_t SCDADispatchSerialQueueWithQOS(const char *a1, dispatch_qos_class_t a2)
{
  return SCDADispatchSerialQueueWithRelativePriority(a1, a2, 0);
}

uint64_t SCDASupportsHAL()
{
  return +[SCDAUtilities isNano](SCDAUtilities, "isNano") ^ 1;
}

id SCDAProductType()
{
  return (id)MGCopyAnswer();
}

dispatch_time_t SCDADispatchTimeGetFromDateAndOffset(void *a1, double a2)
{
  long double v3;
  long double v4;
  float64x2_t v5;
  timespec v7;
  float64_t __y;

  if (!a1)
    return dispatch_walltime(0, (uint64_t)(a2 * 1000000000.0));
  __y = 0.0;
  objc_msgSend(a1, "timeIntervalSince1970");
  v4 = modf(v3, (long double *)&__y);
  v5.f64[0] = __y;
  v5.f64[1] = v4 * 1000000000.0;
  v7 = (timespec)vcvtq_s64_f64(vminnmq_f64(vmaxnmq_f64(v5, (float64x2_t)vdupq_n_s64(0xC3E0000000000000)), (float64x2_t)vdupq_n_s64(0x43E0000000000000uLL)));
  return dispatch_walltime(&v7, (uint64_t)(a2 * 1000000000.0));
}

double SCDAMachAbsoluteTimeGetTimeInterval(unint64_t a1)
{
  if (_SCDAMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_28);
  return *(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)a1 / 1000000000.0;
}

unint64_t SCDAMachAbsoluteTimeGetMilliseconds(unint64_t a1)
{
  if (_SCDAMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_28);
  return (unint64_t)(*(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)a1 / 1000000.0);
}

unint64_t SCDAMachAbsoluteTimeGetNanoseconds(unint64_t a1)
{
  if (_SCDAMachAbsoluteTimeRate_onceToken != -1)
    dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_28);
  return (unint64_t)(*(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)a1);
}

id SCDAToSISchemaUUID(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;

  if (a1)
  {
    v1 = (objc_class *)MEMORY[0x24BE95C78];
    v2 = a1;
    v3 = (void *)objc_msgSend([v1 alloc], "initWithNSUUID:", v2);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

BOOL SCDAGoodnessScoreOverrideOptionGetIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL SCDAGoodnessScoreOverrideOptionGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

const __CFString *SCDAGoodnessScoreOverrideOptionGetName(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_25174A470[a1];
}

uint64_t SCDAGoodnessScoreOverrideOptionGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SCDAGoodnessScoreOverrideOptionGetFromName_onceToken != -1)
      dispatch_once(&SCDAGoodnessScoreOverrideOptionGetFromName_onceToken, &__block_literal_global_1520);
    objc_msgSend((id)SCDAGoodnessScoreOverrideOptionGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_2462273F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, char a16)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a16, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1644(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1645(uint64_t a1)
{

}

unsigned int SCDAGoodnessComputeExponentialBoost(double a1, double a2, double a3, double a4, double a5)
{
  double v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = exp(-((a2 - a1) * a4 + a3 * ((a2 - a1) * (a2 - a1)) + a5));
  v6 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "SCDAGoodnessComputeExponentialBoost";
    v10 = 2048;
    v11 = v5;
    _os_log_impl(&dword_246211000, v6, OS_LOG_TYPE_INFO, "%s #scda exponential bump %f", (uint8_t *)&v8, 0x16u);
  }
  return llround(v5);
}

BOOL SCDAGoodnessScoreBumpReasonGetIsValid(unint64_t a1)
{
  return a1 < 4;
}

BOOL SCDAGoodnessScoreBumpReasonGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 3;
}

const __CFString *SCDAGoodnessScoreBumpReasonGetName(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("(unknown)");
  else
    return off_25174A4D0[a1];
}

uint64_t SCDAGoodnessScoreBumpReasonGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SCDAGoodnessScoreBumpReasonGetFromName_onceToken != -1)
      dispatch_once(&SCDAGoodnessScoreBumpReasonGetFromName_onceToken, &__block_literal_global_1705);
    objc_msgSend((id)SCDAGoodnessScoreBumpReasonGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

SCDANotifyStatePublisher *SCDAElectionBeginNotifyStatePublisher(void *a1, void *a2)
{
  return publisherWithNotificationName((uint64_t)"com.apple.siri.myriad.decision.begin", a1, a2);
}

SCDANotifyStatePublisher *publisherWithNotificationName(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  SCDANotifyStatePublisher *v7;

  v5 = a3;
  getEffectiveNotificationName(a1, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SCDANotifyStatePublisher initWithName:queue:]([SCDANotifyStatePublisher alloc], "initWithName:queue:", v6, v5);

  return v7;
}

id getEffectiveNotificationName(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int IsValidAndSpecified;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a2;
  objc_msgSend(v3, "stringWithCString:encoding:", a1, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "applicationType");
  IsValidAndSpecified = AFInstanceApplicationTypeGetIsValidAndSpecified();
  if (v7 != 1 && IsValidAndSpecified)
  {
    AFInstanceApplicationTypeGetName();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(".%@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "applicationUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(".%@"), v13);
      v14 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v14;
    }

    v5 = v10;
  }

  return v5;
}

SCDANotifyStatePublisher *SCDAElectionWinNotifyStatePublisher(void *a1, void *a2)
{
  return publisherWithNotificationName((uint64_t)"com.apple.siri.myriad.decision.won", a1, a2);
}

SCDANotifyStatePublisher *SCDAElectionLossNotifyStatePublisher(void *a1, void *a2)
{
  return publisherWithNotificationName((uint64_t)"com.apple.siri.myriad.decision.lost", a1, a2);
}

SCDANotifyStatePublisher *SCDAElectionRepostWinDecisionNotifyStatePublisher(void *a1, void *a2)
{
  return publisherWithNotificationName((uint64_t)"com.apple.siri.myriad.repost.decision.won", a1, a2);
}

SCDANotifyStatePublisher *SCDAPreferencesChangedNotifyStatePublisher(void *a1, void *a2)
{
  return publisherWithNotificationName((uint64_t)"com.apple.siri.myriad.readdefaults", a1, a2);
}

id SCDAForceNoActivityNotifyStatePublisher(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (void *)SCDA_MYRIAD_FORCE_NO_ACTIVITY_NOTIFICATION;
  v4 = a2;
  v5 = a1;
  publisherWithNotificationName(objc_msgSend(v3, "UTF8String"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

SCDANotifyObserver *SCDAElectionBeginNotifyStateObserver(void *a1, uint64_t a2, void *a3, void *a4)
{
  return observerWithNotificationName((uint64_t)"com.apple.siri.myriad.decision.begin", a1, a2, a3, a4);
}

SCDANotifyObserver *observerWithNotificationName(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  SCDANotifyObserver *v12;

  v9 = a5;
  v10 = a4;
  getEffectiveNotificationName(a1, a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SCDANotifyObserver initWithName:options:queue:delegate:]([SCDANotifyObserver alloc], "initWithName:options:queue:delegate:", v11, a3, v9, v10);

  return v12;
}

SCDANotifyObserver *SCDAElectionWinNotifyStateObserver(void *a1, uint64_t a2, void *a3, void *a4)
{
  return observerWithNotificationName((uint64_t)"com.apple.siri.myriad.decision.won", a1, a2, a3, a4);
}

SCDANotifyObserver *SCDAElectionLossNotifyStateObserver(void *a1, uint64_t a2, void *a3, void *a4)
{
  return observerWithNotificationName((uint64_t)"com.apple.siri.myriad.decision.lost", a1, a2, a3, a4);
}

SCDANotifyObserver *SCDAElectionDecisionRequestNotifyStateObserver(void *a1, uint64_t a2, void *a3, void *a4)
{
  return observerWithNotificationName((uint64_t)"com.apple.siri.myriad.get.decision", a1, a2, a3, a4);
}

SCDANotifyObserver *SCDAElectionRepostWinDecisionNotifyStateObserver(void *a1, uint64_t a2, void *a3, void *a4)
{
  return observerWithNotificationName((uint64_t)"com.apple.siri.myriad.repost.decision.won", a1, a2, a3, a4);
}

SCDANotifyObserver *SCDAPreferencesChangedNotifyStateObserver(void *a1, uint64_t a2, void *a3, void *a4)
{
  return observerWithNotificationName((uint64_t)"com.apple.siri.myriad.readdefaults", a1, a2, a3, a4);
}

id SCDAForceNoActivityNotifyStateObserver(void *a1, uint64_t a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = (void *)SCDA_MYRIAD_FORCE_NO_ACTIVITY_NOTIFICATION;
  v8 = a4;
  v9 = a3;
  v10 = a1;
  observerWithNotificationName(objc_msgSend(v7, "UTF8String"), v10, a2, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id SCDAReadDefaultsNotificationName(void *a1)
{
  return getEffectiveNotificationName((uint64_t)"com.apple.siri.myriad.readdefaults", a1);
}

void sub_246229E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v20);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void notificationNearMissCallback(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "notificationNearMissCallback";
    _os_log_impl(&dword_246211000, v3, OS_LOG_TYPE_INFO, "%s #scda #feedback near miss!", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(v2, "_publishFeedbackArbitrationRecordForNearMiss");

}

void sub_24622CCB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24622F550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a64;

  _Block_object_dispose(&a64, 8);
  _Unwind_Resume(a1);
}

void sub_246230D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24623340C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_246234414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_2462364CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_246236B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getWPHeySiriKeyManufacturerData()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getWPHeySiriKeyManufacturerDataSymbolLoc_ptr;
  v7 = getWPHeySiriKeyManufacturerDataSymbolLoc_ptr;
  if (!getWPHeySiriKeyManufacturerDataSymbolLoc_ptr)
  {
    v1 = (void *)WirelessProximityLibrary();
    v0 = (id *)dlsym(v1, "WPHeySiriKeyManufacturerData");
    v5[3] = (uint64_t)v0;
    getWPHeySiriKeyManufacturerDataSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

uint64_t WirelessProximityLibrary()
{
  uint64_t v0;
  void *v2;

  if (WirelessProximityLibraryCore_frameworkLibrary)
    return WirelessProximityLibraryCore_frameworkLibrary;
  WirelessProximityLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = WirelessProximityLibraryCore_frameworkLibrary;
  if (!WirelessProximityLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getSFDiagnosticsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SharingLibraryCore_frameworkLibrary)
  {
    SharingLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SharingLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SFDiagnostics");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getSFDiagnosticsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getWPHeySiriAdvertisingData()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getWPHeySiriAdvertisingDataSymbolLoc_ptr;
  v7 = getWPHeySiriAdvertisingDataSymbolLoc_ptr;
  if (!getWPHeySiriAdvertisingDataSymbolLoc_ptr)
  {
    v1 = (void *)WirelessProximityLibrary();
    v0 = (id *)dlsym(v1, "WPHeySiriAdvertisingData");
    v5[3] = (uint64_t)v0;
    getWPHeySiriAdvertisingDataSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

uint64_t __Block_byref_object_copy__2296(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2297(uint64_t a1)
{

}

id safelyGetAudioData()
{
  void *v0;
  void *v1;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  int v10;
  ssize_t v11;
  void *v12;
  uint8_t *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  double v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  unsigned __int8 v27;
  unint64_t v28;
  __int16 v29;
  unsigned __int16 v30;
  uint64_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  _BYTE v37[10];
  __int16 v38;
  int v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  int v43;
  _BYTE v44[13];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  NSHomeDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Library/VoiceTrigger"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    v33 = "SCDACoordinatorAudioHashFileBaseDirectory";
    v34 = 2113;
    v35 = (uint64_t)v1;
    _os_log_impl(&dword_246211000, v2, OS_LOG_TYPE_INFO, "%s BTLE audio hash base directory %{private}@", buf, 0x16u);
  }

  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("siriBC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    v33 = "SCDACoordinatorAudioHashFilePath";
    v34 = 2113;
    v35 = (uint64_t)v3;
    _os_log_impl(&dword_246211000, v4, OS_LOG_TYPE_INFO, "%s BTLE audio hash file path %{private}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "fileExistsAtPath:", v3))
    v6 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
  else
    v6 = 0;

  v7 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    v33 = "safelyGetAudioData";
    v34 = 2081;
    v35 = (uint64_t)v6;
    _os_log_impl(&dword_246211000, v7, OS_LOG_TYPE_INFO, "%s #scda BTLE opening audio file at path %{private}s", buf, 0x16u);
  }
  if (v6)
  {
    v8 = open(v6, 0);
    v9 = SCDALogContextCore;
    if ((v8 & 0x80000000) == 0)
    {
      v10 = v8;
      if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "safelyGetAudioData";
        v34 = 1024;
        LODWORD(v35) = 12;
        _os_log_error_impl(&dword_246211000, v9, OS_LOG_TYPE_ERROR, "%s #scda BTLE could open audio data file, MYR_EXT_FINGERPRINT_LEN: %d", buf, 0x12u);
      }
      v11 = read(v10, v44, 0xDuLL);
      switch(v11)
      {
        case 4:
          v12 = (void *)MEMORY[0x24BDBCE50];
          v13 = v44;
          break;
        case 13:
          v12 = (void *)MEMORY[0x24BDBCE50];
          v13 = v44;
          v14 = 13;
          goto LABEL_28;
        case 12:
          v12 = (void *)MEMORY[0x24BDBCE50];
          v13 = v44;
          v14 = 12;
LABEL_28:
          objc_msgSend(v12, "dataWithBytes:length:", v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          close(v10);
          v31 = 0;
          if ((unint64_t)objc_msgSend(v15, "length") >= 0xC)
            objc_msgSend(v15, "getBytes:range:", &v31, 4, 8);
          v30 = 0;
          v29 = 0;
          v28 = 0;
          v27 = 0;
          objc_msgSend(v15, "getBytes:range:", &v30, 0, 2);
          objc_msgSend(v15, "getBytes:range:", (char *)&v29 + 1, 2, 1);
          objc_msgSend(v15, "getBytes:range:", &v29, 3, 1);
          if ((unint64_t)objc_msgSend(v15, "length") >= 0xC)
            objc_msgSend(v15, "getBytes:range:", &v28, 4, 8);
          if ((unint64_t)objc_msgSend(v15, "length") >= 0xD)
            objc_msgSend(v15, "getBytes:range:", &v27, 12, 1);
          v17 = SCDALogContextCore;
          if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
          {
            v23 = v17;
            objc_msgSend(v15, "debugDescription");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v33 = "safelyGetAudioData";
            v34 = 2112;
            v35 = (uint64_t)v24;
            v36 = 2048;
            *(_QWORD *)v37 = v31;
            _os_log_debug_impl(&dword_246211000, v23, OS_LOG_TYPE_DEBUG, "%s data=%@, voiceTriggerTimeRaw=%f", buf, 0x20u);

            v17 = SCDALogContextCore;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            v25 = v17;
            objc_msgSend(v15, "debugDescription");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316674;
            v33 = "safelyGetAudioData";
            v34 = 2112;
            v35 = (uint64_t)v26;
            v36 = 1024;
            *(_DWORD *)v37 = v30;
            *(_WORD *)&v37[4] = 1024;
            *(_DWORD *)&v37[6] = HIBYTE(v29);
            v38 = 1024;
            v39 = v29;
            v40 = 2048;
            v41 = v28;
            v42 = 1024;
            v43 = v27;
            _os_log_debug_impl(&dword_246211000, v25, OS_LOG_TYPE_DEBUG, "%s data=%@, hash=%hu, good=%hu, conf=%hu, absTime=%llu, frac=%hu", buf, 0x38u);

          }
          v18 = mach_absolute_time();
          if (_SCDAMachAbsoluteTimeRate_onceToken != -1)
            dispatch_once(&_SCDAMachAbsoluteTimeRate_onceToken, &__block_literal_global_28);
          v19 = *(double *)&_SCDAMachAbsoluteTimeRate_rate;
          v20 = v28;
          v21 = SCDALogContextCore;
          if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v33 = "safelyGetAudioData";
            v34 = 2048;
            v35 = v18;
            v36 = 2048;
            *(double *)v37 = v19 * (double)v18 / 1000000000.0
                           - *(double *)&_SCDAMachAbsoluteTimeRate_rate * (double)v20 / 1000000000.0;
            _os_log_impl(&dword_246211000, v21, OS_LOG_TYPE_INFO, "%s currentTime=%llu timeSinceActivationInSeconds=%f", buf, 0x20u);
          }
          goto LABEL_42;
        default:
          v16 = SCDALogContextCore;
          if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v33 = "safelyGetAudioData";
            _os_log_error_impl(&dword_246211000, v16, OS_LOG_TYPE_ERROR, "%s #scda BTLE could not read 4 bytes from audio data file", buf, 0xCu);
          }
          *(_DWORD *)buf = 0;
          v12 = (void *)MEMORY[0x24BDBCE50];
          v13 = buf;
          break;
      }
      v14 = 4;
      goto LABEL_28;
    }
  }
  else
  {
    v9 = SCDALogContextCore;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "safelyGetAudioData";
    _os_log_impl(&dword_246211000, v9, OS_LOG_TYPE_INFO, "%s #scda BTLE could not open audio data file", buf, 0xCu);
  }
  *(_DWORD *)buf = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_42:

  return v15;
}

uint64_t notificationCallback()
{
  NSObject *v0;
  uint64_t result;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  v0 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v2 = 136315138;
    v3 = "notificationCallback";
    _os_log_impl(&dword_246211000, v0, OS_LOG_TYPE_INFO, "%s #scda BTLE audio data signal received", (uint8_t *)&v2, 0xCu);
  }
  result = _currentCoordinator;
  if (_currentCoordinator)
    return objc_msgSend((id)_currentCoordinator, "startAdvertisingFromVoiceTrigger");
  return result;
}

uint64_t outputTriggerSeenCallback()
{
  NSObject *v0;
  uint64_t result;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v0 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v2 = 136315138;
    v3 = "outputTriggerSeenCallback";
    _os_log_impl(&dword_246211000, v0, OS_LOG_TYPE_INFO, "%s #scda BTLE self trigger signal received", (uint8_t *)&v2, 0xCu);
  }
  result = _currentCoordinator;
  if (_currentCoordinator)
    return objc_msgSend((id)_currentCoordinator, "startAdvertisingFromOutgoingTrigger");
  return result;
}

uint64_t emergencyCallback()
{
  NSObject *v0;
  uint64_t result;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v0 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v2 = 136315138;
    v3 = "emergencyCallback";
    _os_log_impl(&dword_246211000, v0, OS_LOG_TYPE_INFO, "%s #scda BTLE emergency signal received", (uint8_t *)&v2, 0xCu);
  }
  result = _currentCoordinator;
  if (_currentCoordinator)
    return objc_msgSend((id)_currentCoordinator, "startAdvertisingEmergency");
  return result;
}

uint64_t myriadDecisionRequestCallback()
{
  NSObject *v0;
  uint64_t result;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v0 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v2 = 136315138;
    v3 = "myriadDecisionRequestCallback";
    _os_log_impl(&dword_246211000, v0, OS_LOG_TYPE_INFO, "%s #scda BTLE myriad decision fetch signal received", (uint8_t *)&v2, 0xCu);
  }
  result = _currentCoordinator;
  if (_currentCoordinator)
    return objc_msgSend((id)_currentCoordinator, "notifyCurrentDecisionResult");
  return result;
}

uint64_t inEarTriggerSeenCallback()
{
  NSObject *v0;
  uint64_t result;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v0 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v2 = 136315138;
    v3 = "inEarTriggerSeenCallback";
    _os_log_impl(&dword_246211000, v0, OS_LOG_TYPE_INFO, "%s #scda BTLE in ear trigger signal received", (uint8_t *)&v2, 0xCu);
  }
  result = _currentCoordinator;
  if (_currentCoordinator)
    return objc_msgSend((id)_currentCoordinator, "startAdvertisingFromInEarTrigger");
  return result;
}

uint64_t carplayTriggerSeenCallback()
{
  NSObject *v0;
  uint64_t result;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v0 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v2 = 136315138;
    v3 = "carplayTriggerSeenCallback";
    _os_log_impl(&dword_246211000, v0, OS_LOG_TYPE_INFO, "%s #scda BTLE CarPlay trigger signal received", (uint8_t *)&v2, 0xCu);
  }
  result = _currentCoordinator;
  if (_currentCoordinator)
    return objc_msgSend((id)_currentCoordinator, "startAdvertisingFromCarPlayTrigger");
  return result;
}

Class __getWPHeySiriClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  WirelessProximityLibrary();
  result = objc_getClass("WPHeySiri");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getWPHeySiriClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__36__SCDACoordinator_initWithDelegate___block_invoke(v3);
  }
  return result;
}

uint64_t hammingDistance(int a1, int a2)
{
  int v2;
  uint64_t result;

  v2 = a2 ^ a1;
  if (a2 == a1)
    return 0;
  LODWORD(result) = 0;
  do
  {
    result = (result + 1);
    v2 &= v2 - 1;
  }
  while (v2);
  return result;
}

BOOL SCDAAdvertisementRecordTypeGetIsValid(unint64_t a1)
{
  return a1 < 0xB;
}

BOOL SCDAAdvertisementRecordTypeGetIsValidAndSpecified(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 0xA;
}

const __CFString *SCDAAdvertisementRecordTypeGetName(unint64_t a1)
{
  if (a1 > 0xA)
    return CFSTR("(unknown)");
  else
    return *(&off_25174AE10 + a1);
}

uint64_t SCDAAdvertisementRecordTypeGetFromName(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (SCDAAdvertisementRecordTypeGetFromName_onceToken != -1)
      dispatch_once(&SCDAAdvertisementRecordTypeGetFromName_onceToken, &__block_literal_global_2597);
    objc_msgSend((id)SCDAAdvertisementRecordTypeGetFromName_map, "objectForKey:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "integerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t AFInstanceApplicationTypeGetIsValidAndSpecified()
{
  return MEMORY[0x24BE08D48]();
}

uint64_t AFInstanceApplicationTypeGetName()
{
  return MEMORY[0x24BE08D50]();
}

uint64_t AFSiriActivationSourceGetName()
{
  return MEMORY[0x24BE08F78]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC328](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC330](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x24BDD8718](AssertionType, *(_QWORD *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x24BDD8740](*(_QWORD *)&AssertionID);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x24BED8488]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
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

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x24BDADEE0](queue);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x24BDADFD8](source);
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

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x24BDAE008](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x24BDAEFB0](__y, __x);
  return result;
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x24BDAF198](*(_QWORD *)&token, state64);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x24BDB0328](uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0348](uu, out);
}

