id STYFrameworkDefaults()
{
  id v0;
  _QWORD block[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  id v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3032000000;
  v6 = __Block_byref_object_copy_;
  v7 = __Block_byref_object_dispose_;
  v8 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __STYFrameworkDefaults_block_invoke;
  block[3] = &unk_1E86A0798;
  block[4] = &v3;
  if (STYFrameworkDefaults_onceToken != -1)
    dispatch_once(&STYFrameworkDefaults_onceToken, block);
  v0 = (id)v4[5];
  _Block_object_dispose(&v3, 8);

  return v0;
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
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id getReporter()
{
  if (getReporter_onceToken != -1)
    dispatch_once(&getReporter_onceToken, &__block_literal_global_0);
  return (id)sharedSymptomsReporter;
}

void __getReporter_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0DAFF28]);
  v1 = (void *)sharedSymptomsReporter;
  sharedSymptomsReporter = (uint64_t)v0;

  v7[0] = *MEMORY[0x1E0DAFF68];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = *MEMORY[0x1E0DAFF60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = *MEMORY[0x1E0DAFF50];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)symptomsActions;
  symptomsActions = v5;

}

id descriptionForSymptomsErrorCode(uint64_t a1)
{
  int v1;
  void *v2;
  const __CFString *v3;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error Description for error : %d not available "), a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*MEMORY[0x1E0DAFFD8] == v1)
  {
    v3 = CFSTR("kSymptomDiagnosticErrorServiceNotReady: The service is not yet ready.");
LABEL_21:

    v2 = (void *)v3;
    return v2;
  }
  if (*MEMORY[0x1E0DAFFB8] == v1)
  {
    v3 = CFSTR("kSymptomDiagnosticErrorNotSupported: The requested API is not yet implemented.");
    goto LABEL_21;
  }
  if (*MEMORY[0x1E0DAFFE0] == v1)
  {
    v3 = CFSTR("kSymptomDiagnosticErrorServiceUnavailable: The remote service did not respond.");
    goto LABEL_21;
  }
  if (*MEMORY[0x1E0DAFFD0] == v1)
  {
    v3 = CFSTR("kSymptomDiagnosticErrorServiceInterrupted: The connection with the remote service was interrupted.");
    goto LABEL_21;
  }
  if (*MEMORY[0x1E0DAFFB0] == v1)
  {
    v3 = CFSTR("kSymptomDiagnosticErrorInvalidParameters: The API was called with invalid or unsupported parameters.");
    goto LABEL_21;
  }
  if (*MEMORY[0x1E0DAFFA8] == v1)
  {
    v3 = CFSTR("kSymptomDiagnosticErrorHourlyLimitExceeded: The session was rate limited based on the hourly quota.");
    goto LABEL_21;
  }
  if (*MEMORY[0x1E0DAFF98] == v1)
  {
    v3 = CFSTR("kSymptomDiagnosticErrorDailyLimitExceeded: The session was rate limited based on the daily quota.");
    goto LABEL_21;
  }
  if (*MEMORY[0x1E0DAFFC0] == v1)
  {
    v3 = CFSTR("kSymptomDiagnosticErrorRandomizedSuppression: The session was rate limited based on randomized suppression.");
    goto LABEL_21;
  }
  if (*MEMORY[0x1E0DAFFE8] == v1)
  {
    v3 = CFSTR("kSymptomDiagnosticErrorSessionNotFound: The session requested was not found.");
    goto LABEL_21;
  }
  if (*MEMORY[0x1E0DAFFC8] == v1)
  {
    v3 = CFSTR("kSymptomDiagnosticErrorRequestThrottled : The API request is temporarily throttled due to execssive calls (41)");
    goto LABEL_21;
  }
  return v2;
}

