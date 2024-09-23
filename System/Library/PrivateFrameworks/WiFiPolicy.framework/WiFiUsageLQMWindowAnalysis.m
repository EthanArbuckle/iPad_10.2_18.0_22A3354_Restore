@implementation WiFiUsageLQMWindowAnalysis

- (void)updateWithLQMSample:(id)a3
{
  id v4;
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
  int v15;
  const char *v16;
  __int16 v17;
  WiFiUsageLQMWindowAnalysis *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "networkDetails");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "connectedBss");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bssid");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

    objc_msgSend(v4, "networkDetails");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "connectedBss");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bssid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && (objc_msgSend(v11, "isEqualToString:", v14) & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136316418;
        v16 = "-[WiFiUsageLQMWindowAnalysis updateWithLQMSample:]";
        v17 = 2112;
        v18 = self;
        v19 = 2160;
        v20 = 1752392040;
        v21 = 2112;
        v22 = v11;
        v23 = 2160;
        v24 = 1752392040;
        v25 = 2112;
        v26 = v14;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: performing LQM window analysis for reason %@ (ending this analysis early because the BSSID has changed (%{mask.hash}@ -> %{mask.hash}@)", (uint8_t *)&v15, 0x3Eu);
      }
      -[WiFiUsageLQMWindowAnalysis performAnalysis](self, "performAnalysis");
    }
    else
    {
      -[WiFiUsageLQMRollingWindow addSample:](self->_windowAfterTrigger, "addSample:", v4);
    }

  }
}

+ (BOOL)isInCallAnalysisDue:(id)a3
{
  double v3;

  if (_inCallAnalysisIntervalSecEnabled != 1)
    return 0;
  objc_msgSend(a3, "timeIntervalSinceNow");
  return *(double *)&_inCallAnalysisIntervalSec <= -v3;
}

+ (BOOL)isKernerlParsingEnabled
{
  return _isKernelParsingEnabled;
}

+ (unint64_t)maxConcurrentAnalysis
{
  return _maxConcurrentAnalysis;
}

+ (id)config
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;

  if (_isKernelParsingEnabled)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("with likelyhood of fetching in-kernel LQM rolling window: %@"), _fetchKernelWindowSamplingRates);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = &stru_1E881F240;
  }
  if (_inCallAnalysisIntervalSecEnabled == 1)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&_inCallAnalysisIntervalSec);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsagePrivacyFilter getHumanSecondsFromObject:](WiFiUsagePrivacyFilter, "getHumanSecondsFromObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("every %@"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E881F240;
  }
  v7 = CFSTR("YES");
  if (_isKernelParsingEnabled)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (!_inCallAnalysisIntervalSecEnabled)
    v7 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("metricPrefix set to '%@' ; cdfMetricName set to '%@' ; sankeyMetricName set to '%@' ; maxConcurrentAnalysis set to %u\nLikelyhood of creating an analsyis: %@\nLikelyhood of sending analsyis to CA: %@\nKernel window parsing enabled: %@ %@\nInCall LQMAnalysis enabled: %@ %@"),
    _metricPrefix,
    _cdfMetricName,
    _sankeyMetricName,
    _maxConcurrentAnalysis,
    _createAnalysisSamplingRates,
    _submitToCASamplingRates,
    v8,
    v2,
    v7,
    v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)initialize
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = (void *)_metricPrefix;
    _metricPrefix = (uint64_t)CFSTR("com.apple.wifi.lqmanalysis");

    v5 = (void *)_cdfMetricName;
    _cdfMetricName = (uint64_t)CFSTR("featuresbyfield");

    v6 = (void *)_sankeyMetricName;
    _sankeyMetricName = (uint64_t)CFSTR("allfeatures");

    v7 = objc_opt_new();
    v8 = (void *)_createAnalysisSamplingRates;
    _createAnalysisSamplingRates = v7;

    v9 = objc_opt_new();
    v10 = (void *)_submitToCASamplingRates;
    _submitToCASamplingRates = v9;

    v11 = objc_opt_new();
    v12 = (void *)_fetchKernelWindowSamplingRates;
    _fetchKernelWindowSamplingRates = v11;

    v13 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v14 = (void *)_dateFormatter_1;
    _dateFormatter_1 = (uint64_t)v13;

    objc_msgSend((id)_dateFormatter_1, "setDateFormat:", CFSTR("HH:mm:ss"));
    _isKernelParsingEnabled = 0;
    _maxConcurrentAnalysis = 1;
    _inCallAnalysisIntervalSecEnabled = 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(a1, "config");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136315394;
      v17 = "+[WiFiUsageLQMWindowAnalysis initialize]";
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v16, 0x16u);

    }
  }
}

