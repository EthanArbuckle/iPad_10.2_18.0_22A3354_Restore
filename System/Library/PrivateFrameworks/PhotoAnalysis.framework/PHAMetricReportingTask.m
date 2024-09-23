@implementation PHAMetricReportingTask

- (NSString)name
{
  return (NSString *)CFSTR("PHAMetricReportingTask");
}

- (double)period
{
  int HasInternalDiagnostics;
  double result;

  HasInternalDiagnostics = PFOSVariantHasInternalDiagnostics();
  result = 604800.0;
  if (HasInternalDiagnostics)
    return 86400.0;
  return result;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (id)incrementalKey
{
  return 0;
}

- (id)taskClassDependencies
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)priority
{
  return 1;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  return 1;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t i;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;
  id v30;
  id obj;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  NSObject *v40;
  uint64_t *v41;
  double v42;
  double v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  _BYTE v52[128];
  id v53;
  uint8_t buf[4];
  _BYTE v55[14];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30 = a4;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 0;
  objc_msgSend(v6, "availableMetricEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (v9)
  {
    v10 = 1.0 / (double)(unint64_t)(v8 + 1);
    v34 = *(_QWORD *)v45;
    v11 = 0.0;
    while (2)
    {
      v33 = v9;
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v45 != v34)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if ((objc_msgSend(v13, "shouldReportMetrics") & 1) != 0)
        {
          v39[0] = MEMORY[0x1E0C809B0];
          v39[1] = 3221225472;
          v39[2] = __69__PHAMetricReportingTask_runWithGraphManager_progressReporter_error___block_invoke;
          v39[3] = &unk_1E8521370;
          v42 = v11;
          v43 = v10;
          v41 = &v48;
          v32 = v30;
          v40 = v32;
          objc_msgSend(v13, "gatherMetricsWithProgressBlock:", v39);
          if (*((_BYTE *)v49 + 24))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v55 = 87;
              *(_WORD *)&v55[4] = 2080;
              *(_QWORD *)&v55[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnal"
                                   "ysis/Framework/Storytelling/Tasks/PHAMetricReportingTask.m";
              _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            if (a5 && !*a5)
            {
              objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_43;
          }
          if (objc_msgSend(v13, "conformsToProtocol:", &unk_1EF9AA618))
          {
            v14 = v13;
            objc_msgSend(v14, "payloads");
          }
          else
          {
            objc_msgSend(v13, "payload");
            v14 = (id)objc_claimAutoreleasedReturnValue();
            v53 = v14;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v19 = v18;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
          if (v20)
          {
            v21 = *(_QWORD *)v36;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v36 != v21)
                  objc_enumerationMutation(v19);
                v23 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
                objc_msgSend(v6, "analytics");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "identifier");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "sendEvent:withPayload:", v25, v23);

              }
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v52, 16);
            }
            while (v20);
          }

          if (*((_BYTE *)v49 + 24))
          {
            *((_BYTE *)v49 + 24) = 1;
LABEL_37:
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v55 = 101;
              *(_WORD *)&v55[4] = 2080;
              *(_QWORD *)&v55[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnal"
                                   "ysis/Framework/Storytelling/Tasks/PHAMetricReportingTask.m";
              _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            if (a5 && !*a5)
            {
              objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }

LABEL_43:
            goto LABEL_44;
          }
          v11 = v11 + 1.0;
          v26 = -[NSObject isCancelledWithProgress:](v32, "isCancelledWithProgress:", v10 * v11);
          *((_BYTE *)v49 + 24) = v26;
          if ((v26 & 1) != 0)
            goto LABEL_37;

          v15 = v40;
        }
        else
        {
          v15 = MEMORY[0x1E0C81028];
          v16 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v13, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v55 = v17;
            _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PHAMetricReportingTask] Skipping metrics reporting for event %@.", buf, 0xCu);

            v15 = MEMORY[0x1E0C81028];
          }
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      if (v9)
        continue;
      break;
    }
  }

  if (*((_BYTE *)v49 + 24))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v55 = 104;
      *(_WORD *)&v55[4] = 2080;
      *(_QWORD *)&v55[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotoAnalysis/Fra"
                           "mework/Storytelling/Tasks/PHAMetricReportingTask.m";
      _os_log_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    if (!a5 || *a5)
    {
LABEL_44:
      v27 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
      v27 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v27 = 1;
  }

  _Block_object_dispose(&v48, 8);
  return v27;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHAMetricReportingTask timeoutFatal:]", "PHAMetricReportingTask.m", 110, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHAMetricReportingTask is stuck", v3, 2u);
  }
}

uint64_t __69__PHAMetricReportingTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", (*(double *)(a1 + 48) + a3) * *(double *)(a1 + 56));
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v5 + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a2 = 1;
  return result;
}

@end
