void sub_1A1A2C13C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  id *v6;
  id *v7;
  uint64_t v8;

  objc_destroyWeak(v7);
  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v8 - 104));
  _Unwind_Resume(a1);
}

void sub_1A1A2C1A8()
{
  JUMPOUT(0x1A1A2C188);
}

void sub_1A1A2C1B0()
{
  JUMPOUT(0x1A1A2C190);
}

uint64_t SSCAIsCAMetadataSubsystemCategory(void *a1, void *a2)
{
  id v3;
  id v4;
  const __CFString *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.coreanimation")))
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Transaction.Stalls")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("Transaction")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("IOMFBServer.Stalls")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("IOMFBServer")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("WindowServer")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("WindowServer.Stalls")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("CAMetalLayer")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("CAMetalLayer.Stalls")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("CAImageQueue")) & 1) == 0)
    {
      v5 = CFSTR("CAImageQueue.Stalls");
LABEL_17:
      v6 = objc_msgSend(v4, "isEqualToString:", v5);
      goto LABEL_18;
    }
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.SkyLight")))
    {
      v6 = 0;
      goto LABEL_18;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("tracing")) & 1) == 0)
    {
      v5 = CFSTR("tracing.stalls");
      goto LABEL_17;
    }
  }
  v6 = 1;
LABEL_18:

  return v6;
}

void sub_1A1A2F0B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1A2F1EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SSCAEventTypeForSignpost(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;

  v1 = a1;
  objc_msgSend(v1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "isEqualToString:", CFSTR("ContextInfo"));

  if (!(_DWORD)v3)
  {
LABEL_13:
    objc_msgSend(v1, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "isEqualToString:", CFSTR("ImageQueueSample"));

    if ((_DWORD)v13)
    {
      objc_msgSend(v1, "category");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("CAImageQueue"));
      if ((v15 & 1) != 0
        || (objc_msgSend(v1, "category"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            (objc_msgSend(v13, "isEqualToString:", CFSTR("CAImageQueue.Stalls")) & 1) != 0))
      {
        objc_msgSend(v1, "subsystem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.coreanimation"));

        if ((v15 & 1) == 0)
        if ((v17 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_22;
        }
      }
      else
      {

      }
    }
    v11 = 2;
    goto LABEL_22;
  }
  objc_msgSend(v1, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("IOMFBServer"));
  if ((v5 & 1) != 0
    || (objc_msgSend(v1, "category"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        (objc_msgSend(v3, "isEqualToString:", CFSTR("IOMFBServer.Stalls")) & 1) != 0))
  {
    objc_msgSend(v1, "subsystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.coreanimation"));

    if ((v5 & 1) == 0)
    if ((v7 & 1) != 0)
      goto LABEL_11;
  }
  else
  {

  }
  objc_msgSend(v1, "category");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("tracing.stalls")) & 1) == 0)
  {

    goto LABEL_13;
  }
  objc_msgSend(v1, "subsystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.SkyLight"));

  if ((v10 & 1) == 0)
    goto LABEL_13;
LABEL_11:
  v11 = 0;
LABEL_22:

  return v11;
}

uint64_t SSCAIntervalTypeForSignpostInterval(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  objc_msgSend(v1, "subsystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_subsystemIsHitchSubsystem(v2))
  {
    objc_msgSend(v1, "category");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Transaction")))
    {
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Commit")) & 1) != 0)
      {
        v5 = 0;
LABEL_44:

        goto LABEL_45;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("TransactionLifetime")) & 1) != 0)
      {
        v5 = 2;
        goto LABEL_44;
      }
      goto LABEL_43;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Transaction.Stalls")))
    {
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Commit")) & 1) != 0)
      {
        v5 = 1;
        goto LABEL_44;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("TransactionLifetime")) & 1) != 0)
      {
        v5 = 3;
        goto LABEL_44;
      }
LABEL_43:
      v5 = 14;
      goto LABEL_44;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("IOMFBServer")))
    {
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("HIDLatency")) & 1) != 0)
      {
        v5 = 4;
        goto LABEL_44;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("FrameLatency")) & 1) != 0)
      {
        v5 = 6;
        goto LABEL_44;
      }
      goto LABEL_31;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("IOMFBServer.Stalls")))
    {
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("HIDLatency")) & 1) != 0)
      {
        v5 = 5;
        goto LABEL_44;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("FrameLatency")) & 1) != 0)
      {
        v5 = 7;
        goto LABEL_44;
      }
LABEL_35:
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("FrameLifetime")) & 1) != 0)
      {
        v5 = 11;
        goto LABEL_44;
      }
      goto LABEL_43;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("WindowServer")))
    {
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("RenderInterval")) & 1) == 0)
        goto LABEL_43;
      goto LABEL_23;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("WindowServer.Stalls")))
    {
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("RenderInterval")) & 1) == 0)
        goto LABEL_43;
    }
    else
    {
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("tracing")))
      {
        if ((objc_msgSend(v4, "isEqualToString:", CFSTR("RenderInterval")) & 1) == 0)
        {
LABEL_31:
          if ((objc_msgSend(v4, "isEqualToString:", CFSTR("FrameLifetime")) & 1) != 0)
          {
            v5 = 10;
            goto LABEL_44;
          }
          goto LABEL_43;
        }
LABEL_23:
        v5 = 8;
        goto LABEL_44;
      }
      if (!objc_msgSend(v3, "isEqualToString:", CFSTR("tracing.stalls")))
      {
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("CAMetalLayer")))
        {
          if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ClientDrawable")) & 1) != 0)
          {
            v5 = 12;
            goto LABEL_44;
          }
        }
        else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CAMetalLayer.Stalls"))
               && (objc_msgSend(v4, "isEqualToString:", CFSTR("ClientDrawable")) & 1) != 0)
        {
          v5 = 13;
          goto LABEL_44;
        }
        goto LABEL_43;
      }
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("RenderInterval")) & 1) == 0)
        goto LABEL_35;
    }
    v5 = 9;
    goto LABEL_44;
  }
  v5 = 14;
LABEL_45:

  return v5;
}

uint64_t _subsystemIsHitchSubsystem(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.coreanimation")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SkyLight"));

  return v2;
}

id _signpost_debug_log()
{
  if (_signpost_debug_log_onceToken != -1)
    dispatch_once(&_signpost_debug_log_onceToken, &__block_literal_global_11);
  return (id)_signpost_debug_log_signpost_log;
}

void ___signpost_debug_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SignpostSupport", "debugging");
  v1 = (void *)_signpost_debug_log_signpost_log;
  _signpost_debug_log_signpost_log = (uint64_t)v0;

}

id SignpostReporterCrossPlatformIntelligencePlatformAllowlist()
{
  if (SignpostReporterCrossPlatformIntelligencePlatformAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporterCrossPlatformIntelligencePlatformAllowlist_onceToken, &__block_literal_global);
  return (id)SignpostReporterCrossPlatformIntelligencePlatformAllowlist_intelligencePlatformStringArray;
}

