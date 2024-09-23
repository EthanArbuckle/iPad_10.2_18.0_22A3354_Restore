@implementation OSAStateMonitor

+ (void)evaluateState
{
  NSObject *v2;
  uint8_t v3[16];

  if (evaluateState_token != -1)
    dispatch_once(&evaluateState_token, &__block_literal_global_6);
  v2 = OSAStateMonitorLogDomain;
  if (os_log_type_enabled((os_log_t)OSAStateMonitorLogDomain, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A4D21000, v2, OS_LOG_TYPE_DEFAULT, "Running the state monitor.", v3, 2u);
  }
  +[OSAStateMonitor checkCALogWrittenStatus](OSAStateMonitor, "checkCALogWrittenStatus");
  +[OSAStateMonitor checkSubmissionStatus](OSAStateMonitor, "checkSubmissionStatus");
  +[OSAStateMonitor checkAndReportCALogStates](OSAStateMonitor, "checkAndReportCALogStates");
}

void __32__OSAStateMonitor_evaluateState__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.osanalytics.monitors", "state-monitor");
  v1 = (void *)OSAStateMonitorLogDomain;
  OSAStateMonitorLogDomain = (uint64_t)v0;

}

+ (void)recordEvent:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("log-submission")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("ca-log-written")))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[OSAStateMonitor keyForEvent:](OSAStateMonitor, "keyForEvent:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[OSADefaults setObject:forKey:](OSADefaults, "setObject:forKey:", v3, v4);

  }
  else
  {
    +[OSAStateMonitor recordEvent:with:](OSAStateMonitor, "recordEvent:with:", v5, 0);
  }

}

+ (void)recordEvent:(id)a3 with:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = CFSTR("eventName");
  v15 = v5;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "addEntriesFromDictionary:", v7);
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSince1970");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("state-monitor.ca.event.%f"), v12, v14, v15, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    +[OSAStateMonitor recordEvent:with:].cold.1();
  +[OSADefaults setObject:forKey:](OSADefaults, "setObject:forKey:", v9, v13);

}

