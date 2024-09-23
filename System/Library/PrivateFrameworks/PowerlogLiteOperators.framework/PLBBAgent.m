@implementation PLBBAgent

uint64_t __53__PLBBAgent_registerForMAVModelMetricsNotifications___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "modelMavPower:", a2);
}

- (void)metricMessage:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD block[5];
  _QWORD v48[5];
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __27__PLBBAgent_metricMessage___block_invoke;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v48[4] = objc_opt_class();
    if (qword_1ED883A98 != -1)
      dispatch_once(&qword_1ED883A98, v48);
    if (byte_1ED8837EE)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent metricMessage:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent metricMessage:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 692);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __27__PLBBAgent_metricMessage___block_invoke_723;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = objc_opt_class();
  if (qword_1ED883AA0 != -1)
    dispatch_once(&qword_1ED883AA0, block);
  if (byte_1ED8837EF)
    -[PLBBAgent metricMessageDebugLog:](self, "metricMessageDebugLog:", v4);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBAgent setLastBBActivityTimestamp:](self, "setLastBBActivityTimestamp:", v13);

  if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav"))
  {
    +[PLMAVBBMetric sharedInstance](PLMAVBBMetric, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_ERROR, "BBAgent Unable to access shared object", buf, 2u);
      }

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        __assert_rtn("-[PLBBAgent metricMessage:]", "PLBBAgent.m", 706, "0");
    }
    v16 = *MEMORY[0x1E0D80138];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80138]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "intValue") == 680000)
    {

      goto LABEL_28;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", v16);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "intValue");

    if (v29 == 703488)
    {
LABEL_28:
      if (-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("periodic MAV metric handler: %@"), v4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "lastPathComponent");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent metricMessage:]");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v32, v33, 711);

        PLLogCommon();
        v27 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          goto LABEL_30;
        *(_DWORD *)buf = 138412290;
        v50 = v22;
        goto LABEL_41;
      }
      goto LABEL_31;
    }
    if (-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aperiodic MAV metric handler: %@"), v4);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "lastPathComponent");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent metricMessage:]");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "logMessage:fromFile:fromFunction:fromLineNumber:", v37, v45, v46, 718);

      PLLogCommon();
      v42 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        goto LABEL_37;
      *(_DWORD *)buf = 138412290;
      v50 = v37;
      goto LABEL_43;
    }
    goto LABEL_38;
  }
  +[PLICEBBMetric sharedInstance](PLICEBBMetric, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    PLLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_ERROR, "BBAgent Unable to access shared object", buf, 2u);
    }

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      __assert_rtn("-[PLBBAgent metricMessage:]", "PLBBAgent.m", 753, "0");
  }
  v16 = *MEMORY[0x1E0D80138];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80138]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "intValue");

  v21 = -[PLOperator isDebugEnabled](self, "isDebugEnabled");
  if (v20 != 1)
  {
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aperiodic ICE metric handler: %@"), v4);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "lastPathComponent");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent metricMessage:]");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "logMessage:fromFile:fromFunction:fromLineNumber:", v37, v40, v41, 765);

      PLLogCommon();
      v42 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
LABEL_37:

        goto LABEL_38;
      }
      *(_DWORD *)buf = 138412290;
      v50 = v37;
LABEL_43:
      _os_log_debug_impl(&dword_1CAF47000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_37;
    }
LABEL_38:
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80128]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80130]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v16);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "queueAperiodicMetricId:payload:profileId:", v34, v35, v36);
    goto LABEL_39;
  }
  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("periodic ICE metric handler: %@"), v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lastPathComponent");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent metricMessage:]");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 758);

    PLLogCommon();
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
LABEL_30:

      goto LABEL_31;
    }
    *(_DWORD *)buf = 138412290;
    v50 = v22;
LABEL_41:
    _os_log_debug_impl(&dword_1CAF47000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    goto LABEL_30;
  }
LABEL_31:
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80128]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80130]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80140]);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "queuePeriodicMetricId:payload:forTrigger:", v34, v35, v36);
LABEL_39:

}

- (void)setLastBBActivityTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (void)logEntry:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  _QWORD block[5];
  _QWORD v48[5];
  objc_super v49;
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)PLBBAgent;
  -[PLOperator logEntry:](&v49, sel_logEntry_, v4);
  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __22__PLBBAgent_logEntry___block_invoke;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v48[4] = objc_opt_class();
    if (qword_1ED883C60 != -1)
      dispatch_once(&qword_1ED883C60, v48);
    if (byte_1ED883825)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent logEntry:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logEntry:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 2957);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __22__PLBBAgent_logEntry___block_invoke_1081;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = objc_opt_class();
  if (qword_1ED883C68 != -1)
    dispatch_once(&qword_1ED883C68, block);
  if (byte_1ED883826)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n\n\n\n\nAgent has sent PL Entry"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logEntry:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 2960);

    PLLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v13;
      _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** START of PLEntry ***"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastPathComponent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logEntry:]");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 2961);

    PLLogCommon();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v19;
      _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "entryKey");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("Name: %@\n"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "lastPathComponent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logEntry:]");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 2962);

    PLLogCommon();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v27;
      _os_log_debug_impl(&dword_1CAF47000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    v33 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "description");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("Description:%@\n"), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "lastPathComponent");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logEntry:]");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 2963);

    PLLogCommon();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v35;
      _os_log_debug_impl(&dword_1CAF47000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** END of PLEntry ***\n\n\n\n\n"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "lastPathComponent");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logEntry:]");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v44, v45, 2964);

    PLLogCommon();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v41;
      _os_log_debug_impl(&dword_1CAF47000, v46, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

  }
}

- (BOOL)isEarfcnHighBand:(int)a3
{
  int32x4_t v3;
  uint32x4_t v4;
  uint32x4_t v5;
  BOOL v7;
  char v8;
  BOOL v10;

  v3 = vdupq_n_s32(a3);
  v4 = (uint32x4_t)vaddq_s32(v3, (int32x4_t)xmmword_1CB3890F0);
  v5 = (uint32x4_t)vaddq_s32(v3, (int32x4_t)xmmword_1CB389100);
  v7 = a3 < 0x960 || (a3 - 59140) < 0x3E8;
  v8 = vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vcgtq_u32((uint32x4_t)xmmword_1CB389110, v4), (int16x8_t)vcgtq_u32((uint32x4_t)xmmword_1CB389120, v5)))) | ((a3 - 2750) < 0x2BC);
  v10 = (a3 - 0x10000) < 0x708 || (a3 - 67836) < 0x2EE;
  return (v8 | (v7 || v10)) & 1;
}

- (double)translateChannelRBsToChannelBW:(double)a3
{
  double v3;

  v3 = 0.0;
  if (a3 != 0.0)
  {
    v3 = 20.0;
    if (a3 != 100.0)
    {
      v3 = 15.0;
      if (a3 != 75.0)
      {
        v3 = 10.0;
        if (a3 != 50.0)
        {
          v3 = 5.0;
          if (a3 != 25.0)
          {
            v3 = 3.0;
            if (a3 != 15.0)
              return 1.5;
          }
        }
      }
    }
  }
  return v3;
}

- (PLBBTelephonyRegMsg)telRegMsgHelper
{
  return (PLBBTelephonyRegMsg *)objc_getProperty(self, a2, 208, 1);
}

- (void)logTelephonyRegMsgWith:(id)a3
{
  void *v4;
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D7FFA0];
  v5 = a3;
  v6 = objc_msgSend(v4, "debugEnabled");
  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__PLBBAgent_logTelephonyRegMsgWith___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED883CB8 != -1)
      dispatch_once(&qword_1ED883CB8, block);
    if (byte_1ED883830)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent logTelephonyRegMsgWith:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logTelephonyRegMsgWith:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 3041);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v7 = MEMORY[0x1E0C809B0];
    }
  }
  -[PLBBAgent telRegMsgHelper](self, "telRegMsgHelper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTelRegInfo:", v5);

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v21[0] = v7;
    v21[1] = 3221225472;
    v21[2] = __36__PLBBAgent_logTelephonyRegMsgWith___block_invoke_1123;
    v21[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v21[4] = objc_opt_class();
    if (qword_1ED883CC0 != -1)
      dispatch_once(&qword_1ED883CC0, v21);
    if (byte_1ED883831)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded Telephony Registration msgs"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logTelephonyRegMsgWith:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 3047);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v15;
        _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v14, "logEventPointTelephonyRegistration");

}

- (int64_t)getSubsIdFromCTContext:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  int64_t v17;
  void *v18;
  int v19;
  uint64_t block;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
    goto LABEL_15;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __36__PLBBAgent_getSubsIdFromCTContext___block_invoke;
    v24 = &__block_descriptor_40_e5_v8__0lu32l8;
    v25 = v4;
    if (qword_1ED883BB0 != -1)
      dispatch_once(&qword_1ED883BB0, &block);
    if (byte_1ED88380F)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = objc_msgSend(v3, "slotID");
      objc_msgSend(v3, "userDataPreferred");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "userDefaultVoice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("Slot ID %d, data preferred: %@, default voice: %@"), v6, v7, v8, block, v22, v23, v24, v25);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent getSubsIdFromCTContext:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 1913);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v9;
        _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (objc_msgSend(v3, "slotID") == 1)
  {
    objc_msgSend(v3, "userDataPreferred");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    v17 = v16 ^ 1u;
    goto LABEL_16;
  }
  if (objc_msgSend(v3, "slotID") != 2)
  {
LABEL_15:
    v17 = -1;
    goto LABEL_16;
  }
  objc_msgSend(v3, "userDataPreferred");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if (v19)
    v17 = 2;
  else
    v17 = 3;
LABEL_16:

  return v17;
}

- (NSMutableArray)dsdsActivityMsgs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 392, 1);
}

- (void)cellChanged:(id)a3 cell:(id)a4
{
  id v6;
  id v7;
  int v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int64_t v42;
  void *v43;
  _QWORD block[5];
  _QWORD v45[2];
  _QWORD v46[2];
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E0D80020], "isBasebandDSDS");
  if (v7 && v8)
  {
    v9 = -[PLBBAgent getSubsIdFromCTContext:](self, "getSubsIdFromCTContext:", v6);
    v10 = *MEMORY[0x1E0CA7718];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA7718]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v43 = v12;
        removeCTPrefixFromString(CFSTR("kCTRegistrationRadioAccessTechnology"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v9;
        if (v9 == -1)
        {
          v19 = 0;
        }
        else
        {
          -[PLBBAgent dsdsActivityMsgs](self, "dsdsActivityMsgs");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (int)v9;
          objc_msgSend(v14, "objectAtIndexedSubscript:", (int)v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "campedRAT");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v13, "isEqualToString:", v17);

          if ((v18 & 1) != 0)
          {
            v19 = 1;
          }
          else
          {
            -[PLBBAgent dsdsActivityMsgs](self, "dsdsActivityMsgs");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectAtIndexedSubscript:", v15);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setCampedRAT:", v13);

            v19 = 0;
          }
          v9 = v42;
        }
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v22 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __30__PLBBAgent_cellChanged_cell___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v22;
          if (qword_1ED883B50 != -1)
            dispatch_once(&qword_1ED883B50, block);
          if (byte_1ED883803)
          {
            v40 = v13;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cellChanged:cell: called with subsId: %d"), v9);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "lastPathComponent");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent cellChanged:cell:]");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 1660);

            PLLogCommon();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v48 = v23;
              _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v13 = v40;
            v9 = v42;
          }
        }
        if ((v19 & 1) == 0)
          -[PLBBAgent logDSDSEventPointTelephonyActivityWithSubsId:context:callStatus:simStatus:signalInfo:RATselection:andCurrCampedRAT:](self, "logDSDSEventPointTelephonyActivityWithSubsId:context:callStatus:simStatus:signalInfo:RATselection:andCurrCampedRAT:", v9, v6, 0, 0, 0, 0, v13);
        if (objc_msgSend(MEMORY[0x1E0D80078], "isFullModeDaemon"))
        {
          v29 = *MEMORY[0x1E0CA75D0];
          objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA75D0]);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v7, "objectForKeyedSubscript:", v29);
            v31 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v31 = 0;
          }

          v32 = *MEMORY[0x1E0CA7698];
          objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CA7698]);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v7, "objectForKeyedSubscript:", v32);
            v34 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v34 = 0;
          }

          if (v31 | v34)
          {
            v45[0] = CFSTR("cellId");
            v45[1] = CFSTR("lac");
            v46[0] = v31;
            v46[1] = v34;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
            v41 = v13;
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "objectAtIndexedSubscript:", (int)v9);
            v37 = v9;
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "operatorName");
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            -[PLBBAgent logDSDSEventForwardTelephonyRegistrationWithKVPairs:subsId:andOperator:](self, "logDSDSEventForwardTelephonyRegistrationWithKVPairs:subsId:andOperator:", v35, v37, v39);
            v13 = v41;
          }

        }
      }
    }
    else
    {

    }
  }

}

+ (id)getBBAgent
{
  return (id)qword_1ED883A20;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBBAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

- (void)eventToFlushCacheOccurred
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD block[5];
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __38__PLBBAgent_eventToFlushCacheOccurred__block_invoke;
    v15[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v15[4] = objc_opt_class();
    if (qword_1ED883A28 != -1)
      dispatch_once(&qword_1ED883A28, v15);
    if (_MergedGlobals_1_41)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent eventToFlushCacheOccurred]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent eventToFlushCacheOccurred]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 504);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLOperator workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __38__PLBBAgent_eventToFlushCacheOccurred__block_invoke_649;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  dispatch_async(v11, block);

  -[PLOperator workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __38__PLBBAgent_eventToFlushCacheOccurred__block_invoke_2;
  v13[3] = &unk_1E85780C8;
  v13[4] = self;
  dispatch_async(v12, v13);

}

uint64_t __38__PLBBAgent_eventToFlushCacheOccurred__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_41 = result;
  return result;
}

uint64_t __38__PLBBAgent_eventToFlushCacheOccurred__block_invoke_649(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "flush");
}

void __38__PLBBAgent_eventToFlushCacheOccurred__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  int v6;
  uint64_t v7;
  __CFString *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  uint64_t v35;
  _QWORD block[4];
  const __CFString *v37;
  uint64_t v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lastBBActivityTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", v3);
  v5 = fabs(v4);

  v6 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  if (v5 <= 7200.0)
  {
    if (v6)
    {
      v22 = objc_opt_class();
      v31 = MEMORY[0x1E0C809B0];
      v32 = 3221225472;
      v33 = __38__PLBBAgent_eventToFlushCacheOccurred__block_invoke_660;
      v34 = &__block_descriptor_40_e5_v8__0lu32l8;
      v35 = v22;
      if (qword_1ED883A38 != -1)
        dispatch_once(&qword_1ED883A38, &v31);
      if (byte_1ED8837E2)
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 32), "lastBBActivityTimestamp");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", CFSTR("no reset needed! lastEventTimestamp=%@ timeIntevalSinceLastEvent=%f triggerTimeInterval=%f"), v24, *(_QWORD *)&v5, 0x40BC200000000000, v31, v32, v33, v34, v35);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "lastPathComponent");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent eventToFlushCacheOccurred]_block_invoke_2");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 518);

        PLLogCommon();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v25;
          _os_log_debug_impl(&dword_1CAF47000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  else
  {
    if (v6)
    {
      v7 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[2] = __38__PLBBAgent_eventToFlushCacheOccurred__block_invoke_3;
      block[3] = &unk_1E8578738;
      block[1] = 3221225472;
      v37 = CFSTR("Critical");
      v38 = v7;
      if (qword_1ED883A30 == -1)
      {
        v8 = CFSTR("Critical");
      }
      else
      {
        dispatch_once(&qword_1ED883A30, block);
        v8 = (__CFString *)v37;
      }
      v9 = byte_1ED8837E1;

      if (v9)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = (void *)MEMORY[0x1E0D80088];
        objc_msgSend(*(id *)(a1 + 32), "lastBBActivityTimestamp");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "formattedStringForDate:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("Trigger reset of channel! lastEventTimestamp=%@ timeIntevalSinceLastEvent=%f triggerTimeInterval=%f"), v13, *(_QWORD *)&v5, 0x40BC200000000000);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent eventToFlushCacheOccurred]_block_invoke_2");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 514);

        PLLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v14;
          _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v20 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLastBBActivityTimestamp:", v21);

    objc_msgSend(*(id *)(a1 + 32), "scheduleReconnect");
  }
}

uint64_t __38__PLBBAgent_eventToFlushCacheOccurred__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  byte_1ED8837E1 = result;
  return result;
}

uint64_t __38__PLBBAgent_eventToFlushCacheOccurred__block_invoke_660(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837E2 = result;
  return result;
}

- (void)checkKICEChannelTimeout
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[5];
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __36__PLBBAgent_checkKICEChannelTimeout__block_invoke;
    v13[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v13[4] = objc_opt_class();
    if (qword_1ED883A40 != -1)
      dispatch_once(&qword_1ED883A40, v13);
    if (byte_1ED8837E3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent checkKICEChannelTimeout]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent checkKICEChannelTimeout]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 526);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLOperator workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_663;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  dispatch_async(v11, block);

}

uint64_t __36__PLBBAgent_checkKICEChannelTimeout__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837E3 = result;
  return result;
}

void __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_663(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  int v6;
  uint64_t v7;
  __CFString *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t);
  void *v77;
  uint64_t v78;
  _QWORD v79[5];
  _QWORD v80[5];
  _QWORD v81[5];
  _QWORD v82[5];
  _QWORD block[4];
  const __CFString *v84;
  uint64_t v85;
  uint8_t buf[4];
  id v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lastBBActivityTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", v3);
  v5 = fabs(v4);

  v6 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  if (v5 <= 7200.0)
  {
    if (v6)
    {
      v34 = objc_opt_class();
      v74 = MEMORY[0x1E0C809B0];
      v75 = 3221225472;
      v76 = __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_703;
      v77 = &__block_descriptor_40_e5_v8__0lu32l8;
      v78 = v34;
      if (qword_1ED883A70 != -1)
        dispatch_once(&qword_1ED883A70, &v74);
      if (byte_1ED8837E9)
      {
        v35 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 32), "lastBBActivityTimestamp");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", CFSTR("no reset needed! lastEventTimestamp=%@ timeIntevalSinceLastEvent=%f triggerTimeInterval=%f"), v36, *(_QWORD *)&v5, 0x40BC200000000000, v74, v75, v76, v77, v78);
        v20 = (id)objc_claimAutoreleasedReturnValue();

        v37 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "lastPathComponent");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent checkKICEChannelTimeout]_block_invoke_2");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v39, v40, 565);

        PLLogCommon();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v87 = v20;
          _os_log_debug_impl(&dword_1CAF47000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        goto LABEL_54;
      }
    }
  }
  else
  {
    if (v6)
    {
      v7 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[2] = __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_2;
      block[3] = &unk_1E8578738;
      block[1] = 3221225472;
      v84 = CFSTR("Critical");
      v85 = v7;
      if (qword_1ED883A48 == -1)
      {
        v8 = CFSTR("Critical");
      }
      else
      {
        dispatch_once(&qword_1ED883A48, block);
        v8 = (__CFString *)v84;
      }
      v9 = byte_1ED8837E4;

      if (v9)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        v11 = (void *)MEMORY[0x1E0D80088];
        objc_msgSend(*(id *)(a1 + 32), "lastBBActivityTimestamp");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "formattedStringForDate:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("Trigger reset of channel! lastEventTimestamp=%@ timeIntevalSinceLastEvent=%f triggerTimeInterval=%f"), v13, *(_QWORD *)&v5, 0x40BC200000000000);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent checkKICEChannelTimeout]_block_invoke");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 531);

        PLLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v87 = v14;
          _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandProto") & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav") & 1) != 0
      || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandIce"))
    {
      v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(*(id *)(a1 + 32), "abmClient");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
      if (v21)
      {
        if (v22)
        {
          v23 = objc_opt_class();
          v81[0] = MEMORY[0x1E0C809B0];
          v81[1] = 3221225472;
          v81[2] = __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_678;
          v81[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v81[4] = v23;
          if (qword_1ED883A58 != -1)
            dispatch_once(&qword_1ED883A58, v81);
          if (byte_1ED8837E6)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLABMClient exists"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "lastPathComponent");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent checkKICEChannelTimeout]_block_invoke_2");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 542);

            PLLogCommon();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v87 = v24;
              _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        v30 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 32), "abmClient");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "getBasebandBootState");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("%@"), v32);
        v33 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (v22)
        {
          v41 = objc_opt_class();
          v82[0] = MEMORY[0x1E0C809B0];
          v82[1] = 3221225472;
          v82[2] = __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_668;
          v82[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v82[4] = v41;
          if (qword_1ED883A50 != -1)
            dispatch_once(&qword_1ED883A50, v82);
          if (byte_1ED8837E5)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLABMClient lost, init again"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "lastPathComponent");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent checkKICEChannelTimeout]_block_invoke_2");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "logMessage:fromFile:fromFunction:fromLineNumber:", v42, v45, v46, 538);

            PLLogCommon();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v87 = v42;
              _os_log_debug_impl(&dword_1CAF47000, v47, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("ICEChannelReset"));
        v33 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setupKICEChannels");
      }
      objc_msgSend(*(id *)(a1 + 32), "abmClient");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "getBasebandTimeAndLatency");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (v49)
      {
        objc_msgSend(v49, "time");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "latency");
        objc_msgSend(v50, "dateByAddingTimeInterval:", -v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "convertFromBasebandToMonotonic");
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v54 = objc_opt_class();
          v79[0] = MEMORY[0x1E0C809B0];
          v79[1] = 3221225472;
          v79[2] = __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_688;
          v79[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v79[4] = v54;
          if (qword_1ED883A68 != -1)
            dispatch_once(&qword_1ED883A68, v79);
          if (byte_1ED8837E8)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLBBAgent iceChannelTimeout::currentTime=%@"), v53);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "lastPathComponent");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent checkKICEChannelTimeout]_block_invoke_2");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "logMessage:fromFile:fromFunction:fromLineNumber:", v55, v58, v59, 551);

            PLLogCommon();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v87 = v55;
              _os_log_debug_impl(&dword_1CAF47000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        v61 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 32), "abmClient");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "getBasebandBootState");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "stringWithFormat:", CFSTR("%@"), v63);
        v64 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D80088], "formattedStringForDate:", v53);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v64;
      }
      else
      {
        if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          goto LABEL_52;
        v66 = objc_opt_class();
        v80[0] = MEMORY[0x1E0C809B0];
        v80[1] = 3221225472;
        v80[2] = __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_683;
        v80[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v80[4] = v66;
        if (qword_1ED883A60 != -1)
          dispatch_once(&qword_1ED883A60, v80);
        if (!byte_1ED8837E7)
        {
LABEL_52:
          v65 = 0;
          goto LABEL_53;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to query baseband timestamp"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "lastPathComponent");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent checkKICEChannelTimeout]_block_invoke_2");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "logMessage:fromFile:fromFunction:fromLineNumber:", v53, v69, v70, 548);

        PLLogCommon();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v87 = v53;
          _os_log_debug_impl(&dword_1CAF47000, v71, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v65 = 0;
      }

LABEL_53:
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v33, CFSTR("BBState"));
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v65, CFSTR("BBTime"));
      v72 = (void *)objc_opt_new();
      objc_msgSend(v72, "setAgent:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v72, "setMsgProcErr:", 0);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), CFSTR("ChannelTimeout:"), v20);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "setPayload:", v73);

      objc_msgSend(v72, "setMsgType:", &unk_1E8633918);
      objc_msgSend(v72, "logEventNoneBBMsgAll");

LABEL_54:
    }
  }
}

uint64_t __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  byte_1ED8837E4 = result;
  return result;
}

uint64_t __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_668(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837E5 = result;
  return result;
}

uint64_t __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_678(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837E6 = result;
  return result;
}

uint64_t __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_683(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837E7 = result;
  return result;
}

uint64_t __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_688(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837E8 = result;
  return result;
}

uint64_t __36__PLBBAgent_checkKICEChannelTimeout__block_invoke_703(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837E9 = result;
  return result;
}

- (void)eventToCommitCacheOccurred
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD block[5];
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __39__PLBBAgent_eventToCommitCacheOccurred__block_invoke;
    v13[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v13[4] = objc_opt_class();
    if (qword_1ED883A78 != -1)
      dispatch_once(&qword_1ED883A78, v13);
    if (byte_1ED8837EA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent eventToCommitCacheOccurred]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent eventToCommitCacheOccurred]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 572);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLOperator workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __39__PLBBAgent_eventToCommitCacheOccurred__block_invoke_704;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  dispatch_async(v11, block);

}

uint64_t __39__PLBBAgent_eventToCommitCacheOccurred__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837EA = result;
  return result;
}

uint64_t __39__PLBBAgent_eventToCommitCacheOccurred__block_invoke_704(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "commitHardwareLogs");
}

- (void)reconnectTimerFired
{
  void *v3;
  void *v4;

  -[PLBBAgent channelReconnectTimer](self, "channelReconnectTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLBBAgent channelReconnectTimer](self, "channelReconnectTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

  }
  -[PLBBAgent setChannelReconnectTimer:](self, "setChannelReconnectTimer:", 0);
  -[PLBBAgent setupBBChannelsWithAction:](self, "setupBBChannelsWithAction:", 2);
}

- (void)scheduleReconnect
{
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[PLBasebandLogChannel close](self->streamingChannel, "close");
  -[PLBasebandLogChannel close](self->cachedChannel, "close");
  -[PLBBAgent channelReconnectTimer](self, "channelReconnectTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "timerActive");

  if ((v4 & 1) == 0)
  {
    v5 = objc_alloc(MEMORY[0x1E0D80070]);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 60.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator workQueue](self, "workQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __30__PLBBAgent_scheduleReconnect__block_invoke;
    v9[3] = &unk_1E8578078;
    v9[4] = self;
    v8 = (void *)objc_msgSend(v5, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v6, 0, 0, v7, v9, 0.0, 0.0);
    -[PLBBAgent setChannelReconnectTimer:](self, "setChannelReconnectTimer:", v8);

  }
}

uint64_t __30__PLBBAgent_scheduleReconnect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reconnectTimerFired");
}

- (void)channelDidBecomeInvalid:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__PLBBAgent_channelDidBecomeInvalid___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED883A80 != -1)
      dispatch_once(&qword_1ED883A80, block);
    if (byte_1ED8837EB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent channelDidBecomeInvalid:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent channelDidBecomeInvalid:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 602);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandProto") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandIce"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v12 = objc_opt_class();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __37__PLBBAgent_channelDidBecomeInvalid___block_invoke_709;
      v19[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v19[4] = v12;
      if (qword_1ED883A88 != -1)
        dispatch_once(&qword_1ED883A88, v19);
      if (byte_1ED8837EC)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("channelDidBecomeInvalid not valid for Protobuf channel"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent channelDidBecomeInvalid:]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 604);

        PLLogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v13;
          _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      __assert_rtn("-[PLBBAgent channelDidBecomeInvalid:]", "PLBBAgent.m", 605, "0");
  }
  else
  {
    -[PLBBAgent scheduleReconnect](self, "scheduleReconnect");
  }

}

uint64_t __37__PLBBAgent_channelDidBecomeInvalid___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837EB = result;
  return result;
}

uint64_t __37__PLBBAgent_channelDidBecomeInvalid___block_invoke_709(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837EC = result;
  return result;
}

- (void)channel:(id)a3 hasDataAvailable:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t block;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D179C2E0]();
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __38__PLBBAgent_channel_hasDataAvailable___block_invoke;
    v21 = &__block_descriptor_40_e5_v8__0lu32l8;
    v22 = v9;
    if (qword_1ED883A90 != -1)
      dispatch_once(&qword_1ED883A90, &block);
    if (byte_1ED8837ED)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s \n CT channel has data available"), "-[PLBBAgent channel:hasDataAvailable:]", block, v19, v20, v21, v22);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent channel:hasDataAvailable:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 614);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v10;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLBasebandMessage messageWithData:](PLBasebandMessage, "messageWithData:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAgent:", self);
  objc_msgSend(v16, "logWithLogger:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v16, "eventCode") == 2275)
    -[PLBBAgent postCDRXCapability:](self, "postCDRXCapability:", 1);

  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBAgent setLastBBActivityTimestamp:](self, "setLastBBActivityTimestamp:", v17);

}

uint64_t __38__PLBBAgent_channel_hasDataAvailable___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837ED = result;
  return result;
}

- (void)metricMessageDebugLog:(id)a3
{
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint8_t v20[16];

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav"))
    v5 = CFSTR("BBMAVMsgMetricDump");
  else
    v5 = CFSTR("BBICEMsgMetricDump");
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v6);
  if (v7)
  {
    v8 = *MEMORY[0x1E0D80128];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80128]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

    v10 = *MEMORY[0x1E0D80130];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80130]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLICEBBMetricUtility convertToStringData:](PLICEBBMetricUtility, "convertToStringData:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v10);

    v13 = *MEMORY[0x1E0D80140];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80140]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v13);

    v15 = *MEMORY[0x1E0D80138];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80138]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v15);

    v17 = *MEMORY[0x1E0D80120];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80120]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v17);

    -[PLBBAgent logEntry:](self, "logEntry:", v7);
  }
  else
  {
    PLLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v20 = 0;
      _os_log_error_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_ERROR, "metricMessage Unable to allocate memory for PLEntry", v20, 2u);
    }

  }
}

uint64_t __27__PLBBAgent_metricMessage___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837EE = result;
  return result;
}

uint64_t __27__PLBBAgent_metricMessage___block_invoke_723(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837EF = result;
  return result;
}

- (void)triggerMessage:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  PLBBAgent *v32;
  _QWORD v33[5];
  _QWORD block[5];
  _QWORD v35[5];
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __28__PLBBAgent_triggerMessage___block_invoke;
    v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v35[4] = objc_opt_class();
    if (qword_1ED883AA8 != -1)
      dispatch_once(&qword_1ED883AA8, v35);
    if (byte_1ED8837F0)
    {
      v32 = self;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent triggerMessage:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent triggerMessage:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 775);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      self = v32;
    }
  }
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __28__PLBBAgent_triggerMessage___block_invoke_736;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = objc_opt_class();
  if (qword_1ED883AB0 != -1)
    dispatch_once(&qword_1ED883AB0, block);
  if (byte_1ED8837F1)
  {
    if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav"))
      v13 = CFSTR("BBMAVMsgTriggerDump");
    else
      v13 = CFSTR("BBICEMsgTriggerDump");
    +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v14);
    if (v15)
    {
      v16 = *MEMORY[0x1E0D80148];
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80148]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, v16);

      v18 = *MEMORY[0x1E0D80150];
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80150]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, v18);

      v20 = *MEMORY[0x1E0D80160];
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80160]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, v20);

      v22 = *MEMORY[0x1E0D80158];
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80158]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, v22);

      v24 = *MEMORY[0x1E0D80120];
      objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80120]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v25, v24);

      -[PLBBAgent logEntry:](self, "logEntry:", v15);
    }
    else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v33[0] = v6;
      v33[1] = 3221225472;
      v33[2] = __28__PLBBAgent_triggerMessage___block_invoke_2;
      v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v33[4] = objc_opt_class();
      if (qword_1ED883AB8 != -1)
        dispatch_once(&qword_1ED883AB8, v33);
      if (byte_1ED8837F2)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLBBICEMsg unable to allocate memory for PLEntry"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "lastPathComponent");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent triggerMessage:]");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v29, v30, 796);

        PLLogCommon();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v26;
          _os_log_debug_impl(&dword_1CAF47000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }

  }
}

uint64_t __28__PLBBAgent_triggerMessage___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837F0 = result;
  return result;
}

uint64_t __28__PLBBAgent_triggerMessage___block_invoke_736(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837F1 = result;
  return result;
}

uint64_t __28__PLBBAgent_triggerMessage___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837F2 = result;
  return result;
}

- (void)wakeMessage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
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
  _QWORD block[5];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __25__PLBBAgent_wakeMessage___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED883AC0 != -1)
      dispatch_once(&qword_1ED883AC0, block);
    if (byte_1ED8837F3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent wakeMessage:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent wakeMessage:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 816);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
  {
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "setAgent:", self);
    objc_msgSend(v12, "setMsgProcErr:", 0);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), CFSTR("SleepWakeDataABM:"), v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPayload:", v13);

    objc_msgSend(v12, "setMsgType:", &unk_1E8633930);
    objc_msgSend(v12, "logEventNoneBBMsgAll");

  }
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setAgent:", self);
  objc_msgSend(v14, "setMsgProcErr:", 0);
  objc_msgSend(v14, "setSwReason:", CFSTR("baseband"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kKeyBasebandWakeType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBbWakeType:", v15);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kKeyBasebandWakeSubType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBbWakeSubType:", v16);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kKeyBasebandWakeChannel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kKeyBasebandWakeChannel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBbWakeChannel:", v20);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kKeyBasebandWakeData"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kKeyBasebandWakeData"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBbWakeDataBin:", v22);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kKeyBasebandWakeDataParsed"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kKeyBasebandWakeDataParsed"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBbWakeDataParsed:", v24);

  }
  objc_msgSend(v14, "logEventPointSleepWakeABM");

}

uint64_t __25__PLBBAgent_wakeMessage___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837F3 = result;
  return result;
}

- (void)bootStateChange:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __29__PLBBAgent_bootStateChange___block_invoke;
    v17[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v17[4] = objc_opt_class();
    if (qword_1ED883AC8 != -1)
      dispatch_once(&qword_1ED883AC8, v17);
    if (byte_1ED8837F4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent bootStateChange:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent bootStateChange:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 848);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLOperator workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __29__PLBBAgent_bootStateChange___block_invoke_755;
  block[3] = &unk_1E85791E0;
  block[4] = self;
  v16 = v4;
  v14 = v4;
  dispatch_async(v13, block);

}

uint64_t __29__PLBBAgent_bootStateChange___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837F4 = result;
  return result;
}

void __29__PLBBAgent_bootStateChange___block_invoke_755(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;

  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setAgent:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v5, "setMsgProcErr:", 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), CFSTR("BootStateChange:"), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPayload:", v2);

  objc_msgSend(v5, "setMsgType:", &unk_1E8633918);
  objc_msgSend(v5, "logEventNoneBBMsgAll");
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("KeyBasebandBootState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("BasebandBootStateIsReady"));

  if (v4)
  {
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandProto") & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav") & 1) != 0
      || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandIce"))
    {
      objc_msgSend(*(id *)(a1 + 32), "setupKICEChannels");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setupMavABMChannel");
      objc_msgSend(*(id *)(a1 + 32), "setupBBChannelsWithAction:", 0);
    }
  }

}

+ (id)defaults
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (void)handlePLBasebandEventNotification:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[6];
  _QWORD v7[5];
  id v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__10;
  v7[4] = __Block_byref_object_dispose__10;
  v4 = a3;
  v8 = v4;
  -[PLOperator workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__PLBBAgent_handlePLBasebandEventNotification___block_invoke;
  v6[3] = &unk_1E857DC60;
  v6[4] = self;
  v6[5] = v7;
  dispatch_async(v5, v6);

  _Block_object_dispose(v7, 8);
}

void __47__PLBBAgent_handlePLBasebandEventNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    objc_msgSend(v2, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "userInfo");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rat"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("LTE")))
      {

      }
      else
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("Connected"));

        if (!v7)
        {
          objc_msgSend((id)qword_1ED883AD0, "timeIntervalSinceNow");
          if (fabs(v8) > 30.0 && qword_1ED883AD8 == 0)
          {
            objc_initWeak(&location, *(id *)(a1 + 32));
            v10 = objc_alloc(MEMORY[0x1E0D80070]);
            objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDateWithTimeIntervalSinceNow:", 30.0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "workQueue");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = MEMORY[0x1E0C809B0];
            v16 = 3221225472;
            v17 = __47__PLBBAgent_handlePLBasebandEventNotification___block_invoke_2;
            v18 = &unk_1E8578C50;
            objc_copyWeak(&v19, &location);
            v13 = objc_msgSend(v10, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v11, 0, 0, v12, &v15, 0.0, 0.0);
            v14 = (void *)qword_1ED883AD8;
            qword_1ED883AD8 = v13;

            objc_msgSend((id)qword_1ED883AD8, "arm", v15, v16, v17, v18);
            objc_destroyWeak(&v19);
            objc_destroyWeak(&location);
          }
        }
      }

    }
  }
}

void __47__PLBBAgent_handlePLBasebandEventNotification___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handlePostCDRXCapability");

}

- (void)handlePostCDRXCapability
{
  void *v2;

  -[PLBBAgent postCDRXCapability:](self, "postCDRXCapability:", 0);
  v2 = (void *)qword_1ED883AD8;
  qword_1ED883AD8 = 0;

}

- (void)postCDRXCapability:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD block[5];
  int out_token;
  void *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if (qword_1ED883AD8)
  {
    objc_msgSend((id)qword_1ED883AD8, "invalidate");
    v4 = (void *)qword_1ED883AD8;
    qword_1ED883AD8 = 0;

  }
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)qword_1ED883AD0;
    qword_1ED883AD0 = v5;

  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__PLBBAgent_postCDRXCapability___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (qword_1ED883AE0 != -1)
      dispatch_once(&qword_1ED883AE0, block);
    if (byte_1ED8837F5)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0D80088], "formattedStringForDate:", qword_1ED883AD0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ %@"), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent postCDRXCapability:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 916);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        out_token = 138412290;
        v19 = v11;
        _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&out_token, 0xCu);
      }

    }
  }
  out_token = 0;
  if (!notify_register_check("com.apple.powerlog.BasebandHasCDRXCapability", &out_token))
  {
    if (!notify_set_state(out_token, v3))
      notify_post("com.apple.powerlog.BasebandHasCDRXCapability");
    notify_cancel(out_token);
  }
}

uint64_t __32__PLBBAgent_postCDRXCapability___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837F5 = result;
  return result;
}

+ (id)entryEventPointDefinitions
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  uint64_t v28;
  _QWORD block[5];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v2 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39__PLBBAgent_entryEventPointDefinitions__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v2;
      if (qword_1ED883AE8 != -1)
        dispatch_once(&qword_1ED883AE8, block);
      if (byte_1ED8837F6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("KMAV point defs"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastPathComponent");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLBBAgent entryEventPointDefinitions]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 940);

        PLLogCommon();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v3;
          _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v34[0] = CFSTR("SleepWakeActivityMavABM");
    +[PLBBSleepWakeMsg entryEventPointDefinitionSleepWakeActivityMavABM](PLBBSleepWakeMsg, "entryEventPointDefinitionSleepWakeActivityMavABM");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = CFSTR("TelephonyActivity");
    v35[0] = v9;
    +[PLBBTelephonyActivityMsg entryEventPointDefinitionTelephonyActivity](PLBBTelephonyActivityMsg, "entryEventPointDefinitionTelephonyActivity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v10;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = v35;
    v13 = v34;
  }
  else
  {
    if (!objc_msgSend(MEMORY[0x1E0D80020], "isBasebandIce"))
    {
      v30[0] = CFSTR("CMCDMAExitCode");
      +[PLBBEurekaEventMsg bbEuEvMsgNameCMCDMAExit](PLBBEurekaEventMsg, "bbEuEvMsgNameCMCDMAExit");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v9;
      v30[1] = CFSTR("SleepWakeActivityMavABM");
      +[PLBBSleepWakeMsg entryEventPointDefinitionSleepWakeActivityMavABM](PLBBSleepWakeMsg, "entryEventPointDefinitionSleepWakeActivityMavABM");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v10;
      v30[2] = CFSTR("TelephonyActivity");
      +[PLBBTelephonyActivityMsg entryEventPointDefinitionTelephonyActivity](PLBBTelephonyActivityMsg, "entryEventPointDefinitionTelephonyActivity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v31[2] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_21;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v14 = objc_opt_class();
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __39__PLBBAgent_entryEventPointDefinitions__block_invoke_773;
      v27 = &__block_descriptor_40_e5_v8__0lu32l8;
      v28 = v14;
      if (qword_1ED883AF0 != -1)
        dispatch_once(&qword_1ED883AF0, &v24);
      if (byte_1ED8837F7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("KICE point defs"), v24, v25, v26, v27, v28);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLBBAgent entryEventPointDefinitions]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 962);

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v15;
          _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v32[0] = CFSTR("SleepWakeActivityIceABM");
    +[PLBBSleepWakeMsg entryEventPointDefinitionSleepWakeActivityIceABM](PLBBSleepWakeMsg, "entryEventPointDefinitionSleepWakeActivityIceABM", v24, v25, v26, v27, v28);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = CFSTR("TelephonyActivity");
    v33[0] = v9;
    +[PLBBTelephonyActivityMsg entryEventPointDefinitionTelephonyActivity](PLBBTelephonyActivityMsg, "entryEventPointDefinitionTelephonyActivity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v10;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = v33;
    v13 = v32;
  }
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  return v21;
}

uint64_t __39__PLBBAgent_entryEventPointDefinitions__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837F6 = result;
  return result;
}

uint64_t __39__PLBBAgent_entryEventPointDefinitions__block_invoke_773(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837F7 = result;
  return result;
}

+ (id)entryEventForwardDefinitions
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD block[5];
  _QWORD v23[7];
  _QWORD v24[7];
  _QWORD v25[7];
  _QWORD v26[7];
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandProto") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandIce"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v3 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__PLBBAgent_entryEventForwardDefinitions__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v3;
      if (qword_1ED883AF8 != -1)
        dispatch_once(&qword_1ED883AF8, block);
      if (byte_1ED8837F8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("KICE forward defs"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lastPathComponent");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLBBAgent entryEventForwardDefinitions]");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 987);

        PLLogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v4;
          _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v27[0] = CFSTR("TelephonyRegistration");
    +[PLBBTelephonyRegMsg bbEuLogMsgNameTelephonyReg](PLBBTelephonyRegMsg, "bbEuLogMsgNameTelephonyReg");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = CFSTR("SDM");
    v28[0] = v10;
    objc_msgSend(a1, "entryEventForwardSDM");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003003) & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003002) & 1) != 0)
    {
      v23[0] = CFSTR("TelephonyRegistration");
      +[PLBBTelephonyRegMsg bbEuLogMsgNameTelephonyReg](PLBBTelephonyRegMsg, "bbEuLogMsgNameTelephonyReg");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v10;
      v23[1] = CFSTR("SDEventActionCode");
      +[PLBBEurekaEventMsg bbEuEvMsgNameSDEventActionCode](PLBBEurekaEventMsg, "bbEuEvMsgNameSDEventActionCode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v11;
      v23[2] = CFSTR("WCDMARRCState");
      +[PLBBEurekaEventMsg bbEuEvMsgNameWCDMARRCState](PLBBEurekaEventMsg, "bbEuEvMsgNameWCDMARRCState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v14;
      v23[3] = CFSTR("LTERRCState");
      +[PLBBEurekaEventMsg bbEuEvMsgNameLTERRCState](PLBBEurekaEventMsg, "bbEuEvMsgNameLTERRCState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[3] = v15;
      v23[4] = CFSTR("UTRANRRCState");
      +[PLBBEurekaEventMsg bbEuEvMsgUTRANRRCState](PLBBEurekaEventMsg, "bbEuEvMsgUTRANRRCState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24[4] = v16;
      v23[5] = CFSTR("GSML1State");
      +[PLBBEurekaEventMsg bbEuEvMsgNameGSML1State](PLBBEurekaEventMsg, "bbEuEvMsgNameGSML1State");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[5] = v17;
      v23[6] = CFSTR("CMCallEventOrigCode");
      +[PLBBEurekaEventMsg bbEuEvMsgNameCMCallEventOrigV2](PLBBEurekaEventMsg, "bbEuEvMsgNameCMCallEventOrigV2");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24[6] = v18;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = v24;
      v21 = v23;
    }
    else
    {
      v25[0] = CFSTR("TelephonyRegistration");
      +[PLBBTelephonyRegMsg bbEuLogMsgNameTelephonyReg](PLBBTelephonyRegMsg, "bbEuLogMsgNameTelephonyReg");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v10;
      v25[1] = CFSTR("SDEventActionCode");
      +[PLBBEurekaEventMsg bbEuEvMsgNameSDEventActionCode](PLBBEurekaEventMsg, "bbEuEvMsgNameSDEventActionCode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v11;
      v25[2] = CFSTR("WCDMARRCState");
      +[PLBBEurekaEventMsg bbEuEvMsgNameWCDMARRCState](PLBBEurekaEventMsg, "bbEuEvMsgNameWCDMARRCState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = v14;
      v25[3] = CFSTR("LTERRCState");
      +[PLBBEurekaEventMsg bbEuEvMsgNameLTERRCState](PLBBEurekaEventMsg, "bbEuEvMsgNameLTERRCState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26[3] = v15;
      v25[4] = CFSTR("UTRANRRCState");
      +[PLBBEurekaEventMsg bbEuEvMsgUTRANRRCState](PLBBEurekaEventMsg, "bbEuEvMsgUTRANRRCState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26[4] = v16;
      v25[5] = CFSTR("GSML1State");
      +[PLBBEurekaEventMsg bbEuEvMsgNameGSML1State](PLBBEurekaEventMsg, "bbEuEvMsgNameGSML1State");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26[5] = v17;
      v25[6] = CFSTR("CMCallEventOrigCode");
      +[PLBBEurekaEventMsg bbEuEvMsgNameCMCallEventOrig](PLBBEurekaEventMsg, "bbEuEvMsgNameCMCallEventOrig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v26[6] = v18;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = v26;
      v21 = v25;
    }
    objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

uint64_t __41__PLBBAgent_entryEventForwardDefinitions__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837F8 = result;
  return result;
}

+ (id)entryEventBackwardDefinitions
{
  void *v2;
  void *v3;
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
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[5];
  _QWORD block[5];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  uint8_t buf[4];
  void *v52;
  _QWORD v53[4];
  _QWORD v54[4];
  _QWORD v55[4];
  _QWORD v56[4];
  _QWORD v57[11];
  _QWORD v58[11];
  _QWORD v59[11];
  _QWORD v60[11];
  _QWORD v61[11];
  _QWORD v62[11];
  _QWORD v63[11];
  _QWORD v64[14];

  v64[11] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003007))
  {
    v63[0] = CFSTR("LTESleepMgrStats");
    +[PLBBEurekaLogMsg bbEuLogMsgNameLTESleepMgrStats](PLBBEurekaLogMsg, "bbEuLogMsgNameLTESleepMgrStats");
    v44 = objc_claimAutoreleasedReturnValue();
    v64[0] = v44;
    v63[1] = CFSTR("MavBBHwOther");
    +[PLBBMavLogMsg entryEventMavBBMav16BHwOther](PLBBMavLogMsg, "entryEventMavBBMav16BHwOther");
    v43 = objc_claimAutoreleasedReturnValue();
    v64[1] = v43;
    v63[2] = CFSTR("MavBBHwOtherPerRAT");
    +[PLBBMavLogMsg entryEventBackwardMavBBHwOtherPerRAT](PLBBMavLogMsg, "entryEventBackwardMavBBHwOtherPerRAT");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v64[2] = v2;
    v63[3] = CFSTR("BBMavHwRfLTE");
    +[PLBBMav16BHwRfLTELogMsg entryEventBackwardDefinitionBBMav16BHwRfLTE](PLBBMav16BHwRfLTELogMsg, "entryEventBackwardDefinitionBBMav16BHwRfLTE");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v64[3] = v3;
    v63[4] = CFSTR("BBMavHwRfWCDMA");
    +[PLBBMavHwRfWCDMALogMsg entryEventBackwardDefinitionBBMav16BHwRfWCDMA](PLBBMavHwRfWCDMALogMsg, "entryEventBackwardDefinitionBBMav16BHwRfWCDMA");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v64[4] = v4;
    v63[5] = CFSTR("BBMavHwRfGSM");
    +[PLBBMavHwRfGSMLogMsg entryEventBackwardDefinitionBBMavHwRfGSM](PLBBMavHwRfGSMLogMsg, "entryEventBackwardDefinitionBBMavHwRfGSM");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v64[5] = v5;
    v63[6] = CFSTR("BBMavHwRfTDS");
    +[PLBBMavHwRfTDSLogMsg entryEventBackwardDefinitionBBMavHwRfTDS](PLBBMavHwRfTDSLogMsg, "entryEventBackwardDefinitionBBMavHwRfTDS");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v64[6] = v6;
    v63[7] = CFSTR("BBMavHwRf1x");
    +[PLBBMavHwRf1xLogMsg entryEventBackwardDefinitionBBMavHwRf1x](PLBBMavHwRf1xLogMsg, "entryEventBackwardDefinitionBBMavHwRf1x");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v64[7] = v7;
    v63[8] = CFSTR("BBMavHwRfHDR");
    +[PLBBMavHwRfHDRLogMsg entryEventBackwardDefinitionBBMavHwRfHDR](PLBBMavHwRfHDRLogMsg, "entryEventBackwardDefinitionBBMavHwRfHDR");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v64[8] = v8;
    v63[9] = CFSTR("BBMavHwRfOos");
    +[PLBBMavHwRfOOSLogMsg entryEventBackwardDefinitionOOSPerRat](PLBBMavHwRfOOSLogMsg, "entryEventBackwardDefinitionOOSPerRat");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v64[9] = v9;
    v63[10] = CFSTR("CMCallEventEndCode");
    +[PLBBEurekaEventMsg bbEuEvMsgNameCMCallEventEndV2](PLBBEurekaEventMsg, "bbEuEvMsgNameCMCallEventEndV2");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v64[10] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 11);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
    v18 = (void *)v43;
    v19 = (void *)v44;
LABEL_11:

    return v11;
  }
  if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003005))
  {
    v61[0] = CFSTR("LTESleepMgrStats");
    +[PLBBEurekaLogMsg bbEuLogMsgNameLTESleepMgrStats](PLBBEurekaLogMsg, "bbEuLogMsgNameLTESleepMgrStats");
    v44 = objc_claimAutoreleasedReturnValue();
    v62[0] = v44;
    v61[1] = CFSTR("MavBBHwOther");
    +[PLBBMavLogMsg entryEventMavBBMav16HwOther](PLBBMavLogMsg, "entryEventMavBBMav16HwOther");
    v43 = objc_claimAutoreleasedReturnValue();
    v62[1] = v43;
    v61[2] = CFSTR("MavBBHwOtherPerRAT");
    +[PLBBMavLogMsg entryEventBackwardMavBBHwOtherPerRAT](PLBBMavLogMsg, "entryEventBackwardMavBBHwOtherPerRAT");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v2;
    v61[3] = CFSTR("BBMavHwRfLTE");
    +[PLBBMav16HwRfLTELogMsg entryEventBackwardDefinitionBBMav16HwRfLTE](PLBBMav16HwRfLTELogMsg, "entryEventBackwardDefinitionBBMav16HwRfLTE");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v62[3] = v3;
    v61[4] = CFSTR("BBMavHwRfWCDMA");
    +[PLBBMavHwRfWCDMALogMsg entryEventBackwardDefinitionBBMav16HwRfWCDMA](PLBBMavHwRfWCDMALogMsg, "entryEventBackwardDefinitionBBMav16HwRfWCDMA");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v62[4] = v4;
    v61[5] = CFSTR("BBMavHwRfGSM");
    +[PLBBMavHwRfGSMLogMsg entryEventBackwardDefinitionBBMavHwRfGSM](PLBBMavHwRfGSMLogMsg, "entryEventBackwardDefinitionBBMavHwRfGSM");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v62[5] = v5;
    v61[6] = CFSTR("BBMavHwRfTDS");
    +[PLBBMavHwRfTDSLogMsg entryEventBackwardDefinitionBBMavHwRfTDS](PLBBMavHwRfTDSLogMsg, "entryEventBackwardDefinitionBBMavHwRfTDS");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v62[6] = v6;
    v61[7] = CFSTR("BBMavHwRf1x");
    +[PLBBMavHwRf1xLogMsg entryEventBackwardDefinitionBBMavHwRf1x](PLBBMavHwRf1xLogMsg, "entryEventBackwardDefinitionBBMavHwRf1x");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v62[7] = v7;
    v61[8] = CFSTR("BBMavHwRfHDR");
    +[PLBBMavHwRfHDRLogMsg entryEventBackwardDefinitionBBMavHwRfHDR](PLBBMavHwRfHDRLogMsg, "entryEventBackwardDefinitionBBMavHwRfHDR");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v62[8] = v12;
    v61[9] = CFSTR("BBMavHwRfOos");
    +[PLBBMavHwRfOOSLogMsg entryEventBackwardDefinitionOOSPerRat](PLBBMavHwRfOOSLogMsg, "entryEventBackwardDefinitionOOSPerRat");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v62[9] = v13;
    v61[10] = CFSTR("CMCallEventEndCode");
    +[PLBBEurekaEventMsg bbEuEvMsgNameCMCallEventEndV2](PLBBEurekaEventMsg, "bbEuEvMsgNameCMCallEventEndV2");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v62[10] = v14;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = v62;
    v17 = v61;
LABEL_9:
    objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 11);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003004))
  {
    v59[0] = CFSTR("LTESleepMgrStats");
    +[PLBBEurekaLogMsg bbEuLogMsgNameLTESleepMgrStats](PLBBEurekaLogMsg, "bbEuLogMsgNameLTESleepMgrStats");
    v44 = objc_claimAutoreleasedReturnValue();
    v60[0] = v44;
    v59[1] = CFSTR("MavBBHwOther");
    +[PLBBMavLogMsg entryEventMavBBMav13HwOther](PLBBMavLogMsg, "entryEventMavBBMav13HwOther");
    v43 = objc_claimAutoreleasedReturnValue();
    v60[1] = v43;
    v59[2] = CFSTR("MavBBHwOtherPerRAT");
    +[PLBBMavLogMsg entryEventBackwardMavBBHwOtherPerRAT](PLBBMavLogMsg, "entryEventBackwardMavBBHwOtherPerRAT");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v60[2] = v2;
    v59[3] = CFSTR("BBMavHwRfLTE");
    +[PLBBMavHwRfLTELogMsg entryEventBackwardDefinitionBBMav13HwRfLTE](PLBBMavHwRfLTELogMsg, "entryEventBackwardDefinitionBBMav13HwRfLTE");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v60[3] = v3;
    v59[4] = CFSTR("BBMavHwRfWCDMA");
    +[PLBBMavHwRfWCDMALogMsg entryEventBackwardDefinitionBBMavHwRfWCDMA](PLBBMavHwRfWCDMALogMsg, "entryEventBackwardDefinitionBBMavHwRfWCDMA");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v60[4] = v4;
    v59[5] = CFSTR("BBMavHwRfGSM");
    +[PLBBMavHwRfGSMLogMsg entryEventBackwardDefinitionBBMavHwRfGSM](PLBBMavHwRfGSMLogMsg, "entryEventBackwardDefinitionBBMavHwRfGSM");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v60[5] = v5;
    v59[6] = CFSTR("BBMavHwRfTDS");
    +[PLBBMavHwRfTDSLogMsg entryEventBackwardDefinitionBBMavHwRfTDS](PLBBMavHwRfTDSLogMsg, "entryEventBackwardDefinitionBBMavHwRfTDS");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v60[6] = v6;
    v59[7] = CFSTR("BBMavHwRf1x");
    +[PLBBMavHwRf1xLogMsg entryEventBackwardDefinitionBBMavHwRf1x](PLBBMavHwRf1xLogMsg, "entryEventBackwardDefinitionBBMavHwRf1x");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v60[7] = v7;
    v59[8] = CFSTR("BBMavHwRfHDR");
    +[PLBBMavHwRfHDRLogMsg entryEventBackwardDefinitionBBMavHwRfHDR](PLBBMavHwRfHDRLogMsg, "entryEventBackwardDefinitionBBMavHwRfHDR");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v60[8] = v12;
    v59[9] = CFSTR("BBMavHwRfOos");
    +[PLBBMavHwRfOOSLogMsg entryEventBackwardDefinitionOOSPerRat](PLBBMavHwRfOOSLogMsg, "entryEventBackwardDefinitionOOSPerRat");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v60[9] = v13;
    v59[10] = CFSTR("CMCallEventEndCode");
    +[PLBBEurekaEventMsg bbEuEvMsgNameCMCallEventEndV2](PLBBEurekaEventMsg, "bbEuEvMsgNameCMCallEventEndV2");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v60[10] = v14;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = v60;
    v17 = v59;
    goto LABEL_9;
  }
  if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003003))
  {
    v57[0] = CFSTR("LTESleepMgrStats");
    +[PLBBEurekaLogMsg bbEuLogMsgNameLTESleepMgrStats](PLBBEurekaLogMsg, "bbEuLogMsgNameLTESleepMgrStats");
    v44 = objc_claimAutoreleasedReturnValue();
    v58[0] = v44;
    v57[1] = CFSTR("MavBBHwOther");
    +[PLBBMavLogMsg entryEventMavBBMav10HwOther](PLBBMavLogMsg, "entryEventMavBBMav10HwOther");
    v43 = objc_claimAutoreleasedReturnValue();
    v58[1] = v43;
    v57[2] = CFSTR("MavBBHwOtherPerRAT");
    +[PLBBMavLogMsg entryEventBackwardMavBBHwOtherPerRAT](PLBBMavLogMsg, "entryEventBackwardMavBBHwOtherPerRAT");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v2;
    v57[3] = CFSTR("BBMavHwRfLTE");
    +[PLBBMavHwRfLTELogMsg entryEventBackwardDefinitionBBMav10HwRfLTE](PLBBMavHwRfLTELogMsg, "entryEventBackwardDefinitionBBMav10HwRfLTE");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v58[3] = v3;
    v57[4] = CFSTR("BBMavHwRfWCDMA");
    +[PLBBMavHwRfWCDMALogMsg entryEventBackwardDefinitionBBMavHwRfWCDMA](PLBBMavHwRfWCDMALogMsg, "entryEventBackwardDefinitionBBMavHwRfWCDMA");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v58[4] = v4;
    v57[5] = CFSTR("BBMavHwRfGSM");
    +[PLBBMavHwRfGSMLogMsg entryEventBackwardDefinitionBBMavHwRfGSM](PLBBMavHwRfGSMLogMsg, "entryEventBackwardDefinitionBBMavHwRfGSM");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v58[5] = v5;
    v57[6] = CFSTR("BBMavHwRfTDS");
    +[PLBBMavHwRfTDSLogMsg entryEventBackwardDefinitionBBMavHwRfTDS](PLBBMavHwRfTDSLogMsg, "entryEventBackwardDefinitionBBMavHwRfTDS");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v58[6] = v6;
    v57[7] = CFSTR("BBMavHwRf1x");
    +[PLBBMavHwRf1xLogMsg entryEventBackwardDefinitionBBMavHwRf1x](PLBBMavHwRf1xLogMsg, "entryEventBackwardDefinitionBBMavHwRf1x");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v58[7] = v7;
    v57[8] = CFSTR("BBMavHwRfHDR");
    +[PLBBMavHwRfHDRLogMsg entryEventBackwardDefinitionBBMavHwRfHDR](PLBBMavHwRfHDRLogMsg, "entryEventBackwardDefinitionBBMavHwRfHDR");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v58[8] = v12;
    v57[9] = CFSTR("BBMavHwRfOos");
    +[PLBBMavHwRfOOSLogMsg entryEventBackwardDefinitionOOSPerRat](PLBBMavHwRfOOSLogMsg, "entryEventBackwardDefinitionOOSPerRat");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v58[9] = v13;
    v57[10] = CFSTR("CMCallEventEndCode");
    +[PLBBEurekaEventMsg bbEuEvMsgNameCMCallEventEndV2](PLBBEurekaEventMsg, "bbEuEvMsgNameCMCallEventEndV2");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v58[10] = v14;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = v58;
    v17 = v57;
    goto LABEL_9;
  }
  if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003002))
  {
    v55[0] = CFSTR("LTESleepMgrStats");
    +[PLBBEurekaLogMsg bbEuLogMsgNameLTESleepMgrStats](PLBBEurekaLogMsg, "bbEuLogMsgNameLTESleepMgrStats");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v19;
    v55[1] = CFSTR("MavBBHwOther");
    +[PLBBMavLogMsg entryEventBackwardMavBBHwOther](PLBBMavLogMsg, "entryEventBackwardMavBBHwOther");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v18;
    v55[2] = CFSTR("MavBBHwOtherPerRAT");
    +[PLBBMavLogMsg entryEventBackwardMavBBHwOtherPerRAT](PLBBMavLogMsg, "entryEventBackwardMavBBHwOtherPerRAT");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v56[2] = v21;
    v55[3] = CFSTR("CMCallEventEndCode");
    +[PLBBEurekaEventMsg bbEuEvMsgNameCMCallEventEndV2](PLBBEurekaEventMsg, "bbEuEvMsgNameCMCallEventEndV2");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v56[3] = v22;
    v23 = (void *)MEMORY[0x1E0C99D80];
    v24 = v56;
    v25 = v55;
LABEL_16:
    objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003001))
  {
    v53[0] = CFSTR("LTESleepMgrStats");
    +[PLBBEurekaLogMsg bbEuLogMsgNameLTESleepMgrStats](PLBBEurekaLogMsg, "bbEuLogMsgNameLTESleepMgrStats");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v19;
    v53[1] = CFSTR("MavBBHwOther");
    +[PLBBMavLogMsg entryEventBackwardMavBBHwOther](PLBBMavLogMsg, "entryEventBackwardMavBBHwOther");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = v18;
    v53[2] = CFSTR("MavBBHwOtherPerRAT");
    +[PLBBMavLogMsg entryEventBackwardMavBBHwOtherPerRAT](PLBBMavLogMsg, "entryEventBackwardMavBBHwOtherPerRAT");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v54[2] = v21;
    v53[3] = CFSTR("CMCallEventEndCode");
    +[PLBBEurekaEventMsg bbEuEvMsgNameCMCallEventEnd](PLBBEurekaEventMsg, "bbEuEvMsgNameCMCallEventEnd");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v54[3] = v22;
    v23 = (void *)MEMORY[0x1E0C99D80];
    v24 = v54;
    v25 = v53;
    goto LABEL_16;
  }
  if ((int)objc_msgSend(MEMORY[0x1E0D80020], "kPLBasebandClassOfDevice") > 1003011)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v26 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__PLBBAgent_entryEventBackwardDefinitions__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v26;
      if (qword_1ED883B00 != -1)
        dispatch_once(&qword_1ED883B00, block);
      if (byte_1ED8837F9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("KMAV backward defs"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "lastPathComponent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLBBAgent entryEventBackwardDefinitions]");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 1245);

        PLLogCommon();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v27;
          _os_log_debug_impl(&dword_1CAF47000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v49[0] = CFSTR("BBMavPeriodicMetrics");
    +[PLMAVBBHardwareMessage entryEventBackwardDefinitionBBMavPeriodicMetrics](PLMAVBBHardwareMessage, "entryEventBackwardDefinitionBBMavPeriodicMetrics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = CFSTR("BBMavEventMetrics");
    v50[0] = v19;
    +[PLMAVBBHardwareMessage entryEventBackwardDefinitionBBMavEventMetrics](PLMAVBBHardwareMessage, "entryEventBackwardDefinitionBBMavEventMetrics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v18;
    v33 = (void *)MEMORY[0x1E0C99D80];
    v34 = v50;
    v35 = v49;
LABEL_35:
    objc_msgSend(v33, "dictionaryWithObjects:forKeys:count:", v34, v35, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandIce"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v36 = objc_opt_class();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __42__PLBBAgent_entryEventBackwardDefinitions__block_invoke_796;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v45[4] = v36;
      if (qword_1ED883B08 != -1)
        dispatch_once(&qword_1ED883B08, v45);
      if (byte_1ED8837FA)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("KICE backward defs"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "lastPathComponent");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLBBAgent entryEventBackwardDefinitions]");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "logMessage:fromFile:fromFunction:fromLineNumber:", v37, v40, v41, 1255);

        PLLogCommon();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v37;
          _os_log_debug_impl(&dword_1CAF47000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v47[0] = CFSTR("BBIcePeriodicMetrics");
    +[PLICEBBHardwareMessage entryEventBackwardDefinitionBBIcePeriodicMetrics](PLICEBBHardwareMessage, "entryEventBackwardDefinitionBBIcePeriodicMetrics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = CFSTR("BBIceEventMetrics");
    v48[0] = v19;
    +[PLICEBBHardwareMessage entryEventBackwardDefinitionBBIceEventMetrics](PLICEBBHardwareMessage, "entryEventBackwardDefinitionBBIceEventMetrics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v18;
    v33 = (void *)MEMORY[0x1E0C99D80];
    v34 = v48;
    v35 = v47;
    goto LABEL_35;
  }
  return MEMORY[0x1E0C9AA70];
}

uint64_t __42__PLBBAgent_entryEventBackwardDefinitions__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837F9 = result;
  return result;
}

uint64_t __42__PLBBAgent_entryEventBackwardDefinitions__block_invoke_796(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837FA = result;
  return result;
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventNoneDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav"))
  {
    v20[0] = CFSTR("BBMAVMsgTriggerDump");
    +[PLBBICEMsg msgTriggerTableSchema](PLBBICEMsg, "msgTriggerTableSchema");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v3;
    v20[1] = CFSTR("BBMAVMsgMetricDump");
    +[PLBBICEMsg msgMetricTableSchema](PLBBICEMsg, "msgMetricTableSchema");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v4;
    +[PLBBAgent getNameBBReport](PLBBAgent, "getNameBBReport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = v5;
    objc_msgSend(a1, "entryEventNoneBBReport");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v6;
    v20[3] = CFSTR("BBMsgLite");
    objc_msgSend(a1, "entryIceMsgLite");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v7;
    v20[4] = CFSTR("BBMsgAll");
    +[PLBBMsgAll entryEventNoneBBMsgAll](PLBBMsgAll, "entryEventNoneBBMsgAll");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[4] = v8;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = v21;
    v11 = v20;
  }
  else if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandIce"))
  {
    v18[0] = CFSTR("BBICEMsgTriggerDump");
    +[PLBBICEMsg msgTriggerTableSchema](PLBBICEMsg, "msgTriggerTableSchema");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v3;
    v18[1] = CFSTR("BBICEMsgMetricDump");
    +[PLBBICEMsg msgMetricTableSchema](PLBBICEMsg, "msgMetricTableSchema");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v4;
    +[PLBBAgent getNameBBReport](PLBBAgent, "getNameBBReport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v5;
    objc_msgSend(a1, "entryEventNoneBBReport");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v6;
    v18[3] = CFSTR("BBMsgLite");
    objc_msgSend(a1, "entryIceMsgLite");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[3] = v7;
    v18[4] = CFSTR("BBMsgAll");
    +[PLBBMsgAll entryEventNoneBBMsgAll](PLBBMsgAll, "entryEventNoneBBMsgAll");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[4] = v8;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = v19;
    v11 = v18;
  }
  else if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003003) & 1) != 0
         || (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003002) & 1) != 0)
  {
    v14[0] = CFSTR("CMCallEventConnCode");
    +[PLBBEurekaEventMsg bbEuEvMsgNameCMCallEventConnV2](PLBBEurekaEventMsg, "bbEuEvMsgNameCMCallEventConnV2");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v3;
    v14[1] = CFSTR("BBEurekaEventMsgLite");
    +[PLBBEurekaEventMsg bbEuEvMsgNameBBEurekaMsgLite](PLBBEurekaEventMsg, "bbEuEvMsgNameBBEurekaMsgLite");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v4;
    v14[2] = CFSTR("EventNotProcessed");
    +[PLBBEurekaEventMsg bbEuEvMsgEventNotProcessed](PLBBEurekaEventMsg, "bbEuEvMsgEventNotProcessed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v5;
    v14[3] = CFSTR("BBMsgAll");
    +[PLBBMsgAll entryEventNoneBBMsgAll](PLBBMsgAll, "entryEventNoneBBMsgAll");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v6;
    +[PLBBAgent getNameBBReport](PLBBAgent, "getNameBBReport");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[4] = v7;
    objc_msgSend(a1, "entryEventNoneBBReport");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[4] = v8;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = v15;
    v11 = v14;
  }
  else
  {
    v16[0] = CFSTR("CMCallEventConnCode");
    +[PLBBEurekaEventMsg bbEuEvMsgNameCMCallEventConn](PLBBEurekaEventMsg, "bbEuEvMsgNameCMCallEventConn");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v3;
    v16[1] = CFSTR("BBEurekaEventMsgLite");
    +[PLBBEurekaEventMsg bbEuEvMsgNameBBEurekaMsgLite](PLBBEurekaEventMsg, "bbEuEvMsgNameBBEurekaMsgLite");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v4;
    v16[2] = CFSTR("EventNotProcessed");
    +[PLBBEurekaEventMsg bbEuEvMsgEventNotProcessed](PLBBEurekaEventMsg, "bbEuEvMsgEventNotProcessed");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v5;
    v16[3] = CFSTR("BBMsgAll");
    +[PLBBMsgAll entryEventNoneBBMsgAll](PLBBMsgAll, "entryEventNoneBBMsgAll");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v6;
    +[PLBBAgent getNameBBReport](PLBBAgent, "getNameBBReport");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[4] = v7;
    objc_msgSend(a1, "entryEventNoneBBReport");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[4] = v8;
    v9 = (void *)MEMORY[0x1E0C99D80];
    v10 = v17;
    v11 = v16;
  }
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLBBAgent)init
{
  PLBBAgent *v3;
  PLTelephonyConnection *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  PLTelephonyConnection *connection;
  NSMutableDictionary *v13;
  NSMutableDictionary *currentCallList;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  PLBBAgent *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _QWORD block[5];
  _QWORD v32[5];
  _QWORD v33[5];
  objc_super v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D80020], "hasBaseband"))
  {
LABEL_29:
    v22 = 0;
    goto LABEL_30;
  }
  v34.receiver = self;
  v34.super_class = (Class)PLBBAgent;
  v3 = -[PLAgent init](&v34, sel_init);
  self = v3;
  if (!v3)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v15 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __17__PLBBAgent_init__block_invoke_813;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v15;
      if (qword_1ED883B20 != -1)
        dispatch_once(&qword_1ED883B20, block);
      if (byte_1ED8837FD)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLBBAgent: failed to init"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent init]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 1387);

        PLLogCommon();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v16;
          _os_log_debug_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    goto LABEL_21;
  }
  v3->_agentInited = 0;
  v4 = (PLTelephonyConnection *)+[PLTelephonyConnection sharedTelephonyConnection](PLTelephonyConnection, "sharedTelephonyConnection");
  self->_connection = v4;
  if (!v4)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v5 = objc_opt_class();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __17__PLBBAgent_init__block_invoke;
      v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v33[4] = v5;
      if (qword_1ED883B10 != -1)
        dispatch_once(&qword_1ED883B10, v33);
      if (byte_1ED8837FB)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no telephony connection"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent init]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 1372);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v6;
          _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  }
  self->_lastBBProtoPower = 0.0;
  self->_lastGWPower = 0.0;
  connection = self->_connection;
  if (!connection)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v23 = objc_opt_class();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __17__PLBBAgent_init__block_invoke_808;
      v32[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v32[4] = v23;
      if (qword_1ED883B18 != -1)
        dispatch_once(&qword_1ED883B18, v32);
      if (byte_1ED8837FC)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: BBAgent no connection"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastPathComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent init]");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 1379);

        PLLogCommon();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v24;
          _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    goto LABEL_29;
  }
  -[PLTelephonyConnection setObserverAgent:](connection, "setObserverAgent:", self);
  v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  currentCallList = self->_currentCallList;
  self->_currentCallList = v13;

  self->_lteCurrentState = 0;
LABEL_21:
  self = self;
  v22 = self;
LABEL_30:

  return v22;
}

uint64_t __17__PLBBAgent_init__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837FB = result;
  return result;
}

uint64_t __17__PLBBAgent_init__block_invoke_808(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837FC = result;
  return result;
}

uint64_t __17__PLBBAgent_init__block_invoke_813(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837FD = result;
  return result;
}

- (void)setupTelephonyRegistrationChannels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PLBBAgent connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerCallback:forTelephonyNotification:", TelephonyNotificationCB, *MEMORY[0x1E0CA75C8]);

  -[PLBBAgent connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerCallback:forTelephonyNotification:", TelephonyNotificationCB, *MEMORY[0x1E0CA7780]);

  -[PLBBAgent connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerCallback:forTelephonyNotification:", TelephonyNotificationCB, *MEMORY[0x1E0CA7688]);

  -[PLBBAgent connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerCallback:forTelephonyNotification:", TelephonyNotificationCB, *MEMORY[0x1E0CA76A8]);

  -[PLBBAgent connection](self, "connection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerCallback:forTelephonyNotification:", TelephonyNotificationCB, *MEMORY[0x1E0CA7890]);

}

- (void)connectionStateChanged:(id)a3 connection:(int)a4 dataConnectionStatusInfo:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  int v10;
  int64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD block[5];
  const __CFString *v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v6 = *(_QWORD *)&a4;
  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(MEMORY[0x1E0D80020], "isBasebandDSDS");
  if (!v9 || !v10)
    goto LABEL_20;
  v11 = -[PLBBAgent getSubsIdFromCTContext:](self, "getSubsIdFromCTContext:", v8);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v12 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__PLBBAgent_connectionStateChanged_connection_dataConnectionStatusInfo___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v12;
    if (qword_1ED883B28 != -1)
      dispatch_once(&qword_1ED883B28, block);
    if (byte_1ED8837FE)
    {
      v40 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "pdp");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "interfaceName");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "apnName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v9, "wirelessTechnologyMask");
      v14 = objc_msgSend(v9, "state");
      v15 = objc_msgSend(v9, "ipFamily");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "suspended"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "publicNetAllowed"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "stringWithFormat:", CFSTR("connectionStateChanged:connection:dataConnectionStatusInfo: called with                               subsId: %d,                               CTDataConnectionType: %d                               pdp: %@                               interface name: %@                               apnName: %@                               wirelessTechnologyMask: %d                               state: %d                               ipFamily: %d                               suspended: %@                               publicNetAllowed: %@                               contextType: %d"), v11, v6, v39, v38, v13, v37, v14, v15, v16, v17, objc_msgSend(v9, "contextType"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent connectionStateChanged:connection:dataConnectionStatusInfo:]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 1435);

      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v18;
        _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (v11 == -1)
    goto LABEL_16;
  if (objc_msgSend(MEMORY[0x1E0D80078], "isFullModeDaemon"))
  {
    v24 = objc_msgSend(v9, "state");
    -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", (int)v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "dataActive");

    if (v24 != v27)
    {
      if (objc_msgSend(MEMORY[0x1E0D80078], "isFullModeDaemon"))
      {
        v29 = objc_msgSend(v9, "state");
        -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectAtIndexedSubscript:", (int)v11);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setDataActive:", v29);

      }
LABEL_16:
      v28 = 1;
      goto LABEL_17;
    }
  }
  v28 = 0;
LABEL_17:
  -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectAtIndexedSubscript:", (int)v11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "operatorName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v42 = CFSTR("dataActive");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v9, "state"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v35;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLBBAgent logDSDSEventForwardTelephonyRegistrationWithKVPairs:subsId:andOperator:](self, "logDSDSEventForwardTelephonyRegistrationWithKVPairs:subsId:andOperator:", v36, v11, v34);
  }

LABEL_20:
}

uint64_t __72__PLBBAgent_connectionStateChanged_connection_dataConnectionStatusInfo___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837FE = result;
  return result;
}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  id v6;
  id v7;
  int v8;
  int64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  BOOL v20;
  char v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  int v61;
  int64_t v62;
  id v63;
  _QWORD block[5];
  _QWORD v65[3];
  _QWORD v66[3];
  uint8_t buf[4];
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E0D80020], "isBasebandDSDS");
  if (!v7 || !v8)
    goto LABEL_26;
  v9 = -[PLBBAgent getSubsIdFromCTContext:](self, "getSubsIdFromCTContext:", v6);
  v10 = (int)v9;
  v62 = v9;
  v63 = v6;
  if (v9 != -1)
  {
    v11 = objc_msgSend(v7, "indicator");
    -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 == objc_msgSend(v13, "dataIndicator"))
    {
      v14 = objc_msgSend(v7, "dataBearerSoMask");
      -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "serviceOpt");

      if (v14 != v17)
        goto LABEL_12;
      if (!objc_msgSend(MEMORY[0x1E0D80078], "isFullModeDaemon"))
      {
LABEL_9:
        v22 = 0;
LABEL_15:
        v6 = v63;
        goto LABEL_16;
      }
      -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "dataAttached") != -1)
      {
        -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", v10);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "dataAttached") == 0;
        v21 = v20 ^ objc_msgSend(v7, "attached");

        if ((v21 & 1) != 0)
          goto LABEL_9;
LABEL_12:
        v23 = objc_msgSend(v7, "indicator");
        -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndexedSubscript:", v10);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setDataIndicator:", v23);

        v26 = objc_msgSend(v7, "dataBearerSoMask");
        -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectAtIndexedSubscript:", v10);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setServiceOpt:", v26);

        if (objc_msgSend(MEMORY[0x1E0D80078], "isFullModeDaemon"))
        {
          v29 = objc_msgSend(v7, "attached");
          -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectAtIndexedSubscript:", v10);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setDataAttached:", v29);

        }
        v22 = 1;
        goto LABEL_15;
      }
    }

    goto LABEL_12;
  }
  v22 = 1;
LABEL_16:
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v32 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__PLBBAgent_dataStatus_dataStatusInfo___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v32;
    if (qword_1ED883B30 != -1)
      dispatch_once(&qword_1ED883B30, block);
    if (byte_1ED8837FF)
    {
      v61 = v22;
      v59 = v10;
      v60 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "attached"));
      v33 = objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v7, "indicator");
      v57 = objc_msgSend(v7, "indicatorOverride");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "roamAllowed"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v7, "radioTechnology");
      v34 = objc_msgSend(v7, "dataBearerSoMask");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "dataPlanSignalingReductionOverride"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "cellularDataPossible"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "activeContexts"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "totalActiveContexts"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "inHomeCountry"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v34;
      v40 = (void *)v33;
      objc_msgSend(v60, "stringWithFormat:", CFSTR("dataStatus:dataStatusInfo: called with subsId: %d                               attached: %@                               indicator: %d                               indicatorOverride: %d                               roamAllowed: %@                               radioTechnology: %d                               dataBearerSoMask: %d                               dataPlanSignalingReductionOverride: %@                               cellularDataPossible: %@                               activeContexts: %@                               totalActiveContexts: %@                               inHomeCountry: %@"), v62, v33, v58, v57, v56, v55, v54, v35, v36, v37, v38, v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "lastPathComponent");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent dataStatus:dataStatusInfo:]");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v44, v45, 1517);

      PLLogCommon();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v41;
        _os_log_debug_impl(&dword_1CAF47000, v46, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v6 = v63;
      v22 = v61;
      v10 = v59;
    }
  }
  -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectAtIndexedSubscript:", v10);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "operatorName");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v65[0] = CFSTR("dataAttached");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "attached"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v50;
    v65[1] = CFSTR("dataInd");
    dataIndicatorToString(objc_msgSend(v7, "indicator"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v51;
    v65[2] = CFSTR("serviceOpt");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "dataBearerSoMask"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v66[2] = v52;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 3);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLBBAgent logDSDSEventForwardTelephonyRegistrationWithKVPairs:subsId:andOperator:](self, "logDSDSEventForwardTelephonyRegistrationWithKVPairs:subsId:andOperator:", v53, v62, v49);
  }

LABEL_26:
}

uint64_t __39__PLBBAgent_dataStatus_dataStatusInfo___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8837FF = result;
  return result;
}

- (void)operatorNameChanged:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  int v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t block;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E0D80020], "isBasebandDSDS");
  if (!v7 || !v8)
    goto LABEL_17;
  v9 = -[PLBBAgent getSubsIdFromCTContext:](self, "getSubsIdFromCTContext:", v6);
  if (v9 == -1)
    goto LABEL_7;
  -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", (int)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "operatorName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "isEqualToString:", v12);

  if ((v13 & 1) == 0)
  {
    -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", (int)v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setOperatorName:", v7);

LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  v14 = 1;
LABEL_8:
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v17 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __38__PLBBAgent_operatorNameChanged_name___block_invoke;
    v27 = &__block_descriptor_40_e5_v8__0lu32l8;
    v28 = v17;
    if (qword_1ED883B38 != -1)
      dispatch_once(&qword_1ED883B38, &block);
    if (byte_1ED883800)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("operatorNameChanged:name: called with subsId: %d"), v9, block, v25, v26, v27, v28);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent operatorNameChanged:name:]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 1547);

      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v18;
        _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if ((v14 & 1) == 0)
    -[PLBBAgent logDSDSEventForwardTelephonyRegistrationWithKVPairs:subsId:andOperator:](self, "logDSDSEventForwardTelephonyRegistrationWithKVPairs:subsId:andOperator:", 0, v9, v7);
LABEL_17:

}

uint64_t __38__PLBBAgent_operatorNameChanged_name___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883800 = result;
  return result;
}

- (void)displayStatusChanged:(id)a3 status:(id)a4
{
  id v6;
  id v7;
  int v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  int64_t v50;
  _QWORD block[5];
  _QWORD v52[2];
  _QWORD v53[2];
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E0D80020], "isBasebandDSDS");
  if (!v7 || !v8)
    goto LABEL_25;
  v9 = -[PLBBAgent getSubsIdFromCTContext:](self, "getSubsIdFromCTContext:", v6);
  objc_msgSend(v7, "registrationDisplayStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  removeCTPrefixFromString(CFSTR("kCTRegistrationStatus"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = v9;
  if (v9 == -1)
  {
    v25 = 1;
    v13 = -1;
    goto LABEL_15;
  }
  -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (int)v9;
  objc_msgSend(v12, "objectAtIndexedSubscript:", (int)v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "status");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v11;
  v17 = objc_msgSend(v11, "isEqualToString:", v15);

  v18 = 0x1E0D80000uLL;
  if (!v17)
    goto LABEL_12;
  v19 = v16;
  if (!objc_msgSend(MEMORY[0x1E0D80078], "isFullModeDaemon"))
  {
    v25 = 0;
    v11 = v16;
    goto LABEL_15;
  }
  -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isHome") == -1)
  {

    goto LABEL_12;
  }
  -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isHome") == 0;
  v48 = v24 ^ objc_msgSend(v7, "isInHomeCountry");

  v18 = 0x1E0D80000;
  v16 = v19;
  if ((v48 & 1) == 0)
  {
LABEL_12:
    -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", v13);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setStatus:", v16);

    v11 = v16;
    if (objc_msgSend(*(id *)(v18 + 120), "isFullModeDaemon"))
    {
      v28 = objc_msgSend(v7, "isInHomeCountry");
      -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectAtIndexedSubscript:", v13);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setIsHome:", v28);

    }
    v25 = 1;
    goto LABEL_15;
  }
  v25 = 0;
  v11 = v19;
LABEL_15:
  -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectAtIndexedSubscript:", v13);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "operatorName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v34 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__PLBBAgent_displayStatusChanged_status___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v34;
    if (qword_1ED883B40 != -1)
      dispatch_once(&qword_1ED883B40, block);
    if (byte_1ED883801)
    {
      v49 = v11;
      v35 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v7, "registrationDisplayStatus");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isInHomeCountry"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "changedDueToSimRemoval"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isRegistrationForcedHome"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR("displayStatusChanged:status: called with subsId: %d                               registrationDisplayStatus: %@                               isInHomeCountry: %@                               changedDueToSimRemoval: %@                               isRegistrationForcedHome: %@"), v50, v36, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v41 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "lastPathComponent");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent displayStatusChanged:status:]");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "logMessage:fromFile:fromFunction:fromLineNumber:", v40, v43, v44, 1597);

      PLLogCommon();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v40;
        _os_log_debug_impl(&dword_1CAF47000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v11 = v49;
    }
  }
  if (v25)
  {
    v52[0] = CFSTR("home");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "isInHomeCountry"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = CFSTR("status");
    v53[0] = v46;
    v53[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLBBAgent logDSDSEventForwardTelephonyRegistrationWithKVPairs:subsId:andOperator:](self, "logDSDSEventForwardTelephonyRegistrationWithKVPairs:subsId:andOperator:", v47, v50, v33);
  }

LABEL_25:
}

uint64_t __41__PLBBAgent_displayStatusChanged_status___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883801 = result;
  return result;
}

- (void)signalStrengthChanged:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  int v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD block[5];
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E0D80020], "isBasebandDSDS");
  if (!v7 || !v8)
    goto LABEL_19;
  v9 = -[PLBBAgent getSubsIdFromCTContext:](self, "getSubsIdFromCTContext:", v6);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == -1)
    goto LABEL_8;
  -[PLBBAgent dsdsActivityMsgs](self, "dsdsActivityMsgs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", (int)v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "signalStrengthLogTimestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v13);
  v15 = v14;

  if (v15 >= 60.0 || v15 <= 0.0)
  {
    -[PLBBAgent dsdsActivityMsgs](self, "dsdsActivityMsgs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", (int)v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSignalStrengthLogTimestamp:", v10);

    objc_msgSend(v7, "bars");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBAgent dsdsActivityMsgs](self, "dsdsActivityMsgs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", (int)v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSignalBars:", v19);

LABEL_8:
    v16 = 1;
    goto LABEL_9;
  }
  v16 = 0;
LABEL_9:
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v22 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__PLBBAgent_signalStrengthChanged_info___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v22;
    if (qword_1ED883B48 != -1)
      dispatch_once(&qword_1ED883B48, block);
    if (byte_1ED883802)
    {
      v30 = v10;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("signalStrengthChanged:info: called with subsId: %d"), v9);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent signalStrengthChanged:info:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 1628);

      PLLogCommon();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v23;
        _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v10 = v30;
    }
  }
  if (v16)
  {
    objc_msgSend(v7, "bars");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBAgent logDSDSEventPointTelephonyActivityWithSubsId:context:callStatus:simStatus:signalInfo:RATselection:andCurrCampedRAT:](self, "logDSDSEventPointTelephonyActivityWithSubsId:context:callStatus:simStatus:signalInfo:RATselection:andCurrCampedRAT:", v9, 0, 0, 0, v29, 0, 0);

  }
LABEL_19:

}

uint64_t __40__PLBBAgent_signalStrengthChanged_info___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883802 = result;
  return result;
}

uint64_t __30__PLBBAgent_cellChanged_cell___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883803 = result;
  return result;
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD block[5];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandDSDS"))
  {
    if (v7)
    {
      v8 = -[PLBBAgent getSubsIdFromCTContext:](self, "getSubsIdFromCTContext:", v6);
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v9 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __39__PLBBAgent_simStatusDidChange_status___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v9;
        if (qword_1ED883B58 != -1)
          dispatch_once(&qword_1ED883B58, block);
        if (byte_1ED883804)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("simStatusDidChange:status: called with subsId: %d, status: %@"), v8, v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "lastPathComponent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent simStatusDidChange:status:]");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 1689);

          PLLogCommon();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v10;
            _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      removeCTPrefixFromString(CFSTR("kCTSIMSupportSIMStatus"), v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8 != -1)
      {
        -[PLBBAgent dsdsActivityMsgs](self, "dsdsActivityMsgs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", (int)v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setSimStatus:", v16);

      }
      -[PLBBAgent logDSDSEventPointTelephonyActivityWithSubsId:context:callStatus:simStatus:signalInfo:RATselection:andCurrCampedRAT:](self, "logDSDSEventPointTelephonyActivityWithSubsId:context:callStatus:simStatus:signalInfo:RATselection:andCurrCampedRAT:", v8, v6, 0, v16, 0, 0, 0);
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    v16 = v7;
  }

}

uint64_t __39__PLBBAgent_simStatusDidChange_status___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883804 = result;
  return result;
}

- (void)ratSelectionChanged:(id)a3 selection:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PLBBAgent *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  char v37;
  PLBBAgent *v38;
  PLBBAgent *v39;
  id v40;
  int64_t v41;
  void *v42;
  _QWORD block[5];
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E0D80020], "isBasebandDSDS");
  if (!v7 || !v8)
    goto LABEL_26;
  objc_msgSend(MEMORY[0x1E0CA6E28], "contextWithServiceDescriptor:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLBBAgent getSubsIdFromCTContext:](self, "getSubsIdFromCTContext:", v9);
  objc_msgSend(v7, "selection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  removeCTPrefixFromString(CFSTR("kCTRegistrationRATSelection"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("NRStandAlone")) & 1) != 0)
  {
    v13 = CFSTR("NR_SA");
  }
  else
  {
    if (!objc_msgSend(v12, "isEqualToString:", CFSTR("NRNonStandAlone")))
      goto LABEL_8;
    v13 = CFSTR("NR_NSA");
  }

  v12 = (void *)v13;
LABEL_8:
  v41 = v10;
  v42 = v9;
  if (v10 != -1)
  {
    v40 = v6;
    -[PLBBAgent dsdsActivityMsgs](self, "dsdsActivityMsgs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (int)v10;
    objc_msgSend(v14, "objectAtIndexedSubscript:", (int)v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentRAT");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", v17) & 1) != 0)
    {
      objc_msgSend(v7, "preferred");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBAgent dsdsActivityMsgs](self, "dsdsActivityMsgs");
      v38 = self;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "preferredRAT");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v18, "isEqualToString:", v21);

      self = v38;
      if ((v37 & 1) != 0)
      {
        v22 = 1;
LABEL_15:
        v6 = v40;
        v10 = v41;
        v9 = v42;
        goto LABEL_16;
      }
    }
    else
    {

    }
    -[PLBBAgent dsdsActivityMsgs](self, "dsdsActivityMsgs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCurrentRAT:", v12);

    objc_msgSend(v7, "preferred");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    removeCTPrefixFromString(CFSTR("kCTRegistrationRATSelection"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBAgent dsdsActivityMsgs](self, "dsdsActivityMsgs");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", v15);
    v28 = self;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setPreferredRAT:", v26);

    self = v28;
    v22 = 0;
    goto LABEL_15;
  }
  v22 = 0;
LABEL_16:
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v30 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PLBBAgent_ratSelectionChanged_selection___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v30;
    if (qword_1ED883B60 != -1)
      dispatch_once(&qword_1ED883B60, block);
    if (byte_1ED883805)
    {
      v39 = self;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ratSelectionChanged:selection: called with subsId: %d, selection: %@"), v10, v7);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "lastPathComponent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent ratSelectionChanged:selection:]");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v34, v35, 1729);

      PLLogCommon();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v31;
        _os_log_debug_impl(&dword_1CAF47000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      self = v39;
      v10 = v41;
      v9 = v42;
    }
  }
  if ((v22 & 1) == 0)
    -[PLBBAgent logDSDSEventPointTelephonyActivityWithSubsId:context:callStatus:simStatus:signalInfo:RATselection:andCurrCampedRAT:](self, "logDSDSEventPointTelephonyActivityWithSubsId:context:callStatus:simStatus:signalInfo:RATselection:andCurrCampedRAT:", v10, v9, 0, 0, 0, v7, 0);

LABEL_26:
}

uint64_t __43__PLBBAgent_ratSelectionChanged_selection___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883805 = result;
  return result;
}

- (void)callStatusChanged:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PLBBAgent *v10;

  if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandDSDS", a3))
  {
    -[PLBBAgent callCenter](self, "callCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentCalls");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLBBAgent telephonyClientQueue](self, "telephonyClientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __31__PLBBAgent_callStatusChanged___block_invoke;
    v8[3] = &unk_1E85791E0;
    v9 = v5;
    v10 = self;
    v7 = v5;
    dispatch_async(v6, v8);

  }
}

void __31__PLBBAgent_callStatusChanged___block_invoke(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _QWORD block[5];
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  __CFString *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = -1;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__10;
  v43 = __Block_byref_object_dispose__10;
  v44 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") <= 1)
    {
      objc_msgSend(*(id *)(a1 + 40), "translateCallStatus:", objc_msgSend(v2, "status"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = CFSTR("Multiple");
    }
    objc_msgSend(*(id *)(a1 + 40), "telephonyClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(v9, "getSubscriptionInfoWithError:", &v38);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v38;

    if (v10)
    {
      objc_msgSend(v10, "subscriptionsInUse");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __31__PLBBAgent_callStatusChanged___block_invoke_2;
      v31[3] = &unk_1E857DC88;
      v13 = v2;
      v14 = *(_QWORD *)(a1 + 40);
      v32 = v13;
      v33 = v14;
      v35 = &v49;
      v36 = &v39;
      v34 = v3;
      v37 = &v45;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v31);

      v15 = v32;
    }
    else
    {
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_19;
      v16 = objc_opt_class();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __31__PLBBAgent_callStatusChanged___block_invoke_3;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v16;
      if (qword_1ED883B68 != -1)
        dispatch_once(&qword_1ED883B68, v30);
      if (!byte_1ED883806)
        goto LABEL_19;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not determine CoreTelephony Subscription Info. Error: %@"), v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent callStatusChanged:]_block_invoke");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v19, v20, 1788);

      PLLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v15;
        _os_log_debug_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
LABEL_19:

    goto LABEL_21;
  }
  v4 = 0;
  *((_BYTE *)v46 + 24) = 1;
  v3 = CFSTR("Inactive");
  while (1)
  {
    objc_msgSend(*(id *)(a1 + 40), "dsdsActivityMsgs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "callStatus");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == CFSTR("Inactive");

    if (!v8)
      break;
    if (++v4 == 4)
      goto LABEL_22;
  }
  v50[3] = v4;
  objc_msgSend(*(id *)(a1 + 40), "dsdsActivityMsgs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", v4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = CFSTR("Inactive");
  objc_msgSend(v11, "setCallStatus:", CFSTR("Inactive"));
LABEL_21:

LABEL_22:
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v22 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__PLBBAgent_callStatusChanged___block_invoke_876;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v22;
    if (qword_1ED883B70 != -1)
      dispatch_once(&qword_1ED883B70, block);
    if (byte_1ED883807)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("callStatusChanged:status: called with subsId: %d callStatus: %@"), v50[3], v3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent callStatusChanged:]_block_invoke_2");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 1793);

      PLLogCommon();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v23;
        _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (*((_BYTE *)v46 + 24))
    objc_msgSend(*(id *)(a1 + 40), "logDSDSEventPointTelephonyActivityWithSubsId:context:callStatus:simStatus:signalInfo:RATselection:andCurrCampedRAT:", v50[3], v40[5], v3, 0, 0, 0, 0);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
}

void __31__PLBBAgent_callStatusChanged___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "localSenderIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "getSubsIdFromCTContext:", v15);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if (v11 != -1)
    {
      v12 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "dsdsActivityMsgs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", (int)v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCallStatus:", v12);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    *a4 = 1;
  }

}

uint64_t __31__PLBBAgent_callStatusChanged___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883806 = result;
  return result;
}

uint64_t __31__PLBBAgent_callStatusChanged___block_invoke_876(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883807 = result;
  return result;
}

- (void)smartDataModeChanged:(id)a3 userEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandProto"))
  {
    v7 = -[PLBBAgent getSubsIdFromCTContext:](self, "getSubsIdFromCTContext:", v6);
    if (v7 != -1)
    {
      v8 = v7;
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v9 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __46__PLBBAgent_smartDataModeChanged_userEnabled___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v9;
        if (qword_1ED883B78 != -1)
          dispatch_once(&qword_1ED883B78, block);
        if (byte_1ED883808)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("smartDataModeChanged:userEnabled: called with subsId: %d SDMEnable: %d"), v8, v4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "lastPathComponent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent smartDataModeChanged:userEnabled:]");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 1809);

          PLLogCommon();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v10;
            _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      -[PLBBAgent logDSDSEventForwardSDMwithSubsId:SDMEnable:](self, "logDSDSEventForwardSDMwithSubsId:SDMEnable:", v8, v4);
    }
  }

}

uint64_t __46__PLBBAgent_smartDataModeChanged_userEnabled___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883808 = result;
  return result;
}

- (id)translateCallStatus:(int)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3 < 7)
    return off_1E857DE48[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown call status: %d"), *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent translateCallStatus:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 1824);

  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  return CFSTR("Unknown");
}

- (void)logTelephonyRegistrationDSDSAtInit
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  _QWORD block[5];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLBBAgent_logTelephonyRegistrationDSDSAtInit__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED883B80 != -1)
      dispatch_once(&qword_1ED883B80, block);
    if (byte_1ED883809)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent logTelephonyRegistrationDSDSAtInit]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logTelephonyRegistrationDSDSAtInit]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1831);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBAgent telephonyClient](self, "telephonyClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v11, "getSubscriptionInfoWithError:", &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v23;

  if (v12)
  {
    objc_msgSend(v12, "subscriptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v4;
    v22[1] = 3221225472;
    v22[2] = __47__PLBBAgent_logTelephonyRegistrationDSDSAtInit__block_invoke_898;
    v22[3] = &unk_1E857DCB0;
    v22[4] = self;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v22);

  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v21[0] = v4;
    v21[1] = 3221225472;
    v21[2] = __47__PLBBAgent_logTelephonyRegistrationDSDSAtInit__block_invoke_903;
    v21[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v21[4] = objc_opt_class();
    if (qword_1ED883B90 != -1)
      dispatch_once(&qword_1ED883B90, v21);
    if (byte_1ED88380B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not determine CoreTelephony Subscription Info. Error: %@"), v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logTelephonyRegistrationDSDSAtInit]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 1854);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v15;
        _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __47__PLBBAgent_logTelephonyRegistrationDSDSAtInit__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883809 = result;
  return result;
}

void __47__PLBBAgent_logTelephonyRegistrationDSDSAtInit__block_invoke_898(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  _QWORD v29[3];
  _QWORD v30[3];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "getSubsIdFromCTContext:", v4);
  objc_msgSend(*(id *)(a1 + 32), "telephonyClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v6, "getDataStatus:error:", v4, &v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v28;

  dataIndicatorToString(objc_msgSend(v7, "indicator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "dataBearerSoMask"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "telephonyClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v8;
  objc_msgSend(v11, "getLocalizedOperatorName:error:", v4, &v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v27;

  objc_msgSend(*(id *)(a1 + 32), "telephonyClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v13;
  v15 = (void *)objc_msgSend(v14, "copyRegistrationStatus:error:", v4, &v26);

  v16 = v26;
  if (!v16 && v5 != -1)
  {
    v29[0] = CFSTR("dataInd");
    v29[1] = CFSTR("serviceOpt");
    v30[0] = v9;
    v30[1] = v10;
    v29[2] = CFSTR("status");
    removeCTPrefixFromString(CFSTR("kCTRegistrationStatus"), v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "logDSDSEventForwardTelephonyRegistrationWithKVPairs:subsId:andOperator:", v18, v5, v12);
LABEL_11:

    goto LABEL_12;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v19 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLBBAgent_logTelephonyRegistrationDSDSAtInit__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v19;
    if (qword_1ED883B88 != -1)
      dispatch_once(&qword_1ED883B88, block);
    if (byte_1ED88380A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to query TelephonyRegistration Messages At Init. Error: %@ SubsId: %d"), v16, v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logTelephonyRegistrationDSDSAtInit]_block_invoke");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 1847);

      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v18;
        _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_11;
    }
  }
LABEL_12:

}

uint64_t __47__PLBBAgent_logTelephonyRegistrationDSDSAtInit__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88380A = result;
  return result;
}

uint64_t __47__PLBBAgent_logTelephonyRegistrationDSDSAtInit__block_invoke_903(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88380B = result;
  return result;
}

- (void)logTelephonyActivityDSDSAtInit
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  _QWORD v22[5];
  id v23;
  _QWORD block[5];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PLBBAgent_logTelephonyActivityDSDSAtInit__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED883B98 != -1)
      dispatch_once(&qword_1ED883B98, block);
    if (byte_1ED88380C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent logTelephonyActivityDSDSAtInit]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logTelephonyActivityDSDSAtInit]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1859);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBAgent telephonyClient](self, "telephonyClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v11, "getSubscriptionInfoWithError:", &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v23;

  if (v12)
  {
    objc_msgSend(v12, "subscriptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v4;
    v22[1] = 3221225472;
    v22[2] = __43__PLBBAgent_logTelephonyActivityDSDSAtInit__block_invoke_904;
    v22[3] = &unk_1E857DCB0;
    v22[4] = self;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v22);

  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v21[0] = v4;
    v21[1] = 3221225472;
    v21[2] = __43__PLBBAgent_logTelephonyActivityDSDSAtInit__block_invoke_910;
    v21[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v21[4] = objc_opt_class();
    if (qword_1ED883BA8 != -1)
      dispatch_once(&qword_1ED883BA8, v21);
    if (byte_1ED88380E)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not determine CoreTelephony Subscription Info. Error: %@"), v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logTelephonyActivityDSDSAtInit]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 1904);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v15;
        _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __43__PLBBAgent_logTelephonyActivityDSDSAtInit__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88380C = result;
  return result;
}

void __43__PLBBAgent_logTelephonyActivityDSDSAtInit__block_invoke_904(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
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
  const __CFString *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  _QWORD block[5];
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  uint8_t buf[4];
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "getSubsIdFromCTContext:", v3);
  objc_msgSend(MEMORY[0x1E0CA6DE0], "descriptorWithSubscriptionContext:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "telephonyClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  v7 = (void *)objc_msgSend(v6, "copyRadioAccessTechnology:error:", v3, &v65);
  v8 = v65;

  objc_msgSend(*(id *)(a1 + 32), "dsdsActivityMsgs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v4;
  objc_msgSend(v9, "objectAtIndexedSubscript:", (int)v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "callStatus");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "telephonyClient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v8;
  objc_msgSend(v11, "getSIMStatus:error:", v3, &v64);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v64;

  objc_msgSend(*(id *)(a1 + 32), "telephonyClient");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v13;
  v54 = v3;
  objc_msgSend(v14, "getSignalStrengthInfo:error:", v3, &v63);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v63;

  objc_msgSend(*(id *)(a1 + 32), "telephonyClient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v16;
  v59 = (void *)v5;
  objc_msgSend(v17, "getRatSelectionMask:error:", v5, &v62);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v62;

  v20 = v15;
  objc_msgSend(v15, "bars");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dsdsActivityMsgs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", (int)v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setSignalBars:", v21);

  v57 = v7;
  removeCTPrefixFromString(CFSTR("kCTRegistrationRadioAccessTechnology"), v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dsdsActivityMsgs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", (int)v4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCampedRAT:", v24);

  v55 = v12;
  removeCTPrefixFromString(CFSTR("kCTSIMSupportSIMStatus"), v12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dsdsActivityMsgs");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndexedSubscript:", (int)v4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSimStatus:", v27);

  objc_msgSend(v18, "selection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  removeCTPrefixFromString(CFSTR("kCTRegistrationRATSelection"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v31, "isEqualToString:", CFSTR("NRStandAlone")) & 1) != 0)
  {
    v32 = CFSTR("NR_SA");
LABEL_5:

    v31 = (void *)v32;
    goto LABEL_6;
  }
  if (objc_msgSend(v31, "isEqualToString:", CFSTR("NRNonStandAlone")))
  {
    v32 = CFSTR("NR_NSA");
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(*(id *)(a1 + 32), "telephonyClient");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v19;
  v34 = objc_msgSend(v33, "smartDataMode:error:", v59, &v61);
  v35 = v61;

  objc_msgSend(*(id *)(a1 + 32), "dsdsActivityMsgs");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectAtIndexedSubscript:", (int)v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setCurrentRAT:", v31);

  objc_msgSend(v18, "preferred");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  removeCTPrefixFromString(CFSTR("kCTRegistrationRATSelection"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dsdsActivityMsgs");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectAtIndexedSubscript:", (int)v4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setPreferredRAT:", v39);

  if (v35 || v58 == -1)
  {
    v46 = v59;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v47 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __43__PLBBAgent_logTelephonyActivityDSDSAtInit__block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v47;
      if (qword_1ED883BA0 != -1)
        dispatch_once(&qword_1ED883BA0, block);
      if (byte_1ED88380D)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to query TelephonyActivity Messages At Init. Error: %@ SubsId: %d"), v35, v58);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "lastPathComponent");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logTelephonyActivityDSDSAtInit]_block_invoke");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "logMessage:fromFile:fromFunction:fromLineNumber:", v48, v51, v52, 1895);

        PLLogCommon();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v67 = v48;
          _os_log_debug_impl(&dword_1CAF47000, v53, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v46 = v59;
      }
    }
  }
  else
  {
    v42 = *(void **)(a1 + 32);
    removeCTPrefixFromString(CFSTR("kCTSIMSupportSIMStatus"), v55);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bars");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    removeCTPrefixFromString(CFSTR("kCTRegistrationRadioAccessTechnology"), v57);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "logDSDSEventPointTelephonyActivityWithSubsId:context:callStatus:simStatus:signalInfo:RATselection:andCurrCampedRAT:", v58, v54, v56, v43, v44, v18, v45);

    v46 = v59;
    if ((int)objc_msgSend(MEMORY[0x1E0D80020], "kPLBasebandClassOfDevice") >= 1003012)
      objc_msgSend(*(id *)(a1 + 32), "logDSDSEventForwardSDMwithSubsId:SDMEnable:", v58, v34);
  }

}

uint64_t __43__PLBBAgent_logTelephonyActivityDSDSAtInit__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88380D = result;
  return result;
}

uint64_t __43__PLBBAgent_logTelephonyActivityDSDSAtInit__block_invoke_910(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88380E = result;
  return result;
}

uint64_t __36__PLBBAgent_getSubsIdFromCTContext___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88380F = result;
  return result;
}

- (void)logDSDSEventForwardTelephonyRegistrationWithKVPairs:(id)a3 subsId:(int64_t)a4 andOperator:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v8 = *MEMORY[0x1E0D80378];
  v9 = a5;
  v10 = a3;
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", v8, CFSTR("TelephonyRegistration"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v14);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("subsId"));

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, CFSTR("operator"));
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__PLBBAgent_logDSDSEventForwardTelephonyRegistrationWithKVPairs_subsId_andOperator___block_invoke;
  v15[3] = &unk_1E857DCD8;
  v16 = v11;
  v13 = v11;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);

  -[PLBBAgent logEntry:](self, "logEntry:", v13);
}

uint64_t __84__PLBBAgent_logDSDSEventForwardTelephonyRegistrationWithKVPairs_subsId_andOperator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

- (void)logDSDSEventPointTelephonyActivityWithSubsId:(int64_t)a3 context:(id)a4 callStatus:(id)a5 simStatus:(id)a6 signalInfo:(id)a7 RATselection:(id)a8 andCurrCampedRAT:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  PLBBAgent *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  int64_t v35;

  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator workQueue](self, "workQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __128__PLBBAgent_logDSDSEventPointTelephonyActivityWithSubsId_context_callStatus_simStatus_signalInfo_RATselection_andCurrCampedRAT___block_invoke;
  v27[3] = &unk_1E857DD00;
  v28 = v19;
  v29 = v14;
  v30 = self;
  v31 = v15;
  v32 = v16;
  v33 = v17;
  v34 = v18;
  v35 = a3;
  v21 = v18;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  v25 = v14;
  v26 = v19;
  dispatch_async(v20, v27);

}

void __128__PLBBAgent_logDSDSEventPointTelephonyActivityWithSubsId_context_callStatus_simStatus_signalInfo_RATselection_andCurrCampedRAT___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("TelephonyActivity"));
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v31);
  v3 = *(_QWORD *)(a1 + 88);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("subsId"));

  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("timestamp"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", airplaneModeCurrent, CFSTR("airplaneMode"));
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("callStatus"));
  }
  else if (*(_QWORD *)(a1 + 88) != -1)
  {
    objc_msgSend(*(id *)(a1 + 48), "dsdsActivityMsgs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", (int)v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "callStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("callStatus"));

  }
  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("simStatus"));
  }
  else if (*(_QWORD *)(a1 + 88) != -1)
  {
    objc_msgSend(*(id *)(a1 + 48), "dsdsActivityMsgs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", (int)v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "simStatus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("simStatus"));

  }
  v13 = *(_QWORD *)(a1 + 64);
  if (v13)
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("signalBars"));
  }
  else if (*(_QWORD *)(a1 + 88) != -1)
  {
    objc_msgSend(*(id *)(a1 + 48), "dsdsActivityMsgs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", (int)v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "signalBars");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, CFSTR("signalBars"));

  }
  v17 = *(void **)(a1 + 72);
  if (v17)
  {
    objc_msgSend(v17, "selection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    removeCTPrefixFromString(CFSTR("kCTRegistrationRATSelection"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("NRStandAlone")) & 1) != 0)
    {
      v20 = CFSTR("NR_SA");
    }
    else
    {
      if (!objc_msgSend(v19, "isEqualToString:", CFSTR("NRNonStandAlone")))
      {
LABEL_21:
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, CFSTR("currentRat"));
        objc_msgSend(*(id *)(a1 + 72), "preferred");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        removeCTPrefixFromString(CFSTR("kCTRegistrationRATSelection"), v24);
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      v20 = CFSTR("NR_NSA");
    }

    v19 = (void *)v20;
    goto LABEL_21;
  }
  if (*(_QWORD *)(a1 + 88) == -1)
    goto LABEL_23;
  objc_msgSend(*(id *)(a1 + 48), "dsdsActivityMsgs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectAtIndexedSubscript:", (int)v3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "currentRAT");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v23, CFSTR("currentRat"));

  objc_msgSend(*(id *)(a1 + 48), "dsdsActivityMsgs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", (int)v3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "preferredRAT");
  v25 = objc_claimAutoreleasedReturnValue();
LABEL_22:
  v26 = (void *)v25;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v25, CFSTR("preferredRat"));

LABEL_23:
  v27 = *(_QWORD *)(a1 + 80);
  if (v27)
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v27, CFSTR("campedRat"));
  }
  else if (*(_QWORD *)(a1 + 88) != -1)
  {
    objc_msgSend(*(id *)(a1 + 48), "dsdsActivityMsgs");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", (int)v3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "campedRAT");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v30, CFSTR("campedRat"));

  }
  objc_msgSend(*(id *)(a1 + 48), "logEntry:", v2);

}

- (void)logDSDSEventForwardSDMwithSubsId:(int64_t)a3 SDMEnable:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD block[5];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("SDM"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("subsId"));

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("timestamp"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("SDMState"));

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v12 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__PLBBAgent_logDSDSEventForwardSDMwithSubsId_SDMEnable___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v12;
    if (qword_1ED883BB8 != -1)
      dispatch_once(&qword_1ED883BB8, block);
    if (byte_1ED883810)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("logDSDSEventForwardSDMwithSubsId: %d SDMEnable: %@"), a3, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logDSDSEventForwardSDMwithSubsId:SDMEnable:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 2031);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v15;
        _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBAgent logEntry:](self, "logEntry:", v9);

}

uint64_t __56__PLBBAgent_logDSDSEventForwardSDMwithSubsId_SDMEnable___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883810 = result;
  return result;
}

- (void)setupKICEChannels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  void *v43;
  uint64_t v44;
  _QWORD block[5];
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D7FF40], "sharedABMClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBAgent setAbmClient:](self, "setAbmClient:", v3);

  -[PLBBAgent abmClient](self, "abmClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLBBAgent abmClient](self, "abmClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

    -[PLBBAgent abmClient](self, "abmClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeDeviceConfig");

    v7 = objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav");
    PLLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "Add MAV DeviceConfig for ABM", buf, 2u);
      }

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v10 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __30__PLBBAgent_setupKICEChannels__block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v10;
        if (qword_1ED883BC0 != -1)
          dispatch_once(&qword_1ED883BC0, block);
        if (byte_1ED883811)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Add MAV DeviceConfig for ABM"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "lastPathComponent");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent setupKICEChannels]");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 2105);

          PLLogCommon();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v47 = v11;
            _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      -[PLBBAgent abmClient](self, "abmClient");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addMavDeviceConfig");
    }
    else
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "Add ICE DeviceConfig for ABM", buf, 2u);
      }

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v24 = objc_opt_class();
        v40 = MEMORY[0x1E0C809B0];
        v41 = 3221225472;
        v42 = __30__PLBBAgent_setupKICEChannels__block_invoke_945;
        v43 = &__block_descriptor_40_e5_v8__0lu32l8;
        v44 = v24;
        if (qword_1ED883BC8 != -1)
          dispatch_once(&qword_1ED883BC8, &v40);
        if (byte_1ED883812)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Add ICE DeviceConfig for ABM"), v40, v41, v42, v43, v44);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "lastPathComponent");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent setupKICEChannels]");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 2117);

          PLLogCommon();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v47 = v25;
            _os_log_debug_impl(&dword_1CAF47000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      -[PLBBAgent abmClient](self, "abmClient", v40, v41, v42, v43, v44);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addICEDeviceConfig");
    }

    -[PLBBAgent abmClient](self, "abmClient");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "regMetricListener");

    -[PLBBAgent abmClient](self, "abmClient");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "regBBWakeListener");

    -[PLBBAgent abmClient](self, "abmClient");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "regBootStateListener");

    -[PLBBAgent abmClient](self, "abmClient");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "startListening");

    if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav"))
    {
      +[PLMAVBBMetric sharedInstance](PLMAVBBMetric, "sharedInstance");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v35)
      {
        objc_msgSend(v35, "setLogAgent:", self);
        -[PLBBAgent registerForMAVModelMetricsNotifications:](self, "registerForMAVModelMetricsNotifications:", CFSTR("MAV_METRIC_PROD"));
        v37 = CFSTR("PLBBAgentMAVModel");
        v38 = &unk_1E8633948;
LABEL_31:
        objc_msgSend(v36, "registerForNotifClient:andProfile:", v37, v38);
      }
    }
    else
    {
      +[PLICEBBMetric sharedInstance](PLICEBBMetric, "sharedInstance");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v39;
      if (v39)
      {
        objc_msgSend(v39, "setLogAgent:", self);
        -[PLBBAgent registerForICEModelMetricsNotifications:](self, "registerForICEModelMetricsNotifications:", CFSTR("METRIC_PROD"));
        v37 = CFSTR("PLBBAgentICEModel");
        v38 = &unk_1E8633960;
        goto LABEL_31;
      }
    }

    return;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to init PLABMClient"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lastPathComponent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent setupKICEChannels]");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 2095);

  PLLogCommon();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v18;
    _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
}

uint64_t __30__PLBBAgent_setupKICEChannels__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883811 = result;
  return result;
}

uint64_t __30__PLBBAgent_setupKICEChannels__block_invoke_945(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883812 = result;
  return result;
}

- (void)setupKICEChannelsForDebug
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  void *v37;
  uint64_t v38;
  _QWORD block[5];
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D7FF40], "sharedABMClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setDelegate:", self);
    objc_msgSend(v4, "removeDeviceConfig");
    v5 = objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav");
    PLLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "Add MAV DeviceConfig for ABM", buf, 2u);
      }

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v8 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __38__PLBBAgent_setupKICEChannelsForDebug__block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v8;
        if (qword_1ED883BD0 != -1)
          dispatch_once(&qword_1ED883BD0, block);
        if (byte_1ED883813)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Add MAV DeviceConfigDebug for ABM"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "lastPathComponent");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent setupKICEChannelsForDebug]");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 2168);

          PLLogCommon();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v9;
            _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      -[PLBBAgent abmClient](self, "abmClient");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addMavDeviceConfigDebug");
    }
    else
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "Add ICE DeviceConfig for ABM", buf, 2u);
      }

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v22 = objc_opt_class();
        v34 = MEMORY[0x1E0C809B0];
        v35 = 3221225472;
        v36 = __38__PLBBAgent_setupKICEChannelsForDebug__block_invoke_962;
        v37 = &__block_descriptor_40_e5_v8__0lu32l8;
        v38 = v22;
        if (qword_1ED883BD8 != -1)
          dispatch_once(&qword_1ED883BD8, &v34);
        if (byte_1ED883814)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Add ICE DeviceConfigDebug for ABM"), v34, v35, v36, v37, v38);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "lastPathComponent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent setupKICEChannelsForDebug]");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 2180);

          PLLogCommon();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v23;
            _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      -[PLBBAgent abmClient](self, "abmClient", v34, v35, v36, v37, v38);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addICEDeviceConfigDebug");
    }

    objc_msgSend(v4, "regMetricListener");
    objc_msgSend(v4, "regBBWakeListener");
    objc_msgSend(v4, "regBootStateListener");
    objc_msgSend(v4, "startListening");
    if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav"))
    {
      +[PLMAVBBMetric sharedInstance](PLMAVBBMetric, "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        objc_msgSend(v29, "setLogAgent:", self);
        -[PLBBAgent registerForMAVModelMetricsNotifications:](self, "registerForMAVModelMetricsNotifications:", CFSTR("MAV_METRIC_PROD"));
        v31 = CFSTR("PLBBAgentMAVModel");
        v32 = &unk_1E8633948;
LABEL_31:
        objc_msgSend(v30, "registerForNotifClient:andProfile:", v31, v32);
      }
    }
    else
    {
      +[PLICEBBMetric sharedInstance](PLICEBBMetric, "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v33;
      if (v33)
      {
        objc_msgSend(v33, "setLogAgent:", self);
        -[PLBBAgent registerForICEModelMetricsNotifications:](self, "registerForICEModelMetricsNotifications:", CFSTR("METRIC_PROD"));
        v31 = CFSTR("PLBBAgentICEModel");
        v32 = &unk_1E8633960;
        goto LABEL_31;
      }
    }

    goto LABEL_33;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to init PLABMClient"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lastPathComponent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent setupKICEChannelsForDebug]");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 2158);

  PLLogCommon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v16;
    _os_log_debug_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
LABEL_33:

}

uint64_t __38__PLBBAgent_setupKICEChannelsForDebug__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883813 = result;
  return result;
}

uint64_t __38__PLBBAgent_setupKICEChannelsForDebug__block_invoke_962(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883814 = result;
  return result;
}

- (void)setupMavABMChannel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D7FF40], "sharedABMClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBAgent setAbmClient:](self, "setAbmClient:", v3);

  -[PLBBAgent abmClient](self, "abmClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLBBAgent abmClient](self, "abmClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

    -[PLBBAgent abmClient](self, "abmClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "regBBWakeListener");

    -[PLBBAgent abmClient](self, "abmClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "regBootStateListener");

    -[PLBBAgent abmClient](self, "abmClient");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startListening");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to init PLABMClient"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent setupMavABMChannel]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 2223);

    PLLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

  }
}

- (void)registerForICEModelMetricsNotifications:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  PLNSNotificationOperatorComposition *v8;
  PLNSNotificationOperatorComposition *bbICEModelLTEMetricsNotification;
  _QWORD v10[5];

  v4 = (objc_class *)MEMORY[0x1E0D80010];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(MEMORY[0x1E0D80078], "workQueueForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__PLBBAgent_registerForICEModelMetricsNotifications___block_invoke;
  v10[3] = &unk_1E8577F48;
  v10[4] = self;
  v8 = (PLNSNotificationOperatorComposition *)objc_msgSend(v6, "initWithWorkQueue:forNotification:withBlock:", v7, v5, v10);

  bbICEModelLTEMetricsNotification = self->_bbICEModelLTEMetricsNotification;
  self->_bbICEModelLTEMetricsNotification = v8;

}

uint64_t __53__PLBBAgent_registerForICEModelMetricsNotifications___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "modelBB16Power:", a2);
}

- (void)registerForMAVModelMetricsNotifications:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  PLNSNotificationOperatorComposition *v8;
  PLNSNotificationOperatorComposition *bbICEModelLTEMetricsNotification;
  _QWORD v10[5];

  v4 = (objc_class *)MEMORY[0x1E0D80010];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(MEMORY[0x1E0D80078], "workQueueForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__PLBBAgent_registerForMAVModelMetricsNotifications___block_invoke;
  v10[3] = &unk_1E8577F48;
  v10[4] = self;
  v8 = (PLNSNotificationOperatorComposition *)objc_msgSend(v6, "initWithWorkQueue:forNotification:withBlock:", v7, v5, v10);

  bbICEModelLTEMetricsNotification = self->_bbICEModelLTEMetricsNotification;
  self->_bbICEModelLTEMetricsNotification = v8;

}

- (void)setupTimeUpdateChannel
{
  id v2;

  -[PLBBAgent connection](self, "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerCallback:forTelephonyNotification:", TimeUpdateNotificationCB, *MEMORY[0x1E0CA7890]);

}

- (void)setupTelephonyActivityChannels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *operatorName;

  -[PLBBAgent setSimStatus:](self, "setSimStatus:", CTSIMSupportGetSIMStatus());
  -[PLBBAgent connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerCallback:forTelephonyNotification:", TelephonyActivityNotificationCB, *MEMORY[0x1E0CA73B8]);

  -[PLBBAgent connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerCallback:forTelephonyNotification:", TelephonyActivityNotificationCB, *MEMORY[0x1E0CA72F0]);

  -[PLBBAgent connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerCallback:forTelephonyNotification:", TelephonyActivityNotificationCB, *MEMORY[0x1E0CA7148]);

  -[PLBBAgent connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerCallback:forTelephonyNotification:", TelephonyActivityNotificationCB, *MEMORY[0x1E0CA7138]);

  -[PLBBAgent connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerCallback:forTelephonyNotification:", TelephonyActivityNotificationCB, *MEMORY[0x1E0CA7390]);

  -[PLBBAgent connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerCallback:forTelephonyNotification:", TelephonyActivityNotificationCB, *MEMORY[0x1E0CA7478]);

  -[PLBBAgent connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerCallback:forTelephonyNotification:", TelephonyActivityNotificationCB, *MEMORY[0x1E0CA7470]);

  -[PLBBAgent connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerCallback:forTelephonyNotification:", TelephonyActivityNotificationCB, *MEMORY[0x1E0CA77E8]);

  -[PLBBAgent setLastReportedSignal:](self, "setLastReportedSignal:", 0);
  -[PLBBAgent setInDCH:](self, "setInDCH:", 0);
  -[PLBBAgent setInUTBF:](self, "setInUTBF:", 0);
  operatorName = self->_operatorName;
  self->_operatorName = 0;

  -[PLBBAgent setChanged:](self, "setChanged:", 1);
}

- (BOOL)setupChannel:(id)a3 withLogCodes:(id)a4 andEvents:(id)a5 andExtracode:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  uint64_t v16;
  __CFString *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v11, "count") || objc_msgSend(v12, "count"))
  {
    if (!objc_msgSend(v10, "openWithConnection:", self->_connection))
    {
      v14 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v10, "enableLogCodes:andEvents:andExtraCode:", v11, v12, v13);
  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v16 = objc_opt_class();
    v25 = MEMORY[0x1E0C809B0];
    v27 = __62__PLBBAgent_setupChannel_withLogCodes_andEvents_andExtracode___block_invoke;
    v28 = &unk_1E8578738;
    v26 = 3221225472;
    v29 = CFSTR("Critical");
    v30 = v16;
    if (qword_1ED883BE0 == -1)
    {
      v17 = CFSTR("Critical");
    }
    else
    {
      dispatch_once(&qword_1ED883BE0, &v25);
      v17 = (__CFString *)v29;
    }
    v18 = byte_1ED883815;

    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Empty log and event codes - leaving channel disabled"), v25, v26, v27, v28);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent setupChannel:withLogCodes:andEvents:andExtracode:]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 2305);

      PLLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v19;
        _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v14 = 1;
LABEL_7:

  return v14;
}

uint64_t __62__PLBBAgent_setupChannel_withLogCodes_andEvents_andExtracode___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  byte_1ED883815 = result;
  return result;
}

- (void)setupBBChannelsWithAction:(int64_t)a3
{
  void *v5;
  PLBasebandLogChannel *v6;
  PLBasebandLogChannel *cachedChannel;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
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
  void *v57;
  void *v58;
  void *v59;
  void *v60;
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
  int v80;
  void *v81;
  PLBBAgent *v82;
  int v83;
  void *v84;
  int v85;
  void *v86;
  void *v87;
  int v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  NSObject *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  NSObject *v109;
  uint64_t v110;
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
  id v125;
  id v126;
  id v127;
  PLBBAgent *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  _QWORD block[5];
  _QWORD v233[5];
  _QWORD v234[5];
  uint8_t buf[4];
  void *v236;
  uint64_t v237;

  v237 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBAgent setLastBBActivityTimestamp:](self, "setLastBBActivityTimestamp:", v5);

  v127 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v125 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v126 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PLBBAgent logEventNoneBBReportBy:withAction:](self, "logEventNoneBBReportBy:withAction:", 0, a3);
  v6 = (PLBasebandLogChannel *)objc_opt_new();
  cachedChannel = self->cachedChannel;
  self->cachedChannel = v6;

  -[PLBasebandLogChannel setDelegate:](self->cachedChannel, "setDelegate:", self);
  v128 = self;
  -[PLBasebandLogChannel setCachingEnabled:](self->cachedChannel, "setCachingEnabled:", 1);
  v8 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 45452);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithObjects:", v9, 0);
  v129 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 28978);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 45309);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 45310);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 45311);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithObjects:", v11, v12, v13, v14, 0);
  v135 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 311);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 389);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 424);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 571);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayWithObjects:", v16, v17, v18, v19, 0);
  v133 = objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 629);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 630);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 631);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "arrayWithObjects:", v21, v22, v23, 0);
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 621);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 622);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "arrayWithObjects:", v25, v26, 0);
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  v152 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 275);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 301);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 302);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 303);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 312);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 320);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 324);
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 325);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 336);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 338);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 349);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 350);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 351);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 360);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 362);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 370);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 375);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 393);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 414);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 425);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 427);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 433);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 434);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 445);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 446);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 530);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 531);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 532);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 533);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 635);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 897);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1049);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1119);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1121);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1299);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1300);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1301);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1549);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1550);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "arrayWithObjects:", v229, v226, v223, v220, v217, v214, v211, v205, v208, v190, v202, v184, v199, v196, v193, v187, v175,
    v181,
    v149,
    v178,
    v146,
    v172,
    v169,
    v142,
    v166,
    v139,
    v163,
    v160,
    v157,
    v154,
    v136,
    v131,
    v123,
    v27,
    v121,
    v28,
    v29,
    v30,
    v31,
    0);
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1606);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1130);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1924);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "arrayWithObjects:", v33, v34, v35, 0);
  v153 = (void *)objc_claimAutoreleasedReturnValue();

  v161 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1889);
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1890);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1607);
  v224 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1608);
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1930);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1931);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1970);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1971);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1989);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1990);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 415);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 564);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 619);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1010);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1210);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 565);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1496);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1497);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1223);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1224);
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1226);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1227);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1604);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 538);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1072);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1036);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 300);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1120);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1076);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1465);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1466);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2260);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2261);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2262);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2284);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v161, "arrayWithObjects:", v230, v227, v224, v218, v221, v203, v215, v197, v212, v209, v206, v200, v188, v194, v185, v191, v158,
    v182,
    v179,
    v155,
    v176,
    v150,
    v173,
    v170,
    v167,
    v164,
    v143,
    v140,
    v36,
    v37,
    v137,
    v38,
    v39,
    v40,
    v41,
    0);
  v147 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2275);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2274);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2276);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2265);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "arrayWithObjects:", v43, v44, v45, v46, 0);
  v151 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6144);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 16678);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 33);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 34);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 35);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 36);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 37);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "arrayWithObjects:", v48, v49, v50, v51, v52, v53, v54, 0);
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "arrayWithObjects:", v56, 0);
  v231 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2011);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2471);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2472);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2473);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "arrayWithObjects:", v58, v59, v60, v61, 0);
  v141 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "arrayWithObjects:", v63, 0);
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  v144 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 316);
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2258);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2273);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2270);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2271);
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2279);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1615);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2287);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 625);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1613);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1614);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2006);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2007);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2028);
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2029);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2131);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2176);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2177);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2244);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2245);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1807);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1808);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2476);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2477);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2478);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 567);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 568);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1013);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1131);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1132);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2288);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2289);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2290);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2493);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2494);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2485);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2486);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2488);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "arrayWithObjects:", v228, v225, v222, v219, v216, v213, v207, v210, v192, v204, v186, v201, v198, v195, v189, v177, v183,
    v124,
    v180,
    v122,
    v174,
    v171,
    v120,
    v168,
    v119,
    v165,
    v162,
    v159,
    v156,
    v118,
    v117,
    v116,
    v64,
    v115,
    v65,
    v66,
    v67,
    v68,
    0);
  v145 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2521);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2549);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2555);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2556);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2557);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2558);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2559);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2560);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "arrayWithObjects:", v70, v71, v72, v73, v74, v75, v76, v77, 0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = (void *)v129;
  objc_msgSend(v125, "addObjectsFromArray:", v231);
  v80 = objc_msgSend(MEMORY[0x1E0D80020], "kPLBasebandClassOfDevice");
  if ((v80 - 1003001) < 5 || v80 == 1003007)
    objc_msgSend(v125, "addObjectsFromArray:", v129);
  v81 = (void *)v133;
  v82 = v128;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
  {
    v83 = objc_msgSend(MEMORY[0x1E0D80020], "kPLBasebandClassOfDevice");
    if ((v83 - 1003002) >= 4)
    {
      v84 = v135;
      if (v83 == 1003001)
        goto LABEL_6;
      if (v83 != 1003007)
        goto LABEL_7;
    }
    objc_msgSend(v125, "addObjectsFromArray:", v135);
    v84 = v132;
LABEL_6:
    objc_msgSend(v125, "addObjectsFromArray:", v84);
  }
LABEL_7:
  objc_msgSend(v127, "addObjectsFromArray:", v133);
  v85 = objc_msgSend(MEMORY[0x1E0D80020], "kPLBasebandClassOfDevice");
  if ((v85 - 1003002) < 4 || v85 == 1003007)
  {
    objc_msgSend(v127, "addObjectsFromArray:", v153);
    objc_msgSend(v127, "addObjectsFromArray:", v151);
    objc_msgSend(v127, "addObjectsFromArray:", v141);
    v86 = v126;
    v87 = v138;
LABEL_9:
    objc_msgSend(v86, "addObjectsFromArray:", v87);
    goto LABEL_10;
  }
  if (v85 == 1003001)
  {
    objc_msgSend(v127, "addObjectsFromArray:", v153);
    objc_msgSend(v127, "addObjectsFromArray:", v151);
    v86 = v127;
    v87 = v130;
    goto LABEL_9;
  }
LABEL_10:
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
  {
    objc_msgSend(v127, "addObjectsFromArray:", v134);
    v88 = objc_msgSend(MEMORY[0x1E0D80020], "kPLBasebandClassOfDevice") - 1003001;
    v90 = v145;
    v89 = v147;
    v91 = v147;
    v92 = v148;
    switch(v88)
    {
      case 0:
        goto LABEL_14;
      case 1:
        goto LABEL_13;
      case 2:
      case 3:
      case 4:
      case 6:
        objc_msgSend(v127, "addObjectsFromArray:", v147);
        v91 = v145;
        v90 = v148;
        v92 = v78;
LABEL_13:
        objc_msgSend(v127, "addObjectsFromArray:", v91);
        v89 = v90;
LABEL_14:
        objc_msgSend(v127, "addObjectsFromArray:", v89);
        objc_msgSend(v127, "addObjectsFromArray:", v92);
        break;
      default:
        break;
    }
  }
  if (-[PLBBAgent setupChannel:withLogCodes:andEvents:andExtracode:](v128, "setupChannel:withLogCodes:andEvents:andExtracode:", v128->cachedChannel, v125, v127, v126))
  {
    -[PLBasebandLogChannel setChannelTimeout:](v128->cachedChannel, "setChannelTimeout:", 10.0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v125, "containsObject:", v93);

    if (v94)
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v95 = objc_opt_class();
        v233[0] = MEMORY[0x1E0C809B0];
        v233[1] = 3221225472;
        v233[2] = __39__PLBBAgent_setupBBChannelsWithAction___block_invoke_976;
        v233[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v233[4] = v95;
        if (qword_1ED883BF0 != -1)
          dispatch_once(&qword_1ED883BF0, v233);
        if (byte_1ED883817)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Hw log level %d, win size %d"), 6, 420000);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "lastPathComponent");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent setupBBChannelsWithAction:]");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "logMessage:fromFile:fromFunction:fromLineNumber:", v96, v99, v100, 2646);

          PLLogCommon();
          v101 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v236 = v96;
            _os_log_debug_impl(&dword_1CAF47000, v101, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v82 = v128;
          v79 = (void *)v129;
          v81 = (void *)v133;
        }
      }
      -[PLBasebandLogChannel setHardwareLoggingLevel:withWindowSize:](v82->cachedChannel, "setHardwareLoggingLevel:withWindowSize:", 6, 420000);
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v102 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39__PLBBAgent_setupBBChannelsWithAction___block_invoke_981;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v102;
      if (qword_1ED883BF8 != -1)
        dispatch_once(&qword_1ED883BF8, block);
      if (byte_1ED883818)
      {
        v103 = v79;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Initializing BB channels complete"));
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "lastPathComponent");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent setupBBChannelsWithAction:]");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "logMessage:fromFile:fromFunction:fromLineNumber:", v104, v107, v108, 2651);

        PLLogCommon();
        v109 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v236 = v104;
LABEL_47:
          _os_log_debug_impl(&dword_1CAF47000, v109, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          goto LABEL_36;
        }
        goto LABEL_36;
      }
    }
  }
  else
  {
    -[PLBBAgent scheduleReconnect](v128, "scheduleReconnect");
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v110 = objc_opt_class();
      v234[0] = MEMORY[0x1E0C809B0];
      v234[1] = 3221225472;
      v234[2] = __39__PLBBAgent_setupBBChannelsWithAction___block_invoke;
      v234[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v234[4] = v110;
      if (qword_1ED883BE8 != -1)
        dispatch_once(&qword_1ED883BE8, v234);
      if (byte_1ED883816)
      {
        v103 = (void *)v129;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: need to schedule reconnect"));
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "lastPathComponent");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent setupBBChannelsWithAction:]");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "logMessage:fromFile:fromFunction:fromLineNumber:", v104, v113, v114, 2638);

        PLLogCommon();
        v109 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v236 = v104;
          goto LABEL_47;
        }
LABEL_36:
        v79 = v103;
        v81 = (void *)v133;

      }
    }
  }

}

uint64_t __39__PLBBAgent_setupBBChannelsWithAction___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883816 = result;
  return result;
}

uint64_t __39__PLBBAgent_setupBBChannelsWithAction___block_invoke_976(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883817 = result;
  return result;
}

uint64_t __39__PLBBAgent_setupBBChannelsWithAction___block_invoke_981(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883818 = result;
  return result;
}

- (id)setupIOKitNotifications
{
  mach_port_t v3;
  IONotificationPort *v4;
  NSObject *v5;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD block[5];
  _QWORD v41[5];
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v3 = *MEMORY[0x1E0CBBAB8];
    v4 = IONotificationPortCreate(*MEMORY[0x1E0CBBAB8]);
    self->ioNotifyPort = v4;
    -[PLOperator workQueue](self, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    IONotificationPortSetDispatchQueue(v4, v5);

    v6 = IOServiceMatching("AppleBaseband");
    MatchingService = IOServiceGetMatchingService(v3, v6);
    self->baseband_service = MatchingService;
    v8 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
    if (!MatchingService)
    {
      if (!v8)
        return 0;
      v25 = objc_opt_class();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __36__PLBBAgent_setupIOKitNotifications__block_invoke;
      v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v41[4] = v25;
      if (qword_1ED883C00 != -1)
        dispatch_once(&qword_1ED883C00, v41);
      if (!byte_1ED883819)
        return 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not find %s service\n"), "AppleBaseband");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "lastPathComponent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent setupIOKitNotifications]");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v28, v29, 2664);

      PLLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        goto LABEL_22;
      *(_DWORD *)buf = 138412290;
      v43 = v19;
      goto LABEL_33;
    }
    if (v8)
    {
      v9 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__PLBBAgent_setupIOKitNotifications__block_invoke_989;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v9;
      if (qword_1ED883C08 != -1)
        dispatch_once(&qword_1ED883C08, block);
      if (byte_1ED88381A)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("found matching service for baseband"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastPathComponent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent setupIOKitNotifications]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 2667);

        PLLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v10;
          _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v16 = IOServiceAddInterestNotification(self->ioNotifyPort, self->baseband_service, "IOGeneralInterest", (IOServiceInterestCallback)BasebandResetCallback, self, &self->notificationRef);
    v17 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
    if ((_DWORD)v16)
    {
      if (!v17)
        return 0;
      v18 = objc_opt_class();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __36__PLBBAgent_setupIOKitNotifications__block_invoke_995;
      v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v39[4] = v18;
      if (qword_1ED883C10 != -1)
        dispatch_once(&qword_1ED883C10, v39);
      if (!byte_1ED88381B)
        return 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error calling IOServiceAddInterestNotification (0x%08x)"), v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent setupIOKitNotifications]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 2674);

      PLLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
LABEL_22:

        return 0;
      }
      *(_DWORD *)buf = 138412290;
      v43 = v19;
LABEL_33:
      _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_22;
    }
    if (v17)
    {
      v31 = objc_opt_class();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __36__PLBBAgent_setupIOKitNotifications__block_invoke_1000;
      v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v38[4] = v31;
      if (qword_1ED883C18 != -1)
        dispatch_once(&qword_1ED883C18, v38);
      if (byte_1ED88381C)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Subscribed to notification for baseband"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "lastPathComponent");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent setupIOKitNotifications]");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 2677);

        PLLogCommon();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v32;
          _os_log_debug_impl(&dword_1CAF47000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  return self;
}

uint64_t __36__PLBBAgent_setupIOKitNotifications__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883819 = result;
  return result;
}

uint64_t __36__PLBBAgent_setupIOKitNotifications__block_invoke_989(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88381A = result;
  return result;
}

uint64_t __36__PLBBAgent_setupIOKitNotifications__block_invoke_995(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88381B = result;
  return result;
}

uint64_t __36__PLBBAgent_setupIOKitNotifications__block_invoke_1000(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88381C = result;
  return result;
}

- (BOOL)isTimeToRequestReport
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  _QWORD block[5];

  -[PLBBAgent lastReportRequestDate](self, "lastReportRequestDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLBBAgent lastReportRequestDate](self, "lastReportRequestDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceNow");
    v6 = v5;

    if (v6 >= -300.0)
    {
      v7 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __34__PLBBAgent_isTimeToRequestReport__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (qword_1ED883C20 != -1)
        dispatch_once(&qword_1ED883C20, block);
      if (!byte_1ED88381D)
        return 0;
      -[PLBBAgent lastReportRequestDate](self, "lastReportRequestDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceNow");
      v10 = v9;

      if (v10 >= -30.0)
        return 0;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBAgent setLastReportRequestDate:](self, "setLastReportRequestDate:", v11);

  return 1;
}

uint64_t __34__PLBBAgent_isTimeToRequestReport__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88381D = result;
  return result;
}

- (void)cacheCommitTimerFired
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t block;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __34__PLBBAgent_cacheCommitTimerFired__block_invoke;
    v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    v14 = v3;
    if (qword_1ED883C28 != -1)
      dispatch_once(&qword_1ED883C28, &block);
    if (byte_1ED88381E)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent cacheCommitTimerFired]", block, v11, v12, v13, v14);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent cacheCommitTimerFired]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 2710);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBAgent logEventNoneBBReportBy:withAction:](self, "logEventNoneBBReportBy:withAction:", 1, 3);
}

uint64_t __34__PLBBAgent_cacheCommitTimerFired__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88381E = result;
  return result;
}

- (void)scheduleFlushPostCacheCommit
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  _QWORD block[5];
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __41__PLBBAgent_scheduleFlushPostCacheCommit__block_invoke;
    v14[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v14[4] = objc_opt_class();
    if (qword_1ED883C30 != -1)
      dispatch_once(&qword_1ED883C30, v14);
    if (byte_1ED88381F)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent scheduleFlushPostCacheCommit]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent scheduleFlushPostCacheCommit]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 2716);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v11 = dispatch_time(0, 30000000000);
  -[PLOperator workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __41__PLBBAgent_scheduleFlushPostCacheCommit__block_invoke_1003;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  dispatch_after(v11, v12, block);

}

uint64_t __41__PLBBAgent_scheduleFlushPostCacheCommit__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88381F = result;
  return result;
}

uint64_t __41__PLBBAgent_scheduleFlushPostCacheCommit__block_invoke_1003(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logEventNoneBBReportBy:withAction:", 2, 4);
}

- (void)initCacheCommitTimer
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__PLBBAgent_initCacheCommitTimer__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED883C38 != -1)
      dispatch_once(&qword_1ED883C38, block);
    if (byte_1ED883820)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent initCacheCommitTimer]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent initCacheCommitTimer]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 2726);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v11 = objc_alloc(MEMORY[0x1E0D80070]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 300.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator workQueue](self, "workQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __33__PLBBAgent_initCacheCommitTimer__block_invoke_1004;
  v15[3] = &unk_1E8578078;
  v15[4] = self;
  v14 = (void *)objc_msgSend(v11, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v12, 1, 0, v13, v15, 300.0, 0.0);
  -[PLBBAgent setCacheCommitTimer:](self, "setCacheCommitTimer:", v14);

}

uint64_t __33__PLBBAgent_initCacheCommitTimer__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883820 = result;
  return result;
}

uint64_t __33__PLBBAgent_initCacheCommitTimer__block_invoke_1004(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cacheCommitTimerFired");
  return objc_msgSend(*(id *)(a1 + 32), "scheduleFlushPostCacheCommit");
}

- (void)cancelCacheCommitTimer
{
  id v2;

  -[PLBBAgent cacheCommitTimer](self, "cacheCommitTimer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimerActive:", 0);

}

- (void)resetCacheCommitTimer
{
  void *v2;
  id v3;

  -[PLBBAgent cacheCommitTimer](self, "cacheCommitTimer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 300.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFireDate:", v2);

}

- (void)initOperatorDependancies
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  PLBBTelephonyDsdsRegMsg *v14;
  void *v15;
  PLBBTelephonyDsdsActivityMsg *v16;
  OS_dispatch_queue *v17;
  OS_dispatch_queue *telephonyClientQueue;
  id v19;
  void *v20;
  CoreTelephonyClient *v21;
  CoreTelephonyClient *telephonyClient;
  void *v23;
  void *v24;
  TUCallCenter *v25;
  TUCallCenter *callCenter;
  void *v27;
  PLEntryNotificationOperatorComposition *v28;
  PLEntryNotificationOperatorComposition *batteryLevelChanged;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  PLNSNotificationOperatorComposition *v67;
  PLNSNotificationOperatorComposition *thermalMonitorListener;
  id v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  _QWORD v81[5];
  _QWORD v82[5];
  _QWORD v83[5];
  _QWORD v84[5];
  _QWORD v85[5];
  _QWORD v86[5];
  _QWORD v87[5];
  _QWORD v88[5];
  _QWORD v89[5];
  _QWORD v90[5];
  _QWORD v91[5];
  _QWORD block[5];
  const __CFString *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  _QWORD v99[2];
  _QWORD v100[2];
  uint8_t buf[4];
  void *v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1ED883C40 != -1)
      dispatch_once(&qword_1ED883C40, block);
    if (byte_1ED883821)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent initOperatorDependancies]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent initOperatorDependancies]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 2748);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v102 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBAgent setDsdsRegMsgs:](self, "setDsdsRegMsgs:", v10);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBAgent setDsdsActivityMsgs:](self, "setDsdsActivityMsgs:", v11);

  v12 = 4;
  do
  {
    -[PLBBAgent dsdsRegMsgs](self, "dsdsRegMsgs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(PLBBTelephonyDsdsRegMsg);
    objc_msgSend(v13, "addObject:", v14);

    -[PLBBAgent dsdsActivityMsgs](self, "dsdsActivityMsgs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(PLBBTelephonyDsdsActivityMsg);
    objc_msgSend(v15, "addObject:", v16);

    --v12;
  }
  while (v12);
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandDSDS") & 1) != 0)
  {
    v17 = (OS_dispatch_queue *)dispatch_queue_create("Telephony Client Queue", 0);
    telephonyClientQueue = self->_telephonyClientQueue;
    self->_telephonyClientQueue = v17;

    v19 = objc_alloc(MEMORY[0x1E0CA6E38]);
    -[PLBBAgent telephonyClientQueue](self, "telephonyClientQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (CoreTelephonyClient *)objc_msgSend(v19, "initWithQueue:", v20);
    telephonyClient = self->_telephonyClient;
    self->_telephonyClient = v21;

    -[CoreTelephonyClient setDelegate:](self->_telephonyClient, "setDelegate:", self);
    v23 = (void *)MEMORY[0x1E0DBD1C0];
    -[PLBBAgent telephonyClientQueue](self, "telephonyClientQueue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "callCenterWithQueue:", v24);
    v25 = (TUCallCenter *)objc_claimAutoreleasedReturnValue();
    callCenter = self->_callCenter;
    self->_callCenter = v25;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", self, sel_callStatusChanged_, *MEMORY[0x1E0DBD4A0], 0);

  }
  self->_isBBOOS = 0;
  self->_isFirstTimeAccountingOOS = 1;
  self->_isBBDataStandard = 1;
  -[PLBBAgent logBasebandConfig](self, "logBasebandConfig");
  -[PLBBAgent setupTelephonyRegistrationChannels](self, "setupTelephonyRegistrationChannels");
  -[PLBBAgent setupTelephonyActivityChannels](self, "setupTelephonyActivityChannels");
  -[PLBBAgent setupTimeUpdateChannel](self, "setupTimeUpdateChannel");
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandProto") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandIce"))
  {
    v91[0] = MEMORY[0x1E0C809B0];
    v91[1] = 3221225472;
    v91[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_1014;
    v91[3] = &unk_1E8577F48;
    v91[4] = self;
    objc_msgSend(MEMORY[0x1E0D7FFC8], "significantBatteryChangeNotificationWithOperator:withBlock:", self, v91);
    v28 = (PLEntryNotificationOperatorComposition *)objc_claimAutoreleasedReturnValue();
    batteryLevelChanged = self->_batteryLevelChanged;
    self->_batteryLevelChanged = v28;

    -[PLBBAgent setupKICEChannels](self, "setupKICEChannels");
LABEL_16:
    -[PLBBAgent setAgentInited:](self, "setAgentInited:", 1);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v30 = objc_opt_class();
      v89[0] = MEMORY[0x1E0C809B0];
      v89[1] = 3221225472;
      v89[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_1021;
      v89[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v89[4] = v30;
      if (qword_1ED883C50 != -1)
        dispatch_once(&qword_1ED883C50, v89);
      if (byte_1ED883823)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Setup TelephonyRegistration init"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "lastPathComponent");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent initOperatorDependancies]");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v34, v35, 2814);

        PLLogCommon();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v102 = v31;
          _os_log_debug_impl(&dword_1CAF47000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v37 = (void *)objc_opt_new();
    -[PLBBAgent setTelRegMsgHelper:](self, "setTelRegMsgHelper:", v37);

    -[PLBBAgent telRegMsgHelper](self, "telRegMsgHelper");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setAgent:", self);

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v39 = objc_opt_class();
      v88[0] = MEMORY[0x1E0C809B0];
      v88[1] = 3221225472;
      v88[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_1026;
      v88[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v88[4] = v39;
      if (qword_1ED883C58 != -1)
        dispatch_once(&qword_1ED883C58, v88);
      if (byte_1ED883824)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Setup TelephonyActivity init"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "lastPathComponent");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent initOperatorDependancies]");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "logMessage:fromFile:fromFunction:fromLineNumber:", v40, v43, v44, 2819);

        PLLogCommon();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v102 = v40;
          _os_log_debug_impl(&dword_1CAF47000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v46 = (void *)objc_opt_new();
    -[PLBBAgent setTelActMsgHelper:](self, "setTelActMsgHelper:", v46);

    -[PLBBAgent telActMsgHelper](self, "telActMsgHelper");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setAgent:", self);

    -[PLBBAgent logTelephonyRegistrationAtInit](self, "logTelephonyRegistrationAtInit");
    -[PLBBAgent logTelephonyActivityAtInit](self, "logTelephonyActivityAtInit");
    v48 = objc_alloc(MEMORY[0x1E0D7FF80]);
    objc_msgSend(MEMORY[0x1E0D80078], "workQueueForClass:", objc_opt_class());
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = MEMORY[0x1E0C809B0];
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_1032;
    v87[3] = &unk_1E8577F48;
    v87[4] = self;
    v51 = (void *)objc_msgSend(v48, "initWithWorkQueue:forNotification:requireState:withBlock:", v49, CFSTR("com.apple.powerlogd.bbreport"), 0, v87);
    -[PLBBAgent setCfNotifyBBReport:](self, "setCfNotifyBBReport:", v51);

    v52 = objc_alloc(MEMORY[0x1E0D7FF80]);
    objc_msgSend(MEMORY[0x1E0D80078], "workQueueForClass:", objc_opt_class());
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = v50;
    v86[1] = 3221225472;
    v86[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_2_1035;
    v86[3] = &unk_1E8577F48;
    v86[4] = self;
    v54 = (void *)objc_msgSend(v52, "initWithWorkQueue:forNotification:requireState:withBlock:", v53, CFSTR("com.apple.powerlogd.bbreport30s"), 0, v86);
    -[PLBBAgent setCfNotifyBBReport30s:](self, "setCfNotifyBBReport30s:", v54);

    v85[0] = v50;
    v85[1] = 3221225472;
    v85[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_3;
    v85[3] = &unk_1E8577F48;
    v85[4] = self;
    objc_msgSend(MEMORY[0x1E0D7FFC8], "canSleepEntryNotificationWithOperator:withBlock:", self, v85);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBAgent setCanSleepNotification:](self, "setCanSleepNotification:", v55);

    v56 = objc_alloc(MEMORY[0x1E0D7FFC8]);
    v97 = &unk_1E8633978;
    v98 = &unk_1E8633990;
    v99[0] = CFSTR("State");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v99[1] = CFSTR("Event");
    v100[0] = v57;
    v95 = &unk_1E8633978;
    v96 = &unk_1E86339A8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v100[1] = v58;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v99, 2);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = v50;
    v84[1] = 3221225472;
    v84[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_1046;
    v84[3] = &unk_1E8577F48;
    v84[4] = self;
    v60 = (void *)objc_msgSend(v56, "initWithOperator:forEntryKey:withFilter:withBlock:", self, CFSTR("PLSleepWakeAgent_EventForward_PowerState"), v59, v84);
    -[PLBBAgent setDidNotSleepNotification:](self, "setDidNotSleepNotification:", v60);

    v61 = objc_alloc(MEMORY[0x1E0D7FFC8]);
    +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("TelephonyActivity"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = v50;
    v83[1] = 3221225472;
    v83[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_2_1047;
    v83[3] = &unk_1E8577F48;
    v83[4] = self;
    v63 = (void *)objc_msgSend(v61, "initWithOperator:forEntryKey:withBlock:", self, v62, v83);
    -[PLBBAgent setTelephonyActivityNotification:](self, "setTelephonyActivityNotification:", v63);

    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = CFSTR("BB-Standard");
    v94 = &unk_1E86532C0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 6, v65, v66);

    v82[0] = v50;
    v82[1] = 3221225472;
    v82[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_1053;
    v82[3] = &unk_1E8577F48;
    v82[4] = self;
    v67 = (PLNSNotificationOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80010]), "initWithOperator:forNotification:withBlock:", self, CFSTR("PLThermalMonitorNotification"), v82);
    thermalMonitorListener = self->_thermalMonitorListener;
    self->_thermalMonitorListener = v67;

    v69 = objc_alloc(MEMORY[0x1E0D80098]);
    -[PLOperator workQueue](self, "workQueue");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = v50;
    v81[1] = 3221225472;
    v81[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_2_1065;
    v81[3] = &unk_1E8577F70;
    v81[4] = self;
    v71 = (void *)objc_msgSend(v69, "initWithWorkQueue:withRegistration:withBlock:", v70, &unk_1E864CC60, v81);

    -[PLBBAgent setBBLogsSysdiagnoseResponder:](self, "setBBLogsSysdiagnoseResponder:", v71);
    objc_storeStrong((id *)&qword_1ED883A20, self);
    PLLogCommon();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CAF47000, v72, OS_LOG_TYPE_DEBUG, "BBAgent: End of initOperatorDependencies", buf, 2u);
    }

    return;
  }
  -[PLBBAgent setupIOKitNotifications](self, "setupIOKitNotifications");
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (v73)
  {
    -[PLBBAgent setupMavABMChannel](self, "setupMavABMChannel");
    -[PLBBAgent setupBBChannelsWithAction:](self, "setupBBChannelsWithAction:", 0);
    -[PLBasebandLogChannel flush](self->cachedChannel, "flush");
    -[PLBBAgent initCacheCommitTimer](self, "initCacheCommitTimer");
    goto LABEL_16;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v74 = objc_opt_class();
    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = __37__PLBBAgent_initOperatorDependancies__block_invoke_2;
    v90[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v90[4] = v74;
    if (qword_1ED883C48 != -1)
      dispatch_once(&qword_1ED883C48, v90);
    if (byte_1ED883822)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: BBAgent no ioKitNotifications"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "lastPathComponent");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent initOperatorDependancies]");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "logMessage:fromFile:fromFunction:fromLineNumber:", v75, v78, v79, 2796);

      PLLogCommon();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v102 = v75;
        _os_log_debug_impl(&dword_1CAF47000, v80, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
}

uint64_t __37__PLBBAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883821 = result;
  return result;
}

uint64_t __37__PLBBAgent_initOperatorDependancies__block_invoke_1014(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkKICEChannelTimeout");
}

uint64_t __37__PLBBAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883822 = result;
  return result;
}

uint64_t __37__PLBBAgent_initOperatorDependancies__block_invoke_1021(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883823 = result;
  return result;
}

uint64_t __37__PLBBAgent_initOperatorDependancies__block_invoke_1026(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883824 = result;
  return result;
}

uint64_t __37__PLBBAgent_initOperatorDependancies__block_invoke_1032(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshBBReport");
}

uint64_t __37__PLBBAgent_initOperatorDependancies__block_invoke_2_1035(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setupKICEChannelsForDebug");
}

uint64_t __37__PLBBAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelCacheCommitTimer");
}

uint64_t __37__PLBBAgent_initOperatorDependancies__block_invoke_1046(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetCacheCommitTimer");
}

void __37__PLBBAgent_initOperatorDependancies__block_invoke_2_1047(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  const __CFString **v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("callStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("campedRat"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003001) & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003002))
  {
    v7 = *(void **)(a1 + 32);
    v6 = (id *)(a1 + 32);
    if (objc_msgSend(v7, "isBBDataStandard")
      && objc_msgSend(v4, "isEqualToString:", CFSTR("Active")))
    {
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR("BB-PhoneCall");
      v23[0] = &unk_1E86532C0;
      v9 = (void *)MEMORY[0x1E0C99D80];
      v10 = (void **)v23;
      v11 = &v22;
LABEL_6:
      objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "entryDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 6, v12, v13);
      v14 = 0;
LABEL_10:

      objc_msgSend(*v6, "setIsBBDataStandard:", v14);
      goto LABEL_20;
    }
    if ((objc_msgSend(*v6, "isBBDataStandard") & 1) == 0
      && objc_msgSend(v4, "isEqualToString:", CFSTR("Inactive")))
    {
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("BB-Standard");
      v21 = &unk_1E86532C0;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "entryDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 6, v12, v13);
      goto LABEL_10;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = *(void **)(a1 + 32);
        v6 = (id *)(a1 + 32);
        if (objc_msgSend(v15, "isBBDataStandard")
          && objc_msgSend(v4, "isEqualToString:", CFSTR("Active"))
          && objc_msgSend(v5, "isEqualToString:", CFSTR("LTE")))
        {
          objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = CFSTR("BB-PhoneCall");
          v19 = &unk_1E86532C0;
          v9 = (void *)MEMORY[0x1E0C99D80];
          v10 = &v19;
          v11 = &v18;
          goto LABEL_6;
        }
        if ((objc_msgSend(*v6, "isBBDataStandard") & 1) == 0
          && ((objc_msgSend(v4, "isEqualToString:", CFSTR("Inactive")) & 1) != 0
           || (objc_msgSend(v5, "isEqualToString:", CFSTR("LTE")) & 1) == 0))
        {
          objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = CFSTR("BB-Standard");
          v17 = &unk_1E86532C0;
          v14 = 1;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "entryDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 6, v12, v13);
          goto LABEL_10;
        }
      }
    }
  }
LABEL_20:

}

void __37__PLBBAgent_initOperatorDependancies__block_invoke_1053(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412290;
    v13 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "Notification from ThermalMonitor: %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Source"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Source"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", &unk_1E8633948);

    if (v8)
    {
      if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandProto") & 1) != 0
        || (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav") & 1) != 0
        || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandIce"))
      {
        PLLogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v12 = 138412290;
          v13 = v3;
          _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "Recieved trigger for sysdiagnose: %@", (uint8_t *)&v12, 0xCu);
        }

        if ((int)objc_msgSend(MEMORY[0x1E0D80020], "kPLBasebandClassOfDevice") <= 1003014
          || (int)objc_msgSend(MEMORY[0x1E0D80020], "kPLBasebandClassOfDevice") >= 1003018)
        {
          objc_msgSend(*(id *)(a1 + 32), "logEventNoneBBReportBy:withAction:", 4, 7);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "logEventNoneBBReportBy:withAction:", 4, 8);
          v10 = dispatch_time(0, 1000000000);
          objc_msgSend(*(id *)(a1 + 32), "workQueue");
          v11 = objc_claimAutoreleasedReturnValue();
          dispatch_after(v10, v11, &__block_literal_global_35);

        }
      }
    }
  }

}

void __37__PLBBAgent_initOperatorDependancies__block_invoke_1056()
{
  id v0;

  +[PLMAVBBMetric sharedInstance](PLMAVBBMetric, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "flushPeriodicMetrics");

}

void *__37__PLBBAgent_initOperatorDependancies__block_invoke_2_1065(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v7[16];
  uint8_t buf[16];

  PLLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEBUG, "XPC Call from TS Sysdiagnose", buf, 2u);
  }

  if ((int)objc_msgSend(MEMORY[0x1E0D80020], "kPLBasebandClassOfDevice") <= 1003014
    || (int)objc_msgSend(MEMORY[0x1E0D80020], "kPLBasebandClassOfDevice") >= 1003018)
  {
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Assert flush not supported on older platforms", v7, 2u);
    }

    v3 = &unk_1E864CC88;
    v4 = 7;
  }
  else
  {
    v3 = &unk_1E864CCB0;
    v4 = 8;
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventNoneBBReportBy:withAction:", 4, v4);
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DBD4A0], 0);

  v4.receiver = self;
  v4.super_class = (Class)PLBBAgent;
  -[PLAgent dealloc](&v4, sel_dealloc);
}

uint64_t __22__PLBBAgent_logEntry___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883825 = result;
  return result;
}

uint64_t __22__PLBBAgent_logEntry___block_invoke_1081(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883826 = result;
  return result;
}

- (void)logEntries:(id)a3 withGroupID:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t block;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  uint64_t v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PLBBAgent;
  -[PLOperator logEntries:withGroupID:](&v22, sel_logEntries_withGroupID_, v6, a4);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __36__PLBBAgent_logEntries_withGroupID___block_invoke;
    v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    v21 = v7;
    if (qword_1ED883C70 != -1)
      dispatch_once(&qword_1ED883C70, &block);
    if (byte_1ED883827)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent logEntries:withGroupID:]", block, v18, v19, v20, v21);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logEntries:withGroupID:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 2976);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMavLeg"))
    -[PLBBAgent modelMav10BBHWPower:](self, "modelMav10BBHWPower:", v6);
  else
    -[PLBBAgent modelMavBBHWOtherPerRATPower:](self, "modelMavBBHWOtherPerRATPower:", v6);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOther"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOther"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLBBAgent modelGPSPower:](self, "modelGPSPower:", v16);
  }
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003001) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003002) & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMavLeg"))
  {
    -[PLBBAgent modelScanPower:](self, "modelScanPower:", v6);
  }

}

uint64_t __36__PLBBAgent_logEntries_withGroupID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883827 = result;
  return result;
}

- (void)log
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __16__PLBBAgent_log__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1ED883C78 != -1)
      dispatch_once(&qword_1ED883C78, block);
    if (byte_1ED883828)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent log]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent log]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 2999);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandProto") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandIce"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v10 = objc_opt_class();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __16__PLBBAgent_log__block_invoke_1096;
      v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v26[4] = v10;
      if (qword_1ED883C80 != -1)
        dispatch_once(&qword_1ED883C80, v26);
      if (byte_1ED883829)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLBBAgent:log for Protobuf platforms"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent log]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 3002);

        PLLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v11;
          _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v17 = 7;
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v18 = objc_opt_class();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __16__PLBBAgent_log__block_invoke_1101;
      v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v25[4] = v18;
      if (qword_1ED883C88 != -1)
        dispatch_once(&qword_1ED883C88, v25);
      if (byte_1ED88382A)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLBBAgent:log for Mav"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "lastPathComponent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent log]");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 3005);

        PLLogCommon();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v19;
          _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v17 = 4;
    -[PLBBAgent logEventNoneBBReportBy:withAction:](self, "logEventNoneBBReportBy:withAction:", 4, 3);
  }
  -[PLBBAgent logEventNoneBBReportBy:withAction:](self, "logEventNoneBBReportBy:withAction:", 4, v17);
}

uint64_t __16__PLBBAgent_log__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883828 = result;
  return result;
}

uint64_t __16__PLBBAgent_log__block_invoke_1096(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883829 = result;
  return result;
}

uint64_t __16__PLBBAgent_log__block_invoke_1101(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88382A = result;
  return result;
}

- (void)flushBBCacheWithClientInfo:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  uint64_t v30;
  _QWORD v31[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__PLBBAgent_flushBBCacheWithClientInfo___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED883C90 != -1)
      dispatch_once(&qword_1ED883C90, block);
    if (byte_1ED88382B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent flushBBCacheWithClientInfo:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent flushBBCacheWithClientInfo:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 3013);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v12 = objc_opt_class();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __40__PLBBAgent_flushBBCacheWithClientInfo___block_invoke_1106;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v12;
    if (qword_1ED883C98 != -1)
      dispatch_once(&qword_1ED883C98, v31);
    if (byte_1ED88382C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLBBAgent log method called by:%ld"), a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent flushBBCacheWithClientInfo:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 3014);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v13;
        _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (-[PLBBAgent agentInited](self, "agentInited"))
  {
    -[PLBBAgent eventToFlushCacheOccurred](self, "eventToFlushCacheOccurred");
  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v19 = objc_opt_class();
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __40__PLBBAgent_flushBBCacheWithClientInfo___block_invoke_1111;
    v29 = &__block_descriptor_40_e5_v8__0lu32l8;
    v30 = v19;
    if (qword_1ED883CA0 != -1)
      dispatch_once(&qword_1ED883CA0, &v26);
    if (byte_1ED88382D)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: PLBBAgent log method called by %ld before init"), a3, v26, v27, v28, v29, v30);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastPathComponent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent flushBBCacheWithClientInfo:]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 3017);

      PLLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v20;
        _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
}

uint64_t __40__PLBBAgent_flushBBCacheWithClientInfo___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88382B = result;
  return result;
}

uint64_t __40__PLBBAgent_flushBBCacheWithClientInfo___block_invoke_1106(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88382C = result;
  return result;
}

uint64_t __40__PLBBAgent_flushBBCacheWithClientInfo___block_invoke_1111(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88382D = result;
  return result;
}

- (void)commitBBCacheWithClientInfo:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__PLBBAgent_commitBBCacheWithClientInfo___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED883CA8 != -1)
      dispatch_once(&qword_1ED883CA8, block);
    if (byte_1ED88382E)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s client: %ld"), "-[PLBBAgent commitBBCacheWithClientInfo:]", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent commitBBCacheWithClientInfo:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 3026);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (-[PLBBAgent agentInited](self, "agentInited"))
  {
    -[PLBBAgent eventToCommitCacheOccurred](self, "eventToCommitCacheOccurred");
  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v12 = objc_opt_class();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __41__PLBBAgent_commitBBCacheWithClientInfo___block_invoke_1118;
    v19[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v19[4] = v12;
    if (qword_1ED883CB0 != -1)
      dispatch_once(&qword_1ED883CB0, v19);
    if (byte_1ED88382F)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: method called by %ld before init"), a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent commitBBCacheWithClientInfo:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 3030);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v13;
        _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
}

uint64_t __41__PLBBAgent_commitBBCacheWithClientInfo___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88382E = result;
  return result;
}

uint64_t __41__PLBBAgent_commitBBCacheWithClientInfo___block_invoke_1118(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88382F = result;
  return result;
}

uint64_t __36__PLBBAgent_logTelephonyRegMsgWith___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883830 = result;
  return result;
}

uint64_t __36__PLBBAgent_logTelephonyRegMsgWith___block_invoke_1123(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883831 = result;
  return result;
}

- (id)humanReadableRegistrationStatus:(id)a3
{
  id v3;
  __CFString *v4;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("kCTRegistrationStatus"), "length"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = CFSTR("<unknown>");
  }
  return v4;
}

- (id)humanReadableDataIndicator:(id)a3
{
  id v3;
  __CFString *v4;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("kCTRegistrationDataIndicator"), "length"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = CFSTR("<unknown>");
  }
  return v4;
}

+ (id)humanReadableStateFromKey:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("kCTRegistrationBasebandState")))
  {
    objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("kCTRegistrationBasebandState"), "length"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (void)logTelephonyRegistrationAtInit
{
  NSObject *v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[PLBBAgent logTelephonyRegistrationAtInit]";
    _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __43__PLBBAgent_logTelephonyRegistrationAtInit__block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v4;
    if (qword_1ED883CC8 != -1)
      dispatch_once(&qword_1ED883CC8, &block);
    if (byte_1ED883832)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent logTelephonyRegistrationAtInit]", block, v13, v14, v15, v16);
      v5 = (char *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logTelephonyRegistrationAtInit]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 3080);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBAgent telRegMsgHelper](self, "telRegMsgHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logEventPointTelephonyRegistrationAtInit");
  -[PLBBAgent logTelephonyRegistrationDSDSAtInit](self, "logTelephonyRegistrationDSDSAtInit");

}

uint64_t __43__PLBBAgent_logTelephonyRegistrationAtInit__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883832 = result;
  return result;
}

- (void)logTelephonyActivityAtInit
{
  NSObject *v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[PLBBAgent logTelephonyActivityAtInit]";
    _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __39__PLBBAgent_logTelephonyActivityAtInit__block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v4;
    if (qword_1ED883CD0 != -1)
      dispatch_once(&qword_1ED883CD0, &block);
    if (byte_1ED883833)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent logTelephonyActivityAtInit]", block, v13, v14, v15, v16);
      v5 = (char *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logTelephonyActivityAtInit]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 3091);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBAgent telActMsgHelper](self, "telActMsgHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBAgent registerForAirplaneModeChange](self, "registerForAirplaneModeChange");
  if (-[PLBBAgent isChangedAndSetAirplaneMode](self, "isChangedAndSetAirplaneMode"))
  {
    objc_msgSend(v11, "setAirplaneMode:", airplaneModeCurrent);
    objc_msgSend(v11, "logPointIntervalTelephonyActivityAirplaneModeChange");
  }
  -[PLBBAgent logTelephonyActivityDSDSAtInit](self, "logTelephonyActivityDSDSAtInit");

}

uint64_t __39__PLBBAgent_logTelephonyActivityAtInit__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883833 = result;
  return result;
}

+ (id)getNameBBReport
{
  return CFSTR("BBReport");
}

+ (id)entryIceMsgLite
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v15[0] = *MEMORY[0x1E0D80318];
  v15[1] = v2;
  v16[0] = &unk_1E86532C0;
  v16[1] = CFSTR("refreshRequestHandler");
  v15[2] = *MEMORY[0x1E0D80308];
  v16[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("value_enabled");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("value_history");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("unit");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventNoneBBReport
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E86532D0;
  v14[1] = CFSTR("refreshBBReport");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("ClientName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("ClientAction");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventForwardSDM
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if ((int)objc_msgSend(MEMORY[0x1E0D80020], "kPLBasebandClassOfDevice") < 1003012)
    return MEMORY[0x1E0C9AA70];
  v14[0] = *MEMORY[0x1E0D80298];
  v12 = *MEMORY[0x1E0D80318];
  v13 = &unk_1E86532C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("SDMState");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("subsId");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)refreshBBReport
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t block;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D179C2E0](self, a2);
  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[PLBBAgent refreshBBReport]";
    _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __28__PLBBAgent_refreshBBReport__block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    v17 = v5;
    if (qword_1ED883CD8 != -1)
      dispatch_once(&qword_1ED883CD8, &block);
    if (byte_1ED883834)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent refreshBBReport]", block, v14, v15, v16, v17);
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent refreshBBReport]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 3163);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D7FFA0], "isDevBoard") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D7FFA0], "isModelTrigger"))
  {
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandProto") & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav") & 1) != 0
      || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandIce"))
    {
      if ((int)objc_msgSend(MEMORY[0x1E0D80020], "kPLBasebandClassOfDevice") <= 1003014)
        v12 = 7;
      else
        v12 = 8;
    }
    else
    {
      v12 = 4;
      -[PLBBAgent logEventNoneBBReportBy:withAction:](self, "logEventNoneBBReportBy:withAction:", 4, 3);
    }
    -[PLBBAgent logEventNoneBBReportBy:withAction:](self, "logEventNoneBBReportBy:withAction:", 4, v12);
  }
  objc_autoreleasePoolPop(v3);
}

uint64_t __28__PLBBAgent_refreshBBReport__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883834 = result;
  return result;
}

- (void)logEventNoneBBReportBy:(int64_t)a3 withAction:(int64_t)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD block[5];
  uint8_t buf[4];
  int64_t v41;
  __int16 v42;
  int64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLBBAgent_logEventNoneBBReportBy_withAction___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (qword_1ED883CE0 != -1)
      dispatch_once(&qword_1ED883CE0, block);
    if (byte_1ED883835)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent logEventNoneBBReportBy:withAction:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logEventNoneBBReportBy:withAction:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 3183);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v41 = (int64_t)v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
  {
    v14 = *MEMORY[0x1E0D80388];
    +[PLBBAgent getNameBBReport](PLBBAgent, "getNameBBReport");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("ClientName"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("ClientAction"));

    -[PLBBAgent logEntry:](self, "logEntry:", v17);
  }
  PLLogCommon();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v41 = a3;
    v42 = 2048;
    v43 = a4;
    _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "logEventNoneBBReportBy Client %ld, Action %ld", buf, 0x16u);
  }

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v21 = objc_opt_class();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __47__PLBBAgent_logEventNoneBBReportBy_withAction___block_invoke_1152;
    v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v38[4] = v21;
    if (qword_1ED883CE8 != -1)
      dispatch_once(&qword_1ED883CE8, v38);
    if (byte_1ED883836)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Client: %ld, Action: %ld"), a3, a4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lastPathComponent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logEventNoneBBReportBy:withAction:]");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 3207);

      PLLogCommon();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v41 = (int64_t)v22;
        _os_log_debug_impl(&dword_1CAF47000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  switch(a4)
  {
    case 3:
      -[PLBBAgent commitBBCacheWithClientInfo:](self, "commitBBCacheWithClientInfo:", a3);
      return;
    case 4:
      -[PLBBAgent flushBBCacheWithClientInfo:](self, "flushBBCacheWithClientInfo:", a3);
      return;
    case 7:
      objc_msgSend(MEMORY[0x1E0D7FF40], "sharedABMClient");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v35;
      v36 = 520207;
      goto LABEL_33;
    case 8:
      objc_msgSend(MEMORY[0x1E0D7FF40], "sharedABMClient");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v35;
      v36 = 703488;
LABEL_33:
      objc_msgSend(v35, "triggerPeriodicMetrics:", v36);
      goto LABEL_34;
    default:
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        return;
      v28 = objc_opt_class();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __47__PLBBAgent_logEventNoneBBReportBy_withAction___block_invoke_1157;
      v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v37[4] = v28;
      if (qword_1ED883CF0 != -1)
        dispatch_once(&qword_1ED883CF0, v37);
      if (!byte_1ED883837)
        return;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("***NOOP*** Client: %ld, Action: %ld"), a3, a4);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "lastPathComponent");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logEventNoneBBReportBy:withAction:]");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v32, v33, 3221);

      PLLogCommon();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v41 = (int64_t)v29;
        _os_log_debug_impl(&dword_1CAF47000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

LABEL_34:
      return;
  }
}

uint64_t __47__PLBBAgent_logEventNoneBBReportBy_withAction___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883835 = result;
  return result;
}

uint64_t __47__PLBBAgent_logEventNoneBBReportBy_withAction___block_invoke_1152(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883836 = result;
  return result;
}

uint64_t __47__PLBBAgent_logEventNoneBBReportBy_withAction___block_invoke_1157(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883837 = result;
  return result;
}

- (void)modelLTESLEEPMGRPower:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  _QWORD block[5];
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D80078], "MavRevStringQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003001) & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003002))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ML1State"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("StateDuration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9 / 1000.0;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LightSleepDuration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DeepSleepDuration"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    objc_msgSend(v3, "entryDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80078], "powerModelForOperatorName:", CFSTR("baseband"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("LTE"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("SleepStateAwakePower"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;

    objc_msgSend(v18, "objectForKeyedSubscript:", v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("LTE"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("SleepStateLightSleepPower"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    v28 = v27;

    v29 = 0.0;
    if (v7 > 0.0)
    {
      v30 = v13 / 1000.0;
      v31 = v10 - v13 / 1000.0 - v16 / 1000.0;
      if (v31 >= 0.0 && v30 >= 0.0)
        v29 = v30 * v28 + v31 * v23;
    }
    if (LTESleepMgrStatCumulativeTimestamp)
    {
      objc_msgSend((id)LTESleepMgrStatLastTimestamp, "timeIntervalSince1970");
      v33 = v32;
      objc_msgSend((id)LTESleepMgrStatCumulativeTimestamp, "timeIntervalSince1970");
      v35 = v34;
      objc_msgSend(v17, "timeIntervalSince1970");
      v37 = 0.0;
      if (v33 < v35 && v35 < v36)
      {
        v38 = v36 - v35;
        if (v38 > 0.0)
          v37 = (v29 - *(double *)&LTESleepMgrStatCumulativeEnergy) / v38;
      }
    }
    else
    {
      v37 = 0.0;
      if (v10 > 0.0)
        v37 = v29 / v10;
    }
    LTESleepMgrStatLastEnergy = 0;
    objc_storeStrong((id *)&LTESleepMgrStatLastTimestamp, v17);
    LTESleepMgrStatCumulativeEnergy = 0;
    v39 = (void *)LTESleepMgrStatCumulativeTimestamp;
    LTESleepMgrStatCumulativeTimestamp = 0;

    objc_msgSend(v17, "timeIntervalSince1970");
    v41 = v40;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v42 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __35__PLBBAgent_modelLTESLEEPMGRPower___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v42;
      if (qword_1ED883CF8 != -1)
        dispatch_once(&qword_1ED883CF8, block);
      if (byte_1ED883838)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SleepStats --> Model power: %f, power=%f"), v41, *(_QWORD *)&v37);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "lastPathComponent");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent modelLTESLEEPMGRPower:]");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "logMessage:fromFile:fromFunction:fromLineNumber:", v43, v46, v47, 3320);

        PLLogCommon();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v52 = v43;
          _os_log_debug_impl(&dword_1CAF47000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 21, v17, v37);

  }
}

uint64_t __35__PLBBAgent_modelLTESLEEPMGRPower___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883838 = result;
  return result;
}

- (void)modelStateTransitionPower:(id)a3 rat:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PLBBAgent *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD block[5];
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D80078], "MavRevStringQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMavLeg") & 1) == 0)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("LTE"))
      && ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003002) & 1) != 0
       || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003001)))
    {
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("Connected")))
      {
        v12 = self;
        v13 = 1;
      }
      else
      {
        v12 = self;
        v13 = 0;
      }
      -[PLBBAgent setLteCurrentState:](v12, "setLteCurrentState:", v13);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D80078], "powerModelForOperatorName:", CFSTR("baseband"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "doubleValue");
        v22 = v21;

      }
      else
      {
        v22 = 0.0;
      }
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v23 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __49__PLBBAgent_modelStateTransitionPower_rat_state___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v23;
        if (qword_1ED883D00 != -1)
          dispatch_once(&qword_1ED883D00, block);
        if (byte_1ED883839)
        {
          v24 = (void *)MEMORY[0x1E0CB3940];
          v36 = v14;
          objc_msgSend(v14, "objectForKeyedSubscript:", v11);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", v9);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v10);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", CFSTR("Model RRC state transistion: mavVersion=%@, rat=%@, state=%@, basebandModel=%@"), v11, v9, v10, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "lastPathComponent");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent modelStateTransitionPower:rat:state:]");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 3358);

          PLLogCommon();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v28;
            _os_log_debug_impl(&dword_1CAF47000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v14 = v36;
        }
      }
      objc_msgSend(v8, "entryDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBAgent lastBBProtoPower](self, "lastBBProtoPower");
      objc_msgSend(v35, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 22, v34);

      -[PLBBAgent setLastBBProtoPower:](self, "setLastBBProtoPower:", v22);
    }
  }

}

uint64_t __49__PLBBAgent_modelStateTransitionPower_rat_state___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883839 = result;
  return result;
}

- (void)modelMav10BBHWPower:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  uint64_t j;
  void *v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  uint64_t k;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  unint64_t v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  void *v94;
  void *v95;
  void *v96;
  double v97;
  void *v98;
  double v99;
  double v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  double v105;
  double v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  _QWORD *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  NSObject *v123;
  double v124;
  void *v125;
  void *v126;
  void *v127;
  double v128;
  double v129;
  void *v130;
  uint64_t v131;
  double v132;
  void *v133;
  double v134;
  double v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  double v140;
  uint64_t v141;
  void *v142;
  double v143;
  void *v144;
  void *v145;
  double v146;
  double v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  double v152;
  double v153;
  void *v154;
  double v155;
  double v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  double v161;
  double v162;
  void *v163;
  uint64_t v164;
  double v165;
  void *v166;
  double v167;
  double v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  double v173;
  uint64_t m;
  void *v175;
  double v176;
  void *v177;
  void *v178;
  double v179;
  double v180;
  void *v181;
  double v182;
  double v183;
  void *v184;
  double v185;
  double v186;
  void *v187;
  void *v188;
  void *v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  unint64_t v195;
  double v196;
  double v197;
  void *v198;
  void *v199;
  double v200;
  uint64_t v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  double v206;
  uint64_t v207;
  _QWORD *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  NSObject *v214;
  void *v215;
  void *v216;
  void *v217;
  double v218;
  void *v219;
  double v220;
  double v221;
  void *v222;
  double v223;
  void *v224;
  double v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  double v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  double v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  double v240;
  double v241;
  double v242;
  double v243;
  double v244;
  double v245;
  double v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  double v251;
  double v252;
  void *v253;
  double v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  double v259;
  void *v260;
  double v261;
  double v262;
  void *v263;
  double v264;
  double v265;
  double v266;
  void *v267;
  double v268;
  double v269;
  void *v270;
  double v271;
  double v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  double v277;
  void *v278;
  double v279;
  double v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  double v285;
  double v286;
  void *v287;
  double v288;
  double v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  double v294;
  void *v295;
  double v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  double v301;
  double v302;
  double v303;
  double v304;
  double v305;
  double v306;
  double v307;
  double v308;
  double v309;
  double v310;
  double v311;
  double v312;
  double v313;
  double v314;
  double v315;
  double v316;
  double v317;
  double v318;
  double v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  double v324;
  void *v325;
  double v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  double v331;
  void *v332;
  double v333;
  void *v334;
  void *v335;
  void *v336;
  double v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  double v342;
  double v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  double v348;
  double v349;
  void *v350;
  double v351;
  double v352;
  void *v353;
  double v354;
  double v355;
  void *v356;
  double v357;
  double v358;
  void *v359;
  double v360;
  double v361;
  void *v362;
  double v363;
  double v364;
  void *v365;
  void *v366;
  void *v367;
  double v368;
  double v369;
  unsigned int v370;
  void *v371;
  double v372;
  int v373;
  int v374;
  uint64_t v375;
  uint64_t v376;
  double v377;
  double v378;
  void *v379;
  double v380;
  double v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  double v386;
  uint64_t v387;
  void *v388;
  double v389;
  double v390;
  double v391;
  double v392;
  double v393;
  double v394;
  void *v395;
  double v396;
  uint64_t v397;
  _QWORD *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  NSObject *v404;
  uint64_t v405;
  _QWORD *v406;
  id v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  NSObject *v413;
  void *v414;
  uint64_t v415;
  uint64_t v416;
  void *v417;
  int v418;
  uint64_t v419;
  _QWORD *v420;
  void *v421;
  void *v422;
  void *v423;
  void *v424;
  void *v425;
  NSObject *v426;
  __CFString *v427;
  void *v428;
  double v429;
  double v430;
  void *v431;
  double v432;
  double v433;
  void *v434;
  void *v435;
  double v436;
  double v437;
  double v438;
  double v439;
  double v440;
  double v441;
  void *v442;
  double v443;
  double v444;
  void *v445;
  void *v446;
  void *v447;
  double v448;
  double v449;
  double v450;
  void *v451;
  double v452;
  double v453;
  double v454;
  double v455;
  double v456;
  double v457;
  double v458;
  double v459;
  double v460;
  double v461;
  double v462;
  double v463;
  double v464;
  void *v465;
  double v466;
  double v467;
  void *v468;
  void *v469;
  void *v470;
  void *v471;
  double v472;
  double v473;
  void *v474;
  double v475;
  double v476;
  void *v477;
  void *v478;
  void *v479;
  double v480;
  void *v481;
  void *v482;
  double v483;
  double v484;
  void *v485;
  void *v486;
  void *v487;
  void *v488;
  void *v489;
  void *v490;
  void *v491;
  int v492;
  __CFString *v493;
  __CFString *v494;
  void *v495;
  int v496;
  double v497;
  unint64_t v498;
  void *v499;
  void *v500;
  void *v501;
  void *v502;
  void *v503;
  void *v504;
  double v505;
  void *v506;
  double v507;
  double v508;
  void *v509;
  void *v510;
  void *v511;
  void *v512;
  double v513;
  double v514;
  double v515;
  void *v516;
  void *v517;
  void *v518;
  void *v519;
  void *v520;
  void *v521;
  double v522;
  double v523;
  void *v524;
  double v525;
  double v526;
  void *v527;
  void *v528;
  double v529;
  double v530;
  void *v531;
  void *v532;
  double v533;
  double v534;
  void *v535;
  double v536;
  double v537;
  void *v538;
  void *v539;
  void *v540;
  void *v541;
  double v542;
  double v543;
  double v544;
  double v545;
  double v546;
  void *v547;
  void *v548;
  void *v549;
  void *v550;
  void *v551;
  void *v552;
  void *v553;
  double v554;
  double v555;
  double v556;
  void *v557;
  double v558;
  double v559;
  void *v560;
  void *v561;
  void *v562;
  void *v563;
  double v564;
  double v565;
  double v566;
  double v567;
  double v568;
  void *v569;
  double v570;
  double v571;
  void *v572;
  void *v573;
  void *v574;
  void *v575;
  double v576;
  double v577;
  void *v578;
  double v579;
  double v580;
  void *v581;
  void *v582;
  void *v583;
  void *v584;
  double v585;
  double v586;
  void *v587;
  double v588;
  double v589;
  void *v590;
  void *v591;
  void *v592;
  void *v593;
  double v594;
  double v595;
  double v596;
  double v597;
  double v598;
  double v599;
  uint64_t ii;
  void *v601;
  double v602;
  double v603;
  void *v604;
  void *v605;
  void *v606;
  void *v607;
  double v608;
  void *v609;
  double v610;
  double v611;
  void *v612;
  void *v613;
  void *v614;
  void *v615;
  double v616;
  double v617;
  void *v618;
  double v619;
  double v620;
  void *v621;
  void *v622;
  void *v623;
  void *v624;
  double v625;
  double v626;
  double v627;
  double v628;
  double v629;
  void *v630;
  double v631;
  double v632;
  void *v633;
  void *v634;
  void *v635;
  void *v636;
  double v637;
  double v638;
  void *v639;
  double v640;
  double v641;
  void *v642;
  void *v643;
  void *v644;
  void *v645;
  double v646;
  double v647;
  void *v648;
  double v649;
  double v650;
  void *v651;
  void *v652;
  void *v653;
  void *v654;
  double v655;
  void *v656;
  double v657;
  double v658;
  void *v659;
  void *v660;
  void *v661;
  void *v662;
  double v663;
  double v664;
  void *v665;
  double v666;
  double v667;
  void *v668;
  void *v669;
  void *v670;
  void *v671;
  double v672;
  double v673;
  double v674;
  double v675;
  double v676;
  void *v677;
  uint64_t v678;
  void *v679;
  void *v680;
  void *v681;
  void *v682;
  double v683;
  void *v684;
  double v685;
  double v686;
  void *v687;
  double v688;
  double v689;
  void *v690;
  void *v691;
  void *v692;
  void *v693;
  void *v694;
  void *v695;
  void *v696;
  double v697;
  double v698;
  double v699;
  int v700;
  uint64_t v701;
  uint64_t v702;
  void *v703;
  void *v704;
  void *v705;
  double v706;
  double v707;
  void *v708;
  double v709;
  double v710;
  void *v711;
  double v712;
  double v713;
  void *v714;
  void *v715;
  double v716;
  double v717;
  void *v718;
  double v719;
  double v720;
  void *v721;
  void *v722;
  void *v723;
  void *v724;
  void *v725;
  double v726;
  double v727;
  double v728;
  void *v729;
  uint64_t v730;
  void *v731;
  uint64_t v732;
  void *v733;
  void *v734;
  void *v735;
  void *v736;
  double v737;
  double v738;
  void *v739;
  double v740;
  double v741;
  void *v742;
  double v743;
  double v744;
  void *v745;
  void *v746;
  void *v747;
  void *v748;
  double v749;
  double v750;
  double v751;
  uint64_t v752;
  double v753;
  double v754;
  void *v755;
  double v756;
  double v757;
  void *v758;
  void *v759;
  void *v760;
  void *v761;
  void *v762;
  void *v763;
  double v764;
  uint64_t jj;
  void *v766;
  double v767;
  double v768;
  uint64_t v769;
  double v770;
  void *v771;
  double v772;
  double v773;
  void *v774;
  void *v775;
  void *v776;
  void *v777;
  void *v778;
  double v779;
  void *v780;
  double v781;
  double v782;
  void *v783;
  void *v784;
  void *v785;
  void *v786;
  void *v787;
  double v788;
  double v789;
  void *v790;
  double v791;
  uint64_t v792;
  double v793;
  void *v794;
  double v795;
  double v796;
  void *v797;
  void *v798;
  void *v799;
  void *v800;
  void *v801;
  double v802;
  void *v803;
  double v804;
  double v805;
  void *v806;
  void *v807;
  void *v808;
  void *v809;
  void *v810;
  double v811;
  void *v812;
  uint64_t kk;
  void *v814;
  double v815;
  double v816;
  void *v817;
  void *v818;
  void *v819;
  void *v820;
  void *v821;
  double v822;
  double v823;
  double v824;
  double v825;
  double v826;
  void *v827;
  void *v828;
  double v829;
  double v830;
  void *v831;
  double v832;
  double v833;
  double v834;
  double v835;
  void *v836;
  double v837;
  uint64_t v841;
  _QWORD *v842;
  void *v843;
  void *v844;
  void *v845;
  void *v846;
  void *v847;
  NSObject *v848;
  void *v849;
  void *v850;
  double v851;
  double v852;
  void *v853;
  void *v854;
  void *v855;
  void *v856;
  double v857;
  double v858;
  double v859;
  void *v860;
  double v861;
  double v862;
  void *v863;
  void *v864;
  void *v865;
  void *v866;
  double v867;
  double v868;
  void *v869;
  double v870;
  double v871;
  void *v872;
  void *v873;
  void *v874;
  void *v875;
  double v876;
  double v877;
  void *v878;
  double v879;
  double v880;
  void *v881;
  void *v882;
  void *v883;
  void *v884;
  double v885;
  double v886;
  void *v887;
  double v888;
  double v889;
  void *v890;
  void *v891;
  void *v892;
  void *v893;
  double v894;
  double v895;
  void *v896;
  double v897;
  double v898;
  void *v899;
  void *v900;
  void *v901;
  void *v902;
  double v903;
  double v904;
  void *v905;
  void *v906;
  void *v907;
  void *v908;
  double v909;
  double v910;
  void *v911;
  double v912;
  double v913;
  void *v914;
  void *v915;
  void *v916;
  void *v917;
  double v918;
  double v919;
  void *v920;
  double v921;
  double v922;
  void *v923;
  void *v924;
  void *v925;
  void *v926;
  double v927;
  double v928;
  void *v929;
  void *v930;
  void *v931;
  void *v932;
  double v933;
  double v934;
  void *v935;
  double v936;
  void *v937;
  void *v938;
  void *v939;
  void *v940;
  double v941;
  void *v942;
  void *v943;
  double v944;
  double v945;
  void *v946;
  double v947;
  double v948;
  void *v949;
  double v950;
  double v951;
  void *v952;
  void *v953;
  void *v954;
  double v955;
  double v956;
  void *v957;
  uint64_t v958;
  double v959;
  void *v960;
  double v961;
  double v962;
  void *v963;
  void *v964;
  void *v965;
  void *v966;
  double v967;
  uint64_t n;
  void *v969;
  double v970;
  double v971;
  double v972;
  double v973;
  void *v974;
  double v975;
  double v976;
  void *v977;
  double v978;
  double v979;
  void *v980;
  double v981;
  double v982;
  void *v983;
  double v984;
  double v985;
  void *v986;
  double v987;
  double v988;
  void *v989;
  double v990;
  double v991;
  void *v992;
  double v993;
  double v994;
  void *v995;
  double v996;
  double v997;
  void *v998;
  double v999;
  double v1000;
  double v1001;
  double v1002;
  double v1003;
  double v1004;
  double v1005;
  double v1006;
  double v1007;
  double v1008;
  double v1010;
  uint64_t v1011;
  _QWORD *v1012;
  id v1013;
  void *v1014;
  void *v1015;
  void *v1016;
  void *v1017;
  void *v1018;
  NSObject *v1019;
  void *v1020;
  uint64_t v1021;
  _QWORD *v1022;
  id v1023;
  void *v1024;
  void *v1025;
  void *v1026;
  void *v1027;
  void *v1028;
  NSObject *v1029;
  void *v1030;
  void *v1031;
  void *v1032;
  void *v1033;
  void *v1034;
  void *v1035;
  void *v1036;
  void *v1037;
  void *v1038;
  void *v1039;
  void *v1040;
  void *v1041;
  void *v1042;
  void *v1043;
  void *v1044;
  void *v1045;
  void *v1046;
  void *v1047;
  void *v1048;
  void *v1049;
  void *v1050;
  void *v1051;
  void *v1052;
  double v1053;
  void *v1054;
  double v1055;
  void *v1056;
  double v1057;
  double v1058;
  double v1059;
  double v1060;
  void *v1061;
  void *v1062;
  double v1063;
  void *v1064;
  void *v1065;
  void *v1066;
  double v1067;
  void *v1068;
  void *v1069;
  void *v1070;
  double v1071;
  void *v1072;
  void *v1073;
  void *v1074;
  double v1075;
  void *v1076;
  void *v1077;
  double v1078;
  unsigned int v1079;
  void *v1080;
  void *v1081;
  double v1082;
  double v1083;
  void *v1084;
  void *v1085;
  double v1086;
  double v1087;
  void *v1088;
  void *v1089;
  double v1090;
  double v1091;
  double v1092;
  void *v1093;
  double v1094;
  double v1095;
  void *v1096;
  double v1097;
  void *v1098;
  void *v1099;
  void *v1100;
  double v1101;
  double v1102;
  void *v1103;
  void *v1104;
  __CFString *v1105;
  void *v1106;
  void *v1107;
  void *v1108;
  void *v1109;
  double v1110;
  void *v1111;
  double v1112;
  double v1113;
  double v1114;
  void *v1115;
  double v1116;
  void *v1117;
  double v1118;
  void *v1119;
  void *v1120;
  void *v1121;
  void *v1122;
  double v1123;
  double v1124;
  double v1125;
  double v1126;
  double v1127;
  double v1128;
  void *v1129;
  void *v1130;
  void *v1131;
  void *v1132;
  double v1133;
  double v1134;
  id v1135;
  id v1136;
  void *v1138;
  uint64_t v1139;
  double v1140;
  id v1141;
  id v1142;
  id v1143;
  id v1144;
  double v1145;
  id v1146;
  void *v1147;
  void *v1148;
  double v1149;
  void *v1150;
  void *v1151;
  void *v1152;
  void *v1153;
  double v1154;
  void *v1155;
  __CFString *v1156;
  double v1157;
  void *v1158;
  void *v1159;
  void *v1160;
  void *v1161;
  void *v1162;
  void *v1163;
  void *v1164;
  void *v1165;
  void *v1166;
  void *v1167;
  void *v1168;
  void *v1169;
  void *v1170;
  _QWORD v1171[5];
  _QWORD v1172[5];
  _QWORD v1173[5];
  _QWORD v1174[5];
  _QWORD v1175[5];
  _QWORD v1176[5];
  _QWORD v1177[5];
  _QWORD v1178[5];
  __int128 v1179;
  __int128 v1180;
  __int128 v1181;
  __int128 v1182;
  uint8_t buf[4];
  void *v1184;
  _BYTE v1185[128];
  uint64_t v1186;

  v1186 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOtherPerRAT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v1146 = v3;
  if (v4)
  {
    v1182 = 0u;
    v1180 = 0u;
    v1181 = 0u;
    v1179 = 0u;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOtherPerRAT"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v1179, v1185, 16);
    if (v6)
    {
      v7 = v6;
      v1167 = 0;
      v1166 = 0;
      v1169 = 0;
      v1168 = 0;
      v1170 = 0;
      v8 = 0;
      v9 = *(_QWORD *)v1180;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v1180 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v1179 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("RadioTech"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "intValue");

          v13 = v8;
          v14 = v11;
          switch((int)v11)
          {
            case 0:
              goto LABEL_14;
            case 1:
              v13 = v1170;
              v1170 = v11;
              goto LABEL_13;
            case 2:
              v13 = v1168;
              v1168 = v11;
              goto LABEL_13;
            case 3:
              v13 = v1169;
              v1169 = v11;
              goto LABEL_13;
            case 4:
              v13 = v1166;
              v1166 = v11;
              goto LABEL_13;
            case 5:
              v13 = v1167;
              v1167 = v11;
LABEL_13:
              v14 = v8;
LABEL_14:
              v15 = v11;

              v8 = v14;
              break;
            default:
              continue;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v1179, v1185, 16);
      }
      while (v7);
    }
    else
    {
      v1167 = 0;
      v1166 = 0;
      v1169 = 0;
      v1168 = 0;
      v1170 = 0;
      v8 = 0;
    }

    v3 = v1146;
  }
  else
  {
    v1167 = 0;
    v1166 = 0;
    v1169 = 0;
    v1168 = 0;
    v1170 = 0;
    v8 = 0;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_BBMavHwRf1x"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_BBMavHwRf1x"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v1142 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1142 = 0;
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_BBMavHwRfHDR"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_BBMavHwRfHDR"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
    v1141 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1141 = 0;
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_BBMavHwRfGSM"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_BBMavHwRfGSM"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
    v1135 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1135 = 0;
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_BBMavHwRfWCDMA"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_BBMavHwRfWCDMA"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = 0;
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_BBMavHwRfLTE"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_BBMavHwRfLTE"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
    v1143 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1143 = 0;
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_BBMavHwRfTDS"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_BBMavHwRfTDS"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
    v1144 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v1144 = 0;
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOther"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "entryDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v1131 = v30;
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("LogDuration"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "doubleValue");
  v34 = v33;

  objc_msgSend(MEMORY[0x1E0D80078], "MavRevStringQuery");
  v1165 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0D80078], "powerModelForOperatorName:", CFSTR("baseband"));
    v1116 = 0.0;
    v1124 = 0.0;
    v1125 = 0.0;
    v35 = 0.0;
    v1136 = v24;
    v1115 = v31;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v1164 = v36;
    if (v1142)
    {
      objc_msgSend(v1142, "objectForKeyedSubscript:", CFSTR("DTxOn"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "doubleValue");
      v39 = v38;
      objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("CDMA2K"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("DTxOn"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "doubleValue");
      v44 = v39 * v43;

      objc_msgSend(v1142, "objectForKeyedSubscript:", CFSTR("DurationInCallType"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectAtIndexedSubscript:", 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "doubleValue");
      v48 = v47;
      objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("CDMA2K"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("Voice"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "doubleValue");
      v53 = v48 * v52;

      objc_msgSend(v45, "objectAtIndexedSubscript:", 2);
      v1153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1153, "doubleValue");
      v55 = v54;
      objc_msgSend(v45, "objectAtIndexedSubscript:", 3);
      v56 = v36;
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "doubleValue");
      v59 = v55 + v58;
      objc_msgSend(v45, "objectAtIndexedSubscript:", 4);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "doubleValue");
      v62 = v59 + v61;
      v1158 = v45;
      objc_msgSend(v45, "objectAtIndexedSubscript:", 5);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "doubleValue");
      v65 = v62 + v64;
      objc_msgSend(v56, "objectForKeyedSubscript:", v1165);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("CDMA2K"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("Connected"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "doubleValue");
      v70 = v65 * v69;

      v71 = 0.0;
      v72 = 0.0;
      if (v8)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TxPowerHist"));
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        for (j = 0; j != 12; ++j)
        {
          objc_msgSend(v73, "objectAtIndexedSubscript:", j);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "doubleValue");
          v77 = v76;
          objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("CDMA2K"));
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("txPower"));
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "objectAtIndexedSubscript:", j);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "doubleValue");
          v72 = v72 + v77 * v82;

        }
        v35 = 0.0;
        for (k = 8; k != 12; ++k)
        {
          objc_msgSend(v73, "objectAtIndexedSubscript:", k);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "doubleValue");
          v35 = v35 + v85;

        }
        v3 = v1146;
      }
      v86 = v44 / v34 + v72 / v34;
      if (v86 <= 0.0)
      {
        v88 = 0.0;
        v24 = v1136;
        v36 = v1164;
      }
      else
      {
        v87 = v53 + v70;
        v88 = 0.0;
        v24 = v1136;
        v36 = v1164;
        if (v53 + v70 > 0.0)
        {
          v88 = v53 * v86 / v87;
          v71 = v70 * v86 / v87;
        }
      }
      v1124 = v70 / v34 + v71;
      v1125 = v53 / v34 + v88;

    }
    v89 = 0x1E0D7F000uLL;
    v1145 = v34;
    if (v1141 && v1170)
    {
      objc_msgSend(v1170, "objectForKeyedSubscript:", CFSTR("ProtocolStateHist"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "objectAtIndexedSubscript:", 8);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "doubleValue");
      v93 = v92;

      objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("1xEVDO"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("Connected"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "doubleValue");
      v1154 = v97;

      objc_msgSend(v1141, "objectForKeyedSubscript:", CFSTR("SDTXOnFrames"));
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "doubleValue");
      v100 = v99;

      objc_msgSend(v1141, "objectForKeyedSubscript:", CFSTR("SDTXOffFrames"));
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "doubleValue");
      v103 = v102;

      objc_msgSend(v1141, "objectForKeyedSubscript:", CFSTR("LTXOnFrames"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "doubleValue");
      v106 = v105;

      objc_msgSend(v1141, "objectForKeyedSubscript:", CFSTR("LTXOffFrames"));
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "doubleValue");
      v109 = v108;

      objc_msgSend(v1141, "objectForKeyedSubscript:", CFSTR("TTXOnFrames"));
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "doubleValue");
      v112 = v111;

      objc_msgSend(v1141, "objectForKeyedSubscript:", CFSTR("TTXOffFrames"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "doubleValue");
      v115 = v114;

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v116 = objc_opt_class();
        v1178[0] = MEMORY[0x1E0C809B0];
        v1178[1] = 3221225472;
        v1178[2] = __33__PLBBAgent_modelMav10BBHWPower___block_invoke;
        v1178[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v1178[4] = v116;
        v117 = v1178;
        if (qword_1ED883D08 != -1)
          dispatch_once(&qword_1ED883D08, v117);

        if (byte_1ED88383A)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EVDO stats: %f %f %f %f %f %f"), *(_QWORD *)&v100, v103, *(_QWORD *)&v106, v109, v112, v115);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "lastPathComponent");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent modelMav10BBHWPower:]");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "logMessage:fromFile:fromFunction:fromLineNumber:", v118, v121, v122, 3588);

          PLLogCommon();
          v123 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v123, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v1184 = v118;
            _os_log_debug_impl(&dword_1CAF47000, v123, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      v124 = v93 * v1154;
      v1159 = v90;
      if (v100 + v106 <= v93)
      {
        objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "objectForKeyedSubscript:", CFSTR("1xEVDO"));
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("DTXSavings"));
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "doubleValue");
        v129 = (v100 + v106) * v128;

        v124 = v124 - v129;
      }
      v34 = v1145;
      objc_msgSend(v1170, "objectForKeyedSubscript:", CFSTR("TxPowerHist"));
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = 0;
      v132 = 0.0;
      do
      {
        objc_msgSend(v130, "objectAtIndexedSubscript:", v131);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "doubleValue");
        v135 = v134;
        objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "objectForKeyedSubscript:", CFSTR("1xEVDO"));
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("txPower"));
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v138, "objectAtIndexedSubscript:", v131);
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v139, "doubleValue");
        v132 = v132 + v135 * v140;

        ++v131;
      }
      while (v131 != 12);
      v141 = 8;
      v89 = 0x1E0D7F000;
      do
      {
        objc_msgSend(v130, "objectAtIndexedSubscript:", v141);
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v142, "doubleValue");
        v35 = v35 + v143;

        ++v141;
      }
      while (v141 != 12);
      v1116 = v124 / v1145 + v132 / v1145;

      v3 = v1146;
      v24 = v1136;
      v36 = v1164;
    }
    v1126 = 0.0;
    if (v1135)
    {
      objc_msgSend(v1135, "objectForKeyedSubscript:", CFSTR("ConnStates"));
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "objectAtIndexedSubscript:", 1);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "doubleValue");
      v147 = v146;
      objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "objectForKeyedSubscript:", CFSTR("GSM"));
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v149, "objectForKeyedSubscript:", CFSTR("ConnStates"));
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "objectAtIndexedSubscript:", 1);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "doubleValue");
      v153 = v147 * v152;

      v1160 = v144;
      objc_msgSend(v144, "objectAtIndexedSubscript:", 2);
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "doubleValue");
      v156 = v155;
      objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "objectForKeyedSubscript:", CFSTR("GSM"));
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("ConnStates"));
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "objectAtIndexedSubscript:", 2);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "doubleValue");
      v162 = v156 * v161;

      if (v1168)
      {
        objc_msgSend(v1168, "objectForKeyedSubscript:", CFSTR("TxPowerHist"));
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        v164 = 0;
        v165 = 0.0;
        do
        {
          objc_msgSend(v163, "objectAtIndexedSubscript:", v164);
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v166, "doubleValue");
          v168 = v167;
          objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v169, "objectForKeyedSubscript:", CFSTR("GSM"));
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v170, "objectForKeyedSubscript:", CFSTR("txPower"));
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v171, "objectAtIndexedSubscript:", v164);
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v172, "doubleValue");
          v165 = v165 + v168 * v173;

          ++v164;
        }
        while (v164 != 12);
        for (m = 8; m != 12; ++m)
        {
          objc_msgSend(v163, "objectAtIndexedSubscript:", m);
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v175, "doubleValue");
          v35 = v35 + v176;

        }
        objc_msgSend(v1168, "objectForKeyedSubscript:", CFSTR("RSSIModeCount"));
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "objectAtIndexedSubscript:", 1);
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v178, "doubleValue");
        v180 = v179;
        objc_msgSend(v177, "objectAtIndexedSubscript:", 2);
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v181, "doubleValue");
        v183 = v180 + v182;
        objc_msgSend(v177, "objectAtIndexedSubscript:", 3);
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v184, "doubleValue");
        v186 = v183 + v185;
        objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v187, "objectForKeyedSubscript:", CFSTR("GSM"));
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v188, "objectForKeyedSubscript:", CFSTR("RX"));
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v189, "doubleValue");
        v191 = v186 * v190;

        v192 = v165 / v34 + v191 / v34;
        v193 = 0.0;
        if (v192 <= 0.0)
        {
          v194 = 0.0;
        }
        else
        {
          v193 = v153 * v192 / (v153 + v162);
          if (v153 + v162 > 0.0)
          {
            v194 = v162 * v192 / (v153 + v162);
          }
          else
          {
            v193 = 0.0;
            v194 = 0.0;
          }
        }
        v3 = v1146;
        v24 = v1136;
        v36 = v1164;
        v89 = 0x1E0D7F000uLL;
      }
      else
      {
        v193 = 0.0;
        v194 = 0.0;
        v3 = v1146;
        v36 = v1164;
        v89 = 0x1E0D7F000;
        v24 = v1136;
      }
      v1113 = v162 / v34 + v194;
      v1114 = v153 / v34 + v193;

    }
    else
    {
      v1113 = 0.0;
      v1114 = 0.0;
    }
    v195 = 0x1E0D80000;
    if (v24)
    {
      v196 = 0.0;
      v197 = 0.0;
      if (v1169)
      {
        objc_msgSend(v1169, "objectForKeyedSubscript:", CFSTR("ProtocolStateHist"));
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v198, "objectAtIndexedSubscript:", 6);
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v199, "doubleValue");
        v197 = v200;

      }
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("TxPwrBktArr"));
      v201 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("DurationInPsRabType"));
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("DurationInRabMode"));
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("SCEqTypeDuration"));
      v1155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("DCEqTypeDuration"));
      v1147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("SCQSetNumCell"));
      v1138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("DCQSetNumCell"));
      v1132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("TimeInCarrierMode"));
      v1150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("FetCnt"));
      v204 = (void *)objc_claimAutoreleasedReturnValue();

      if (v204)
      {
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("FetCnt"));
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v205, "doubleValue");
        v196 = v206;

      }
      v1161 = (void *)v201;
      v1106 = v203;
      if (objc_msgSend(*(id *)(v89 + 4000), "debugEnabled"))
      {
        v207 = objc_opt_class();
        v1177[0] = MEMORY[0x1E0C809B0];
        v1177[1] = 3221225472;
        v1177[2] = __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1178;
        v1177[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v1177[4] = v207;
        v208 = v1177;
        if (qword_1ED883D10 != -1)
          dispatch_once(&qword_1ED883D10, v208);

        if (byte_1ED88383B)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DurationInRabType = %@, DurationInRabMode = %@, SCEqTypeDuration = %@, DCEqTypeDuration = %@, SCQSetNumCell = %@, DCQSetNumCell = %@, TimeInCarrierMode=%@, fetCount=%f"), v202, v203, v1155, v1147, v1138, v1132, v1150, *(_QWORD *)&v196);
          v209 = (void *)objc_claimAutoreleasedReturnValue();
          v210 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
          v211 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v211, "lastPathComponent");
          v212 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent modelMav10BBHWPower:]");
          v213 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v210, "logMessage:fromFile:fromFunction:fromLineNumber:", v209, v212, v213, 3698);

          PLLogCommon();
          v214 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v214, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v1184 = v209;
            _os_log_debug_impl(&dword_1CAF47000, v214, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v203 = v1106;
        }
      }
      v1101 = v196;
      objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v215, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v216, "objectForKeyedSubscript:", CFSTR("Cell_FACH"));
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v217, "doubleValue");
      v1097 = v218;

      objc_msgSend(v203, "objectAtIndexedSubscript:", 1);
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v219, "doubleValue");
      v221 = v220;

      objc_msgSend(v203, "objectAtIndexedSubscript:", 2);
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v222, "doubleValue");
      v1128 = v223;

      objc_msgSend(v203, "objectAtIndexedSubscript:", 3);
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v224, "doubleValue");
      v1127 = v225;

      objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v226, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v227, "objectForKeyedSubscript:", CFSTR("RabMode"));
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v228, "objectAtIndexedSubscript:", 1);
      v229 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v229, "doubleValue");
      v1094 = v230;

      objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v231, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v232, "objectForKeyedSubscript:", CFSTR("RabMode"));
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v233, "objectAtIndexedSubscript:", 2);
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v234, "doubleValue");
      v1091 = v235;

      objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v236, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v237, "objectForKeyedSubscript:", CFSTR("RabMode"));
      v238 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v238, "objectAtIndexedSubscript:", 3);
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v239, "doubleValue");
      v1086 = v240;

      objc_msgSend(v202, "objectAtIndexedSubscript:", 1);
      v1120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1120, "doubleValue");
      v242 = v241;
      objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
      v1117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1117, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v1074 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1074, "objectForKeyedSubscript:", CFSTR("RabType"));
      v1070 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1070, "objectAtIndexedSubscript:", 1);
      v1066 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1066, "doubleValue");
      v244 = v243;
      objc_msgSend(v202, "objectAtIndexedSubscript:", 2);
      v1062 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1062, "doubleValue");
      v246 = v245;
      objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v247, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v248, "objectForKeyedSubscript:", CFSTR("RabType"));
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v249, "objectAtIndexedSubscript:", 2);
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v250, "doubleValue");
      v252 = v246 * v251;
      v1111 = v202;
      objc_msgSend(v202, "objectAtIndexedSubscript:", 3);
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v253, "doubleValue");
      v1082 = v254;
      objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v255, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v256, "objectForKeyedSubscript:", CFSTR("RabType"));
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v257, "objectAtIndexedSubscript:", 3);
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v258, "doubleValue");
      v1078 = v259;

      objc_msgSend(v1155, "objectAtIndexedSubscript:", 2);
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v260, "doubleValue");
      v262 = v261;
      objc_msgSend(v1147, "objectAtIndexedSubscript:", 2);
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v263, "doubleValue");
      v265 = v262 - v264;

      v1118 = 0.0;
      v266 = 0.0;
      if (v265 > 0.0)
      {
        objc_msgSend(v1155, "objectAtIndexedSubscript:", 2);
        v267 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v267, "doubleValue");
        v269 = v268;
        objc_msgSend(v1147, "objectAtIndexedSubscript:", 2);
        v270 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v270, "doubleValue");
        v272 = v269 - v271;
        objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
        v273 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v273, "objectForKeyedSubscript:", CFSTR("WCDMA"));
        v274 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v274, "objectForKeyedSubscript:", CFSTR("SCeq"));
        v275 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v275, "objectAtIndexedSubscript:", 1);
        v276 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v276, "doubleValue");
        v266 = v272 * v277 + 0.0;

      }
      v1075 = v252 + v242 * v244;
      objc_msgSend(v1147, "objectAtIndexedSubscript:", 2);
      v278 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v278, "doubleValue");
      v280 = v279;
      objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
      v281 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v281, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v282 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v282, "objectForKeyedSubscript:", CFSTR("DCeq"));
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v283, "objectAtIndexedSubscript:", 2);
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v284, "doubleValue");
      v286 = v266 + v280 * v285;

      objc_msgSend(v1138, "objectAtIndexedSubscript:", 2);
      v287 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v287, "doubleValue");
      v289 = v288;
      objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
      v290 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v290, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v291 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v291, "objectForKeyedSubscript:", CFSTR("SCeq"));
      v292 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v292, "objectAtIndexedSubscript:", 1);
      v293 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v293, "doubleValue");
      v1071 = v286 + v289 * v294;

      objc_msgSend(v1138, "objectAtIndexedSubscript:", 3);
      v295 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v295, "doubleValue");
      v1067 = v296;
      objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
      v297 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v297, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v298 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v298, "objectForKeyedSubscript:", CFSTR("SCeq"));
      v299 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v299, "objectAtIndexedSubscript:", 2);
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v300, "doubleValue");
      v1063 = v301;

      objc_msgSend(v1138, "objectAtIndexedSubscript:", 1);
      v1121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1121, "doubleValue");
      v303 = v302;
      objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
      v1056 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1056, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v1054 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1054, "objectForKeyedSubscript:", CFSTR("SCqset"));
      v1052 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1052, "objectAtIndexedSubscript:", 1);
      v1051 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1051, "doubleValue");
      v305 = v304;
      objc_msgSend(v1138, "objectAtIndexedSubscript:", 2);
      v1050 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1050, "doubleValue");
      v307 = v306;
      objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
      v1049 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1049, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v1048 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1048, "objectForKeyedSubscript:", CFSTR("SCqset"));
      v1047 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1047, "objectAtIndexedSubscript:", 2);
      v1046 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1046, "doubleValue");
      v309 = v307 * v308 + v303 * v305;
      objc_msgSend(v1138, "objectAtIndexedSubscript:", 3);
      v1045 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1045, "doubleValue");
      v311 = v310;
      objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
      v1044 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1044, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v1043 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1043, "objectForKeyedSubscript:", CFSTR("SCqset"));
      v1042 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1042, "objectAtIndexedSubscript:", 3);
      v1041 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1041, "doubleValue");
      v313 = v309 + v311 * v312;
      objc_msgSend(v1132, "objectAtIndexedSubscript:", 1);
      v1040 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1040, "doubleValue");
      v315 = v314;
      objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
      v1039 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1039, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v1038 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1038, "objectForKeyedSubscript:", CFSTR("DCqset"));
      v1037 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1037, "objectAtIndexedSubscript:", 1);
      v1036 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1036, "doubleValue");
      v317 = v313 + v315 * v316;
      objc_msgSend(v1132, "objectAtIndexedSubscript:", 2);
      v1035 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1035, "doubleValue");
      v319 = v318;
      objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
      v320 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v320, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v321 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v321, "objectForKeyedSubscript:", CFSTR("DCqset"));
      v322 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v322, "objectAtIndexedSubscript:", 2);
      v323 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v323, "doubleValue");
      v1060 = v317 + v319 * v324;
      objc_msgSend(v1132, "objectAtIndexedSubscript:", 3);
      v325 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v325, "doubleValue");
      v1059 = v326;
      objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
      v327 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v327, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v328 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v328, "objectForKeyedSubscript:", CFSTR("DCqset"));
      v329 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v329, "objectAtIndexedSubscript:", 3);
      v330 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v330, "doubleValue");
      v1058 = v331;

      objc_msgSend(v1150, "objectAtIndexedSubscript:", 1);
      v332 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v332, "doubleValue");
      v1057 = v333;
      objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
      v334 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v334, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v335 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v335, "objectForKeyedSubscript:", CFSTR("DC"));
      v336 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v336, "doubleValue");
      v1055 = v337;

      objc_msgSend(v1169, "objectForKeyedSubscript:", CFSTR("RSSIModeCount"));
      v1122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
      v338 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v338, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v339 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v339, "objectForKeyedSubscript:", CFSTR("RXD"));
      v340 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v340, "objectForKeyedSubscript:", CFSTR("DC"));
      v341 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v341, "doubleValue");
      v343 = v342;

      objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
      v344 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v344, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v345 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v345, "objectForKeyedSubscript:", CFSTR("RXD"));
      v346 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v346, "objectForKeyedSubscript:", CFSTR("SC"));
      v347 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v347, "doubleValue");
      v349 = v348;

      objc_msgSend(v1150, "objectAtIndexedSubscript:", 0);
      v350 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v350, "doubleValue");
      v352 = v351;
      objc_msgSend(v1150, "objectAtIndexedSubscript:", 1);
      v353 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v353, "doubleValue");
      v355 = v352 + v354;

      if (v355 > 0.0)
      {
        objc_msgSend(v1122, "objectAtIndexedSubscript:", 3);
        v356 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v356, "doubleValue");
        v358 = v357;
        objc_msgSend(v1150, "objectAtIndexedSubscript:", 0);
        v359 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v359, "doubleValue");
        v361 = v360 / v355;
        objc_msgSend(v1150, "objectAtIndexedSubscript:", 1);
        v362 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v362, "doubleValue");
        v1118 = v358 * (v343 * (v363 / v355) + v349 * v361);

      }
      v1053 = v197 * v1097;
      v364 = v1075 + v1082 * v1078;
      objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
      v365 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v366 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v366, "objectForKeyedSubscript:", CFSTR("FetCnt"));
      v367 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v367, "doubleValue");
      v369 = v1101 * v368;

      if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003003) & 1) != 0)
      {
        v370 = 12;
        v1079 = 8;
        v371 = v1161;
      }
      else
      {
        v370 = 12;
        v371 = v1161;
        if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003004) & 1) != 0)
        {
          v1079 = 8;
        }
        else
        {
          v373 = objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003005);
          if (v373)
            v374 = 12;
          else
            v374 = 8;
          v1079 = v374;
          if (v373)
            v370 = 16;
          else
            v370 = 12;
        }
      }
      v375 = 0;
      v1102 = v221 * v1094 / v1145;
      v1092 = v1128 * v1091 / v1145;
      v1095 = v1053 / v1145;
      v1083 = v364 / v1145;
      v1087 = v1127 * v1086 / v1145;
      v376 = v370;
      v377 = 0.0;
      v378 = v369 / v1145;
      do
      {
        objc_msgSend(v371, "objectAtIndexedSubscript:", v375);
        v379 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v379, "doubleValue");
        v381 = v380;
        objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
        v382 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v382, "objectForKeyedSubscript:", CFSTR("WCDMA"));
        v383 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v383, "objectForKeyedSubscript:", CFSTR("txPower"));
        v384 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v384, "objectAtIndexedSubscript:", v375);
        v385 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v385, "doubleValue");
        v377 = v377 + v381 * v386;

        v371 = v1161;
        ++v375;
      }
      while (v376 != v375);
      if (v1079 >= v376)
      {
        v3 = v1146;
        v24 = v1136;
        v36 = v1164;
        v89 = 0x1E0D7F000uLL;
      }
      else
      {
        v387 = v1079;
        v3 = v1146;
        v24 = v1136;
        v36 = v1164;
        v89 = 0x1E0D7F000;
        do
        {
          objc_msgSend(v1161, "objectAtIndexedSubscript:", v387);
          v388 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v388, "doubleValue");
          v35 = v35 + v389;

          ++v387;
        }
        while (v376 != v387);
      }
      v390 = v1083
           + (v1071 + v1067 * v1063) / v1145
           + (v1060 + v1059 * v1058) / v1145
           + v1057 * v1055 / v1145
           + v1118 / v1145
           + v377 / v1145;
      v391 = 0.0;
      if (v390 <= v378)
        v392 = 0.0;
      else
        v392 = v378;
      v393 = v221 + v1128 + v1127;
      v394 = 0.0;
      v195 = 0x1E0D80000;
      v395 = v1111;
      if (v393 > 0.0)
      {
        v396 = v390 - v392;
        if (v221 + v1127 > 0.0)
          v391 = (v221 + v1127 * 0.5) * v396 / v393;
        if (v1128 + v1127 > 0.0)
          v394 = (v1128 + v1127 * 0.5) * v396 / v393;
      }
      v372 = v1095 + v1092 + v1087 + v394;
      v34 = v1145;
      if (objc_msgSend(*(id *)(v89 + 4000), "debugEnabled"))
      {
        v397 = objc_opt_class();
        v1176[0] = MEMORY[0x1E0C809B0];
        v1176[1] = 3221225472;
        v1176[2] = __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1183;
        v1176[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v1176[4] = v397;
        v398 = v1176;
        if (qword_1ED883D18 != -1)
          dispatch_once(&qword_1ED883D18, v398);

        if (byte_1ED88383C)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wcdmaDataPower = %f, wcdmaFACHPower = %f, wcdmaPSonlyPower = %f, wcdmaMRABPower = %f, wcdmaDataAdder = %f"), *(_QWORD *)&v372, *(_QWORD *)&v1095, *(_QWORD *)&v1092, *(_QWORD *)&v1087, *(_QWORD *)&v394);
          v399 = (void *)objc_claimAutoreleasedReturnValue();
          v400 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
          v401 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v401, "lastPathComponent");
          v402 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent modelMav10BBHWPower:]");
          v403 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v400, "logMessage:fromFile:fromFunction:fromLineNumber:", v399, v402, v403, 3847);

          PLLogCommon();
          v404 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v404, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v1184 = v399;
            _os_log_debug_impl(&dword_1CAF47000, v404, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v195 = 0x1E0D80000;
          v371 = v1161;
          v24 = v1136;
        }
      }
      v1126 = v1102 + v391;
      if (objc_msgSend(*(id *)(v89 + 4000), "debugEnabled"))
      {
        v405 = objc_opt_class();
        v1175[0] = MEMORY[0x1E0C809B0];
        v1175[1] = 3221225472;
        v1175[2] = __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1188;
        v1175[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v1175[4] = v405;
        v406 = v1175;
        if (qword_1ED883D20 != -1)
          dispatch_once(&qword_1ED883D20, v406);

        if (byte_1ED88383D)
        {
          v407 = v24;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wcdmaVoicePower = %f, wcdmaCSonlyPower = %f, wcdmaVoiceAdder = %f"), *(_QWORD *)&v1126, *(_QWORD *)&v1102, *(_QWORD *)&v391);
          v408 = (void *)objc_claimAutoreleasedReturnValue();
          v409 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
          v410 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v410, "lastPathComponent");
          v411 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent modelMav10BBHWPower:]");
          v412 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v409, "logMessage:fromFile:fromFunction:fromLineNumber:", v408, v411, v412, 3848);

          PLLogCommon();
          v413 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v413, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v1184 = v408;
            _os_log_debug_impl(&dword_1CAF47000, v413, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v195 = 0x1E0D80000;
          v371 = v1161;
          v24 = v407;
          v395 = v1111;
        }
      }

    }
    else
    {
      v372 = 0.0;
    }
    v1123 = 0.0;
    v1112 = v372;
    if (!v1143)
    {
      v450 = 0.0;
LABEL_269:
      v1157 = v450;
      if (v1144)
      {
        objc_msgSend(v1144, "objectForKeyedSubscript:", CFSTR("SrvcType"));
        v849 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v849, "objectAtIndexedSubscript:", 0);
        v850 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v850, "doubleValue");
        v852 = v851;
        objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
        v853 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v853, "objectForKeyedSubscript:", CFSTR("UTRAN"));
        v854 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v854, "objectForKeyedSubscript:", CFSTR("SrvcType"));
        v855 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v855, "objectAtIndexedSubscript:", 0);
        v856 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v856, "doubleValue");
        v857 = 0.0;
        v859 = v852 * v858 + 0.0;

        objc_msgSend(v849, "objectAtIndexedSubscript:", 1);
        v860 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v860, "doubleValue");
        v862 = v861;
        objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
        v863 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v863, "objectForKeyedSubscript:", CFSTR("UTRAN"));
        v864 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v864, "objectForKeyedSubscript:", CFSTR("SrvcType"));
        v865 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v865, "objectAtIndexedSubscript:", 1);
        v866 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v866, "doubleValue");
        v868 = v862 * v867 + 0.0;

        objc_msgSend(v849, "objectAtIndexedSubscript:", 2);
        v869 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v869, "doubleValue");
        v871 = v870;
        objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
        v872 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v872, "objectForKeyedSubscript:", CFSTR("UTRAN"));
        v873 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v873, "objectForKeyedSubscript:", CFSTR("SrvcType"));
        v874 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v874, "objectAtIndexedSubscript:", 2);
        v875 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v875, "doubleValue");
        v877 = v868 + v871 * v876;

        objc_msgSend(v849, "objectAtIndexedSubscript:", 5);
        v878 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v878, "doubleValue");
        v880 = v879;
        objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
        v881 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v881, "objectForKeyedSubscript:", CFSTR("UTRAN"));
        v882 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v882, "objectForKeyedSubscript:", CFSTR("SrvcType"));
        v883 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v883, "objectAtIndexedSubscript:", 5);
        v884 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v884, "doubleValue");
        v886 = v877 + v880 * v885;

        v1163 = v849;
        objc_msgSend(v849, "objectAtIndexedSubscript:", 3);
        v887 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v887, "doubleValue");
        v889 = v888;
        objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
        v890 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v890, "objectForKeyedSubscript:", CFSTR("UTRAN"));
        v891 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v891, "objectForKeyedSubscript:", CFSTR("SrvcType"));
        v892 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v892, "objectAtIndexedSubscript:", 0);
        v893 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v893, "doubleValue");
        v895 = v859 + v889 * v894;

        objc_msgSend(v849, "objectAtIndexedSubscript:", 3);
        v896 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v896, "doubleValue");
        v898 = v897;
        objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
        v899 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v899, "objectForKeyedSubscript:", CFSTR("UTRAN"));
        v900 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v900, "objectForKeyedSubscript:", CFSTR("SrvcType"));
        v901 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v901, "objectAtIndexedSubscript:", 3);
        v902 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v902, "doubleValue");
        v904 = v903;
        objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
        v905 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v905, "objectForKeyedSubscript:", CFSTR("UTRAN"));
        v906 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v906, "objectForKeyedSubscript:", CFSTR("SrvcType"));
        v907 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v907, "objectAtIndexedSubscript:", 0);
        v908 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v908, "doubleValue");
        v910 = v886 + v898 * (v904 - v909);

        objc_msgSend(v1163, "objectAtIndexedSubscript:", 4);
        v911 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v911, "doubleValue");
        v913 = v912;
        objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
        v914 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v914, "objectForKeyedSubscript:", CFSTR("UTRAN"));
        v915 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v915, "objectForKeyedSubscript:", CFSTR("SrvcType"));
        v916 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v916, "objectAtIndexedSubscript:", 0);
        v917 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v917, "doubleValue");
        v919 = v895 + v913 * v918;

        objc_msgSend(v1163, "objectAtIndexedSubscript:", 4);
        v920 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v920, "doubleValue");
        v922 = v921;
        objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
        v923 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v923, "objectForKeyedSubscript:", CFSTR("UTRAN"));
        v924 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v924, "objectForKeyedSubscript:", CFSTR("SrvcType"));
        v925 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v925, "objectAtIndexedSubscript:", 4);
        v926 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v926, "doubleValue");
        v928 = v927;
        objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
        v929 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v929, "objectForKeyedSubscript:", CFSTR("UTRAN"));
        v930 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v930, "objectForKeyedSubscript:", CFSTR("SrvcType"));
        v931 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v931, "objectAtIndexedSubscript:", 0);
        v932 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v932, "doubleValue");
        v934 = v910 + v922 * (v928 - v933);

        objc_msgSend(v1144, "objectForKeyedSubscript:", CFSTR("RxDState"));
        v1152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1152, "objectAtIndexedSubscript:", 1);
        v935 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v935, "doubleValue");
        v1149 = v936;
        objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
        v937 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v937, "objectForKeyedSubscript:", CFSTR("UTRAN"));
        v938 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v938, "objectForKeyedSubscript:", CFSTR("RxDState"));
        v939 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v939, "objectAtIndexedSubscript:", 1);
        v940 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v940, "doubleValue");
        v1140 = v941;

        if (v1167)
        {
          v1134 = v919;
          objc_msgSend(v1167, "objectForKeyedSubscript:", CFSTR("RSSIModeCount"));
          v942 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v942, "objectAtIndexedSubscript:", 1);
          v943 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v943, "doubleValue");
          v945 = v944;
          objc_msgSend(v942, "objectAtIndexedSubscript:", 2);
          v946 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v946, "doubleValue");
          v948 = v947;
          v1130 = v942;
          objc_msgSend(v942, "objectAtIndexedSubscript:", 3);
          v949 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v949, "doubleValue");
          v951 = v950;
          objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
          v952 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v952, "objectForKeyedSubscript:", CFSTR("UTRAN"));
          v953 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v953, "objectForKeyedSubscript:", CFSTR("RX"));
          v954 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v954, "doubleValue");
          v956 = v955;

          objc_msgSend(v1167, "objectForKeyedSubscript:", CFSTR("TxPowerHist"));
          v957 = (void *)objc_claimAutoreleasedReturnValue();
          v958 = 0;
          v959 = 0.0;
          do
          {
            objc_msgSend(v957, "objectAtIndexedSubscript:", v958);
            v960 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v960, "doubleValue");
            v962 = v961;
            objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
            v963 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v963, "objectForKeyedSubscript:", CFSTR("UTRAN"));
            v964 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v964, "objectForKeyedSubscript:", CFSTR("txPower"));
            v965 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v965, "objectAtIndexedSubscript:", v958);
            v966 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v966, "doubleValue");
            v959 = v959 + v962 * v967;

            ++v958;
          }
          while (v958 != 12);
          for (n = 8; n != 12; ++n)
          {
            objc_msgSend(v957, "objectAtIndexedSubscript:", n);
            v969 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v969, "doubleValue");
            v35 = v35 + v970;

          }
          v971 = (v945 + v948 + v951) * v956;
          v972 = v1145;
          v857 = v971 / v1145;
          v973 = v959 / v1145;

          v3 = v1146;
          v974 = v1136;
          v89 = 0x1E0D7F000;
          v919 = v1134;
        }
        else
        {
          v973 = 0.0;
          v3 = v1146;
          v974 = v1136;
          v972 = v1145;
          v89 = 0x1E0D7F000uLL;
        }
        v976 = v919 / v972;
        v975 = v934 / v972;
        objc_msgSend(v1163, "objectAtIndexedSubscript:", 0);
        v977 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v977, "doubleValue");
        v979 = v978;
        objc_msgSend(v1163, "objectAtIndexedSubscript:", 3);
        v980 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v980, "doubleValue");
        v982 = v979 + v981;
        objc_msgSend(v1163, "objectAtIndexedSubscript:", 4);
        v983 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v983, "doubleValue");
        v985 = v982 + v984;

        objc_msgSend(v1163, "objectAtIndexedSubscript:", 1);
        v986 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v986, "doubleValue");
        v988 = v987;
        objc_msgSend(v1163, "objectAtIndexedSubscript:", 2);
        v989 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v989, "doubleValue");
        v991 = v988 + v990;
        objc_msgSend(v1163, "objectAtIndexedSubscript:", 3);
        v992 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v992, "doubleValue");
        v994 = v991 + v993;
        objc_msgSend(v1163, "objectAtIndexedSubscript:", 4);
        v995 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v995, "doubleValue");
        v997 = v994 + v996;
        objc_msgSend(v1163, "objectAtIndexedSubscript:", 5);
        v998 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v998, "doubleValue");
        v1000 = v997 + v999;

        v1001 = v985 + v1000;
        v31 = v1115;
        if (v985 + v1000 > 0.0)
        {
          v1002 = v1149 * v1140 / v972 + v857 + v973;
          v976 = v976 + v1002 * v985 / v1001;
          v975 = v975 + v1002 * v1000 / v1001;
        }
        v1123 = v976;

        v24 = v974;
      }
      else
      {
        v975 = 0.0;
        v31 = v1115;
      }
      if (v1124 >= 0.0)
        v1003 = v1124;
      else
        v1003 = 0.0;
      if (v1116 >= 0.0)
        v1004 = v1116;
      else
        v1004 = 0.0;
      if (v1113 >= 0.0)
        v1005 = v1113;
      else
        v1005 = 0.0;
      if (v1112 >= 0.0)
        v1006 = v1112;
      else
        v1006 = 0.0;
      if (v1157 >= 0.0)
        v1007 = v1157;
      else
        v1007 = 0.0;
      v1008 = v1003 + v1004 + v1005 + v1006 + v1007 + v975;
      if (v1008 > 3000.0 || v1008 < 0.0)
        v1010 = 0.0;
      else
        v1010 = v1003 + v1004 + v1005 + v1006 + v1007 + v975;
      if (objc_msgSend(*(id *)(v89 + 4000), "debugEnabled"))
      {
        v1011 = objc_opt_class();
        v1172[0] = MEMORY[0x1E0C809B0];
        v1172[1] = 3221225472;
        v1172[2] = __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1210;
        v1172[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v1172[4] = v1011;
        v1012 = v1172;
        if (qword_1ED883D38 != -1)
          dispatch_once(&qword_1ED883D38, v1012);

        if (byte_1ED883840)
        {
          v1013 = v24;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cdma2kDataPower=%f, evdoPower=%f, gsmDataPower=%f, wcdmaDataPower=%f, ltePower=%f, tdscdmaDataPower=%f, basebandDataPower=%f, BBDate=%@"), *(_QWORD *)&v1003, *(_QWORD *)&v1004, *(_QWORD *)&v1005, *(_QWORD *)&v1006, *(_QWORD *)&v1007, *(_QWORD *)&v975, *(_QWORD *)&v1010, v31);
          v1014 = (void *)objc_claimAutoreleasedReturnValue();
          v1015 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
          v1016 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1016, "lastPathComponent");
          v1017 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent modelMav10BBHWPower:]");
          v1018 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1015, "logMessage:fromFile:fromFunction:fromLineNumber:", v1014, v1017, v1018, 4257);

          PLLogCommon();
          v1019 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v1019, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v1184 = v1014;
            _os_log_debug_impl(&dword_1CAF47000, v1019, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v3 = v1146;
          v24 = v1013;
        }
      }
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v1020 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1020, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 37, v31, v1010);

      if (objc_msgSend(*(id *)(v89 + 4000), "debugEnabled"))
      {
        v1021 = objc_opt_class();
        v1171[0] = MEMORY[0x1E0C809B0];
        v1171[1] = 3221225472;
        v1171[2] = __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1215;
        v1171[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v1171[4] = v1021;
        v1022 = v1171;
        if (qword_1ED883D40 != -1)
          dispatch_once(&qword_1ED883D40, v1022);

        if (byte_1ED883841)
        {
          v1023 = v24;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cdma2kVoicePower=%f, wcdmaVoicePower=%f, gsmVoicePower=%f, tdscdmaVoicePower=%f"), *(_QWORD *)&v1125, *(_QWORD *)&v1126, *(_QWORD *)&v1114, *(_QWORD *)&v1123);
          v1024 = (void *)objc_claimAutoreleasedReturnValue();
          v1025 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
          v1026 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1026, "lastPathComponent");
          v1027 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent modelMav10BBHWPower:]");
          v1028 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1025, "logMessage:fromFile:fromFunction:fromLineNumber:", v1024, v1027, v1028, 4265);

          PLLogCommon();
          v1029 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v1029, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v1184 = v1024;
            _os_log_debug_impl(&dword_1CAF47000, v1029, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v3 = v1146;
          v24 = v1023;
        }
      }
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v1030 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1030, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 38, v31, v1114 + v1125 + v1126 + v1123);

      objc_msgSend(v31, "dateByAddingTimeInterval:", v1145 * -0.0000305175781);
      v1031 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v1032 = (void *)objc_claimAutoreleasedReturnValue();
      v1033 = v1032;
      if (v35 / v1145 <= 0.100000001)
        v1034 = (void *)MEMORY[0x1E0C9AA60];
      else
        v1034 = &unk_1E8650930;
      objc_msgSend(v1032, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 1, v1034, v1031);

      goto LABEL_320;
    }
    objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("SleepStateArr"));
    v1096 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("SleepStateConnArr"));
    v1093 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("TxPwrBktArr"));
    v1162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("CAFreqInfo"));
    v414 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("C0TBSzArr"));
    v415 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("C1TBSzArr"));
    v416 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("DLTBSzArr"));
    v1139 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("CASCCStateArr"));
    v1129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("DupMode"));
    v417 = (void *)objc_claimAutoreleasedReturnValue();
    v418 = objc_msgSend(v417, "longValue");

    v1119 = v414;
    v1151 = (void *)v415;
    v1148 = (void *)v416;
    if (objc_msgSend(*(id *)(v89 + 4000), "debugEnabled"))
    {
      v419 = objc_opt_class();
      v1174[0] = MEMORY[0x1E0C809B0];
      v1174[1] = 3221225472;
      v1174[2] = __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1193;
      v1174[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v1174[4] = v419;
      v420 = v1174;
      if (qword_1ED883D28 != -1)
        dispatch_once(&qword_1ED883D28, v420);

      if (byte_1ED88383E)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("C0TBSz = %@, C1TBSz = %@, carrierAggregationStates = %@"), v415, v416, v1129);
        v421 = (void *)objc_claimAutoreleasedReturnValue();
        v422 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v423 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v423, "lastPathComponent");
        v424 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent modelMav10BBHWPower:]");
        v425 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v422, "logMessage:fromFile:fromFunction:fromLineNumber:", v421, v424, v425, 3866);

        PLLogCommon();
        v426 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v426, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v1184 = v421;
          _os_log_debug_impl(&dword_1CAF47000, v426, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v195 = 0x1E0D80000uLL;
        v414 = v1119;
      }
    }
    v427 = CFSTR("FDD");
    if (v418 == 1)
      v427 = CFSTR("TDD");
    v1156 = v427;
    if (objc_msgSend(*(id *)(v195 + 32), "isBasebandClass:"))
    {
      objc_msgSend(v1096, "objectAtIndexedSubscript:", 1);
      v428 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v428, "doubleValue");
      v430 = v429;

      objc_msgSend(v1096, "objectAtIndexedSubscript:", 2);
      v431 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v431, "doubleValue");
      v433 = v432;
      objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
      v434 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v434, "objectForKeyedSubscript:", CFSTR("LTE"));
      v435 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v435, "objectForKeyedSubscript:", CFSTR("SemiLite"));
      v1107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1107, "doubleValue");
      v437 = v436;
      objc_msgSend(v1096, "objectAtIndexedSubscript:", 3);
      v1103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1103, "doubleValue");
      v439 = v438;
      objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
      v1098 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1098, "objectForKeyedSubscript:", CFSTR("LTE"));
      v1088 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1088, "objectForKeyedSubscript:", CFSTR("FullLite"));
      v1084 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1084, "doubleValue");
      v441 = v439 * v440 + v433 * v437;
      objc_msgSend(v1096, "objectAtIndexedSubscript:", 4);
      v442 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v442, "doubleValue");
      v444 = v443;
      objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
      v445 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v445, "objectForKeyedSubscript:", CFSTR("LTE"));
      v446 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v446, "objectForKeyedSubscript:", CFSTR("DeepLite"));
      v447 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v447, "doubleValue");
      v449 = v441 + v444 * v448;
    }
    else
    {
      objc_msgSend(v1093, "objectAtIndexedSubscript:", 1);
      v451 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v451, "doubleValue");
      v430 = v452;

      objc_msgSend(v1093, "objectAtIndexedSubscript:", 2);
      v1076 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1076, "doubleValue");
      v454 = v453;
      objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
      v1080 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1080, "objectForKeyedSubscript:", CFSTR("LTE"));
      v1072 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1072, "objectForKeyedSubscript:", CFSTR("MacroSleep"));
      v1107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1107, "doubleValue");
      v456 = v455;
      objc_msgSend(v1093, "objectAtIndexedSubscript:", 3);
      v1103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1103, "doubleValue");
      v458 = v457;
      objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
      v1098 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1098, "objectForKeyedSubscript:", CFSTR("LTE"));
      v1088 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1088, "objectForKeyedSubscript:", CFSTR("LightSleep"));
      v1084 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1084, "doubleValue");
      v460 = v458 * v459 + v454 * v456;
      objc_msgSend(v1093, "objectAtIndexedSubscript:", 4);
      v1068 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1068, "doubleValue");
      v462 = v461;
      objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
      v1064 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1064, "objectForKeyedSubscript:", CFSTR("LTE"));
      v1061 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1061, "objectForKeyedSubscript:", CFSTR("DeepLightSleep"));
      v447 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v447, "doubleValue");
      v464 = v460 + v462 * v463;
      objc_msgSend(v1093, "objectAtIndexedSubscript:", 5);
      v465 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v465, "doubleValue");
      v467 = v466;
      objc_msgSend(v36, "objectForKeyedSubscript:", v1165);
      v468 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v468, "objectForKeyedSubscript:", CFSTR("LTE"));
      v469 = v36;
      v470 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v470, "objectForKeyedSubscript:", CFSTR("QuickDeepLightSleep"));
      v471 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v471, "doubleValue");
      v473 = v464 + v467 * v472;
      objc_msgSend(v1093, "objectAtIndexedSubscript:", 6);
      v474 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v474, "doubleValue");
      v476 = v475;
      objc_msgSend(v469, "objectForKeyedSubscript:", v1165);
      v477 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v477, "objectForKeyedSubscript:", CFSTR("LTE"));
      v478 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v478, "objectForKeyedSubscript:", CFSTR("DeepSleep"));
      v479 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v479, "doubleValue");
      v449 = v473 + v476 * v480;

      v414 = v1119;
      v195 = 0x1E0D80000uLL;

      v431 = v1076;
      v442 = v1068;

      v435 = v1072;
      v446 = v1061;

      v445 = v1064;
      v434 = v1080;
    }

    if ((objc_msgSend(*(id *)(v195 + 32), "isBasebandClass:", 1003003) & 1) != 0
      || objc_msgSend(*(id *)(v195 + 32), "isBasebandClass:", 1003004))
    {
      objc_msgSend(v414, "objectAtIndexedSubscript:", 0);
      v481 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("PCC_Band"));
      v481 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v482 = v481;
    objc_msgSend(v481, "doubleValue");
    v484 = v483;

    v1089 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v1108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2);
    v1085 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
    v1104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4);
    v1081 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 7);
    v1099 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 9);
    v1077 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 10);
    v1073 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 15);
    v1069 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 16);
    v1065 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 22);
    v485 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 23);
    v486 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 24);
    v487 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 25);
    v488 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 30);
    v489 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1089, "setWithObjects:", v1108, v1085, v1104, v1081, v1099, v1077, v1073, v1069, v1065, v485, v486, v487, v488, v489, 0);
    v490 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v484);
    v491 = (void *)objc_claimAutoreleasedReturnValue();
    v492 = objc_msgSend(v490, "containsObject:", v491);
    v493 = CFSTR("txPowerLowBand");
    if (v492)
      v493 = CFSTR("txPowerHighBand");
    v494 = v493;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v484);
    v495 = (void *)objc_claimAutoreleasedReturnValue();
    v1100 = v490;
    v496 = objc_msgSend(v490, "containsObject:", v495);

    v497 = 0.0;
    if (v496)
    {
      v498 = 0x1E0D80000uLL;
      v499 = v1165;
      v500 = v1164;
      v501 = v1129;
      if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003004) & 1) != 0
        || (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003005) & 1) != 0
        || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003007))
      {
        objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
        v502 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v502, "objectForKeyedSubscript:", CFSTR("LTE"));
        v503 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v503, "objectForKeyedSubscript:", CFSTR("elnaAdder"));
        v504 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v504, "doubleValue");
        v497 = v505;

        v501 = v1129;
      }
    }
    else
    {
      v499 = v1165;
      v500 = v1164;
      v498 = 0x1E0D80000uLL;
      v501 = v1129;
    }
    v1105 = v494;
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003003) & 1) != 0
      || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003004))
    {
      objc_msgSend(v501, "objectAtIndexedSubscript:", 3);
      v506 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v506, "doubleValue");
      v508 = v430 - v507;
      objc_msgSend(v500, "objectForKeyedSubscript:", v499);
      v509 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v509, "objectForKeyedSubscript:", CFSTR("LTE"));
      v510 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v510, "objectForKeyedSubscript:", CFSTR("Active"));
      v511 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v511, "objectForKeyedSubscript:", v1156);
      v512 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v512, "doubleValue");
      v514 = v508 * (v497 + v513) / v34;
    }
    else if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003005) & 1) != 0)
    {
      objc_msgSend(v501, "objectAtIndexedSubscript:", 1);
      v1109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1109, "doubleValue");
      v523 = v430 - v522;
      objc_msgSend(v501, "objectAtIndexedSubscript:", 2);
      v524 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v524, "doubleValue");
      v526 = v523 - v525;
      objc_msgSend(v501, "objectAtIndexedSubscript:", 3);
      v527 = v499;
      v528 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v528, "doubleValue");
      v530 = v526 - v529;
      objc_msgSend(v501, "objectAtIndexedSubscript:", 4);
      v531 = v500;
      v532 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v532, "doubleValue");
      v534 = v530 - v533;
      objc_msgSend(v501, "objectAtIndexedSubscript:", 5);
      v535 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v535, "doubleValue");
      v537 = v534 - v536;
      objc_msgSend(v531, "objectForKeyedSubscript:", v527);
      v538 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v538, "objectForKeyedSubscript:", CFSTR("LTE"));
      v539 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v539, "objectForKeyedSubscript:", CFSTR("Active"));
      v540 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v540, "objectForKeyedSubscript:", v1156);
      v541 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v541, "doubleValue");
      v543 = v537 * (v497 + v542) / v34;

      v498 = 0x1E0D80000;
      v501 = v1129;

      objc_msgSend(v1129, "objectAtIndexedSubscript:", 4);
      v506 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v506, "doubleValue");
      v545 = v544;
      objc_msgSend(v531, "objectForKeyedSubscript:", v1165);
      v509 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v509, "objectForKeyedSubscript:", CFSTR("LTE"));
      v510 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v510, "objectForKeyedSubscript:", CFSTR("ActiveCA1configured"));
      v511 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v511, "objectForKeyedSubscript:", v1156);
      v512 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v512, "doubleValue");
      v514 = v543 + v545 * v546 / v34;
    }
    else
    {
      v599 = 0.0;
      for (ii = 1; ii != 10; ++ii)
      {
        objc_msgSend(v501, "objectAtIndexedSubscript:", ii);
        v601 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v601, "doubleValue");
        v599 = v599 + v602;

      }
      v603 = 0.0;
      if (v430 > v599)
      {
        objc_msgSend(v500, "objectForKeyedSubscript:", v499);
        v604 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v604, "objectForKeyedSubscript:", CFSTR("LTE"));
        v605 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v605, "objectForKeyedSubscript:", CFSTR("Active"));
        v606 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v606, "objectForKeyedSubscript:", v1156);
        v607 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v607, "doubleValue");
        v603 = (v430 - v599) * (v497 + v608) / v34;

        v501 = v1129;
      }
      objc_msgSend(v501, "objectAtIndexedSubscript:", 1);
      v609 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v609, "doubleValue");
      v611 = v610;
      objc_msgSend(v500, "objectForKeyedSubscript:", v499);
      v612 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v612, "objectForKeyedSubscript:", CFSTR("LTE"));
      v613 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v613, "objectForKeyedSubscript:", CFSTR("ActiveCA1configured"));
      v614 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v614, "objectForKeyedSubscript:", v1156);
      v615 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v615, "doubleValue");
      v617 = v603 + v611 * v616 / v34;

      objc_msgSend(v1129, "objectAtIndexedSubscript:", 2);
      v618 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v618, "doubleValue");
      v620 = v619;
      objc_msgSend(v500, "objectForKeyedSubscript:", v499);
      v621 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v621, "objectForKeyedSubscript:", CFSTR("LTE"));
      v622 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v622, "objectForKeyedSubscript:", CFSTR("ActiveCA2configured"));
      v623 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v623, "objectForKeyedSubscript:", v1156);
      v624 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v624, "doubleValue");
      v626 = v617 + v620 * v625 / v34;

      v501 = v1129;
      objc_msgSend(v1129, "objectAtIndexedSubscript:", 3);
      v506 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v506, "doubleValue");
      v628 = v627;
      objc_msgSend(v500, "objectForKeyedSubscript:", v499);
      v509 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v509, "objectForKeyedSubscript:", CFSTR("LTE"));
      v510 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v510, "objectForKeyedSubscript:", CFSTR("ActiveCA3configured"));
      v511 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v511, "objectForKeyedSubscript:", v1156);
      v512 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v512, "doubleValue");
      v514 = v626 + v628 * v629 / v34;
      v498 = 0x1E0D80000;
    }

    if (v514 >= 0.0)
      v515 = v514;
    else
      v515 = 0.0;
    v516 = v1119;
    if ((objc_msgSend(*(id *)(v498 + 32), "isBasebandClass:", 1003003) & 1) != 0
      || objc_msgSend(*(id *)(v498 + 32), "isBasebandClass:", 1003004))
    {
      objc_msgSend(v1119, "objectAtIndexedSubscript:", 2);
      v517 = (void *)objc_claimAutoreleasedReturnValue();

      v518 = v1165;
      v519 = v1164;
      if (!v517)
        goto LABEL_183;
      v520 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v1119, "objectAtIndexedSubscript:", 2);
      v521 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("PCC_BW"));
      v547 = (void *)objc_claimAutoreleasedReturnValue();

      v518 = v1165;
      v519 = v1164;
      if (!v547)
        goto LABEL_183;
      v520 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("PCC_BW"));
      v521 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v548 = v521;
    objc_msgSend(v520, "stringWithFormat:", CFSTR("%i"), objc_msgSend(v521, "intValue"));
    v549 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v519, "objectForKeyedSubscript:", v518);
    v550 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v550, "objectForKeyedSubscript:", CFSTR("LTE"));
    v551 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v551, "objectForKeyedSubscript:", CFSTR("NonCAMultiplier"));
    v552 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v552, "objectForKeyedSubscript:", v549);
    v553 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v553, "doubleValue");
    v555 = v554;

    v556 = 1.0;
    if (v555 > 0.0)
      v556 = v555;
    v515 = v515 * v556;

    v518 = v1165;
    v519 = v1164;
LABEL_183:
    if ((objc_msgSend(*(id *)(v498 + 32), "isBasebandClass:", 1003003) & 1) != 0
      || objc_msgSend(*(id *)(v498 + 32), "isBasebandClass:", 1003004))
    {
      objc_msgSend(v501, "objectAtIndexedSubscript:", 3);
      v557 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v557, "doubleValue");
      v559 = v558;
      objc_msgSend(v519, "objectForKeyedSubscript:", v518);
      v560 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v560, "objectForKeyedSubscript:", CFSTR("LTE"));
      v561 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v561, "objectForKeyedSubscript:", CFSTR("ActiveCA"));
      v562 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v562, "objectForKeyedSubscript:", v1156);
      v563 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v563, "doubleValue");
      v565 = 0.0;
      v566 = v34;
      v567 = 0.0;
      v568 = 0.0;
      v1110 = v559 * v564 / v566;
    }
    else
    {
      if (objc_msgSend(*(id *)(v498 + 32), "isBasebandClass:", 1003005))
      {
        objc_msgSend(v501, "objectAtIndexedSubscript:", 1);
        v569 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v569, "doubleValue");
        v571 = v570;
        objc_msgSend(v519, "objectForKeyedSubscript:", v518);
        v572 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v572, "objectForKeyedSubscript:", CFSTR("LTE"));
        v573 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v573, "objectForKeyedSubscript:", CFSTR("ActiveCA2configured"));
        v574 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v574, "objectForKeyedSubscript:", v1156);
        v575 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v575, "doubleValue");
        v577 = v571 * v576 / v34;

        objc_msgSend(v1129, "objectAtIndexedSubscript:", 2);
        v578 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v578, "doubleValue");
        v580 = v579;
        objc_msgSend(v519, "objectForKeyedSubscript:", v518);
        v581 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v581, "objectForKeyedSubscript:", CFSTR("LTE"));
        v582 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v582, "objectForKeyedSubscript:", CFSTR("Active2CA1configured"));
        v583 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v583, "objectForKeyedSubscript:", v1156);
        v584 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v584, "doubleValue");
        v586 = v577 + v580 * v585 / v34;

        objc_msgSend(v1129, "objectAtIndexedSubscript:", 3);
        v587 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v587, "doubleValue");
        v589 = v588;
        objc_msgSend(v519, "objectForKeyedSubscript:", v518);
        v590 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v590, "objectForKeyedSubscript:", CFSTR("LTE"));
        v591 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v591, "objectForKeyedSubscript:", CFSTR("Active2CA"));
        v592 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v592, "objectForKeyedSubscript:", v1156);
        v593 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v593, "doubleValue");
        v595 = v586 + v589 * v594 / v34;

        objc_msgSend(v1129, "objectAtIndexedSubscript:", 5);
        v557 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v557, "doubleValue");
        v597 = v596;
        objc_msgSend(v519, "objectForKeyedSubscript:", v518);
        v560 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v560, "objectForKeyedSubscript:", CFSTR("LTE"));
        v561 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v561, "objectForKeyedSubscript:", CFSTR("Active3CA"));
        v562 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v562, "objectForKeyedSubscript:", v1156);
        v563 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v563, "doubleValue");
        v1110 = v595 + v597 * v598 / v34;
        v565 = 0.0;
        v567 = 0.0;
        v568 = 0.0;
      }
      else
      {
        objc_msgSend(v501, "objectAtIndexedSubscript:", 4);
        v630 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v630, "doubleValue");
        v632 = v631;
        objc_msgSend(v519, "objectForKeyedSubscript:", v518);
        v633 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v633, "objectForKeyedSubscript:", CFSTR("LTE"));
        v634 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v634, "objectForKeyedSubscript:", CFSTR("Active2CA"));
        v635 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v635, "objectForKeyedSubscript:", v1156);
        v636 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v636, "doubleValue");
        v638 = v632 * v637 / v34;

        objc_msgSend(v1129, "objectAtIndexedSubscript:", 5);
        v639 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v639, "doubleValue");
        v641 = v640;
        objc_msgSend(v519, "objectForKeyedSubscript:", v518);
        v642 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v642, "objectForKeyedSubscript:", CFSTR("LTE"));
        v643 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v643, "objectForKeyedSubscript:", CFSTR("Active2CA1configured"));
        v644 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v644, "objectForKeyedSubscript:", v1156);
        v645 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v645, "doubleValue");
        v647 = v638 + v641 * v646 / v34;

        objc_msgSend(v1129, "objectAtIndexedSubscript:", 6);
        v648 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v648, "doubleValue");
        v650 = v649;
        objc_msgSend(v519, "objectForKeyedSubscript:", v518);
        v651 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v651, "objectForKeyedSubscript:", CFSTR("LTE"));
        v652 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v652, "objectForKeyedSubscript:", CFSTR("Active2CA2configured"));
        v653 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v653, "objectForKeyedSubscript:", v1156);
        v654 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v654, "doubleValue");
        v565 = v647 + v650 * v655 / v34;

        objc_msgSend(v1129, "objectAtIndexedSubscript:", 7);
        v656 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v656, "doubleValue");
        v658 = v657;
        objc_msgSend(v519, "objectForKeyedSubscript:", v518);
        v659 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v659, "objectForKeyedSubscript:", CFSTR("LTE"));
        v660 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v660, "objectForKeyedSubscript:", CFSTR("Active3CA"));
        v661 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v661, "objectForKeyedSubscript:", v1156);
        v662 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v662, "doubleValue");
        v664 = v658 * v663 / v34;

        objc_msgSend(v1129, "objectAtIndexedSubscript:", 8);
        v665 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v665, "doubleValue");
        v667 = v666;
        objc_msgSend(v519, "objectForKeyedSubscript:", v518);
        v668 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v668, "objectForKeyedSubscript:", CFSTR("LTE"));
        v669 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v669, "objectForKeyedSubscript:", CFSTR("Active3CA1configured"));
        v670 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v670, "objectForKeyedSubscript:", v1156);
        v671 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v671, "doubleValue");
        v673 = v34;
        v567 = v664 + v667 * v672 / v34;

        objc_msgSend(v1129, "objectAtIndexedSubscript:", 9);
        v557 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v557, "doubleValue");
        v675 = v674;
        objc_msgSend(v519, "objectForKeyedSubscript:", v518);
        v560 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v560, "objectForKeyedSubscript:", CFSTR("LTE"));
        v561 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v561, "objectForKeyedSubscript:", CFSTR("Active4CA"));
        v562 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v562, "objectForKeyedSubscript:", v1156);
        v563 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v563, "doubleValue");
        v1110 = 0.0;
        v568 = v675 * v676 / v673;
      }
      v498 = 0x1E0D80000uLL;
      v516 = v1119;
    }

    v677 = v1162;
    if ((objc_msgSend(*(id *)(v498 + 32), "isBasebandClass:", 1003003) & 1) != 0
      || objc_msgSend(*(id *)(v498 + 32), "isBasebandClass:", 1003004))
    {
      objc_msgSend(v516, "objectAtIndexedSubscript:", 2);
      v678 = objc_claimAutoreleasedReturnValue();
      v679 = v1165;
      v680 = v1164;
      if (v678)
      {
        v681 = (void *)v678;
        objc_msgSend(v516, "objectAtIndexedSubscript:", 3);
        v682 = (void *)objc_claimAutoreleasedReturnValue();

        v683 = v1145;
        if (!v682)
          goto LABEL_225;
        objc_msgSend(v516, "objectAtIndexedSubscript:", 2);
        v684 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v684, "doubleValue");
        -[PLBBAgent translateChannelRBsToChannelBW:](self, "translateChannelRBsToChannelBW:");
        v686 = v685;
        objc_msgSend(v516, "objectAtIndexedSubscript:", 3);
        v687 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v687, "doubleValue");
        -[PLBBAgent translateChannelRBsToChannelBW:](self, "translateChannelRBsToChannelBW:");
        v689 = v686 + v688;

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), (int)v689);
        v690 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
        v691 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v691, "objectForKeyedSubscript:", CFSTR("LTE"));
        v692 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v692, "objectForKeyedSubscript:", CFSTR("CAMultiplier"));
        v693 = (void *)objc_claimAutoreleasedReturnValue();
        v694 = v1165;
        goto LABEL_200;
      }
      goto LABEL_224;
    }
    v700 = objc_msgSend(*(id *)(v498 + 32), "isBasebandClass:", 1003005);
    objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("PCC_BW"));
    v701 = objc_claimAutoreleasedReturnValue();
    v690 = (void *)v701;
    v679 = v1165;
    v680 = v1164;
    if (v700)
    {
      if (v701)
      {
        objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("SCC1_BW"));
        v702 = objc_claimAutoreleasedReturnValue();
        v683 = v1145;
        if (!v702)
        {
LABEL_203:

          goto LABEL_225;
        }
        v703 = (void *)v702;
        objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("SCC2_BW"));
        v704 = (void *)objc_claimAutoreleasedReturnValue();

        if (v704)
        {
          objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("PCC_BW"));
          v705 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v705, "doubleValue");
          v694 = v1165;
          -[PLBBAgent translateChannelRBsToChannelBW:](self, "translateChannelRBsToChannelBW:");
          v707 = v706;
          objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("SCC1_BW"));
          v708 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v708, "doubleValue");
          -[PLBBAgent translateChannelRBsToChannelBW:](self, "translateChannelRBsToChannelBW:");
          v710 = v707 + v709;
          objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("SCC2_BW"));
          v711 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v711, "doubleValue");
          -[PLBBAgent translateChannelRBsToChannelBW:](self, "translateChannelRBsToChannelBW:");
          v713 = v710 + v712;

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), (int)v713);
          v690 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
          v691 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v691, "objectForKeyedSubscript:", CFSTR("LTE"));
          v692 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v692, "objectForKeyedSubscript:", CFSTR("CAMultiplier"));
          v693 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_200:
          v695 = v693;
          objc_msgSend(v693, "objectForKeyedSubscript:", v690);
          v696 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v696, "doubleValue");
          v698 = v697;

          v679 = v694;
          v699 = 1.0;
          if (v698 > 0.0)
            v699 = v698;
          v1110 = v1110 * v699;
          goto LABEL_203;
        }
LABEL_225:
        v752 = 0;
        v753 = 0.0;
        v754 = v449 / v683;
        do
        {
          objc_msgSend(v677, "objectAtIndexedSubscript:", v752);
          v755 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v755, "doubleValue");
          v757 = v756;
          objc_msgSend(v680, "objectForKeyedSubscript:", v679);
          v758 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v758, "objectForKeyedSubscript:", CFSTR("LTE"));
          v759 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v759, "objectForKeyedSubscript:", v1105);
          v760 = v680;
          v761 = v679;
          v762 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v762, "objectAtIndexedSubscript:", v752);
          v763 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v763, "doubleValue");
          v753 = v753 + v757 * v764;

          v679 = v761;
          v680 = v760;

          v677 = v1162;
          ++v752;
        }
        while (v752 != 12);
        for (jj = 8; jj != 12; ++jj)
        {
          objc_msgSend(v1162, "objectAtIndexedSubscript:", jj);
          v766 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v766, "doubleValue");
          v35 = v35 + v767;

        }
        if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003003))
        {
          v768 = 0.0;
          v769 = 1;
          v770 = 0.0;
          do
          {
            objc_msgSend(v1151, "objectAtIndexedSubscript:", v769);
            v771 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v771, "doubleValue");
            v773 = v772;
            objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
            v774 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v774, "objectForKeyedSubscript:", CFSTR("LTE"));
            v775 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v775, "objectForKeyedSubscript:", CFSTR("C0TBSz"));
            v776 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v776, "objectForKeyedSubscript:", v1156);
            v777 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v777, "objectAtIndexedSubscript:", v769);
            v778 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v778, "doubleValue");
            v770 = v770 + v773 * v779;

            objc_msgSend(v1148, "objectAtIndexedSubscript:", v769);
            v780 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v780, "doubleValue");
            v782 = v781;
            objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
            v783 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v783, "objectForKeyedSubscript:", CFSTR("LTE"));
            v784 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v784, "objectForKeyedSubscript:", CFSTR("C1TBSz"));
            v785 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v785, "objectForKeyedSubscript:", v1156);
            v786 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v786, "objectAtIndexedSubscript:", v769);
            v787 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v787, "doubleValue");
            v768 = v768 + v782 * v788;

            ++v769;
          }
          while (v769 != 16);
          v789 = v770 + v768;
          v683 = v1145;
          v790 = (void *)v1139;
        }
        else if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003004))
        {
          v791 = 0.0;
          v792 = 1;
          v793 = 0.0;
          do
          {
            objc_msgSend(v1151, "objectAtIndexedSubscript:", v792);
            v794 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v794, "doubleValue");
            v796 = v795;
            objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
            v797 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v797, "objectForKeyedSubscript:", CFSTR("LTE"));
            v798 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v798, "objectForKeyedSubscript:", CFSTR("C0TBSz"));
            v799 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v799, "objectForKeyedSubscript:", v1156);
            v800 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v800, "objectAtIndexedSubscript:", v792);
            v801 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v801, "doubleValue");
            v793 = v793 + v796 * v802;

            objc_msgSend(v1148, "objectAtIndexedSubscript:", v792);
            v803 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v803, "doubleValue");
            v805 = v804;
            objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
            v806 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v806, "objectForKeyedSubscript:", CFSTR("LTE"));
            v807 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v807, "objectForKeyedSubscript:", CFSTR("C1TBSz"));
            v808 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v808, "objectForKeyedSubscript:", v1156);
            v809 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v809, "objectAtIndexedSubscript:", v792);
            v810 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v810, "doubleValue");
            v791 = v791 + v805 * v811;

            ++v792;
          }
          while (v792 != 18);
          v789 = v793 + v791;
          v683 = v1145;
          v790 = (void *)v1139;
        }
        else
        {
          v812 = v1165;
          v790 = (void *)v1139;
          if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003005) & 1) != 0
            || (v789 = 0.0, objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003007)))
          {
            v789 = 0.0;
            for (kk = 1; kk != 17; ++kk)
            {
              objc_msgSend(v790, "objectAtIndexedSubscript:", kk);
              v814 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v814, "doubleValue");
              v816 = v815;
              objc_msgSend(v1164, "objectForKeyedSubscript:", v812);
              v817 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v817, "objectForKeyedSubscript:", CFSTR("LTE"));
              v818 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v818, "objectForKeyedSubscript:", CFSTR("C0TBSz"));
              v819 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v819, "objectForKeyedSubscript:", v1156);
              v820 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v820, "objectAtIndexedSubscript:", kk);
              v821 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v821, "doubleValue");
              v789 = v789 + v816 * v822;

              v790 = (void *)v1139;
              v812 = v1165;

            }
          }
        }
        v823 = v753 / v683;
        v1133 = v789 / v683;
        if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003004) & 1) != 0
          || (v824 = 0.0,
              v825 = 0.0,
              v826 = 0.0,
              objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003005)))
        {
          objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("RfBPEArr"));
          v827 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v827, "objectAtIndexedSubscript:", 7);
          v828 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v828, "doubleValue");
          v1090 = v515;
          v830 = v829 * 3.7 / (v1145 * 0.0000305175781) / 1000.0;

          objc_msgSend(v827, "objectAtIndexedSubscript:", 6);
          v831 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v831, "doubleValue");
          v833 = v823;
          v834 = v754;
          v835 = v832 * 3.7 / (v1145 * 0.0000305175781) / 1000.0;

          objc_msgSend(v827, "objectAtIndexedSubscript:", 5);
          v836 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v836, "doubleValue");
          v826 = v837 * 3.7 / (v1145 * 0.0000305175781) / 1000.0;

          if (v830 > 3000.0 || v830 < 0.0)
            v824 = 0.0;
          else
            v824 = v830;
          v515 = v1090;
          if (v835 > 3000.0 || v835 < 0.0)
            v825 = 0.0;
          else
            v825 = v835;
          v754 = v834;
          v823 = v833;
          if (v826 > 3000.0 || v826 < 0.0)
            v826 = 0.0;

        }
        v450 = v754 + v515 + v1110 + v823 + v1133 + v824 + v825 + v826;
        v89 = 0x1E0D7F000uLL;
        v3 = v1146;
        v24 = v1136;
        v36 = v1164;
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v841 = objc_opt_class();
          v1173[0] = MEMORY[0x1E0C809B0];
          v1173[1] = 3221225472;
          v1173[2] = __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1201;
          v1173[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v1173[4] = v841;
          v842 = v1173;
          if (qword_1ED883D30 != -1)
            dispatch_once(&qword_1ED883D30, v842);

          if (byte_1ED88383F)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lteSleepPowerAdder=%f, lteNonCaActivePowerAdder=%f, CAActivePowerAdder=%f, lteTxPowerAdder=%f, TBSzPowerAdder=%f, lnaAdder=%f, nlicAdder=%f, advRxAdder=%f, ltePower=%f"), *(_QWORD *)&v754, *(_QWORD *)&v515, *(_QWORD *)&v1110, *(_QWORD *)&v823, *(_QWORD *)&v1133, *(_QWORD *)&v824, *(_QWORD *)&v825, *(_QWORD *)&v826, *(_QWORD *)&v450);
            v843 = (void *)objc_claimAutoreleasedReturnValue();
            v844 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
            v845 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v845, "lastPathComponent");
            v846 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent modelMav10BBHWPower:]");
            v847 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v844, "logMessage:fromFile:fromFunction:fromLineNumber:", v843, v846, v847, 4157);

            PLLogCommon();
            v848 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v848, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v1184 = v843;
              _os_log_debug_impl(&dword_1CAF47000, v848, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v3 = v1146;
            v790 = (void *)v1139;
            v24 = v1136;
          }
        }

        goto LABEL_269;
      }
LABEL_224:
      v683 = v1145;
      goto LABEL_225;
    }
    if (v701)
    {
      objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("SCC1_BW"));
      v714 = (void *)objc_claimAutoreleasedReturnValue();

      if (v714)
      {
        objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("PCC_BW"));
        v715 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v715, "doubleValue");
        -[PLBBAgent translateChannelRBsToChannelBW:](self, "translateChannelRBsToChannelBW:");
        v717 = v716;
        objc_msgSend(v1143, "objectForKeyedSubscript:", CFSTR("SCC1_BW"));
        v718 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v718, "doubleValue");
        -[PLBBAgent translateChannelRBsToChannelBW:](self, "translateChannelRBsToChannelBW:");
        v720 = v717 + v719;

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), (int)v720);
        v721 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1164, "objectForKeyedSubscript:", v1165);
        v722 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v722, "objectForKeyedSubscript:", CFSTR("LTE"));
        v723 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v723, "objectForKeyedSubscript:", CFSTR("2CAMultiplier"));
        v724 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v724, "objectForKeyedSubscript:", v721);
        v725 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v725, "doubleValue");
        v727 = v726;

        v679 = v1165;
        v728 = 1.0;
        if (v727 > 0.0)
          v728 = v727;
        v565 = v565 * v728;

      }
      v729 = v1143;
    }
    else
    {
      v729 = v1143;
    }
    objc_msgSend(v729, "objectForKeyedSubscript:", CFSTR("PCC_BW"));
    v730 = objc_claimAutoreleasedReturnValue();
    if (v730)
    {
      v731 = (void *)v730;
      objc_msgSend(v729, "objectForKeyedSubscript:", CFSTR("SCC1_BW"));
      v732 = objc_claimAutoreleasedReturnValue();
      if (!v732)
      {
LABEL_222:

        goto LABEL_223;
      }
      v733 = (void *)v732;
      objc_msgSend(v729, "objectForKeyedSubscript:", CFSTR("SCC2_BW"));
      v734 = (void *)objc_claimAutoreleasedReturnValue();

      if (v734)
      {
        objc_msgSend(v729, "objectForKeyedSubscript:", CFSTR("PCC_BW"));
        v735 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v735, "doubleValue");
        v736 = v679;
        -[PLBBAgent translateChannelRBsToChannelBW:](self, "translateChannelRBsToChannelBW:");
        v738 = v737;
        objc_msgSend(v729, "objectForKeyedSubscript:", CFSTR("SCC1_BW"));
        v739 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v739, "doubleValue");
        -[PLBBAgent translateChannelRBsToChannelBW:](self, "translateChannelRBsToChannelBW:");
        v741 = v738 + v740;
        objc_msgSend(v729, "objectForKeyedSubscript:", CFSTR("SCC2_BW"));
        v742 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v742, "doubleValue");
        -[PLBBAgent translateChannelRBsToChannelBW:](self, "translateChannelRBsToChannelBW:");
        v744 = v741 + v743;

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i"), (int)v744);
        v731 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1164, "objectForKeyedSubscript:", v679);
        v745 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v745, "objectForKeyedSubscript:", CFSTR("LTE"));
        v746 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v746, "objectForKeyedSubscript:", CFSTR("3CAMultiplier"));
        v747 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v747, "objectForKeyedSubscript:", v731);
        v748 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v748, "doubleValue");
        v750 = v749;

        v679 = v736;
        v751 = 1.0;
        if (v750 > 0.0)
          v751 = v750;
        v567 = v567 * v751;
        goto LABEL_222;
      }
    }
LABEL_223:
    v1110 = v568 + v565 + v567;
    goto LABEL_224;
  }
LABEL_320:

}

uint64_t __33__PLBBAgent_modelMav10BBHWPower___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88383A = result;
  return result;
}

uint64_t __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1178(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88383B = result;
  return result;
}

uint64_t __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1183(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88383C = result;
  return result;
}

uint64_t __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1188(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88383D = result;
  return result;
}

uint64_t __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1193(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88383E = result;
  return result;
}

uint64_t __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1201(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88383F = result;
  return result;
}

uint64_t __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1210(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883840 = result;
  return result;
}

uint64_t __33__PLBBAgent_modelMav10BBHWPower___block_invoke_1215(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883841 = result;
  return result;
}

- (void)modelMavBBHWOtherPerRATPower:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  double v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  void *v99;
  void *v100;
  uint64_t i;
  void *v102;
  double v103;
  void *v104;
  double v105;
  double v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  double v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  PLBBAgent *v131;
  void *v132;
  double v133;
  void *v134;
  double v135;
  void *v136;
  double v137;
  void *v138;
  void *v139;
  double v140;
  double v141;
  double v142;
  id v143;

  v143 = a3;
  objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOtherPerRAT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOtherPerRAT"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = 0;
      while (1)
      {
        objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOtherPerRAT"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
          break;
        if (v6 == ++v7)
          goto LABEL_6;
      }
    }
    else
    {
LABEL_6:
      objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOther"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOther"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "entryDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("LogDuration"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v17 = v16;

        if (v17 > 0.0)
        {
          v124 = v17;
          v129 = v13;
          objc_msgSend(MEMORY[0x1E0D80078], "MavRevStringQuery");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D80078], "powerModelForOperatorName:", CFSTR("baseband"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = v14;
          v131 = self;
          if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:") & 1) != 0)
            goto LABEL_10;
          v20 = 0.0;
          v21 = 0.0;
          v22 = 0.0;
          v23 = 0.0;
          v24 = 0.0;
          v25 = 0.0;
          v26 = 0.0;
          v27 = 0.0;
          if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003002))
          {
LABEL_10:
            objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOtherPerRAT"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOtherPerRAT"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOtherPerRAT"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "objectAtIndexedSubscript:", 2);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOtherPerRAT"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectAtIndexedSubscript:", 3);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            v127 = v29;
            objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("TxPowerHist"));
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            v126 = v31;
            objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("TxPowerHist"));
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            v125 = v33;
            objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("TxPowerHist"));
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("TxPowerHist"));
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = 0;
            v27 = 0.0;
            v26 = 0.0;
            v25 = 0.0;
            v24 = 0.0;
            v23 = 0.0;
            v22 = 0.0;
            v21 = 0.0;
            v20 = 0.0;
            do
            {
              objc_msgSend(v134, "objectAtIndexedSubscript:", v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "doubleValue");
              v27 = v27 + v38;

              objc_msgSend(v132, "objectAtIndexedSubscript:", v36);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "doubleValue");
              v141 = v26 + v40;

              objc_msgSend(v138, "objectAtIndexedSubscript:", v36);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "doubleValue");
              v43 = v25 + v42;

              objc_msgSend(v136, "objectAtIndexedSubscript:", v36);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "doubleValue");
              v24 = v24 + v45;

              objc_msgSend(v134, "objectAtIndexedSubscript:", v36);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "doubleValue");
              v48 = v47;
              objc_msgSend(v19, "objectForKeyedSubscript:", v18);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("CDMA2K"));
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("txPower"));
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "objectAtIndexedSubscript:", v36);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "doubleValue");
              v20 = v20 + v48 * v53;

              objc_msgSend(v132, "objectAtIndexedSubscript:", v36);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "doubleValue");
              v56 = v55;
              objc_msgSend(v19, "objectForKeyedSubscript:", v18);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("1xEVDO"));
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("txPower"));
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "objectAtIndexedSubscript:", v36);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "doubleValue");
              v21 = v21 + v56 * v61;

              objc_msgSend(v138, "objectAtIndexedSubscript:", v36);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "doubleValue");
              v64 = v63;
              objc_msgSend(v19, "objectForKeyedSubscript:", v18);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("GSM"));
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("txPower"));
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "objectAtIndexedSubscript:", v36);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "doubleValue");
              v22 = v22 + v64 * v69;

              objc_msgSend(v136, "objectAtIndexedSubscript:", v36);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "doubleValue");
              v72 = v71;
              objc_msgSend(v19, "objectForKeyedSubscript:", v18);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("WCDMA"));
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("txPower"));
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "objectAtIndexedSubscript:", v36);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "doubleValue");
              v23 = v23 + v72 * v77;
              v25 = v43;
              v26 = v141;

              ++v36;
            }
            while (v36 != 12);

            v14 = v130;
            self = v131;
          }
          v133 = v22;
          v137 = v24;
          v142 = v26;
          if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003001) & 1) != 0
            || (v78 = 0.0, v79 = 0.0, objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003002)))
          {
            v80 = v25;
            objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOtherPerRAT"));
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "objectAtIndexedSubscript:", 4);
            v82 = (void *)objc_claimAutoreleasedReturnValue();

            v139 = v82;
            objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("TxPowerHist"));
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = 0;
            v79 = 0.0;
            v78 = 0.0;
            do
            {
              objc_msgSend(v83, "objectAtIndexedSubscript:", v84);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "doubleValue");
              v79 = v79 + v86;

              objc_msgSend(v83, "objectAtIndexedSubscript:", v84);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "doubleValue");
              v89 = v88;
              objc_msgSend(v19, "objectForKeyedSubscript:", v18);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("LTE"));
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("txPower"));
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "objectAtIndexedSubscript:", v84);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "doubleValue");
              v78 = v78 + v89 * v94;

              ++v84;
            }
            while (v84 != 12);

            v14 = v130;
            self = v131;
            v25 = v80;
            v26 = v142;
          }
          v135 = v23;
          v140 = v27;
          v95 = 0.0;
          v96 = 0.0;
          if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003002))
          {
            v97 = v25;
            objc_msgSend(v143, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOtherPerRAT"));
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "objectAtIndexedSubscript:", 5);
            v99 = (void *)objc_claimAutoreleasedReturnValue();

            v128 = v99;
            objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("TxPowerHist"));
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            for (i = 0; i != 12; ++i)
            {
              objc_msgSend(v100, "objectAtIndexedSubscript:", i);
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "doubleValue");
              v95 = v95 + v103;

              objc_msgSend(v100, "objectAtIndexedSubscript:", i);
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v104, "doubleValue");
              v106 = v105;
              objc_msgSend(v19, "objectForKeyedSubscript:", v18);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("UTRAN"));
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("txPower"));
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "objectAtIndexedSubscript:", i);
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v110, "doubleValue");
              v96 = v96 + v106 * v111;

            }
            v14 = v130;
            self = v131;
            v25 = v97;
            v26 = v142;
          }
          v112 = v20 / v140;
          if (v140 <= 0.0)
            v112 = 0.0;
          v113 = v21 / v26;
          if (v26 <= 0.0)
            v113 = 0.0;
          v114 = v133 / v25;
          if (v25 <= 0.0)
            v114 = 0.0;
          v115 = v135 / v137;
          if (v137 <= 0.0)
            v115 = 0.0;
          v116 = v78 / v79;
          if (v79 <= 0.0)
            v116 = 0.0;
          v117 = v96 / v95;
          if (v95 <= 0.0)
            v117 = 0.0;
          v118 = v115 + v114 + v113 + v112 + v116 + v117;
          objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 45, v14, v118);

          objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBBAgent lastBBProtoPower](self, "lastBBProtoPower");
          objc_msgSend(v120, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 22, v14);

          if (((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003001) & 1) != 0
             || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003002))
            && !-[PLBBAgent lteCurrentState](self, "lteCurrentState"))
          {
            objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v121, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 21, v14, 0.0);

          }
          if (v118 > 100.0)
          {
            objc_msgSend(v14, "dateByAddingTimeInterval:", v124 * -0.0000305175781);
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 1, &unk_1E8650948, v122);

          }
          v13 = v129;
        }

      }
    }
  }

}

- (float)translateTransBW:(int)a3
{
  if (a3 > 5)
    return 50.0;
  else
    return flt_1CB389138[a3];
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883842 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1471(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883843 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1476(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883844 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1481(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883845 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1486(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883846 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1491(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883847 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1496(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883848 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1501(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883849 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1506(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88384A = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1511(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88384B = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1516(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88384C = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1521(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88384D = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1526(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88384E = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1531(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88384F = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1536(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883850 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1541(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883851 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1546(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883852 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1551(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883853 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1556(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883854 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1561(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883855 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1566(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883856 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1571(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883857 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1576(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883858 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1581(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883859 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1586(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88385A = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1591(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88385B = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1596(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88385C = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1601(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88385D = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1606(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88385E = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1611(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88385F = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1616(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883860 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1621(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883861 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1626(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883862 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1631(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883863 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1636(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883864 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1641(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883865 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1646(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883866 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1651(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883867 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1656(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883868 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1661(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883869 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1666(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88386A = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1671(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88386B = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1676(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88386C = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1681(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88386D = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1686(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88386E = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1691(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88386F = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1696(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883870 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1701(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883871 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1706(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883872 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1711(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883873 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1716(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883874 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1721(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883875 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1726(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883876 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1731(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883877 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1736(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883878 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1741(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883879 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1746(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88387A = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1751(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88387B = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1756(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88387C = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1761(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88387D = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1766(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88387E = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1771(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88387F = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1776(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883880 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1781(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883881 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1786(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883882 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1791(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883883 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1796(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883884 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1801(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883885 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1806(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883886 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1811(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883887 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1816(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883888 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1821(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883889 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1826(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88388A = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1829(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88388B = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1834(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88388C = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1839(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88388D = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1844(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88388E = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1849(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88388F = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1852(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883890 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1855(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883891 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1860(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883892 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1865(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883893 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1870(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883894 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1875(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883895 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1878(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883896 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1881(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883897 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1886(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883898 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1891(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883899 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1896(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88389A = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1901(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88389B = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1906(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88389C = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1911(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88389D = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1916(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88389E = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1921(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88389F = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1926(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838A0 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1931(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838A1 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1936(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838A2 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1941(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838A3 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1946(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838A4 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1951(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838A5 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1956(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838A6 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1961(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838A7 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1966(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838A8 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1971(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838A9 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1976(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838AA = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1981(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838AB = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1986(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838AC = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1991(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838AD = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_1996(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838AE = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2001(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838AF = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2006(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838B0 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2011(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838B1 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2016(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838B2 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2021(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838B3 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2026(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838B4 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2031(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838B5 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2036(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838B6 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2041(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838B7 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2046(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838B8 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2051(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838B9 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2056(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838BA = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2061(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838BB = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2066(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838BC = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2071(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838BD = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2076(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838BE = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2081(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838BF = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2086(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838C0 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2091(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838C1 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2096(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838C2 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2101(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838C3 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2106(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838C4 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2111(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838C5 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2116(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838C6 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2121(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838C7 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2126(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838C8 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2131(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838C9 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2136(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838CA = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2141(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838CB = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2146(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838CC = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2151(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838CD = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2156(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838CE = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2161(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838CF = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2166(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838D0 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2171(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838D1 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2176(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838D2 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2181(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838D3 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2186(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838D4 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2191(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838D5 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2196(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838D6 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2201(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838D7 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2206(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838D8 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2211(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838D9 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2216(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838DA = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2221(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838DB = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2226(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838DC = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2231(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838DD = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2236(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838DE = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2241(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838DF = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2246(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838E0 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2251(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838E1 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2256(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838E2 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2261(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838E3 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2266(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838E4 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2271(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838E5 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2276(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838E6 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2281(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838E7 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2286(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838E8 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2291(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838E9 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2296(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838EA = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2301(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838EB = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2306(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838EC = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2311(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838ED = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2316(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838EE = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2321(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838EF = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2326(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838F0 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2331(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838F1 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2336(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838F2 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2341(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838F3 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2346(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838F4 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2351(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838F5 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2356(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838F6 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2361(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838F7 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2366(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838F8 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2371(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838F9 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2376(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838FA = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2381(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838FB = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2386(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838FC = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2391(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838FD = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2396(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838FE = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2401(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8838FF = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2406(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883900 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2411(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883901 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2416(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883902 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2421(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883903 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2426(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883904 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2431(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883905 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2436(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883906 = result;
  return result;
}

uint64_t __28__PLBBAgent_modelBB16Power___block_invoke_2445(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883907 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883908 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2450(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883909 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2455(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88390A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2460(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88390B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2465(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88390C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2470(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88390D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2475(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88390E = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2480(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88390F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2485(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883910 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2490(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883911 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2495(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883912 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2500(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883913 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2505(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883914 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2510(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883915 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2515(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883916 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2520(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883917 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2525(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883918 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2530(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883919 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2535(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88391A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2540(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88391B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2545(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88391C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2550(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88391D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2555(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88391E = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2560(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88391F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2565(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883920 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2570(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883921 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2575(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883922 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2580(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883923 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2585(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883924 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2590(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883925 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2595(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883926 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2600(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883927 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2605(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883928 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2610(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883929 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2615(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88392A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2620(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88392B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2625(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88392C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2630(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88392D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2635(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88392E = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2640(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88392F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2645(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883930 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2650(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883931 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2655(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883932 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2660(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883933 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2665(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883934 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2670(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883935 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2675(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883936 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2680(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883937 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2685(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883938 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2690(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883939 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2695(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88393A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2700(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88393B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2705(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88393C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2710(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88393D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2715(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88393E = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2720(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88393F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2725(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883940 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2730(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883941 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2735(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883942 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2740(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883943 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2745(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883944 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2750(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883945 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2755(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883946 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2760(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883947 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2765(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883948 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2770(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883949 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2775(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88394A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2780(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88394B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2785(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88394C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2790(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88394D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2795(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88394E = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2800(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88394F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2805(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883950 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2810(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883951 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2813(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883952 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2818(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883953 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2823(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883954 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2828(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883955 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2833(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883956 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2838(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883957 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2843(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883958 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2848(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883959 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2853(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88395A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2858(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88395B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2863(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88395C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2868(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88395D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2873(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88395E = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2878(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88395F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2883(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883960 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2888(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883961 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2893(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883962 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2898(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883963 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2903(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883964 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2908(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883965 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2913(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883966 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2918(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883967 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2923(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883968 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2928(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883969 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2933(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88396A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2938(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88396B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2943(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88396C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2948(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88396D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2953(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88396E = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2958(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88396F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2963(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883970 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2968(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883971 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2973(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883972 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2978(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883973 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2983(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883974 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2988(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883975 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2993(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883976 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_2998(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883977 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3003(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883978 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3008(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883979 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3013(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88397A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3018(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88397B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3023(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88397C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3028(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88397D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3033(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88397E = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3038(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88397F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3043(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883980 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3048(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883981 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3053(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883982 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3058(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883983 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3063(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883984 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3068(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883985 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3073(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883986 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3078(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883987 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3083(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883988 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3088(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883989 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3093(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88398A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3098(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88398B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3103(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88398C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3108(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88398D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3113(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88398E = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3118(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88398F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3123(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883990 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3128(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883991 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3133(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883992 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3138(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883993 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3143(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883994 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3148(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883995 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3153(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883996 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3158(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883997 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3163(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883998 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3168(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883999 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3173(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88399A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3178(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88399B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3183(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88399C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3188(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88399D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3193(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88399E = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3198(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88399F = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3203(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839A0 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3208(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839A1 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3213(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839A2 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3218(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839A3 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3223(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839A4 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3228(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839A5 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3233(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839A6 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3238(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839A7 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3243(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839A8 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3248(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839A9 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3253(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839AA = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3258(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839AB = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3263(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839AC = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3268(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839AD = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3273(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839AE = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3278(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839AF = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3283(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839B0 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3288(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839B1 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3293(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839B2 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3298(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839B3 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3303(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839B4 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3308(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839B5 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3313(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839B6 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3318(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839B7 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3323(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839B8 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3328(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839B9 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3333(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839BA = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3338(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839BB = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3343(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839BC = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3348(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839BD = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3353(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839BE = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3358(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839BF = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3363(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839C0 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3368(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839C1 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3373(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839C2 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3378(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839C3 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3383(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839C4 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3388(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839C5 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3393(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839C6 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3398(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839C7 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3403(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839C8 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3408(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839C9 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3413(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839CA = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3416(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839CB = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3419(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839CC = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3422(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839CD = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3425(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839CE = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3430(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839CF = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3435(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839D0 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3440(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839D1 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3445(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839D2 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3450(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839D3 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3455(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839D4 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3460(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839D5 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3465(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839D6 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3470(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839D7 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3475(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839D8 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3480(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839D9 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3485(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839DA = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3490(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839DB = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3495(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839DC = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3500(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839DD = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3505(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839DE = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3510(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839DF = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3515(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839E0 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3520(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839E1 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3525(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839E2 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3530(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839E3 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3533(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839E4 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3536(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839E5 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3539(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839E6 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3542(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839E7 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3547(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839E8 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3550(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839E9 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3555(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839EA = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3560(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839EB = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3565(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839EC = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3570(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839ED = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3575(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839EE = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3580(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839EF = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3585(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839F0 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3590(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839F1 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3595(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839F2 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3600(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839F3 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3605(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839F4 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3610(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839F5 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3613(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839F6 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3616(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839F7 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3619(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839F8 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3622(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839F9 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3625(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839FA = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3628(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839FB = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3631(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839FC = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3634(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839FD = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3637(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839FE = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3640(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8839FF = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3643(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A00 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3646(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A01 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3651(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A02 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3656(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A03 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3659(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A04 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3664(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A05 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3667(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A06 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3670(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A07 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3675(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A08 = result;
  return result;
}

uint64_t __27__PLBBAgent_modelMavPower___block_invoke_3682(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A09 = result;
  return result;
}

+ (id)indexToRat:(unint64_t)a3
{
  if (a3 > 5)
    return &stru_1E8587D00;
  else
    return off_1E857DE80[a3];
}

- (void)modelScanPower:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  uint64_t v44;
  void *v45;
  double v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  void *v85;
  double v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  double v99;
  void *v100;
  void *v101;
  void *v102;
  double v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t i;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  double v122;
  double v123;
  void *v124;
  double v125;
  double v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  double v131;
  double v132;
  double v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  uint64_t v157;
  void *v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  _BYTE v163[128];
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOtherPerRAT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_63;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOtherPerRAT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v157 = v6;
  if (!v6)
    goto LABEL_63;
  objc_msgSend(MEMORY[0x1E0D80078], "MavRevStringQuery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOther"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "entryDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("LogDuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  if (v13 <= 0.0)
    goto LABEL_62;
  v137 = v9;
  v138 = v10;
  v154 = v7;
  v155 = v3;
  objc_msgSend(MEMORY[0x1E0D80078], "powerModelForOperatorName:", CFSTR("baseband"));
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = 0.0;
  v16 = 0.0;
  do
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOtherPerRAT"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_12;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOtherPerRAT"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("RadioTech"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "intValue");

    +[PLBBAgent indexToRat:](PLBBAgent, "indexToRat:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_61;
    v24 = (void *)v23;
    objc_msgSend(v156, "objectForKeyedSubscript:", v7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("SCAN"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    v29 = v28;

    objc_msgSend(v156, "objectForKeyedSubscript:", v7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", v24);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("CELL_SEL_RESEL"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValue");
    v34 = v33;

    objc_msgSend(v156, "objectForKeyedSubscript:", v7);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKeyedSubscript:", v24);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("IDLE"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "doubleValue");

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOtherPerRAT"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectAtIndexedSubscript:", v14);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("ProtocolStateHist"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectAtIndexedSubscript:", 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "doubleValue");
    v43 = v42;

    if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003001) & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003002) & 1) != 0)
    {
      v44 = 12;
    }
    else
    {
      if (!objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMavLeg"))
        goto LABEL_11;
      v44 = 11;
    }
    objc_msgSend(v40, "objectAtIndexedSubscript:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "doubleValue");
    v15 = v46;

LABEL_11:
    objc_msgSend(v40, "objectAtIndexedSubscript:", 3);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "doubleValue");

    v16 = v16 + v34 * v15 + v43 * v29;
LABEL_12:
    ++v14;
  }
  while (v157 != v14);
  v48 = objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003001);
  if ((v48 & 1) != 0 || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003002))
  {
    objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 46, v138, v16 / v13);

  }
  if (!objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMavLeg"))
    goto LABEL_61;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOtherPerRAT"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = 0.0;
  if (!v50)
  {
    v53 = 0;
    v158 = 0;
    v65 = 0.0;
    v66 = v138;
    v62 = v156;
    goto LABEL_51;
  }
  v161 = 0u;
  v162 = 0u;
  v159 = 0u;
  v160 = 0u;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_MavBBHwOtherPerRAT"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v159, v163, 16);
  if (!v53)
  {
    v158 = 0;
    v65 = 0.0;
    v66 = v138;
    v62 = v156;
    goto LABEL_50;
  }
  v54 = 0;
  v158 = 0;
  v55 = *(_QWORD *)v160;
  while (2)
  {
    v56 = 0;
    while (2)
    {
      if (*(_QWORD *)v160 != v55)
        objc_enumerationMutation(v52);
      v57 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * v56);
      objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("RadioTech"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "intValue");

      if (v59)
      {
        if (v59 == 1)
        {
          v60 = v158;
          v158 = v57;
          goto LABEL_30;
        }
      }
      else
      {
        v60 = v54;
        v54 = v57;
LABEL_30:
        v61 = v57;

      }
      if (v53 != (void *)++v56)
        continue;
      break;
    }
    v53 = (void *)objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v159, v163, 16);
    if (v53)
      continue;
    break;
  }

  v62 = v156;
  v53 = v54;
  if (v54)
  {
    objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("ProtocolStateHist"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "objectAtIndexedSubscript:", 2);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "doubleValue");
    v65 = 0.0;
    v66 = v138;
    if (v67 >= v13)
      goto LABEL_37;
    objc_msgSend(v63, "objectAtIndexedSubscript:", 3);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "doubleValue");
    v70 = v69;

    if (v70 < v13)
    {
      objc_msgSend(v63, "objectAtIndexedSubscript:", 2);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "doubleValue");
      v73 = v72;
      objc_msgSend(v156, "objectForKeyedSubscript:", v154);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("CDMA2K"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("SCAN"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "doubleValue");
      v78 = v73 * v77 + 0.0;

      objc_msgSend(v63, "objectAtIndexedSubscript:", 3);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "doubleValue");
      v80 = v79;
      objc_msgSend(v156, "objectForKeyedSubscript:", v154);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("CDMA2K"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("CELL_SEL_RESEL"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "doubleValue");
      v65 = v78 + v80 * v84;

LABEL_37:
    }

    v53 = v54;
  }
  else
  {
    v65 = 0.0;
    v66 = v138;
  }
  if (v158)
  {
    objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("ProtocolStateHist"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectAtIndexedSubscript:", 2);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "doubleValue");
    if (v86 >= v13)
      goto LABEL_46;
    objc_msgSend(v52, "objectAtIndexedSubscript:", 3);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "doubleValue");
    v89 = v88;

    if (v89 >= v13)
    {
      v53 = v54;
    }
    else
    {
      objc_msgSend(v52, "objectAtIndexedSubscript:", 2);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "doubleValue");
      v92 = v91;
      objc_msgSend(v156, "objectForKeyedSubscript:", v154);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("1xEVDO"));
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("SCAN"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "doubleValue");
      v97 = v65 + v92 * v96;

      objc_msgSend(v52, "objectAtIndexedSubscript:", 3);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "doubleValue");
      v99 = v98;
      v62 = v156;
      objc_msgSend(v156, "objectForKeyedSubscript:", v154);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("1xEVDO"));
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("CELL_SEL_RESEL"));
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "doubleValue");
      v65 = v97 + v99 * v103;

      v53 = v54;
LABEL_46:

    }
    v3 = v155;
LABEL_50:

  }
  else
  {
    v158 = 0;
    v3 = v155;
  }
LABEL_51:
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_BBMavHwRfOos"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  if (v104)
  {
    v136 = v53;
    objc_msgSend(v155, "objectForKeyedSubscript:", CFSTR("PLBBAgent_EventBackward_BBMavHwRfOos"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "objectAtIndexedSubscript:", 0);
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("oosGsmPssiStatTicks"));
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("oosWcdmaPssiStatTicks"));
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("oosLtePssiStatTicks"));
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = v106;
    objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("oosTdsPssiStatTicks"));
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 6; ++i)
    {
      objc_msgSend(v142, "objectAtIndexedSubscript:", i);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "doubleValue");
      v109 = v108;
      objc_msgSend(v62, "objectForKeyedSubscript:", v154);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "objectForKeyedSubscript:", CFSTR("GSM"));
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "objectForKeyedSubscript:", CFSTR("Pssi"));
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "objectAtIndexedSubscript:", i);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v149, "doubleValue");
      v111 = v110;
      objc_msgSend(v141, "objectAtIndexedSubscript:", i);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "doubleValue");
      v113 = v112;
      objc_msgSend(v62, "objectForKeyedSubscript:", v154);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "objectForKeyedSubscript:", CFSTR("WCDMA"));
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v146, "objectForKeyedSubscript:", CFSTR("Pssi"));
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "objectAtIndexedSubscript:", i);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "doubleValue");
      v115 = v113 * v114 + v109 * v111;
      objc_msgSend(v140, "objectAtIndexedSubscript:", i);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "doubleValue");
      v117 = v116;
      objc_msgSend(v62, "objectForKeyedSubscript:", v154);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "objectForKeyedSubscript:", CFSTR("LTE"));
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "objectForKeyedSubscript:", CFSTR("Pssi"));
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v120, "objectAtIndexedSubscript:", i);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "doubleValue");
      v123 = v115 + v117 * v122;
      objc_msgSend(v139, "objectAtIndexedSubscript:", i);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "doubleValue");
      v126 = v125;
      objc_msgSend(v156, "objectForKeyedSubscript:", v154);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "objectForKeyedSubscript:", CFSTR("UTRAN"));
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "objectForKeyedSubscript:", CFSTR("Pssi"));
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "objectAtIndexedSubscript:", i);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "doubleValue");
      v65 = v65 + v123 + v126 * v131;

      v62 = v156;
    }
    v51 = v65 / v13;

    v66 = v138;
    v53 = v136;
  }
  v132 = 0.0;
  if (v51 >= 0.0)
    v132 = v51;
  if (v132 <= 2000.0)
    v133 = v132;
  else
    v133 = 2000.0;
  objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 47, v66, v133);

  v3 = v155;
LABEL_61:

  v7 = v154;
  v9 = v137;
  v10 = v138;
LABEL_62:

LABEL_63:
}

- (void)loadOOSModelValues
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PLBBAgent_loadOOSModelValues__block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  if (loadOOSModelValues_onceToken != -1)
    dispatch_once(&loadOOSModelValues_onceToken, block);
}

void __31__PLBBAgent_loadOOSModelValues__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D80078], "MavRevStringQuery");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80078], "powerModelForOperatorName:", CFSTR("baseband"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("OOS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gw"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  objc_msgSend(*(id *)(a1 + 32), "setOosGWPower:");

  objc_msgSend(v2, "objectForKeyedSubscript:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OOS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cdma"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(*(id *)(a1 + 32), "setOosCDMAPower:");

  objc_msgSend(v2, "objectForKeyedSubscript:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("OOS"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("hdr"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  objc_msgSend(*(id *)(a1 + 32), "setOosHDRPower:");

}

- (void)modelOOSPower:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  double oosGWPower;
  NSDate *v9;
  NSDate *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  int *v17;
  void *v18;
  double v19;
  double v20;
  NSDate *v21;
  NSDate *lastOOSTimestamp;
  void *v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double oosHDRPower;
  double totalOosHDRScanEnergy;
  NSDate *v30;
  id v31;

  v31 = a3;
  -[PLBBAgent loadOOSModelValues](self, "loadOOSModelValues");
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Event"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Action"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  if (v7 != 11)
  {
    if ((v5 - 1001) < 2 || !v7)
    {
      objc_msgSend(v31, "entryDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceDate:", self->_lastOOSTimestamp);
      v20 = v19;

      self->_totalOosGWScanEnergy = self->_totalOosGWScanEnergy + v20 * self->_lastGWPower;
      self->_lastGWPower = 0.0;
      objc_msgSend(v31, "entryDate");
      v21 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastOOSTimestamp = self->_lastOOSTimestamp;
      self->_lastOOSTimestamp = v21;
LABEL_21:

      goto LABEL_22;
    }
    if (v5 == 801)
    {
      if (self->_lastOOSTimestamp)
      {
        objc_msgSend(v31, "entryDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timeIntervalSinceDate:", self->_lastOOSTimestamp);
        v16 = v24;

        if (v16 < 0.15)
        {
          v17 = &OBJC_IVAR___PLBBAgent__oosHDRPower;
          goto LABEL_16;
        }
      }
      v25 = 360;
      oosHDRPower = self->_oosHDRPower;
      totalOosHDRScanEnergy = self->_totalOosHDRScanEnergy;
    }
    else
    {
      if (v5 != 301)
        goto LABEL_22;
      if (self->_lastOOSTimestamp)
      {
        objc_msgSend(v31, "entryDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", self->_lastOOSTimestamp);
        v16 = v15;

        if (v16 < 0.15)
        {
          v17 = &OBJC_IVAR___PLBBAgent__oosCDMAPower;
LABEL_16:
          v26 = *v17;
          v25 = v17[1];
          v27 = *(double *)((char *)&self->super.super.super.isa + v25)
              + v16 * *(double *)((char *)&self->super.super.super.isa + v26);
LABEL_20:
          *(double *)((char *)&self->super.super.super.isa + v25) = v27;
          objc_msgSend(v31, "entryDate");
          v30 = (NSDate *)objc_claimAutoreleasedReturnValue();
          lastOOSTimestamp = self->_lastOOSTimestamp;
          self->_lastOOSTimestamp = v30;
          goto LABEL_21;
        }
      }
      v25 = 352;
      oosHDRPower = self->_oosCDMAPower;
      totalOosHDRScanEnergy = self->_totalOosCDMAScanEnergy;
    }
    v27 = totalOosHDRScanEnergy + oosHDRPower * 0.15;
    goto LABEL_20;
  }
  oosGWPower = self->_oosGWPower;
  if (self->_lastGWPower != oosGWPower)
  {
    objc_msgSend(v31, "entryDate");
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v10 = self->_lastOOSTimestamp;
    self->_lastOOSTimestamp = v9;

    objc_msgSend(v31, "entryDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", self->_lastOOSTimestamp);
    v13 = v12;

    self->_totalOosGWScanEnergy = self->_totalOosGWScanEnergy + v13 * self->_lastGWPower;
    oosGWPower = self->_oosGWPower;
  }
  self->_lastGWPower = oosGWPower;
LABEL_22:

}

- (void)modelGPSPower:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  uint64_t v95;
  void *v96;
  void *v97;
  NSObject *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  void *v111;
  NSObject *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  void *v125;
  double v126;
  void *v127;
  void *v128;
  void *v129;
  _QWORD block[5];
  _QWORD v131[5];
  _QWORD v132[5];
  _QWORD v133[5];
  _QWORD v134[5];
  uint8_t buf[4];
  void *v136;
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D80078], "MavRevStringQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80078], "powerModelForOperatorName:", CFSTR("baseband"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003002) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003003) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003004) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003005) & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003007))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("GPS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("gps_dpo_bins_80ms"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v124 = v9;

    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("GPS"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("gps_dpo_bins_200ms"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v123 = v13;

    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("GPS"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("gps_dpo_bins_400ms"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v122 = v17;

    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("GPS"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("gps_dpo_bins_1000ms"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    v121 = v21;

    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("GPS"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("gps_dpo_bins_unknown"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v120 = v25;

    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("GPS"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("gps_dpo_bins_aborted"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v119 = v29;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("GPSOnOffStateHistogram"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("GPSDPOOnOffStateHistogram"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("GPSDPOBins"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LogDuration"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "doubleValue");
    v35 = v34;

    objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "doubleValue");
    v126 = v37;

    objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "doubleValue");
    v40 = v39;

    objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "doubleValue");
    v43 = v42;

    objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "doubleValue");
    v46 = v45;

    objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "doubleValue");
    v118 = v48;

    objc_msgSend(v32, "objectAtIndexedSubscript:", 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "doubleValue");
    v117 = v50;

    objc_msgSend(v32, "objectAtIndexedSubscript:", 2);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "doubleValue");
    v53 = v52;

    objc_msgSend(v32, "objectAtIndexedSubscript:", 3);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "doubleValue");
    v56 = v55;

    objc_msgSend(v32, "objectAtIndexedSubscript:", 4);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "doubleValue");
    v59 = v58;

    objc_msgSend(v32, "objectAtIndexedSubscript:", 5);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "doubleValue");
    v62 = v61;

    if (v126 + v40 >= v35 && v43 + v46 >= v35)
    {
      v63 = 0.0;
      if (v35 > 0.0)
        v63 = (v123 * v117 + v118 * v124 + v53 * v122 + v56 * v121 + v59 * v120 + v62 * v119) / v35 * 32768.0;
      goto LABEL_10;
    }

    goto LABEL_21;
  }
  if (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003001))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("GPS"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("gps_dpo"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "doubleValue");
    v77 = v76;

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("GPSOnOffStateHistogram"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("GPSDPOOnOffStateHistogram"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LogDuration"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "doubleValue");
    v80 = v79;

    objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "doubleValue");
    v83 = v82;

    objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "doubleValue");
    v86 = v85;

    objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "doubleValue");
    v89 = v88;

    objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "doubleValue");
    v92 = v91;

    v94 = v83 + v86;
    if (v94 < v80 || (v93 = v89 + v92, v89 + v92 < v80))
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled", v93))
      {
        v104 = objc_opt_class();
        v134[0] = MEMORY[0x1E0C809B0];
        v134[1] = 3221225472;
        v134[2] = __27__PLBBAgent_modelGPSPower___block_invoke;
        v134[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v134[4] = v104;
        if (qword_1ED885FC0 != -1)
          dispatch_once(&qword_1ED885FC0, v134);
        if (byte_1ED883A0A)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("gpsOnDuration + gpsOffDuration = %f"), *(_QWORD *)&v94);
          v105 = objc_claimAutoreleasedReturnValue();
          v128 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "lastPathComponent");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent modelGPSPower:]");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "logMessage:fromFile:fromFunction:fromLineNumber:", v105, v107, v108, 9583);

          v109 = (void *)v105;
          PLLogCommon();
          v110 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v136 = v109;
            _os_log_debug_impl(&dword_1CAF47000, v110, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "entryDate");
      v112 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 48, v112, 0.0);
    }
    else
    {
      if (v86 >= v92)
        v86 = v92;
      if (v80 > 0.0)
      {
        v63 = v77 * v86 / v80;
        if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          goto LABEL_11;
        v95 = objc_opt_class();
        v133[0] = MEMORY[0x1E0C809B0];
        v133[1] = 3221225472;
        v133[2] = __27__PLBBAgent_modelGPSPower___block_invoke_3725;
        v133[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v133[4] = v95;
        if (qword_1ED885FC8 != -1)
          dispatch_once(&qword_1ED885FC8, v133);
        if (!byte_1ED883A0B)
          goto LABEL_11;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("gpsDPOOnDuration = %f, logDuration = %f, power = %f"), *(_QWORD *)&v86, *(_QWORD *)&v80, *(_QWORD *)&v63);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v125 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "lastPathComponent");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent modelGPSPower:]");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v125, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v96, v97, 9600);

        PLLogCommon();
        v98 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v136 = v32;
          _os_log_debug_impl(&dword_1CAF47000, v98, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

LABEL_10:
LABEL_11:

        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v64 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __27__PLBBAgent_modelGPSPower___block_invoke_3740;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v64;
          if (qword_1ED885FE0 != -1)
            dispatch_once(&qword_1ED885FE0, block);
          if (byte_1ED883A0E)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("modelGPSPower: Add %f to rail"), *(_QWORD *)&v63);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "lastPathComponent");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent modelGPSPower:]");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "logMessage:fromFile:fromFunction:fromLineNumber:", v65, v68, v69, 9615);

            PLLogCommon();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v136 = v65;
              _os_log_debug_impl(&dword_1CAF47000, v70, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "entryDate");
        v72 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "createPowerEventBackwardWithRootNodeID:withPower:withEndDate:", 48, v72, v63);
LABEL_19:

        goto LABEL_22;
      }
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled", v93))
        goto LABEL_21;
      v113 = objc_opt_class();
      v132[0] = MEMORY[0x1E0C809B0];
      v132[1] = 3221225472;
      v132[2] = __27__PLBBAgent_modelGPSPower___block_invoke_3730;
      v132[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v132[4] = v113;
      if (qword_1ED885FD0 != -1)
        dispatch_once(&qword_1ED885FD0, v132);
      if (!byte_1ED883A0C)
      {
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("modelGPSPower: LogDuration is zero"));
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "lastPathComponent");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent modelGPSPower:]");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "logMessage:fromFile:fromFunction:fromLineNumber:", v111, v115, v116, 9602);

      PLLogCommon();
      v112 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v136 = v111;
        _os_log_debug_impl(&dword_1CAF47000, v112, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }

    goto LABEL_21;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v99 = objc_opt_class();
    v131[0] = MEMORY[0x1E0C809B0];
    v131[1] = 3221225472;
    v131[2] = __27__PLBBAgent_modelGPSPower___block_invoke_3735;
    v131[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v131[4] = v99;
    if (qword_1ED885FD8 != -1)
      dispatch_once(&qword_1ED885FD8, v131);
    if (byte_1ED883A0D)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Mav version not found, return"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "lastPathComponent");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent modelGPSPower:]");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "logMessage:fromFile:fromFunction:fromLineNumber:", v71, v102, v103, 9607);

      PLLogCommon();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v136 = v71;
        _os_log_debug_impl(&dword_1CAF47000, v72, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_19;
    }
  }
LABEL_22:

}

uint64_t __27__PLBBAgent_modelGPSPower___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A0A = result;
  return result;
}

uint64_t __27__PLBBAgent_modelGPSPower___block_invoke_3725(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A0B = result;
  return result;
}

uint64_t __27__PLBBAgent_modelGPSPower___block_invoke_3730(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A0C = result;
  return result;
}

uint64_t __27__PLBBAgent_modelGPSPower___block_invoke_3735(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A0D = result;
  return result;
}

uint64_t __27__PLBBAgent_modelGPSPower___block_invoke_3740(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A0E = result;
  return result;
}

- (void)accountVoicePower:(id)a3 state:(id)a4
{
  id v6;
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
  id v19;

  v19 = a3;
  v6 = a4;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMavLeg") & 1) == 0)
  {
    objc_msgSend(v19, "objectForKey:", CFSTR("callId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("voice_start")))
      {
        -[PLBBAgent currentCallList](self, "currentCallList");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "count");

        -[PLBBAgent currentCallList](self, "currentCallList");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("callId"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v11);

LABEL_8:
        goto LABEL_9;
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("voice_end")))
      {
        -[PLBBAgent currentCallList](self, "currentCallList");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("callId"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "description");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[PLBBAgent currentCallList](self, "currentCallList");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("callId"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "description");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeObjectForKey:", v18);

          -[PLBBAgent currentCallList](self, "currentCallList");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "count");
          goto LABEL_8;
        }
      }
    }
  }
LABEL_9:

}

- (void)createOOSAccountingEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(v19, "objectForKey:", CFSTR("status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v19;
  if (v4)
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("status"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("NotRegistered")) & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("status"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "isEqualToString:", CFSTR("EmergencyOnly"));

    }
    if (-[PLBBAgent isFirstTimeAccountingOOS](self, "isFirstTimeAccountingOOS"))
    {
      -[PLBBAgent setIsBBOOS:](self, "setIsBBOOS:", v8 ^ 1);
      -[PLBBAgent setIsFirstTimeAccountingOOS:](self, "setIsFirstTimeAccountingOOS:", 0);
    }
    v11 = -[PLBBAgent isBBOOS](self, "isBBOOS");
    if ((_DWORD)v8)
    {
      v5 = v19;
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "entryDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 40, &unk_1E864CCD8, v13);

        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "entryDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = &unk_1E8650990;
LABEL_12:
        objc_msgSend(v14, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 1, v16, v15);

        -[PLBBAgent setIsBBOOS:](self, "setIsBBOOS:", v8);
        v5 = v19;
      }
    }
    else
    {
      v5 = v19;
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "entryDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 40, MEMORY[0x1E0C9AA70], v18);

        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "entryDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_12;
      }
    }
  }

}

- (void)registerForAirplaneModeChange
{
  void *v3;
  __CFString *v4;
  void *v5;
  const __SCPreferences *v6;
  const __SCPreferences *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t block;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  uint64_t v21;
  SCPreferencesContext context;
  uint8_t buf[4];
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processName");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = self;
  v6 = SCPreferencesCreate(0, v4, CFSTR("com.apple.radios.plist"));
  qword_1ED885FE8 = (uint64_t)v6;
  if (v6)
  {
    SCPreferencesSetCallback(v6, (SCPreferencesCallBack)preferencesChanged, &context);
    v7 = (const __SCPreferences *)qword_1ED885FE8;
    -[PLOperator workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    SCPreferencesSetDispatchQueue(v7, v8);
LABEL_5:

    goto LABEL_13;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __42__PLBBAgent_registerForAirplaneModeChange__block_invoke;
    v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    v21 = v9;
    if (qword_1ED885FF0 != -1)
      dispatch_once(&qword_1ED885FF0, &block);
    if (byte_1ED883A0F)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = SCError();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("Unable to create preferences handle: %s"), SCErrorString(v11), block, v18, v19, v20, v21, context.version, context.info, context.retain, context.release, context.copyDescription);
      v8 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent registerForAirplaneModeChange]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v14, v15, 9796);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_5;
    }
  }
LABEL_13:

}

uint64_t __42__PLBBAgent_registerForAirplaneModeChange__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A0F = result;
  return result;
}

- (BOOL)isChangedAndSetAirplaneMode
{
  void *v2;
  __CFString *v3;
  void *v4;
  const __SCPreferences *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  char v15;
  uint64_t block;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "processName");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v5 = SCPreferencesCreateWithAuthorization((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v3, CFSTR("com.apple.radios.plist"), 0);
  if (SCPreferencesGetValue(v5, CFSTR("AirplaneMode")) == (CFPropertyListRef)*MEMORY[0x1E0C9AE50])
    v6 = CFSTR("on");
  else
    v6 = CFSTR("off");
  v7 = v6;
  CFRelease(v5);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __40__PLBBAgent_isChangedAndSetAirplaneMode__block_invoke;
    v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    v21 = v8;
    if (qword_1ED886000 != -1)
      dispatch_once(&qword_1ED886000, &block);
    if (byte_1ED883A11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Airplane mode %@"), v7, block, v18, v19, v20, v21);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent isChangedAndSetAirplaneMode]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 9856);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v9;
        _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v15 = objc_msgSend(airplaneModeCurrent, "isEqualToString:", v7);
  if ((v15 & 1) == 0)
    objc_storeStrong((id *)&airplaneModeCurrent, v6);

  return v15 ^ 1;
}

uint64_t __40__PLBBAgent_isChangedAndSetAirplaneMode__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A11 = result;
  return result;
}

- (void)telephonyActivityNotificationCB_Agent:(id)a3 withName:(__CFString *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  __CFString *v18;
  _QWORD block[5];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  if (a4)
  {
    CFRetain(a4);
  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __60__PLBBAgent_telephonyActivityNotificationCB_Agent_withName___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED886008 != -1)
      dispatch_once(&qword_1ED886008, block);
    if (byte_1ED883A12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad name in Tel Act CB"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent telephonyActivityNotificationCB_Agent:withName:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 9872);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLOperator workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __60__PLBBAgent_telephonyActivityNotificationCB_Agent_withName___block_invoke_3782;
  v16[3] = &unk_1E857B418;
  v17 = v6;
  v18 = a4;
  v16[4] = self;
  v15 = v6;
  dispatch_async(v14, v16);

}

uint64_t __60__PLBBAgent_telephonyActivityNotificationCB_Agent_withName___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A12 = result;
  return result;
}

void __60__PLBBAgent_telephonyActivityNotificationCB_Agent_withName___block_invoke_3782(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  int v6;
  int v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  const void *v11;
  void *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  int v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  uint64_t v25;
  _QWORD v26[5];

  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CA76A8]))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *MEMORY[0x1E0CA76A0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setOpName:", v3);
LABEL_3:

    goto LABEL_14;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CA73B8]))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *MEMORY[0x1E0CA73B0]);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "lastReportedSignal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");
    v7 = v6 - objc_msgSend(v4, "integerValue");
    if (v7 >= 0)
      v8 = v7;
    else
      v8 = -v7;

    if (v8 >= 6)
      objc_msgSend(*(id *)(a1 + 32), "setChanged:", 1);
    goto LABEL_10;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CA7390]))
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __60__PLBBAgent_telephonyActivityNotificationCB_Agent_withName___block_invoke_2;
    v26[3] = &unk_1E857DCD8;
    v9 = *(void **)(a1 + 40);
    v26[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v26);
LABEL_13:
    objc_msgSend(*(id *)(a1 + 32), "setChanged:", 1);
    goto LABEL_14;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CA77E8]))
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *MEMORY[0x1E0CA77E0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSimStatus:", v3);
    goto LABEL_3;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CA72F0]))
    goto LABEL_13;
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CA7148]))
  {
    objc_msgSend(*(id *)(a1 + 32), "setChanged:", 1);
    objc_msgSend(*(id *)(a1 + 32), "logEventNoneBBReportBy:withAction:", 5, 3);
    goto LABEL_14;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CA7138]))
    goto LABEL_13;
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CA7478]))
  {
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CA7480]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "intValue");
    v15 = CFSTR("Unknown SMS/MMS");
    if (v14 == 2)
      v15 = CFSTR("MMS");
    if (v14 == 1)
      v16 = CFSTR("SMS");
    else
      v16 = v15;
    v17 = *(void **)(a1 + 32);
    v18 = CFSTR("Sent");
LABEL_42:
    objc_msgSend(v17, "logMessage:andState:", v16, v18);

LABEL_10:
    goto LABEL_14;
  }
  if (CFEqual(*(CFTypeRef *)(a1 + 48), (CFTypeRef)*MEMORY[0x1E0CA7470]))
  {
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CA7480]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v13, "intValue");
    v20 = CFSTR("Unknown SMS/MMS");
    if (v19 == 2)
      v20 = CFSTR("MMS");
    if (v19 == 1)
      v16 = CFSTR("SMS");
    else
      v16 = v20;
    v17 = *(void **)(a1 + 32);
    v18 = CFSTR("Received");
    goto LABEL_42;
  }
LABEL_14:
  if (objc_msgSend(*(id *)(a1 + 32), "changed"))
  {
    objc_msgSend(*(id *)(a1 + 32), "logTelephonyActivity");
    objc_msgSend(*(id *)(a1 + 32), "setChanged:", 0);
    v10 = objc_opt_class();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __60__PLBBAgent_telephonyActivityNotificationCB_Agent_withName___block_invoke_3;
    v24 = &__block_descriptor_40_e5_v8__0lu32l8;
    v25 = v10;
    if (qword_1ED886010 != -1)
      dispatch_once(&qword_1ED886010, &v21);
    if (byte_1ED883A13)
      objc_msgSend(*(id *)(a1 + 32), "logEventNoneBBReportBy:withAction:", 6, 4, v21, v22, v23, v24, v25);
  }
  v11 = *(const void **)(a1 + 48);
  if (v11)
    CFRelease(v11);
}

void __60__PLBBAgent_telephonyActivityNotificationCB_Agent_withName___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CA75B0]))
  {
    objc_msgSend(*(id *)(a1 + 32), "setInDCH:", v5);
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CA75B8]))
  {
    objc_msgSend(*(id *)(a1 + 32), "setInUTBF:", v5);
  }

}

uint64_t __60__PLBBAgent_telephonyActivityNotificationCB_Agent_withName___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A13 = result;
  return result;
}

- (void)logTelephonyActivity
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
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
  NSObject *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  _QWORD block[5];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v38 = 0;
  v39 = 0;
  v37 = 0;
  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__PLBBAgent_logTelephonyActivity__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED886018 != -1)
      dispatch_once(&qword_1ED886018, block);
    if (byte_1ED883A14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent logTelephonyActivity]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logTelephonyActivity]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 9975);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBAgent connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = 0;
  v33 = 0;
  objc_msgSend(v11, "getRAT:preferredRAT:campedRAT:", &v35, &v34, &v33);
  v12 = v35;
  v13 = v34;
  v14 = v33;

  -[PLBBAgent connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "getSignalStrength:asPercentage:withBars:", &v39, &v38, &v37);

  -[PLBBAgent telActMsgHelper](self, "telActMsgHelper");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActiveBand:", 0);
  -[PLBBAgent humanReadableDataActiveString](self, "humanReadableDataActiveString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDataStatus:", v17);

  objc_msgSend(v16, "setCurrentRat:", v12);
  objc_msgSend(v16, "setPreferredRat:", v13);
  objc_msgSend(v16, "setCampedRat:", v14);
  -[PLBBAgent connection](self, "connection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "currentCallStatus");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCallStatus:", v19);

  objc_msgSend(v16, "setAirplaneMode:", airplaneModeCurrent);
  -[PLBBAgent humanReadableSimStatusString](self, "humanReadableSimStatusString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSimStatus:", v20);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v39);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSignalStrength:", v21);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v37);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSignalBars:", v22);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v39);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBAgent setLastReportedSignal:](self, "setLastReportedSignal:", v23);

  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode") & 1) == 0)
  {
    -[PLBBAgent operatorName](self, "operatorName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      if (!-[PLBBAgent changed](self, "changed"))
        -[PLBBAgent logOperatorName](self, "logOperatorName");
    }
    else
    {
      v25 = (void *)CTRegistrationCopyOperatorName();
      -[PLBBAgent setOperatorName:](self, "setOperatorName:", v25);

    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v32[0] = v4;
    v32[1] = 3221225472;
    v32[2] = __33__PLBBAgent_logTelephonyActivity__block_invoke_3795;
    v32[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v32[4] = objc_opt_class();
    if (qword_1ED886020 != -1)
      dispatch_once(&qword_1ED886020, v32);
    if (byte_1ED883A15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded Telephony activity line"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "lastPathComponent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logTelephonyActivity]");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v29, v30, 10023);

      PLLogCommon();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v26;
        _os_log_debug_impl(&dword_1CAF47000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v16, "logPointIntervalTelephonyActivity");

}

uint64_t __33__PLBBAgent_logTelephonyActivity__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A14 = result;
  return result;
}

uint64_t __33__PLBBAgent_logTelephonyActivity__block_invoke_3795(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A15 = result;
  return result;
}

- (void)logMessage:(id)a3 andState:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__PLBBAgent_logMessage_andState___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (qword_1ED886028 != -1)
      dispatch_once(&qword_1ED886028, block);
    if (byte_1ED883A16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Messages: type=%@; state=%@;"), v5, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logMessage:andState:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 10029);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __33__PLBBAgent_logMessage_andState___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A16 = result;
  return result;
}

- (void)setOpName:(id)a3
{
  NSString *v4;
  NSString *operatorName;
  id v6;

  v6 = a3;
  if ((-[NSString isEqual:](self->_operatorName, "isEqual:") & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    operatorName = self->_operatorName;
    self->_operatorName = v4;

    -[PLBBAgent logOperatorName](self, "logOperatorName");
  }

}

- (void)logOperatorName
{
  void *v3;
  void *v4;
  id v5;

  -[PLBBAgent operatorName](self, "operatorName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    -[PLBBAgent operatorName](self, "operatorName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isEqualToString:", &stru_1E8587D00);

    v3 = v5;
  }

}

- (id)humanReadableDataActiveString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v9;
  char v10;
  void *v11;
  int v12;

  -[PLBBAgent inDCH](self, "inDCH");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[PLBBAgent inUTBF](self, "inUTBF");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return 0;
  }
  -[PLBBAgent inDCH](self, "inDCH");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
  {
    -[PLBBAgent inUTBF](self, "inUTBF");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if ((v7 & 1) != 0)
      return CFSTR("DCH/UTBF");
  }
  else
  {

  }
  -[PLBBAgent inDCH](self, "inDCH");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if ((v10 & 1) != 0)
    return CFSTR("Active");
  -[PLBBAgent inUTBF](self, "inUTBF");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12)
    return CFSTR("UTBF");
  else
    return CFSTR("inactive");
}

- (id)humanReadableSimStatusString
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  -[PLBBAgent simStatus](self, "simStatus");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[PLBBAgent simStatus](self, "simStatus"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", &stru_1E8587D00),
        v5,
        v4,
        (v6 & 1) == 0))
  {
    -[PLBBAgent simStatus](self, "simStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "substringFromIndex:", objc_msgSend((id)*MEMORY[0x1E0CA77E0], "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)processTimeUpdateInfoDict:(id)a3
{
  uint64_t v4;
  __CFString *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD block[4];
  const __CFString *v12;
  uint64_t v13;

  v10 = a3;
  objc_msgSend(MEMORY[0x1E0D80078], "postNotificationName:object:userInfo:", CFSTR("BasebandTimeChangeNotification"), self);
  v4 = objc_opt_class();
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __39__PLBBAgent_processTimeUpdateInfoDict___block_invoke;
  block[3] = &unk_1E8578738;
  block[1] = 3221225472;
  v12 = CFSTR("Critical");
  v13 = v4;
  if (qword_1ED886030 == -1)
  {
    v5 = CFSTR("Critical");
  }
  else
  {
    dispatch_once(&qword_1ED886030, block);
    v5 = (__CFString *)v12;
  }
  v6 = byte_1ED883A17;

  v7 = v10;
  if (v6)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setAgent:", self);
    objc_msgSend(v8, "setMsgProcErr:", 0);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("TimeUpdate Dict: %@"), v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPayload:", v9);

    objc_msgSend(v8, "logEventNoneBBMsgAll");
    v7 = v10;
  }

}

uint64_t __39__PLBBAgent_processTimeUpdateInfoDict___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  byte_1ED883A17 = result;
  return result;
}

- (void)refreshRequestHandler
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__PLBBAgent_refreshRequestHandler__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (qword_1ED886038 != -1)
      dispatch_once(&qword_1ED886038, block);
    if (byte_1ED883A18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("refreshRequestHandler not implemented"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent refreshRequestHandler]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 10125);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v3;
        _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
}

uint64_t __34__PLBBAgent_refreshRequestHandler__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A18 = result;
  return result;
}

- (void)logBasebandConfig
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  PLBBEurekaEventMsg *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD block[5];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__PLBBAgent_logBasebandConfig__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1ED886040 != -1)
      dispatch_once(&qword_1ED886040, block);
    if (byte_1ED883A19)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBAgent logBasebandConfig]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBBAgent.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBAgent logBasebandConfig]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 10131);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v10 = objc_alloc_init(PLBBEurekaEventMsg);
  -[PLBasebandMessage setAgent:](v10, "setAgent:", self);
  -[PLBBEurekaEventMsg setEventCode:](v10, "setEventCode:", 0);
  -[PLBBEurekaEventMsg setError:](v10, "setError:", &stru_1E8587D00);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBEurekaEventMsg setHeaderWithSeqNum:andDate:andTimeCal:](v10, "setHeaderWithSeqNum:andDate:andTimeCal:", &unk_1E86339C0, v11, 0.0);

  v12 = 0;
  v13 = *MEMORY[0x1E0D80388];
  do
  {
    v14 = logBasebandConfig_basebandConfigPropertyKeys[v12];
    -[PLBBAgent connection](self, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getProperty:forTrace:", CFSTR("enabled"), v14);
    v16 = objc_claimAutoreleasedReturnValue();

    if (v16)
      v17 = (__CFString *)v16;
    else
      v17 = CFSTR("null");
    -[PLBBAgent connection](self, "connection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "getProperty:forTrace:", CFSTR("history"), v14);
    v19 = objc_claimAutoreleasedReturnValue();

    if (v19)
      v20 = (__CFString *)v19;
    else
      v20 = CFSTR("null");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@)"), v17, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBEurekaEventMsg addPairWithKey:andWithVal:](v10, "addPairWithKey:andWithVal:", v14, v21);

    if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandProto") & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav") & 1) != 0
      || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandIce"))
    {
      +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", v13, CFSTR("BBMsgLite"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v22);
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v14, CFSTR("unit"));
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v17, CFSTR("value_enabled"));
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v20, CFSTR("value_history"));
      -[PLBBAgent logEntry:](self, "logEntry:", v23);

    }
    ++v12;
  }
  while (v12 != 11);
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandProto") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandIce"))
  {
    -[PLBBEurekaEventMsg logEventForwardBBEurekaEventMsgLite](v10, "logEventForwardBBEurekaEventMsgLite");
  }

}

uint64_t __30__PLBBAgent_logBasebandConfig__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883A19 = result;
  return result;
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLTelephonyConnection)connection
{
  return self->_connection;
}

- (PLABMClient)abmClient
{
  return (PLABMClient *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAbmClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (PLEntryNotificationOperatorComposition)sleepEntryNotifications
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (PLEntryNotificationOperatorComposition)wakeEntryNotifications
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (PLCFNotificationOperatorComposition)cfNotifyBBReport30s
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCfNotifyBBReport30s:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (PLCFNotificationOperatorComposition)cfNotifyBBReport
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCfNotifyBBReport:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PLNSNotificationOperatorComposition)thermalMonitorListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setThermalMonitorListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSDate)lastReportRequestDate
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLastReportRequestDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (BOOL)changed
{
  return self->_changed;
}

- (void)setChanged:(BOOL)a3
{
  self->_changed = a3;
}

- (BOOL)agentInited
{
  return self->_agentInited;
}

- (void)setAgentInited:(BOOL)a3
{
  self->_agentInited = a3;
}

- (NSMutableDictionary)currentCallList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCurrentCallList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (BOOL)lteCurrentState
{
  return self->_lteCurrentState;
}

- (void)setLteCurrentState:(BOOL)a3
{
  self->_lteCurrentState = a3;
}

- (NSNumber)lastReportedSignal
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setLastReportedSignal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSNumber)inDCH
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setInDCH:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSNumber)inUTBF
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setInUTBF:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSString)simStatus
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setSimStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSString)operatorName
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setOperatorName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (void)setTelRegMsgHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (PLBBTelephonyActivityMsg)telActMsgHelper
{
  return (PLBBTelephonyActivityMsg *)objc_getProperty(self, a2, 216, 1);
}

- (void)setTelActMsgHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (PLNSNotificationOperatorComposition)bbICEModelLTEMetricsNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 224, 1);
}

- (void)setBbICEModelLTEMetricsNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSDate)lastBBActivityTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 232, 1);
}

- (PLEntryNotificationOperatorComposition)canSleepNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 240, 1);
}

- (void)setCanSleepNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (PLEntryNotificationOperatorComposition)didNotSleepNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 248, 1);
}

- (void)setDidNotSleepNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (PLEntryNotificationOperatorComposition)telephonyActivityNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 256, 1);
}

- (void)setTelephonyActivityNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (PLTimer)channelReconnectTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 264, 1);
}

- (void)setChannelReconnectTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (PLTimer)cacheCommitTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 272, 1);
}

- (void)setCacheCommitTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (double)lastBBProtoPower
{
  return self->_lastBBProtoPower;
}

- (void)setLastBBProtoPower:(double)a3
{
  self->_lastBBProtoPower = a3;
}

- (double)lastOOSPower
{
  return self->_lastOOSPower;
}

- (void)setLastOOSPower:(double)a3
{
  self->_lastOOSPower = a3;
}

- (NSDate)lastModeledOOSTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 296, 1);
}

- (void)setLastModeledOOSTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (double)lastGWPower
{
  return self->_lastGWPower;
}

- (void)setLastGWPower:(double)a3
{
  self->_lastGWPower = a3;
}

- (NSDate)lastOOSTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 312, 1);
}

- (void)setLastOOSTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (double)oosGWPower
{
  return self->_oosGWPower;
}

- (void)setOosGWPower:(double)a3
{
  self->_oosGWPower = a3;
}

- (double)oosCDMAPower
{
  return self->_oosCDMAPower;
}

- (void)setOosCDMAPower:(double)a3
{
  self->_oosCDMAPower = a3;
}

- (double)oosHDRPower
{
  return self->_oosHDRPower;
}

- (void)setOosHDRPower:(double)a3
{
  self->_oosHDRPower = a3;
}

- (double)totalOosGWScanEnergy
{
  return self->_totalOosGWScanEnergy;
}

- (void)setTotalOosGWScanEnergy:(double)a3
{
  self->_totalOosGWScanEnergy = a3;
}

- (double)totalOosCDMAScanEnergy
{
  return self->_totalOosCDMAScanEnergy;
}

- (void)setTotalOosCDMAScanEnergy:(double)a3
{
  self->_totalOosCDMAScanEnergy = a3;
}

- (double)totalOosHDRScanEnergy
{
  return self->_totalOosHDRScanEnergy;
}

- (void)setTotalOosHDRScanEnergy:(double)a3
{
  self->_totalOosHDRScanEnergy = a3;
}

- (BOOL)isBBOOS
{
  return self->_isBBOOS;
}

- (void)setIsBBOOS:(BOOL)a3
{
  self->_isBBOOS = a3;
}

- (BOOL)isFirstTimeAccountingOOS
{
  return self->_isFirstTimeAccountingOOS;
}

- (void)setIsFirstTimeAccountingOOS:(BOOL)a3
{
  self->_isFirstTimeAccountingOOS = a3;
}

- (BOOL)isBBDataStandard
{
  return self->_isBBDataStandard;
}

- (void)setIsBBDataStandard:(BOOL)a3
{
  self->_isBBDataStandard = a3;
}

- (OS_dispatch_queue)telephonyClientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 368, 1);
}

- (void)setTelephonyClientQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (CoreTelephonyClient)telephonyClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 376, 1);
}

- (void)setTelephonyClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (NSMutableArray)dsdsRegMsgs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 384, 1);
}

- (void)setDsdsRegMsgs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (void)setDsdsActivityMsgs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (TUCallCenter)callCenter
{
  return (TUCallCenter *)objc_getProperty(self, a2, 400, 1);
}

- (void)setCallCenter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (PLXPCResponderOperatorComposition)BBLogsSysdiagnoseResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 408, 1);
}

- (void)setBBLogsSysdiagnoseResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_BBLogsSysdiagnoseResponder, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_dsdsActivityMsgs, 0);
  objc_storeStrong((id *)&self->_dsdsRegMsgs, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_telephonyClientQueue, 0);
  objc_storeStrong((id *)&self->_lastOOSTimestamp, 0);
  objc_storeStrong((id *)&self->_lastModeledOOSTimestamp, 0);
  objc_storeStrong((id *)&self->_cacheCommitTimer, 0);
  objc_storeStrong((id *)&self->_channelReconnectTimer, 0);
  objc_storeStrong((id *)&self->_telephonyActivityNotification, 0);
  objc_storeStrong((id *)&self->_didNotSleepNotification, 0);
  objc_storeStrong((id *)&self->_canSleepNotification, 0);
  objc_storeStrong((id *)&self->_lastBBActivityTimestamp, 0);
  objc_storeStrong((id *)&self->_bbICEModelLTEMetricsNotification, 0);
  objc_storeStrong((id *)&self->_telActMsgHelper, 0);
  objc_storeStrong((id *)&self->_telRegMsgHelper, 0);
  objc_storeStrong((id *)&self->_operatorName, 0);
  objc_storeStrong((id *)&self->_simStatus, 0);
  objc_storeStrong((id *)&self->_inUTBF, 0);
  objc_storeStrong((id *)&self->_inDCH, 0);
  objc_storeStrong((id *)&self->_lastReportedSignal, 0);
  objc_storeStrong((id *)&self->_currentCallList, 0);
  objc_storeStrong((id *)&self->_lastReportRequestDate, 0);
  objc_storeStrong((id *)&self->_thermalMonitorListener, 0);
  objc_storeStrong((id *)&self->_cfNotifyBBReport, 0);
  objc_storeStrong((id *)&self->_cfNotifyBBReport30s, 0);
  objc_storeStrong((id *)&self->_wakeEntryNotifications, 0);
  objc_storeStrong((id *)&self->_sleepEntryNotifications, 0);
  objc_storeStrong((id *)&self->_abmClient, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
  objc_storeStrong((id *)&self->cachedChannel, 0);
  objc_storeStrong((id *)&self->streamingChannel, 0);
}

@end
