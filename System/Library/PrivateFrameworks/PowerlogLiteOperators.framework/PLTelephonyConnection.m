@implementation PLTelephonyConnection

+ (id)sharedTelephonyConnection
{
  if (qword_1ED886FB8 != -1)
    dispatch_once(&qword_1ED886FB8, &__block_literal_global_39);
  return (id)qword_1ED886FC0;
}

void __50__PLTelephonyConnection_sharedTelephonyConnection__block_invoke()
{
  uint64_t v0;
  void *v1;

  if (!qword_1ED886FC0)
  {
    v0 = objc_opt_new();
    v1 = (void *)qword_1ED886FC0;
    qword_1ED886FC0 = v0;

  }
}

- (PLTelephonyConnection)init
{
  PLTelephonyConnection *v2;
  PLTelephonyConnection *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLTelephonyConnection;
  v2 = -[PLTelephonyConnection init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->connection = 0;
    v2->ctServerPort = 0;
    v2->ctServerSource = 0;
    CFRunLoopGetMain();
    CTTelephonyCenterSetDefaultRunloop();
    CTTelephonyCenterGetDefault();
    CTTelephonyCenterAddObserver();
  }
  return v3;
}

- (void)getRAT:(id *)a3 preferredRAT:(id *)a4 campedRAT:(id *)a5
{
  unint64_t RATSelection;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  unint64_t RadioAccessTechnology;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _QWORD v29[5];
  _QWORD block[5];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a3 && a4 && a5)
  {
    v32 = 0;
    v33 = 0;
    v31 = 0;
    -[PLTelephonyConnection connection](self, "connection");
    RATSelection = _CTServerConnectionGetRATSelection();
    v10 = HIDWORD(RATSelection);
    if (HIDWORD(RATSelection))
    {
      v11 = RATSelection;
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v12 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __55__PLTelephonyConnection_getRAT_preferredRAT_campedRAT___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v12;
        if (qword_1ED886FC8 != -1)
          dispatch_once(&qword_1ED886FC8, block);
        if (_MergedGlobals_107)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not get the selected radio mode. (domain: %d error: %d)"), v11, v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLTelephonyConnection.m");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lastPathComponent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTelephonyConnection getRAT:preferredRAT:campedRAT:]");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 69);

          PLLogCommon();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v13;
            _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
    }
    -[PLTelephonyConnection humanReadableRATName:](self, "humanReadableRATName:", v33);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    -[PLTelephonyConnection humanReadableRATName:](self, "humanReadableRATName:", v32);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    -[PLTelephonyConnection connection](self, "connection");
    RadioAccessTechnology = _CTServerConnectionGetRadioAccessTechnology();
    v20 = HIDWORD(RadioAccessTechnology);
    if (HIDWORD(RadioAccessTechnology))
    {
      v21 = RadioAccessTechnology;
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v22 = objc_opt_class();
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __55__PLTelephonyConnection_getRAT_preferredRAT_campedRAT___block_invoke_14;
        v29[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v29[4] = v22;
        if (qword_1ED886FD0 != -1)
          dispatch_once(&qword_1ED886FD0, v29);
        if (byte_1ED886FA9)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not get the selected radio mode. (domain: %d error: %d)"), v21, v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLTelephonyConnection.m");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "lastPathComponent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTelephonyConnection getRAT:preferredRAT:campedRAT:]");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 78);

          PLLogCommon();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v23;
            _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
    }
    -[PLTelephonyConnection humanReadableRATName:](self, "humanReadableRATName:", v31);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
}

uint64_t __55__PLTelephonyConnection_getRAT_preferredRAT_campedRAT___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_107 = result;
  return result;
}

uint64_t __55__PLTelephonyConnection_getRAT_preferredRAT_campedRAT___block_invoke_14(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886FA9 = result;
  return result;
}

- (void)enableDiagLogging
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PLTelephonyConnection connection](self, "connection");
  v2 = _CTServerConnectionSetTraceProperty();
  v3 = HIDWORD(v2);
  if (HIDWORD(v2))
  {
    v4 = v2;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v5 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __42__PLTelephonyConnection_enableDiagLogging__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v5;
      if (qword_1ED886FD8 != -1)
        dispatch_once(&qword_1ED886FD8, block);
      if (byte_1ED886FAA)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not enable diag logging. (domain: %d error: %d)"), v4, v3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLTelephonyConnection.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTelephonyConnection enableDiagLogging]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 94);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v14 = v6;
          _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
}