+ (void)checkCALogWrittenStatus
{
  void *v2;
  double v3;
  double v4;

  +[OSAStateMonitor dateForEvent:](OSAStateMonitor, "dateForEvent:", CFSTR("ca-log-written"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  v4 = v3;

  if (v4 < -90000.0)
    +[OSAStateMonitor postFailureWithReason:](OSAStateMonitor, "postFailureWithReason:", CFSTR("Missing CA log after rollover"));
}

+ (void)checkSubmissionStatus
{
  void *v2;
  double v3;
  double v4;

  if (!OSAIsRSDDisplay())
  {
    +[OSAStateMonitor dateForEvent:](OSAStateMonitor, "dateForEvent:", CFSTR("log-submission"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeIntervalSinceNow");
    v4 = v3;

    if (v4 < -129600.0)
      +[OSAStateMonitor postFailureWithReason:](OSAStateMonitor, "postFailureWithReason:", CFSTR("Log submission is overdue"));
  }
}

+ (void)postFailureWithReason:(id)a3
{
  id v3;
  NSObject *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = OSAStateMonitorLogDomain;
  if (os_log_type_enabled((os_log_t)OSAStateMonitorLogDomain, OS_LOG_TYPE_ERROR))
    +[OSAStateMonitor postFailureWithReason:].cold.1((uint64_t)v3, v4);
  v10 = MEMORY[0x1E0C809B0];
  v11 = v3;
  v5 = (__CFString *)v3;
  AnalyticsSendEventLazy();
  v12[0] = CFSTR("crk");
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance", v10, 3221225472, __41__OSAStateMonitor_postFailureWithReason___block_invoke, &unk_1E4DEE460);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "crashReporterKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("reason");
  v13[0] = v7;
  v8 = CFSTR("<unknown>");
  if (v5)
    v8 = v5;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  rtcsc_send(2006, 2006, v9);

}

id __41__OSAStateMonitor_postFailureWithReason___block_invoke(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = CFSTR("<unknown>");
  if (*(_QWORD *)(a1 + 32))
    v1 = *(const __CFString **)(a1 + 32);
  v3 = CFSTR("reason");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)checkAndReportCALogStates
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A4D21000, a2, OS_LOG_TYPE_DEBUG, "Will discard keys: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

+ (id)keyForEvent:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("state-monitor.%@"), a3);
}

+ (BOOL)processCALogEvent:(id)a3 eventPayload:(id)a4 into:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t ii;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t n;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t buf[16];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (os_log_type_enabled((os_log_t)OSAStateMonitorLogDomain, OS_LOG_TYPE_DEBUG))
    +[OSAStateMonitor processCALogEvent:eventPayload:into:].cold.1();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v7);
  v11 = v10;

  if (v11 >= 300.0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("eventName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*a5)
      *a5 = (id)objc_opt_new();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("ca-2hr-heartbeat")))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("startTimestamp"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*a5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        v15 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
        objc_msgSend(*a5, "setObject:forKeyedSubscript:", v15, v13);

        objc_msgSend(*a5, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("twoHrHeartbeat"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedIntValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17 + 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("twoHrHeartbeat"));

      v19 = &unk_1E4DFDB88;
LABEL_16:
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("lastSuccessfulLogState"));
      objc_msgSend(*a5, "setObject:forKeyedSubscript:", v14, v13);
LABEL_17:

      goto LABEL_18;
    }
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("ca-log-written-new")))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("startTimestamp"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*a5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        v21 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
        objc_msgSend(*a5, "setObject:forKeyedSubscript:", v21, v13);

        objc_msgSend(*a5, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("totalHeartbeats"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, CFSTR("totalHeartbeats"));

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("endTimestamp"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, CFSTR("endTimestamp"));

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("logPath"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v24, CFSTR("logPath"));

      v19 = &unk_1E4DFDBA0;
      goto LABEL_16;
    }
    v69 = v8;
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("submission-started")))
    {
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      objc_msgSend(*a5, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
      if (!v26)
        goto LABEL_18;
      v27 = v26;
      v66 = v12;
      v28 = *(_QWORD *)v91;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v91 != v28)
            objc_enumerationMutation(v13);
          objc_msgSend(*a5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * i));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v7, CFSTR("lastSubmissionStartTimestamp"));
          objc_msgSend(v30, "setObject:forKeyedSubscript:", &unk_1E4DFDBB8, CFSTR("lastSuccessfulLogState"));

        }
        v27 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
      }
      while (v27);
      goto LABEL_29;
    }
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("submission-found-logs")))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("foundLogs"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = 0u;
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      objc_msgSend(*a5, "allKeys");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
      if (!v31)
        goto LABEL_17;
      v32 = v31;
      v64 = v7;
      v67 = v12;
      v33 = *(_QWORD *)v87;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v87 != v33)
            objc_enumerationMutation(v14);
          objc_msgSend(*a5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * j), v64);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("logPath"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "containsObject:", v36))
            objc_msgSend(v35, "setObject:forKeyedSubscript:", &unk_1E4DFDBD0, CFSTR("lastSuccessfulLogState"));

        }
        v32 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v86, v99, 16);
      }
      while (v32);
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("submission-logs-added-to-archive")))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("foundLogs"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      v85 = 0u;
      objc_msgSend(*a5, "allKeys");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
      if (!v37)
        goto LABEL_17;
      v38 = v37;
      v64 = v7;
      v67 = v12;
      v39 = *(_QWORD *)v83;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v83 != v39)
            objc_enumerationMutation(v14);
          objc_msgSend(*a5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * k), v64);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("logPath"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "containsObject:", v42))
            objc_msgSend(v41, "setObject:forKeyedSubscript:", &unk_1E4DFDBE8, CFSTR("lastSuccessfulLogState"));

        }
        v38 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
      }
      while (v38);
    }
    else
    {
      if (!objc_msgSend(v12, "isEqualToString:", CFSTR("submission-http-post-started")))
      {
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("ca-log-retired")))
        {
          v76 = 0u;
          v77 = 0u;
          v74 = 0u;
          v75 = 0u;
          objc_msgSend(*a5, "allKeys");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v74, v96, 16);
          if (!v49)
            goto LABEL_18;
          v50 = v49;
          v65 = v7;
          v66 = v12;
          v68 = *(_QWORD *)v75;
          do
          {
            for (m = 0; m != v50; ++m)
            {
              if (*(_QWORD *)v75 != v68)
                objc_enumerationMutation(v13);
              objc_msgSend(*a5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * m), v65);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("logPath"));
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("logPath"));
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend(v53, "isEqualToString:", v54);

              if (v55)
              {
                objc_msgSend(v52, "setObject:forKeyedSubscript:", &unk_1E4DFDC18, CFSTR("lastSuccessfulLogState"));
                objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("retiredReason"));
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "setObject:forKeyedSubscript:", v56, CFSTR("retiredReason"));

              }
              v8 = v69;
            }
            v50 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v74, v96, 16);
          }
          while (v50);
          v7 = v65;
          goto LABEL_30;
        }
        if (!objc_msgSend(v12, "hasPrefix:", CFSTR("Error")))
          goto LABEL_19;
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        objc_msgSend(*a5, "allKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v70, v95, 16);
        if (!v57)
        {
LABEL_18:

LABEL_19:
          goto LABEL_20;
        }
        v58 = v57;
        v66 = v12;
        v59 = *(_QWORD *)v71;
        do
        {
          for (n = 0; n != v58; ++n)
          {
            if (*(_QWORD *)v71 != v59)
              objc_enumerationMutation(v13);
            objc_msgSend(*a5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * n));
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "setObject:forKeyedSubscript:", v12, CFSTR("lastSubmissionError"));
            objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("errorDesc"));
            v62 = (void *)objc_claimAutoreleasedReturnValue();

            if (v62)
            {
              objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("errorDesc"));
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "setObject:forKeyedSubscript:", v63, CFSTR("errorDesc"));

            }
          }
          v58 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v70, v95, 16);
        }
        while (v58);
