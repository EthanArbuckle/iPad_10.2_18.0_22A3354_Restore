@implementation PLBBMavHwRfLTELogMsg

- (PLBBMavHwRfLTELogMsg)init
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  PLBBMavHwRfLTELogMsg *v10;
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
    block[2] = __28__PLBBMavHwRfLTELogMsg_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1ED8858E0 != -1)
      dispatch_once(&qword_1ED8858E0, block);
    if (_MergedGlobals_1_64)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavHwRfLTELogMsg init]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfLTELogMsg init]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 43);

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
  v16.super_class = (Class)PLBBMavHwRfLTELogMsg;
  v10 = -[PLBBMsgRoot init](&v16, sel_init);
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

uint64_t __28__PLBBMavHwRfLTELogMsg_init__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_64 = result;
  return result;
}

- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v11 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__PLBBMavHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (qword_1ED8858E8 != -1)
      dispatch_once(&qword_1ED8858E8, block);
    if (byte_1ED8858D1)
    {
      v12 = v10;
      v13 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavHwRfLTELogMsg sendAndLogPLEntry:withName:withType:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfLTELogMsg sendAndLogPLEntry:withName:withType:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 62);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v14;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v9 = v13;
      v10 = v12;
    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v20 = objc_opt_class();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __60__PLBBMavHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_251;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v20;
    if (qword_1ED8858F0 != -1)
      dispatch_once(&qword_1ED8858F0, v47);
    if (byte_1ED8858D2)
    {
      v21 = v10;
      v44 = v10;
      v22 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sending PLEntry: name=%@ type=%@"), v9, v44);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfLTELogMsg sendAndLogPLEntry:withName:withType:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 63);

      PLLogCommon();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v23;
        _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v9 = v22;
      v10 = v21;
    }
  }
  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("SeqNum"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v29, CFSTR("SeqNum"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("BBDate"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v30, CFSTR("BBDate"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("TimeCal"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, CFSTR("TimeCal"));

  -[PLBBMsgRoot agent](self, "agent");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32 && objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v33 = objc_opt_class();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __60__PLBBMavHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_256;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v33;
    if (qword_1ED8858F8 != -1)
      dispatch_once(&qword_1ED8858F8, v46);
    if (byte_1ED8858D3)
    {
      v45 = v10;
      v34 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad agent"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "lastPathComponent");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfLTELogMsg sendAndLogPLEntry:withName:withType:]");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 70);

      PLLogCommon();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v35;
        _os_log_debug_impl(&dword_1CAF47000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v9 = v34;
      v10 = v45;
    }
  }
  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("BBDate"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "convertFromBasebandToMonotonic");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEntryDate:", v42);

  -[PLBBMsgRoot agent](self, "agent");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "logEntry:", v8);

}

uint64_t __60__PLBBMavHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8858D1 = result;
  return result;
}

uint64_t __60__PLBBMavHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_251(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8858D2 = result;
  return result;
}

uint64_t __60__PLBBMavHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_256(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8858D3 = result;
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
    block[2] = __63__PLBBMavHwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1ED885900 != -1)
      dispatch_once(&qword_1ED885900, block);
    if (byte_1ED8858D4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavHwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 83);

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
    v25[2] = __63__PLBBMavHwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_261;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v19;
    if (qword_1ED885908 != -1)
      dispatch_once(&qword_1ED885908, v25);
    if (byte_1ED8858D5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to set seqNum, date, timeCal"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v22, v23, 85);

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

uint64_t __63__PLBBMavHwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8858D4 = result;
  return result;
}