id symptomsSignatureForEvent(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("UIPerformance"), *MEMORY[0x1E0DB00C8]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Responsiveness"), *MEMORY[0x1E0DB0100]);
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v1, "subsystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@.%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0DB00E8]);

  v8 = *MEMORY[0x1E0DB00C0];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Process Name Unavailable"), *MEMORY[0x1E0DB00C0]);
  objc_msgSend(v1, "processName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v1, "processName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v8);

  }
  objc_msgSend(v1, "processImagePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v1, "processImagePath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("processImagePath"));

    objc_msgSend(v1, "processName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(v1, "processImagePath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, v8);

    }
  }
  objc_msgSend(v1, "subsystem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.FrontBoard"));

  if (v17)
  {
    objc_msgSend(v1, "category");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("Watchdog"));

    if (v19)
    {
      objc_msgSend(v1, "category");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("Watchdogkill"));

      if (v21)
      {
        objc_msgSend(v1, "attributes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "valueForKey:", CFSTR("BundleIdOverride"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v23, v8);
        objc_msgSend(v1, "attributes");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "valueForKey:", CFSTR("ExecutableURLKey"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          v26 = (void *)objc_msgSend(v25, "copy");
          if (objc_msgSend(v25, "hasPrefix:", CFSTR("file://")))
          {
            objc_msgSend(v25, "substringFromIndex:", objc_msgSend(CFSTR("file://"), "length"));
            v27 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v2, "setObject:forKeyedSubscript:", v27, CFSTR("processImagePath"));
            v26 = (void *)v27;
          }

        }
      }
    }
  }

  return v2;
}

id symptomsSignatureForInterval(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  objc_msgSend(v1, "endEvent");
  v2 = objc_claimAutoreleasedReturnValue();
  symptomsSignatureForEvent((void *)v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  LOBYTE(v2) = objc_opt_isKindOfClass();

  if ((v2 & 1) != 0)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Responsiveness - Low FrameRates"), *MEMORY[0x1E0DB0100]);
  return v3;
}

void _reportToAbc(void *a1, void *a2)
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
  id v12;

  v12 = a1;
  v3 = a2;
  getReporter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("processImagePath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("processImagePath"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    appDisplayName((uint64_t)v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0DB00C0]);
    }
    else
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("processImagePath"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      bundleIdFromProcessImagePath((uint64_t)v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0DB00C0]);
      }
      else
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("processImagePath"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0DB00C0]);

      }
    }
    objc_msgSend(v12, "removeObjectForKey:", CFSTR("processImagePath"));

  }
  objc_msgSend(v4, "snapshotWithSignature:duration:events:payload:actions:reply:", v12, 0, v3, symptomsActions, &__block_literal_global_70, 0.0);

}

void ___reportToAbc_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0DB00A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logHandle");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      ___reportToAbc_block_invoke_cold_1(v6);
  }
  else
  {
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0DB0090]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");

    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logHandle");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      descriptionForSymptomsErrorCode(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = 67109378;
      v11[1] = v8;
      v12 = 2112;
      v13 = v10;
      _os_log_impl(&dword_1CB87B000, v6, OS_LOG_TYPE_DEFAULT, "ABC did not accept case for signpost event. \n                                                    Error Code : %d \n                                                    Error Description : %@", (uint8_t *)v11, 0x12u);

    }
  }

}

void reportToAbc(void *a1, char a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  char v14;

  v5 = a1;
  v6 = a3;
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sharedSerialQueueAtUtility");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __reportToAbc_block_invoke;
  block[3] = &unk_1E86A08A8;
  v14 = a2;
  v12 = v6;
  v13 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

void __reportToAbc_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    v11[0] = *MEMORY[0x1E0DE8AD8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = *MEMORY[0x1E0DE8AE0];
    v12[0] = v2;
    v12[1] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = *MEMORY[0x1E0DB0060];
    v8 = v3;
    v9 = v4;
    v7 = CFSTR("com.apple.DiagnosticExtensions.tailspin");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  _reportToAbc(*(void **)(a1 + 40), v6);

}

float machCtsTimeToMs(unint64_t a1)
{
  if (machCtsTimeToMs_predicate != -1)
    dispatch_once(&machCtsTimeToMs_predicate, &__block_literal_global_2);
  return *(double *)&machCtsTimeToMs_timestamp_scale * (double)a1 * 1000.0;
}

double __machCtsTimeToMs_block_invoke()
{
  unint64_t v0;
  unint64_t v1;
  double result;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  result = (double)v0 * 0.000000001 / (double)v1;
  machCtsTimeToMs_timestamp_scale = *(_QWORD *)&result;
  return result;
}

float eventEndToNow(void *a1)
{
  id v1;
  uint64_t v2;
  unint64_t v3;

  v1 = a1;
  v2 = mach_continuous_time();
  v3 = objc_msgSend(v1, "timeRecordedMachContinuousTime");

  if (v2 <= v3)
    return -1.0;
  else
    return machCtsTimeToMs(v2 - v3);
}

id dictionaryToString(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;

  v4 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a1, 0, &v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v1, 4);

  return v2;
}