LABEL_29:
        v8 = v69;
LABEL_30:
        v12 = v66;
        goto LABEL_18;
      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("foundLogs"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      objc_msgSend(*a5, "allKeys");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v78, v97, 16);
      if (!v43)
        goto LABEL_17;
      v44 = v43;
      v64 = v7;
      v67 = v12;
      v45 = *(_QWORD *)v79;
      do
      {
        for (ii = 0; ii != v44; ++ii)
        {
          if (*(_QWORD *)v79 != v45)
            objc_enumerationMutation(v14);
          objc_msgSend(*a5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * ii), v64);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("logPath"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "containsObject:", v48))
            objc_msgSend(v47, "setObject:forKeyedSubscript:", &unk_1E4DFDC00, CFSTR("lastSuccessfulLogState"));

        }
        v44 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v78, v97, 16);
      }
      while (v44);
    }
    v7 = v64;
    v12 = v67;
    v8 = v69;
    goto LABEL_17;
  }
  v20 = OSAStateMonitorLogDomain;
  if (os_log_type_enabled((os_log_t)OSAStateMonitorLogDomain, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4D21000, v20, OS_LOG_TYPE_DEFAULT, "Event within submission window. Ignoring, will pick up next run.", buf, 2u);
  }
LABEL_20:

  return v11 >= 300.0;
}