+ (void)updateConfig
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  WiFiUsageLQMAnalysisSamplingRate *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  WiFiUsageLQMAnalysisSamplingRate *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  uint64_t v37;
  void *v38;
  WiFiUsageLQMAnalysisSamplingRate *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  uint64_t v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  if (objc_msgSend(v3, "isEqual:", objc_opt_class()))
  {
    +[WiFiUsageLQMConfiguration getConfigForKey:](WiFiUsageLQMConfiguration, "getConfigForKey:", CFSTR("LQMWindowAnalysis"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "objectForKey:", CFSTR("MetricPrefix"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend((id)_metricPrefix, "isEqualToString:", v5) & 1) == 0)
            objc_storeStrong((id *)&_metricPrefix, v5);
        }
        objc_msgSend(v4, "objectForKey:", CFSTR("CDFMetricName"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend((id)_cdfMetricName, "isEqualToString:", v6) & 1) == 0)
          {
            objc_storeStrong((id *)&_cdfMetricName, v6);
          }
        }
        objc_msgSend(v4, "objectForKey:", CFSTR("SanKeyMetricName"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend((id)_sankeyMetricName, "isEqualToString:", v7) & 1) == 0)
          {
            objc_storeStrong((id *)&_sankeyMetricName, v7);
          }
        }
        objc_msgSend(v4, "objectForKey:", CFSTR("MaxConcurrentAnalysis"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            _maxConcurrentAnalysis = objc_msgSend(v8, "unsignedIntValue");
        }
        objc_msgSend(v4, "objectForKey:", CFSTR("AnalysisCreationSampling"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v50 = v4;
        v51 = a1;
        if (v9)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v47 = v9;
            v10 = v9;
            v60 = 0u;
            v61 = 0u;
            v62 = 0u;
            v63 = 0u;
            objc_msgSend(v10, "allKeys");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v61;
              do
              {
                for (i = 0; i != v13; ++i)
                {
                  if (*(_QWORD *)v61 != v14)
                    objc_enumerationMutation(v11);
                  v16 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
                  objc_msgSend(v10, "objectForKeyedSubscript:", v16);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v18 = -[WiFiUsageLQMAnalysisSamplingRate initWithValue:]([WiFiUsageLQMAnalysisSamplingRate alloc], "initWithValue:", v17);
                      objc_msgSend((id)_createAnalysisSamplingRates, "setObject:forKeyedSubscript:", v18, v16);

                    }
                  }

                }
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
              }
              while (v13);
            }

            v4 = v50;
            a1 = v51;
            v9 = v47;
          }
        }
        objc_msgSend(v4, "objectForKey:", CFSTR("EventSubmissionSampling"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v48 = v19;
            v20 = v19;
            v56 = 0u;
            v57 = 0u;
            v58 = 0u;
            v59 = 0u;
            objc_msgSend(v20, "allKeys");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
            if (v22)
            {
              v23 = v22;
              v24 = *(_QWORD *)v57;
              do
              {
                for (j = 0; j != v23; ++j)
                {
                  if (*(_QWORD *)v57 != v24)
                    objc_enumerationMutation(v21);
                  v26 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * j);
                  objc_msgSend(v20, "objectForKeyedSubscript:", v26);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v28 = -[WiFiUsageLQMAnalysisSamplingRate initWithValue:]([WiFiUsageLQMAnalysisSamplingRate alloc], "initWithValue:", v27);
                      objc_msgSend((id)_submitToCASamplingRates, "setObject:forKeyedSubscript:", v28, v26);

                    }
                  }

                }
                v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
              }
              while (v23);
            }

            v4 = v50;
            a1 = v51;
            v19 = v48;
          }
        }
        objc_msgSend(v4, "objectForKey:", CFSTR("KernelWindowParsingEnabled"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            _isKernelParsingEnabled = objc_msgSend(v29, "BOOLValue");
        }
        objc_msgSend(v4, "objectForKey:", CFSTR("KernelWindowSamplingRatePercentages"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v49 = v30;
            v31 = v30;
            v52 = 0u;
            v53 = 0u;
            v54 = 0u;
            v55 = 0u;
            objc_msgSend(v31, "allKeys");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
            if (v33)
            {
              v34 = v33;
              v35 = *(_QWORD *)v53;
              do
              {
                for (k = 0; k != v34; ++k)
                {
                  if (*(_QWORD *)v53 != v35)
                    objc_enumerationMutation(v32);
                  v37 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * k);
                  objc_msgSend(v31, "objectForKeyedSubscript:", v37);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v39 = -[WiFiUsageLQMAnalysisSamplingRate initWithValue:]([WiFiUsageLQMAnalysisSamplingRate alloc], "initWithValue:", v38);
                      objc_msgSend((id)_fetchKernelWindowSamplingRates, "setObject:forKeyedSubscript:", v39, v37);

                    }
                  }

                }
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v66, 16);
              }
              while (v34);
            }

            v4 = v50;
            a1 = v51;
            v30 = v49;
          }
        }
        objc_msgSend(v4, "objectForKey:", CFSTR("InCallAnalysisIntervalSec"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v40, "doubleValue");
            _inCallAnalysisIntervalSec = v41;
            _inCallAnalysisIntervalSecEnabled = 1;
          }
        }

      }
    }

  }
  v42 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "config");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "stringWithFormat:", CFSTR("%s: %@"), "+[WiFiUsageLQMWindowAnalysis updateConfig]", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v44), "UTF8String"));
    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v46 = objc_msgSend(v45, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v65 = v46;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (WiFiUsageLQMWindowAnalysis)initWithRollingWindow:(id)a3 andReason:(id)a4 andContext:(context)a5 andTimestamp:(id)a6 onQueue:(id)a7
{
  int v9;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  WiFiUsageLQMRollingWindow *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  WiFiUsageLQMRollingWindow *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  __CFString *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  dispatch_source_t v59;
  void *v60;
  NSObject *v61;
  NSObject *v62;
  double v63;
  dispatch_time_t v64;
  WiFiUsageLQMWindowAnalysis *v65;
  NSObject *v66;
  const char *v67;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  _QWORD handler[4];
  id v74;
  objc_super v75;
  _BYTE location[12];
  __int16 v77;
  id v78;
  uint64_t v79;

  v9 = *(_DWORD *)&a5.var0;
  v79 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v72 = a6;
  v14 = a7;
  v15 = objc_msgSend((id)objc_opt_class(), "canCreateAnalysisFor:", v13);
  if (!v15)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:]";
      v77 = 2112;
      v78 = v13;
      v66 = MEMORY[0x1E0C81028];
      v67 = "%s - Won't Create Analysis (downsampling) for reason %@";
LABEL_11:
      _os_log_impl(&dword_1CC44E000, v66, OS_LOG_TYPE_DEFAULT, v67, location, 0x16u);
    }
LABEL_12:
    v65 = 0;
    goto LABEL_13;
  }
  if (!v12)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:]";
      v77 = 2112;
      v78 = 0;
      v66 = MEMORY[0x1E0C81028];
      v67 = "%s - Cannot init Analysis (invalid current rolling window: %@)";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v16 = v15;
  objc_msgSend(v12, "interfaceName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "interfaceName");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[WiFiUsageLQMWindowAnalysis initWithRollingWindow:andReason:andContext:andTimestamp:onQueue:]";
      v77 = 2112;
      v78 = v69;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Cannot init Analysis (invalid interfaceName on current rolling window: %@)", location, 0x16u);

    }
    goto LABEL_12;
  }
  v75.receiver = self;
  v75.super_class = (Class)WiFiUsageLQMWindowAnalysis;
  v18 = -[WiFiUsageLQMWindowAnalysis init](&v75, sel_init);
  *((_QWORD *)v18 + 14) = v16;
  v19 = objc_msgSend(v13, "copy");
  v20 = (void *)*((_QWORD *)v18 + 3);
  *((_QWORD *)v18 + 3) = v19;

  objc_storeStrong((id *)v18 + 4, a6);
  *((_BYTE *)v18 + 17) = v9 & 1;
  *((_BYTE *)v18 + 19) = BYTE1(v9) & 1;
  *((_BYTE *)v18 + 20) = BYTE2(v9) & 1;
  objc_msgSend(v12, "samples");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lastObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "networkDetails");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "connectedBss");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bssid");
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "samples");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("networkDetails.connectedBss.bssid == %@"), v71);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "filteredArrayUsingPredicate:", v26);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = [WiFiUsageLQMRollingWindow alloc];
  objc_msgSend(v12, "interfaceName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "duration");
  v30 = v29;
  objc_msgSend(v12, "capabilities");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[WiFiUsageLQMRollingWindow initWithInterfaceName:andDuration:andInterfaceCapabilities:](v27, "initWithInterfaceName:andDuration:andInterfaceCapabilities:", v28, v31, v30);
  v33 = (void *)*((_QWORD *)v18 + 17);
  *((_QWORD *)v18 + 17) = v32;

  objc_msgSend(*((id *)v18 + 17), "addSamples:", v70);
  objc_msgSend(*((id *)v18 + 17), "setLabel:", CFSTR("before"));
  v34 = (void *)*((_QWORD *)v18 + 17);
  objc_msgSend(v12, "capabilities");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setCapabilities:", v35);

  v36 = [WiFiUsageLQMRollingWindow alloc];
  objc_msgSend(v12, "interfaceName");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "duration");
  v39 = v38;
  objc_msgSend(v12, "capabilities");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[WiFiUsageLQMRollingWindow initWithInterfaceName:andDuration:andInterfaceCapabilities:](v36, "initWithInterfaceName:andDuration:andInterfaceCapabilities:", v37, v40, v39);
  v42 = (void *)*((_QWORD *)v18 + 18);
  *((_QWORD *)v18 + 18) = v41;

  objc_msgSend(*((id *)v18 + 18), "setLabel:", CFSTR("after"));
  objc_msgSend(v12, "fgApp");
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)*((_QWORD *)v18 + 10);
  *((_QWORD *)v18 + 10) = v43;

  v45 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(v12, "preceedingTriggers");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "arrayWithArray:", v46);
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = (void *)*((_QWORD *)v18 + 9);
  *((_QWORD *)v18 + 9) = v47;

  v49 = (__CFString *)*((id *)v18 + 3);
  if (objc_msgSend(v18, "isMemberOfClass:", objc_opt_class()))
  {

    v49 = CFSTR("GenericTrigger");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), _metricPrefix, _cdfMetricName, v49);
  v50 = objc_claimAutoreleasedReturnValue();
  v51 = (void *)*((_QWORD *)v18 + 11);
  *((_QWORD *)v18 + 11) = v50;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), _metricPrefix, _sankeyMetricName, v49);
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = (void *)*((_QWORD *)v18 + 12);
  *((_QWORD *)v18 + 12) = v52;

  v54 = (void *)*((_QWORD *)v18 + 6);
  *((_QWORD *)v18 + 6) = 0;

  v55 = objc_opt_new();
  v56 = (void *)*((_QWORD *)v18 + 7);
  *((_QWORD *)v18 + 7) = v55;

  v57 = objc_opt_new();
  v58 = (void *)*((_QWORD *)v18 + 13);
  *((_QWORD *)v18 + 13) = v57;

  objc_storeStrong((id *)v18 + 16, a7);
  v59 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v14);
  v60 = (void *)*((_QWORD *)v18 + 15);
  *((_QWORD *)v18 + 15) = v59;

  objc_msgSend(v18, "getBeforeKernelWindowWithLikelyhood");
  objc_initWeak((id *)location, v18);
  v61 = *((_QWORD *)v18 + 15);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __94__WiFiUsageLQMWindowAnalysis_initWithRollingWindow_andReason_andContext_andTimestamp_onQueue___block_invoke;
  handler[3] = &unk_1E881CBD0;
  objc_copyWeak(&v74, (id *)location);
  dispatch_source_set_event_handler(v61, handler);
  v62 = *((_QWORD *)v18 + 15);
  objc_msgSend(v12, "duration");
  v64 = dispatch_time(0, (uint64_t)(v63 * 1000000000.0));
  dispatch_source_set_timer(v62, v64, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume(*((dispatch_object_t *)v18 + 15));
  *((_BYTE *)v18 + 16) = 0;
  self = (WiFiUsageLQMWindowAnalysis *)v18;
  objc_destroyWeak(&v74);
  objc_destroyWeak((id *)location);

  v65 = self;
LABEL_13:

  return v65;
}

