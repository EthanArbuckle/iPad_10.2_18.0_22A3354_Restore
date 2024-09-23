@implementation PLBBTelephonyActivityMsg

- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D7FFA0];
  v11 = a3;
  v12 = objc_msgSend(v10, "debugEnabled");
  v13 = MEMORY[0x1E0C809B0];
  if (v12)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__PLBBTelephonyActivityMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED8834A8 != -1)
      dispatch_once(&qword_1ED8834A8, block);
    if (_MergedGlobals_1_33)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBTelephonyActivityMsg sendAndLogPLEntry:withName:withType:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyActivityMsg.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBTelephonyActivityMsg sendAndLogPLEntry:withName:withType:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 23);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v14;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v13 = MEMORY[0x1E0C809B0];
    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v27[0] = v13;
    v27[1] = 3221225472;
    v27[2] = __64__PLBBTelephonyActivityMsg_sendAndLogPLEntry_withName_withType___block_invoke_14;
    v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v27[4] = objc_opt_class();
    if (qword_1ED8834B0 != -1)
      dispatch_once(&qword_1ED8834B0, v27);
    if (byte_1ED8834A1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sending PLEntry: name=%@ type=%@"), v8, v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyActivityMsg.m");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastPathComponent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBTelephonyActivityMsg sendAndLogPLEntry:withName:withType:]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 24);

      PLLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v20;
        _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBMsgRoot agent](self, "agent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "logEntry:", v11);

}

uint64_t __64__PLBBTelephonyActivityMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_33 = result;
  return result;
}

uint64_t __64__PLBBTelephonyActivityMsg_sendAndLogPLEntry_withName_withType___block_invoke_14(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8834A1 = result;
  return result;
}

