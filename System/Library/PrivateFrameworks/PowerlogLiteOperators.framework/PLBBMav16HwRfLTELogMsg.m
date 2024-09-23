@implementation PLBBMav16HwRfLTELogMsg

- (PLBBMav16HwRfLTELogMsg)init
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  PLBBMav16HwRfLTELogMsg *v10;
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
    block[2] = __30__PLBBMav16HwRfLTELogMsg_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1ED8830B0 != -1)
      dispatch_once(&qword_1ED8830B0, block);
    if (_MergedGlobals_1_27)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav16HwRfLTELogMsg init]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwRfLTELogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwRfLTELogMsg init]");
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
  v16.super_class = (Class)PLBBMav16HwRfLTELogMsg;
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

uint64_t __30__PLBBMav16HwRfLTELogMsg_init__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_27 = result;
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
    block[2] = __62__PLBBMav16HwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (qword_1ED8830B8 != -1)
      dispatch_once(&qword_1ED8830B8, block);
    if (byte_1ED8830A1)
    {
      v12 = v10;
      v13 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav16HwRfLTELogMsg sendAndLogPLEntry:withName:withType:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwRfLTELogMsg.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwRfLTELogMsg sendAndLogPLEntry:withName:withType:]");
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
    v47[2] = __62__PLBBMav16HwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_251;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v20;
    if (qword_1ED8830C0 != -1)
      dispatch_once(&qword_1ED8830C0, v47);
    if (byte_1ED8830A2)
    {
      v21 = v10;
      v44 = v10;
      v22 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sending PLEntry: name=%@ type=%@"), v9, v44);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwRfLTELogMsg.m");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwRfLTELogMsg sendAndLogPLEntry:withName:withType:]");
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
    v46[2] = __62__PLBBMav16HwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_256;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v33;
    if (qword_1ED8830C8 != -1)
      dispatch_once(&qword_1ED8830C8, v46);
    if (byte_1ED8830A3)
    {
      v45 = v10;
      v34 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad agent"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwRfLTELogMsg.m");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "lastPathComponent");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwRfLTELogMsg sendAndLogPLEntry:withName:withType:]");
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

uint64_t __62__PLBBMav16HwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8830A1 = result;
  return result;
}

uint64_t __62__PLBBMav16HwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_251(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8830A2 = result;
  return result;
}

uint64_t __62__PLBBMav16HwRfLTELogMsg_sendAndLogPLEntry_withName_withType___block_invoke_256(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8830A3 = result;
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
    block[2] = __65__PLBBMav16HwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1ED8830D0 != -1)
      dispatch_once(&qword_1ED8830D0, block);
    if (byte_1ED8830A4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav16HwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwRfLTELogMsg.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
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
    v25[2] = __65__PLBBMav16HwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_261;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v19;
    if (qword_1ED8830D8 != -1)
      dispatch_once(&qword_1ED8830D8, v25);
    if (byte_1ED8830A5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to set seqNum, date, timeCal"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwRfLTELogMsg.m");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwRfLTELogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
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

uint64_t __65__PLBBMav16HwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8830A4 = result;
  return result;
}

uint64_t __65__PLBBMav16HwRfLTELogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_261(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8830A5 = result;
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
    block[2] = __52__PLBBMav16HwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1ED8830E0 != -1)
      dispatch_once(&qword_1ED8830E0, block);
    if (byte_1ED8830A6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav16HwRfLTELogMsg addPairWithKey:andWithVal:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwRfLTELogMsg.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwRfLTELogMsg addPairWithKey:andWithVal:]");
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
      v30[2] = __52__PLBBMav16HwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_272;
      v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v30[4] = v16;
      if (qword_1ED8830F0 != -1)
        dispatch_once(&qword_1ED8830F0, v30);
      if (byte_1ED8830A8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Add KVPair [%@,%@]"), v6, v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwRfLTELogMsg.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwRfLTELogMsg addPairWithKey:andWithVal:]");
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
    -[PLBBMav16HwRfLTELogMsg kvPairs](self, "kvPairs");
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
    v31[2] = __52__PLBBMav16HwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_267;
    v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v31[4] = v24;
    if (qword_1ED8830E8 != -1)
      dispatch_once(&qword_1ED8830E8, v31);
    if (byte_1ED8830A7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: nil key for kvPair not expected, return"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwRfLTELogMsg.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwRfLTELogMsg addPairWithKey:andWithVal:]");
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