+ (id)evaluateCALogStates:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  const __CFString *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  char v41;
  const __CFString *v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  void *v47;
  char v48;
  uint64_t v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  uint64_t v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  int v66;
  id obj;
  id v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __CFString *v75;
  uint8_t buf[16];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[6];
  _QWORD v82[6];
  _QWORD v83[5];
  _QWORD v84[5];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v69 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v71 = v3;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
  if (v72)
  {
    v70 = *(_QWORD *)v78;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v78 != v70)
          objc_enumerationMutation(obj);
        v73 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v4);
        objc_msgSend(v71, "objectForKeyedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalHeartbeats"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "unsignedIntValue");
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("twoHrHeartbeat"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "unsignedIntValue");

        v74 = v5;
        if (v8 != v10)
        {
          v11 = OSAStateMonitorLogDomain;
          if (os_log_type_enabled((os_log_t)OSAStateMonitorLogDomain, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4D21000, v11, OS_LOG_TYPE_DEFAULT, "Identified heartbeat mismatch. Reporting to RTC now.", buf, 2u);
          }
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("endTimestamp"));
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v83[0] = CFSTR("crk");
          +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "crashReporterKey");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v84[0] = v14;
          v84[1] = v5;
          v83[1] = CFSTR("CA_startTimestamp");
          v83[2] = CFSTR("CA_endTimestamp");
          v15 = &stru_1E4DEECB8;
          if (v12)
            v15 = v12;
          v84[2] = v15;
          v83[3] = CFSTR("expectedCAHeartbeats");
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("twoHrHeartbeat"));
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (v16)
            v18 = (void *)v16;
          else
            v18 = &unk_1E4DFDC30;
          v84[3] = v18;
          v83[4] = CFSTR("actualCAHeartbeats");
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalHeartbeats"));
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v19;
          if (v19)
            v21 = (void *)v19;
          else
            v21 = &unk_1E4DFDC30;
          v84[4] = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 5);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          rtcsc_send(2008, 2008, v22);
        }
        v23 = (void *)MEMORY[0x1E0C99D20];
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastSubmissionError"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("errorDesc"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "arrayWithObjects:", v24, v25, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "componentsJoinedByString:", CFSTR(":"));
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("endTimestamp"));
        v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastSuccessfulLogState"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v25) = objc_msgSend(v28, "isEqualToNumber:", &unk_1E4DFDBB8);

        if ((_DWORD)v25)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("logPath"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "fileExistsAtPath:", v29);

          v32 = CFSTR("ErrorFileNotFound");
          if ((v31 & 1) != 0
            || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", CFSTR("ErrorFileNotFound")),
                v33 = (void *)objc_claimAutoreleasedReturnValue(),
                v34 = objc_msgSend(v33, "isReadableFileAtPath:", v29),
                v33,
                v32 = CFSTR("ErrorFileNotReadable"),
                v34))
          {
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v32, v27, 0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "componentsJoinedByString:", CFSTR(":"));
            v36 = objc_claimAutoreleasedReturnValue();

            v27 = (__CFString *)v36;
          }

        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastSuccessfulLogState"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "isEqualToNumber:", &unk_1E4DFDBD0);

        if (v38)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("logPath"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "fileExistsAtPath:", v39);

          v42 = CFSTR("ErrorFileNotFound");
          if ((v41 & 1) != 0
            || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
                v43 = (void *)objc_claimAutoreleasedReturnValue(),
                v44 = objc_msgSend(v43, "isReadableFileAtPath:", v39),
                v43,
                v42 = CFSTR("ErrorFileNotReadable"),
                v44))
          {

            v27 = (__CFString *)v42;
          }

        }
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastSuccessfulLogState"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "isEqualToNumber:", &unk_1E4DFDC18);

        if (v46)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("retiredReason"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("submitted"));

          if ((v48 & 1) == 0)
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("retiredReason"));
            v49 = objc_claimAutoreleasedReturnValue();

            v27 = (__CFString *)v49;
          }
        }
        v81[0] = CFSTR("crk");
        +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "crashReporterKey");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v82[0] = v51;
        v82[1] = v5;
        v81[1] = CFSTR("CA_startTimestamp");
        v81[2] = CFSTR("CA_endTimestamp");
        if (v75)
          v52 = v75;
        else
          v52 = &stru_1E4DEECB8;
        v82[2] = v52;
        v81[3] = CFSTR("submissionStartTimestamp");
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastSubmissionStartTimestamp"));
        v53 = objc_claimAutoreleasedReturnValue();
        v54 = (void *)v53;
        v55 = CFSTR("<unknown>");
        if (v53)
          v55 = (const __CFString *)v53;
        v82[3] = v55;
        v81[4] = CFSTR("lastSuccessfulState");
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lastSuccessfulLogState"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        +[OSAStateMonitor CALogStateToString:](OSAStateMonitor, "CALogStateToString:", (int)objc_msgSend(v56, "intValue"));
        v57 = objc_claimAutoreleasedReturnValue();
        v58 = (void *)v57;
        v81[5] = CFSTR("errorMessage");
        if (v27)
          v59 = v27;
        else
          v59 = &stru_1E4DEECB8;
        v82[4] = v57;
        v82[5] = v59;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 6);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        rtcsc_send(2007, 2007, v60);
        v61 = (void *)objc_opt_new();
        objc_msgSend(v61, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZ"));
        objc_msgSend(v61, "dateFromString:", v74);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v62
          || ((objc_msgSend(MEMORY[0x1E0C99D68], "now"),
               v63 = (void *)objc_claimAutoreleasedReturnValue(),
               objc_msgSend(v63, "timeIntervalSinceDate:", v62),
               v65 = v64,
               v63,
               v65 > 259200.0)
            ? (v66 = 1)
            : (v66 = v46),
              v66 == 1))
        {
          objc_msgSend(v69, "addObject:", v74);
        }

        v4 = v73 + 1;
      }
      while (v72 != v73 + 1);
      v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
    }
    while (v72);
  }

  return v69;
}

+ (id)CALogStateToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 4)
    return CFSTR("Invalid");
  else
    return off_1E4DEE480[a3 - 2];
}

+ (id)dateForEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[OSAStateMonitor keyForEvent:](OSAStateMonitor, "keyForEvent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSADefaults objectForKey:](OSADefaults, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v3;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Initializing event date for %{public}@", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[OSAStateMonitor keyForEvent:](OSAStateMonitor, "keyForEvent:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[OSADefaults setObject:forKey:](OSADefaults, "setObject:forKey:", v5, v6);

  }
  return v5;
}

+ (void)recordEvent:with:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_1A4D21000, MEMORY[0x1E0C81028], v0, "%s %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)postFailureWithReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1A4D21000, a2, OS_LOG_TYPE_ERROR, "State monitor observed a failure: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

+ (void)processCALogEvent:eventPayload:into:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_1A4D21000, v0, v1, "%{public}s %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
