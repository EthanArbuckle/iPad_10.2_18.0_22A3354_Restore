@implementation PLBBMavHwRfTDSLogMsg

- (PLBBMavHwRfTDSLogMsg)init
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  PLBBMavHwRfTDSLogMsg *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *commonInfo;
  NSMutableDictionary *v13;
  NSMutableDictionary *kvPairs;
  objc_super v16;
  _QWORD block[5];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__PLBBMavHwRfTDSLogMsg_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1ED8849B0 != -1)
      dispatch_once(&qword_1ED8849B0, block);
    if (_MergedGlobals_1_45)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavHwRfTDSLogMsg init]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfTDSLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfTDSLogMsg init]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 39);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v16.receiver = self;
  v16.super_class = (Class)PLBBMavHwRfTDSLogMsg;
  v10 = -[PLBBMavHwRfTDSLogMsg init](&v16, sel_init);
  if (v10)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    commonInfo = v10->_commonInfo;
    v10->_commonInfo = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    kvPairs = v10->_kvPairs;
    v10->_kvPairs = v13;

    v10->_inited = 1;
  }
  return v10;
}

uint64_t __28__PLBBMavHwRfTDSLogMsg_init__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_45 = result;
  return result;
}

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
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
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
    block[2] = __60__PLBBMavHwRfTDSLogMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED8849B8 != -1)
      dispatch_once(&qword_1ED8849B8, block);
    if (byte_1ED8849A9)
    {
      v33 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavHwRfTDSLogMsg sendAndLogPLEntry:withName:withType:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfTDSLogMsg.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfTDSLogMsg sendAndLogPLEntry:withName:withType:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 58);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v14;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v9 = v33;
      v13 = MEMORY[0x1E0C809B0];
    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v34[0] = v13;
    v34[1] = 3221225472;
    v34[2] = __60__PLBBMavHwRfTDSLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_251;
    v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v34[4] = objc_opt_class();
    if (qword_1ED8849C0 != -1)
      dispatch_once(&qword_1ED8849C0, v34);
    if (byte_1ED8849AA)
    {
      v20 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sending PLEntry: name=%@ type=%@"), v8, v9);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfTDSLogMsg.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfTDSLogMsg sendAndLogPLEntry:withName:withType:]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 59);

      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v21;
        _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v9 = v20;
    }
  }
  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("SeqNum"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v27, CFSTR("SeqNum"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("BBDate"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v28, CFSTR("BBDate"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("TimeCal"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v29, CFSTR("TimeCal"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("BBDate"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "convertFromBasebandToMonotonic");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEntryDate:", v31);

  -[PLBasebandMessage agent](self, "agent");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "logEntry:", v11);

}

uint64_t __60__PLBBMavHwRfTDSLogMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8849A9 = result;
  return result;
}

uint64_t __60__PLBBMavHwRfTDSLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_251(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8849AA = result;
  return result;
}

- (void)setHeaderWithSeqNum:(id)a3 andDate:(id)a4 andTimeCal:(double)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSMutableDictionary *commonInfo;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v10 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__PLBBMavHwRfTDSLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1ED8849C8 != -1)
      dispatch_once(&qword_1ED8849C8, block);
    if (byte_1ED8849AB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavHwRfTDSLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfTDSLogMsg.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfTDSLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 76);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v11;
        _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (v8 && v9)
  {
    -[NSMutableDictionary setObject:forKey:](self->_commonInfo, "setObject:forKey:", v8, CFSTR("SeqNum"));
    -[NSMutableDictionary setObject:forKey:](self->_commonInfo, "setObject:forKey:", v9, CFSTR("BBDate"));
    commonInfo = self->_commonInfo;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](commonInfo, "setValue:forKey:", v18, CFSTR("TimeCal"));
LABEL_18:

    goto LABEL_19;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v19 = objc_opt_class();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __63__PLBBMavHwRfTDSLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_256;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v19;
    if (qword_1ED8849D0 != -1)
      dispatch_once(&qword_1ED8849D0, v25);
    if (byte_1ED8849AC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to set seqNum, date, timeCal"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfTDSLogMsg.m");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfTDSLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v22, v23, 78);

      PLLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v18;
        _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_18;
    }
  }
LABEL_19:

}

uint64_t __63__PLBBMavHwRfTDSLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8849AB = result;
  return result;
}

uint64_t __63__PLBBMavHwRfTDSLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_256(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8849AC = result;
  return result;
}

