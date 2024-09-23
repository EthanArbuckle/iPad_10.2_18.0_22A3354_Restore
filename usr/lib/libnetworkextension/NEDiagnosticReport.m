@implementation NEDiagnosticReport

+ (void)logInternalError:(id)a3 subType:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  double v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  id v23;
  __int16 v24;
  __CFString *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7 && v8)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "processName");
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
      v12 = (__CFString *)v11;
    else
      v12 = CFSTR("<unknown>");
    os_unfair_lock_lock((os_unfair_lock_t)&logInternalError_subType_context__lock);
    objc_msgSend((id)logInternalError_subType_context__timestampLoggedError, "timeIntervalSinceNow");
    if (v13 == 0.0 || fabs(v13) >= *(double *)&logInternalError_subType_context__frequencyLoggedError)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)logInternalError_subType_context__timestampLoggedError;
      logInternalError_subType_context__timestampLoggedError = v14;

      logInternalError_subType_context__frequencyLoggedError = 0x40F5180000000000;
      os_unfair_lock_unlock((os_unfair_lock_t)&logInternalError_subType_context__lock);
      ne_log_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138412802;
        v23 = v8;
        v24 = 2112;
        v25 = v12;
        v26 = 2112;
        v27 = v9;
        _os_log_impl(&dword_208439000, v16, OS_LOG_TYPE_DEFAULT, "NEDiagnosticReport - subType <%@> for %@ with context <%@>", (uint8_t *)&v22, 0x20u);
      }

      v17 = objc_alloc_init(MEMORY[0x24BEB3470]);
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:", CFSTR("NetworkExtension"), v7, v8, v12, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          if (v9)
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BEB3580]);
          objc_msgSend(v18, "snapshotWithSignature:delay:events:payload:actions:reply:", v20, 0, 0, 0, &__block_literal_global, 0.0);
        }
        else
        {
          ne_log_obj();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v22) = 0;
            _os_log_error_impl(&dword_208439000, v21, OS_LOG_TYPE_ERROR, "NEDiagnosticReport - failed to get signature", (uint8_t *)&v22, 2u);
          }

        }
      }

    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&logInternalError_subType_context__lock);
    }

  }
}

void __55__NEDiagnosticReport_logInternalError_subType_context___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl(&dword_208439000, v3, OS_LOG_TYPE_DEFAULT, "NEDiagnosticReport - submission response = %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("success"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "intValue") != 1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&logInternalError_subType_context__lock);
    logInternalError_subType_context__frequencyLoggedError = 0x40AC200000000000;
    os_unfair_lock_unlock((os_unfair_lock_t)&logInternalError_subType_context__lock);
  }

}

@end
