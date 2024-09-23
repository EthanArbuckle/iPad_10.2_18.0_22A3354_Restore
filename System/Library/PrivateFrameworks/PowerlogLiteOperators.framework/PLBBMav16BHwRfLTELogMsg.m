@implementation PLBBMav16BHwRfLTELogMsg

- (PLBBMav16BHwRfLTELogMsg)init
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  PLBBMav16BHwRfLTELogMsg *v10;
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
    block[2] = __31__PLBBMav16BHwRfLTELogMsg_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1ED882790 != -1)
      dispatch_once(&qword_1ED882790, block);
    if (_MergedGlobals_1_15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav16BHwRfLTELogMsg init]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwRfLTELogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwRfLTELogMsg init]");
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
  v16.super_class = (Class)PLBBMav16BHwRfLTELogMsg;
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

uint64_t __31__PLBBMav16BHwRfLTELogMsg_init__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_15 = result;
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
    block[2] = __63__PLBBMav16BHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (qword_1ED882798 != -1)
      dispatch_once(&qword_1ED882798, block);
    if (byte_1ED882781)
    {
      v12 = v10;
      v13 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav16BHwRfLTELogMsg sendAndLogPLEntry:withName:withType:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwRfLTELogMsg.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwRfLTELogMsg sendAndLogPLEntry:withName:withType:]");
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
    v47[2] = __63__PLBBMav16BHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_251;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v20;
    if (qword_1ED8827A0 != -1)
      dispatch_once(&qword_1ED8827A0, v47);
    if (byte_1ED882782)
    {
      v21 = v10;
      v44 = v10;
      v22 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sending PLEntry: name=%@ type=%@"), v9, v44);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwRfLTELogMsg.m");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwRfLTELogMsg sendAndLogPLEntry:withName:withType:]");
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
    v46[2] = __63__PLBBMav16BHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_256;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v33;
    if (qword_1ED8827A8 != -1)
      dispatch_once(&qword_1ED8827A8, v46);
    if (byte_1ED882783)
    {
      v45 = v10;
      v34 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad agent"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwRfLTELogMsg.m");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "lastPathComponent");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwRfLTELogMsg sendAndLogPLEntry:withName:withType:]");
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

uint64_t __63__PLBBMav16BHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882781 = result;
  return result;
}

uint64_t __63__PLBBMav16BHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_251(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882782 = result;
  return result;
}

uint64_t __63__PLBBMav16BHwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_256(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882783 = result;
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
    block[2] = __66__PLBBMav16BHwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1ED8827B0 != -1)
      dispatch_once(&qword_1ED8827B0, block);
    if (byte_1ED882784)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav16BHwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwRfLTELogMsg.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
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
    v25[2] = __66__PLBBMav16BHwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_261;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v19;
    if (qword_1ED8827B8 != -1)
      dispatch_once(&qword_1ED8827B8, v25);
    if (byte_1ED882785)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to set seqNum, date, timeCal"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwRfLTELogMsg.m");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
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

uint64_t __66__PLBBMav16BHwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882784 = result;
  return result;
}

uint64_t __66__PLBBMav16BHwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_261(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882785 = result;
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
    block[2] = __53__PLBBMav16BHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1ED8827C0 != -1)
      dispatch_once(&qword_1ED8827C0, block);
    if (byte_1ED882786)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav16BHwRfLTELogMsg addPairWithKey:andWithVal:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwRfLTELogMsg.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwRfLTELogMsg addPairWithKey:andWithVal:]");
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
      v30[2] = __53__PLBBMav16BHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_272;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v16;
      if (qword_1ED8827D0 != -1)
        dispatch_once(&qword_1ED8827D0, v30);
      if (byte_1ED882788)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Add KVPair [%@,%@]"), v6, v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwRfLTELogMsg.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwRfLTELogMsg addPairWithKey:andWithVal:]");
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
    -[PLBBMav16BHwRfLTELogMsg kvPairs](self, "kvPairs");
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
    v31[2] = __53__PLBBMav16BHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_267;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v24;
    if (qword_1ED8827C8 != -1)
      dispatch_once(&qword_1ED8827C8, v31);
    if (byte_1ED882787)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: nil key for kvPair not expected, return"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwRfLTELogMsg.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwRfLTELogMsg addPairWithKey:andWithVal:]");
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

uint64_t __53__PLBBMav16BHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882786 = result;
  return result;
}