uint64_t SignpostReporterShouldUseAllowlist()
{
  uint64_t v0;
  _QWORD block[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  char v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v6 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __SignpostReporterShouldUseAllowlist_block_invoke;
  block[3] = &unk_1E4600C18;
  block[4] = &v3;
  if (SignpostReporterShouldUseAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporterShouldUseAllowlist_onceToken, block);
  v0 = *((unsigned __int8 *)v4 + 24);
  _Block_object_dispose(&v3, 8);
  return v0;
}

id SRStringFilter_debugLog()
{
  if (SRStringFilter_debugLog_onceToken != -1)
    dispatch_once(&SRStringFilter_debugLog_onceToken, &__block_literal_global_27);
  return (id)SRStringFilter_debugLog_debugLog;
}

BOOL IsPerfLoggingInterval(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _BOOL8 v7;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.PerformanceAnalysis"))
    && objc_msgSend(v5, "isEqualToString:", CFSTR("PerfLogging"))
    && (objc_msgSend(v6, "isEqualToString:", CFSTR("PerfLoggingOperation")) & 1) != 0;

  return v7;
}

uint64_t PassesPerfLoggingAllowlist(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    if (_StringPassesPerfLoggingOperationCategoryAllowlist_onceToken != -1)
      dispatch_once(&_StringPassesPerfLoggingOperationCategoryAllowlist_onceToken, &__block_literal_global_30);
    if (objc_msgSend((id)_StringPassesPerfLoggingOperationCategoryAllowlist_allowlistedOperationCategoryStringsSet, "containsObject:", v3))
    {
      v7 = _StringPassesPerfLoggingOperationNameAllowlist_onceToken;
      v8 = v5;
      if (v7 != -1)
        dispatch_once(&_StringPassesPerfLoggingOperationNameAllowlist_onceToken, &__block_literal_global_32);
      v6 = objc_msgSend((id)_StringPassesPerfLoggingOperationNameAllowlist_allowlistedOperationNameStringsSet, "containsObject:", v8);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

id SignpostReporterAllowlistedStringSet(id a1)
{
  uint64_t *v1;
  NSObject *v3;

  switch((unint64_t)a1)
  {
    case 0uLL:
      if (SignpostReporterAllowlistedStringSet_onceToken_24 != -1)
        dispatch_once(&SignpostReporterAllowlistedStringSet_onceToken_24, &__block_literal_global_26);
      v1 = &SignpostReporterAllowlistedStringSet_allowlistSet_23;
      goto LABEL_23;
    case 1uLL:
      if (SignpostReporterAllowlistedStringSet_onceToken != -1)
        dispatch_once(&SignpostReporterAllowlistedStringSet_onceToken, &__block_literal_global_0);
      v1 = &SignpostReporterAllowlistedStringSet_allowlistSet;
      goto LABEL_23;
    case 2uLL:
      if (SignpostReporterAllowlistedStringSet_onceToken_8 != -1)
        dispatch_once(&SignpostReporterAllowlistedStringSet_onceToken_8, &__block_literal_global_10);
      v1 = &SignpostReporterAllowlistedStringSet_allowlistSet_7;
      goto LABEL_23;
    case 3uLL:
      if (SignpostReporterAllowlistedStringSet_onceToken_16 != -1)
        dispatch_once(&SignpostReporterAllowlistedStringSet_onceToken_16, &__block_literal_global_18);
      v1 = &SignpostReporterAllowlistedStringSet_allowlistSet_15;
      goto LABEL_23;
    case 4uLL:
      if (SignpostReporterAllowlistedStringSet_onceToken_12 != -1)
        dispatch_once(&SignpostReporterAllowlistedStringSet_onceToken_12, &__block_literal_global_14);
      v1 = &SignpostReporterAllowlistedStringSet_allowlistSet_11;
      goto LABEL_23;
    case 5uLL:
      if (SignpostReporterAllowlistedStringSet_onceToken_20 != -1)
        dispatch_once(&SignpostReporterAllowlistedStringSet_onceToken_20, &__block_literal_global_22);
      SRStringFilter_debugLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        SignpostReporterAllowlistedStringSet_cold_1();

      v1 = &SignpostReporterAllowlistedStringSet_allowlistSet_19;
LABEL_23:
      a1 = (id)*v1;
      break;
    default:
      return a1;
  }
  return a1;
}

id SignpostReporterMacOsPerfLoggingOperationCategoryAllowlist()
{
  if (SignpostReporterMacOsPerfLoggingOperationCategoryAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporterMacOsPerfLoggingOperationCategoryAllowlist_onceToken, &__block_literal_global_33);
  return (id)SignpostReporterMacOsPerfLoggingOperationCategoryAllowlist_allowlistedOperationCategoryArray;
}

id SignpostReporterMacOsPerfLoggingOperationNameAllowlist()
{
  if (SignpostReporterMacOsPerfLoggingOperationNameAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporterMacOsPerfLoggingOperationNameAllowlist_onceToken, &__block_literal_global_174);
  return (id)SignpostReporterMacOsPerfLoggingOperationNameAllowlist_allowlistArray;
}

id SignpostReporterCrossPlatformLowDiskConditionAllowlist()
{
  if (SignpostReporterCrossPlatformLowDiskConditionAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporterCrossPlatformLowDiskConditionAllowlist_onceToken, &__block_literal_global_1921);
  return (id)SignpostReporterCrossPlatformLowDiskConditionAllowlist_lowDiskConditionStringArray;
}

id SignpostReporterEmbeddedOSHangTracerAllowlist()
{
  if (SignpostReporterEmbeddedOSHangTracerAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporterEmbeddedOSHangTracerAllowlist_onceToken, &__block_literal_global_2615);
  return (id)SignpostReporterEmbeddedOSHangTracerAllowlist_hangTracerStringArray;
}

id SignpostReporterEmbeddedOSMusicWaitTimeAllowlist()
{
  if (SignpostReporterEmbeddedOSMusicWaitTimeAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporterEmbeddedOSMusicWaitTimeAllowlist_onceToken, &__block_literal_global_2644);
  return (id)SignpostReporterEmbeddedOSMusicWaitTimeAllowlist_musicWaitTimeStringArray;
}

uint64_t StringPassesSignpostReporterStringAllowlist(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a1;
  SignpostReporterAllowlistedStringSet(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id SignpostJSONRepresentationOfObject(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v3 = a1;
  if (v3)
    v4 = v3;
  else
    v4 = (void *)MEMORY[0x1E0C9AA60];
  if ((objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v4) & 1) == 0)
  {

    v4 = &unk_1E462E830;
  }
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, a2, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);

  return v6;
}

id SignpostJSONRepresentation(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SignpostJSONRepresentationOfObject(v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_1A1A3607C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
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

double SignpostSystemTimebaseRatio()
{
  if (SignpostSystemTimebaseRatio_onceToken != -1)
    dispatch_once(&SignpostSystemTimebaseRatio_onceToken, &__block_literal_global_1);
  return *(double *)&SignpostSystemTimebaseRatio_timebaseRatio;
}

uint64_t SignpostPlatformForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("macOS")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("iPhoneOS")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("watchOS")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("tvOS")) & 1) != 0)
  {
    v2 = 4;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("bridgeOS")))
  {
    v2 = 5;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *StringForSignpostPlatform(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("Unknown");
  else
    return off_1E4600F20[a1 - 1];
}

uint64_t SignpostPlatformForDevice()
{
  return 2;
}

id _glitchesFromFrameLifetimesBase(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a5;
  v12 = 0;
  if (v9 && (a4 & 0x1B) != 0)
  {
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "firstFrameGraceTimeMCT");
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v21 = v9;
      v14 = v9;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v24 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "overrunIntervalOfType:overrunClass:maybeFirstFrame:contributingPID:", a3, a4, objc_msgSend(v10, "isFramePossibleFirstFrameForAnimation:withGraceTime:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), v13, v21), v11);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
              objc_msgSend(v22, "addObject:", v19);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v16);
      }

      if (objc_msgSend(v22, "count"))
        v12 = v22;
      else
        v12 = 0;
      v9 = v21;

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

id _uniqueInterval(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v3)
  {
    v11 = v4;
LABEL_6:
    v10 = v11;
    goto LABEL_7;
  }
  if (!v4)
  {
    v11 = v3;
    goto LABEL_6;
  }
  v6 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderedSetWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

LABEL_7:
  return v10;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xEu);
}