uint64_t __52__PLBBMav16HwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8830A6 = result;
  return result;
}

uint64_t __52__PLBBMav16HwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_267(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8830A7 = result;
  return result;
}

uint64_t __52__PLBBMav16HwRfLTELogMsg_addPairWithKey_andWithVal___block_invoke_272(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8830A8 = result;
  return result;
}

+ (id)entryEventBackwardDefinitionBBMav16HwRfLTE
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
  _QWORD v67[3];
  _QWORD v68[3];
  _QWORD v69[3];
  _QWORD v70[3];
  _QWORD v71[3];
  _QWORD v72[3];
  _QWORD v73[3];
  _QWORD v74[3];
  _QWORD v75[3];
  _QWORD v76[3];
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[3];
  _QWORD v83[3];
  _QWORD v84[3];
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
  _QWORD v109[2];
  uint64_t v110;
  _QWORD v111[3];
  _QWORD v112[39];
  _QWORD v113[39];
  _QWORD v114[4];
  _QWORD v115[4];
  _QWORD v116[2];
  _QWORD v117[4];

  v117[2] = *MEMORY[0x1E0C80C00];
  v116[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v114[0] = *MEMORY[0x1E0D80318];
  v114[1] = v2;
  v115[0] = &unk_1E8652DC0;
  v115[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v114[2] = *MEMORY[0x1E0D802F8];
  v114[3] = v3;
  v115[2] = CFSTR("refreshMav16BBRfLTE");
  v115[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v115, v114, 4);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v117[0] = v66;
  v116[1] = *MEMORY[0x1E0D802F0];
  v112[0] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "commonTypeDict_IntegerFormat");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v113[0] = v64;
  v112[1] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "commonTypeDict_DateFormat");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v113[1] = v62;
  v112[2] = CFSTR("LogDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "commonTypeDict_RealFormat");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v113[2] = v60;
  v112[3] = CFSTR("DupMode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v113[3] = v58;
  v112[4] = CFSTR("PCC_Band");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "commonTypeDict_IntegerFormat");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v113[4] = v56;
  v112[5] = CFSTR("PCC_BW");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "commonTypeDict_IntegerFormat");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v113[5] = v54;
  v112[6] = CFSTR("SCC1_Band");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v113[6] = v52;
  v112[7] = CFSTR("SCC1_BW");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v113[7] = v50;
  v112[8] = CFSTR("SCC2_Band");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "commonTypeDict_IntegerFormat");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v113[8] = v48;
  v112[9] = CFSTR("SCC2_BW");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v113[9] = v46;
  v112[10] = CFSTR("DLTBSzArr");
  v5 = *MEMORY[0x1E0D80348];
  v109[0] = *MEMORY[0x1E0D80358];
  v4 = v109[0];
  v109[1] = v5;
  v111[0] = &unk_1E8633138;
  v111[1] = &unk_1E8633150;
  v110 = *MEMORY[0x1E0D80350];
  v6 = v110;
  v111[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v111, v109, 3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v113[10] = v45;
  v112[11] = CFSTR("TxPwrBktArr");
  v107[0] = v4;
  v107[1] = v5;
  v108[0] = &unk_1E8633138;
  v108[1] = &unk_1E8633180;
  v107[2] = v6;
  v108[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v113[11] = v44;
  v112[12] = CFSTR("CASCCStateArr");
  v105[0] = v4;
  v105[1] = v5;
  v106[0] = &unk_1E8633138;
  v106[1] = &unk_1E8633198;
  v105[2] = v6;
  v106[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v113[12] = v43;
  v112[13] = CFSTR("ULCACStateArr");
  v103[0] = v4;
  v103[1] = v5;
  v104[0] = &unk_1E8633138;
  v104[1] = &unk_1E86331B0;
  v103[2] = v6;
  v104[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v113[13] = v42;
  v112[14] = CFSTR("kRfActRxTxArr");
  v101[0] = v4;
  v101[1] = v5;
  v102[0] = &unk_1E8633138;
  v102[1] = &unk_1E8633198;
  v101[2] = v6;
  v102[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v113[14] = v41;
  v112[15] = CFSTR("SleepStateIdleArr");
  v99[0] = v4;
  v99[1] = v5;
  v100[0] = &unk_1E8633138;
  v100[1] = &unk_1E86331C8;
  v99[2] = v6;
  v100[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v99, 3);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v113[15] = v40;
  v112[16] = CFSTR("SleepStateConnArr");
  v97[0] = v4;
  v97[1] = v5;
  v98[0] = &unk_1E8633138;
  v98[1] = &unk_1E86331C8;
  v97[2] = v6;
  v98[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v113[16] = v39;
  v112[17] = CFSTR("RfRSRPIdleArr");
  v95[0] = v4;
  v95[1] = v5;
  v96[0] = &unk_1E8633138;
  v96[1] = &unk_1E8633198;
  v95[2] = v6;
  v96[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v113[17] = v38;
  v112[18] = CFSTR("RfRSRPConnArr");
  v93[0] = v4;
  v93[1] = v5;
  v94[0] = &unk_1E8633138;
  v94[1] = &unk_1E8633198;
  v93[2] = v6;
  v94[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v113[18] = v37;
  v112[19] = CFSTR("RfSINRIdleArr");
  v91[0] = v4;
  v91[1] = v5;
  v92[0] = &unk_1E8633138;
  v92[1] = &unk_1E8633198;
  v91[2] = v6;
  v92[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 3);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v113[19] = v36;
  v112[20] = CFSTR("RfSINRConnArr");
  v89[0] = v4;
  v89[1] = v5;
  v90[0] = &unk_1E8633138;
  v90[1] = &unk_1E8633198;
  v89[2] = v6;
  v90[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v113[20] = v35;
  v112[21] = CFSTR("RfNLICArr");
  v87[0] = v4;
  v87[1] = v5;
  v88[0] = &unk_1E8633138;
  v88[1] = &unk_1E86331B0;
  v87[2] = v6;
  v88[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v113[21] = v34;
  v112[22] = CFSTR("RfBPEArr");
  v85[0] = v4;
  v85[1] = v5;
  v86[0] = &unk_1E8633138;
  v86[1] = &unk_1E86331E0;
  v85[2] = v6;
  v86[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v113[22] = v33;
  v112[23] = CFSTR("ARD_RxD_Off_Duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_IntegerFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v113[23] = v31;
  v112[24] = CFSTR("uSleep_PCC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v113[24] = v29;
  v112[25] = CFSTR("uSleep_SCC1");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v113[25] = v27;
  v112[26] = CFSTR("uSleep_SCC2");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v113[26] = v25;
  v112[27] = CFSTR("HSIC_PCC_OffOn");
  v83[0] = v4;
  v83[1] = v5;
  v84[0] = &unk_1E8633138;
  v84[1] = &unk_1E86331F8;
  v83[2] = v6;
  v84[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v113[27] = v24;
  v112[28] = CFSTR("HSIC_SCC1_OffOn");
  v81[0] = v4;
  v81[1] = v5;
  v82[0] = &unk_1E8633138;
  v82[1] = &unk_1E86331F8;
  v81[2] = v6;
  v82[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v113[28] = v23;
  v112[29] = CFSTR("HSIC_SCC2_OffOn");
  v79[0] = v4;
  v79[1] = v5;
  v80[0] = &unk_1E8633138;
  v80[1] = &unk_1E86331F8;
  v79[2] = v6;
  v80[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v113[29] = v22;
  v112[30] = CFSTR("PCC_ARX_Off");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v113[30] = v20;
  v112[31] = CFSTR("SCC1_ARX_Off");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v113[31] = v18;
  v112[32] = CFSTR("SCC2_ARX_Off");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v113[32] = v16;
  v112[33] = CFSTR("PCC_ARX_Baseline");
  v77[0] = v4;
  v77[1] = v5;
  v78[0] = &unk_1E8633138;
  v78[1] = &unk_1E86331B0;
  v77[2] = v6;
  v78[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v113[33] = v15;
  v112[34] = CFSTR("SCC1_ARX_Baseline");
  v75[0] = v4;
  v75[1] = v5;
  v76[0] = &unk_1E8633138;
  v76[1] = &unk_1E86331B0;
  v75[2] = v6;
  v76[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v113[34] = v14;
  v112[35] = CFSTR("SCC2_ARX_Baseline");
  v73[0] = v4;
  v73[1] = v5;
  v74[0] = &unk_1E8633138;
  v74[1] = &unk_1E86331B0;
  v73[2] = v6;
  v74[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v113[35] = v7;
  v112[36] = CFSTR("PCC_ARX_QICE");
  v71[0] = v4;
  v71[1] = v5;
  v72[0] = &unk_1E8633138;
  v72[1] = &unk_1E86331B0;
  v71[2] = v6;
  v72[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v113[36] = v8;
  v112[37] = CFSTR("SCC1_ARX_QICE");
  v69[0] = v4;
  v69[1] = v5;
  v70[0] = &unk_1E8633138;
  v70[1] = &unk_1E86331B0;
  v69[2] = v6;
  v70[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v113[37] = v9;
  v112[38] = CFSTR("SCC2_ARX_QICE");
  v67[0] = v4;
  v67[1] = v5;
  v68[0] = &unk_1E8633138;
  v68[1] = &unk_1E86331B0;
  v67[2] = v6;
  v68[2] = &unk_1E8633168;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v113[38] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v113, v112, 39);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v117[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v117, v116, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)refreshMav16BBRfLTE
{
  objc_autoreleasePoolPop((void *)MEMORY[0x1D179C2E0](self, a2));
}

- (id)logEventBackwardBBMav16HwRfLTE
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
    v16 = __56__PLBBMav16HwRfLTELogMsg_logEventBackwardBBMav16HwRfLTE__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v3;
    if (qword_1ED8830F8 != -1)
      dispatch_once(&qword_1ED8830F8, &block);
    if (byte_1ED8830A9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMav16HwRfLTELogMsg logEventBackwardBBMav16HwRfLTE]", block, v15, v16, v17, v18);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMav16HwRfLTELogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMav16HwRfLTELogMsg logEventBackwardBBMav16HwRfLTE]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 265);

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
  -[PLBBMav16HwRfLTELogMsg populateMav16Entry:](self, "populateMav16Entry:", v11);
  v19[0] = CFSTR("entry");
  v19[1] = CFSTR("entryKey");
  v20[0] = v11;
  v20[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __56__PLBBMav16HwRfLTELogMsg_logEventBackwardBBMav16HwRfLTE__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8830A9 = result;
  return result;
}

- (void)populateMav16Entry:(id)a3
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
  id v47;

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

  -[PLBBMav16HwRfLTELogMsg logDuration](self, "logDuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("LogDuration"));

  -[PLBBMav16HwRfLTELogMsg dupMode](self, "dupMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("DupMode"));

  -[PLBBMav16HwRfLTELogMsg PCCFreq](self, "PCCFreq");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("PCC_Band"));

  -[PLBBMav16HwRfLTELogMsg PCCBw](self, "PCCBw");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("PCC_BW"));

  -[PLBBMav16HwRfLTELogMsg SCC1Freq](self, "SCC1Freq");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("SCC1_Band"));

  -[PLBBMav16HwRfLTELogMsg SCC1Bw](self, "SCC1Bw");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("SCC1_BW"));

  -[PLBBMav16HwRfLTELogMsg SCC2Freq](self, "SCC2Freq");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("SCC2_Band"));

  -[PLBBMav16HwRfLTELogMsg SCC2Bw](self, "SCC2Bw");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("SCC2_BW"));

  -[PLBBMav16HwRfLTELogMsg dlTBSzCnt](self, "dlTBSzCnt");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("DLTBSzArr"));

  -[PLBBMav16HwRfLTELogMsg txPwrCnt](self, "txPwrCnt");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("TxPwrBktArr"));

  -[PLBBMav16HwRfLTELogMsg caSCCCnt](self, "caSCCCnt");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("CASCCStateArr"));

  -[PLBBMav16HwRfLTELogMsg ulCaSCCCnt](self, "ulCaSCCCnt");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("ULCACStateArr"));

  -[PLBBMav16HwRfLTELogMsg actRxTxCnt](self, "actRxTxCnt");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("kRfActRxTxArr"));

  -[PLBBMav16HwRfLTELogMsg sleepStateIdleCnt](self, "sleepStateIdleCnt");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("SleepStateIdleArr"));

  -[PLBBMav16HwRfLTELogMsg sleepStateConnCnt](self, "sleepStateConnCnt");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("SleepStateConnArr"));

  -[PLBBMav16HwRfLTELogMsg rsrpIdleCnt](self, "rsrpIdleCnt");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("RfRSRPIdleArr"));

  -[PLBBMav16HwRfLTELogMsg rsrpConnCnt](self, "rsrpConnCnt");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("RfRSRPConnArr"));

  -[PLBBMav16HwRfLTELogMsg sinrIdleCnt](self, "sinrIdleCnt");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("RfSINRIdleArr"));

  -[PLBBMav16HwRfLTELogMsg sinrConnCnt](self, "sinrConnCnt");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("RfSINRConnArr"));

  -[PLBBMav16HwRfLTELogMsg arxStateCnt](self, "arxStateCnt");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("RfARXArr"));

  -[PLBBMav16HwRfLTELogMsg nlicStateCnt](self, "nlicStateCnt");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, CFSTR("RfNLICArr"));

  -[PLBBMav16HwRfLTELogMsg bpeStats](self, "bpeStats");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, CFSTR("RfBPEArr"));

  -[PLBBMav16HwRfLTELogMsg ardRxDOff](self, "ardRxDOff");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("ARD_RxD_Off_Duration"));

  -[PLBBMav16HwRfLTELogMsg uSleepPCCCnt](self, "uSleepPCCCnt");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("uSleep_PCC"));

  -[PLBBMav16HwRfLTELogMsg uSleepSCC1Cnt](self, "uSleepSCC1Cnt");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, CFSTR("uSleep_SCC1"));

  -[PLBBMav16HwRfLTELogMsg uSleepSCC2Cnt](self, "uSleepSCC2Cnt");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, CFSTR("uSleep_SCC2"));

  -[PLBBMav16HwRfLTELogMsg hsicPCC](self, "hsicPCC");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, CFSTR("HSIC_PCC_OffOn"));

  -[PLBBMav16HwRfLTELogMsg hsicSCC1](self, "hsicSCC1");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, CFSTR("HSIC_SCC1_OffOn"));

  -[PLBBMav16HwRfLTELogMsg hsicSCC2](self, "hsicSCC2");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v38, CFSTR("HSIC_SCC2_OffOn"));

  -[PLBBMav16HwRfLTELogMsg arxOffPCC](self, "arxOffPCC");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v39, CFSTR("PCC_ARX_Off"));

  -[PLBBMav16HwRfLTELogMsg arxOffSCC1](self, "arxOffSCC1");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v40, CFSTR("SCC1_ARX_Off"));

  -[PLBBMav16HwRfLTELogMsg arxOffSCC2](self, "arxOffSCC2");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v41, CFSTR("SCC2_ARX_Off"));

  -[PLBBMav16HwRfLTELogMsg arxBaselinePCC](self, "arxBaselinePCC");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v42, CFSTR("PCC_ARX_Baseline"));

  -[PLBBMav16HwRfLTELogMsg arxBaselineSCC1](self, "arxBaselineSCC1");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v43, CFSTR("SCC1_ARX_Baseline"));

  -[PLBBMav16HwRfLTELogMsg arxBaselineSCC2](self, "arxBaselineSCC2");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v44, CFSTR("SCC2_ARX_Baseline"));

  -[PLBBMav16HwRfLTELogMsg arxQicePCC](self, "arxQicePCC");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v45, CFSTR("PCC_ARX_QICE"));

  -[PLBBMav16HwRfLTELogMsg arxQiceSCC1](self, "arxQiceSCC1");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v46, CFSTR("SCC1_ARX_QICE"));

  -[PLBBMav16HwRfLTELogMsg arxQiceSCC2](self, "arxQiceSCC2");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v47, CFSTR("SCC2_ARX_QICE"));

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

