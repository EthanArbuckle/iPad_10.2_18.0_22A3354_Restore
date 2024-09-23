void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_6_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 8u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1, uint64_t a2)
{
  return a2;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_5_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void __getUIApplicationClass_block_invoke(uint64_t a1)
{
  UIKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("UIApplication");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUIApplicationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getUIApplicationClass_block_invoke_cold_1();
    UIKitLibrary();
  }
}

void UIKitLibrary()
{
  void *v0;

  if (!UIKitLibraryCore_frameworkLibrary_0)
    UIKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!UIKitLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

id WFWeatherStoreServiceCacheURL(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "infoDictionary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("CFBundleIdentifier"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2, "objectAtIndex:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "stringByAppendingPathComponent:", v1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id AqiScaleForCountryCode(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v1 = a1;
  v2 = v1;
  if (AqiScaleForCountryCode_onceToken != -1)
  {
    dispatch_once(&AqiScaleForCountryCode_onceToken, &__block_literal_global_0);
    if (v2)
      goto LABEL_3;
LABEL_7:
    v6 = (id)AqiScaleForCountryCode_defaultScale;
    goto LABEL_8;
  }
  if (!v1)
    goto LABEL_7;
LABEL_3:
  objc_msgSend((id)AqiScaleForCountryCode_AQIScalesForCountries, "objectForKeyedSubscript:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)AqiScaleForCountryCode_defaultScale;
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

LABEL_8:
  return v6;
}

id AqiScaleFromIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  v2 = v1;
  if (AqiScaleFromIdentifier_onceToken != -1)
  {
    dispatch_once(&AqiScaleFromIdentifier_onceToken, &__block_literal_global_22);
    if (v2)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    goto LABEL_6;
  }
  if (!v1)
    goto LABEL_5;
LABEL_3:
  objc_msgSend((id)AqiScaleFromIdentifier_AQIScalesFromIdentifiers, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v3;
}

id CurrentAqiScale()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "countryCode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  AqiScaleForCountryCode(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

BOOL WFWeatherStoreCacheCheckIfDateIsFreshForStaleness(void *a1, unint64_t a2)
{
  double v4;
  _BOOL8 result;
  double v6;

  objc_msgSend(a1, "timeIntervalSinceNow");
  result = 0;
  if (a1 && a2)
  {
    v6 = v4 / 60.0;
    return v6 >= 0.0 || -v6 < (double)a2;
  }
  return result;
}

void sub_2118A00D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2118A0330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_2118A0988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  objc_destroyWeak(&location);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_2118A15F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2118A1978(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_2118A1CDC(_Unwind_Exception *exception_object, int a2)
{
  id v2;
  NSObject *v3;

  if (a2 == 1)
  {
    v2 = objc_begin_catch(exception_object);
    WFLogForCategory(5uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[WFWeatherStoreCache _concurrentQueue_barrier_loadDomain:].cold.4();

    objc_end_catch();
    JUMPOUT(0x2118A1B0CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_2118A1FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2118A2158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2118A232C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t __WFTemperatureUnitObserverTrampoline(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateTemperatureUnit");
}

void sub_2118A5884(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2118AB8E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_2118ABA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke(uint64_t a1)
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
  result = dlsym(v2, "MKBDeviceUnlockedSinceBoot");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMKBDeviceUnlockedSinceBootSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2118B240C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2118B2534(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2118B2738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  id *v22;
  uint64_t v23;

  objc_destroyWeak(v22);
  _Block_object_dispose(&a22, 8);
  objc_destroyWeak((id *)(v23 - 72));
  _Unwind_Resume(a1);
}

void sub_2118B2BB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2118B2D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

id WeatherFoundationInternalUserDefaults()
{
  if (WeatherFoundationInternalUserDefaults_onceToken != -1)
    dispatch_once(&WeatherFoundationInternalUserDefaults_onceToken, &__block_literal_global_11);
  return (id)WeatherFoundationInternalUserDefaults_result;
}

uint64_t WFTimeOfDayForString(uint64_t a1)
{
  return objc_msgSend(CFSTR("N"), "isEqualToString:", a1);
}

BOOL WFForecastTypeIsRequestedInTypes(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

uint64_t WFForecastTypeIsSingleType(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  WFForecastTypes();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsIndex:", a1);

  return v3;
}

id WFForecastTypes()
{
  if (WFForecastTypes_onceToken != -1)
    dispatch_once(&WFForecastTypes_onceToken, &__block_literal_global_13);
  return (id)WFForecastTypes_Types;
}

uint64_t WFForecastTypesUnknownTypes(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = a1;
  WFForecastTypes();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __WFForecastTypesUnknownTypes_block_invoke;
  v4[3] = &unk_24CCA1AA8;
  v4[4] = &v5;
  objc_msgSend(v1, "enumerateIndexesUsingBlock:", v4);

  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_2118B5858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WFConditionCodeFromLegacyWeatherConditionCode(unint64_t a1)
{
  if (a1 > 0x2F)
    return 0;
  else
    return qword_2118E5C50[a1];
}

uint64_t LegacyWeatherConditionCodeFromWFConditionCode(uint64_t a1, int a2)
{
  uint64_t result;
  BOOL v4;
  uint64_t v5;

  result = 3200;
  switch(a1)
  {
    case 0:
      return result;
    case 2:
      return 1;
    case 3:
      return 2;
    case 4:
      return 3;
    case 5:
      return 4;
    case 6:
      return 5;
    case 7:
      return 6;
    case 8:
      return 7;
    case 9:
      return 8;
    case 10:
      return 9;
    case 11:
      return 10;
    case 12:
      return 11;
    case 13:
      return 12;
    case 14:
      return 13;
    case 15:
      return 14;
    case 16:
      return 15;
    case 17:
      return 16;
    case 18:
      return 17;
    case 19:
      return 18;
    case 20:
      return 19;
    case 21:
      return 20;
    case 22:
      return 21;
    case 23:
      return 22;
    case 24:
      return 23;
    case 25:
      return 24;
    case 26:
      return 25;
    case 27:
      return 26;
    case 29:
      v4 = a2 == 0;
      v5 = 27;
      goto LABEL_33;
    case 31:
      v4 = a2 == 0;
      v5 = 29;
      goto LABEL_33;
    case 33:
      v4 = a2 == 0;
      v5 = 31;
      goto LABEL_33;
    case 35:
      v4 = a2 == 0;
      v5 = 33;
LABEL_33:
      if (v4)
        result = v5;
      else
        result = v5 + 1;
      break;
    case 36:
      result = 35;
      break;
    case 37:
      result = 36;
      break;
    case 38:
      result = 37;
      break;
    case 39:
      result = 38;
      break;
    case 40:
      result = 45;
      break;
    case 41:
      result = 40;
      break;
    case 42:
      result = 41;
      break;
    case 43:
      result = 42;
      break;
    case 44:
      result = 43;
      break;
    case 45:
      result = 47;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

__CFString *NSStringFromWFTemperatureUnit(int a1)
{
  if ((a1 - 1) > 2)
    return 0;
  else
    return off_24CCA1AE8[a1 - 1];
}

BOOL WFTemperatureUnitIsValid(int a1)
{
  return (a1 - 1) < 3;
}

uint64_t WFTemperatureUnitForLocale(void *a1)
{
  void *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  objc_msgSend(a1, "objectForKey:", *MEMORY[0x24BDBCB60]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "BOOLValue"))
    v2 = 2;
  else
    v2 = 1;

  return v2;
}

uint64_t NSStringToWFTemperatureUnit(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = a1;
  if (NSStringToWFTemperatureUnit_onceToken != -1)
    dispatch_once(&NSStringToWFTemperatureUnit_onceToken, &__block_literal_global_15);
  v2 = objc_msgSend(v1, "hash");
  if (v2 == NSStringToWFTemperatureUnit_fahrenheitHash)
  {
    v3 = 1;
  }
  else if (v2 == NSStringToWFTemperatureUnit_kelvinHash)
  {
    v3 = 3;
  }
  else
  {
    v3 = 2 * (v2 == NSStringToWFTemperatureUnit_celsiusHash);
  }

  return v3;
}

uint64_t WFChangeForecastDirectionFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("inc")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("dec")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *NSStringFromWFChangeForecastDirection(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("none");
  if (a1 == 2)
    v1 = CFSTR("dec");
  if (a1 == 1)
    return CFSTR("inc");
  else
    return v1;
}

void sub_2118B87C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WFLogForCategory(unint64_t a1)
{
  if (a1 >= 0xB)
    WFLogForCategory_cold_1();
  if (WFLogForCategory_onceToken != -1)
    dispatch_once(&WFLogForCategory_onceToken, &__block_literal_global_15);
  return (id)WFLogForCategory_logObjects[a1];
}

id WFCacheKeyForForecastType(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  uint64_t v46;

  v5 = a2;
  v6 = a3;
  +[WFWeatherConditions calendar](WFWeatherConditions, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:", +[WFWeatherConditions dateComponentCalendarUnits](WFWeatherConditions, "dateComponentCalendarUnits"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (a1 <= 63)
  {
    switch(a1)
    {
      case 1:
        v10 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "geoLocation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "coordinate");
        NSStringFromCLLocationCoordinate2D(v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("air_quality_%@_%02ld%02ld%04ld%02ld"), v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), objc_msgSend(v8, "hour"));
        goto LABEL_22;
      case 2:
        v24 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "geoLocation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "coordinate");
        NSStringFromCLLocationCoordinate2D(v25, v26);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("current_%@_%02ld%02ld%04ld%02ld"), v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), objc_msgSend(v8, "hour"));
        goto LABEL_22;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_23;
      case 4:
        v27 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "geoLocation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "coordinate");
        NSStringFromCLLocationCoordinate2D(v28, v29);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("hourly_1d_%@_%02ld%02ld%04ld%02ld"), v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), objc_msgSend(v8, "hour"));
        goto LABEL_22;
      case 8:
        v30 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "geoLocation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "coordinate");
        NSStringFromCLLocationCoordinate2D(v31, v32);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("daily_10d_%@_%02ld%02ld%04ld"), v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), v46);
        goto LABEL_22;
      default:
        if (a1 == 16)
        {
          v39 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "geoLocation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "coordinate");
          NSStringFromCLLocationCoordinate2D(v40, v41);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "stringWithFormat:", CFSTR("daily_pollen_10d_%@_%02ld%02ld%04ld"), v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), v46);
        }
        else
        {
          if (a1 != 32)
            goto LABEL_23;
          v18 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "geoLocation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "coordinate");
          NSStringFromCLLocationCoordinate2D(v19, v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringWithFormat:", CFSTR("historical_last24h_%@_%02ld%02ld%04ld"), v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), v46);
        }
        break;
    }
    goto LABEL_22;
  }
  if (a1 <= 511)
  {
    if (a1 == 64)
    {
      v42 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "geoLocation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "coordinate");
      NSStringFromCLLocationCoordinate2D(v43, v44);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "stringWithFormat:", CFSTR("historical_%@_%02ld%02ld%04ld"), v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), v46);
      goto LABEL_22;
    }
    if (a1 == 128)
    {
      v21 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "geoLocation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "coordinate");
      NSStringFromCLLocationCoordinate2D(v22, v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("almanac_%@_%02ld%02ld%04ld"), v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), v46);
      goto LABEL_22;
    }
  }
  else
  {
    switch(a1)
    {
      case 512:
        v33 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "geoLocation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "coordinate");
        NSStringFromCLLocationCoordinate2D(v34, v35);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("change_%@_%02ld%02ld%04ld"), v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), v46);
        goto LABEL_22;
      case 1024:
        v36 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "geoLocation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "coordinate");
        NSStringFromCLLocationCoordinate2D(v37, v38);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR("severe_%@_%02ld%02ld%04ld"), v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), v46);
        goto LABEL_22;
      case 2048:
        v15 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "geoLocation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "coordinate");
        NSStringFromCLLocationCoordinate2D(v16, v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("next_hour_precip_%@_%02ld%02ld%04ld"), v14, objc_msgSend(v8, "month"), objc_msgSend(v8, "day"), objc_msgSend(v8, "year"), v46);
LABEL_22:
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        break;
    }
  }