void __94__WiFiUsageLQMWindowAnalysis_initWithRollingWindow_andReason_andContext_andTimestamp_onQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isAnalysisTodo"))
    objc_msgSend(WeakRetained, "performAnalysis");

}

- (void)dealloc
{
  NSObject *analysisTimer;
  OS_dispatch_source *v4;
  objc_super v5;

  analysisTimer = self->_analysisTimer;
  if (analysisTimer)
  {
    dispatch_source_cancel(analysisTimer);
    v4 = self->_analysisTimer;
  }
  else
  {
    v4 = 0;
  }
  self->_analysisTimer = 0;

  v5.receiver = self;
  v5.super_class = (Class)WiFiUsageLQMWindowAnalysis;
  -[WiFiUsageLQMWindowAnalysis dealloc](&v5, sel_dealloc);
}

- (void)updateWithSubsequentTrigger:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[NSMutableArray addObject:](self->_subsequentTriggers, "addObject:", v4);
    v4 = v7;
    if (!self->_firstSubsequentLinkDownReason)
    {
      objc_msgSend(v7, "trigger");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v4 = v7;
      if (v5 == CFSTR("LinkDown"))
      {
        objc_msgSend(v7, "reason");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[WiFiUsageLQMWindowAnalysis setFirstSubsequentLinkDownReason:](self, "setFirstSubsequentLinkDownReason:", v6);

        v4 = v7;
      }
    }
  }

}

- (void)computeFeaturesFor:(id)a3 WithLogLabel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *lqmWindowsFeatures;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  lqmWindowsFeatures = self->_lqmWindowsFeatures;
  objc_msgSend(v7, "samples");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "computeFeatures:For:WithLogLabel:", lqmWindowsFeatures, v10, v6);
}

+ (void)computeFeatures:(id)a3 For:(id)a4 WithLogLabel:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  NSString *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void (*v28)(uint64_t, const char *, void *, uint64_t, id);
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id obj;
  uint64_t v40;
  const char *aSelector;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v37 = a4;
  v38 = a5;
  objc_msgSend(v37, "firstObject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_class();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v8, "allLQMProperties");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
  if (v9)
  {
    v10 = v9;
    v40 = *(_QWORD *)v44;
    v11 = 0x1E0CB3000uLL;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v44 != v40)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v14 = objc_msgSend(v8, "isPerSecond:", v13);
        objc_msgSend(v8, "featureFromFieldName:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = &stru_1E881F240;
        if ((_DWORD)v14)
          v16 = CFSTR("PerSecond");
        objc_msgSend(*(id *)(v11 + 2368), "stringWithFormat:", CFSTR("%@_%@%@"), v15, v13, v16, v36);
        v17 = objc_claimAutoreleasedReturnValue();
        v42 = (void *)v17;
        if (v15)
        {
          v18 = v17;
          if (objc_msgSend(v15, "isEqualToString:", CFSTR("mode")))
            v19 = CFSTR("%@ValueForField:ScaledByDuration:OnSamples:");
          else
            v19 = CFSTR("%@IntegerValueForField:ScaledByDuration:OnSamples:");
          objc_msgSend(*(id *)(v11 + 2368), "stringWithFormat:", v19, v15);
          v20 = (NSString *)objc_claimAutoreleasedReturnValue();
          aSelector = NSSelectorFromString(v20);

          objc_msgSend(v7, "objectForKeyedSubscript:", v18);
          v21 = objc_claimAutoreleasedReturnValue();
          if (!v21)
            goto LABEL_14;
          v22 = (void *)v21;
          objc_msgSend(v7, "objectForKeyedSubscript:", v42);
          v23 = v10;
          v24 = v8;
          v25 = v7;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v38);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v7 = v25;
          v8 = v24;
          v10 = v23;

          if (!v27)
          {
LABEL_14:
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v28 = (void (*)(uint64_t, const char *, void *, uint64_t, id))+[WiFiUsageLQMRollingWindow methodForSelector:](WiFiUsageLQMRollingWindow, "methodForSelector:", aSelector);
              v29 = objc_opt_class();
              v28(v29, aSelector, v13, v14, v37);
              v30 = objc_claimAutoreleasedReturnValue();
              if (v30)
              {
                v31 = (void *)v30;
                objc_msgSend(v7, "valueForKey:", v42);
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v32)
                {
                  v33 = (void *)objc_opt_new();
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", v33, v42);

                }
                objc_msgSend(v7, "objectForKeyedSubscript:", v42);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "setObject:forKeyedSubscript:", v31, v38);

              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              NSStringFromSelector(aSelector);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136316162;
              v48 = "+[WiFiUsageLQMWindowAnalysis computeFeatures:For:WithLogLabel:]";
              v49 = 2112;
              v50 = v35;
              v51 = 2112;
              v52 = v15;
              v53 = 2112;
              v54 = v13;
              v55 = 2112;
              v56 = v8;
              _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Undefined selector %@ for feature type %@ for %@ on sample %@", buf, 0x34u);

            }
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v48 = "+[WiFiUsageLQMWindowAnalysis computeFeatures:For:WithLogLabel:]";
          v49 = 2112;
          v50 = 0;
          v51 = 2112;
          v52 = v13;
          v53 = 2112;
          v54 = v8;
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Undefined feature type %@ for %@ on sample %@", buf, 0x2Au);
        }

        v11 = 0x1E0CB3000;
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
    }
    while (v10);
  }

}

