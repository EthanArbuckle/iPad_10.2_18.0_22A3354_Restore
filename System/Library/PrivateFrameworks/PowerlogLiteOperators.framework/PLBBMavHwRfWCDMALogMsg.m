@implementation PLBBMavHwRfWCDMALogMsg

- (PLBBMavHwRfWCDMALogMsg)init
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  PLBBMavHwRfWCDMALogMsg *v10;
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
    block[2] = __30__PLBBMavHwRfWCDMALogMsg_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1ED884D10 != -1)
      dispatch_once(&qword_1ED884D10, block);
    if (_MergedGlobals_1_53)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavHwRfWCDMALogMsg init]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfWCDMALogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfWCDMALogMsg init]");
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
  v16.super_class = (Class)PLBBMavHwRfWCDMALogMsg;
  v10 = -[PLBBMavHwRfWCDMALogMsg init](&v16, sel_init);
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

uint64_t __30__PLBBMavHwRfWCDMALogMsg_init__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_53 = result;
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
    block[2] = __62__PLBBMavHwRfWCDMALogMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (qword_1ED884D18 != -1)
      dispatch_once(&qword_1ED884D18, block);
    if (byte_1ED884D01)
    {
      v12 = v10;
      v13 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavHwRfWCDMALogMsg sendAndLogPLEntry:withName:withType:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfWCDMALogMsg.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfWCDMALogMsg sendAndLogPLEntry:withName:withType:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 58);

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
    v47[2] = __62__PLBBMavHwRfWCDMALogMsg_sendAndLogPLEntry_withName_withType___block_invoke_251;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v20;
    if (qword_1ED884D20 != -1)
      dispatch_once(&qword_1ED884D20, v47);
    if (byte_1ED884D02)
    {
      v21 = v10;
      v44 = v10;
      v22 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sending PLEntry: name=%@ type=%@"), v9, v44);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfWCDMALogMsg.m");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfWCDMALogMsg sendAndLogPLEntry:withName:withType:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 59);

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

  -[PLBasebandMessage agent](self, "agent");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32 && objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v33 = objc_opt_class();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __62__PLBBMavHwRfWCDMALogMsg_sendAndLogPLEntry_withName_withType___block_invoke_256;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v33;
    if (qword_1ED884D28 != -1)
      dispatch_once(&qword_1ED884D28, v46);
    if (byte_1ED884D03)
    {
      v45 = v10;
      v34 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad agent"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfWCDMALogMsg.m");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "lastPathComponent");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfWCDMALogMsg sendAndLogPLEntry:withName:withType:]");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 66);

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

  -[PLBasebandMessage agent](self, "agent");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "logEntry:", v8);

}

uint64_t __62__PLBBMavHwRfWCDMALogMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D01 = result;
  return result;
}

uint64_t __62__PLBBMavHwRfWCDMALogMsg_sendAndLogPLEntry_withName_withType___block_invoke_251(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D02 = result;
  return result;
}

uint64_t __62__PLBBMavHwRfWCDMALogMsg_sendAndLogPLEntry_withName_withType___block_invoke_256(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D03 = result;
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
    block[2] = __65__PLBBMavHwRfWCDMALogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1ED884D30 != -1)
      dispatch_once(&qword_1ED884D30, block);
    if (byte_1ED884D04)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavHwRfWCDMALogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfWCDMALogMsg.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfWCDMALogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 78);

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
    v25[2] = __65__PLBBMavHwRfWCDMALogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_261;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v19;
    if (qword_1ED884D38 != -1)
      dispatch_once(&qword_1ED884D38, v25);
    if (byte_1ED884D05)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to set seqNum, date, timeCal"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfWCDMALogMsg.m");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfWCDMALogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v22, v23, 80);

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

uint64_t __65__PLBBMavHwRfWCDMALogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D04 = result;
  return result;
}