- (void)addPairWithKey:(id)a3 andWithVal:(id)a4
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
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__PLBBMavHwRfTDSLogMsg_addPairWithKey_andWithVal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1ED8849D8 != -1)
      dispatch_once(&qword_1ED8849D8, block);
    if (byte_1ED8849AD)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavHwRfTDSLogMsg addPairWithKey:andWithVal:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfTDSLogMsg.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfTDSLogMsg addPairWithKey:andWithVal:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 94);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v9;
        _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v15 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  if (v6)
  {
    if (v15)
    {
      v16 = objc_opt_class();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __50__PLBBMavHwRfTDSLogMsg_addPairWithKey_andWithVal___block_invoke_267;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v16;
      if (qword_1ED8849E8 != -1)
        dispatch_once(&qword_1ED8849E8, v30);
      if (byte_1ED8849AF)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Add KVPair [%@,%@]"), v6, v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfTDSLogMsg.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfTDSLogMsg addPairWithKey:andWithVal:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 100);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v17;
          _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLBBMavHwRfTDSLogMsg kvPairs](self, "kvPairs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", v7, v6);
LABEL_17:

    goto LABEL_25;
  }
  if (v15)
  {
    v24 = objc_opt_class();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __50__PLBBMavHwRfTDSLogMsg_addPairWithKey_andWithVal___block_invoke_262;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v24;
    if (qword_1ED8849E0 != -1)
      dispatch_once(&qword_1ED8849E0, v31);
    if (byte_1ED8849AE)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: nil key for kvPair not expected, return"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfTDSLogMsg.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfTDSLogMsg addPairWithKey:andWithVal:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v27, v28, 97);

      PLLogCommon();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v23;
        _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_17;
    }
  }
LABEL_25:

}

uint64_t __50__PLBBMavHwRfTDSLogMsg_addPairWithKey_andWithVal___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8849AD = result;
  return result;
}

uint64_t __50__PLBBMavHwRfTDSLogMsg_addPairWithKey_andWithVal___block_invoke_262(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8849AE = result;
  return result;
}

uint64_t __50__PLBBMavHwRfTDSLogMsg_addPairWithKey_andWithVal___block_invoke_267(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8849AF = result;
  return result;
}

+ (id)entryEventBackwardDefinitionBBMavHwRfTDS
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[2];
  uint64_t v22;
  _QWORD v23[3];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[2];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x1E0C80C00];
  v28[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v26[0] = *MEMORY[0x1E0D80318];
  v26[1] = v2;
  v27[0] = &unk_1E8653460;
  v27[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v26[2] = *MEMORY[0x1E0D802F8];
  v26[3] = v3;
  v27[2] = CFSTR("refreshRequestHandler");
  v27[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v18;
  v28[1] = *MEMORY[0x1E0D802F0];
  v24[0] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  v24[1] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_DateFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v4;
  v24[2] = CFSTR("LogDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v6;
  v24[3] = CFSTR("SrvcType");
  v8 = *MEMORY[0x1E0D80348];
  v21[0] = *MEMORY[0x1E0D80358];
  v7 = v21[0];
  v21[1] = v8;
  v23[0] = &unk_1E8634188;
  v23[1] = &unk_1E86341A0;
  v22 = *MEMORY[0x1E0D80350];
  v9 = v22;
  v23[2] = &unk_1E86341B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v21, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v10;
  v24[4] = CFSTR("RxDState");
  v19[0] = v7;
  v19[1] = v8;
  v20[0] = &unk_1E8634188;
  v20[1] = &unk_1E86341D0;
  v19[2] = v9;
  v20[2] = &unk_1E86341B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)refreshRequest
{
  objc_autoreleasePoolPop((void *)MEMORY[0x1D179C2E0](self, a2));
}

- (id)logEventBackwardBBMavHwRfTDS
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("BBMavHwRfTDS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v3);
  -[PLBBMavHwRfTDSLogMsg populateEntry:](self, "populateEntry:", v4);
  v7[0] = CFSTR("entry");
  v7[1] = CFSTR("entryKey");
  v8[0] = v4;
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)populateEntry:(id)a3
{
  NSMutableDictionary *commonInfo;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  commonInfo = self->_commonInfo;
  v5 = a3;
  -[NSMutableDictionary objectForKey:](commonInfo, "objectForKey:", CFSTR("BBDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertFromBasebandToMonotonic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEntryDate:", v7);

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("BBDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("BBDate"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("SeqNum"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("SeqNum"));

  -[PLBBMavHwRfTDSLogMsg logDuration](self, "logDuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("LogDuration"));

  -[PLBBMavHwRfTDSLogMsg srvcTypeCnt](self, "srvcTypeCnt");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("SrvcType"));

  -[PLBBMavHwRfTDSLogMsg rxdStateCnt](self, "rxdStateCnt");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("RxDState"));

}

- (NSString)error
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSNumber)logDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLogDuration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSArray)srvcTypeCnt
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSrvcTypeCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSArray)rxdStateCnt
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRxdStateCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (unsigned)inited
{
  return self->_inited;
}

- (void)setInited:(unsigned __int8)a3
{
  self->_inited = a3;
}

- (NSMutableDictionary)commonInfo
{
  return self->_commonInfo;
}

- (void)setCommonInfo:(id)a3
{
  objc_storeStrong((id *)&self->_commonInfo, a3);
}

- (NSMutableDictionary)kvPairs
{
  return self->_kvPairs;
}

- (void)setKvPairs:(id)a3
{
  objc_storeStrong((id *)&self->_kvPairs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvPairs, 0);
  objc_storeStrong((id *)&self->_commonInfo, 0);
  objc_storeStrong((id *)&self->_rxdStateCnt, 0);
  objc_storeStrong((id *)&self->_srvcTypeCnt, 0);
  objc_storeStrong((id *)&self->_logDuration, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