uint64_t __53__PLBBMav16BHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_267(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882787 = result;
  return result;
}

uint64_t __53__PLBBMav16BHwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_272(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882788 = result;
  return result;
}

+ (id)entryEventBackwardDefinitionBBMav16BHwRfLTE
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
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _QWORD v85[3];
  _QWORD v86[3];
  _QWORD v87[3];
  _QWORD v88[3];
  _QWORD v89[3];
  _QWORD v90[3];
  _QWORD v91[3];
  _QWORD v92[3];
  _QWORD v93[3];
  _QWORD v94[3];
  _QWORD v95[3];
  _QWORD v96[3];
  _QWORD v97[3];
  _QWORD v98[3];
  _QWORD v99[3];
  _QWORD v100[3];
  _QWORD v101[3];
  _QWORD v102[3];
  _QWORD v103[3];
  _QWORD v104[3];
  _QWORD v105[3];
  _QWORD v106[3];
  _QWORD v107[3];
  _QWORD v108[3];
  _QWORD v109[3];
  _QWORD v110[3];
  _QWORD v111[3];
  _QWORD v112[3];
  _QWORD v113[3];
  _QWORD v114[3];
  _QWORD v115[2];
  uint64_t v116;
  _QWORD v117[3];
  _QWORD v118[45];
  _QWORD v119[45];
  _QWORD v120[4];
  _QWORD v121[4];
  _QWORD v122[2];
  _QWORD v123[4];

  v123[2] = *MEMORY[0x1E0C80C00];
  v122[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v120[0] = *MEMORY[0x1E0D80318];
  v120[1] = v2;
  v121[0] = &unk_1E8652A70;
  v121[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v120[2] = *MEMORY[0x1E0D802F8];
  v120[3] = v3;
  v121[2] = CFSTR("refreshMav16BBBRfLTE");
  v121[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v121, v120, 4);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v123[0] = v84;
  v122[1] = *MEMORY[0x1E0D802F0];
  v118[0] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "commonTypeDict_IntegerFormat");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v119[0] = v82;
  v118[1] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "commonTypeDict_DateFormat");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v119[1] = v80;
  v118[2] = CFSTR("LogDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "commonTypeDict_RealFormat");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v119[2] = v78;
  v118[3] = CFSTR("DupMode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "commonTypeDict_IntegerFormat");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v119[3] = v76;
  v118[4] = CFSTR("PCC_Band");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "commonTypeDict_IntegerFormat");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v119[4] = v74;
  v118[5] = CFSTR("PCC_BW");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "commonTypeDict_IntegerFormat");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v119[5] = v72;
  v118[6] = CFSTR("SCC1_Band");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "commonTypeDict_IntegerFormat");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v119[6] = v70;
  v118[7] = CFSTR("SCC1_BW");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "commonTypeDict_IntegerFormat");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v119[7] = v68;
  v118[8] = CFSTR("SCC2_Band");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "commonTypeDict_IntegerFormat");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v119[8] = v66;
  v118[9] = CFSTR("SCC2_BW");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "commonTypeDict_IntegerFormat");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v119[9] = v64;
  v118[10] = CFSTR("SCC3_Band");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "commonTypeDict_IntegerFormat");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v119[10] = v62;
  v118[11] = CFSTR("SCC3_BW");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "commonTypeDict_IntegerFormat");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v119[11] = v60;
  v118[12] = CFSTR("DLTBSzArr");
  v5 = *MEMORY[0x1E0D80348];
  v115[0] = *MEMORY[0x1E0D80358];
  v4 = v115[0];
  v115[1] = v5;
  v117[0] = &unk_1E86321C0;
  v117[1] = &unk_1E86321D8;
  v116 = *MEMORY[0x1E0D80350];
  v6 = v116;
  v117[2] = &unk_1E86321F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v117, v115, 3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v119[12] = v59;
  v118[13] = CFSTR("TxPwrBktArr");
  v113[0] = v4;
  v113[1] = v5;
  v114[0] = &unk_1E86321C0;
  v114[1] = &unk_1E8632208;
  v113[2] = v6;
  v114[2] = &unk_1E86321F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v119[13] = v58;
  v118[14] = CFSTR("CASCCStateArr");
  v111[0] = v4;
  v111[1] = v5;
  v112[0] = &unk_1E86321C0;
  v112[1] = &unk_1E8632220;
  v111[2] = v6;
  v112[2] = &unk_1E86321F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 3);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v119[14] = v57;
  v118[15] = CFSTR("ULCACStateArr");
  v109[0] = v4;
  v109[1] = v5;
  v110[0] = &unk_1E86321C0;
  v110[1] = &unk_1E8632238;
  v109[2] = v6;
  v110[2] = &unk_1E86321F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 3);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v119[15] = v56;
  v118[16] = CFSTR("kRfActRxTxArr");
  v107[0] = v4;
  v107[1] = v5;
  v108[0] = &unk_1E86321C0;
  v108[1] = &unk_1E8632250;
  v107[2] = v6;
  v108[2] = &unk_1E86321F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v119[16] = v55;
  v118[17] = CFSTR("SleepStateIdleArr");
  v105[0] = v4;
  v105[1] = v5;
  v106[0] = &unk_1E86321C0;
  v106[1] = &unk_1E8632268;
  v105[2] = v6;
  v106[2] = &unk_1E86321F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 3);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v119[17] = v54;
  v118[18] = CFSTR("SleepStateConnArr");
  v103[0] = v4;
  v103[1] = v5;
  v104[0] = &unk_1E86321C0;
  v104[1] = &unk_1E8632268;
  v103[2] = v6;
  v104[2] = &unk_1E86321F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v119[18] = v53;
  v118[19] = CFSTR("RfRSRPIdleArr");
  v101[0] = v4;
  v101[1] = v5;
  v102[0] = &unk_1E86321C0;
  v102[1] = &unk_1E8632250;
  v101[2] = v6;
  v102[2] = &unk_1E86321F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v119[19] = v52;
  v118[20] = CFSTR("RfRSRPConnArr");
  v99[0] = v4;
  v99[1] = v5;
  v100[0] = &unk_1E86321C0;
  v100[1] = &unk_1E8632250;
  v99[2] = v6;
  v100[2] = &unk_1E86321F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v99, 3);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v119[20] = v51;
  v118[21] = CFSTR("RfSINRIdleArr");
  v97[0] = v4;
  v97[1] = v5;
  v98[0] = &unk_1E86321C0;
  v98[1] = &unk_1E8632250;
  v97[2] = v6;
  v98[2] = &unk_1E86321F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 3);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v119[21] = v50;
  v118[22] = CFSTR("RfSINRConnArr");
  v95[0] = v4;
  v95[1] = v5;
  v96[0] = &unk_1E86321C0;
  v96[1] = &unk_1E8632250;
  v95[2] = v6;
  v96[2] = &unk_1E86321F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v119[22] = v49;
  v118[23] = CFSTR("RfNLICArr");
  v93[0] = v4;
  v93[1] = v5;
  v94[0] = &unk_1E86321C0;
  v94[1] = &unk_1E8632238;
  v93[2] = v6;
  v94[2] = &unk_1E86321F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v119[23] = v48;
  v118[24] = CFSTR("ARD_RxD_Off_Duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v119[24] = v46;
  v118[25] = CFSTR("uSleep_PCC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v119[25] = v44;
  v118[26] = CFSTR("uSleep_SCC1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v119[26] = v42;
  v118[27] = CFSTR("uSleep_SCC2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v119[27] = v40;
  v118[28] = CFSTR("uSleep_SCC3");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v119[28] = v38;
  v118[29] = CFSTR("HSIC_PCC_OffOn");
  v91[0] = v4;
  v91[1] = v5;
  v92[0] = &unk_1E86321C0;
  v92[1] = &unk_1E8632280;
  v91[2] = v6;
  v92[2] = &unk_1E86321F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v119[29] = v37;
  v118[30] = CFSTR("HSIC_SCC1_OffOn");
  v89[0] = v4;
  v89[1] = v5;
  v90[0] = &unk_1E86321C0;
  v90[1] = &unk_1E8632280;
  v89[2] = v6;
  v90[2] = &unk_1E86321F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v119[30] = v36;
  v118[31] = CFSTR("HSIC_SCC2_OffOn");
  v87[0] = v4;
  v87[1] = v5;
  v88[0] = &unk_1E86321C0;
  v88[1] = &unk_1E8632280;
  v87[2] = v6;
  v88[2] = &unk_1E86321F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v119[31] = v35;
  v118[32] = CFSTR("HSIC_SCC3_OffOn");
  v85[0] = v4;
  v85[1] = v5;
  v86[0] = &unk_1E86321C0;
  v86[1] = &unk_1E8632280;
  v85[2] = v6;
  v86[2] = &unk_1E86321F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v119[32] = v34;
  v118[33] = CFSTR("PCC_ARX_Off");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v119[33] = v32;
  v118[34] = CFSTR("SCC1_ARX_Off");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v119[34] = v30;
  v118[35] = CFSTR("SCC2_ARX_Off");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v119[35] = v28;
  v118[36] = CFSTR("SCC3_ARX_Off");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v119[36] = v26;
  v118[37] = CFSTR("PCC_ARX_Baseline");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v119[37] = v24;
  v118[38] = CFSTR("SCC1_ARX_Baseline");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v119[38] = v22;
  v118[39] = CFSTR("SCC2_ARX_Baseline");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v119[39] = v20;
  v118[40] = CFSTR("SCC3_ARX_Baseline");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v119[40] = v18;
  v118[41] = CFSTR("PCC_ARX_QICE");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v119[41] = v8;
  v118[42] = CFSTR("SCC1_ARX_QICE");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v119[42] = v10;
  v118[43] = CFSTR("SCC2_ARX_QICE");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commonTypeDict_IntegerFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v119[43] = v12;
  v118[44] = CFSTR("SCC3_ARX_QICE");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v119[44] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, v118, 45);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v123[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v123, v122, 2);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)refreshMav16BBBRfLTE
{
  objc_autoreleasePoolPop((void *)MEMORY[0x1D179C2E0](self, a2));
}

- (id)logEventBackwardBBMav16BHwRfLTE
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
    v16 = __58__PLBBMav16BHwRfLTELogMsg_logEventBackwardBBMav16BHwRfLTE__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v3;
    if (qword_1ED8827D8 != -1)
      dispatch_once(&qword_1ED8827D8, &block);
    if (byte_1ED882789)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav16BHwRfLTELogMsg logEventBackwardBBMav16BHwRfLTE]", block, v15, v16, v17, v18);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16BHwRfLTELogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16BHwRfLTELogMsg logEventBackwardBBMav16BHwRfLTE]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 264);

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
  -[PLBBMav16BHwRfLTELogMsg populateMav16BEntry:](self, "populateMav16BEntry:", v11);
  v19[0] = CFSTR("entry");
  v19[1] = CFSTR("entryKey");
  v20[0] = v11;
  v20[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __58__PLBBMav16BHwRfLTELogMsg_logEventBackwardBBMav16BHwRfLTE__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882789 = result;
  return result;
}

- (void)populateMav16BEntry:(id)a3
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
  id v54;

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

  -[PLBBMav16BHwRfLTELogMsg logDuration](self, "logDuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("LogDuration"));

  -[PLBBMav16BHwRfLTELogMsg dupMode](self, "dupMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("DupMode"));

  -[PLBBMav16BHwRfLTELogMsg PCCFreq](self, "PCCFreq");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("PCC_Band"));

  -[PLBBMav16BHwRfLTELogMsg PCCBw](self, "PCCBw");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("PCC_BW"));

  -[PLBBMav16BHwRfLTELogMsg SCC1Freq](self, "SCC1Freq");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("SCC1_Band"));

  -[PLBBMav16BHwRfLTELogMsg SCC1Bw](self, "SCC1Bw");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("SCC1_BW"));

  -[PLBBMav16BHwRfLTELogMsg SCC2Freq](self, "SCC2Freq");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("SCC2_Band"));

  -[PLBBMav16BHwRfLTELogMsg SCC2Bw](self, "SCC2Bw");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("SCC2_BW"));

  -[PLBBMav16BHwRfLTELogMsg SCC3Freq](self, "SCC3Freq");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("SCC3_Band"));

  -[PLBBMav16BHwRfLTELogMsg SCC3Bw](self, "SCC3Bw");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("SCC3_BW"));

  -[PLBBMav16BHwRfLTELogMsg dlTBSzCnt](self, "dlTBSzCnt");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("DLTBSzArr"));

  -[PLBBMav16BHwRfLTELogMsg txPwrCnt](self, "txPwrCnt");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("TxPwrBktArr"));

  -[PLBBMav16BHwRfLTELogMsg caSCCCnt](self, "caSCCCnt");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("CASCCStateArr"));

  -[PLBBMav16BHwRfLTELogMsg ulCaSCCCnt](self, "ulCaSCCCnt");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("ULCACStateArr"));

  -[PLBBMav16BHwRfLTELogMsg actRxTxCnt](self, "actRxTxCnt");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("kRfActRxTxArr"));

  -[PLBBMav16BHwRfLTELogMsg sleepStateIdleCnt](self, "sleepStateIdleCnt");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("SleepStateIdleArr"));

  -[PLBBMav16BHwRfLTELogMsg sleepStateConnCnt](self, "sleepStateConnCnt");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("SleepStateConnArr"));

  -[PLBBMav16BHwRfLTELogMsg rsrpIdleCnt](self, "rsrpIdleCnt");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("RfRSRPIdleArr"));

  -[PLBBMav16BHwRfLTELogMsg rsrpConnCnt](self, "rsrpConnCnt");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("RfRSRPConnArr"));

  -[PLBBMav16BHwRfLTELogMsg sinrIdleCnt](self, "sinrIdleCnt");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("RfSINRIdleArr"));

  -[PLBBMav16BHwRfLTELogMsg sinrConnCnt](self, "sinrConnCnt");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, CFSTR("RfSINRConnArr"));

  -[PLBBMav16BHwRfLTELogMsg arxStateCnt](self, "arxStateCnt");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, CFSTR("RfARXArr"));

  -[PLBBMav16BHwRfLTELogMsg nlicStateCnt](self, "nlicStateCnt");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("RfNLICArr"));

  -[PLBBMav16BHwRfLTELogMsg bpeStats](self, "bpeStats");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("RfBPEArr"));

  -[PLBBMav16BHwRfLTELogMsg ardRxDOff](self, "ardRxDOff");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, CFSTR("ARD_RxD_Off_Duration"));

  -[PLBBMav16BHwRfLTELogMsg uSleepPCCCnt](self, "uSleepPCCCnt");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, CFSTR("uSleep_PCC"));

  -[PLBBMav16BHwRfLTELogMsg uSleepSCC1Cnt](self, "uSleepSCC1Cnt");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, CFSTR("uSleep_SCC1"));

  -[PLBBMav16BHwRfLTELogMsg uSleepSCC2Cnt](self, "uSleepSCC2Cnt");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, CFSTR("uSleep_SCC2"));

  -[PLBBMav16BHwRfLTELogMsg uSleepSCC3Cnt](self, "uSleepSCC3Cnt");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v38, CFSTR("uSleep_SCC3"));

  -[PLBBMav16BHwRfLTELogMsg hsicPCC](self, "hsicPCC");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v39, CFSTR("HSIC_PCC_OffOn"));

  -[PLBBMav16BHwRfLTELogMsg hsicSCC1](self, "hsicSCC1");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v40, CFSTR("HSIC_SCC1_OffOn"));

  -[PLBBMav16BHwRfLTELogMsg hsicSCC2](self, "hsicSCC2");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v41, CFSTR("HSIC_SCC2_OffOn"));

  -[PLBBMav16BHwRfLTELogMsg hsicSCC3](self, "hsicSCC3");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v42, CFSTR("HSIC_SCC3_OffOn"));

  -[PLBBMav16BHwRfLTELogMsg arxOffPCC](self, "arxOffPCC");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v43, CFSTR("PCC_ARX_Off"));

  -[PLBBMav16BHwRfLTELogMsg arxOffSCC1](self, "arxOffSCC1");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v44, CFSTR("SCC1_ARX_Off"));

  -[PLBBMav16BHwRfLTELogMsg arxOffSCC2](self, "arxOffSCC2");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v45, CFSTR("SCC2_ARX_Off"));

  -[PLBBMav16BHwRfLTELogMsg arxOffSCC3](self, "arxOffSCC3");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v46, CFSTR("SCC3_ARX_Off"));

  -[PLBBMav16BHwRfLTELogMsg arxBaselinePCC](self, "arxBaselinePCC");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v47, CFSTR("PCC_ARX_Baseline"));

  -[PLBBMav16BHwRfLTELogMsg arxBaselineSCC1](self, "arxBaselineSCC1");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v48, CFSTR("SCC1_ARX_Baseline"));

  -[PLBBMav16BHwRfLTELogMsg arxBaselineSCC2](self, "arxBaselineSCC2");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v49, CFSTR("SCC2_ARX_Baseline"));

  -[PLBBMav16BHwRfLTELogMsg arxBaselineSCC3](self, "arxBaselineSCC3");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v50, CFSTR("SCC3_ARX_Baseline"));

  -[PLBBMav16BHwRfLTELogMsg arxQicePCC](self, "arxQicePCC");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v51, CFSTR("PCC_ARX_QICE"));

  -[PLBBMav16BHwRfLTELogMsg arxQiceSCC1](self, "arxQiceSCC1");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v52, CFSTR("SCC1_ARX_QICE"));

  -[PLBBMav16BHwRfLTELogMsg arxQiceSCC2](self, "arxQiceSCC2");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v53, CFSTR("SCC2_ARX_QICE"));

  -[PLBBMav16BHwRfLTELogMsg arxQiceSCC3](self, "arxQiceSCC3");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v54, CFSTR("SCC3_ARX_QICE"));

}