uint64_t OUTLINED_FUNCTION_5()
{
  void *v0;

  return objc_msgSend(v0, "frameSeed");
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

uint64_t OUTLINED_FUNCTION_8(void *a1, const char *a2)
{
  return objc_msgSend(a1, "frameSeed");
}

id SignpostReporterCrossPlatformWidgetAllowlist()
{
  if (SignpostReporterCrossPlatformWidgetAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporterCrossPlatformWidgetAllowlist_onceToken, &__block_literal_global_3);
  return (id)SignpostReporterCrossPlatformWidgetAllowlist_allowlist;
}

id SignpostReporterCrossPlatformSiriVocabularyStringPasslist()
{
  if (SignpostReporterCrossPlatformSiriVocabularyStringPasslist_onceToken != -1)
    dispatch_once(&SignpostReporterCrossPlatformSiriVocabularyStringPasslist_onceToken, &__block_literal_global_4);
  return (id)SignpostReporterCrossPlatformSiriVocabularyStringPasslist_siriVocabularyStringArray;
}

id SignpostReporterCrossPlatformZelkovaAllowlist()
{
  if (SignpostReporterCrossPlatformZelkovaAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporterCrossPlatformZelkovaAllowlist_onceToken, &__block_literal_global_5);
  return (id)SignpostReporterCrossPlatformZelkovaAllowlist_allowlist;
}

id SignpostReporteriOSSystemEnvironmentsAllowlist()
{
  if (SignpostReporteriOSSystemEnvironmentsAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporteriOSSystemEnvironmentsAllowlist_onceToken, &__block_literal_global_6);
  return (id)SignpostReporteriOSSystemEnvironmentsAllowlist_systemEnvironmentsStringArray;
}

id SignpostReporteriOSPoirotAllowlist()
{
  if (SignpostReporteriOSPoirotAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporteriOSPoirotAllowlist_onceToken, &__block_literal_global_7);
  return (id)SignpostReporteriOSPoirotAllowlist_poirotStringArray;
}

id SignpostReporterCrossPlatformSharedAllowlist()
{
  if (SignpostReporterCrossPlatformSharedAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporterCrossPlatformSharedAllowlist_onceToken, &__block_literal_global_8);
  return (id)SignpostReporterCrossPlatformSharedAllowlist_sharedAllowlistArray;
}

id SignpostReporterCrossPlatformSiriHomeAutomationStringPasslist()
{
  if (SignpostReporterCrossPlatformSiriHomeAutomationStringPasslist_onceToken != -1)
    dispatch_once(&SignpostReporterCrossPlatformSiriHomeAutomationStringPasslist_onceToken, &__block_literal_global_9);
  return (id)SignpostReporterCrossPlatformSiriHomeAutomationStringPasslist_siriHomeAutomationStringArray;
}

id SignpostReporterCrossPlatformSiriPersonalUpdateStringPasslist()
{
  if (SignpostReporterCrossPlatformSiriPersonalUpdateStringPasslist_onceToken != -1)
    dispatch_once(&SignpostReporterCrossPlatformSiriPersonalUpdateStringPasslist_onceToken, &__block_literal_global_10);
  return (id)SignpostReporterCrossPlatformSiriPersonalUpdateStringPasslist_siriPersonalUpdateStringArray;
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  void *v0;

  return objc_msgSend(v0, "curFrameSeed");
}

uint64_t SignpostSupportTotalDurationMachContinuousTimeForIntervals(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1 && objc_msgSend(v1, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v3);
          v6 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "durationMachContinuousTime", (_QWORD)v10);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t SignpostSupportTotalDurationMachContinuousTimeForIntervalsWithAdjustments(void *a1, void *a2)
{
  id v3;
  uint64_t (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v5);
          v8 += v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

unint64_t SignpostSupportTotalDurationNsForIntervals(void *a1)
{
  id v1;
  double v2;
  void *v3;
  double v4;
  unint64_t v5;

  v1 = a1;
  v2 = (double)(unint64_t)SignpostSupportTotalDurationMachContinuousTimeForIntervals(v1);
  objc_msgSend(v1, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "timebaseRatio");
  v5 = (unint64_t)(v4 * v2);

  return v5;
}

unint64_t SignpostSupportAverageDurationMachContinuousTimeForIntervals(void *a1)
{
  id v1;
  unint64_t v2;
  unint64_t v3;

  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    v2 = SignpostSupportTotalDurationMachContinuousTimeForIntervals(v1);
    v3 = v2 / objc_msgSend(v1, "count");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

unint64_t SignpostSupportAverageDurationNsForIntervals(void *a1)
{
  id v1;
  double v2;
  void *v3;
  double v4;
  unint64_t v5;

  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    v2 = (double)SignpostSupportAverageDurationMachContinuousTimeForIntervals(v1);
    objc_msgSend(v1, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timebaseRatio");
    v5 = (unint64_t)(v4 * v2);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

unint64_t SignpostSupportStdDevMachContinuousTimeForIntervals(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1 && objc_msgSend(v1, "count") && objc_msgSend(v2, "count") != 1)
  {
    v5 = SignpostSupportAverageDurationMachContinuousTimeForIntervals(v2);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v2;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "durationMachContinuousTime", (_QWORD)v16);
          v14 = objc_msgSend(v12, "durationMachContinuousTime");
          v15 = v13 - v5;
          if (v14 < v5)
            v15 = v5 - v13;
          v9 += v15 * v15;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v3 = (unint64_t)sqrt((double)(v9 / objc_msgSend(v6, "count")));
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

unint64_t SignpostSupportStdDevNsForIntervals(void *a1)
{
  id v1;
  double v2;
  void *v3;
  double v4;
  unint64_t v5;

  v1 = a1;
  v2 = (double)SignpostSupportStdDevMachContinuousTimeForIntervals(v1);
  objc_msgSend(v1, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "timebaseRatio");
  v5 = (unint64_t)(v4 * v2);

  return v5;
}

id SignpostSupportSlidingWindowAveragesForIntervalsInMachContinuousTime(void *a1, uint64_t a2)
{
  return _filteredArrayForIntervalsWithBlock(a1, a2, &__block_literal_global_12);
}

id _filteredArrayForIntervalsWithBlock(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void (**v6)(id, _QWORD, double);
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t *v13;
  id v14;
  size_t v15;
  _QWORD *v16;
  uint64_t i;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  size_t v31;

  v5 = a1;
  v6 = a3;
  v7 = v5;
  v8 = v7;
  if (!v7 || (v9 = (2 * a2) | 1, objc_msgSend(v7, "count") < v9))
  {

LABEL_4:
    v10 = 0;
    goto LABEL_5;
  }
  v12 = 2 * a2;
  v30 = objc_msgSend(v8, "count");
  v31 = v30 - 2 * a2;
  v13 = (uint64_t *)malloc_type_calloc(v31, 8uLL, 0x100004000313F17uLL);
  v14 = v8;
  v15 = objc_msgSend(v14, "count");
  v16 = malloc_type_calloc(v15, 8uLL, 0x100004000313F17uLL);
  if (v15)
  {
    for (i = 0; i != v15; ++i)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", i, v30);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v16[i] = objc_msgSend(v18, "durationMachContinuousTime");

    }
  }

  if (v30 != v12)
  {
    v19 = 0;
    if (v31 <= 1)
      v20 = 1;
    else
      v20 = v31;
    do
    {
      v21 = 0;
      if (!__CFADD__(v19, v12))
      {
        v22 = v19;
        do
          v21 += v16[v22++];
        while (v22 <= v19 + v12);
      }
      v13[v19++] = v21 / v9;
    }
    while (v19 != v20);
  }
  free(v16);

  if (!v13)
    goto LABEL_4;
  objc_msgSend(v14, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "timebaseRatio");
  v25 = v24;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30 != v12)
  {
    if (v31 <= 1)
      v26 = 1;
    else
      v26 = v31;
    v27 = v13;
    do
    {
      v28 = *v27++;
      v6[2](v6, v28, v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v29);

      --v26;
    }
    while (v26);
  }
  free(v13);
LABEL_5:

  return v10;
}

id SignpostSupportSlidingWindowAveragesForIntervalsInNs(void *a1, uint64_t a2)
{
  return _filteredArrayForIntervalsWithBlock(a1, a2, &__block_literal_global_1);
}

id SignpostSupportSortedSubArrayFromIntervals(void *a1, char a2, double a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  char v11;

  v5 = a1;
  v6 = v5;
  if (v5)
  {
    if ((unint64_t)objc_msgSend(v5, "count") > 1)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __SignpostSupportSortedSubArrayFromIntervals_block_invoke;
      v10[3] = &__block_descriptor_33_e73_q24__0___SignpostSupportTimeInterval__8___SignpostSupportTimeInterval__16l;
      v11 = a2;
      objc_msgSend(v6, "sortedArrayUsingComparator:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "subarrayWithRange:", 0, vcvtpd_u64_f64((double)(unint64_t)objc_msgSend(v6, "count") * a3));
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = v6;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id SignpostSupportAverageDurationOfLongestIntervalsInMachContinuousTime(void *a1, double a2)
{
  return _percentileAverageDuration(a1, 1, 1, a2);
}

id _percentileAverageDuration(void *a1, char a2, int a3, double a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;

  v7 = a1;
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "count"))
    {
      SignpostSupportSortedSubArrayFromIntervals(v8, a2, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = (void *)MEMORY[0x1E0CB37E8];
      if (a3)
        v12 = SignpostSupportAverageDurationMachContinuousTimeForIntervals(v9);
      else
        v12 = SignpostSupportAverageDurationNsForIntervals(v9);
      objc_msgSend(v11, "numberWithUnsignedLongLong:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = &unk_1E462E858;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

id SignpostSupportAverageDurationOfLongestIntervalsInNs(void *a1, double a2)
{
  return _percentileAverageDuration(a1, 1, 0, a2);
}

id SignpostSupportAverageDurationOfShortestIntervalsInMachContinuousTime(void *a1, double a2)
{
  return _percentileAverageDuration(a1, 0, 1, a2);
}

id SignpostSupportAverageDurationOfShortestIntervalsInNs(void *a1, double a2)
{
  return _percentileAverageDuration(a1, 0, 0, a2);
}

id _valueForPercentile(void *a1, double a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;

  v3 = a1;
  v4 = objc_msgSend(v3, "count");
  v5 = 0;
  if (a2 <= 100.0 && a2 >= 0.0 && v4 != 0)
  {
    if (a2 == 0.0)
    {
      objc_msgSend(v3, "firstObject");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a2 == 100.0)
        objc_msgSend(v3, "lastObject");
      else
        objc_msgSend(v3, "objectAtIndexedSubscript:", vcvtad_u64_f64(a2 / 100.0 * (double)(unint64_t)(v4 - 1)));
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v7;
  }

  return v5;
}

id SignpostReporterCrossPlatformAuthKitAllowlist()
{
  if (SignpostReporterCrossPlatformAuthKitAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporterCrossPlatformAuthKitAllowlist_onceToken, &__block_literal_global_13);
  return (id)SignpostReporterCrossPlatformAuthKitAllowlist_authKitStringArray;
}

void sub_1A1A41994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1A1A41D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

id SignpostReporterCrossPlatformSiriVideoUTSOperationRequestStringPasslist()
{
  if (SignpostReporterCrossPlatformSiriVideoUTSOperationRequestStringPasslist_onceToken != -1)
    dispatch_once(&SignpostReporterCrossPlatformSiriVideoUTSOperationRequestStringPasslist_onceToken, &__block_literal_global_15);
  return (id)SignpostReporterCrossPlatformSiriVideoUTSOperationRequestStringPasslist_siriVideoUTSOperationRequestStringArray;
}

id _SignpostSerializeableObjectFromSerializedObjectDictionary(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  __objc2_class *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;

  v3 = a1;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SerType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[SignpostEvent serializationTypeNumber](SignpostEvent, "serializationTypeNumber");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToNumber:", v6);

      if (v7)
      {
        v8 = SignpostEvent;
LABEL_15:
        v9 = (void *)objc_msgSend([v8 alloc], "initWithDictionary:", v4);
        goto LABEL_19;
      }
      +[SignpostSupportLogMessage serializationTypeNumber](SignpostSupportLogMessage, "serializationTypeNumber");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v5, "isEqualToNumber:", v10);

      if (v11)
      {
        v8 = SignpostSupportLogMessage;
        goto LABEL_15;
      }
      if ((objc_msgSend(v5, "isEqualToNumber:", &unk_1E462E888) & 1) != 0
        || (+[SignpostStreamEvent serializationTypeNumber](SignpostStreamEvent, "serializationTypeNumber"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v5, "isEqualToNumber:", v12),
            v12,
            v13))
      {
        v8 = SignpostStreamEvent;
        goto LABEL_15;
      }
      if (a2)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown object type: %llu"), objc_msgSend(v5, "unsignedLongLongValue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithCode:description:", 3, v15);
        *a2 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 3, CFSTR("No serialized object type"));
      v9 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

      goto LABEL_20;
    }
    v9 = 0;
    goto LABEL_19;
  }
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 3, CFSTR("nil serialization object dictionary"));
    v9 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_20:

  return v9;
}

id _SignpostSupportSerializationDataFromObjectArray(void *a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  SignpostSupportSerializabledObjectCollection *v6;
  id v7;
  void *v8;
  id v9;

  v5 = a1;
  v6 = -[SignpostSupportSerializabledObjectCollection initWithSerializeableObjectArray:]([SignpostSupportSerializabledObjectCollection alloc], "initWithSerializeableObjectArray:", v5);

  if (v6)
  {
    v7 = -[SignpostSupportSerializabledObjectCollection newSerializedCollection:](v6, "newSerializedCollection:", a2);
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 2, CFSTR("Could not create NSData for objects"));
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 2, CFSTR("Could not create SignpostSerializableObjectCollection"));
    v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

BOOL SignpostSupportDeserializationEnumerateObjectArrayFromData(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  id v9;

  v9 = 0;
  v4 = +[SignpostSupportSerializabledObjectCollection enumerateSignpostSupportObjectsInSerializedCollection:processingBlock:errorOut:](SignpostSupportSerializabledObjectCollection, "enumerateSignpostSupportObjectsInSerializedCollection:processingBlock:errorOut:", a1, a3, &v9);
  v5 = v9;
  v6 = v5;
  if (a2 && !v4)
  {
    if (v5)
    {
      v7 = (void *)objc_msgSend(v5, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 3, CFSTR("Unknown data enumeration error"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *a2 = v7;
  }

  return v4;
}

void _addArchiveEventFieldsInDictionaryWithArchiveEvent(void *a1, void *a2, int a3)
{
  id v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  id v36;

  v36 = a1;
  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "_machContinuousTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    v7 = CFSTR("machContinuousTime");
  else
    v7 = CFSTR("time");
  if (a3)
    v8 = CFSTR("ProcessID");
  else
    v8 = CFSTR("PID");
  if (a3)
    v9 = CFSTR("ProcessUniqueID");
  else
    v9 = CFSTR("PUID");
  if (a3)
    v10 = CFSTR("ThreadID");
  else
    v10 = CFSTR("TID");
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v6, v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "processID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v11, v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "processUniqueID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v12, v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "threadID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v13, v10);

  if (a3)
  {
    objc_msgSend(v5, "beginWallTimeStringWithTimeZoneName:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
LABEL_20:

      goto LABEL_21;
    }
    v15 = CFSTR("WallTime");
LABEL_19:
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v14, v15);
    goto LABEL_20;
  }
  if (objc_msgSend(v5, "tv_sec") || objc_msgSend(v5, "tv_usec"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v5, "tv_sec"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v16, CFSTR("tv_s"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "tv_usec"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v17, CFSTR("tv_us"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "tz_minuteswest"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v18, CFSTR("tz_m"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "tz_dsttime"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("tz_d");
    goto LABEL_19;
  }
LABEL_21:
  objc_msgSend(v5, "processImageUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v5, "processImageUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
      v22 = CFSTR("ProcessImageUUID");
    else
      v22 = CFSTR("imgUUID");
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v21, v22);

  }
  objc_msgSend(v5, "processImagePath");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v5, "processImagePath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
      v25 = CFSTR("ProcessImagePath");
    else
      v25 = CFSTR("imgPath");
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v24, v25);

  }
  objc_msgSend(v5, "processName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v5, "processName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
      v28 = CFSTR("ProcessName");
    else
      v28 = CFSTR("PName");
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v27, v28);

  }
  objc_msgSend(v5, "senderImageUUID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v5, "senderImageUUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "UUIDString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
      v32 = CFSTR("SenderImageUUID");
    else
      v32 = CFSTR("sImgUUID");
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v31, v32);

  }
  objc_msgSend(v5, "senderImagePath");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v5, "senderImagePath");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
      v35 = CFSTR("SenderImagePath");
    else
      v35 = CFSTR("sImgPath");
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v34, v35);

  }
}

BOOL _initArchiveEventFieldsWithSerializedObjectDictionary(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("time"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v3, "set_machContinuousTimestamp:", objc_msgSend(v5, "unsignedLongLongValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v3, "setProcessID:", objc_msgSend(v7, "intValue"));
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PUID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v3, "setProcessUniqueID:", objc_msgSend(v9, "unsignedLongLongValue"));
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11 != 0;
        if (v11)
        {
          v29 = v11;
          objc_msgSend(v3, "setThreadID:", objc_msgSend(v11, "unsignedLongLongValue"));
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imgUUID"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v13);
            objc_msgSend(v3, "setProcessImageUUID:", v14);

          }
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imgPath"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setProcessImagePath:", v15);

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PName"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setProcessName:", v16);

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sImgUUID"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v17);
            objc_msgSend(v3, "setSenderImageUUID:", v18);

          }
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sImgPath"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setSenderImagePath:", v19);

          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tv_s"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v20)
            objc_msgSend(v3, "setTv_sec:", objc_msgSend(v20, "unsignedLongLongValue"));
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tv_us"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
            objc_msgSend(v3, "setTv_usec:", objc_msgSend(v22, "intValue"));
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tz_m"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
            objc_msgSend(v3, "setTz_minuteswest:", objc_msgSend(v24, "intValue"));
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tz_d"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26)
            objc_msgSend(v3, "setTz_dsttime:", objc_msgSend(v26, "intValue"));

          v11 = v29;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t ___stringPassesAllowlist_block_invoke()
{
  uint64_t result;

  result = SignpostPlatformForDevice();
  _stringPassesAllowlist_platform = result;
  return result;
}