uint64_t __63__PLBBMavHwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_261(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8858D5 = result;
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
    block[2] = __50__PLBBMavHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1ED885910 != -1)
      dispatch_once(&qword_1ED885910, block);
    if (byte_1ED8858D6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavHwRfLTELogMsg addPairWithKey:andWithVal:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfLTELogMsg addPairWithKey:andWithVal:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 101);

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
      v30[2] = __50__PLBBMavHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_272;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v16;
      if (qword_1ED885920 != -1)
        dispatch_once(&qword_1ED885920, v30);
      if (byte_1ED8858D8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Add KVPair [%@,%@]"), v6, v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfLTELogMsg addPairWithKey:andWithVal:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 107);

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
    -[PLBBMavHwRfLTELogMsg kvPairs](self, "kvPairs");
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
    v31[2] = __50__PLBBMavHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_267;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v24;
    if (qword_1ED885918 != -1)
      dispatch_once(&qword_1ED885918, v31);
    if (byte_1ED8858D7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: nil key for kvPair not expected, return"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfLTELogMsg addPairWithKey:andWithVal:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v27, v28, 104);

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

uint64_t __50__PLBBMavHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8858D6 = result;
  return result;
}

uint64_t __50__PLBBMavHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_267(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8858D7 = result;
  return result;
}

uint64_t __50__PLBBMavHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_272(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8858D8 = result;
  return result;
}

+ (id)entryEventBackwardDefinitionBBMav10HwRfLTE
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[2];
  uint64_t v39;
  _QWORD v40[3];
  _QWORD v41[11];
  _QWORD v42[11];
  _QWORD v43[4];
  _QWORD v44[4];
  _QWORD v45[2];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v45[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v43[0] = *MEMORY[0x1E0D80318];
  v43[1] = v2;
  v44[0] = &unk_1E8653A00;
  v44[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v43[2] = *MEMORY[0x1E0D802F8];
  v43[3] = v3;
  v44[2] = CFSTR("refreshRequestHandler");
  v44[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v25;
  v45[1] = *MEMORY[0x1E0D802F0];
  v41[0] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v23;
  v41[1] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_DateFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v21;
  v41[2] = CFSTR("LogDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_RealFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v19;
  v41[3] = CFSTR("DupMode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v17;
  v41[4] = CFSTR("CAFreqInfo");
  v5 = *MEMORY[0x1E0D80348];
  v38[0] = *MEMORY[0x1E0D80358];
  v4 = v38[0];
  v38[1] = v5;
  v40[0] = &unk_1E8635208;
  v40[1] = &unk_1E8635220;
  v39 = *MEMORY[0x1E0D80350];
  v6 = v39;
  v40[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v38, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v16;
  v41[5] = CFSTR("C0TBSzArr");
  v36[0] = v4;
  v36[1] = v5;
  v37[0] = &unk_1E8635208;
  v37[1] = &unk_1E8635250;
  v36[2] = v6;
  v37[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v15;
  v41[6] = CFSTR("C1TBSzArr");
  v34[0] = v4;
  v34[1] = v5;
  v35[0] = &unk_1E8635208;
  v35[1] = &unk_1E8635250;
  v34[2] = v6;
  v35[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v14;
  v41[7] = CFSTR("TxPwrBktArr");
  v32[0] = v4;
  v32[1] = v5;
  v33[0] = &unk_1E8635208;
  v33[1] = &unk_1E8635268;
  v32[2] = v6;
  v33[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v7;
  v41[8] = CFSTR("CASCCStateArr");
  v30[0] = v4;
  v30[1] = v5;
  v31[0] = &unk_1E8635208;
  v31[1] = &unk_1E8635220;
  v30[2] = v6;
  v31[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42[8] = v8;
  v41[9] = CFSTR("kRfActRxTxArr");
  v28[0] = v4;
  v28[1] = v5;
  v29[0] = &unk_1E8635208;
  v29[1] = &unk_1E8635280;
  v28[2] = v6;
  v29[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42[9] = v9;
  v41[10] = CFSTR("SleepStateArr");
  v26[0] = v4;
  v26[1] = v5;
  v27[0] = &unk_1E8635208;
  v27[1] = &unk_1E8635280;
  v26[2] = v6;
  v27[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42[10] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 11);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)refreshMav10BBRfAllRats
{
  objc_autoreleasePoolPop((void *)MEMORY[0x1D179C2E0](self, a2));
}

- (id)logEventBackwardBBMav10HwRfLTE
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
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  _QWORD v19[2];
  _QWORD v20[2];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __54__PLBBMavHwRfLTELogMsg_logEventBackwardBBMav10HwRfLTE__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v3;
    if (qword_1ED885928 != -1)
      dispatch_once(&qword_1ED885928, &block);
    if (byte_1ED8858D9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavHwRfLTELogMsg logEventBackwardBBMav10HwRfLTE]", block, v15, v16, v17, v18);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfLTELogMsg logEventBackwardBBMav10HwRfLTE]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 196);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("BBMavHwRfLTE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  -[PLBBMavHwRfLTELogMsg populateEntry:](self, "populateEntry:", v11);
  v19[0] = CFSTR("entry");
  v19[1] = CFSTR("entryKey");
  v20[0] = v11;
  v20[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __54__PLBBMavHwRfLTELogMsg_logEventBackwardBBMav10HwRfLTE__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8858D9 = result;
  return result;
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  commonInfo = self->_commonInfo;
  v5 = a3;
  -[NSMutableDictionary objectForKey:](commonInfo, "objectForKey:", CFSTR("BBDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertFromBasebandToMonotonic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEntryDate:", v7);

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("SeqNum"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("SeqNum"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("BBDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("BBDate"));

  -[PLBBMavHwRfLTELogMsg logDuration](self, "logDuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("LogDuration"));

  -[PLBBMavHwRfLTELogMsg dupMode](self, "dupMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("DupMode"));

  -[PLBBMavHwRfLTELogMsg caFreqInfo](self, "caFreqInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("CAFreqInfo"));

  -[PLBBMavHwRfLTELogMsg dlC0TBSzCnt](self, "dlC0TBSzCnt");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("C0TBSzArr"));

  -[PLBBMavHwRfLTELogMsg dlC1TBSzCnt](self, "dlC1TBSzCnt");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("C1TBSzArr"));

  -[PLBBMavHwRfLTELogMsg txPwrCnt](self, "txPwrCnt");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("TxPwrBktArr"));

  -[PLBBMavHwRfLTELogMsg caSCCCnt](self, "caSCCCnt");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("CASCCStateArr"));

  -[PLBBMavHwRfLTELogMsg actRxTxCnt](self, "actRxTxCnt");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("kRfActRxTxArr"));

  -[PLBBMavHwRfLTELogMsg sleepStateCnt](self, "sleepStateCnt");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("SleepStateArr"));

}

+ (id)entryEventBackwardDefinitionBBMav13HwRfLTE
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[3];
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[3];
  _QWORD v68[2];
  uint64_t v69;
  _QWORD v70[3];
  _QWORD v71[21];
  _QWORD v72[21];
  _QWORD v73[4];
  _QWORD v74[4];
  _QWORD v75[2];
  _QWORD v76[4];

  v76[2] = *MEMORY[0x1E0C80C00];
  v75[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v73[0] = *MEMORY[0x1E0D80318];
  v73[1] = v2;
  v74[0] = &unk_1E8653A10;
  v74[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v73[2] = *MEMORY[0x1E0D802F8];
  v73[3] = v3;
  v74[2] = CFSTR("refreshMav13BBRfLTE");
  v74[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 4);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v35;
  v75[1] = *MEMORY[0x1E0D802F0];
  v71[0] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v33;
  v71[1] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_DateFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v31;
  v71[2] = CFSTR("LogDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commonTypeDict_RealFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v29;
  v71[3] = CFSTR("DupMode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v72[3] = v27;
  v71[4] = CFSTR("CAFreqInfo");
  v5 = *MEMORY[0x1E0D80348];
  v68[0] = *MEMORY[0x1E0D80358];
  v4 = v68[0];
  v68[1] = v5;
  v70[0] = &unk_1E8635208;
  v70[1] = &unk_1E8635220;
  v69 = *MEMORY[0x1E0D80350];
  v6 = v69;
  v70[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v68, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v72[4] = v26;
  v71[5] = CFSTR("C0TBSzArr");
  v66[0] = v4;
  v66[1] = v5;
  v67[0] = &unk_1E8635208;
  v67[1] = &unk_1E8635298;
  v66[2] = v6;
  v67[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v72[5] = v25;
  v71[6] = CFSTR("C1TBSzArr");
  v64[0] = v4;
  v64[1] = v5;
  v65[0] = &unk_1E8635208;
  v65[1] = &unk_1E8635298;
  v64[2] = v6;
  v65[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v72[6] = v24;
  v71[7] = CFSTR("TxPwrBktArr");
  v62[0] = v4;
  v62[1] = v5;
  v63[0] = &unk_1E8635208;
  v63[1] = &unk_1E8635268;
  v62[2] = v6;
  v63[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v72[7] = v23;
  v71[8] = CFSTR("CASCCStateArr");
  v60[0] = v4;
  v60[1] = v5;
  v61[0] = &unk_1E8635208;
  v61[1] = &unk_1E8635220;
  v60[2] = v6;
  v61[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v72[8] = v22;
  v71[9] = CFSTR("RfActRxTxPCCArr");
  v58[0] = v4;
  v58[1] = v5;
  v59[0] = &unk_1E8635208;
  v59[1] = &unk_1E86352B0;
  v58[2] = v6;
  v59[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v72[9] = v21;
  v71[10] = CFSTR("RfActRxTxSCCArr");
  v56[0] = v4;
  v56[1] = v5;
  v57[0] = &unk_1E8635208;
  v57[1] = &unk_1E86352B0;
  v56[2] = v6;
  v57[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v72[10] = v20;
  v71[11] = CFSTR("RfActRxTxPCCSCCArr");
  v54[0] = v4;
  v54[1] = v5;
  v55[0] = &unk_1E8635208;
  v55[1] = &unk_1E86352B0;
  v54[2] = v6;
  v55[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v72[11] = v19;
  v71[12] = CFSTR("SleepStateIdleArr");
  v52[0] = v4;
  v52[1] = v5;
  v53[0] = &unk_1E8635208;
  v53[1] = &unk_1E86352C8;
  v52[2] = v6;
  v53[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v72[12] = v18;
  v71[13] = CFSTR("SleepStateConnArr");
  v50[0] = v4;
  v50[1] = v5;
  v51[0] = &unk_1E8635208;
  v51[1] = &unk_1E86352C8;
  v50[2] = v6;
  v51[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v72[13] = v17;
  v71[14] = CFSTR("RfRSRPIdleArr");
  v48[0] = v4;
  v48[1] = v5;
  v49[0] = &unk_1E8635208;
  v49[1] = &unk_1E8635280;
  v48[2] = v6;
  v49[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v72[14] = v16;
  v71[15] = CFSTR("RfRSRPConnArr");
  v46[0] = v4;
  v46[1] = v5;
  v47[0] = &unk_1E8635208;
  v47[1] = &unk_1E8635280;
  v46[2] = v6;
  v47[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v72[15] = v15;
  v71[16] = CFSTR("RfSINRIdleArr");
  v44[0] = v4;
  v44[1] = v5;
  v45[0] = &unk_1E8635208;
  v45[1] = &unk_1E8635280;
  v44[2] = v6;
  v45[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v72[16] = v7;
  v71[17] = CFSTR("RfSINRConnArr");
  v42[0] = v4;
  v42[1] = v5;
  v43[0] = &unk_1E8635208;
  v43[1] = &unk_1E8635280;
  v42[2] = v6;
  v43[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v72[17] = v8;
  v71[18] = CFSTR("RfARXArr");
  v40[0] = v4;
  v40[1] = v5;
  v41[0] = &unk_1E8635208;
  v41[1] = &unk_1E86352E0;
  v40[2] = v6;
  v41[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v72[18] = v9;
  v71[19] = CFSTR("RfNLICArr");
  v38[0] = v4;
  v38[1] = v5;
  v39[0] = &unk_1E8635208;
  v39[1] = &unk_1E86352F8;
  v38[2] = v6;
  v39[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v72[19] = v10;
  v71[20] = CFSTR("RfBPEArr");
  v36[0] = v4;
  v36[1] = v5;
  v37[0] = &unk_1E8635208;
  v37[1] = &unk_1E86352B0;
  v36[2] = v6;
  v37[2] = &unk_1E8635238;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v72[20] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)refreshMav13BBRfLTE
{
  objc_autoreleasePoolPop((void *)MEMORY[0x1D179C2E0](self, a2));
}

- (id)logEventBackwardBBMav13HwRfLTE
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
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  _QWORD v19[2];
  _QWORD v20[2];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __54__PLBBMavHwRfLTELogMsg_logEventBackwardBBMav13HwRfLTE__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v3;
    if (qword_1ED885930 != -1)
      dispatch_once(&qword_1ED885930, &block);
    if (byte_1ED8858DA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavHwRfLTELogMsg logEventBackwardBBMav13HwRfLTE]", block, v15, v16, v17, v18);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfLTELogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfLTELogMsg logEventBackwardBBMav13HwRfLTE]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 349);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("BBMavHwRfLTE"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  -[PLBBMavHwRfLTELogMsg populateMav13Entry:](self, "populateMav13Entry:", v11);
  v19[0] = CFSTR("entry");
  v19[1] = CFSTR("entryKey");
  v20[0] = v11;
  v20[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __54__PLBBMavHwRfLTELogMsg_logEventBackwardBBMav13HwRfLTE__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8858DA = result;
  return result;
}

- (void)populateMav13Entry:(id)a3
{
  NSMutableDictionary *commonInfo;
  id v5;
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
  id v28;

  commonInfo = self->_commonInfo;
  v5 = a3;
  -[NSMutableDictionary objectForKey:](commonInfo, "objectForKey:", CFSTR("BBDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertFromBasebandToMonotonic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEntryDate:", v7);

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("SeqNum"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("SeqNum"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("BBDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("BBDate"));

  -[PLBBMavHwRfLTELogMsg logDuration](self, "logDuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("LogDuration"));

  -[PLBBMavHwRfLTELogMsg dupMode](self, "dupMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("DupMode"));

  -[PLBBMavHwRfLTELogMsg caFreqInfo](self, "caFreqInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("CAFreqInfo"));

  -[PLBBMavHwRfLTELogMsg dlC0TBSzCnt](self, "dlC0TBSzCnt");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("C0TBSzArr"));

  -[PLBBMavHwRfLTELogMsg dlC1TBSzCnt](self, "dlC1TBSzCnt");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("C1TBSzArr"));

  -[PLBBMavHwRfLTELogMsg txPwrCnt](self, "txPwrCnt");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("TxPwrBktArr"));

  -[PLBBMavHwRfLTELogMsg caSCCCnt](self, "caSCCCnt");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("CASCCStateArr"));

  -[PLBBMavHwRfLTELogMsg actRxTxPriCCCnt](self, "actRxTxPriCCCnt");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("RfActRxTxPCCArr"));

  -[PLBBMavHwRfLTELogMsg actRxTxSecCCCnt](self, "actRxTxSecCCCnt");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("RfActRxTxSCCArr"));

  -[PLBBMavHwRfLTELogMsg actRxTxPriSecCCCnt](self, "actRxTxPriSecCCCnt");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("RfActRxTxPCCSCCArr"));

  -[PLBBMavHwRfLTELogMsg sleepStateIdleCnt](self, "sleepStateIdleCnt");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("SleepStateIdleArr"));

  -[PLBBMavHwRfLTELogMsg sleepStateConnCnt](self, "sleepStateConnCnt");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("SleepStateConnArr"));

  -[PLBBMavHwRfLTELogMsg rsrpIdleCnt](self, "rsrpIdleCnt");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("RfRSRPIdleArr"));

  -[PLBBMavHwRfLTELogMsg rsrpConnCnt](self, "rsrpConnCnt");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("RfRSRPConnArr"));

  -[PLBBMavHwRfLTELogMsg sinrIdleCnt](self, "sinrIdleCnt");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("RfSINRIdleArr"));

  -[PLBBMavHwRfLTELogMsg sinrConnCnt](self, "sinrConnCnt");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("RfSINRConnArr"));

  -[PLBBMavHwRfLTELogMsg arxStateCnt](self, "arxStateCnt");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("RfARXArr"));

  -[PLBBMavHwRfLTELogMsg nlicStateCnt](self, "nlicStateCnt");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("RfNLICArr"));

  -[PLBBMavHwRfLTELogMsg bpeStats](self, "bpeStats");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("RfBPEArr"));

}

- (NSString)error
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSArray)dlC0TBSzCnt
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDlC0TBSzCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSArray)dlC1TBSzCnt
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDlC1TBSzCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)logDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLogDuration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSNumber)dupMode
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDupMode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSArray)caFreqInfo
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCaFreqInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSArray)txPwrCnt
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTxPwrCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSArray)caSCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCaSCCCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSArray)actRxTxCnt
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setActRxTxCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSArray)sleepStateCnt
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSleepStateCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSArray)caPriCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCaPriCCCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSArray)caSecCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCaSecCCCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSArray)caPriSecCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setCaPriSecCCCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSArray)actRxTxPriCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setActRxTxPriCCCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSArray)actRxTxSecCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setActRxTxSecCCCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSArray)actRxTxPriSecCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setActRxTxPriSecCCCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSArray)sleepStateIdleCnt
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setSleepStateIdleCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSArray)sleepStateConnCnt
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setSleepStateConnCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSArray)rsrpIdleCnt
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (void)setRsrpIdleCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSArray)rsrpConnCnt
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setRsrpConnCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSArray)sinrIdleCnt
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setSinrIdleCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSArray)sinrConnCnt
{
  return (NSArray *)objc_getProperty(self, a2, 248, 1);
}

- (void)setSinrConnCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSArray)arxStateCnt
{
  return (NSArray *)objc_getProperty(self, a2, 256, 1);
}