- (NSString)error
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSArray)dlTBSzCnt
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDlTBSzCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)logDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLogDuration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)dupMode
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDupMode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSNumber)PCCFreq
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPCCFreq:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSNumber)PCCBw
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPCCBw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSNumber)SCC1Freq
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSCC1Freq:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSNumber)SCC1Bw
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSCC1Bw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSNumber)SCC2Freq
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSCC2Freq:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSNumber)SCC2Bw
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSCC2Bw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSNumber)SCC3Freq
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSCC3Freq:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSNumber)SCC3Bw
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setSCC3Bw:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSArray)txPwrCnt
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setTxPwrCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSArray)caSCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCaSCCCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSArray)ulCaSCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setUlCaSCCCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSArray)actRxTxCnt
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setActRxTxCnt:(id)a3
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

- (NSNumber)ardRxDOff
{
  return (NSNumber *)objc_getProperty(self, a2, 280, 1);
}

- (void)setArdRxDOff:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSNumber)uSleepPCCCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 288, 1);
}

- (void)setUSleepPCCCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (NSNumber)uSleepSCC1Cnt
{
  return (NSNumber *)objc_getProperty(self, a2, 296, 1);
}

- (void)setUSleepSCC1Cnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (NSNumber)uSleepSCC2Cnt
{
  return (NSNumber *)objc_getProperty(self, a2, 304, 1);
}