- (NSArray)txPwrCnt
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setTxPwrCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSArray)caSCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setCaSCCCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSArray)ulCaSCCCnt
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setUlCaSCCCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSArray)actRxTxCnt
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setActRxTxCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSArray)sleepStateIdleCnt
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setSleepStateIdleCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSArray)sleepStateConnCnt
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setSleepStateConnCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSArray)rsrpIdleCnt
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setRsrpIdleCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSArray)rsrpConnCnt
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setRsrpConnCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSArray)sinrIdleCnt
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSinrIdleCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSArray)sinrConnCnt
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setSinrConnCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSArray)arxStateCnt
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setArxStateCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSArray)nlicStateCnt
{
  return (NSArray *)objc_getProperty(self, a2, 248, 1);
}

- (void)setNlicStateCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSArray)bpeStats
{
  return (NSArray *)objc_getProperty(self, a2, 256, 1);
}

- (void)setBpeStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSNumber)ardRxDOff
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setArdRxDOff:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (NSNumber)uSleepPCCCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 272, 1);
}

- (void)setUSleepPCCCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSNumber)uSleepSCC1Cnt
{
  return (NSNumber *)objc_getProperty(self, a2, 280, 1);
}

- (void)setUSleepSCC1Cnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSNumber)uSleepSCC2Cnt
{
  return (NSNumber *)objc_getProperty(self, a2, 288, 1);
}