LABEL_23:

  return v9;
}

uint64_t WFForecastTypeForDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = (void *)MEMORY[0x24BDBCE48];
  v2 = a1;
  objc_msgSend(v1, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 60, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE68], "wf_nowDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:toDate:options:", 16, v6, v2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "day");
  if ((v8 & 0x8000000000000000) != 0)
  {
    v9 = 64;
  }
  else if (v8)
  {
    if (v8 >= 0xA)
      v9 = 128;
    else
      v9 = 8;
  }
  else
  {
    v10 = objc_msgSend(v4, "hour");
    if (v10 == objc_msgSend(v5, "hour"))
    {
      v9 = 258;
    }
    else
    {
      v11 = objc_msgSend(v4, "hour");
      v9 = 4 * (v11 > objc_msgSend(v5, "hour"));
    }
  }

  return v9;
}

uint64_t WFCacheDetailsForForecastType(uint64_t result, uint64_t *a2, uint64_t *a3)
{
  __CFString **v4;
  uint64_t *v5;
  uint64_t *v6;

  if (result <= 15)
  {
    switch(result)
    {
      case 1:
        if (a2)
          *a2 = 60;
        if (!a3)
          return result;
        v4 = WFWeatherStoreAirQualityCacheDomain;
        break;
      case 2:
        if (!a2)
          goto LABEL_25;
        v6 = &WFDefaultAllowedCurrentForecastStaleness;
        goto LABEL_24;
      case 4:
        if (!a2)
          goto LABEL_25;
        v6 = &WFDefaultAllowedHourlyForecastStaleness;
        goto LABEL_24;
      case 8:
        goto LABEL_18;
      default:
        return result;
    }
    goto LABEL_32;
  }
  if (result > 63)
  {
    if (result == 64)
    {
      if (!a2)
      {
LABEL_30:
        if (!a3)
          return result;
        v4 = WFWeatherStoreHistoricalCacheDomain;
        goto LABEL_32;
      }
      v5 = &WFDefaultAllowedHistoricalStaleness;
LABEL_29:
      *a2 = *v5;
      goto LABEL_30;
    }
    if (result == 128)
    {
      if (a2)
        *a2 = 2628000;
      if (a3)
      {
        v4 = WFWeatherStoreAlmanacCacheDomain;
LABEL_32:
        result = objc_retainAutorelease(*v4);
        *a3 = result;
      }
    }
  }
  else
  {
    if (result != 16)
    {
      if (result != 32)
        return result;
      if (!a2)
        goto LABEL_30;
      v5 = &WFDefaultAllowedHourlyForecastStaleness;
      goto LABEL_29;
    }
LABEL_18:
    if (a2)
    {
      v6 = &WFDefaultAllowedDailyForecastStaleness;
LABEL_24:
      *a2 = *v6;
    }
LABEL_25:
    if (a3)
    {
      v4 = WFWeatherStoreForecastCacheDomain;
      goto LABEL_32;
    }
  }
  return result;
}