- (void)setUSleepSCC2Cnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (NSNumber)uSleepSCC3Cnt
{
  return (NSNumber *)objc_getProperty(self, a2, 312, 1);
}

- (void)setUSleepSCC3Cnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (NSArray)hsicPCC
{
  return (NSArray *)objc_getProperty(self, a2, 320, 1);
}

- (void)setHsicPCC:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSArray)hsicSCC1
{
  return (NSArray *)objc_getProperty(self, a2, 328, 1);
}

- (void)setHsicSCC1:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (NSArray)hsicSCC2
{
  return (NSArray *)objc_getProperty(self, a2, 336, 1);
}

- (void)setHsicSCC2:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (NSArray)hsicSCC3
{
  return (NSArray *)objc_getProperty(self, a2, 344, 1);
}

- (void)setHsicSCC3:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (NSNumber)arxOffPCC
{
  return (NSNumber *)objc_getProperty(self, a2, 352, 1);
}

- (void)setArxOffPCC:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (NSNumber)arxOffSCC1
{
  return (NSNumber *)objc_getProperty(self, a2, 360, 1);
}

- (void)setArxOffSCC1:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (NSNumber)arxOffSCC2
{
  return (NSNumber *)objc_getProperty(self, a2, 368, 1);
}

- (void)setArxOffSCC2:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (NSNumber)arxOffSCC3
{
  return (NSNumber *)objc_getProperty(self, a2, 376, 1);
}