id valueForInfoPlistKeyInImagePath(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  v3 = a1;
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v4, "scanUpToString:intoString:", CFSTR(".app/"), &v14);
  v5 = v14;
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "stringByAppendingString:", CFSTR(".app"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "infoDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "valueForKey:", v3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
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
    v7 = 0;
    v12 = 0;
  }

  return v12;
}

id appDisplayName(uint64_t a1)
{
  return valueForInfoPlistKeyInImagePath(CFSTR("CFBundleDisplayName"), a1);
}

id bundleIdFromProcessImagePath(uint64_t a1)
{
  return valueForInfoPlistKeyInImagePath(CFSTR("CFBundleIdentifier"), a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void postThermalNotification(void *a1)
{
  void *v1;
  double v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a1;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "timeIntervalSinceDate:", lastPublishedTimeForThermals);
  if (v2 > 20.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", v6, 0, 0);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)lastPublishedTimeForThermals;
    lastPublishedTimeForThermals = v4;

  }
}

void postMemoryNotification(void *a1)
{
  void *v1;
  double v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a1;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "timeIntervalSinceDate:", lastPublishedTimeForMemory);
  if (v2 > 20.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", v6, 0, 0);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)lastPublishedTimeForMemory;
    lastPublishedTimeForMemory = v4;

  }
}

void monitorThermalPressure()
{
  __CFString **v0;
  uint64_t state64;

  if (monitorThermalPressure_onceToken != -1)
    dispatch_once(&monitorThermalPressure_onceToken, &__block_literal_global_5);
  state64 = 0;
  notify_get_state(thermalPressureToken, &state64);
  if ((uint64_t)state64 <= 29)
  {
    v0 = &kSTYNoThermalPressureNotification;
    if (!state64 || state64 == 20)
      goto LABEL_10;
  }
  else if (state64 == 50 || state64 == 40 || state64 == 30)
  {
    v0 = &kSTYHeavyThermalPressureNotification;
LABEL_10:
    postThermalNotification(*v0);
  }
}

uint64_t __monitorThermalPressure_block_invoke()
{
  return notify_register_check((const char *)*MEMORY[0x1E0C83A00], &thermalPressureToken);
}

void monitorMemoryPressure()
{
  __CFString **v0;
  size_t v1;
  int v2;

  v2 = 1;
  v1 = 4;
  if (!sysctlbyname("kern.memorystatus_vm_pressure_level", &v2, &v1, 0, 0))
  {
    if ((v2 - 1) >= 2)
    {
      if (v2 != 4)
        return;
      v0 = &kSTYHeavyMemoryPressureNotification;
    }
    else
    {
      v0 = &kSTYNoMemoryPressureNotification;
    }
    postMemoryNotification(*v0);
  }
}

void currentLevels()
{
  NSObject *v0;
  id v1;

  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sharedConcurrentQueueAtUtility");
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v0, &__block_literal_global_11_0);

}

void __currentLevels_block_invoke()
{
  monitorMemoryPressure();
  monitorThermalPressure();
}

void startMonitoringSystemConditions()
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_12);
}

void __startMonitoringSystemConditions_block_invoke()
{
  if (startMonitoringSystemConditions_onceToken != -1)
    dispatch_once(&startMonitoringSystemConditions_onceToken, &__block_literal_global_13);
}