uint64_t __42__PLTelephonyConnection_enableDiagLogging__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886FAA = result;
  return result;
}

- (BOOL)requestBasebandStateDump:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLTelephonyConnection connection](self, "connection");
  v5 = _CTServerConnectionDumpBasebandState();

  v6 = HIDWORD(v5);
  if (HIDWORD(v5))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v7 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__PLTelephonyConnection_requestBasebandStateDump___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (qword_1ED886FE0 != -1)
        dispatch_once(&qword_1ED886FE0, block);
      if (byte_1ED886FAB)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to dump baseband state (domain=%d, error=%d)"), v5, HIDWORD(v5));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLTelephonyConnection.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTelephonyConnection requestBasebandStateDump:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 101);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v8;
          _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLTelephonyConnection teardownConnection](self, "teardownConnection");
  }
  return (_DWORD)v6 == 0;
}

uint64_t __50__PLTelephonyConnection_requestBasebandStateDump___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886FAB = result;
  return result;
}

- (BOOL)requestBasebandCoreDump:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLTelephonyConnection connection](self, "connection");
  v5 = _CTServerConnectionResetModemWithCrashLogs();

  v6 = HIDWORD(v5);
  if (HIDWORD(v5))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v7 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__PLTelephonyConnection_requestBasebandCoreDump___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (qword_1ED886FE8 != -1)
        dispatch_once(&qword_1ED886FE8, block);
      if (byte_1ED886FAC)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to get baseband core dump (domain=%d, error=%d)"), v5, HIDWORD(v5));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLTelephonyConnection.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTelephonyConnection requestBasebandCoreDump:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 111);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v8;
          _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLTelephonyConnection teardownConnection](self, "teardownConnection");
  }
  return (_DWORD)v6 == 0;
}

uint64_t __49__PLTelephonyConnection_requestBasebandCoreDump___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886FAC = result;
  return result;
}

- (id)getProperty:(id)a3 forTrace:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  PLTelephonyConnection *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  uint64_t v30;
  _QWORD block[5];
  void *v32;
  char v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v33 = 0;
  v32 = 0;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__PLTelephonyConnection_getProperty_forTrace___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1ED886FF0 != -1)
      dispatch_once(&qword_1ED886FF0, block);
    if (byte_1ED886FAD)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLTelephonyConnection getProperty:forTrace:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLTelephonyConnection.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTelephonyConnection getProperty:forTrace:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 122);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v9;
        _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v15 = self;
  objc_sync_enter(v15);
  -[PLTelephonyConnection connection](v15, "connection");
  v16 = _CTServerConnectionCopyTraceProperty();
  objc_sync_exit(v15);

  if (HIDWORD(v16))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v17 = objc_opt_class();
      v26 = MEMORY[0x1E0C809B0];
      v27 = 3221225472;
      v28 = __46__PLTelephonyConnection_getProperty_forTrace___block_invoke_32;
      v29 = &__block_descriptor_40_e5_v8__0lu32l8;
      v30 = v17;
      if (qword_1ED886FF8 != -1)
        dispatch_once(&qword_1ED886FF8, &v26);
      if (byte_1ED886FAE)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to retrieve property %@ from telephony trace %@ (domain=%d, error=%d)"), v6, v7, v16, HIDWORD(v16), v26, v27, v28, v29, v30);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLTelephonyConnection.m");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTelephonyConnection getProperty:forTrace:]");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 132);

        PLLogCommon();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v18;
          _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v24 = 0;
  }
  else
  {
    v24 = v32;
  }

  return v24;
}

uint64_t __46__PLTelephonyConnection_getProperty_forTrace___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886FAD = result;
  return result;
}

uint64_t __46__PLTelephonyConnection_getProperty_forTrace___block_invoke_32(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886FAE = result;
  return result;
}

- (void)getSignalStrength:(int64_t *)a3 asPercentage:(int64_t *)a4 withBars:(int64_t *)a5
{
  CTIndicatorsGetSignalStrength();
  *a3 = -1;
  *a4 = -1;
  *a5 = -1;
}

- (id)currentCallStatus
{
  void *v3;
  void *v4;
  __CFString *v5;

  v3 = (void *)CTCopyCurrentCalls();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    if ((unint64_t)objc_msgSend(v4, "count") <= 1)
    {
      objc_msgSend(v4, "objectAtIndex:", 0);
      -[PLTelephonyConnection humanReadableCallStatus:](self, "humanReadableCallStatus:", CTCallGetStatus());
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = CFSTR("Multiple");
    }
  }
  else
  {
    v5 = CFSTR("Inactive");
  }

  return v5;
}