id SignpostReporterCrossPlatformAppleAccountAllowlist()
{
  if (SignpostReporterCrossPlatformAppleAccountAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporterCrossPlatformAppleAccountAllowlist_onceToken, &__block_literal_global_17);
  return (id)SignpostReporterCrossPlatformAppleAccountAllowlist_appleAccountStringArray;
}

id SignpostReporterCrossPlatformSiriAudioStringPasslist()
{
  if (SignpostReporterCrossPlatformSiriAudioStringPasslist_onceToken != -1)
    dispatch_once(&SignpostReporterCrossPlatformSiriAudioStringPasslist_onceToken, &__block_literal_global_18);
  return (id)SignpostReporterCrossPlatformSiriAudioStringPasslist_siriAudioStringArray;
}

id _timeTranslatorDebugLog()
{
  if (_timeTranslatorDebugLog_onceToken != -1)
    dispatch_once(&_timeTranslatorDebugLog_onceToken, &__block_literal_global_116);
  return (id)_timeTranslatorDebugLog_translator_log;
}

void sub_1A1A46A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1A1A470A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1A47300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___timeTranslatorDebugLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SignpostSupport", "TimeTranslationDebug");
  v1 = (void *)_timeTranslatorDebugLog_translator_log;
  _timeTranslatorDebugLog_translator_log = (uint64_t)v0;

}