void __startMonitoringSystemConditions_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 1, &__block_literal_global_16_0, 30.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pollTimer;
  pollTimer = v0;

}

uint64_t stopMonitoringSystemConditions()
{
  uint64_t result;

  if (pollTimer)
    objc_msgSend((id)pollTimer, "invalidate");
  result = thermalPressureToken;
  if (thermalPressureToken)
    return notify_cancel(thermalPressureToken);
  return result;
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void processResponse(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  _BYTE v35[14];
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "objectForKey:", kSTYTailspinSaveOperationFailedErrorKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", kSTYScenarioReportRefKey);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v2)
  {
    objc_msgSend((id)outstandingTailspinSaveRequests, "objectForKey:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend((id)outstandingTailspinSaveRequests, "objectForKey:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "objectForKey:", kSTYFilepathToSavedTailspinKey);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logHandle");
      v13 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        processResponse_cold_3(v6);

      +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logHandle");
      v15 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        -[NSObject scenario](v6, "scenario");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "scenarioID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)perfIssueDetectionTimeLogs, "objectForKey:", v4);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeIntervalSinceDate:", v28);
        *(_DWORD *)buf = 138413058;
        v33 = v27;
        v34 = 2048;
        *(_QWORD *)v35 = v29;
        *(_WORD *)&v35[8] = 1024;
        *(_DWORD *)&v35[10] = objc_msgSend(v4, "intValue");
        v36 = 2112;
        v37 = v10;
        _os_log_debug_impl(&dword_1CB87B000, v15, OS_LOG_TYPE_DEBUG, "[Signpost: %@] Response details is as follows:\n\t  Total time to process tailspin save request by HangTracer: %f\n\t Request Identifier: %d\n\t Path to saved tailspin: %@ ", buf, 0x26u);

      }
      objc_msgSend((id)outstandingTailspinSaveRequests, "removeObjectForKey:", v4);
      objc_msgSend((id)perfIssueDetectionTimeLogs, "removeObjectForKey:", v4);

      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = objc_claimAutoreleasedReturnValue();
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logHandle");
    v20 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      processResponse_cold_2(v4);

    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "logHandle");
    v22 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      processResponse_cold_1();

    goto LABEL_23;
  }
  if (!v3)
  {
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logHandle");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      processResponse_cold_4(v2);
    goto LABEL_24;
  }
  objc_msgSend((id)outstandingTailspinSaveRequests, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend((id)outstandingTailspinSaveRequests, "objectForKey:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logHandle");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[NSObject scenario](v6, "scenario");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "scenarioID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v4, "intValue");
      objc_msgSend((id)outstandingTailspinSaveRequests, "objectForKey:", v4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "localizedDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v33 = v23;
      v34 = 1024;
      *(_DWORD *)v35 = v24;
      *(_WORD *)&v35[4] = 2112;
      *(_QWORD *)&v35[6] = v25;
      v36 = 2112;
      v37 = v26;
      _os_log_error_impl(&dword_1CB87B000, v8, OS_LOG_TYPE_ERROR, "[Signpost: %@] The response from hangtracerd for report with Request identifier : %d and scenarioID %@ errored out with error message %@", buf, 0x26u);

    }
    objc_msgSend((id)outstandingTailspinSaveRequests, "removeObjectForKey:", v4);
LABEL_23:
    objc_msgSend((id)perfIssueDetectionTimeLogs, "removeObjectForKey:", v4);
LABEL_24:

    goto LABEL_25;
  }
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "logHandle");
  v18 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    processResponse_cold_5();

  objc_msgSend((id)perfIssueDetectionTimeLogs, "removeObjectForKey:", v4);
LABEL_25:

}

void responseRecieved(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a5;
  v6 = htInteractionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __responseRecieved_block_invoke;
  block[3] = &unk_1E86A0B60;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, block);

}

void __responseRecieved_block_invoke(uint64_t a1)
{
  processResponse(*(void **)(a1 + 32));
}