uint64_t __65__PLBBMavHwRfWCDMALogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_261(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D05 = result;
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
    block[2] = __52__PLBBMavHwRfWCDMALogMsg_addPairWithKey_andWithVal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1ED884D40 != -1)
      dispatch_once(&qword_1ED884D40, block);
    if (byte_1ED884D06)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavHwRfWCDMALogMsg addPairWithKey:andWithVal:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfWCDMALogMsg.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfWCDMALogMsg addPairWithKey:andWithVal:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 96);

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
      v30[2] = __52__PLBBMavHwRfWCDMALogMsg_addPairWithKey_andWithVal___block_invoke_272;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v16;
      if (qword_1ED884D50 != -1)
        dispatch_once(&qword_1ED884D50, v30);
      if (byte_1ED884D08)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Add KVPair [%@,%@]"), v6, v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfWCDMALogMsg.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfWCDMALogMsg addPairWithKey:andWithVal:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 102);

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
    -[PLBBMavHwRfWCDMALogMsg kvPairs](self, "kvPairs");
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
    v31[2] = __52__PLBBMavHwRfWCDMALogMsg_addPairWithKey_andWithVal___block_invoke_267;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v24;
    if (qword_1ED884D48 != -1)
      dispatch_once(&qword_1ED884D48, v31);
    if (byte_1ED884D07)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: nil key for kvPair not expected, return"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfWCDMALogMsg.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfWCDMALogMsg addPairWithKey:andWithVal:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v27, v28, 99);

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

uint64_t __52__PLBBMavHwRfWCDMALogMsg_addPairWithKey_andWithVal___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D06 = result;
  return result;
}

uint64_t __52__PLBBMavHwRfWCDMALogMsg_addPairWithKey_andWithVal___block_invoke_267(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D07 = result;
  return result;
}

uint64_t __52__PLBBMavHwRfWCDMALogMsg_addPairWithKey_andWithVal___block_invoke_272(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884D08 = result;
  return result;
}