id SignpostSupportAllowlistedStringSetForCurrentDevice()
{
  void *v0;

  v0 = (void *)SignpostPlatformForDevice();
  return SignpostReporterAllowlistedStringSet(v0);
}

id _combinedStdDev(unint64_t a1, unint64_t a2, double a3, double a4, double a5, double a6)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;

  if (a2 | a1)
  {
    if (a1)
    {
      if (a2)
      {
        v6 = a3 / (double)a1;
        v7 = a5 / (double)a2;
        v8 = a3 + a5;
        v9 = (double)(a2 + a1);
        v10 = v8 / v9;
        v11 = (a4 * a4 + (v6 - v10) * (v6 - v10)) * (double)a1;
        v12 = (void *)MEMORY[0x1E0CB37E8];
        v13 = sqrt((v11 + (a6 * a6 + (v7 - v10) * (v7 - v10)) * (double)a2) / v9);
      }
      else
      {
        v12 = (void *)MEMORY[0x1E0CB37E8];
        v13 = a4;
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB37E8];
      v13 = a6;
    }
    objc_msgSend(v12, "numberWithDouble:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

id _stringAfterPrefix(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a1;
  v4 = objc_msgSend(v3, "rangeOfString:options:", a2, 8);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "substringFromIndex:", v4 + v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

id _checkTokenString(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (_checkTokenString_onceToken != -1)
    dispatch_once(&_checkTokenString_onceToken, &__block_literal_global_640);
  if (objc_msgSend(v1, "rangeOfCharacterFromSet:", _checkTokenString_disallowedCharSet) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("os_signpost aggregation token '%@' contains illegal characters. Please use only alphanumeric characters and '_'."), v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

void _addToPayloadDictionary(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a1;
  v3 = a2;
  if (objc_msgSend(v3, "shouldAdd"))
  {
    objc_msgSend(v3, "total");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_coreAnalyticsTotalFieldName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v4, v5);

    objc_msgSend(v3, "min");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v3, "min");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_coreAnalyticsMinFieldName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v7, v8);

    }
    objc_msgSend(v3, "min");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v3, "max");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_coreAnalyticsMaxFieldName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, v11);

    }
    objc_msgSend(v3, "stddev");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v3, "stddev");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_coreAnalyticsStdDevFieldName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, v14);

    }
  }

}