+ (id)entryEventPointDefinitionTelephonyActivity
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
  void *v12;
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
  _QWORD v29[11];
  _QWORD v30[11];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[2];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x1E0C80C00];
  v33[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v31[0] = *MEMORY[0x1E0D80318];
  v31[1] = v2;
  v32[0] = &unk_1E86530D0;
  v32[1] = MEMORY[0x1E0C9AAA0];
  v31[2] = *MEMORY[0x1E0D802F8];
  v32[2] = CFSTR("refreshRequestHandler");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v28;
  v33[1] = *MEMORY[0x1E0D802F0];
  v29[0] = CFSTR("activeBand");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_StringFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v26;
  v29[1] = CFSTR("dataStatus");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_StringFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v24;
  v29[2] = CFSTR("currentRat");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_StringFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v22;
  v29[3] = CFSTR("preferredRat");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_StringFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v20;
  v29[4] = CFSTR("campedRat");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_StringFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v18;
  v29[5] = CFSTR("callStatus");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v16;
  v29[6] = CFSTR("airplaneMode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v14;
  v29[7] = CFSTR("simStatus");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v4;
  v29[8] = CFSTR("subsId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v6;
  v29[9] = CFSTR("signalStrength");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v8;
  v29[10] = CFSTR("signalBars");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)refreshTelephonyActivity
{
  void *v2;
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
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D179C2E0](self, a2);
  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__PLBBTelephonyActivityMsg_refreshTelephonyActivity__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED8834B8 != -1)
      dispatch_once(&qword_1ED8834B8, block);
    if (byte_1ED8834A2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBTelephonyActivityMsg refreshTelephonyActivity]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyActivityMsg.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBTelephonyActivityMsg refreshTelephonyActivity]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 81);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v4 = MEMORY[0x1E0C809B0];
    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v17[0] = v4;
    v17[1] = 3221225472;
    v17[2] = __52__PLBBTelephonyActivityMsg_refreshTelephonyActivity__block_invoke_45;
    v17[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v17[4] = objc_opt_class();
    if (qword_1ED8834C0 != -1)
      dispatch_once(&qword_1ED8834C0, v17);
    if (byte_1ED8834A3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Refresh not implemented"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyActivityMsg.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBTelephonyActivityMsg refreshTelephonyActivity]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 82);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v11;
        _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __52__PLBBTelephonyActivityMsg_refreshTelephonyActivity__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8834A2 = result;
  return result;
}

uint64_t __52__PLBBTelephonyActivityMsg_refreshTelephonyActivity__block_invoke_45(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8834A3 = result;
  return result;
}

- (void)logPointIntervalTelephonyActivityAirplaneModeChange
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
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __79__PLBBTelephonyActivityMsg_logPointIntervalTelephonyActivityAirplaneModeChange__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v3;
    if (qword_1ED8834C8 != -1)
      dispatch_once(&qword_1ED8834C8, &block);
    if (byte_1ED8834A4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBTelephonyActivityMsg logPointIntervalTelephonyActivityAirplaneModeChange]", block, v15, v16, v17, v18);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyActivityMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBTelephonyActivityMsg logPointIntervalTelephonyActivityAirplaneModeChange]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 89);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v10 = *MEMORY[0x1E0D80390];
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("TelephonyActivity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("activeBand"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("dataStatus"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("currentRat"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("preferredRat"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("campedRat"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("callStatus"));
  -[PLBBTelephonyActivityMsg airplaneMode](self, "airplaneMode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("airplaneMode"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("simStatus"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("signalStrength"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("signalBars"));
  -[PLBBTelephonyActivityMsg sendAndLogPLEntry:withName:withType:](self, "sendAndLogPLEntry:withName:withType:", v12, CFSTR("TelephonyActivity"), v10);

}

uint64_t __79__PLBBTelephonyActivityMsg_logPointIntervalTelephonyActivityAirplaneModeChange__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8834A4 = result;
  return result;
}

- (void)logPointIntervalTelephonyActivity
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t block;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __61__PLBBTelephonyActivityMsg_logPointIntervalTelephonyActivity__block_invoke;
    v26 = &__block_descriptor_40_e5_v8__0lu32l8;
    v27 = v3;
    if (qword_1ED8834D0 != -1)
      dispatch_once(&qword_1ED8834D0, &block);
    if (byte_1ED8834A5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBTelephonyActivityMsg logPointIntervalTelephonyActivity]", block, v24, v25, v26, v27);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBTelephonyActivityMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBTelephonyActivityMsg logPointIntervalTelephonyActivity]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 113);

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
  v10 = *MEMORY[0x1E0D80390];
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("TelephonyActivity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
  -[PLBBTelephonyActivityMsg activeBand](self, "activeBand");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("activeBand"));

  -[PLBBTelephonyActivityMsg dataStatus](self, "dataStatus");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("dataStatus"));

  -[PLBBTelephonyActivityMsg currentRat](self, "currentRat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("currentRat"));

  -[PLBBTelephonyActivityMsg preferredRat](self, "preferredRat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("preferredRat"));

  -[PLBBTelephonyActivityMsg campedRat](self, "campedRat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("campedRat"));

  -[PLBBTelephonyActivityMsg callStatus](self, "callStatus");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("callStatus"));

  -[PLBBTelephonyActivityMsg airplaneMode](self, "airplaneMode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("airplaneMode"));

  -[PLBBTelephonyActivityMsg simStatus](self, "simStatus");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("simStatus"));

  -[PLBBTelephonyActivityMsg signalStrength](self, "signalStrength");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("signalStrength"));

  -[PLBBTelephonyActivityMsg signalBars](self, "signalBars");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("signalBars"));

  -[PLBBTelephonyActivityMsg sendAndLogPLEntry:withName:withType:](self, "sendAndLogPLEntry:withName:withType:", v12, CFSTR("TelephonyActivity"), v10);
}

uint64_t __61__PLBBTelephonyActivityMsg_logPointIntervalTelephonyActivity__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8834A5 = result;
  return result;
}

- (NSString)activeBand
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setActiveBand:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)dataStatus
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDataStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)currentRat
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCurrentRat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)preferredRat
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPreferredRat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)campedRat
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCampedRat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)callStatus
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCallStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)airplaneMode
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAirplaneMode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)simStatus
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSimStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSNumber)signalStrength
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSignalStrength:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSNumber)signalBars
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSignalBars:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signalBars, 0);
  objc_storeStrong((id *)&self->_signalStrength, 0);
  objc_storeStrong((id *)&self->_simStatus, 0);
  objc_storeStrong((id *)&self->_airplaneMode, 0);
  objc_storeStrong((id *)&self->_callStatus, 0);
  objc_storeStrong((id *)&self->_campedRat, 0);
  objc_storeStrong((id *)&self->_preferredRat, 0);
  objc_storeStrong((id *)&self->_currentRat, 0);
  objc_storeStrong((id *)&self->_dataStatus, 0);
  objc_storeStrong((id *)&self->_activeBand, 0);
}

@end