+ (id)entryEventBackwardDefinitionBBMavHwRfWCDMA
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
  void *v14;
  void *v15;
  id v17;
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
  _QWORD v35[3];
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
  _QWORD v49[2];
  uint64_t v50;
  _QWORD v51[3];
  _QWORD v52[16];
  _QWORD v53[16];
  _QWORD v54[4];
  _QWORD v55[4];
  _QWORD v56[2];
  _QWORD v57[4];

  v57[2] = *MEMORY[0x1E0C80C00];
  v56[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v54[0] = *MEMORY[0x1E0D80318];
  v54[1] = v2;
  v55[0] = &unk_1E86535C0;
  v55[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v54[2] = *MEMORY[0x1E0D802F8];
  v54[3] = v3;
  v55[2] = CFSTR("refreshRequestHandler");
  v55[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v34;
  v56[1] = *MEMORY[0x1E0D802F0];
  v52[0] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v32;
  v52[1] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_DateFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v30;
  v52[2] = CFSTR("LogDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_RealFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v28;
  v52[3] = CFSTR("SCEqTypeDuration");
  v5 = *MEMORY[0x1E0D80348];
  v49[0] = *MEMORY[0x1E0D80358];
  v4 = v49[0];
  v49[1] = v5;
  v51[0] = &unk_1E8634710;
  v51[1] = &unk_1E8634728;
  v50 = *MEMORY[0x1E0D80350];
  v6 = v50;
  v51[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v49, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v27;
  v52[4] = CFSTR("DCEqTypeDuration");
  v47[0] = v4;
  v47[1] = v5;
  v48[0] = &unk_1E8634710;
  v48[1] = &unk_1E8634728;
  v47[2] = v6;
  v48[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v26;
  v52[5] = CFSTR("SCQSetNumCell");
  v45[0] = v4;
  v45[1] = v5;
  v46[0] = &unk_1E8634710;
  v46[1] = &unk_1E8634758;
  v45[2] = v6;
  v46[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v25;
  v52[6] = CFSTR("DCQSetNumCell");
  v43[0] = v4;
  v43[1] = v5;
  v44[0] = &unk_1E8634710;
  v44[1] = &unk_1E8634758;
  v43[2] = v6;
  v44[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v53[6] = v24;
  v52[7] = CFSTR("TimeInCarrierMode");
  v41[0] = v4;
  v41[1] = v5;
  v42[0] = &unk_1E8634710;
  v42[1] = &unk_1E8634770;
  v41[2] = v6;
  v42[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v53[7] = v23;
  v52[8] = CFSTR("DurationInRabMode");
  v39[0] = v4;
  v39[1] = v5;
  v40[0] = &unk_1E8634710;
  v40[1] = &unk_1E8634758;
  v39[2] = v6;
  v40[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v53[8] = v22;
  v52[9] = CFSTR("DurationInPsRabType");
  v37[0] = v4;
  v37[1] = v5;
  v38[0] = &unk_1E8634710;
  v38[1] = &unk_1E8634758;
  v37[2] = v6;
  v38[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v53[9] = v21;
  v52[10] = CFSTR("TxPwrBktArr");
  v35[0] = v4;
  v35[1] = v5;
  v36[0] = &unk_1E8634710;
  v36[1] = &unk_1E8634788;
  v35[2] = v6;
  v36[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v53[10] = v20;
  v52[11] = CFSTR("CPCRxOnCnt");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v53[11] = v18;
  v52[12] = CFSTR("CPCRxTxOffCnt");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v53[12] = v8;
  v52[13] = CFSTR("CPCTimeCnt");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v53[13] = v10;
  v52[14] = CFSTR("CPCEnergy");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commonTypeDict_IntegerFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v53[14] = v12;
  v52[15] = CFSTR("FetCnt");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53[15] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)entryEventBackwardDefinitionBBMav16HwRfWCDMA
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
  void *v14;
  void *v15;
  id v17;
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
  _QWORD v35[3];
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
  _QWORD v49[2];
  uint64_t v50;
  _QWORD v51[3];
  _QWORD v52[16];
  _QWORD v53[16];
  _QWORD v54[4];
  _QWORD v55[4];
  _QWORD v56[2];
  _QWORD v57[4];

  v57[2] = *MEMORY[0x1E0C80C00];
  v56[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v54[0] = *MEMORY[0x1E0D80318];
  v54[1] = v2;
  v55[0] = &unk_1E86535C0;
  v55[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v54[2] = *MEMORY[0x1E0D802F8];
  v54[3] = v3;
  v55[2] = CFSTR("refreshRequestHandler");
  v55[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v34;
  v56[1] = *MEMORY[0x1E0D802F0];
  v52[0] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v32;
  v52[1] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_DateFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v30;
  v52[2] = CFSTR("LogDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_RealFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v28;
  v52[3] = CFSTR("SCEqTypeDuration");
  v5 = *MEMORY[0x1E0D80348];
  v49[0] = *MEMORY[0x1E0D80358];
  v4 = v49[0];
  v49[1] = v5;
  v51[0] = &unk_1E8634710;
  v51[1] = &unk_1E8634728;
  v50 = *MEMORY[0x1E0D80350];
  v6 = v50;
  v51[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v49, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v27;
  v52[4] = CFSTR("DCEqTypeDuration");
  v47[0] = v4;
  v47[1] = v5;
  v48[0] = &unk_1E8634710;
  v48[1] = &unk_1E8634728;
  v47[2] = v6;
  v48[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v26;
  v52[5] = CFSTR("SCQSetNumCell");
  v45[0] = v4;
  v45[1] = v5;
  v46[0] = &unk_1E8634710;
  v46[1] = &unk_1E8634758;
  v45[2] = v6;
  v46[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v25;
  v52[6] = CFSTR("DCQSetNumCell");
  v43[0] = v4;
  v43[1] = v5;
  v44[0] = &unk_1E8634710;
  v44[1] = &unk_1E8634758;
  v43[2] = v6;
  v44[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v53[6] = v24;
  v52[7] = CFSTR("TimeInCarrierMode");
  v41[0] = v4;
  v41[1] = v5;
  v42[0] = &unk_1E8634710;
  v42[1] = &unk_1E8634770;
  v41[2] = v6;
  v42[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v53[7] = v23;
  v52[8] = CFSTR("DurationInRabMode");
  v39[0] = v4;
  v39[1] = v5;
  v40[0] = &unk_1E8634710;
  v40[1] = &unk_1E8634758;
  v39[2] = v6;
  v40[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v53[8] = v22;
  v52[9] = CFSTR("DurationInPsRabType");
  v37[0] = v4;
  v37[1] = v5;
  v38[0] = &unk_1E8634710;
  v38[1] = &unk_1E8634758;
  v37[2] = v6;
  v38[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v53[9] = v21;
  v52[10] = CFSTR("TxPwrBktArr");
  v35[0] = v4;
  v35[1] = v5;
  v36[0] = &unk_1E8634710;
  v36[1] = &unk_1E86347A0;
  v35[2] = v6;
  v36[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v53[10] = v20;
  v52[11] = CFSTR("CPCRxOnCnt");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v53[11] = v18;
  v52[12] = CFSTR("CPCRxTxOffCnt");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v53[12] = v8;
  v52[13] = CFSTR("CPCTimeCnt");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v53[13] = v10;
  v52[14] = CFSTR("CPCEnergy");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commonTypeDict_IntegerFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v53[14] = v12;
  v52[15] = CFSTR("FetCnt");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53[15] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)entryEventBackwardDefinitionBBMav16BHwRfWCDMA
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
  void *v14;
  void *v15;
  id v17;
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
  _QWORD v35[3];
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
  _QWORD v49[2];
  uint64_t v50;
  _QWORD v51[3];
  _QWORD v52[16];
  _QWORD v53[16];
  _QWORD v54[4];
  _QWORD v55[4];
  _QWORD v56[2];
  _QWORD v57[4];

  v57[2] = *MEMORY[0x1E0C80C00];
  v56[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v54[0] = *MEMORY[0x1E0D80318];
  v54[1] = v2;
  v55[0] = &unk_1E86535C0;
  v55[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v54[2] = *MEMORY[0x1E0D802F8];
  v54[3] = v3;
  v55[2] = CFSTR("refreshRequestHandler");
  v55[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v34;
  v56[1] = *MEMORY[0x1E0D802F0];
  v52[0] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v32;
  v52[1] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_DateFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v30;
  v52[2] = CFSTR("LogDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_RealFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v28;
  v52[3] = CFSTR("SCEqTypeDuration");
  v5 = *MEMORY[0x1E0D80348];
  v49[0] = *MEMORY[0x1E0D80358];
  v4 = v49[0];
  v49[1] = v5;
  v51[0] = &unk_1E8634710;
  v51[1] = &unk_1E8634728;
  v50 = *MEMORY[0x1E0D80350];
  v6 = v50;
  v51[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v49, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v27;
  v52[4] = CFSTR("DCEqTypeDuration");
  v47[0] = v4;
  v47[1] = v5;
  v48[0] = &unk_1E8634710;
  v48[1] = &unk_1E8634728;
  v47[2] = v6;
  v48[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v26;
  v52[5] = CFSTR("SCQSetNumCell");
  v45[0] = v4;
  v45[1] = v5;
  v46[0] = &unk_1E8634710;
  v46[1] = &unk_1E8634758;
  v45[2] = v6;
  v46[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v25;
  v52[6] = CFSTR("DCQSetNumCell");
  v43[0] = v4;
  v43[1] = v5;
  v44[0] = &unk_1E8634710;
  v44[1] = &unk_1E8634758;
  v43[2] = v6;
  v44[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v53[6] = v24;
  v52[7] = CFSTR("TimeInCarrierMode");
  v41[0] = v4;
  v41[1] = v5;
  v42[0] = &unk_1E8634710;
  v42[1] = &unk_1E8634770;
  v41[2] = v6;
  v42[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v53[7] = v23;
  v52[8] = CFSTR("DurationInRabMode");
  v39[0] = v4;
  v39[1] = v5;
  v40[0] = &unk_1E8634710;
  v40[1] = &unk_1E8634758;
  v39[2] = v6;
  v40[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v53[8] = v22;
  v52[9] = CFSTR("DurationInPsRabType");
  v37[0] = v4;
  v37[1] = v5;
  v38[0] = &unk_1E8634710;
  v38[1] = &unk_1E8634758;
  v37[2] = v6;
  v38[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v53[9] = v21;
  v52[10] = CFSTR("TxPwrBktArr");
  v35[0] = v4;
  v35[1] = v5;
  v36[0] = &unk_1E8634710;
  v36[1] = &unk_1E8634788;
  v35[2] = v6;
  v36[2] = &unk_1E8634740;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v53[10] = v20;
  v52[11] = CFSTR("CPCRxOnCnt");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v53[11] = v18;
  v52[12] = CFSTR("CPCRxTxOffCnt");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v53[12] = v8;
  v52[13] = CFSTR("CPCTimeCnt");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v53[13] = v10;
  v52[14] = CFSTR("CPCEnergy");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commonTypeDict_IntegerFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v53[14] = v12;
  v52[15] = CFSTR("FetCnt");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53[15] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)refreshRequest
{
  objc_autoreleasePoolPop((void *)MEMORY[0x1D179C2E0](self, a2));
}

- (id)logEventBackwardBBMavHwRfWCDMA
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("BBMavHwRfWCDMA"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v3);
  -[PLBBMavHwRfWCDMALogMsg populateEntry:](self, "populateEntry:", v4);
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
  id v23;

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

  -[PLBBMavHwRfWCDMALogMsg logDuration](self, "logDuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("LogDuration"));

  -[PLBBMavHwRfWCDMALogMsg SCEqStatCnt](self, "SCEqStatCnt");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("SCEqTypeDuration"));

  -[PLBBMavHwRfWCDMALogMsg DCEqStatCnt](self, "DCEqStatCnt");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("DCEqTypeDuration"));

  -[PLBBMavHwRfWCDMALogMsg SCQsetEqStatCnt](self, "SCQsetEqStatCnt");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("SCQSetNumCell"));

  -[PLBBMavHwRfWCDMALogMsg DCQsetEqStatCnt](self, "DCQsetEqStatCnt");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("DCQSetNumCell"));

  -[PLBBMavHwRfWCDMALogMsg DurInCarrierMode](self, "DurInCarrierMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("TimeInCarrierMode"));

  -[PLBBMavHwRfWCDMALogMsg RABModeCnt](self, "RABModeCnt");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("DurationInRabMode"));

  -[PLBBMavHwRfWCDMALogMsg TxPwrBucket](self, "TxPwrBucket");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("TxPwrBktArr"));

  -[PLBBMavHwRfWCDMALogMsg RABTypeCnt](self, "RABTypeCnt");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("DurationInPsRabType"));

  -[PLBBMavHwRfWCDMALogMsg fetCnt](self, "fetCnt");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("FetCnt"));

  -[PLBBMavHwRfWCDMALogMsg cpcRxOnCnt](self, "cpcRxOnCnt");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("CPCRxOnCnt"));

  -[PLBBMavHwRfWCDMALogMsg cpcRxTxOffCnt](self, "cpcRxTxOffCnt");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("CPCRxTxOffCnt"));

  -[PLBBMavHwRfWCDMALogMsg cpcTimeCnt](self, "cpcTimeCnt");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("CPCTimeCnt"));

  -[PLBBMavHwRfWCDMALogMsg cpcEnergy](self, "cpcEnergy");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("CPCEnergy"));

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

- (NSArray)SCEqStatCnt
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSCEqStatCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSArray)DCEqStatCnt
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDCEqStatCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSArray)SCQsetEqStatCnt
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSCQsetEqStatCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSArray)DCQsetEqStatCnt
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setDCQsetEqStatCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSArray)DurInCarrierMode
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDurInCarrierMode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSArray)RABModeCnt
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setRABModeCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSArray)RABTypeCnt
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setRABTypeCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSArray)TxPwrBucket
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setTxPwrBucket:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSNumber)fetCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setFetCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSNumber)cpcRxOnCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCpcRxOnCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSNumber)cpcRxTxOffCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 200, 1);
}

- (void)setCpcRxTxOffCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSNumber)cpcTimeCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setCpcTimeCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSNumber)cpcEnergy
{
  return (NSNumber *)objc_getProperty(self, a2, 216, 1);
}

- (void)setCpcEnergy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSString)groupEntryKey
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setGroupEntryKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setGroupID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSMutableArray)groupArrEntries
{
  return (NSMutableArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setGroupArrEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
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
  objc_storeStrong((id *)&self->_cpcEnergy, 0);
  objc_storeStrong((id *)&self->_cpcTimeCnt, 0);
  objc_storeStrong((id *)&self->_cpcRxTxOffCnt, 0);
  objc_storeStrong((id *)&self->_cpcRxOnCnt, 0);
  objc_storeStrong((id *)&self->_fetCnt, 0);
  objc_storeStrong((id *)&self->_TxPwrBucket, 0);
  objc_storeStrong((id *)&self->_RABTypeCnt, 0);
  objc_storeStrong((id *)&self->_RABModeCnt, 0);
  objc_storeStrong((id *)&self->_DurInCarrierMode, 0);
  objc_storeStrong((id *)&self->_DCQsetEqStatCnt, 0);
  objc_storeStrong((id *)&self->_SCQsetEqStatCnt, 0);
  objc_storeStrong((id *)&self->_DCEqStatCnt, 0);
  objc_storeStrong((id *)&self->_SCEqStatCnt, 0);
  objc_storeStrong((id *)&self->_logDuration, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