uint64_t _placeholderTypeForSegment(void *a1)
{
  id v1;
  void *v2;
  int v3;
  void *v4;
  char v5;
  unsigned __int8 v6;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  int v29;

  v1 = a1;
  objc_msgSend(v1, "typeNamespace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("signpost.aggregation"));

  if (v3)
  {
    objc_msgSend(v1, "type");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("description"));

    if ((v5 & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v1, "type");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("count"));

      if ((v9 & 1) != 0)
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend(v1, "type");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("total_duration_ns"));

        if ((v11 & 1) != 0)
        {
          v6 = 2;
        }
        else
        {
          objc_msgSend(v1, "type");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("average_duration_ns"));

          if ((v13 & 1) != 0)
          {
            v6 = 3;
          }
          else
          {
            objc_msgSend(v1, "type");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("min_duration_ns"));

            if ((v15 & 1) != 0)
            {
              v6 = 4;
            }
            else
            {
              objc_msgSend(v1, "type");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("max_duration_ns"));

              if ((v17 & 1) != 0)
              {
                v6 = 5;
              }
              else
              {
                objc_msgSend(v1, "type");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("duration_stddev_ns"));

                if ((v19 & 1) != 0)
                {
                  v6 = 6;
                }
                else
                {
                  objc_msgSend(v1, "type");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("measure_total"));

                  if ((v21 & 1) != 0)
                  {
                    v6 = 7;
                  }
                  else
                  {
                    objc_msgSend(v1, "type");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("measure_average"));

                    if ((v23 & 1) != 0)
                    {
                      v6 = 8;
                    }
                    else
                    {
                      objc_msgSend(v1, "type");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("measure_min"));

                      if ((v25 & 1) != 0)
                      {
                        v6 = 9;
                      }
                      else
                      {
                        objc_msgSend(v1, "type");
                        v26 = (void *)objc_claimAutoreleasedReturnValue();
                        v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("measure_max"));

                        if ((v27 & 1) != 0)
                        {
                          v6 = 10;
                        }
                        else
                        {
                          objc_msgSend(v1, "type");
                          v28 = (void *)objc_claimAutoreleasedReturnValue();
                          v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("measure_stddev"));

                          if (v29)
                            v6 = 11;
                          else
                            v6 = 12;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  else
  {
    v6 = 13;
  }

  return v6;
}

void ___checkTokenString_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890._"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_checkTokenString_disallowedCharSet;
  _checkTokenString_disallowedCharSet = v0;

}

void ___unknownAggregationError_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, CFSTR("Unknown aggregation error"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_unknownAggregationError_unknownAggregationError;
  _unknownAggregationError_unknownAggregationError = v0;

}

id SignpostReporterCrossPlatformSiriPlaybackControlsStringPasslist()
{
  if (SignpostReporterCrossPlatformSiriPlaybackControlsStringPasslist_onceToken != -1)
    dispatch_once(&SignpostReporterCrossPlatformSiriPlaybackControlsStringPasslist_onceToken, &__block_literal_global_21);
  return (id)SignpostReporterCrossPlatformSiriPlaybackControlsStringPasslist_siriPlaybackControlsStringArray;
}

id SignpostReporterCrossPlatformAppleIDAuthenticationAllowlist()
{
  if (SignpostReporterCrossPlatformAppleIDAuthenticationAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporterCrossPlatformAppleIDAuthenticationAllowlist_onceToken, &__block_literal_global_22);
  return (id)SignpostReporterCrossPlatformAppleIDAuthenticationAllowlist_appleIDAuthenticationStringArray;
}

id SignpostReporterCrossPlatformSpeechProfileAllowlist()
{
  if (SignpostReporterCrossPlatformSpeechProfileAllowlist_onceToken != -1)
    dispatch_once(&SignpostReporterCrossPlatformSpeechProfileAllowlist_onceToken, &__block_literal_global_23);
  return (id)SignpostReporterCrossPlatformSpeechProfileAllowlist_allowlist;
}