void sub_2118BDB68(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_2118BF388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  uint64_t v57;

  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose((const void *)(v57 - 256), 8);
  _Block_object_dispose((const void *)(v57 - 208), 8);
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

void sub_2118C00D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_2118C0F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2118C17E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2118C46C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 168), 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Unwind_Resume(a1);
}

id NSStringFromCLLocationCoordinate2D(double a1, double a2)
{
  void *v4;

  if (CLLocationCoordinate2DIsValid(*(CLLocationCoordinate2D *)&a1))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.02f,%.02f"), *(_QWORD *)&a1, *(_QWORD *)&a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

double CLLocationCoordinate2DFromString(void *a1)
{
  double v1;
  void *v2;
  void *v3;
  double v4;
  float v5;
  void *v6;

  v1 = *MEMORY[0x24BDBFB70];
  if (a1)
  {
    objc_msgSend(a1, "componentsSeparatedByString:", CFSTR(","));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "count") == 2)
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "doubleValue");
      v5 = v4;

      objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "doubleValue");

      v1 = v5;
    }

  }
  return v1;
}

void sub_2118CE68C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2118CF1C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2118CF3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIImageClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!UIKitLibraryCore_frameworkLibrary)
  {
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!UIKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("UIImage");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getUIImageClass_block_invoke_cold_1();
    free(v3);
  }
  getUIImageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t WFNetworkEventTypeFromAPIVersion(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("wds_v1")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("twc_v2")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("twc_v3")))
  {
    v2 = 1;
  }
  else
  {
    v2 = 2;
  }

  return v2;
}