- (void)setUSleepSCC2Cnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (NSArray)hsicPCC
{
  return (NSArray *)objc_getProperty(self, a2, 296, 1);
}

- (void)setHsicPCC:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (NSArray)hsicSCC1
{
  return (NSArray *)objc_getProperty(self, a2, 304, 1);
}

- (void)setHsicSCC1:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (NSArray)hsicSCC2
{
  return (NSArray *)objc_getProperty(self, a2, 312, 1);
}

- (void)setHsicSCC2:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (NSNumber)arxOffPCC
{
  return (NSNumber *)objc_getProperty(self, a2, 320, 1);
}

- (void)setArxOffPCC:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSNumber)arxOffSCC1
{
  return (NSNumber *)objc_getProperty(self, a2, 328, 1);
}

- (void)setArxOffSCC1:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (NSNumber)arxOffSCC2
{
  return (NSNumber *)objc_getProperty(self, a2, 336, 1);
}

- (void)setArxOffSCC2:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (NSArray)arxBaselinePCC
{
  return (NSArray *)objc_getProperty(self, a2, 344, 1);
}

- (void)setArxBaselinePCC:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (NSArray)arxBaselineSCC1
{
  return (NSArray *)objc_getProperty(self, a2, 352, 1);
}

- (void)setArxBaselineSCC1:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (NSArray)arxBaselineSCC2
{
  return (NSArray *)objc_getProperty(self, a2, 360, 1);
}