- (void)computeBins:(id)a3 WithSampleKind:(Class)a4
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  id obj;
  void *v27;
  uint64_t v28;
  id v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v4, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v37;
    *(_QWORD *)&v6 = 136315394;
    v23 = v6;
    v24 = *(_QWORD *)v37;
    do
    {
      v9 = 0;
      v25 = v7;
      do
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
        objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("_"), v23);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v11, "count") > 1)
        {
          v27 = v11;
          v28 = v9;
          objc_msgSend(v11, "objectAtIndex:", 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "allKeys");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = v13;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v33 != v16)
                  objc_enumerationMutation(v29);
                v18 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
                objc_msgSend(v4, "objectForKeyedSubscript:", v10);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "objectForKeyedSubscript:", v18);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                -[objc_class binLabelfromFieldName:value:](a4, "binLabelfromFieldName:value:", v31, objc_msgSend(v20, "integerValue"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "objectForKeyedSubscript:", v10);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v18);

              }
              v15 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            }
            while (v15);
          }

          v8 = v24;
          v7 = v25;
          v11 = v27;
          v9 = v28;
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v23;
          v42 = "-[WiFiUsageLQMWindowAnalysis computeBins:WithSampleKind:]";
          v43 = 2112;
          v44 = v10;
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - FeatureFieldName:%@ Unable to extract binFieldName", buf, 0x16u);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v7);
  }

}

- (BOOL)isAnalysisTodo
{
  return self->_summary == 0;
}

- (void)performAnalysis
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  WiFiUsageLQMWindowAnalysis *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *lqmWindowsFeatures;
  NSMutableDictionary *v16;
  NSMutableDictionary *dimensions;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  NSString *metricNameCDF;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSDictionary *v42;
  NSDictionary *summary;
  void (**completionHandler)(id, WiFiUsageLQMWindowAnalysis *);
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint8_t buf[4];
  WiFiUsageLQMWindowAnalysis *v58;
  __int16 v59;
  WiFiUsageLQMWindowAnalysis *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  const __CFString *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  if (!v5)
    goto LABEL_32;
  v56 = v8;
  if (-[NSMutableDictionary count](self->_lqmWindowsFeatures, "count")
    && !+[WiFiUsageLQMKernelRollingWindow isOngoing](WiFiUsageLQMKernelRollingWindow, "isOngoing"))
  {
    -[WiFiUsageLQMRollingWindow interfaceName](self->_windowAfterTrigger, "interfaceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v10)
      {
        *(_DWORD *)buf = 136315394;
        v58 = (WiFiUsageLQMWindowAnalysis *)"-[WiFiUsageLQMWindowAnalysis performAnalysis]";
        v59 = 2112;
        v60 = self;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Fetching \"after\" kernel rolling window for analysis: %@", buf, 0x16u);
      }
      v11 = (WiFiUsageLQMWindowAnalysis *)objc_opt_new();
      -[WiFiUsageLQMRollingWindow interfaceName](self->_windowAfterTrigger, "interfaceName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiUsageLQMWindowAnalysis fetchKernelLQMRollingWindowForInterface:into:](self, "fetchKernelLQMRollingWindowForInterface:into:", v12, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        +[WiFiUsageLQMKernelRollingWindow kernelLQMRollingWindow:withReferenceWindow:andLqmFeatures:](WiFiUsageLQMKernelRollingWindow, "kernelLQMRollingWindow:withReferenceWindow:andLqmFeatures:", v13, self->_windowAfterTrigger, self->_lqmWindowsFeatures);
        v14 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        lqmWindowsFeatures = self->_lqmWindowsFeatures;
        self->_lqmWindowsFeatures = v14;

      }
      goto LABEL_18;
    }
    if (v10)
    {
      -[WiFiUsageLQMRollingWindow interfaceName](self->_windowAfterTrigger, "interfaceName");
      v11 = (WiFiUsageLQMWindowAnalysis *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v58 = (WiFiUsageLQMWindowAnalysis *)"-[WiFiUsageLQMWindowAnalysis performAnalysis]";
      v59 = 2112;
      v60 = v11;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Cannot fetch the kernel rolling window (invalid interface name on windowAfterTrigger: %@)", buf, 0x16u);
LABEL_18:

    }
  }
  -[WiFiUsageLQMWindowAnalysis computeFeaturesFor:WithLogLabel:](self, "computeFeaturesFor:WithLogLabel:", self->_windowBeforeTrigger, CFSTR("before"));
  -[WiFiUsageLQMWindowAnalysis computeFeaturesFor:WithLogLabel:](self, "computeFeaturesFor:WithLogLabel:", self->_windowAfterTrigger, CFSTR("after"));
  v16 = (NSMutableDictionary *)objc_opt_new();
  dimensions = self->dimensions;
  self->dimensions = v16;

  v18 = -[WiFiUsageLQMWindowAnalysis addDimensionsTo:](self, "addDimensionsTo:", self->dimensions);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v19 = (void *)_dateFormatter_1;
    objc_msgSend(v5, "timestamp");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringFromDate:");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)_dateFormatter_1;
    -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "lastObject");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "timestamp");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringFromDate:");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)_dateFormatter_1;
    -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "firstObject");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "timestamp");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringFromDate:", v22);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)_dateFormatter_1;
    -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lastObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timestamp");
    v26 = v5;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringFromDate:", v27);
    v51 = v26;
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "networkDetails");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      objc_msgSend(v56, "networkDetails");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = 0;
    }
    -[WiFiUsageLQMWindowAnalysis dumpDimensions:](self, "dumpDimensions:", self->dimensions);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiUsageLQMWindowAnalysis dumpAnalysis:](self, "dumpAnalysis:", self->_lqmWindowsFeatures);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414851;
    v58 = self;
    v59 = 2112;
    v60 = (WiFiUsageLQMWindowAnalysis *)CFSTR("before");
    v61 = 2112;
    v62 = v55;
    v63 = 2112;
    v64 = v54;
    v65 = 2112;
    v66 = CFSTR("after");
    v67 = 2112;
    v68 = v53;
    v69 = 2112;
    v70 = v52;
    v71 = 2113;
    v72 = v28;
    v73 = 2113;
    v74 = v29;
    v75 = 2112;
    v76 = v30;
    v77 = 2112;
    v78 = v31;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "LQM_RW - LQM window analysis for %@ (%@: %@ - %@ ; %@: %@ - %@)\n"
      " Network at trigger        : %{private}@\n"
      " Network at end of analysis: %{private}@\n"
      " Context:\n"
      "%@\n"
      " Features: %@",
      buf,
      0x70u);
    if (v56)

    v5 = v51;
  }
  -[WiFiUsageLQMWindowAnalysis computeBins:WithSampleKind:](self, "computeBins:WithSampleKind:", self->_lqmWindowsFeatures, objc_opt_class());
  v32 = objc_alloc(MEMORY[0x1E0C99D80]);
  v33 = 0x1E0C99000uLL;
  v34 = (void *)MEMORY[0x1E0C99DE8];
  -[NSMutableDictionary allKeys](self->_lqmWindowsFeatures, "allKeys");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "arrayWithArray:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  metricNameCDF = self->_metricNameCDF;
  -[NSMutableDictionary allKeys](self->_lqmWindowsFeatures, "allKeys");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "count");
  v40 = (void *)MEMORY[0x1E0C99DE8];
  if (v39)
  {
    v33 = objc_opt_new();
    objc_msgSend(v40, "arrayWithObject:", v33);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = (void *)objc_opt_new();
  }
  v42 = (NSDictionary *)objc_msgSend(v32, "initWithObjectsAndKeys:", v36, metricNameCDF, v41, self->_metricNameSankey, 0);
  summary = self->_summary;
  self->_summary = v42;

  if (v39)
  {

    v41 = (void *)v33;
  }

  v8 = v56;
