void sub_246FF7B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL _AFConnectionIsErrorDeallocation(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;

  v1 = a1;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE09488]))
    v3 = objc_msgSend(v1, "code") == 24;
  else
    v3 = 0;

  return v3;
}

void sub_246FFA8FC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_246FFAF38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_246FFC584(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _EmitHomePodLaunchContextTime(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (WL_AFIsHorseman())
  {
    if (v9)
    {
      if (v10)
      {
        v11 = objc_msgSend(v10, "activationEventMachAbsoluteTime");
        v12 = mach_absolute_time();
        v13 = *MEMORY[0x24BE08FB0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
        {
          v18 = 136316162;
          v19 = "_EmitHomePodLaunchContextTime";
          v20 = 2112;
          v21 = v8;
          v22 = 2112;
          v23 = v9;
          v24 = 2048;
          v25 = v11;
          v26 = 2048;
          v27 = v12;
          _os_log_impl(&dword_246FF4000, v13, OS_LOG_TYPE_INFO, "%s Logging instrumentation for requestUUID = %@ turnId = %@ HomePod launch: (startTime = %llu endTime = %llu)", (uint8_t *)&v18, 0x34u);
        }
        v14 = objc_alloc_init(MEMORY[0x24BE95BE0]);
        v15 = objc_alloc_init(MEMORY[0x24BE95BF0]);
        objc_msgSend(v15, "setExists:", 1);
        objc_msgSend(v14, "setStartedOrChanged:", v15);
        objc_msgSend(v14, "setHasStartedOrChanged:", 1);
        objc_msgSend(v7, "logInstrumentation:machAbsoluteTime:turnIdentifier:", v14, v11, v9);
        v16 = objc_alloc_init(MEMORY[0x24BE95BE0]);
        v17 = objc_alloc_init(MEMORY[0x24BE95BE8]);
        objc_msgSend(v17, "setExists:", 1);
        objc_msgSend(v16, "setEnded:", v17);
        objc_msgSend(v16, "setHasEnded:", 1);
        objc_msgSend(v7, "logInstrumentation:machAbsoluteTime:turnIdentifier:", v16, v12, v9);

      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      {
        _EmitHomePodLaunchContextTime_cold_2();
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      _EmitHomePodLaunchContextTime_cold_1();
    }
  }

}

void _LogUEIRequestCategorization(void *a1, uint64_t a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;

  if (a1)
  {
    v5 = (objc_class *)MEMORY[0x24BE95BF8];
    v6 = a1;
    v8 = objc_alloc_init(v5);
    objc_msgSend(v8, "setRequestStatus:", a2);
    objc_msgSend(v8, "setRequestType:", a3);
    objc_msgSend(MEMORY[0x24BE090C8], "sharedAnalytics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logInstrumentation:machAbsoluteTime:turnIdentifier:", v8, mach_absolute_time(), v6);

  }
}

const __CFString *_AFConnectionGetBucketStringFromTimeIntervals(double a1, double a2)
{
  double v2;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  if (a1 <= 0.0)
  {
    if (a2 <= 0.0)
      return CFSTR("no_start_and_stop");
    else
      return CFSTR("no_start");
  }
  else if (a2 <= 0.0)
  {
    return CFSTR("no_stop");
  }
  else
  {
    v2 = a2 - a1;
    if (v2 >= 0.0)
    {
      if (v2 >= 0.1)
      {
        if (v2 >= 0.2)
        {
          if (v2 >= 0.3)
          {
            if (v2 >= 0.4)
            {
              if (v2 >= 0.5)
              {
                if (v2 >= 1.0)
                {
                  if (v2 >= 2.0)
                  {
                    if (v2 >= 4.0)
                    {
                      v4 = CFSTR("8-15s");
                      v5 = CFSTR("15-30s");
                      v6 = CFSTR("60s+");
                      if (v2 < 60.0)
                        v6 = CFSTR("30-60s");
                      if (v2 >= 30.0)
                        v5 = v6;
                      if (v2 >= 15.0)
                        v4 = v5;
                      if (v2 >= 8.0)
                        return v4;
                      else
                        return CFSTR("4-8s");
                    }
                    else
                    {
                      return CFSTR("2-4s");
                    }
                  }
                  else
                  {
                    return CFSTR("1-2s");
                  }
                }
                else
                {
                  return CFSTR("500ms-1s");
                }
              }
              else
              {
                return CFSTR("400-500ms");
              }
            }
            else
            {
              return CFSTR("300-400ms");
            }
          }
          else
          {
            return CFSTR("200-300ms");
          }
        }
        else
        {
          return CFSTR("100-200ms");
        }
      }
      else
      {
        return CFSTR("0-100ms");
      }
    }
    else
    {
      return CFSTR("stop_before_start");
    }
  }
}

id _ConvertIdToSchemaUUID(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (objc_class *)MEMORY[0x24BDD1880];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithUUIDString:", v2);

  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE95C78]), "initWithNSUUID:", v3);
  else
    v4 = 0;

  return v4;
}

id _ExtractAceViewId(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v1, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v1, "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("aceId")))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v8);
          v9 = objc_claimAutoreleasedReturnValue();
LABEL_13:
          v10 = (void *)v9;

          goto LABEL_14;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          _ExtractAceViewId(v8);
          v9 = objc_claimAutoreleasedReturnValue();
          if (v9)
            goto LABEL_13;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_14:

  return v10;
}

id _PNRFatalErrorInfo(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (objc_class *)MEMORY[0x24BE95B40];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v2, "code"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setErrorCode:", v5);

  objc_msgSend(v2, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setErrorDomain:", v6);
  return v3;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_11(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

uint64_t AssistantServicesLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = AssistantServicesLibraryCore_frameworkLibrary;
  v6 = AssistantServicesLibraryCore_frameworkLibrary;
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_251858378;
    v8 = *(_OWORD *)&off_251858388;
    v1 = _sl_dlopen();
    v4[3] = v1;
    AssistantServicesLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2470088F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t AssistantServicesLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = AssistantServicesLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getAFAnalyticsClass()
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
  v0 = (void *)getAFAnalyticsClass_softClass;
  v7 = getAFAnalyticsClass_softClass;
  if (!getAFAnalyticsClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAFAnalyticsClass_block_invoke;
    v3[3] = &unk_2518583A0;
    v3[4] = &v4;
    __getAFAnalyticsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_247008A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFAnalyticsClass_block_invoke(uint64_t a1)
{
  Class result;

  AssistantServicesLibrary();
  result = objc_getClass("AFAnalytics");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAFAnalyticsClass_block_invoke_cold_1();
  getAFAnalyticsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFAudioPowerUpdaterClass()
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
  v0 = (void *)getAFAudioPowerUpdaterClass_softClass;
  v7 = getAFAudioPowerUpdaterClass_softClass;
  if (!getAFAudioPowerUpdaterClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAFAudioPowerUpdaterClass_block_invoke;
    v3[3] = &unk_2518583A0;
    v3[4] = &v4;
    __getAFAudioPowerUpdaterClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_247008B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFAudioPowerUpdaterClass_block_invoke(uint64_t a1)
{
  Class result;

  AssistantServicesLibrary();
  result = objc_getClass("AFAudioPowerUpdater");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAFAudioPowerUpdaterClass_block_invoke_cold_1();
  getAFAudioPowerUpdaterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFAudioPowerXPCProviderClass()
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
  v0 = (void *)getAFAudioPowerXPCProviderClass_softClass;
  v7 = getAFAudioPowerXPCProviderClass_softClass;
  if (!getAFAudioPowerXPCProviderClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAFAudioPowerXPCProviderClass_block_invoke;
    v3[3] = &unk_2518583A0;
    v3[4] = &v4;
    __getAFAudioPowerXPCProviderClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_247008C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFAudioPowerXPCProviderClass_block_invoke(uint64_t a1)
{
  Class result;

  AssistantServicesLibrary();
  result = objc_getClass("AFAudioPowerXPCProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAFAudioPowerXPCProviderClass_block_invoke_cold_1();
  getAFAudioPowerXPCProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFClientConfigurationClass()
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
  v0 = (void *)getAFClientConfigurationClass_softClass;
  v7 = getAFClientConfigurationClass_softClass;
  if (!getAFClientConfigurationClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAFClientConfigurationClass_block_invoke;
    v3[3] = &unk_2518583A0;
    v3[4] = &v4;
    __getAFClientConfigurationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_247008D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFClientConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;

  AssistantServicesLibrary();
  result = objc_getClass("AFClientConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAFClientConfigurationClass_block_invoke_cold_1();
  getAFClientConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFFeatureFlagsClass()
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
  v0 = (void *)getAFFeatureFlagsClass_softClass;
  v7 = getAFFeatureFlagsClass_softClass;
  if (!getAFFeatureFlagsClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAFFeatureFlagsClass_block_invoke;
    v3[3] = &unk_2518583A0;
    v3[4] = &v4;
    __getAFFeatureFlagsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_247008E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFFeatureFlagsClass_block_invoke(uint64_t a1)
{
  Class result;

  AssistantServicesLibrary();
  result = objc_getClass("AFFeatureFlags");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAFFeatureFlagsClass_block_invoke_cold_1();
  getAFFeatureFlagsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFInstanceContextClass()
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
  v0 = (void *)getAFInstanceContextClass_softClass;
  v7 = getAFInstanceContextClass_softClass;
  if (!getAFInstanceContextClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAFInstanceContextClass_block_invoke;
    v3[3] = &unk_2518583A0;
    v3[4] = &v4;
    __getAFInstanceContextClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_247008F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFInstanceContextClass_block_invoke(uint64_t a1)
{
  Class result;

  AssistantServicesLibrary();
  result = objc_getClass("AFInstanceContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAFInstanceContextClass_block_invoke_cold_1();
  getAFInstanceContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFInterstitialProviderClass()
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
  v0 = (void *)getAFInterstitialProviderClass_softClass;
  v7 = getAFInterstitialProviderClass_softClass;
  if (!getAFInterstitialProviderClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAFInterstitialProviderClass_block_invoke;
    v3[3] = &unk_2518583A0;
    v3[4] = &v4;
    __getAFInterstitialProviderClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_247009048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFInterstitialProviderClass_block_invoke(uint64_t a1)
{
  Class result;

  AssistantServicesLibrary();
  result = objc_getClass("AFInterstitialProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAFInterstitialProviderClass_block_invoke_cold_1();
  getAFInterstitialProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFOneArgumentSafetyBlockClass()
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
  v0 = (void *)getAFOneArgumentSafetyBlockClass_softClass;
  v7 = getAFOneArgumentSafetyBlockClass_softClass;
  if (!getAFOneArgumentSafetyBlockClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAFOneArgumentSafetyBlockClass_block_invoke;
    v3[3] = &unk_2518583A0;
    v3[4] = &v4;
    __getAFOneArgumentSafetyBlockClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_247009154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFOneArgumentSafetyBlockClass_block_invoke(uint64_t a1)
{
  Class result;

  AssistantServicesLibrary();
  result = objc_getClass("AFOneArgumentSafetyBlock");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAFOneArgumentSafetyBlockClass_block_invoke_cold_1();
  getAFOneArgumentSafetyBlockClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
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
    v3[3] = &unk_2518583A0;
    v3[4] = &v4;
    __getAFPreferencesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_247009260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  Class result;

  AssistantServicesLibrary();
  result = objc_getClass("AFPreferences");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAFPreferencesClass_block_invoke_cold_1();
  getAFPreferencesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFQueueClass()
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
  v0 = (void *)getAFQueueClass_softClass;
  v7 = getAFQueueClass_softClass;
  if (!getAFQueueClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAFQueueClass_block_invoke;
    v3[3] = &unk_2518583A0;
    v3[4] = &v4;
    __getAFQueueClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_24700936C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFQueueClass_block_invoke(uint64_t a1)
{
  Class result;

  AssistantServicesLibrary();
  result = objc_getClass("AFQueue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAFQueueClass_block_invoke_cold_1();
  getAFQueueClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFSafetyBlockClass()
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
  v0 = (void *)getAFSafetyBlockClass_softClass;
  v7 = getAFSafetyBlockClass_softClass;
  if (!getAFSafetyBlockClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAFSafetyBlockClass_block_invoke;
    v3[3] = &unk_2518583A0;
    v3[4] = &v4;
    __getAFSafetyBlockClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_247009478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFSafetyBlockClass_block_invoke(uint64_t a1)
{
  Class result;

  AssistantServicesLibrary();
  result = objc_getClass("AFSafetyBlock");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAFSafetyBlockClass_block_invoke_cold_1();
  getAFSafetyBlockClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getAFRequestInfoClass()
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
  v0 = (void *)getAFRequestInfoClass_softClass;
  v7 = getAFRequestInfoClass_softClass;
  if (!getAFRequestInfoClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAFRequestInfoClass_block_invoke;
    v3[3] = &unk_2518583A0;
    v3[4] = &v4;
    __getAFRequestInfoClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_247009584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFRequestInfoClass_block_invoke(uint64_t a1)
{
  Class result;

  AssistantServicesLibrary();
  result = objc_getClass("AFRequestInfo");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAFRequestInfoClass_block_invoke_cold_1();
  getAFRequestInfoClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *getAFAssistantCapableSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getAFAssistantCapableSymbolLoc_ptr;
  v6 = getAFAssistantCapableSymbolLoc_ptr;
  if (!getAFAssistantCapableSymbolLoc_ptr)
  {
    v1 = (void *)AssistantServicesLibrary();
    v0 = dlsym(v1, "AFAssistantCapable");
    v4[3] = (uint64_t)v0;
    getAFAssistantCapableSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_247009668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t WL_AFAssistantCapable()
{
  uint64_t (*AFAssistantCapableSymbolLoc)(void);

  AFAssistantCapableSymbolLoc = (uint64_t (*)(void))getAFAssistantCapableSymbolLoc();
  if (!AFAssistantCapableSymbolLoc)
    WL_AFAssistantCapable_cold_1();
  return AFAssistantCapableSymbolLoc();
}

void *getAFDeviceSupportsSAESymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getAFDeviceSupportsSAESymbolLoc_ptr;
  v6 = getAFDeviceSupportsSAESymbolLoc_ptr;
  if (!getAFDeviceSupportsSAESymbolLoc_ptr)
  {
    v1 = (void *)AssistantServicesLibrary();
    v0 = dlsym(v1, "AFDeviceSupportsSAE");
    v4[3] = (uint64_t)v0;
    getAFDeviceSupportsSAESymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_247009714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t WL_AFDeviceSupportsSAE()
{
  uint64_t (*AFDeviceSupportsSAESymbolLoc)(void);

  AFDeviceSupportsSAESymbolLoc = (uint64_t (*)(void))getAFDeviceSupportsSAESymbolLoc();
  if (!AFDeviceSupportsSAESymbolLoc)
    WL_AFAssistantCapable_cold_1();
  return AFDeviceSupportsSAESymbolLoc();
}

void *getAFDeviceSupportsSiriUODSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getAFDeviceSupportsSiriUODSymbolLoc_ptr;
  v6 = getAFDeviceSupportsSiriUODSymbolLoc_ptr;
  if (!getAFDeviceSupportsSiriUODSymbolLoc_ptr)
  {
    v1 = (void *)AssistantServicesLibrary();
    v0 = dlsym(v1, "AFDeviceSupportsSiriUOD");
    v4[3] = (uint64_t)v0;
    getAFDeviceSupportsSiriUODSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2470097C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t WL_AFDeviceSupportsSiriUOD()
{
  uint64_t (*AFDeviceSupportsSiriUODSymbolLoc)(void);

  AFDeviceSupportsSiriUODSymbolLoc = (uint64_t (*)(void))getAFDeviceSupportsSiriUODSymbolLoc();
  if (!AFDeviceSupportsSiriUODSymbolLoc)
    WL_AFAssistantCapable_cold_1();
  return AFDeviceSupportsSiriUODSymbolLoc();
}

void *getAFIsATVSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getAFIsATVSymbolLoc_ptr;
  v6 = getAFIsATVSymbolLoc_ptr;
  if (!getAFIsATVSymbolLoc_ptr)
  {
    v1 = (void *)AssistantServicesLibrary();
    v0 = dlsym(v1, "AFIsATV");
    v4[3] = (uint64_t)v0;
    getAFIsATVSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_24700986C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t WL_AFIsATV()
{
  uint64_t (*AFIsATVSymbolLoc)(void);

  AFIsATVSymbolLoc = (uint64_t (*)(void))getAFIsATVSymbolLoc();
  if (!AFIsATVSymbolLoc)
    WL_AFAssistantCapable_cold_1();
  return AFIsATVSymbolLoc();
}

void *getAFIsHorsemanSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getAFIsHorsemanSymbolLoc_ptr;
  v6 = getAFIsHorsemanSymbolLoc_ptr;
  if (!getAFIsHorsemanSymbolLoc_ptr)
  {
    v1 = (void *)AssistantServicesLibrary();
    v0 = dlsym(v1, "AFIsHorseman");
    v4[3] = (uint64_t)v0;
    getAFIsHorsemanSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_247009918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t WL_AFIsHorseman()
{
  uint64_t (*AFIsHorsemanSymbolLoc)(void);

  AFIsHorsemanSymbolLoc = (uint64_t (*)(void))getAFIsHorsemanSymbolLoc();
  if (!AFIsHorsemanSymbolLoc)
    WL_AFAssistantCapable_cold_1();
  return AFIsHorsemanSymbolLoc();
}

void *getAFIsInternalInstallSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getAFIsInternalInstallSymbolLoc_ptr;
  v6 = getAFIsInternalInstallSymbolLoc_ptr;
  if (!getAFIsInternalInstallSymbolLoc_ptr)
  {
    v1 = (void *)AssistantServicesLibrary();
    v0 = dlsym(v1, "AFIsInternalInstall");
    v4[3] = (uint64_t)v0;
    getAFIsInternalInstallSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_2470099C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t WL_AFIsInternalInstall()
{
  uint64_t (*AFIsInternalInstallSymbolLoc)(void);

  AFIsInternalInstallSymbolLoc = (uint64_t (*)(void))getAFIsInternalInstallSymbolLoc();
  if (!AFIsInternalInstallSymbolLoc)
    WL_AFAssistantCapable_cold_1();
  return AFIsInternalInstallSymbolLoc();
}

void *getAFIsMacSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getAFIsMacSymbolLoc_ptr;
  v6 = getAFIsMacSymbolLoc_ptr;
  if (!getAFIsMacSymbolLoc_ptr)
  {
    v1 = (void *)AssistantServicesLibrary();
    v0 = dlsym(v1, "AFIsMac");
    v4[3] = (uint64_t)v0;
    getAFIsMacSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_247009A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t WL_AFIsMac()
{
  uint64_t (*AFIsMacSymbolLoc)(void);

  AFIsMacSymbolLoc = (uint64_t (*)(void))getAFIsMacSymbolLoc();
  if (!AFIsMacSymbolLoc)
    WL_AFAssistantCapable_cold_1();
  return AFIsMacSymbolLoc();
}

void *getAFIsNanoSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getAFIsNanoSymbolLoc_ptr;
  v6 = getAFIsNanoSymbolLoc_ptr;
  if (!getAFIsNanoSymbolLoc_ptr)
  {
    v1 = (void *)AssistantServicesLibrary();
    v0 = dlsym(v1, "AFIsNano");
    v4[3] = (uint64_t)v0;
    getAFIsNanoSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_247009B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t WL_AFIsNano()
{
  uint64_t (*AFIsNanoSymbolLoc)(void);

  AFIsNanoSymbolLoc = (uint64_t (*)(void))getAFIsNanoSymbolLoc();
  if (!AFIsNanoSymbolLoc)
    WL_AFAssistantCapable_cold_1();
  return AFIsNanoSymbolLoc();
}

void *getAFIsPadSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getAFIsPadSymbolLoc_ptr;
  v6 = getAFIsPadSymbolLoc_ptr;
  if (!getAFIsPadSymbolLoc_ptr)
  {
    v1 = (void *)AssistantServicesLibrary();
    v0 = dlsym(v1, "AFIsPad");
    v4[3] = (uint64_t)v0;
    getAFIsPadSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_247009BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t WL_AFIsPad()
{
  uint64_t (*AFIsPadSymbolLoc)(void);

  AFIsPadSymbolLoc = (uint64_t (*)(void))getAFIsPadSymbolLoc();
  if (!AFIsPadSymbolLoc)
    WL_AFAssistantCapable_cold_1();
  return AFIsPadSymbolLoc();
}

void *getAFIsSyncNeededSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getAFIsSyncNeededSymbolLoc_ptr;
  v6 = getAFIsSyncNeededSymbolLoc_ptr;
  if (!getAFIsSyncNeededSymbolLoc_ptr)
  {
    v1 = (void *)AssistantServicesLibrary();
    v0 = dlsym(v1, "AFIsSyncNeeded");
    v4[3] = (uint64_t)v0;
    getAFIsSyncNeededSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_247009C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t WL_AFIsSyncNeeded()
{
  uint64_t (*AFIsSyncNeededSymbolLoc)(void);

  AFIsSyncNeededSymbolLoc = (uint64_t (*)(void))getAFIsSyncNeededSymbolLoc();
  if (!AFIsSyncNeededSymbolLoc)
    WL_AFAssistantCapable_cold_1();
  return AFIsSyncNeededSymbolLoc();
}

void *getAFIsVisionSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getAFIsVisionSymbolLoc_ptr;
  v6 = getAFIsVisionSymbolLoc_ptr;
  if (!getAFIsVisionSymbolLoc_ptr)
  {
    v1 = (void *)AssistantServicesLibrary();
    v0 = dlsym(v1, "AFIsVision");
    v4[3] = (uint64_t)v0;
    getAFIsVisionSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_247009D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t WL_AFIsVision()
{
  uint64_t (*AFIsVisionSymbolLoc)(void);

  AFIsVisionSymbolLoc = (uint64_t (*)(void))getAFIsVisionSymbolLoc();
  if (!AFIsVisionSymbolLoc)
    WL_AFAssistantCapable_cold_1();
  return AFIsVisionSymbolLoc();
}

void *getAFLogInitIfNeededSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getAFLogInitIfNeededSymbolLoc_ptr;
  v6 = getAFLogInitIfNeededSymbolLoc_ptr;
  if (!getAFLogInitIfNeededSymbolLoc_ptr)
  {
    v1 = (void *)AssistantServicesLibrary();
    v0 = dlsym(v1, "AFLogInitIfNeeded");
    v4[3] = (uint64_t)v0;
    getAFLogInitIfNeededSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_247009DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t WL_AFLogInitIfNeeded()
{
  uint64_t (*AFLogInitIfNeededSymbolLoc)(void);

  AFLogInitIfNeededSymbolLoc = (uint64_t (*)(void))getAFLogInitIfNeededSymbolLoc();
  if (!AFLogInitIfNeededSymbolLoc)
    WL_AFAssistantCapable_cold_1();
  return AFLogInitIfNeededSymbolLoc();
}

void *getAFPreferencesTypeToSiriEnabledSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getAFPreferencesTypeToSiriEnabledSymbolLoc_ptr;
  v6 = getAFPreferencesTypeToSiriEnabledSymbolLoc_ptr;
  if (!getAFPreferencesTypeToSiriEnabledSymbolLoc_ptr)
  {
    v1 = (void *)AssistantServicesLibrary();
    v0 = dlsym(v1, "AFPreferencesTypeToSiriEnabled");
    v4[3] = (uint64_t)v0;
    getAFPreferencesTypeToSiriEnabledSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_247009E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t WL_AFPreferencesTypeToSiriEnabled()
{
  uint64_t (*AFPreferencesTypeToSiriEnabledSymbolLoc)(void);

  AFPreferencesTypeToSiriEnabledSymbolLoc = (uint64_t (*)(void))getAFPreferencesTypeToSiriEnabledSymbolLoc();
  if (!AFPreferencesTypeToSiriEnabledSymbolLoc)
    WL_AFAssistantCapable_cold_1();
  return AFPreferencesTypeToSiriEnabledSymbolLoc();
}

void *getAFProductAndBuildVersionSymbolLoc()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getAFProductAndBuildVersionSymbolLoc_ptr;
  v6 = getAFProductAndBuildVersionSymbolLoc_ptr;
  if (!getAFProductAndBuildVersionSymbolLoc_ptr)
  {
    v1 = (void *)AssistantServicesLibrary();
    v0 = dlsym(v1, "AFProductAndBuildVersion");
    v4[3] = (uint64_t)v0;
    getAFProductAndBuildVersionSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_247009F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t WL_AFProductAndBuildVersion()
{
  uint64_t (*AFProductAndBuildVersionSymbolLoc)(void);

  AFProductAndBuildVersionSymbolLoc = (uint64_t (*)(void))getAFProductAndBuildVersionSymbolLoc();
  if (!AFProductAndBuildVersionSymbolLoc)
    WL_AFAssistantCapable_cold_1();
  return AFProductAndBuildVersionSymbolLoc();
}

void _EmitHomePodLaunchContextTime_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_246FF4000, v0, v1, "%s turnId is nil. Instrumentation logging is skipped. requestUUID = %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void _EmitHomePodLaunchContextTime_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_246FF4000, v0, v1, "%s speechRequestOptions is nil. Instrumentation logging is skipped. requestUUID = %@ turnId = %@", v2);
  OUTLINED_FUNCTION_7();
}

void __getAFAnalyticsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAFAudioPowerUpdaterClass_block_invoke_cold_1(v0);
}

void __getAFAudioPowerUpdaterClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAFAudioPowerXPCProviderClass_block_invoke_cold_1(v0);
}

void __getAFAudioPowerXPCProviderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAFClientConfigurationClass_block_invoke_cold_1(v0);
}

void __getAFClientConfigurationClass_block_invoke_cold_1()
{
  abort_report_np();
  __getAFFeatureFlagsClass_block_invoke_cold_1();
}

void __getAFFeatureFlagsClass_block_invoke_cold_1()
{
  abort_report_np();
  __getAFInstanceContextClass_block_invoke_cold_1();
}

void __getAFInstanceContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAFInterstitialProviderClass_block_invoke_cold_1(v0);
}

void __getAFInterstitialProviderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAFOneArgumentSafetyBlockClass_block_invoke_cold_1(v0);
}

void __getAFOneArgumentSafetyBlockClass_block_invoke_cold_1()
{
  abort_report_np();
  __getAFPreferencesClass_block_invoke_cold_1();
}

void __getAFPreferencesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAFQueueClass_block_invoke_cold_1(v0);
}

void __getAFQueueClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAFSafetyBlockClass_block_invoke_cold_1(v0);
}

void __getAFSafetyBlockClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getAFRequestInfoClass_block_invoke_cold_1(v0);
}

void __getAFRequestInfoClass_block_invoke_cold_1()
{
  abort_report_np();
  WL_AFAssistantCapable_cold_1();
}

void WL_AFAssistantCapable_cold_1()
{
  dlerror();
  abort_report_np();
  ADCreateRequestLinkInfo();
}

uint64_t ADCreateRequestLinkInfo()
{
  return MEMORY[0x24BE08B40]();
}

uint64_t ADEmitRequestLinkEventMessage()
{
  return MEMORY[0x24BE08B48]();
}

uint64_t AFActivationEventGetDescription()
{
  return MEMORY[0x24BE08B50]();
}

uint64_t AFAnalyticsContextCreateWithCommand()
{
  return MEMORY[0x24BE08B60]();
}

uint64_t AFAnalyticsContextCreateWithError()
{
  return MEMORY[0x24BE08B68]();
}

uint64_t AFAnalyticsContextCreateWithRequestInfo()
{
  return MEMORY[0x24BE08B70]();
}

uint64_t AFAnalyticsContextCreateWithSpeechRequestOptions()
{
  return MEMORY[0x24BE08B78]();
}

uint64_t AFAnalyticsContextsMerge()
{
  return MEMORY[0x24BE08B88]();
}

uint64_t AFAnalyticsEventCreateCurrent()
{
  return MEMORY[0x24BE08B90]();
}

uint64_t AFAnalyticsTurnContextCreateWithRequestInfo()
{
  return MEMORY[0x24BE08BA0]();
}

uint64_t AFAnalyticsTurnContextCreateWithSpeechRequestOptions()
{
  return MEMORY[0x24BE08BA8]();
}

uint64_t AFClientServiceDelegateXPCInterface()
{
  return MEMORY[0x24BE08BE8]();
}

uint64_t AFClientServiceXPCInterface()
{
  return MEMORY[0x24BE08BF0]();
}

uint64_t AFErrorSetUnderlyingError()
{
  return MEMORY[0x24BE08D08]();
}

uint64_t AFInterstitialCreateCommand()
{
  return MEMORY[0x24BE08D58]();
}

uint64_t AFInterstitialIsCommandInterstitial()
{
  return MEMORY[0x24BE08D60]();
}

uint64_t AFInterstitialPhaseGetName()
{
  return MEMORY[0x24BE08D68]();
}

uint64_t AFInterstitialSupportsRequestWithEvent()
{
  return MEMORY[0x24BE08D70]();
}

uint64_t AFIsNano()
{
  return MEMORY[0x24BE08DB8]();
}

uint64_t AFMachAbsoluteTimeGetTimeInterval()
{
  return MEMORY[0x24BE08E18]();
}

uint64_t AFPlaybackRouteIsHandsFree()
{
  return MEMORY[0x24BE08E98]();
}

uint64_t AFPreferencesSupportedLanguagesForRemote()
{
  return MEMORY[0x24BE08EE0]();
}

uint64_t AFRecordRouteIsHearst()
{
  return MEMORY[0x24BE08F20]();
}

uint64_t AFSpeechEventGetDescription()
{
  return MEMORY[0x24BE09040]();
}

uint64_t AFSpeechEventIsVoiceTrigger()
{
  return MEMORY[0x24BE09048]();
}

uint64_t AFTurnIdentifierGetString()
{
  return MEMORY[0x24BE09088]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t _AFPreferencesGetClientCommandDeliveryDelay()
{
  return MEMORY[0x24BE09410]();
}

uint64_t _AFPreferencesGetForcedInterstitialStyle()
{
  return MEMORY[0x24BE09418]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
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

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x24BDAE058](a1, a2);
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

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

uint64_t nwi_ifstate_get_flags()
{
  return MEMORY[0x24BDAF1B0]();
}

uint64_t nwi_state_copy()
{
  return MEMORY[0x24BDAF1E8]();
}

uint64_t nwi_state_get_first_ifstate()
{
  return MEMORY[0x24BDAF1F0]();
}

uint64_t nwi_state_get_notify_key()
{
  return MEMORY[0x24BDAF210]();
}

uint64_t nwi_state_get_reachability_flags()
{
  return MEMORY[0x24BDAF218]();
}

uint64_t nwi_state_release()
{
  return MEMORY[0x24BDAF220]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  MEMORY[0x24BDB07A0](connection, barrier);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