- (void)setArxBaselineSCC2:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (NSArray)arxQicePCC
{
  return (NSArray *)objc_getProperty(self, a2, 368, 1);
}

- (void)setArxQicePCC:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (NSArray)arxQiceSCC1
{
  return (NSArray *)objc_getProperty(self, a2, 376, 1);
}

- (void)setArxQiceSCC1:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (NSArray)arxQiceSCC2
{
  return (NSArray *)objc_getProperty(self, a2, 384, 1);
}

- (void)setArxQiceSCC2:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (NSString)groupEntryKey
{
  return (NSString *)objc_getProperty(self, a2, 392, 1);
}

- (void)setGroupEntryKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 400, 1);
}

- (void)setGroupID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (NSMutableArray)groupArrEntries
{
  return (NSMutableArray *)objc_getProperty(self, a2, 408, 1);
}

- (void)setGroupArrEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
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
  objc_storeStrong((id *)&self->_arxQiceSCC2, 0);
  objc_storeStrong((id *)&self->_arxQiceSCC1, 0);
  objc_storeStrong((id *)&self->_arxQicePCC, 0);
  objc_storeStrong((id *)&self->_arxBaselineSCC2, 0);
  objc_storeStrong((id *)&self->_arxBaselineSCC1, 0);
  objc_storeStrong((id *)&self->_arxBaselinePCC, 0);
  objc_storeStrong((id *)&self->_arxOffSCC2, 0);
  objc_storeStrong((id *)&self->_arxOffSCC1, 0);
  objc_storeStrong((id *)&self->_arxOffPCC, 0);
  objc_storeStrong((id *)&self->_hsicSCC2, 0);
  objc_storeStrong((id *)&self->_hsicSCC1, 0);
  objc_storeStrong((id *)&self->_hsicPCC, 0);
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