LABEL_32:
  if (!self->_isDone)
  {
    completionHandler = (void (**)(id, WiFiUsageLQMWindowAnalysis *))self->_completionHandler;
    if (completionHandler)
    {
      self->_isDone = 1;
      completionHandler[2](completionHandler, self);
    }
  }

}

+ (unint64_t)canCreateAnalysisFor:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend((id)_createAnalysisSamplingRates, "count"))
  {
    objc_msgSend((id)_createAnalysisSamplingRates, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = arc4random_uniform(objc_msgSend(v4, "samplingBase"));

    objc_msgSend((id)_createAnalysisSamplingRates, "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)_createAnalysisSamplingRates, "objectForKeyedSubscript:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 >= objc_msgSend(v7, "samplingRate"))
        v5 = 0;
      else
        v5 = v5;

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)canSubmitToCA
{
  unint64_t diceRoll;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  diceRoll = self->_diceRoll;
  if (!objc_msgSend((id)_submitToCASamplingRates, "count"))
    return 1;
  objc_msgSend((id)_createAnalysisSamplingRates, "objectForKeyedSubscript:", self->_reason);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "samplingBase");
  objc_msgSend((id)_submitToCASamplingRates, "objectForKeyedSubscript:", self->_reason);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "samplingBase");

  if (v5 != v7)
  {
    objc_msgSend((id)_submitToCASamplingRates, "objectForKeyedSubscript:", self->_reason);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    diceRoll = arc4random_uniform(objc_msgSend(v8, "samplingBase"));

  }
  objc_msgSend((id)_submitToCASamplingRates, "objectForKeyedSubscript:", self->_reason);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend((id)_submitToCASamplingRates, "objectForKeyedSubscript:", self->_reason);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = diceRoll < objc_msgSend(v10, "samplingRate");

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)metricCallbackForMetric:(id)a3 AndField:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v27;
  id v28;
  NSMutableDictionary *obj;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  if (objc_msgSend(v6, "hasPrefix:", self->_metricNameSankey))
  {
    v27 = v7;
    v28 = v6;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = self->_lqmWindowsFeatures;
    v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v9)
    {
      v10 = v9;
      v30 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v32 != v30)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_lqmWindowsFeatures, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("before"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v12, CFSTR("before"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v15);

          -[NSMutableDictionary objectForKeyedSubscript:](self->_lqmWindowsFeatures, "objectForKeyedSubscript:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("after"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v12, CFSTR("after"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v18);

        }
        v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v10);
    }

    v7 = v27;
    v6 = v28;
  }
  else
  {
    v19 = objc_msgSend(v6, "hasPrefix:", self->_metricNameCDF);
    if (v7 && v19)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("fieldName"));
      -[NSMutableDictionary objectForKeyedSubscript:](self->_lqmWindowsFeatures, "objectForKeyedSubscript:", v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("before"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, CFSTR("before"));

      -[NSMutableDictionary objectForKeyedSubscript:](self->_lqmWindowsFeatures, "objectForKeyedSubscript:", v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("after"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, CFSTR("after"));

    }
  }
  objc_msgSend(v8, "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
    objc_msgSend(v8, "addEntriesFromDictionary:", self->dimensions);

  return v8;
}

