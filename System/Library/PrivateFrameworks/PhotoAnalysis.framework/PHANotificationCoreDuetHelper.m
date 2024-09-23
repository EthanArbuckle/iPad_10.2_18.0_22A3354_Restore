@implementation PHANotificationCoreDuetHelper

+ (BOOL)userIsActivelyUsingAppWithName:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  BOOL v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  NSObject *v37;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  uint8_t v52[128];
  uint8_t buf[4];
  id v54;
  __int16 v55;
  double v56;
  __int16 v57;
  uint64_t v58;
  void *v59;
  _QWORD v60[5];

  v60[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D15AF8], "appInFocusStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 16, -21, v8, 0);
  v43 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithStartInDateRangeFrom:to:");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AD0], "predicateForEventsWithStringValue:", v5);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3528];
  v42 = (void *)v9;
  v60[0] = v9;
  v60[1] = v10;
  v45 = (void *)v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "andPredicateWithSubpredicates:", v12);
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0D15A08]);
  v59 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setEventStreams:", v15);

  v44 = (void *)v13;
  objc_msgSend(v14, "setPredicate:", v13);
  objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  objc_msgSend(v16, "executeQuery:error:", v14, &v51);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v51;
  v19 = v18;
  v46 = v17;
  if (!v18)
  {
    if ((unint64_t)objc_msgSend(v17, "count") > 2)
    {
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v27 = v17;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v28)
      {
        v29 = v28;
        v39 = v7;
        v40 = v6;
        v41 = v5;
        v30 = *(_QWORD *)v48;
        v31 = 0.0;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v48 != v30)
              objc_enumerationMutation(v27);
            v33 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            objc_msgSend(v33, "endDate", v39, v40, v41);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "startDate");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "timeIntervalSinceDate:", v35);
            v31 = v31 + v36;

          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        }
        while (v29);

        v6 = v40;
        v5 = v41;
        v7 = v39;
        if (v31 >= 60.0)
        {
          v23 = 1;
          v21 = v42;
          v20 = (void *)v43;
          goto LABEL_29;
        }
      }
      else
      {

        v31 = 0.0;
      }
      v21 = v42;
      v20 = (void *)v43;
      if (__PXLoggraph_workerOnceToken != -1)
        dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_11_6094);
      v37 = __PXLoggraph_workerOSLog;
      if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v54 = v5;
        v55 = 2048;
        v56 = v31;
        v57 = 2048;
        v58 = 0x404E000000000000;
        _os_log_impl(&dword_1CAC16000, v37, OS_LOG_TYPE_INFO, "%@ Not used long enough: %.0f < %.0f", buf, 0x20u);
      }
    }
    else
    {
      if (__PXLoggraph_workerOnceToken != -1)
        dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_9_6092);
      v21 = v42;
      v20 = (void *)v43;
      v24 = (void *)__PXLoggraph_workerOSLog;
      if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
      {
        v25 = v24;
        v26 = objc_msgSend(v46, "count");
        *(_DWORD *)buf = 138412802;
        v54 = v5;
        v55 = 2048;
        v56 = *(double *)&v26;
        v57 = 2048;
        v58 = 3;
        _os_log_impl(&dword_1CAC16000, v25, OS_LOG_TYPE_INFO, "%@ Not launched enough times: %lu < %lu", buf, 0x20u);

      }
    }
    v23 = 0;
    goto LABEL_29;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v18);
  v21 = v42;
  v20 = (void *)v43;
  if (__PXLoggraph_workerOnceToken != -1)
    dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_6090);
  v22 = __PXLoggraph_workerOSLog;
  if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v54 = v19;
    v55 = 2112;
    v56 = *(double *)&v5;
    _os_log_error_impl(&dword_1CAC16000, v22, OS_LOG_TYPE_ERROR, "Error: %@, assuming the user is using the app %@", buf, 0x16u);
  }
  v23 = 1;
LABEL_29:

  return v23;
}

void __70__PHANotificationCoreDuetHelper_userIsActivelyUsingAppWithName_error___block_invoke_10()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

void __70__PHANotificationCoreDuetHelper_userIsActivelyUsingAppWithName_error___block_invoke_8()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

void __70__PHANotificationCoreDuetHelper_userIsActivelyUsingAppWithName_error___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

@end