- (void)setArxStateCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSArray)nlicStateCnt
{
  return (NSArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setNlicStateCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (NSArray)bpeStats
{
  return (NSArray *)objc_getProperty(self, a2, 272, 1);
}

- (void)setBpeStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSString)groupEntryKey
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setGroupEntryKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (void)setGroupID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (NSMutableArray)groupArrEntries
{
  return (NSMutableArray *)objc_getProperty(self, a2, 296, 1);
}

- (void)setGroupArrEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
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
  objc_storeStrong((id *)&self->_groupArrEntries, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_groupEntryKey, 0);
  objc_storeStrong((id *)&self->_bpeStats, 0);
  objc_storeStrong((id *)&self->_nlicStateCnt, 0);
  objc_storeStrong((id *)&self->_arxStateCnt, 0);
  objc_storeStrong((id *)&self->_sinrConnCnt, 0);
  objc_storeStrong((id *)&self->_sinrIdleCnt, 0);
  objc_storeStrong((id *)&self->_rsrpConnCnt, 0);
  objc_storeStrong((id *)&self->_rsrpIdleCnt, 0);
  objc_storeStrong((id *)&self->_sleepStateConnCnt, 0);
  objc_storeStrong((id *)&self->_sleepStateIdleCnt, 0);
  objc_storeStrong((id *)&self->_actRxTxPriSecCCCnt, 0);
  objc_storeStrong((id *)&self->_actRxTxSecCCCnt, 0);
  objc_storeStrong((id *)&self->_actRxTxPriCCCnt, 0);
  objc_storeStrong((id *)&self->_caPriSecCCCnt, 0);
  objc_storeStrong((id *)&self->_caSecCCCnt, 0);
  objc_storeStrong((id *)&self->_caPriCCCnt, 0);
  objc_storeStrong((id *)&self->_sleepStateCnt, 0);
  objc_storeStrong((id *)&self->_actRxTxCnt, 0);
  objc_storeStrong((id *)&self->_caSCCCnt, 0);
  objc_storeStrong((id *)&self->_txPwrCnt, 0);
  objc_storeStrong((id *)&self->_caFreqInfo, 0);
  objc_storeStrong((id *)&self->_dupMode, 0);
  objc_storeStrong((id *)&self->_logDuration, 0);
  objc_storeStrong((id *)&self->_dlC1TBSzCnt, 0);
  objc_storeStrong((id *)&self->_dlC0TBSzCnt, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