- (id)addDimensionsTo:(id)a3
{
  id v4;
  void *v5;
  double v6;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  NSMutableArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  void *v57;
  NSDate *timestamp;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  WiFiUsageAppleWiFiNameBlocks *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  double v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  double v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  WiFiUsageAppleWiFiNameBlocks *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _BYTE v157[128];
  _BYTE v158[128];
  uint64_t v159;

  v159 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_reason, CFSTR("trigger"));
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiUsageLQMRollingWindow duration](self->_windowBeforeTrigger, "duration");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%lu"), (uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("duration"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_fgApp, CFSTR("fgApp"));
  v8 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiUsageLQMRollingWindow capabilities](self->_windowBeforeTrigger, "capabilities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v9, "maxInterfacePHYRate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("deviceTheoreticalMaxRate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_inCall);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("inCall"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasKernel);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("hasKernelStats"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_inA2dp);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("inA2DP"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_inEsco);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("ineSCO"));

  -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "networkDetails");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v17, "connectedBss");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v19, "channel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("channel"));

  objc_msgSend(v17, "connectedBss");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", objc_msgSend(v21, "band"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("band"));

  v23 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v17, "connectedBss");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v24, "channelWidth"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("channelWidth"));

  objc_msgSend(v17, "connectedBss");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "apProfile");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("apProfile"));

  objc_msgSend(v17, "connectedBss");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bssid");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter sanitizedOUI:](WiFiUsagePrivacyFilter, "sanitizedOUI:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("oui"));

  v146 = v17;
  objc_msgSend(v17, "connectedBss");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bssid");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "lastObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "networkDetails");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "connectedBss");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bssid");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v32, "isEqualToString:", v37);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v39, CFSTR("sameBSSID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WiFiUsageLQMRollingWindow hasChanged:](self->_windowBeforeTrigger, "hasChanged:", CFSTR("networkDetails.connectedBss.channel")));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, CFSTR("channel_hasChanged_inBefore"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WiFiUsageLQMRollingWindow hasChanged:](self->_windowAfterTrigger, "hasChanged:", CFSTR("networkDetails.connectedBss.channel")));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, CFSTR("channel_hasChanged_inAfter"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WiFiUsageLQMRollingWindow hasChanged:](self->_windowBeforeTrigger, "hasChanged:", CFSTR("networkDetails.connectedBss.band")));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v42, CFSTR("band_hasChanged_inBefore"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WiFiUsageLQMRollingWindow hasChanged:](self->_windowAfterTrigger, "hasChanged:", CFSTR("networkDetails.connectedBss.band")));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = v4;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v43, CFSTR("band_hasChanged_inAfter"));

  v44 = (void *)objc_opt_new();
  v153 = 0u;
  v154 = 0u;
  v155 = 0u;
  v156 = 0u;
  v45 = self->_preceedingTriggers;
  v46 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v153, v158, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v154;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v154 != v48)
          objc_enumerationMutation(v45);
        objc_msgSend(*(id *)(*((_QWORD *)&v153 + 1) + 8 * i), "trigger");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "appendFormat:", CFSTR("&%@"), v50);

      }
      v47 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v153, v158, 16);
    }
    while (v47);
  }

  v145 = v44;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v44, CFSTR("preceedingTriggers"));
  v148 = (void *)objc_opt_new();
  v149 = 0u;
  v150 = 0u;
  v151 = 0u;
  v152 = 0u;
  v51 = self->_subsequentTriggers;
  v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v149, v157, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v150;
    do
    {
      for (j = 0; j != v53; ++j)
      {
        if (*(_QWORD *)v150 != v54)
          objc_enumerationMutation(v51);
        v56 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * j);
        objc_msgSend(v56, "timestamp");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        timestamp = self->_timestamp;
        -[WiFiUsageLQMRollingWindow duration](self->_windowAfterTrigger, "duration");
        -[NSDate dateByAddingTimeInterval:](timestamp, "dateByAddingTimeInterval:");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v57, "compare:", v59);

        if (v60 != 1)
        {
          objc_msgSend(v56, "trigger");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "appendFormat:", CFSTR("&%@"), v61);

        }
      }
      v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v149, v157, 16);
    }
    while (v53);
  }

  objc_msgSend(v147, "setObject:forKeyedSubscript:", v148, CFSTR("subsequentTriggers"));
  objc_msgSend(v147, "setObject:forKeyedSubscript:", self->_firstSubsequentLinkDownReason, CFSTR("firstSubsequentLinkDownReason"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v146, "hasEnterpriseSecurity"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v62, CFSTR("isEnterprise"));

  +[WiFiUsagePrivacyFilter getLabelsForNetworkProperties:](WiFiUsagePrivacyFilter, "getLabelsForNetworkProperties:", v146);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "addEntriesFromDictionary:", v63);

  objc_msgSend(v146, "bssEnvironment");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v64, CFSTR("bssEnvironment"));

  objc_msgSend(v146, "privateMacType");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v65, CFSTR("privateMacType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v146, "privateRelayEnabled"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v66, CFSTR("privacyProxyEnabled"));

  -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "lastObject");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "motionState");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v69, CFSTR("motionStatus"));

  v70 = (void *)MEMORY[0x1E0CB37E8];
  -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "lastObject");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "numberWithBool:", objc_msgSend(v72, "isAnyAppInFG"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v73, CFSTR("isAnyAppInFG"));

  v74 = (void *)MEMORY[0x1E0CB37E8];
  -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "lastObject");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "numberWithBool:", objc_msgSend(v76, "isFTactive"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v77, CFSTR("isFTactive"));

  v78 = (void *)MEMORY[0x1E0CB37E8];
  -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "lastObject");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "numberWithBool:", objc_msgSend(v80, "isTimeSensitiveAppRunning"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v81, CFSTR("isTimeSensitiveAppRunning"));

  -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "lastObject");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsageLQMTransformations getLabelTrafficState:](WiFiUsageLQMTransformations, "getLabelTrafficState:", objc_msgSend(v83, "trafficState"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v84, CFSTR("last_trafficState_before"));

  if (+[WiFiUsagePrivacyFilter isInternalInstall](WiFiUsagePrivacyFilter, "isInternalInstall")
    && objc_msgSend(v146, "isInternal"))
  {
    objc_msgSend(v146, "networkName");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "setObject:forKeyedSubscript:", v85, CFSTR("NetworkName"));

    objc_msgSend(v146, "connectedBss");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "bssid");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile apNameForBSSID:](WiFiUsageAccessPointProfile, "apNameForBSSID:", v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    v89 = -[WiFiUsageAppleWiFiNameBlocks initWithAPName:]([WiFiUsageAppleWiFiNameBlocks alloc], "initWithAPName:", v88);
    objc_msgSend(v147, "setObject:forKeyedSubscript:", v88, CFSTR("apName"));
    if (v89)
    {
      -[WiFiUsageAppleWiFiNameBlocks building](v89, "building");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "setObject:forKeyedSubscript:", v90, CFSTR("apNamePortionA"));

      -[WiFiUsageAppleWiFiNameBlocks section](v89, "section");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "setObject:forKeyedSubscript:", v91, CFSTR("apNamePortionB"));

      -[WiFiUsageAppleWiFiNameBlocks floor](v89, "floor");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "setObject:forKeyedSubscript:", v92, CFSTR("apNamePortionC"));

      -[WiFiUsageAppleWiFiNameBlocks pod](v89, "pod");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "setObject:forKeyedSubscript:", v93, CFSTR("apNamePortionD"));

      -[WiFiUsageAppleWiFiNameBlocks other](v89, "other");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "setObject:forKeyedSubscript:", v94, CFSTR("apNamePortionE"));

    }
  }
  -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "lastObject");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "timestamp");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "firstObject");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "timestamp");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "timeIntervalSinceDate:", v100);
  +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:](WiFiUsagePrivacyFilter, "getBinEvery10Over100:As:", (unint64_t)v101, 0);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v102, CFSTR("windowSpan_before"));

  -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "lastObject");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "timestamp");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "firstObject");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "timestamp");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "timeIntervalSinceDate:", v108);
  +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:](WiFiUsagePrivacyFilter, "getBinEvery10Over100:As:", (unint64_t)v109, 0);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v110, CFSTR("windowSpan_after"));

  -[WiFiUsageLQMRollingWindow samples](self->_windowBeforeTrigger, "samples");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:](WiFiUsagePrivacyFilter, "getBinEvery10Over100:As:", objc_msgSend(v111, "count"), 0);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v112, CFSTR("samplesCount_before"));

  -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter getBinEvery10Over100:As:](WiFiUsagePrivacyFilter, "getBinEvery10Over100:As:", objc_msgSend(v113, "count"), 0);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v114, CFSTR("samplesCount_after"));

  -[WiFiUsageLQMRollingWindow samples](self->_windowAfterTrigger, "samples");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "lastObject");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "networkDetails");
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  v118 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v117, "connectedBss");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v119, "channel"));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v120, CFSTR("channel_after"));

  objc_msgSend(v117, "connectedBss");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter bandAsString:](WiFiUsagePrivacyFilter, "bandAsString:", objc_msgSend(v121, "band"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v122, CFSTR("band_after"));

  v123 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v117, "connectedBss");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v123, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v124, "channelWidth"));
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v125, CFSTR("channelWidth_after"));

  objc_msgSend(v117, "connectedBss");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "apProfile");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v127, CFSTR("apProfile_after"));

  objc_msgSend(v117, "connectedBss");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "bssid");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  +[WiFiUsagePrivacyFilter sanitizedOUI:](WiFiUsagePrivacyFilter, "sanitizedOUI:", v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v130, CFSTR("oui_after"));

  +[WiFiUsagePrivacyFilter getLabelsForNetworkProperties:](WiFiUsagePrivacyFilter, "getLabelsForNetworkProperties:", v117);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "addEntriesFromDictionary:", v131);

  objc_msgSend(v117, "bssEnvironment");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v132, CFSTR("bssEnvironment_after"));

  objc_msgSend(v117, "privateMacType");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v133, CFSTR("privateMacType_after"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v117, "privateRelayEnabled"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v134, CFSTR("privacyProxyEnabled_after"));

  if (+[WiFiUsagePrivacyFilter isInternalInstall](WiFiUsagePrivacyFilter, "isInternalInstall")
    && objc_msgSend(v117, "isInternal"))
  {
    objc_msgSend(v117, "connectedBss");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "bssid");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    +[WiFiUsageAccessPointProfile apNameForBSSID:](WiFiUsageAccessPointProfile, "apNameForBSSID:", v136);
    v137 = (void *)objc_claimAutoreleasedReturnValue();

    v138 = -[WiFiUsageAppleWiFiNameBlocks initWithAPName:]([WiFiUsageAppleWiFiNameBlocks alloc], "initWithAPName:", v137);
    objc_msgSend(v147, "setObject:forKeyedSubscript:", v137, CFSTR("apName_after"));
    if (v138)
    {
      -[WiFiUsageAppleWiFiNameBlocks building](v138, "building");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "setObject:forKeyedSubscript:", v139, CFSTR("apNamePortionA_after"));

      -[WiFiUsageAppleWiFiNameBlocks section](v138, "section");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "setObject:forKeyedSubscript:", v140, CFSTR("apNamePortionB_after"));

      -[WiFiUsageAppleWiFiNameBlocks floor](v138, "floor");
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "setObject:forKeyedSubscript:", v141, CFSTR("apNamePortionC_after"));

      -[WiFiUsageAppleWiFiNameBlocks pod](v138, "pod");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "setObject:forKeyedSubscript:", v142, CFSTR("apNamePortionD_after"));

      -[WiFiUsageAppleWiFiNameBlocks other](v138, "other");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "setObject:forKeyedSubscript:", v143, CFSTR("apNamePortionE_after"));

    }
  }

  return v147;
}