id CLPlacemarkClosestToReferenceLocation(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  float v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v5 = 0;
      v9 = *(_QWORD *)v19;
      v10 = -1.0;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v12, "location", (_QWORD)v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "distanceFromLocation:", v13);
          v15 = v14;

          if (v10 < 0.0 || v10 > v15)
          {
            v16 = v12;

            v5 = v16;
            v10 = v15;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

id WFLocationNameForPlacemark(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v1 = a1;
  objc_msgSend(v1, "locality");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (v3)
  {
    objc_msgSend(v1, "locality");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v1, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (!v6)
    {
      v7 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v1, "name");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v4;
LABEL_6:
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

void sub_2118D2834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_2118D2AF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  _Unwind_Resume(exception_object);
}

id WFAggregateCommonRequestSupportedForecastTypes()
{
  if (WFAggregateCommonRequestSupportedForecastTypes_onceToken != -1)
    dispatch_once(&WFAggregateCommonRequestSupportedForecastTypes_onceToken, &__block_literal_global_27);
  return (id)WFAggregateCommonRequestSupportedForecastTypes_AggregateCommonRequestSupportedTypes;
}

void sub_2118D658C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_2118D7840(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_2118D83B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getUIApplicationClass()
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
  v0 = (void *)getUIApplicationClass_softClass;
  v7 = getUIApplicationClass_softClass;
  if (!getUIApplicationClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getUIApplicationClass_block_invoke;
    v3[3] = &unk_24CCA17D8;
    v3[4] = &v4;
    __getUIApplicationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2118D87D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIImageClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  UIKitLibrary();
  result = objc_getClass("UIImage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUIImageClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getUIImageClass_block_invoke_cold_1();
    return (Class)+[WFServiceConnection allAllowedClasses](v3, v4);
  }
  return result;
}

id NSLocaleTemperatureUnitFromWFTemperatureUnit(int a1)
{
  id *v1;

  if (a1 == 1)
  {
    v1 = (id *)MEMORY[0x24BDBCB58];
  }
  else
  {
    if (a1 != 2)
      return 0;
    v1 = (id *)MEMORY[0x24BDBCB50];
  }
  return *v1;
}

uint64_t NSLocaleTemperatureUnitToWFTemperatureUnit(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDBCB58]) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BDBCB50]))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_2118D92FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2118D9430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  uint64_t v16;

  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v16 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_2118D9544(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2118D9664(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

uint64_t UAMeasureUnitFromWFTemperatureUnit(int a1)
{
  unsigned int v1;

  if (a1 == 1)
    v1 = 2561;
  else
    v1 = 2560;
  if (a1 == 3)
    return 2562;
  else
    return v1;
}

double WFConvertTemperature(int a1, int a2, double result)
{
  if (a1 != a2)
  {
    if (a1 == 1)
    {
      result = (result + -32.0) * 0.555555582;
    }
    else if (a1 != 2)
    {
      if (a1 != 3)
        return NAN;
      result = result + -273.149994;
    }
    if (a2 == 3)
      return result + 273.149994;
    if (a2 != 2)
    {
      if (a2 == 1)
        return result * 1.79999995 + 32.0;
      return NAN;
    }
  }
  return result;
}

void sub_2118DA5FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_2118DB3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 224), 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Unwind_Resume(a1);
}