void refreshPreferences()
{
  void *v0;
  void *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;

  v0 = (void *)CFPreferencesCopyValue(CFSTR("monitorDelayedSignpostIntervals"), CFSTR("com.apple.sentry.Signpostmonitor"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  monitorDelayedSignpostIntervals = objc_msgSend(v0, "intValue") != 0;
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    refreshPreferences_cold_1(v2, v3, v4);

}

void refreshHTPreferences()
{
  void *v0;
  void *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;

  v0 = (void *)CFPreferencesCopyValue(CFSTR("HangTracerCollectOSSignposts"), CFSTR("com.apple.da"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  HangTracerCollectOSSignposts = objc_msgSend(v0, "intValue") != 0;
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    refreshHTPreferences_cold_1(v2, v3, v4);

}

void sub_1CB88305C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CB883888(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1CB885D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

id TailspinFilenamePrefixForInterval(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  id v9;
  void *v10;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = a1;
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "durationSeconds");
  v7 = v6;

  objc_msgSend(v1, "stringWithFormat:", CFSTR("Sentry_%@_%@_%.1fs"), v3, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v8, "length") < 0x3D)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(v8, "substringToIndex:", 59);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

void sub_1CB887158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CB887A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CB887F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location)
{
  id *v33;
  id *v34;

  objc_destroyWeak(v34);
  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t OUTLINED_FUNCTION_12(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  return result;
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 8u);
}

void OUTLINED_FUNCTION_15(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_16(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t OUTLINED_FUNCTION_26()
{
  id *v0;

  return objc_msgSend(*v0, "intValue");
}

void ___reportToAbc_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1CB87B000, log, OS_LOG_TYPE_DEBUG, "ABC successfully accepted case for signpost event", v1, 2u);
}

void processResponse_cold_1()
{
  NSObject *v0;
  void *v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  _DWORD v7[2];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_23();
  v3 = v2;
  v10 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(v2, "intValue");
  objc_msgSend((id)perfIssueDetectionTimeLogs, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "timeIntervalSinceDate:", v5);
  v7[0] = 67109376;
  v7[1] = v4;
  v8 = 2048;
  v9 = v6;
  _os_log_debug_impl(&dword_1CB87B000, v0, OS_LOG_TYPE_DEBUG, "Total time to process tailspin save request by HangTracer for Request identifier : %d was %f Seconds", (uint8_t *)v7, 0x12u);

  OUTLINED_FUNCTION_0_2();
}

void processResponse_cold_2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "intValue");
  OUTLINED_FUNCTION_16(&dword_1CB87B000, v1, v2, "The response from hangtracerd for report with Request identifier: %d was receieved late", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_25();
}

void processResponse_cold_3(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "scenario");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scenarioID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1CB87B000, v3, v4, "[Signpost: %@] Received asynchronous response from HangTracer.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_2();
}

void processResponse_cold_4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1CB87B000, v2, v3, "The Request identifier  is missing in the response the error message is %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

void processResponse_cold_5()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  OUTLINED_FUNCTION_23();
  objc_msgSend(v1, "intValue");
  objc_msgSend(v0, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10(&dword_1CB87B000, v2, v3, "The response from hangtracerd for report with Request identifier: %d errored out with error message %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_2();
}

void refreshPreferences_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = monitorDelayedSignpostIntervals;
  OUTLINED_FUNCTION_14(&dword_1CB87B000, a1, a3, "The preferences changed the new value of monitorDelayedSignpostIntervals is : %d", (uint8_t *)v3);
  OUTLINED_FUNCTION_8();
}

void refreshHTPreferences_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = HangTracerCollectOSSignposts;
  OUTLINED_FUNCTION_14(&dword_1CB87B000, a1, a3, "The HT preferences changed the new value of HangTracerCollectOSSignposts is : %d", (uint8_t *)v3);
  OUTLINED_FUNCTION_8();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988C8]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988D0]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

uint64_t DRTailspinRequest()
{
  return MEMORY[0x1E0D1D230]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x1E0C9A0C8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
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

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
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

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x1E0C83C88]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1E0DE8000](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

uint64_t tailspin_dump_output()
{
  return MEMORY[0x1E0DE8B20]();
}