- (id)dumpAnalysis:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  id v22;
  id obj;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("(format: fieldName=<feature %@>|<feature %@>|<median change>)\n"), CFSTR("before"), CFSTR("after"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v27 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v31;
    v22 = v3;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v4, "appendFormat:", CFSTR("%@="), v8);
        objc_msgSend(v3, "objectForKeyedSubscript:", v8);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("before"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v8);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("after"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("after"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v24 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v3, "objectForKeyedSubscript:", v8);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("after"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "doubleValue");
          v15 = v14;
          objc_msgSend(v3, "objectForKeyedSubscript:", v8);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("before"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "doubleValue");
          objc_msgSend(v24, "numberWithDouble:", v15 - v18);
          v19 = v4;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "appendFormat:", CFSTR("%@|%@|%@"), v9, v10, v20);

          v4 = v19;
          v3 = v22;

        }
        else
        {
          objc_msgSend(v4, "appendFormat:", CFSTR("%@|%@|%@"), v9, v10, &stru_1E881F240);
        }

        objc_msgSend(v4, "appendString:", CFSTR(";"));
      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v27);
  }

  return v4;
}

- (id)dumpDimensions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("%@=%@;"), v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ @ %@"), self->_reason, self->_timestamp);
}

- (id)fetchKernelLQMRollingWindowForInterface:(id)a3 into:(id)a4
{
  id v5;
  id v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v13;
  NSObject *v14;
  const char *v15;
  int v16;
  uint32_t v17;
  int v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  _BYTE v22[14];
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = Apple80211Open();
  if (v7)
  {
    v13 = v7;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)buf = 136315650;
    v20 = "-[WiFiUsageLQMWindowAnalysis fetchKernelLQMRollingWindowForInterface:into:]";
    v21 = 1024;
    *(_DWORD *)v22 = v13;
    *(_WORD *)&v22[4] = 2080;
    *(_QWORD *)&v22[6] = strerror(v13);
    v14 = MEMORY[0x1E0C81028];
    v15 = "%s: Apple80211Open returned err %d (%s)";
    goto LABEL_13;
  }
  v8 = Apple80211BindToInterface();
  if (v8)
  {
    v16 = v8;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)buf = 136315906;
    v20 = "-[WiFiUsageLQMWindowAnalysis fetchKernelLQMRollingWindowForInterface:into:]";
    v21 = 2112;
    *(_QWORD *)v22 = v5;
    *(_WORD *)&v22[8] = 1024;
    *(_DWORD *)&v22[10] = v16;
    v23 = 2080;
    v24 = strerror(v16);
    v14 = MEMORY[0x1E0C81028];
    v15 = "%s: Apple80211BindToInterface on (%@) returned err %d (%s)";
    v17 = 38;
LABEL_16:
    _os_log_impl(&dword_1CC44E000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    goto LABEL_17;
  }
  v9 = Apple80211Get();
  if (v9)
  {
    v18 = v9;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)buf = 136315650;
    v20 = "-[WiFiUsageLQMWindowAnalysis fetchKernelLQMRollingWindowForInterface:into:]";
    v21 = 1024;
    *(_DWORD *)v22 = v18;
    *(_WORD *)&v22[4] = 2080;
    *(_QWORD *)&v22[6] = strerror(v18);
    v14 = MEMORY[0x1E0C81028];
    v15 = "%s: Apple80211Get(APPLE80211_IOC_LQM_RING_BUFFER_DATA) failed: %d (%s)";
LABEL_13:
    v17 = 28;
    goto LABEL_16;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E8862FD0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[WiFiUsageLQMWindowAnalysis fetchKernelLQMRollingWindowForInterface:into:]";
      v14 = MEMORY[0x1E0C81028];
      v15 = "%s - No LQM binary tag represented in APPLE80211_IOC_LQM_RING_BUFFER_DATA dictionary, skipping.";
      v17 = 12;
      goto LABEL_16;
    }
LABEL_17:
    v11 = 0;
    goto LABEL_6;
  }
  v11 = (void *)v10;
LABEL_6:

  return v11;
}

- (BOOL)getBeforeKernelWindowWithLikelyhood
{
  unint64_t diceRoll;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  const __CFString *v16;
  const __CFString *v17;
  unint64_t v18;
  void *v19;
  int v20;
  const __CFString *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  NSMutableDictionary *v27;
  NSMutableDictionary *lqmWindowsFeatures;
  WiFiUsageLQMWindowAnalysis *v29;
  int v31;
  const char *v32;
  __int16 v33;
  WiFiUsageLQMWindowAnalysis *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  unint64_t v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const __CFString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  diceRoll = self->_diceRoll;
  objc_msgSend((id)_createAnalysisSamplingRates, "objectForKeyedSubscript:", self->_reason);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "samplingBase");
  objc_msgSend((id)_fetchKernelWindowSamplingRates, "objectForKeyedSubscript:", self->_reason);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "samplingBase");

  if (v5 != v7)
  {
    objc_msgSend((id)_fetchKernelWindowSamplingRates, "objectForKeyedSubscript:", self->_reason);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    diceRoll = arc4random_uniform(objc_msgSend(v8, "samplingBase"));

  }
  objc_msgSend((id)_fetchKernelWindowSamplingRates, "objectForKeyedSubscript:", self->_reason);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v13 = 0;
    goto LABEL_9;
  }
  v10 = (void *)v9;
  objc_msgSend((id)_fetchKernelWindowSamplingRates, "objectForKeyedSubscript:", self->_reason);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "samplingRate");
  v13 = diceRoll < v12;

  if (!_isKernelParsingEnabled || diceRoll >= v12)
  {
LABEL_9:
    v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    LOBYTE(v15) = 0;
    if (v14)
    {
      if (_isKernelParsingEnabled)
        v16 = CFSTR("YES");
      else
        v16 = CFSTR("NO");
      if (v13)
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      v18 = self->_diceRoll;
      objc_msgSend((id)_fetchKernelWindowSamplingRates, "objectForKeyedSubscript:", self->_reason);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "samplingRate");
      v31 = 136316674;
      v32 = "-[WiFiUsageLQMWindowAnalysis getBeforeKernelWindowWithLikelyhood]";
      if (+[WiFiUsageLQMKernelRollingWindow isOngoing](WiFiUsageLQMKernelRollingWindow, "isOngoing"))
        v21 = CFSTR("YES");
      else
        v21 = CFSTR("NO");
      v33 = 2112;
      v34 = self;
      v35 = 2112;
      v36 = v16;
      v37 = 2112;
      v38 = v17;
      v39 = 2048;
      v40 = v18;
      v41 = 1024;
      v42 = v20;
      v43 = 2112;
      v44 = v21;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Not fetching \"before\" kernel rolling window for analysis: %@ (enabled: %@ - sampling:%@(%lu>=%u) - ongoing kernel window parsing:%@)", (uint8_t *)&v31, 0x44u);