void WFLogForCategory_cold_1()
{
  __assert_rtn("WFLogForCategory", "WFLogging.m", 15, "category < WFLoggingCategoryCount");
}

uint64_t __getUIImageClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return +[NSDictionary(SafeCastParseDictionary) floatValueFromDictionary:forKey:defaultValue:].cold.1(v0);
}

uint64_t __getUIApplicationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[WFServiceConnection cancelRequestWithIdentifier:].cold.1(v0);
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
  MEMORY[0x24BDAC240](ctx, macOut);
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
  MEMORY[0x24BDAC248](ctx, *(_QWORD *)&algorithm, key, keyLength);
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
  MEMORY[0x24BDAC250](ctx, data, dataLength);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
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

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x24BDBC080](center, observer);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x24BDBFA08]((__n128)coord, *(__n128 *)&coord.longitude);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x24BDBCFB0]();
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

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x24BDADC70](iterations, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
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

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x24BDAF470]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

char *__cdecl u_strToUTF8(char *dest, int32_t destCapacity, int32_t *pDestLength, const UChar *src, int32_t srcLength, UErrorCode *pErrorCode)
{
  return (char *)MEMORY[0x24BEDC000](dest, *(_QWORD *)&destCapacity, pDestLength, src, *(_QWORD *)&srcLength, pErrorCode);
}

uint64_t uameasfmt_close()
{
  return MEMORY[0x24BEDC050]();
}

uint64_t uameasfmt_format()
{
  return MEMORY[0x24BEDC058]();
}

uint64_t uameasfmt_open()
{
  return MEMORY[0x24BEDC060]();
}

uint64_t unum_open()
{
  return MEMORY[0x24BEDC208]();
}

uint64_t unum_setAttribute()
{
  return MEMORY[0x24BEDC228]();
}