void sub_1A1A520C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1A52BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1A53460(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_1A1A537B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

uint64_t _dateRangeIntersection(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (objc_msgSend(v7, "compare:", v8) == -1 && objc_msgSend(v9, "compare:", v10) == -1)
  {
    if (objc_msgSend(v7, "compare:", v9) || objc_msgSend(v8, "compare:", v10))
    {
      if (objc_msgSend(v7, "compare:", v10) == -1)
      {
        if (objc_msgSend(v9, "compare:", v8) == -1)
        {
          if (objc_msgSend(v7, "compare:", v9) == 1 || objc_msgSend(v10, "compare:", v8) == 1)
          {
            if (objc_msgSend(v9, "compare:", v7) == 1 || objc_msgSend(v8, "compare:", v10) == 1)
              v11 = 5;
            else
              v11 = 4;
          }
          else
          {
            v11 = 3;
          }
        }
        else
        {
          v11 = 1;
        }
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = 2;
    }
  }
  else
  {
    v11 = 6;
  }

  return v11;
}

uint64_t _mctIntervalIntersection(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unsigned __int8 v4;

  v4 = 6;
  if (a1 < a2 && a3 < a4)
  {
    if (a1 == a3 && a2 == a4)
    {
      return 2;
    }
    else if (a1 >= a4)
    {
      return 0;
    }
    else if (a3 >= a2)
    {
      return 1;
    }
    else if (a1 > a3 || a2 < a4)
    {
      if (a4 < a2 || a3 > a1)
        return 5;
      else
        return 4;
    }
    else
    {
      return 3;
    }
  }
  return v4;
}

id _numberValueForKey(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = a1;
  objc_opt_class();
  _objectValueForKey((uint64_t)v4, v3, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id _getEarliestDate(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a1;
  v4 = a2;
  v5 = (void *)v4;
  if (v3 | v4)
  {
    if (!v3 || (v7 = (void *)v3, v4))
    {
      if (v3 || (v7 = (void *)v4) == 0)
      {
        if (objc_msgSend((id)v3, "compare:", v4) == -1)
          v7 = (void *)v3;
        else
          v7 = v5;
      }
    }
    v6 = v7;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id _getLatestDate(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a1;
  v4 = a2;
  v5 = (void *)v4;
  if (v3 | v4)
  {
    if (!v3 || (v7 = (void *)v3, v4))
    {
      if (v3 || (v7 = (void *)v4) == 0)
      {
        if (objc_msgSend((id)v3, "compare:", v4) == -1)
          v7 = v5;
        else
          v7 = (void *)v3;
      }
    }
    v6 = v7;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id _timeIntervalDict(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v1 = (objc_class *)MEMORY[0x1E0C99E08];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v2, "startMachContinuousTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, kSSCAMLTimeIntervalKey_StartMCT);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v2, "endMachContinuousTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, kSSCAMLTimeIntervalKey_EndMCT);

  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "startSeconds");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, kSSCAMLTimeIntervalKey_StartMCTSeconds);

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "endSeconds");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, kSSCAMLTimeIntervalKey_EndMCTSeconds);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v2, "durationMachContinuousTime"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, kSSCAMLTimeIntervalKey_DurationMCT);

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "durationSeconds");
  objc_msgSend(v11, "numberWithFloat:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, kSSCAMLTimeIntervalKey_DurationMCTSeconds);

  objc_msgSend(v2, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _stringForDate(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, kSSCAMLTimeIntervalKey_StartDate);

  objc_msgSend(v2, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _stringForDate(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, kSSCAMLTimeIntervalKey_EndDate);

  return v3;
}

SSCAMLDurationStats *_durationStat(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  SSCAMLDurationStats *v9;
  SSCAMLDurationStats *v10;
  void *v11;
  void *v12;
  SSCAMLDurationStats *v13;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(a1, "groupNameToGroupDict");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = [SSCAMLDurationStats alloc];
    v10 = v9;
    if (v8)
    {
      objc_msgSend(v8, "measuredValueTypeToMeasuredValueDict");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SSCAMLDurationStats initWithMeasuredValue:](v10, "initWithMeasuredValue:", v12);

    }
    else
    {
      v13 = -[SSCAMLDurationStats initWithMeasuredValue:](v9, "initWithMeasuredValue:", 0);
    }

  }
  else
  {
    v13 = -[SSCAMLDurationStats initWithMeasuredValue:]([SSCAMLDurationStats alloc], "initWithMeasuredValue:", 0);
  }

  return v13;
}

uint64_t _dateRangeIntersectionWithValidation(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  if ((objc_msgSend(v7, "includeTimelines") & 1) != 0)
  {
    objc_msgSend(v7, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endDate");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (!v10 || !v11)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 11, CFSTR("Insufficient information to determine client session date ranges"));
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_14;
    }
    if (v8)
    {
      if (v9)
        goto LABEL_6;
    }
    else
    {
      v8 = v10;
      if (v9)
        goto LABEL_6;
    }
    v9 = v12;
LABEL_6:
    v13 = _dateRangeIntersection(v8, v9, v10, v12);
    v14 = v13;
    if (!a4 || (_DWORD)v13 != 6)
      goto LABEL_15;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Malformed date interval: %@ -> %@"), v8, v9);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 11, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
    v14 = 6;
LABEL_15:

    goto LABEL_16;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 11, CFSTR("Cannot filter client session that does not have timeline information"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = 6;
LABEL_16:

  return v14;
}

id _intervalsIntersectingDateRange(void *a1, void *a2, void *a3, char a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int v19;
  id v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  if (objc_msgSend(v11, "count"))
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v22 = v11;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v19 = _dateRangeIntersectionWithValidation(v18, v9, v10, a5);
          if (v19)
          {
            if (v19 == 1)
              goto LABEL_15;
            if (v19 == 6)
            {

              v20 = 0;
              goto LABEL_18;
            }
            if (v19 == 3 || (a4 & 1) == 0)
              objc_msgSend(v12, "addObject:", v18);
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v15)
          continue;
        break;
      }
    }
LABEL_15:

    v20 = v12;
LABEL_18:

    v11 = v22;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t _mctIntersectionWithValidation(void *a1, unint64_t a2, unint64_t a3, _QWORD *a4)
{
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v7 = a1;
  if ((objc_msgSend(v7, "includeTimelines") & 1) != 0)
  {
    v8 = objc_msgSend(v7, "startMachContinuousTime");
    v9 = objc_msgSend(v7, "endMachContinuousTime");
    if (!a2)
      a2 = v8;
    if (a3 == -1)
      a3 = v9;
    v10 = _mctIntervalIntersection(a2, a3, v8, v9);
    v11 = v10;
    if (a4 && (_DWORD)v10 == 6)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Malformed MCT interval: %llu -> %llu"), a2, a3);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 11, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 11, CFSTR("Cannot filter client session that does not have timeline information"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = 6;
  }

  return v11;
}

id _intervalsIntersectingMCTInterval(unint64_t a1, unint64_t a2, void *a3, char a4, _QWORD *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  id v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (objc_msgSend(v9, "count"))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v9;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v17 = _mctIntersectionWithValidation(v16, a1, a2, a5);
          if (v17)
          {
            if (v17 == 1)
              goto LABEL_15;
            if (v17 == 6)
            {

              v18 = 0;
              goto LABEL_18;
            }
            if (v17 == 3 || (a4 & 1) == 0)
              objc_msgSend(v10, "addObject:", v16);
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_15:

    v18 = v10;
LABEL_18:

    v9 = v20;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void sub_1A1A5B7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
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

void sub_1A1A5BB74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *_stringForDate(void *a1)
{
  id v1;
  void *v2;
  __CFString *v3;

  v1 = a1;
  v2 = v1;
  if (_stringForDate_onceToken != -1)
  {
    dispatch_once(&_stringForDate_onceToken, &__block_literal_global_914);
    if (v2)
      goto LABEL_3;
LABEL_5:
    v3 = CFSTR("Unknown");
    goto LABEL_6;
  }
  if (!v1)
    goto LABEL_5;
LABEL_3:
  objc_msgSend((id)_stringForDate_formatter, "stringFromDate:", v2);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v3;
}

id _valuesForOnGlassIntervals(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD);
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v3;
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
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id _objectValueForKey(uint64_t a1, void *a2, int a3)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  if (a2)
  {
    objc_msgSend(a2, "objectForKeyedSubscript:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") == 1)
    {
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "argument");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "type");

      if (v7 == a3)
      {
        objc_msgSend(v5, "argument");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "argumentObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

uint64_t ___stringForDate_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v1 = (void *)_stringForDate_formatter;
  _stringForDate_formatter = (uint64_t)v0;

  return objc_msgSend((id)_stringForDate_formatter, "setFormatOptions:", 3955);
}

uint64_t *_adjustTimeVal(uint64_t *result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;

  if (a2)
  {
    if (a2 >= 0)
      v2 = a2;
    else
      v2 = -a2;
    v3 = v2 / 0x3B9ACA00;
    v4 = v2 % 0x3B9ACA00 / 0x3E8;
    v5 = *result;
    v6 = *((_DWORD *)result + 2);
    if (a2 < 1)
    {
      v7 = v5 - v3;
      v8 = v6 - v4;
      if (v8 < 0)
      {
        --v7;
        v8 += 1000000;
      }
    }
    else
    {
      v7 = v5 + v3;
      v8 = v6 + v4;
      if (v8 > 999999)
      {
        ++v7;
        v8 -= 1000000;
      }
    }
    *result = v7;
    *((_DWORD *)result + 2) = v8;
  }
  return result;
}

uint64_t _archiveEventsAreEqual(void *a1, void *a2)
{
  void *v2;
  id v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;

  v4 = a1;
  v5 = a2;
  v6 = objc_msgSend(v4, "processID");
  if (v6 != objc_msgSend(v5, "processID"))
    goto LABEL_47;
  v7 = objc_msgSend(v4, "processUniqueID");
  if (v7 != objc_msgSend(v5, "processUniqueID"))
    goto LABEL_47;
  v8 = objc_msgSend(v4, "threadID");
  if (v8 != objc_msgSend(v5, "threadID"))
    goto LABEL_47;
  objc_msgSend(v4, "processImageUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v5, "processImageUUID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
      goto LABEL_46;
  }
  objc_msgSend(v4, "processImageUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    if (v9)
    {

    }
  }
  else
  {
    objc_msgSend(v5, "processImageUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {

    }
    if (v11)
      goto LABEL_47;
  }
  objc_msgSend(v4, "processImageUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12
    || (objc_msgSend(v4, "processImageUUID"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "processImageUUID"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "isEqual:", v2),
        v2,
        v13,
        v14))
  {
    objc_msgSend(v4, "processImagePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v5, "processImagePath");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v2)
        goto LABEL_46;
    }
    objc_msgSend(v4, "processImagePath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {

      if (v9)
      {

      }
    }
    else
    {
      objc_msgSend(v5, "processImagePath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {

      }
      if (v16)
        goto LABEL_47;
    }
    objc_msgSend(v4, "processImagePath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17
      || (objc_msgSend(v4, "processImagePath"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "processImagePath"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "isEqual:", v2),
          v2,
          v18,
          v19))
    {
      objc_msgSend(v4, "processName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v5, "processName");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v2)
          goto LABEL_46;
      }
      objc_msgSend(v4, "processName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {

        if (v9)
        {

        }
      }
      else
      {
        objc_msgSend(v5, "processName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {

        }
        if (v21)
          goto LABEL_47;
      }
      objc_msgSend(v4, "processName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22
        || (objc_msgSend(v4, "processName"),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v5, "processName"),
            v2 = (void *)objc_claimAutoreleasedReturnValue(),
            v24 = objc_msgSend(v23, "isEqual:", v2),
            v2,
            v23,
            v24))
      {
        objc_msgSend(v4, "senderImageUUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v5, "senderImageUUID");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v2)
            goto LABEL_46;
        }
        objc_msgSend(v4, "senderImageUUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {

          if (v9)
          {

          }
        }
        else
        {
          objc_msgSend(v5, "senderImageUUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {

          }
          if (v26)
            goto LABEL_47;
        }
        objc_msgSend(v4, "senderImageUUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v27
          || (objc_msgSend(v4, "senderImageUUID"),
              v28 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v5, "senderImageUUID"),
              v2 = (void *)objc_claimAutoreleasedReturnValue(),
              v29 = objc_msgSend(v28, "isEqual:", v2),
              v2,
              v28,
              v29))
        {
          objc_msgSend(v4, "senderImagePath");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v5, "senderImagePath");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v2)
            {
LABEL_46:

              goto LABEL_47;
            }
          }
          objc_msgSend(v4, "senderImagePath");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
          {

            if (v9)
            {

            }
          }
          else
          {
            objc_msgSend(v5, "senderImagePath");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (v9)
            {

            }
            if (v33)
              goto LABEL_47;
          }
          objc_msgSend(v4, "senderImagePath");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v34
            || (objc_msgSend(v4, "senderImagePath"),
                v35 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v5, "senderImagePath"),
                v36 = (void *)objc_claimAutoreleasedReturnValue(),
                v37 = objc_msgSend(v35, "isEqual:", v36),
                v36,
                v35,
                v37))
          {
            v30 = 1;
            goto LABEL_48;
          }
        }
      }
    }
  }
LABEL_47:
  v30 = 0;
LABEL_48:

  return v30;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

_BYTE *OUTLINED_FUNCTION_2_1(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void SignpostReporterAllowlistedStringSet_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend((id)SignpostReporterAllowlistedStringSet_allowlistSet_19, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A1A28000, v0, v1, "Using string allowlist with %lu elements", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
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

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83860](a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1E0C85328](__name, __value, *(_QWORD *)&__overwrite);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

void tzset(void)
{
  MEMORY[0x1E0C85990]();
}

int unsetenv(const char *a1)
{
  return MEMORY[0x1E0C859D0](a1);
}