LABEL_20:
      LOBYTE(v15) = 0;
      return v15;
    }
    return v15;
  }
  if (+[WiFiUsageLQMKernelRollingWindow isOngoing](WiFiUsageLQMKernelRollingWindow, "isOngoing"))
  {
    v13 = 1;
    goto LABEL_9;
  }
  -[WiFiUsageLQMRollingWindow interfaceName](self->_windowBeforeTrigger, "interfaceName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (!v22)
  {
    if (!v15)
      return v15;
    -[WiFiUsageLQMRollingWindow interfaceName](self->_windowBeforeTrigger, "interfaceName");
    v29 = (WiFiUsageLQMWindowAnalysis *)objc_claimAutoreleasedReturnValue();
    v31 = 136315394;
    v32 = "-[WiFiUsageLQMWindowAnalysis getBeforeKernelWindowWithLikelyhood]";
    v33 = 2112;
    v34 = v29;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s - Cannot fetch the kernel rolling window (invalid interface name on windowBeforeTrigger: %@)", (uint8_t *)&v31, 0x16u);

    goto LABEL_20;
  }
  if (v15)
  {
    -[WiFiUsageLQMRollingWindow interfaceName](self->_windowBeforeTrigger, "interfaceName");
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v31 = 136315650;
    v32 = "-[WiFiUsageLQMWindowAnalysis getBeforeKernelWindowWithLikelyhood]";
    v33 = 2112;
    v34 = self;
    v35 = 2112;
    v36 = v23;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Fetching \"before\" kernel rolling window for analysis %@ on interface %@", (uint8_t *)&v31, 0x20u);

  }
  v24 = (void *)objc_opt_new();
  -[WiFiUsageLQMRollingWindow interfaceName](self->_windowBeforeTrigger, "interfaceName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiUsageLQMWindowAnalysis fetchKernelLQMRollingWindowForInterface:into:](self, "fetchKernelLQMRollingWindowForInterface:into:", v25, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    +[WiFiUsageLQMKernelRollingWindow kernelLQMRollingWindow:withReferenceWindow:andLqmFeatures:](WiFiUsageLQMKernelRollingWindow, "kernelLQMRollingWindow:withReferenceWindow:andLqmFeatures:", v26, self->_windowBeforeTrigger, self->_lqmWindowsFeatures);
    v27 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    lqmWindowsFeatures = self->_lqmWindowsFeatures;
    self->_lqmWindowsFeatures = v27;

  }
  if (-[NSMutableDictionary count](self->_lqmWindowsFeatures, "count"))
    self->_hasKernel = 1;

  LOBYTE(v15) = 1;
  return v15;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (void)setIsDone:(BOOL)a3
{
  self->_isDone = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
  objc_storeStrong((id *)&self->_summary, a3);
}

- (NSMutableArray)subsequentTriggers
{
  return self->_subsequentTriggers;
}

- (void)setSubsequentTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_subsequentTriggers, a3);
}

- (NSString)firstSubsequentLinkDownReason
{
  return self->_firstSubsequentLinkDownReason;
}

- (void)setFirstSubsequentLinkDownReason:(id)a3
{
  self->_firstSubsequentLinkDownReason = (NSString *)a3;
}

- (NSArray)preceedingTriggers
{
  return self->_preceedingTriggers;
}

- (void)setPreceedingTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_preceedingTriggers, a3);
}

- (NSString)fgApp
{
  return self->_fgApp;
}

- (void)setFgApp:(id)a3
{
  objc_storeStrong((id *)&self->_fgApp, a3);
}

- (BOOL)inCall
{
  return self->_inCall;
}

- (void)setInCall:(BOOL)a3
{
  self->_inCall = a3;
}

- (NSString)metricNameCDF
{
  return self->_metricNameCDF;
}

- (void)setMetricNameCDF:(id)a3
{
  objc_storeStrong((id *)&self->_metricNameCDF, a3);
}

- (NSString)metricNameSankey
{
  return self->_metricNameSankey;
}

- (void)setMetricNameSankey:(id)a3
{
  objc_storeStrong((id *)&self->_metricNameSankey, a3);
}

- (NSMutableDictionary)lqmWindowsFeatures
{
  return self->_lqmWindowsFeatures;
}

- (void)setLqmWindowsFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_lqmWindowsFeatures, a3);
}

- (unint64_t)diceRoll
{
  return self->_diceRoll;
}

- (void)setDiceRoll:(unint64_t)a3
{
  self->_diceRoll = a3;
}

- (BOOL)hasKernel
{
  return self->_hasKernel;
}

- (void)setHasKernel:(BOOL)a3
{
  self->_hasKernel = a3;
}

- (BOOL)inA2dp
{
  return self->_inA2dp;
}

- (void)setInA2dp:(BOOL)a3
{
  self->_inA2dp = a3;
}

- (BOOL)inEsco
{
  return self->_inEsco;
}

- (void)setInEsco:(BOOL)a3
{
  self->_inEsco = a3;
}

- (OS_dispatch_source)analysisTimer
{
  return self->_analysisTimer;
}

- (void)setAnalysisTimer:(id)a3
{
  objc_storeStrong((id *)&self->_analysisTimer, a3);
}

- (OS_dispatch_queue)analysisQueue
{
  return self->_analysisQueue;
}

- (void)setAnalysisQueue:(id)a3
{
  objc_storeStrong((id *)&self->_analysisQueue, a3);
}

- (WiFiUsageLQMRollingWindow)windowBeforeTrigger
{
  return self->_windowBeforeTrigger;
}

- (void)setWindowBeforeTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_windowBeforeTrigger, a3);
}

- (WiFiUsageLQMRollingWindow)windowAfterTrigger
{
  return self->_windowAfterTrigger;
}

- (void)setWindowAfterTrigger:(id)a3
{
  objc_storeStrong((id *)&self->_windowAfterTrigger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowAfterTrigger, 0);
  objc_storeStrong((id *)&self->_windowBeforeTrigger, 0);
  objc_storeStrong((id *)&self->_analysisQueue, 0);
  objc_storeStrong((id *)&self->_analysisTimer, 0);
  objc_storeStrong((id *)&self->_lqmWindowsFeatures, 0);
  objc_storeStrong((id *)&self->_metricNameSankey, 0);
  objc_storeStrong((id *)&self->_metricNameCDF, 0);
  objc_storeStrong((id *)&self->_fgApp, 0);
  objc_storeStrong((id *)&self->_preceedingTriggers, 0);
  objc_storeStrong((id *)&self->_subsequentTriggers, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->dimensions, 0);
}

@end