- (void)setArxOffSCC3:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (NSNumber)arxBaselinePCC
{
  return (NSNumber *)objc_getProperty(self, a2, 384, 1);
}

- (void)setArxBaselinePCC:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (NSNumber)arxBaselineSCC1
{
  return (NSNumber *)objc_getProperty(self, a2, 392, 1);
}

- (void)setArxBaselineSCC1:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (NSNumber)arxBaselineSCC2
{
  return (NSNumber *)objc_getProperty(self, a2, 400, 1);
}

- (void)setArxBaselineSCC2:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (NSNumber)arxBaselineSCC3
{
  return (NSNumber *)objc_getProperty(self, a2, 408, 1);
}

- (void)setArxBaselineSCC3:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (NSNumber)arxQicePCC
{
  return (NSNumber *)objc_getProperty(self, a2, 416, 1);
}

- (void)setArxQicePCC:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (NSNumber)arxQiceSCC1
{
  return (NSNumber *)objc_getProperty(self, a2, 424, 1);
}

- (void)setArxQiceSCC1:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (NSNumber)arxQiceSCC2
{
  return (NSNumber *)objc_getProperty(self, a2, 432, 1);
}

- (void)setArxQiceSCC2:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (NSNumber)arxQiceSCC3
{
  return (NSNumber *)objc_getProperty(self, a2, 440, 1);
}