- (id)humanReadableCallStatus:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("Idle");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("Active");
      return v3;
    case 2:
      return CFSTR("Held");
    case 3:
      return CFSTR("Sending");
    case 4:
      return CFSTR("Ringing");
    case 5:
      return CFSTR("Disconnected");
    default:
      if (a3 == 196608)
        return CFSTR("Alerting");
      if (a3 == 0x40000)
        return CFSTR("Waiting");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<unknown status: %d>"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (id)humanReadableRATName:(__CFString *)a3
{
  __CFString *v4;

  if (!a3)
    return CFSTR("None");
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA76B0])
    || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA7738])
    || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA7740]))
  {
    v4 = CFSTR("GSM");
  }
  else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA76B8]) || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA7760]))
  {
    v4 = CFSTR("UMTS");
  }
  else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA76D0]))
  {
    v4 = CFSTR("Dual");
  }
  else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA7710]) || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA7770]))
  {
    v4 = CFSTR("Unknown");
  }
  else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA76D8]) || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA7720]))
  {
    v4 = CFSTR("1x");
  }
  else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA76E0]) || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA7728]))
  {
    v4 = CFSTR("EVDO");
  }
  else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA76E8]) || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA7730]))
  {
    v4 = CFSTR("CDMAHybrid");
  }
  else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA76F0]) || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA7748]))
  {
    v4 = CFSTR("LTE");
  }
  else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA7700]) || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA7768]))
  {
    v4 = CFSTR("UTRAN");
  }
  else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA76F8]))
  {
    v4 = CFSTR("Automatic");
  }
  else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA76C8]) || CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA7750]))
  {
    v4 = CFSTR("NR");
  }
  else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA7708]))
  {
    v4 = CFSTR("NR_SA");
  }
  else if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CA76C0]))
  {
    v4 = CFSTR("NR_NSA");
  }
  else
  {
    v4 = (__CFString *)-[__CFString copy](a3, "copy");
  }
  return v4;
}

- (id)activeBand
{
  return CFSTR("<unknown>");
}

- (void)teardownConnection
{
  __CFRunLoop *Main;
  __CFMachPort *ctServerPort;
  __CTServerConnection *connection;

  if (self->ctServerSource)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, self->ctServerSource, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
    CFRelease(self->ctServerSource);
    self->ctServerSource = 0;
  }
  ctServerPort = self->ctServerPort;
  if (ctServerPort)
  {
    CFMachPortInvalidate(ctServerPort);
    CFRelease(self->ctServerPort);
    self->ctServerPort = 0;
  }
  connection = self->connection;
  if (connection)
  {
    CFRelease(connection);
    self->connection = 0;
  }
}

- (__CTServerConnection)connection
{
  __CTServerConnection *result;
  __CTServerConnection *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[7];
  __int128 v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  block[5] = 0;
  v13 = 0u;
  v14 = 0;
  block[6] = self;
  result = self->connection;
  if (!result)
  {
    -[PLTelephonyConnection teardownConnection](self, "teardownConnection");
    v4 = (__CTServerConnection *)_CTServerConnectionCreate();
    self->connection = v4;
    if (v4)
    {
      CFRunLoopGetMain();
      _CTServerConnectionAddToRunLoop();
      return self->connection;
    }
    else
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v5 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __35__PLTelephonyConnection_connection__block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v5;
        if (qword_1ED887000 != -1)
          dispatch_once(&qword_1ED887000, block);
        if (byte_1ED886FAF)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to allocate a CTServer connection"));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Compositions/Baseband/PLTelephonyConnection.m");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "lastPathComponent");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTelephonyConnection connection]");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 299);

          PLLogCommon();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v16 = v6;
            _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      return 0;
    }
  }
  return result;
}

uint64_t __35__PLTelephonyConnection_connection__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886FAF = result;
  return result;
}

- (void)registerCallback:(void *)a3 forTelephonyNotification:(__CFString *)a4
{
  id v5;

  CTTelephonyCenterGetDefault();
  -[PLTelephonyConnection observerAgent](self, "observerAgent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  CTTelephonyCenterAddObserver();

}

- (void)deregisterForAllTelephonyNotifications
{
  CTTelephonyCenterGetDefault();
  CTTelephonyCenterRemoveEveryObserver();
}

- (PLAgent)observerAgent
{
  return (PLAgent *)objc_getProperty(self, a2, 32, 1);
}

- (void)setObserverAgent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerAgent, 0);
}

@end