- (void)setArxQiceSCC3:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (NSString)groupEntryKey
{
  return (NSString *)objc_getProperty(self, a2, 448, 1);
}

- (void)setGroupEntryKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 456, 1);
}

- (void)setGroupID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (NSMutableArray)groupArrEntries
{
  return (NSMutableArray *)objc_getProperty(self, a2, 464, 1);
}

- (void)setGroupArrEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
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
  objc_storeStrong((id *)&self->_arxQiceSCC3, 0);
  objc_storeStrong((id *)&self->_arxQiceSCC2, 0);
  objc_storeStrong((id *)&self->_arxQiceSCC1, 0);
  objc_storeStrong((id *)&self->_arxQicePCC, 0);
  objc_storeStrong((id *)&self->_arxBaselineSCC3, 0);
  objc_storeStrong((id *)&self->_arxBaselineSCC2, 0);
  objc_storeStrong((id *)&self->_arxBaselineSCC1, 0);
  objc_storeStrong((id *)&self->_arxBaselinePCC, 0);
  objc_storeStrong((id *)&self->_arxOffSCC3, 0);
  objc_storeStrong((id *)&self->_arxOffSCC2, 0);
  objc_storeStrong((id *)&self->_arxOffSCC1, 0);
  objc_storeStrong((id *)&self->_arxOffPCC, 0);
  objc_storeStrong((id *)&self->_hsicSCC3, 0);
  objc_storeStrong((id *)&self->_hsicSCC2, 0);
  objc_storeStrong((id *)&self->_hsicSCC1, 0);
  objc_storeStrong((id *)&self->_hsicPCC, 0);
  objc_storeStrong((id *)&self->_uSleepSCC3Cnt, 0);
  objc_storeStrong((id *)&self->_uSleepSCC2Cnt, 0);
  objc_storeStrong((id *)&self->_uSleepSCC1Cnt, 0);
  objc_storeStrong((id *)&self->_uSleepPCCCnt, 0);
  objc_storeStrong((id *)&self->_ardRxDOff, 0);
  objc_storeStrong((id *)&self->_bpeStats, 0);
  objc_storeStrong((id *)&self->_nlicStateCnt, 0);
  objc_storeStrong((id *)&self->_arxStateCnt, 0);
  objc_storeStrong((id *)&self->_sinrConnCnt, 0);
  objc_storeStrong((id *)&self->_sinrIdleCnt, 0);
  objc_storeStrong((id *)&self->_rsrpConnCnt, 0);
  objc_storeStrong((id *)&self->_rsrpIdleCnt, 0);
  objc_storeStrong((id *)&self->_sleepStateConnCnt, 0);
  objc_storeStrong((id *)&self->_sleepStateIdleCnt, 0);
  objc_storeStrong((id *)&self->_actRxTxCnt, 0);
  objc_storeStrong((id *)&self->_ulCaSCCCnt, 0);
  objc_storeStrong((id *)&self->_caSCCCnt, 0);
  objc_storeStrong((id *)&self->_txPwrCnt, 0);
  objc_storeStrong((id *)&self->_SCC3Bw, 0);
  objc_storeStrong((id *)&self->_SCC3Freq, 0);
  objc_storeStrong((id *)&self->_SCC2Bw, 0);
  objc_storeStrong((id *)&self->_SCC2Freq, 0);
  objc_storeStrong((id *)&self->_SCC1Bw, 0);
  objc_storeStrong((id *)&self->_SCC1Freq, 0);
  objc_storeStrong((id *)&self->_PCCBw, 0);
  objc_storeStrong((id *)&self->_PCCFreq, 0);
  objc_storeStrong((id *)&self->_dupMode, 0);
  objc_storeStrong((id *)&self->_logDuration, 0);
  objc_storeStrong((id *)&self->_dlTBSzCnt, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
