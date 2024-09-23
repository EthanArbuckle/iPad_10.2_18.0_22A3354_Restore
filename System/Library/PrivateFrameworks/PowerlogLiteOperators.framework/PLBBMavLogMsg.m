@implementation PLBBMavLogMsg

- (PLBBMavLogMsg)init
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  PLBBMavLogMsg *v10;
  uint64_t v11;
  NSMutableDictionary *commonInfo;
  uint64_t v13;
  NSMutableDictionary *kvPairs;
  uint64_t v15;
  NSMutableArray *groupArrEntries;
  uint64_t v17;
  NSMutableDictionary *groupDict;
  objc_super v20;
  _QWORD block[5];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __21__PLBBMavLogMsg_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1ED885580 != -1)
      dispatch_once(&qword_1ED885580, block);
    if (_MergedGlobals_1_62)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg init]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg init]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 46);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v20.receiver = self;
  v20.super_class = (Class)PLBBMavLogMsg;
  v10 = -[PLBBMavLogMsg init](&v20, sel_init);
  if (v10)
  {
    v11 = objc_opt_new();
    commonInfo = v10->_commonInfo;
    v10->_commonInfo = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    kvPairs = v10->_kvPairs;
    v10->_kvPairs = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    groupArrEntries = v10->_groupArrEntries;
    v10->_groupArrEntries = (NSMutableArray *)v15;

    v17 = objc_opt_new();
    groupDict = v10->_groupDict;
    v10->_groupDict = (NSMutableDictionary *)v17;

  }
  return v10;
}

uint64_t __21__PLBBMavLogMsg_init__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_62 = result;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v11 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__PLBBMavLogMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (qword_1ED885588 != -1)
      dispatch_once(&qword_1ED885588, block);
    if (byte_1ED885549)
    {
      v12 = v10;
      v13 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg sendAndLogPLEntry:withName:withType:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg sendAndLogPLEntry:withName:withType:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 66);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v14;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v9 = v13;
      v10 = v12;
    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v20 = objc_opt_class();
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __53__PLBBMavLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_252;
    v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v53[4] = v20;
    if (qword_1ED885590 != -1)
      dispatch_once(&qword_1ED885590, v53);
    if (byte_1ED88554A)
    {
      v21 = v10;
      v50 = v10;
      v22 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sending PLEntry: name=%@ type=%@"), v9, v50);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg sendAndLogPLEntry:withName:withType:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 67);

      PLLogCommon();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v23;
        _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v9 = v22;
      v10 = v21;
    }
  }
  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKey:", CFSTR("SeqNum"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v30, CFSTR("SeqNum"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKey:", CFSTR("BBDate"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v32, CFSTR("BBDate"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKey:", CFSTR("TimeCal"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v34, CFSTR("TimeCal"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKey:", CFSTR("Error"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v36, CFSTR("Error"));

  -[PLBasebandMessage agent](self, "agent");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v37 && objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v38 = objc_opt_class();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __53__PLBBMavLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_259;
    v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v52[4] = v38;
    if (qword_1ED885598 != -1)
      dispatch_once(&qword_1ED885598, v52);
    if (byte_1ED88554B)
    {
      v51 = v10;
      v39 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad agent"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "lastPathComponent");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg sendAndLogPLEntry:withName:withType:]");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "logMessage:fromFile:fromFunction:fromLineNumber:", v40, v43, v44, 75);

      PLLogCommon();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v40;
        _os_log_debug_impl(&dword_1CAF47000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v9 = v39;
      v10 = v51;
    }
  }
  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "objectForKey:", CFSTR("BBDate"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "convertFromBasebandToMonotonic");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEntryDate:", v48);

  -[PLBasebandMessage agent](self, "agent");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "logEntry:", v8);

}

uint64_t __53__PLBBMavLogMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885549 = result;
  return result;
}

uint64_t __53__PLBBMavLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_252(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88554A = result;
  return result;
}

uint64_t __53__PLBBMavLogMsg_sendAndLogPLEntry_withName_withType___block_invoke_259(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88554B = result;
  return result;
}

- (void)setHeaderWithSeqNum:(id)a3 andDate:(id)a4 andTimeCal:(double)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSMutableDictionary *commonInfo;
  void *v27;
  _QWORD v28[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)MEMORY[0x1E0D7FFA0];
  v10 = a4;
  if (objc_msgSend(v9, "debugEnabled"))
  {
    v11 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__PLBBMavLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (qword_1ED8855A0 != -1)
      dispatch_once(&qword_1ED8855A0, block);
    if (byte_1ED88554C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 86);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v12;
        _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v18 = v8;
  if (!v8)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v19 = objc_opt_class();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __56__PLBBMavLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_264;
      v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v28[4] = v19;
      if (qword_1ED8855A8 != -1)
        dispatch_once(&qword_1ED8855A8, v28);
      if (byte_1ED88554D)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to set seqNum(%@)"), 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lastPathComponent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 88);

        PLLogCommon();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v20;
          _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v18 = &unk_1E8634ED8;
  }
  -[NSMutableDictionary setObject:forKey:](self->_commonInfo, "setObject:forKey:", v18, CFSTR("SeqNum"));
  -[NSMutableDictionary setObject:forKey:](self->_commonInfo, "setObject:forKey:", v10, CFSTR("BBDate"));

  commonInfo = self->_commonInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](commonInfo, "setValue:forKey:", v27, CFSTR("TimeCal"));

  -[PLBBMavLogMsg setGroupID:](self, "setGroupID:", CFSTR("MavLogMsg"));
}

uint64_t __56__PLBBMavLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88554C = result;
  return result;
}

uint64_t __56__PLBBMavLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_264(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88554D = result;
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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  uint64_t v27;
  _QWORD block[5];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PLBBMavLogMsg_addPairWithKey_andWithVal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1ED8855B0 != -1)
      dispatch_once(&qword_1ED8855B0, block);
    if (byte_1ED88554E)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg addPairWithKey:andWithVal:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg addPairWithKey:andWithVal:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 107);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v9;
        _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (v6)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v15 = objc_opt_class();
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __43__PLBBMavLogMsg_addPairWithKey_andWithVal___block_invoke_273;
      v26 = &__block_descriptor_40_e5_v8__0lu32l8;
      v27 = v15;
      if (qword_1ED8855B8 != -1)
        dispatch_once(&qword_1ED8855B8, &v23);
      if (byte_1ED88554F)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Add KVPair [%@,%@]"), v6, v7, v23, v24, v25, v26, v27);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg addPairWithKey:andWithVal:]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 109);

        PLLogCommon();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v16;
          _os_log_debug_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLBBMavLogMsg kvPairs](self, "kvPairs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v7, v6);

  }
}

uint64_t __43__PLBBMavLogMsg_addPairWithKey_andWithVal___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88554E = result;
  return result;
}

uint64_t __43__PLBBMavLogMsg_addPairWithKey_andWithVal___block_invoke_273(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88554F = result;
  return result;
}

- (void)setTxPwr:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __26__PLBBMavLogMsg_setTxPwr___block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v5;
    if (qword_1ED8855C0 != -1)
      dispatch_once(&qword_1ED8855C0, &block);
    if (byte_1ED885550)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg setTxPwr:]", block, v13, v14, v15, v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg setTxPwr:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 116);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[NSMutableDictionary setObject:forKey:](self->_commonInfo, "setObject:forKey:", v4, CFSTR("TxPwr"));

}

uint64_t __26__PLBBMavLogMsg_setTxPwr___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885550 = result;
  return result;
}

- (void)setTxPwrArray:(id)a3
{
  -[NSMutableDictionary setObject:forKey:](self->_commonInfo, "setObject:forKey:", a3, CFSTR("TxPwrArr"));
}

- (void)setDate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __25__PLBBMavLogMsg_setDate___block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v5;
    if (qword_1ED8855C8 != -1)
      dispatch_once(&qword_1ED8855C8, &block);
    if (byte_1ED885551)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg setDate:]", block, v13, v14, v15, v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg setDate:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 137);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[NSMutableDictionary setObject:forKey:](self->_commonInfo, "setObject:forKey:", v4, CFSTR("BBDate"));

}

uint64_t __25__PLBBMavLogMsg_setDate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885551 = result;
  return result;
}

- (void)setError:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __26__PLBBMavLogMsg_setError___block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v5;
    if (qword_1ED8855D0 != -1)
      dispatch_once(&qword_1ED8855D0, &block);
    if (byte_1ED885552)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg setError:]", block, v13, v14, v15, v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg setError:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 143);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[NSMutableDictionary setObject:forKey:](self->_commonInfo, "setObject:forKey:", v4, CFSTR("Error"));

}

uint64_t __26__PLBBMavLogMsg_setError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885552 = result;
  return result;
}

- (void)appendToError:(id)a3
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
  NSMutableDictionary *commonInfo;
  id v15;
  uint64_t block;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __31__PLBBMavLogMsg_appendToError___block_invoke;
    v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    v20 = v5;
    if (qword_1ED8855D8 != -1)
      dispatch_once(&qword_1ED8855D8, &block);
    if (byte_1ED885553)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg appendToError:]", block, v17, v18, v19, v20);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg appendToError:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 148);

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
  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Error"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (v13)
  {
    objc_msgSend(v13, "appendString:", v4);
    commonInfo = self->_commonInfo;
    v15 = v13;
  }
  else
  {
    commonInfo = self->_commonInfo;
    v15 = v4;
  }
  -[NSMutableDictionary setObject:forKey:](commonInfo, "setObject:forKey:", v15, CFSTR("Error"));

}

uint64_t __31__PLBBMavLogMsg_appendToError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885553 = result;
  return result;
}

- (void)setLogDuration:(id)a3
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
  double v14;
  void *v15;
  void *v16;
  float v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__PLBBMavLogMsg_setLogDuration___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED8855E0 != -1)
      dispatch_once(&qword_1ED8855E0, block);
    if (byte_1ED885554)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg setLogDuration:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg setLogDuration:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 163);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v6 = MEMORY[0x1E0C809B0];
    }
  }
  v13 = (void *)MEMORY[0x1E0CB37E8];
  *(float *)&v14 = (float)(int)objc_msgSend(v4, "intValue") * 0.000030518;
  objc_msgSend(v13, "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v24[0] = v6;
    v24[1] = 3221225472;
    v24[2] = __32__PLBBMavLogMsg_setLogDuration___block_invoke_280;
    v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v24[4] = objc_opt_class();
    if (qword_1ED8855E8 != -1)
      dispatch_once(&qword_1ED8855E8, v24);
    if (byte_1ED885555)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v15, "floatValue");
      objc_msgSend(v16, "stringWithFormat:", CFSTR("Hw log duration inserted as %f"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg setLogDuration:]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 165);

      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v18;
        _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[NSMutableDictionary setObject:forKey:](self->_commonInfo, "setObject:forKey:", v15, CFSTR("LogDuration"));

}

uint64_t __32__PLBBMavLogMsg_setLogDuration___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885554 = result;
  return result;
}

uint64_t __32__PLBBMavLogMsg_setLogDuration___block_invoke_280(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885555 = result;
  return result;
}

- (void)setRat:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __24__PLBBMavLogMsg_setRat___block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v5;
    if (qword_1ED8855F0 != -1)
      dispatch_once(&qword_1ED8855F0, &block);
    if (byte_1ED885556)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg setRat:]", block, v13, v14, v15, v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg setRat:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 170);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[NSMutableDictionary setObject:forKey:](self->_commonInfo, "setObject:forKey:", v4, CFSTR("Rat"));

}

uint64_t __24__PLBBMavLogMsg_setRat___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885556 = result;
  return result;
}

- (void)refreshMavBBHwOther
{
  void *v3;
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
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D179C2E0](self, a2);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __36__PLBBMavLogMsg_refreshMavBBHwOther__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v4;
    if (qword_1ED8855F8 != -1)
      dispatch_once(&qword_1ED8855F8, &block);
    if (byte_1ED885557)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg refreshMavBBHwOther]", block, v15, v16, v17, v18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg refreshMavBBHwOther]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 179);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MavBBHwOther"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
  objc_msgSend(v12, "setIsErrorEntry:", 1);
  -[PLBasebandMessage agent](self, "agent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logEntry:", v12);

  objc_autoreleasePoolPop(v3);
}

uint64_t __36__PLBBMavLogMsg_refreshMavBBHwOther__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885557 = result;
  return result;
}

+ (id)entryEventBackwardMavBBHwOther
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
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
  _QWORD v102[2];
  uint64_t v103;
  _QWORD v104[3];
  _QWORD v105[39];
  _QWORD v106[39];
  _QWORD v107[3];
  _QWORD v108[3];
  _QWORD v109[2];
  _QWORD v110[4];

  v110[2] = *MEMORY[0x1E0C80C00];
  v109[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v107[0] = *MEMORY[0x1E0D80318];
  v107[1] = v2;
  v108[0] = &unk_1E8653950;
  v108[1] = CFSTR("refreshRequestHandler");
  v107[2] = *MEMORY[0x1E0D80308];
  v108[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 3);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v71;
  v109[1] = *MEMORY[0x1E0D802F0];
  v105[0] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "commonTypeDict_BoolFormat");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v106[0] = v69;
  v105[1] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "commonTypeDict_IntegerFormat");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v106[1] = v67;
  v105[2] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "commonTypeDict_DateFormat");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v106[2] = v65;
  v105[3] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "commonTypeDict_IntegerFormat");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v106[3] = v63;
  v105[4] = CFSTR("SWRevision");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "commonTypeDict_IntegerFormat");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v106[4] = v61;
  v105[5] = CFSTR("HWRevision");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "commonTypeDict_IntegerFormat");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v106[5] = v59;
  v105[6] = CFSTR("HWStatsType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "commonTypeDict_IntegerFormat");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v106[6] = v57;
  v105[7] = CFSTR("HwStatsLength");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "commonTypeDict_IntegerFormat");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v106[7] = v55;
  v105[8] = CFSTR("HwStatsLevel");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "commonTypeDict_IntegerFormat");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v106[8] = v53;
  v105[9] = CFSTR("LastTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "commonTypeDict_IntegerFormat");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v106[9] = v51;
  v105[10] = CFSTR("CurrentTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v106[10] = v49;
  v105[11] = CFSTR("LogDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "commonTypeDict_IntegerFormat");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v106[11] = v47;
  v105[12] = CFSTR("RPMXOShutdownDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "commonTypeDict_IntegerFormat");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v106[12] = v45;
  v105[13] = CFSTR("RPMXOShutdownCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "commonTypeDict_IntegerFormat");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v106[13] = v43;
  v105[14] = CFSTR("RPMVDDMinDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "commonTypeDict_IntegerFormat");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v106[14] = v41;
  v105[15] = CFSTR("RPMVDDMinEnterCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "commonTypeDict_IntegerFormat");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v106[15] = v39;
  v105[16] = CFSTR("AppsPerfStateCountHistogram");
  v4 = *MEMORY[0x1E0D80348];
  v102[0] = *MEMORY[0x1E0D80358];
  v3 = v102[0];
  v102[1] = v4;
  v104[0] = &unk_1E8634EF0;
  v104[1] = &unk_1E8634F08;
  v103 = *MEMORY[0x1E0D80350];
  v5 = v103;
  v104[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v102, 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v106[16] = v38;
  v105[17] = CFSTR("CXOShutdownDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v106[17] = v36;
  v105[18] = CFSTR("CXOShutdownCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v106[18] = v34;
  v105[19] = CFSTR("USBStateCountHistogram");
  v100[0] = v3;
  v100[1] = v4;
  v101[0] = &unk_1E8634EF0;
  v101[1] = &unk_1E8634F38;
  v100[2] = v5;
  v101[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v106[19] = v33;
  v105[20] = CFSTR("UARTOnOffStateHistogram");
  v98[0] = v3;
  v98[1] = v4;
  v99[0] = &unk_1E8634EF0;
  v99[1] = &unk_1E8634F50;
  v98[2] = v5;
  v99[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v106[20] = v32;
  v105[21] = CFSTR("SPIOnOffStateHistogram");
  v96[0] = v3;
  v96[1] = v4;
  v97[0] = &unk_1E8634EF0;
  v97[1] = &unk_1E8634F50;
  v96[2] = v5;
  v97[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v96, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v106[21] = v31;
  v105[22] = CFSTR("ADMOnOffStateHistogram");
  v94[0] = v3;
  v94[1] = v4;
  v95[0] = &unk_1E8634EF0;
  v95[1] = &unk_1E8634F50;
  v94[2] = v5;
  v95[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v106[22] = v30;
  v105[23] = CFSTR("LPASSOnOffStateHistogram");
  v92[0] = v3;
  v92[1] = v4;
  v93[0] = &unk_1E8634EF0;
  v93[1] = &unk_1E8634F50;
  v92[2] = v5;
  v93[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v106[23] = v29;
  v105[24] = CFSTR("APPSSleepVetoState");
  v90[0] = v3;
  v90[1] = v4;
  v91[0] = &unk_1E8634EF0;
  v91[1] = &unk_1E8634F68;
  v90[2] = v5;
  v91[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v106[24] = v28;
  v105[25] = CFSTR("MPSSSleepVetoHistogram");
  v88[0] = v3;
  v88[1] = v4;
  v89[0] = &unk_1E8634EF0;
  v89[1] = &unk_1E8634F38;
  v88[2] = v5;
  v89[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v106[25] = v27;
  v105[26] = CFSTR("MDSPConfigCountHistogram");
  v86[0] = v3;
  v86[1] = v4;
  v87[0] = &unk_1E8634EF0;
  v87[1] = &unk_1E8634F80;
  v86[2] = v5;
  v87[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v106[26] = v26;
  v105[27] = CFSTR("QDSPConfigCountHistogram");
  v84[0] = v3;
  v84[1] = v4;
  v85[0] = &unk_1E8634EF0;
  v85[1] = &unk_1E8634F80;
  v84[2] = v5;
  v85[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v106[27] = v25;
  v105[28] = CFSTR("GPSOnOffStateHistogram");
  v82[0] = v3;
  v82[1] = v4;
  v83[0] = &unk_1E8634EF0;
  v83[1] = &unk_1E8634F50;
  v82[2] = v5;
  v83[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v106[28] = v24;
  v105[29] = CFSTR("GPSDPOOnOffStateHistogram");
  v80[0] = v3;
  v80[1] = v4;
  v81[0] = &unk_1E8634EF0;
  v81[1] = &unk_1E8634F50;
  v80[2] = v5;
  v81[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v106[29] = v23;
  v105[30] = CFSTR("GPSDPOBins");
  v78[0] = v3;
  v78[1] = v4;
  v79[0] = &unk_1E8634EF0;
  v79[1] = &unk_1E8634F08;
  v78[2] = v5;
  v79[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v106[30] = v22;
  v105[31] = CFSTR("MPSSCXOShutdownDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v106[31] = v20;
  v105[32] = CFSTR("MPSSCXOShutdownCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v106[32] = v18;
  v105[33] = CFSTR("MCPMVetoNumHistogram");
  v76[0] = v3;
  v76[1] = v4;
  v77[0] = &unk_1E8634EF0;
  v77[1] = &unk_1E8634F08;
  v76[2] = v5;
  v77[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v106[33] = v17;
  v105[34] = CFSTR("NPAVetoMask");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v106[34] = v15;
  v105[35] = CFSTR("NPAVetoClientNumHistogram");
  v74[0] = v3;
  v74[1] = v4;
  v75[0] = &unk_1E8634EF0;
  v75[1] = &unk_1E8634F98;
  v74[2] = v5;
  v75[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v106[35] = v6;
  v105[36] = CFSTR("AppsClockStateDurationStr");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v106[36] = v8;
  v105[37] = CFSTR("MpssClockStateDurationStr");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v106[37] = v10;
  v105[38] = CFSTR("HsicStateSleepVetoNum");
  v72[0] = v3;
  v72[1] = v4;
  v73[0] = &unk_1E8634EF0;
  v73[1] = &unk_1E8634FB0;
  v72[2] = v5;
  v73[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v106[38] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 39);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v110[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)logEventBackwardMavBBHwOther
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PLBBMavLogMsg_logEventBackwardMavBBHwOther__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED885600 != -1)
      dispatch_once(&qword_1ED885600, block);
    if (byte_1ED885558)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg logEventBackwardMavBBHwOther]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg logEventBackwardMavBBHwOther]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 290);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v4 = MEMORY[0x1E0C809B0];
    }
  }
  v11 = *MEMORY[0x1E0D80370];
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MavBBHwOther"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v12);
  -[PLBBMavLogMsg populateEntryBBMavHwOther:](self, "populateEntryBBMavHwOther:", v13);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v20[0] = v4;
    v20[1] = 3221225472;
    v20[2] = __45__PLBBMavLogMsg_logEventBackwardMavBBHwOther__block_invoke_350;
    v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v20[4] = objc_opt_class();
    if (qword_1ED885608 != -1)
      dispatch_once(&qword_1ED885608, v20);
    if (byte_1ED885559)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("About to send to log at %s"), "-[PLBBMavLogMsg logEventBackwardMavBBHwOther]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg logEventBackwardMavBBHwOther]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 296);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v14;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBMavLogMsg sendAndLogPLEntry:withName:withType:](self, "sendAndLogPLEntry:withName:withType:", v13, CFSTR("MavBBHwOther"), v11);

}

uint64_t __45__PLBBMavLogMsg_logEventBackwardMavBBHwOther__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885558 = result;
  return result;
}

uint64_t __45__PLBBMavLogMsg_logEventBackwardMavBBHwOther__block_invoke_350(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885559 = result;
  return result;
}

+ (id)getNameBBMavHwOther
{
  return CFSTR("BBMavHwOther");
}

- (void)logEventBackwardGrpEntriesBBMavHw
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__PLBBMavLogMsg_logEventBackwardGrpEntriesBBMavHw__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1ED885610 != -1)
      dispatch_once(&qword_1ED885610, block);
    if (byte_1ED88555A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg logEventBackwardGrpEntriesBBMavHw]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg logEventBackwardGrpEntriesBBMavHw]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 331);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBasebandMessage agent](self, "agent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 && objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v11 = objc_opt_class();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __50__PLBBMavLogMsg_logEventBackwardGrpEntriesBBMavHw__block_invoke_357;
    v21[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v21[4] = v11;
    if (qword_1ED885618 != -1)
      dispatch_once(&qword_1ED885618, v21);
    if (byte_1ED88555B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad agent"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg logEventBackwardGrpEntriesBBMavHw]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 333);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v12;
        _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBasebandMessage agent](self, "agent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMavLogMsg groupDict](self, "groupDict");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMavLogMsg groupEntryKey](self, "groupEntryKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "logEntries:withGroupID:", v19, v20);

}

uint64_t __50__PLBBMavLogMsg_logEventBackwardGrpEntriesBBMavHw__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88555A = result;
  return result;
}

uint64_t __50__PLBBMavLogMsg_logEventBackwardGrpEntriesBBMavHw__block_invoke_357(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88555B = result;
  return result;
}

- (void)addToGroupPLBBMavHwEntry:(id)a3 withEntryKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v6 = a3;
  -[PLBBMavLogMsg groupDict](self, "groupDict");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavLogMsg groupDict](self, "groupDict");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v13);

  }
  -[PLBBMavLogMsg groupDict](self, "groupDict");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v6);

}

- (void)addToGroupPLBBMavHwOther
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
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __41__PLBBMavLogMsg_addToGroupPLBBMavHwOther__block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v3;
    if (qword_1ED885620 != -1)
      dispatch_once(&qword_1ED885620, &block);
    if (byte_1ED88555C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg addToGroupPLBBMavHwOther]", block, v13, v14, v15, v16);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg addToGroupPLBBMavHwOther]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 352);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MavBBHwOther"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  -[PLBBMavLogMsg setGroupEntryKey:](self, "setGroupEntryKey:", v10);
  -[PLBBMavLogMsg populateEntryBBMavHwOther:](self, "populateEntryBBMavHwOther:", v11);
  -[PLBBMavLogMsg addToGroupPLBBMavHwEntry:withEntryKey:](self, "addToGroupPLBBMavHwEntry:withEntryKey:", v11, v10);

}

uint64_t __41__PLBBMavLogMsg_addToGroupPLBBMavHwOther__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88555C = result;
  return result;
}

- (void)populateEntryBBMavHwOther:(id)a3
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
  id v44;

  v4 = a3;
  -[PLBBMavLogMsg bbSwRev](self, "bbSwRev");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("SWRevision"));

  -[PLBBMavLogMsg bbHwRev](self, "bbHwRev");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("HWRevision"));

  -[PLBBMavLogMsg bbHwStatsType](self, "bbHwStatsType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("HWStatsType"));

  -[PLBBMavLogMsg bbHwStatsLength](self, "bbHwStatsLength");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("HwStatsLength"));

  -[PLBBMavLogMsg bbHwStatsLevel](self, "bbHwStatsLevel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("HwStatsLevel"));

  -[PLBBMavLogMsg bbHwCurrTimeStamp](self, "bbHwCurrTimeStamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("CurrentTimestamp"));

  -[PLBBMavLogMsg bbHwLastTimeStamp](self, "bbHwLastTimeStamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("LastTimestamp"));

  -[PLBBMavLogMsg bbHwLogDurationInTicks](self, "bbHwLogDurationInTicks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("LogDuration"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("BBDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("BBDate"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("BBDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "convertFromBasebandToMonotonic");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEntryDate:", v17);

  -[PLBBMavLogMsg rpmXOShutDuration](self, "rpmXOShutDuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("RPMXOShutdownDuration"));

  -[PLBBMavLogMsg rpmXOShutCnt](self, "rpmXOShutCnt");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("RPMXOShutdownCount"));

  -[PLBBMavLogMsg rpmVDDMinDuration](self, "rpmVDDMinDuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("RPMVDDMinDuration"));

  -[PLBBMavLogMsg rpmVDDMinEnterCnt](self, "rpmVDDMinEnterCnt");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("RPMVDDMinEnterCount"));

  -[PLBBMavLogMsg appsPerfStateCountHist](self, "appsPerfStateCountHist");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("AppsPerfStateCountHistogram"));

  -[PLBBMavLogMsg cxoShutDownDuration](self, "cxoShutDownDuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("CXOShutdownDuration"));

  -[PLBBMavLogMsg cxoShutDownCount](self, "cxoShutDownCount");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("CXOShutdownCount"));

  -[PLBBMavLogMsg usbStateCountHist](self, "usbStateCountHist");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("USBStateCountHistogram"));

  -[PLBBMavLogMsg uartOnOffState](self, "uartOnOffState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("UARTOnOffStateHistogram"));

  -[PLBBMavLogMsg spiOnOffState](self, "spiOnOffState");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("SPIOnOffStateHistogram"));

  -[PLBBMavLogMsg admOnOffState](self, "admOnOffState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("ADMOnOffStateHistogram"));

  -[PLBBMavLogMsg lpassOnOffState](self, "lpassOnOffState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("LPASSOnOffStateHistogram"));

  -[PLBBMavLogMsg appsSleepVeto](self, "appsSleepVeto");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("APPSSleepVetoState"));

  -[PLBBMavLogMsg mpssSleepVeto](self, "mpssSleepVeto");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, CFSTR("MPSSSleepVetoHistogram"));

  -[PLBBMavLogMsg mdspConfigCount](self, "mdspConfigCount");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("MDSPConfigCountHistogram"));

  -[PLBBMavLogMsg qdspConfigCount](self, "qdspConfigCount");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("QDSPConfigCountHistogram"));

  -[PLBBMavLogMsg gpsOnOff](self, "gpsOnOff");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, CFSTR("GPSOnOffStateHistogram"));

  -[PLBBMavLogMsg gpsDPOOnOff](self, "gpsDPOOnOff");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("GPSDPOOnOffStateHistogram"));

  -[PLBBMavLogMsg gpsDPOBin](self, "gpsDPOBin");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, CFSTR("GPSDPOBins"));

  -[PLBBMavLogMsg mpssCxoShutDownDuration](self, "mpssCxoShutDownDuration");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v37, CFSTR("MPSSCXOShutdownDuration"));

  -[PLBBMavLogMsg mpssCxoShutDownCount](self, "mpssCxoShutDownCount");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v38, CFSTR("MPSSCXOShutdownCount"));

  -[PLBBMavLogMsg mcpmVetoNumHistogram](self, "mcpmVetoNumHistogram");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v39, CFSTR("MCPMVetoNumHistogram"));

  -[PLBBMavLogMsg npaVetoMask](self, "npaVetoMask");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, CFSTR("NPAVetoMask"));

  -[PLBBMavLogMsg npaVetoClientNumHistogram](self, "npaVetoClientNumHistogram");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, CFSTR("NPAVetoClientNumHistogram"));

  -[PLBBMavLogMsg appsClockStateDurationStr](self, "appsClockStateDurationStr");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v42, CFSTR("AppsClockStateDurationStr"));

  -[PLBBMavLogMsg mpssClockStateDurationStr](self, "mpssClockStateDurationStr");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v43, CFSTR("MpssClockStateDurationStr"));

  -[PLBBMavLogMsg hsicStateSleepVetoNum](self, "hsicStateSleepVetoNum");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v44, CFSTR("HsicStateSleepVetoNum"));

}

- (void)refreshMavBBHwOtherPerRAT
{
  void *v3;
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
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D179C2E0](self, a2);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __42__PLBBMavLogMsg_refreshMavBBHwOtherPerRAT__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v4;
    if (qword_1ED885628 != -1)
      dispatch_once(&qword_1ED885628, &block);
    if (byte_1ED88555D)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg refreshMavBBHwOtherPerRAT]", block, v15, v16, v17, v18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg refreshMavBBHwOtherPerRAT]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 436);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MavBBHwOtherPerRAT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
  objc_msgSend(v12, "setIsErrorEntry:", 1);
  -[PLBasebandMessage agent](self, "agent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logEntry:", v12);

  objc_autoreleasePoolPop(v3);
}

uint64_t __42__PLBBMavLogMsg_refreshMavBBHwOtherPerRAT__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88555D = result;
  return result;
}

+ (id)entryEventBackwardMavBBHwOtherPerRAT
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[2];
  uint64_t v42;
  _QWORD v43[3];
  _QWORD v44[13];
  _QWORD v45[13];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[2];
  _QWORD v49[4];

  v49[2] = *MEMORY[0x1E0C80C00];
  v48[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v46[0] = *MEMORY[0x1E0D80318];
  v46[1] = v2;
  v47[0] = &unk_1E8653950;
  v47[1] = CFSTR("refreshRequestHandler");
  v46[2] = *MEMORY[0x1E0D80308];
  v47[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v28;
  v48[1] = *MEMORY[0x1E0D802F0];
  v44[0] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_BoolFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v26;
  v44[1] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v24;
  v44[2] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_DateFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v22;
  v44[3] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v20;
  v44[4] = CFSTR("LogDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v18;
  v44[5] = CFSTR("RadioTech");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v16;
  v44[6] = CFSTR("RSSIModeCount");
  v4 = *MEMORY[0x1E0D80348];
  v41[0] = *MEMORY[0x1E0D80358];
  v3 = v41[0];
  v41[1] = v4;
  v43[0] = &unk_1E8634EF0;
  v43[1] = &unk_1E8634FC8;
  v42 = *MEMORY[0x1E0D80350];
  v5 = v42;
  v43[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v41, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v15;
  v44[7] = CFSTR("Rx0RSSIPowerHist");
  v39[0] = v3;
  v39[1] = v4;
  v40[0] = &unk_1E8634EF0;
  v40[1] = &unk_1E8634FE0;
  v39[2] = v5;
  v40[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45[7] = v14;
  v44[8] = CFSTR("Rx1RSSIPowerHist");
  v37[0] = v3;
  v37[1] = v4;
  v38[0] = &unk_1E8634EF0;
  v38[1] = &unk_1E8634FE0;
  v37[2] = v5;
  v38[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v45[8] = v6;
  v44[9] = CFSTR("Rx0SQAPowerHist");
  v35[0] = v3;
  v35[1] = v4;
  v36[0] = &unk_1E8634EF0;
  v36[1] = &unk_1E8634FF8;
  v35[2] = v5;
  v36[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45[9] = v7;
  v44[10] = CFSTR("Rx1SQAPowerHist");
  v33[0] = v3;
  v33[1] = v4;
  v34[0] = &unk_1E8634EF0;
  v34[1] = &unk_1E8634FF8;
  v33[2] = v5;
  v34[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45[10] = v8;
  v44[11] = CFSTR("TxPowerHist");
  v31[0] = v3;
  v31[1] = v4;
  v32[0] = &unk_1E8634EF0;
  v32[1] = &unk_1E8635010;
  v31[2] = v5;
  v32[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v45[11] = v9;
  v44[12] = CFSTR("ProtocolStateHist");
  v29[0] = v3;
  v29[1] = v4;
  v30[0] = &unk_1E8634EF0;
  v30[1] = &unk_1E8635028;
  v29[2] = v5;
  v30[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v45[12] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)internaLogEventBackwardBBMavHwOtherPerRAT
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
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  _QWORD v20[3];
  _QWORD v21[3];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __58__PLBBMavLogMsg_internaLogEventBackwardBBMavHwOtherPerRAT__block_invoke;
    v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    v19 = v3;
    if (qword_1ED885630 != -1)
      dispatch_once(&qword_1ED885630, &block);
    if (byte_1ED88555E)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg internaLogEventBackwardBBMavHwOtherPerRAT]", block, v16, v17, v18, v19);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg internaLogEventBackwardBBMavHwOtherPerRAT]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 484);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v10 = *MEMORY[0x1E0D80370];
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MavBBHwOtherPerRAT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
  -[PLBBMavLogMsg populateEntryBBMavHwOtherPerRAT:](self, "populateEntryBBMavHwOtherPerRAT:", v12);
  v20[0] = CFSTR("entry");
  v20[1] = CFSTR("name");
  v21[0] = v12;
  v21[1] = v11;
  v20[2] = CFSTR("type");
  v21[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __58__PLBBMavLogMsg_internaLogEventBackwardBBMavHwOtherPerRAT__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88555E = result;
  return result;
}

- (void)logEventBackwardMavBBHwOtherPerRAT
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
    v16 = __51__PLBBMavLogMsg_logEventBackwardMavBBHwOtherPerRAT__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v3;
    if (qword_1ED885638 != -1)
      dispatch_once(&qword_1ED885638, &block);
    if (byte_1ED88555F)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg logEventBackwardMavBBHwOtherPerRAT]", block, v15, v16, v17, v18);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg logEventBackwardMavBBHwOtherPerRAT]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 498);

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
  -[PLBBMavLogMsg internaLogEventBackwardBBMavHwOtherPerRAT](self, "internaLogEventBackwardBBMavHwOtherPerRAT");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("entry"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("name"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMavLogMsg sendAndLogPLEntry:withName:withType:](self, "sendAndLogPLEntry:withName:withType:", v11, v12, v13);

}

uint64_t __51__PLBBMavLogMsg_logEventBackwardMavBBHwOtherPerRAT__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88555F = result;
  return result;
}

- (id)logEventBackwardGrpEntriesBBMavHwOtherPerRAT
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
  void *v13;
  uint64_t block;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __61__PLBBMavLogMsg_logEventBackwardGrpEntriesBBMavHwOtherPerRAT__block_invoke;
    v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    v19 = v3;
    if (qword_1ED885640 != -1)
      dispatch_once(&qword_1ED885640, &block);
    if (byte_1ED885560)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg logEventBackwardGrpEntriesBBMavHwOtherPerRAT]", block, v16, v17, v18, v19);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg logEventBackwardGrpEntriesBBMavHwOtherPerRAT]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 509);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBMavLogMsg internaLogEventBackwardBBMavHwOtherPerRAT](self, "internaLogEventBackwardBBMavHwOtherPerRAT");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = CFSTR("entry");
  objc_msgSend(v10, "objectForKey:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = CFSTR("name");
  v21[0] = v11;
  objc_msgSend(v10, "objectForKey:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __61__PLBBMavLogMsg_logEventBackwardGrpEntriesBBMavHwOtherPerRAT__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885560 = result;
  return result;
}

- (void)populateEntryBBMavHwOtherPerRAT:(id)a3
{
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  BOOL v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  int v37;
  id v38;

  v38 = a3;
  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SeqNum"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v5, CFSTR("SeqNum"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("BBDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v7, CFSTR("BBDate"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("TimeCal"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v9, CFSTR("TimeCal"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("Error"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v11, CFSTR("Error"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("BBDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "convertFromBasebandToMonotonic");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setEntryDate:", v14);

  -[PLBBMavLogMsg bbHwLogDurationInTicks](self, "bbHwLogDurationInTicks");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v15, CFSTR("LogDuration"));

  -[PLBBMavLogMsg radioTech](self, "radioTech");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v16, CFSTR("RadioTech"));

  -[PLBBMavLogMsg rssiModeCount](self, "rssiModeCount");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v17, CFSTR("RSSIModeCount"));

  -[PLBBMavLogMsg rx0RssiPowerHist](self, "rx0RssiPowerHist");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v18, CFSTR("Rx0RSSIPowerHist"));

  -[PLBBMavLogMsg rx1RssiPowerHist](self, "rx1RssiPowerHist");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v19, CFSTR("Rx1RSSIPowerHist"));

  -[PLBBMavLogMsg rx0SQAPowerHist](self, "rx0SQAPowerHist");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v20, CFSTR("Rx0SQAPowerHist"));

  -[PLBBMavLogMsg rx1SQAPowerHist](self, "rx1SQAPowerHist");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v21, CFSTR("Rx1SQAPowerHist"));

  -[PLBBMavLogMsg txPowerHist](self, "txPowerHist");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v22, CFSTR("TxPowerHist"));

  -[PLBBMavLogMsg protocolStateHist](self, "protocolStateHist");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setObject:forKeyedSubscript:", v23, CFSTR("ProtocolStateHist"));

  -[PLBBMavLogMsg txPowerHist](self, "txPowerHist");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
  {
    v26 = 0;
    v27 = 0;
    do
    {
      -[PLBBMavLogMsg txPowerHist](self, "txPowerHist");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndexedSubscript:", v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v27 += objc_msgSend(v29, "intValue");

      ++v26;
      -[PLBBMavLogMsg txPowerHist](self, "txPowerHist");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "count");

    }
    while (v31 > v26);
    v32 = v27 == 0;
  }
  else
  {
    v32 = 1;
  }
  -[PLBBMavLogMsg bbHwLogDurationInTicks](self, "bbHwLogDurationInTicks");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "intValue");
  -[PLBBMavLogMsg protocolStateHist](self, "protocolStateHist");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "intValue");

  if (v34 == v37 && v32)
    objc_msgSend(v38, "setWriteToDB:", 0);

}

- (void)logGrpEntriesMavBBHwOtherPerRat
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD block[5];
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PLBBMavLogMsg_logGrpEntriesMavBBHwOtherPerRat__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1ED885648 != -1)
      dispatch_once(&qword_1ED885648, block);
    if (byte_1ED885561)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg logGrpEntriesMavBBHwOtherPerRat]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg logGrpEntriesMavBBHwOtherPerRat]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 552);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBasebandMessage agent](self, "agent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10 && objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v11 = objc_opt_class();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __48__PLBBMavLogMsg_logGrpEntriesMavBBHwOtherPerRat__block_invoke_371;
    v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v23[4] = v11;
    if (qword_1ED885650 != -1)
      dispatch_once(&qword_1ED885650, v23);
    if (byte_1ED885562)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad agent"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg logGrpEntriesMavBBHwOtherPerRat]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 554);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v12;
        _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBasebandMessage agent](self, "agent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMavLogMsg groupEntryKey](self, "groupEntryKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v19;
  -[PLBBMavLogMsg groupArrEntries](self, "groupArrEntries");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMavLogMsg groupEntryKey](self, "groupEntryKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "logEntries:withGroupID:", v21, v22);

}

uint64_t __48__PLBBMavLogMsg_logGrpEntriesMavBBHwOtherPerRat__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885561 = result;
  return result;
}

uint64_t __48__PLBBMavLogMsg_logGrpEntriesMavBBHwOtherPerRat__block_invoke_371(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885562 = result;
  return result;
}

- (void)setType:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __25__PLBBMavLogMsg_setType___block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v5;
    if (qword_1ED885658 != -1)
      dispatch_once(&qword_1ED885658, &block);
    if (byte_1ED885563)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg setType:]", block, v13, v14, v15, v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg setType:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 561);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[NSMutableDictionary setObject:forKey:](self->_commonInfo, "setObject:forKey:", v4, CFSTR("Type"));

}

uint64_t __25__PLBBMavLogMsg_setType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885563 = result;
  return result;
}

- (void)setMavBBHwValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PLBBMavLogMsg kvPairs](self, "kvPairs");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

+ (id)entryEventMavBBMav1HwOther
{
  return +[PLBBMavLogMsg entryEventMavBBMav2HwOther](PLBBMavLogMsg, "entryEventMavBBMav2HwOther");
}

- (void)logEventBackwardMav1BBHwOtherPerRAT
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
  uint64_t block;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __52__PLBBMavLogMsg_logEventBackwardMav1BBHwOtherPerRAT__block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    v17 = v3;
    if (qword_1ED885660 != -1)
      dispatch_once(&qword_1ED885660, &block);
    if (byte_1ED885564)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg logEventBackwardMav1BBHwOtherPerRAT]", block, v14, v15, v16, v17);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg logEventBackwardMav1BBHwOtherPerRAT]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 590);

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
  v10 = *MEMORY[0x1E0D80370];
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MavBBHwOtherPerRAT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
  -[PLBBMavLogMsg sendAndLogPLEntry:withName:withType:](self, "sendAndLogPLEntry:withName:withType:", v12, CFSTR("MavBBHwOtherPerRAT"), v10);

}

uint64_t __52__PLBBMavLogMsg_logEventBackwardMav1BBHwOtherPerRAT__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885564 = result;
  return result;
}

+ (id)entryEventBackwardMav1BBHwOtherPerRAT
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
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[2];
  uint64_t v32;
  _QWORD v33[3];
  _QWORD v34[9];
  _QWORD v35[9];
  _QWORD v36[4];
  _QWORD v37[4];
  _QWORD v38[2];
  _QWORD v39[4];

  v39[2] = *MEMORY[0x1E0C80C00];
  v38[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v36[0] = *MEMORY[0x1E0D80318];
  v36[1] = v2;
  v37[0] = &unk_1E8653960;
  v37[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v36[2] = *MEMORY[0x1E0D802F8];
  v36[3] = v3;
  v37[2] = CFSTR("refreshRequestHandler");
  v37[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v24;
  v38[1] = *MEMORY[0x1E0D802F0];
  v34[0] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_DateFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v22;
  v34[1] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_StringFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v20;
  v34[2] = CFSTR("RxTicks");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v18;
  v34[3] = CFSTR("TxTicks");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v16;
  v34[4] = CFSTR("LogDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v14;
  v34[5] = CFSTR("RSSIModeCount");
  v5 = *MEMORY[0x1E0D80348];
  v31[0] = *MEMORY[0x1E0D80358];
  v4 = v31[0];
  v31[1] = v5;
  v33[0] = &unk_1E8634EF0;
  v33[1] = &unk_1E8634FC8;
  v32 = *MEMORY[0x1E0D80350];
  v6 = v32;
  v33[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v31, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v7;
  v34[6] = CFSTR("Rx0RSSIPowerHist");
  v29[0] = v4;
  v29[1] = v5;
  v30[0] = &unk_1E8634EF0;
  v30[1] = &unk_1E8634FE0;
  v29[2] = v6;
  v30[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v8;
  v34[7] = CFSTR("TxPowerHist1x");
  v27[0] = v4;
  v27[1] = v5;
  v28[0] = &unk_1E8634EF0;
  v28[1] = &unk_1E8635010;
  v27[2] = v6;
  v28[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v9;
  v34[8] = CFSTR("TxPowerHistEVDO");
  v25[0] = v4;
  v25[1] = v5;
  v26[0] = &unk_1E8634EF0;
  v26[1] = &unk_1E8635010;
  v25[2] = v6;
  v26[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)refreshMav1BBHwOtherPerRAT
{
  void *v3;
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
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D179C2E0](self, a2);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __43__PLBBMavLogMsg_refreshMav1BBHwOtherPerRAT__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v4;
    if (qword_1ED885668 != -1)
      dispatch_once(&qword_1ED885668, &block);
    if (byte_1ED885565)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg refreshMav1BBHwOtherPerRAT]", block, v15, v16, v17, v18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg refreshMav1BBHwOtherPerRAT]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 640);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MavBBHwOtherPerRAT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
  objc_msgSend(v12, "setIsErrorEntry:", 1);
  -[PLBasebandMessage agent](self, "agent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logEntry:", v12);

  objc_autoreleasePoolPop(v3);
}

uint64_t __43__PLBBMavLogMsg_refreshMav1BBHwOtherPerRAT__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885565 = result;
  return result;
}

- (void)populateEntryBBMav1HwOtherPerRAT:(id)a3
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = a3;
  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("SeqNum"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("SeqNum"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("BBDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("BBDate"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("TimeCal"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("TimeCal"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("Error"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("Error"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("BBDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertFromBasebandToMonotonic");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEntryDate:", v15);

  -[PLBBMavLogMsg rxTicks](self, "rxTicks");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("RxTicks"));

  -[PLBBMavLogMsg txTicks](self, "txTicks");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("TxTicks"));

  -[PLBBMavLogMsg rx0RssiPowerHist](self, "rx0RssiPowerHist");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("Rx0RSSIPowerHist"));

  -[PLBBMavLogMsg rssiModeCount](self, "rssiModeCount");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("RSSIModeCount"));

  -[PLBBMavLogMsg bbHwLogDurationInTicks](self, "bbHwLogDurationInTicks");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("LogDuration"));

  -[PLBBMavLogMsg txPowerHist1x](self, "txPowerHist1x");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("TxPowerHist1x"));

  -[PLBBMavLogMsg txPowerHistEVDO](self, "txPowerHistEVDO");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("TxPowerHistEVDO"));

}

- (id)logEventBackwardGrpEntriesBBMav1HwOtherPerRAT
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
  void *v13;
  uint64_t block;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __62__PLBBMavLogMsg_logEventBackwardGrpEntriesBBMav1HwOtherPerRAT__block_invoke;
    v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    v19 = v3;
    if (qword_1ED885670 != -1)
      dispatch_once(&qword_1ED885670, &block);
    if (byte_1ED885566)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg logEventBackwardGrpEntriesBBMav1HwOtherPerRAT]", block, v16, v17, v18, v19);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg logEventBackwardGrpEntriesBBMav1HwOtherPerRAT]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 672);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBMavLogMsg internaLogEventBackwardBBMav1HwOtherPerRAT](self, "internaLogEventBackwardBBMav1HwOtherPerRAT");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = CFSTR("entry");
  objc_msgSend(v10, "objectForKey:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = CFSTR("name");
  v21[0] = v11;
  objc_msgSend(v10, "objectForKey:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __62__PLBBMavLogMsg_logEventBackwardGrpEntriesBBMav1HwOtherPerRAT__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885566 = result;
  return result;
}

- (id)internaLogEventBackwardBBMav1HwOtherPerRAT
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
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  _QWORD v20[3];
  _QWORD v21[3];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __59__PLBBMavLogMsg_internaLogEventBackwardBBMav1HwOtherPerRAT__block_invoke;
    v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    v19 = v3;
    if (qword_1ED885678 != -1)
      dispatch_once(&qword_1ED885678, &block);
    if (byte_1ED885567)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg internaLogEventBackwardBBMav1HwOtherPerRAT]", block, v16, v17, v18, v19);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg internaLogEventBackwardBBMav1HwOtherPerRAT]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 680);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v10 = *MEMORY[0x1E0D80370];
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MavBBHwOtherPerRAT"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
  -[PLBBMavLogMsg populateEntryBBMav1HwOtherPerRAT:](self, "populateEntryBBMav1HwOtherPerRAT:", v12);
  v20[0] = CFSTR("entry");
  v20[1] = CFSTR("name");
  v21[0] = v12;
  v21[1] = v11;
  v20[2] = CFSTR("type");
  v21[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __59__PLBBMavLogMsg_internaLogEventBackwardBBMav1HwOtherPerRAT__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885567 = result;
  return result;
}

- (void)refreshBBMav2HwOther
{
  void *v3;
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
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D179C2E0](self, a2);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __37__PLBBMavLogMsg_refreshBBMav2HwOther__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v4;
    if (qword_1ED885680 != -1)
      dispatch_once(&qword_1ED885680, &block);
    if (byte_1ED885568)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg refreshBBMav2HwOther]", block, v15, v16, v17, v18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg refreshBBMav2HwOther]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 697);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MavBBHwOther"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
  objc_msgSend(v12, "setIsErrorEntry:", 1);
  -[PLBasebandMessage agent](self, "agent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logEntry:", v12);

  objc_autoreleasePoolPop(v3);
}

uint64_t __37__PLBBMavLogMsg_refreshBBMav2HwOther__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885568 = result;
  return result;
}

+ (id)entryEventMavBBMav2HwOther
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  _QWORD v68[3];
  _QWORD v69[3];
  _QWORD v70[3];
  _QWORD v71[3];
  _QWORD v72[3];
  _QWORD v73[3];
  _QWORD v74[3];
  _QWORD v75[3];
  _QWORD v76[2];
  uint64_t v77;
  _QWORD v78[3];
  _QWORD v79[27];
  _QWORD v80[27];
  _QWORD v81[3];
  _QWORD v82[3];
  _QWORD v83[2];
  _QWORD v84[4];

  v84[2] = *MEMORY[0x1E0C80C00];
  v83[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v81[0] = *MEMORY[0x1E0D80318];
  v81[1] = v2;
  v82[0] = &unk_1E8653970;
  v82[1] = CFSTR("refreshRequestHandler");
  v81[2] = *MEMORY[0x1E0D80308];
  v82[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v49;
  v83[1] = *MEMORY[0x1E0D802F0];
  v79[0] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "commonTypeDict_BoolFormat");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v47;
  v79[1] = CFSTR("Type");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "commonTypeDict_IntegerFormat");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v45;
  v79[2] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "commonTypeDict_IntegerFormat");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v80[2] = v43;
  v79[3] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "commonTypeDict_DateFormat");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v80[3] = v41;
  v79[4] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "commonTypeDict_IntegerFormat");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v80[4] = v39;
  v79[5] = CFSTR("SWRevision");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "commonTypeDict_IntegerFormat");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v80[5] = v37;
  v79[6] = CFSTR("HWRevision");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "commonTypeDict_IntegerFormat");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v80[6] = v35;
  v79[7] = CFSTR("HWStatsType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v80[7] = v33;
  v79[8] = CFSTR("HwStatsLength");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_IntegerFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v80[8] = v31;
  v79[9] = CFSTR("HwStatsLevel");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v80[9] = v29;
  v79[10] = CFSTR("LastTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v80[10] = v27;
  v79[11] = CFSTR("CurrentTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v80[11] = v25;
  v79[12] = CFSTR("LogDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v80[12] = v23;
  v79[13] = CFSTR("ProcSystemState");
  v4 = *MEMORY[0x1E0D80348];
  v76[0] = *MEMORY[0x1E0D80358];
  v3 = v76[0];
  v76[1] = v4;
  v78[0] = &unk_1E8634EF0;
  v78[1] = &unk_1E8634F38;
  v77 = *MEMORY[0x1E0D80350];
  v5 = v77;
  v78[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v76, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v80[13] = v22;
  v79[14] = CFSTR("ProcArmPerfState");
  v74[0] = v3;
  v74[1] = v4;
  v75[0] = &unk_1E8634EF0;
  v75[1] = &unk_1E8635040;
  v74[2] = v5;
  v75[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v80[14] = v21;
  v79[15] = CFSTR("ModemAppMdspState");
  v72[0] = v3;
  v72[1] = v4;
  v73[0] = &unk_1E8634EF0;
  v73[1] = &unk_1E8634F50;
  v72[2] = v5;
  v73[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v80[15] = v20;
  v79[16] = CFSTR("ModemAppMdspClockState");
  v70[0] = v3;
  v70[1] = v4;
  v71[0] = &unk_1E8634EF0;
  v71[1] = &unk_1E8634F50;
  v70[2] = v5;
  v71[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v80[16] = v19;
  v79[17] = CFSTR("ModemAppMdspSpeed");
  v68[0] = v3;
  v68[1] = v4;
  v69[0] = &unk_1E8634EF0;
  v69[1] = &unk_1E8635058;
  v68[2] = v5;
  v69[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v80[17] = v18;
  v79[18] = CFSTR("ModemAppMdmState");
  v66[0] = v3;
  v66[1] = v4;
  v67[0] = &unk_1E8634EF0;
  v67[1] = &unk_1E8634F50;
  v66[2] = v5;
  v67[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v80[18] = v17;
  v79[19] = CFSTR("ModemAppAdspState");
  v64[0] = v3;
  v64[1] = v4;
  v65[0] = &unk_1E8634EF0;
  v65[1] = &unk_1E8634F50;
  v64[2] = v5;
  v65[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v80[19] = v16;
  v79[20] = CFSTR("ModemAppAdspClockState");
  v62[0] = v3;
  v62[1] = v4;
  v63[0] = &unk_1E8634EF0;
  v63[1] = &unk_1E8634F50;
  v62[2] = v5;
  v63[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v80[20] = v15;
  v79[21] = CFSTR("ModemAppAdspSpeed");
  v60[0] = v3;
  v60[1] = v4;
  v61[0] = &unk_1E8634EF0;
  v61[1] = &unk_1E8635058;
  v60[2] = v5;
  v61[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v80[21] = v14;
  v79[22] = CFSTR("ModemAppAdmState");
  v58[0] = v3;
  v58[1] = v4;
  v59[0] = &unk_1E8634EF0;
  v59[1] = &unk_1E8634F50;
  v58[2] = v5;
  v59[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v80[22] = v13;
  v79[23] = CFSTR("PeripheralUSBState");
  v56[0] = v3;
  v56[1] = v4;
  v57[0] = &unk_1E8634EF0;
  v57[1] = &unk_1E8634F50;
  v56[2] = v5;
  v57[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v80[23] = v6;
  v79[24] = CFSTR("PeripheralSPIState");
  v54[0] = v3;
  v54[1] = v4;
  v55[0] = &unk_1E8634EF0;
  v55[1] = &unk_1E8634F50;
  v54[2] = v5;
  v55[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v80[24] = v7;
  v79[25] = CFSTR("PeripheralGPSState");
  v52[0] = v3;
  v52[1] = v4;
  v53[0] = &unk_1E8634EF0;
  v53[1] = &unk_1E8634F50;
  v52[2] = v5;
  v53[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v80[25] = v8;
  v79[26] = CFSTR("PeripheralUARTState");
  v50[0] = v3;
  v50[1] = v4;
  v51[0] = &unk_1E8634EF0;
  v51[1] = &unk_1E8634F50;
  v50[2] = v5;
  v51[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v80[26] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)populateEntryBBMav2HwOther:(id)a3
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
  id v32;

  v4 = a3;
  -[PLBBMavLogMsg bbSwRev](self, "bbSwRev");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("SWRevision"));

  -[PLBBMavLogMsg bbHwRev](self, "bbHwRev");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("HWRevision"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("BBDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("BBDate"));

  -[PLBBMavLogMsg bbHwStatsType](self, "bbHwStatsType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("HWStatsType"));

  -[PLBBMavLogMsg bbHwStatsLength](self, "bbHwStatsLength");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("HwStatsLength"));

  -[PLBBMavLogMsg bbHwStatsLevel](self, "bbHwStatsLevel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("HwStatsLevel"));

  -[PLBBMavLogMsg bbHwCurrTimeStamp](self, "bbHwCurrTimeStamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("CurrentTimestamp"));

  -[PLBBMavLogMsg bbHwLastTimeStamp](self, "bbHwLastTimeStamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("LastTimestamp"));

  -[PLBBMavLogMsg bbHwLogDurationInTicks](self, "bbHwLogDurationInTicks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("LogDuration"));

  -[PLBBMavLogMsg bbHwMsgType](self, "bbHwMsgType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("Type"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("BBDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "convertFromBasebandToMonotonic");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEntryDate:", v18);

  -[PLBBMavLogMsg bbHwProcSystemState](self, "bbHwProcSystemState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("ProcSystemState"));

  -[PLBBMavLogMsg bbHwProcArmPerfState](self, "bbHwProcArmPerfState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("ProcArmPerfState"));

  -[PLBBMavLogMsg bbHwModemAppMdspState](self, "bbHwModemAppMdspState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("ModemAppMdspState"));

  -[PLBBMavLogMsg bbHwModemAppMdspClockState](self, "bbHwModemAppMdspClockState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("ModemAppMdspClockState"));

  -[PLBBMavLogMsg bbHwModemAppMdspSpeed](self, "bbHwModemAppMdspSpeed");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("ModemAppMdspSpeed"));

  -[PLBBMavLogMsg bbHwModemAppMdmState](self, "bbHwModemAppMdmState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("ModemAppMdmState"));

  -[PLBBMavLogMsg bbHwModemAppAdspState](self, "bbHwModemAppAdspState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("ModemAppAdspState"));

  -[PLBBMavLogMsg bbHwModemAppAdspClockState](self, "bbHwModemAppAdspClockState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("ModemAppAdspClockState"));

  -[PLBBMavLogMsg bbHwModemAppAdspSpeed](self, "bbHwModemAppAdspSpeed");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("ModemAppAdspSpeed"));

  -[PLBBMavLogMsg bbHwModemAppAdmState](self, "bbHwModemAppAdmState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("ModemAppAdmState"));

  -[PLBBMavLogMsg bbHwPeripheralUSBState](self, "bbHwPeripheralUSBState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("PeripheralUSBState"));

  -[PLBBMavLogMsg bbHwPeripheralSPIState](self, "bbHwPeripheralSPIState");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("PeripheralSPIState"));

  -[PLBBMavLogMsg bbHwPeripheralGPSState](self, "bbHwPeripheralGPSState");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, CFSTR("PeripheralGPSState"));

  -[PLBBMavLogMsg bbHwPeripheralUARTState](self, "bbHwPeripheralUARTState");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("PeripheralUARTState"));

}

- (void)addToGroupPLBBMav2HwOther
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
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __42__PLBBMavLogMsg_addToGroupPLBBMav2HwOther__block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v3;
    if (qword_1ED885688 != -1)
      dispatch_once(&qword_1ED885688, &block);
    if (byte_1ED885569)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg addToGroupPLBBMav2HwOther]", block, v13, v14, v15, v16);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg addToGroupPLBBMav2HwOther]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 830);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MavBBHwOther"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  -[PLBBMavLogMsg setGroupEntryKey:](self, "setGroupEntryKey:", v10);
  -[PLBBMavLogMsg populateEntryBBMav2HwOther:](self, "populateEntryBBMav2HwOther:", v11);
  -[PLBBMavLogMsg addToGroupPLBBMavHwEntry:withEntryKey:](self, "addToGroupPLBBMavHwEntry:withEntryKey:", v11, v10);

}

uint64_t __42__PLBBMavLogMsg_addToGroupPLBBMav2HwOther__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885569 = result;
  return result;
}

- (void)refreshBBMav4HwOther
{
  void *v3;
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
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D179C2E0](self, a2);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __37__PLBBMavLogMsg_refreshBBMav4HwOther__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v4;
    if (qword_1ED885690 != -1)
      dispatch_once(&qword_1ED885690, &block);
    if (byte_1ED88556A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg refreshBBMav4HwOther]", block, v15, v16, v17, v18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg refreshBBMav4HwOther]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 848);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MavBBHwOther"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
  objc_msgSend(v12, "setIsErrorEntry:", 1);
  -[PLBasebandMessage agent](self, "agent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logEntry:", v12);

  objc_autoreleasePoolPop(v3);
}

uint64_t __37__PLBBMavLogMsg_refreshBBMav4HwOther__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88556A = result;
  return result;
}

+ (id)entryEventMavBBMav4HwOther
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  _QWORD v68[3];
  _QWORD v69[3];
  _QWORD v70[2];
  uint64_t v71;
  _QWORD v72[3];
  _QWORD v73[25];
  _QWORD v74[25];
  _QWORD v75[3];
  _QWORD v76[3];
  _QWORD v77[2];
  _QWORD v78[4];

  v78[2] = *MEMORY[0x1E0C80C00];
  v77[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v75[0] = *MEMORY[0x1E0D80318];
  v75[1] = v2;
  v76[0] = &unk_1E8653980;
  v76[1] = CFSTR("refreshRequestHandler");
  v75[2] = *MEMORY[0x1E0D80308];
  v76[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 3);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v47;
  v77[1] = *MEMORY[0x1E0D802F0];
  v73[0] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "commonTypeDict_BoolFormat");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v45;
  v73[1] = CFSTR("Type");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "commonTypeDict_IntegerFormat");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v43;
  v73[2] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "commonTypeDict_IntegerFormat");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v74[2] = v41;
  v73[3] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "commonTypeDict_DateFormat");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v74[3] = v39;
  v73[4] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "commonTypeDict_IntegerFormat");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v74[4] = v37;
  v73[5] = CFSTR("SWRevision");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "commonTypeDict_IntegerFormat");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v74[5] = v35;
  v73[6] = CFSTR("HWRevision");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v74[6] = v33;
  v73[7] = CFSTR("HWStatsType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_IntegerFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v74[7] = v31;
  v73[8] = CFSTR("HwStatsLength");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v74[8] = v29;
  v73[9] = CFSTR("HwStatsLevel");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v74[9] = v27;
  v73[10] = CFSTR("LastTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v74[10] = v25;
  v73[11] = CFSTR("CurrentTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v74[11] = v23;
  v73[12] = CFSTR("LogDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v74[12] = v21;
  v73[13] = CFSTR("ProcSystemState");
  v4 = *MEMORY[0x1E0D80348];
  v70[0] = *MEMORY[0x1E0D80358];
  v3 = v70[0];
  v70[1] = v4;
  v72[0] = &unk_1E8634EF0;
  v72[1] = &unk_1E8634F38;
  v71 = *MEMORY[0x1E0D80350];
  v5 = v71;
  v72[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v70, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v74[13] = v20;
  v73[14] = CFSTR("ProcArmPerfState");
  v68[0] = v3;
  v68[1] = v4;
  v69[0] = &unk_1E8634EF0;
  v69[1] = &unk_1E8634FB0;
  v68[2] = v5;
  v69[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v74[14] = v19;
  v73[15] = CFSTR("ModemAppMdspSpeed");
  v66[0] = v3;
  v66[1] = v4;
  v67[0] = &unk_1E8634EF0;
  v67[1] = &unk_1E8635058;
  v66[2] = v5;
  v67[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v74[15] = v18;
  v73[16] = CFSTR("ModemAppMdmState");
  v64[0] = v3;
  v64[1] = v4;
  v65[0] = &unk_1E8634EF0;
  v65[1] = &unk_1E8634F50;
  v64[2] = v5;
  v65[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v74[16] = v17;
  v73[17] = CFSTR("ModemAppQdspSpeed");
  v62[0] = v3;
  v62[1] = v4;
  v63[0] = &unk_1E8634EF0;
  v63[1] = &unk_1E8635058;
  v62[2] = v5;
  v63[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v74[17] = v16;
  v73[18] = CFSTR("ModemAppAdmState");
  v60[0] = v3;
  v60[1] = v4;
  v61[0] = &unk_1E8634EF0;
  v61[1] = &unk_1E8634F50;
  v60[2] = v5;
  v61[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v74[18] = v15;
  v73[19] = CFSTR("PeripheralUSBState");
  v58[0] = v3;
  v58[1] = v4;
  v59[0] = &unk_1E8634EF0;
  v59[1] = &unk_1E8634F50;
  v58[2] = v5;
  v59[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v74[19] = v14;
  v73[20] = CFSTR("PeripheralSPIState");
  v56[0] = v3;
  v56[1] = v4;
  v57[0] = &unk_1E8634EF0;
  v57[1] = &unk_1E8634F50;
  v56[2] = v5;
  v57[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v74[20] = v13;
  v73[21] = CFSTR("PeripheralGPSState");
  v54[0] = v3;
  v54[1] = v4;
  v55[0] = &unk_1E8634EF0;
  v55[1] = &unk_1E8634F50;
  v54[2] = v5;
  v55[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v74[21] = v6;
  v73[22] = CFSTR("PeripheralUARTState");
  v52[0] = v3;
  v52[1] = v4;
  v53[0] = &unk_1E8634EF0;
  v53[1] = &unk_1E8634F50;
  v52[2] = v5;
  v53[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v74[22] = v7;
  v73[23] = CFSTR("SleepVetoClientListQdsp");
  v50[0] = v3;
  v50[1] = v4;
  v51[0] = &unk_1E8634EF0;
  v51[1] = &unk_1E8634FC8;
  v50[2] = v5;
  v51[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v74[23] = v8;
  v73[24] = CFSTR("SleepVetoClientListArm");
  v48[0] = v3;
  v48[1] = v4;
  v49[0] = &unk_1E8634EF0;
  v49[1] = &unk_1E8634FC8;
  v48[2] = v5;
  v49[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v74[24] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)populateEntryBBMav4HwOther:(id)a3
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
  id v30;

  v4 = a3;
  -[PLBBMavLogMsg bbSwRev](self, "bbSwRev");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("SWRevision"));

  -[PLBBMavLogMsg bbHwRev](self, "bbHwRev");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("HWRevision"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("BBDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("BBDate"));

  -[PLBBMavLogMsg bbHwStatsType](self, "bbHwStatsType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("HWStatsType"));

  -[PLBBMavLogMsg bbHwStatsLength](self, "bbHwStatsLength");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("HwStatsLength"));

  -[PLBBMavLogMsg bbHwStatsLevel](self, "bbHwStatsLevel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("HwStatsLevel"));

  -[PLBBMavLogMsg bbHwCurrTimeStamp](self, "bbHwCurrTimeStamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("CurrentTimestamp"));

  -[PLBBMavLogMsg bbHwLastTimeStamp](self, "bbHwLastTimeStamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("LastTimestamp"));

  -[PLBBMavLogMsg bbHwLogDurationInTicks](self, "bbHwLogDurationInTicks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("LogDuration"));

  -[PLBBMavLogMsg bbHwMsgType](self, "bbHwMsgType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("Type"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("BBDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "convertFromBasebandToMonotonic");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEntryDate:", v18);

  -[PLBBMavLogMsg bbHwProcSystemState](self, "bbHwProcSystemState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("ProcSystemState"));

  -[PLBBMavLogMsg bbHwProcArmPerfState](self, "bbHwProcArmPerfState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("ProcArmPerfState"));

  -[PLBBMavLogMsg bbHwModemAppMdspSpeed](self, "bbHwModemAppMdspSpeed");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("ModemAppMdspSpeed"));

  -[PLBBMavLogMsg bbHwModemAppMdmState](self, "bbHwModemAppMdmState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("ModemAppMdmState"));

  -[PLBBMavLogMsg bbHwModemAppQdspSpeed](self, "bbHwModemAppQdspSpeed");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("ModemAppQdspSpeed"));

  -[PLBBMavLogMsg bbHwModemAppAdmState](self, "bbHwModemAppAdmState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("ModemAppAdmState"));

  -[PLBBMavLogMsg bbHwPeripheralGPSState](self, "bbHwPeripheralGPSState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("PeripheralGPSState"));

  -[PLBBMavLogMsg bbHwPeripheralUSBState](self, "bbHwPeripheralUSBState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("PeripheralUSBState"));

  -[PLBBMavLogMsg bbHwPeripheralUARTState](self, "bbHwPeripheralUARTState");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("PeripheralUARTState"));

  -[PLBBMavLogMsg bbHwPeripheralSPIState](self, "bbHwPeripheralSPIState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("PeripheralSPIState"));

  -[PLBBMavLogMsg bbHwSleepVetoClientListQdsp](self, "bbHwSleepVetoClientListQdsp");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("SleepVetoClientListQdsp"));

  -[PLBBMavLogMsg bbHwSleepVetoClientListArm](self, "bbHwSleepVetoClientListArm");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("SleepVetoClientListArm"));

}

- (void)addToGroupPLBBMav4HwOther
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
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __42__PLBBMavLogMsg_addToGroupPLBBMav4HwOther__block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v3;
    if (qword_1ED885698 != -1)
      dispatch_once(&qword_1ED885698, &block);
    if (byte_1ED88556B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg addToGroupPLBBMav4HwOther]", block, v13, v14, v15, v16);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg addToGroupPLBBMav4HwOther]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 965);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MavBBHwOther"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  -[PLBBMavLogMsg setGroupEntryKey:](self, "setGroupEntryKey:", v10);
  -[PLBBMavLogMsg populateEntryBBMav4HwOther:](self, "populateEntryBBMav4HwOther:", v11);
  -[PLBBMavLogMsg addToGroupPLBBMavHwEntry:withEntryKey:](self, "addToGroupPLBBMavHwEntry:withEntryKey:", v11, v10);

}

uint64_t __42__PLBBMavLogMsg_addToGroupPLBBMav4HwOther__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88556B = result;
  return result;
}

- (void)refreshBBMav10HwOther
{
  void *v2;
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
  v2 = (void *)MEMORY[0x1D179C2E0](self, a2);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __38__PLBBMavLogMsg_refreshBBMav10HwOther__block_invoke;
    v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    v14 = v3;
    if (qword_1ED8856A0 != -1)
      dispatch_once(&qword_1ED8856A0, &block);
    if (byte_1ED88556C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg refreshBBMav10HwOther]", block, v11, v12, v13, v14);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg refreshBBMav10HwOther]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 982);

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
  objc_autoreleasePoolPop(v2);
}

uint64_t __38__PLBBMavLogMsg_refreshBBMav10HwOther__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88556C = result;
  return result;
}

+ (id)entryEventMavBBMav10HwOther
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
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
  _QWORD v99[2];
  uint64_t v100;
  _QWORD v101[3];
  _QWORD v102[38];
  _QWORD v103[38];
  _QWORD v104[3];
  _QWORD v105[3];
  _QWORD v106[2];
  _QWORD v107[4];

  v107[2] = *MEMORY[0x1E0C80C00];
  v106[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v104[0] = *MEMORY[0x1E0D80318];
  v104[1] = v2;
  v105[0] = &unk_1E8653990;
  v105[1] = CFSTR("refreshMavBBHwOther");
  v104[2] = *MEMORY[0x1E0D80308];
  v105[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v104, 3);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v107[0] = v70;
  v106[1] = *MEMORY[0x1E0D802F0];
  v102[0] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "commonTypeDict_BoolFormat");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = v68;
  v102[1] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "commonTypeDict_IntegerFormat");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v103[1] = v66;
  v102[2] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "commonTypeDict_DateFormat");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v103[2] = v64;
  v102[3] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "commonTypeDict_IntegerFormat");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v103[3] = v62;
  v102[4] = CFSTR("SWRevision");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "commonTypeDict_IntegerFormat");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v103[4] = v60;
  v102[5] = CFSTR("HWRevision");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v103[5] = v58;
  v102[6] = CFSTR("HWStatsType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "commonTypeDict_IntegerFormat");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v103[6] = v56;
  v102[7] = CFSTR("HwStatsLength");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "commonTypeDict_IntegerFormat");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v103[7] = v54;
  v102[8] = CFSTR("HwStatsLevel");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v103[8] = v52;
  v102[9] = CFSTR("LastTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v103[9] = v50;
  v102[10] = CFSTR("CurrentTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "commonTypeDict_IntegerFormat");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v103[10] = v48;
  v102[11] = CFSTR("LogDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v103[11] = v46;
  v102[12] = CFSTR("RPMXOShutdownDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v103[12] = v44;
  v102[13] = CFSTR("RPMXOShutdownCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v103[13] = v42;
  v102[14] = CFSTR("RPMVDDMinDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v103[14] = v40;
  v102[15] = CFSTR("RPMVDDMinEnterCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v103[15] = v38;
  v102[16] = CFSTR("AppsPerfStateCountHistogram");
  v4 = *MEMORY[0x1E0D80348];
  v99[0] = *MEMORY[0x1E0D80358];
  v3 = v99[0];
  v99[1] = v4;
  v101[0] = &unk_1E8634EF0;
  v101[1] = &unk_1E8635058;
  v100 = *MEMORY[0x1E0D80350];
  v5 = v100;
  v101[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v99, 3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v103[16] = v37;
  v102[17] = CFSTR("CXOShutdownDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "commonTypeDict_IntegerFormat");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v103[17] = v35;
  v102[18] = CFSTR("CXOShutdownCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v103[18] = v33;
  v102[19] = CFSTR("USBStateCountHistogram");
  v97[0] = v3;
  v97[1] = v4;
  v98[0] = &unk_1E8634EF0;
  v98[1] = &unk_1E8634F38;
  v97[2] = v5;
  v98[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v103[19] = v32;
  v102[20] = CFSTR("UARTOnOffStateHistogram");
  v95[0] = v3;
  v95[1] = v4;
  v96[0] = &unk_1E8634EF0;
  v96[1] = &unk_1E8634F50;
  v95[2] = v5;
  v96[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v103[20] = v31;
  v102[21] = CFSTR("SPIOnOffStateHistogram");
  v93[0] = v3;
  v93[1] = v4;
  v94[0] = &unk_1E8634EF0;
  v94[1] = &unk_1E8634F50;
  v93[2] = v5;
  v94[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v103[21] = v30;
  v102[22] = CFSTR("ADMOnOffStateHistogram");
  v91[0] = v3;
  v91[1] = v4;
  v92[0] = &unk_1E8634EF0;
  v92[1] = &unk_1E8634F50;
  v91[2] = v5;
  v92[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v103[22] = v29;
  v102[23] = CFSTR("LPASSOnOffStateHistogram");
  v89[0] = v3;
  v89[1] = v4;
  v90[0] = &unk_1E8634EF0;
  v90[1] = &unk_1E8634F50;
  v89[2] = v5;
  v90[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v103[23] = v28;
  v102[24] = CFSTR("APPSSleepVetoState");
  v87[0] = v3;
  v87[1] = v4;
  v88[0] = &unk_1E8634EF0;
  v88[1] = &unk_1E8634F68;
  v87[2] = v5;
  v88[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v103[24] = v27;
  v102[25] = CFSTR("MPSSSleepVetoHistogram");
  v85[0] = v3;
  v85[1] = v4;
  v86[0] = &unk_1E8634EF0;
  v86[1] = &unk_1E8634F38;
  v85[2] = v5;
  v86[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v103[25] = v26;
  v102[26] = CFSTR("QDSPConfigCountHistogram");
  v83[0] = v3;
  v83[1] = v4;
  v84[0] = &unk_1E8634EF0;
  v84[1] = &unk_1E8635070;
  v83[2] = v5;
  v84[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v103[26] = v25;
  v102[27] = CFSTR("GPSOnOffStateHistogram");
  v81[0] = v3;
  v81[1] = v4;
  v82[0] = &unk_1E8634EF0;
  v82[1] = &unk_1E8634F50;
  v81[2] = v5;
  v82[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v103[27] = v24;
  v102[28] = CFSTR("GPSDPOOnOffStateHistogram");
  v79[0] = v3;
  v79[1] = v4;
  v80[0] = &unk_1E8634EF0;
  v80[1] = &unk_1E8634F50;
  v79[2] = v5;
  v80[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v103[28] = v23;
  v102[29] = CFSTR("GPSDPOBins");
  v77[0] = v3;
  v77[1] = v4;
  v78[0] = &unk_1E8634EF0;
  v78[1] = &unk_1E8634F08;
  v77[2] = v5;
  v78[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v103[29] = v22;
  v102[30] = CFSTR("MPSSCXOShutdownDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v103[30] = v20;
  v102[31] = CFSTR("MPSSCXOShutdownCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v103[31] = v18;
  v102[32] = CFSTR("MCPMVetoNumHistogram");
  v75[0] = v3;
  v75[1] = v4;
  v76[0] = &unk_1E8634EF0;
  v76[1] = &unk_1E8635010;
  v75[2] = v5;
  v76[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v103[32] = v17;
  v102[33] = CFSTR("NPAVetoMask");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v103[33] = v15;
  v102[34] = CFSTR("NPAVetoClientNumHistogram");
  v73[0] = v3;
  v73[1] = v4;
  v74[0] = &unk_1E8634EF0;
  v74[1] = &unk_1E8634F98;
  v73[2] = v5;
  v74[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v103[34] = v6;
  v102[35] = CFSTR("AppsClockStateDurationStr");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v103[35] = v8;
  v102[36] = CFSTR("MpssClockStateDurationStr");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v103[36] = v10;
  v102[37] = CFSTR("HsicStateSleepVetoNum");
  v71[0] = v3;
  v71[1] = v4;
  v72[0] = &unk_1E8634EF0;
  v72[1] = &unk_1E8634FB0;
  v71[2] = v5;
  v72[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v103[37] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 38);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v107[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, v106, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)logEventBackwardMav10BBHwOther
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLBBMavLogMsg_logEventBackwardMav10BBHwOther__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED8856A8 != -1)
      dispatch_once(&qword_1ED8856A8, block);
    if (byte_1ED88556D)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg logEventBackwardMav10BBHwOther]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg logEventBackwardMav10BBHwOther]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1081);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v4 = MEMORY[0x1E0C809B0];
    }
  }
  v11 = *MEMORY[0x1E0D80370];
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MavBBHwOther"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v12);
  -[PLBBMavLogMsg populateEntryBBMav10HwOther:](self, "populateEntryBBMav10HwOther:", v13);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v20[0] = v4;
    v20[1] = 3221225472;
    v20[2] = __47__PLBBMavLogMsg_logEventBackwardMav10BBHwOther__block_invoke_386;
    v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v20[4] = objc_opt_class();
    if (qword_1ED8856B0 != -1)
      dispatch_once(&qword_1ED8856B0, v20);
    if (byte_1ED88556E)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("About to send to log at %s"), "-[PLBBMavLogMsg logEventBackwardMav10BBHwOther]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg logEventBackwardMav10BBHwOther]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 1087);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v14;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBMavLogMsg sendAndLogPLEntry:withName:withType:](self, "sendAndLogPLEntry:withName:withType:", v13, CFSTR("MavBBHwOther"), v11);

}

uint64_t __47__PLBBMavLogMsg_logEventBackwardMav10BBHwOther__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88556D = result;
  return result;
}

uint64_t __47__PLBBMavLogMsg_logEventBackwardMav10BBHwOther__block_invoke_386(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88556E = result;
  return result;
}

- (void)addToGroupPLBBMav10HwOther
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
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __43__PLBBMavLogMsg_addToGroupPLBBMav10HwOther__block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v3;
    if (qword_1ED8856B8 != -1)
      dispatch_once(&qword_1ED8856B8, &block);
    if (byte_1ED88556F)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg addToGroupPLBBMav10HwOther]", block, v13, v14, v15, v16);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg addToGroupPLBBMav10HwOther]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 1096);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MavBBHwOther"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  -[PLBBMavLogMsg setGroupEntryKey:](self, "setGroupEntryKey:", v10);
  -[PLBBMavLogMsg populateEntryBBMav10HwOther:](self, "populateEntryBBMav10HwOther:", v11);
  -[PLBBMavLogMsg addToGroupPLBBMavHwEntry:withEntryKey:](self, "addToGroupPLBBMavHwEntry:withEntryKey:", v11, v10);

}

uint64_t __43__PLBBMavLogMsg_addToGroupPLBBMav10HwOther__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88556F = result;
  return result;
}

- (void)populateEntryBBMav10HwOther:(id)a3
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
  id v43;

  v4 = a3;
  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("BBDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("BBDate"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("BBDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertFromBasebandToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEntryDate:", v9);

  -[PLBBMavLogMsg bbSwRev](self, "bbSwRev");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("SWRevision"));

  -[PLBBMavLogMsg bbHwRev](self, "bbHwRev");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("HWRevision"));

  -[PLBBMavLogMsg bbHwStatsType](self, "bbHwStatsType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("HWStatsType"));

  -[PLBBMavLogMsg bbHwStatsLength](self, "bbHwStatsLength");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("HwStatsLength"));

  -[PLBBMavLogMsg bbHwStatsLevel](self, "bbHwStatsLevel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("HwStatsLevel"));

  -[PLBBMavLogMsg bbHwCurrTimeStamp](self, "bbHwCurrTimeStamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("CurrentTimestamp"));

  -[PLBBMavLogMsg bbHwLastTimeStamp](self, "bbHwLastTimeStamp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("LastTimestamp"));

  -[PLBBMavLogMsg bbHwLogDurationInTicks](self, "bbHwLogDurationInTicks");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("LogDuration"));

  -[PLBBMavLogMsg rpmXOShutDuration](self, "rpmXOShutDuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("RPMXOShutdownDuration"));

  -[PLBBMavLogMsg rpmXOShutCnt](self, "rpmXOShutCnt");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("RPMXOShutdownCount"));

  -[PLBBMavLogMsg rpmVDDMinDuration](self, "rpmVDDMinDuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("RPMVDDMinDuration"));

  -[PLBBMavLogMsg rpmVDDMinEnterCnt](self, "rpmVDDMinEnterCnt");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("RPMVDDMinEnterCount"));

  -[PLBBMavLogMsg appsPerfStateCountHist](self, "appsPerfStateCountHist");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("AppsPerfStateCountHistogram"));

  -[PLBBMavLogMsg cxoShutDownDuration](self, "cxoShutDownDuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("CXOShutdownDuration"));

  -[PLBBMavLogMsg cxoShutDownCount](self, "cxoShutDownCount");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("CXOShutdownCount"));

  -[PLBBMavLogMsg usbStateCountHist](self, "usbStateCountHist");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("USBStateCountHistogram"));

  -[PLBBMavLogMsg uartOnOffState](self, "uartOnOffState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("UARTOnOffStateHistogram"));

  -[PLBBMavLogMsg spiOnOffState](self, "spiOnOffState");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("SPIOnOffStateHistogram"));

  -[PLBBMavLogMsg admOnOffState](self, "admOnOffState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("ADMOnOffStateHistogram"));

  -[PLBBMavLogMsg lpassOnOffState](self, "lpassOnOffState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("LPASSOnOffStateHistogram"));

  -[PLBBMavLogMsg appsSleepVeto](self, "appsSleepVeto");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("APPSSleepVetoState"));

  -[PLBBMavLogMsg mpssSleepVeto](self, "mpssSleepVeto");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, CFSTR("MPSSSleepVetoHistogram"));

  -[PLBBMavLogMsg qdspConfigCount](self, "qdspConfigCount");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("QDSPConfigCountHistogram"));

  -[PLBBMavLogMsg gpsOnOff](self, "gpsOnOff");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("GPSOnOffStateHistogram"));

  -[PLBBMavLogMsg gpsDPOOnOff](self, "gpsDPOOnOff");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, CFSTR("GPSDPOOnOffStateHistogram"));

  -[PLBBMavLogMsg gpsDPOBin](self, "gpsDPOBin");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("GPSDPOBins"));

  -[PLBBMavLogMsg mpssCxoShutDownDuration](self, "mpssCxoShutDownDuration");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, CFSTR("MPSSCXOShutdownDuration"));

  -[PLBBMavLogMsg mpssCxoShutDownCount](self, "mpssCxoShutDownCount");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v37, CFSTR("MPSSCXOShutdownCount"));

  -[PLBBMavLogMsg mcpmVetoNumHistogram](self, "mcpmVetoNumHistogram");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v38, CFSTR("MCPMVetoNumHistogram"));

  -[PLBBMavLogMsg npaVetoMask](self, "npaVetoMask");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v39, CFSTR("NPAVetoMask"));

  -[PLBBMavLogMsg npaVetoClientNumHistogram](self, "npaVetoClientNumHistogram");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v40, CFSTR("NPAVetoClientNumHistogram"));

  -[PLBBMavLogMsg appsClockStateDurationStr](self, "appsClockStateDurationStr");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, CFSTR("AppsClockStateDurationStr"));

  -[PLBBMavLogMsg mpssClockStateDurationStr](self, "mpssClockStateDurationStr");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v42, CFSTR("MpssClockStateDurationStr"));

  -[PLBBMavLogMsg hsicStateSleepVetoNum](self, "hsicStateSleepVetoNum");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v43, CFSTR("HsicStateSleepVetoNum"));

}

- (void)refreshBBMav13HwOther
{
  void *v2;
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
  v2 = (void *)MEMORY[0x1D179C2E0](self, a2);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __38__PLBBMavLogMsg_refreshBBMav13HwOther__block_invoke;
    v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    v14 = v3;
    if (qword_1ED8856C0 != -1)
      dispatch_once(&qword_1ED8856C0, &block);
    if (byte_1ED885570)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg refreshBBMav13HwOther]", block, v11, v12, v13, v14);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg refreshBBMav13HwOther]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 1172);

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
  objc_autoreleasePoolPop(v2);
}

uint64_t __38__PLBBMavLogMsg_refreshBBMav13HwOther__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885570 = result;
  return result;
}

+ (id)entryEventMavBBMav13HwOther
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
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
  _QWORD v87[2];
  uint64_t v88;
  _QWORD v89[3];
  _QWORD v90[34];
  _QWORD v91[34];
  _QWORD v92[3];
  _QWORD v93[3];
  _QWORD v94[2];
  _QWORD v95[4];

  v95[2] = *MEMORY[0x1E0C80C00];
  v94[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v92[0] = *MEMORY[0x1E0D80318];
  v92[1] = v2;
  v93[0] = &unk_1E86539A0;
  v93[1] = CFSTR("refreshMavBBHwOther");
  v92[2] = *MEMORY[0x1E0D80308];
  v93[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 3);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v66;
  v94[1] = *MEMORY[0x1E0D802F0];
  v90[0] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "commonTypeDict_BoolFormat");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = v64;
  v90[1] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "commonTypeDict_IntegerFormat");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v91[1] = v62;
  v90[2] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "commonTypeDict_DateFormat");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v91[2] = v60;
  v90[3] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v91[3] = v58;
  v90[4] = CFSTR("SWRevision");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "commonTypeDict_IntegerFormat");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v91[4] = v56;
  v90[5] = CFSTR("HWRevision");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "commonTypeDict_IntegerFormat");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v91[5] = v54;
  v90[6] = CFSTR("HWStatsType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v91[6] = v52;
  v90[7] = CFSTR("HwStatsLength");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v91[7] = v50;
  v90[8] = CFSTR("HwStatsLevel");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "commonTypeDict_IntegerFormat");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v91[8] = v48;
  v90[9] = CFSTR("LastTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v91[9] = v46;
  v90[10] = CFSTR("CurrentTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v91[10] = v44;
  v90[11] = CFSTR("LogDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v91[11] = v42;
  v90[12] = CFSTR("RPMXOShutdownDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v91[12] = v40;
  v90[13] = CFSTR("RPMXOShutdownCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v91[13] = v38;
  v90[14] = CFSTR("RPMVDDMinDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v91[14] = v36;
  v90[15] = CFSTR("RPMVDDMinEnterCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v91[15] = v34;
  v90[16] = CFSTR("AppsPerfStateCountHistogram");
  v4 = *MEMORY[0x1E0D80348];
  v87[0] = *MEMORY[0x1E0D80358];
  v3 = v87[0];
  v87[1] = v4;
  v89[0] = &unk_1E8634EF0;
  v89[1] = &unk_1E8634F08;
  v88 = *MEMORY[0x1E0D80350];
  v5 = v88;
  v89[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v87, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v91[16] = v33;
  v90[17] = CFSTR("CXOShutdownDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_IntegerFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v91[17] = v31;
  v90[18] = CFSTR("CXOShutdownCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v91[18] = v29;
  v90[19] = CFSTR("LPASSOnOffStateHistogram");
  v85[0] = v3;
  v85[1] = v4;
  v86[0] = &unk_1E8634EF0;
  v86[1] = &unk_1E8634F50;
  v85[2] = v5;
  v86[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v91[19] = v28;
  v90[20] = CFSTR("APPSSleepVetoState");
  v83[0] = v3;
  v83[1] = v4;
  v84[0] = &unk_1E8634EF0;
  v84[1] = &unk_1E8635058;
  v83[2] = v5;
  v84[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v91[20] = v27;
  v90[21] = CFSTR("MPSSSleepVetoHistogram");
  v81[0] = v3;
  v81[1] = v4;
  v82[0] = &unk_1E8634EF0;
  v82[1] = &unk_1E8635088;
  v81[2] = v5;
  v82[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v91[21] = v26;
  v90[22] = CFSTR("QDSPConfigCountHistogram");
  v79[0] = v3;
  v79[1] = v4;
  v80[0] = &unk_1E8634EF0;
  v80[1] = &unk_1E8635010;
  v79[2] = v5;
  v80[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v91[22] = v25;
  v90[23] = CFSTR("GPSOnOffStateHistogram");
  v77[0] = v3;
  v77[1] = v4;
  v78[0] = &unk_1E8634EF0;
  v78[1] = &unk_1E8634F50;
  v77[2] = v5;
  v78[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v91[23] = v24;
  v90[24] = CFSTR("GPSDPOOnOffStateHistogram");
  v75[0] = v3;
  v75[1] = v4;
  v76[0] = &unk_1E8634EF0;
  v76[1] = &unk_1E8634F50;
  v75[2] = v5;
  v76[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v91[24] = v23;
  v90[25] = CFSTR("GPSDPOBins");
  v73[0] = v3;
  v73[1] = v4;
  v74[0] = &unk_1E8634EF0;
  v74[1] = &unk_1E8634F08;
  v73[2] = v5;
  v74[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v91[25] = v22;
  v90[26] = CFSTR("MPSSCXOShutdownDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v91[26] = v20;
  v90[27] = CFSTR("MPSSCXOShutdownCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v91[27] = v18;
  v90[28] = CFSTR("MCPMVetoNumHistogram");
  v71[0] = v3;
  v71[1] = v4;
  v72[0] = &unk_1E8634EF0;
  v72[1] = &unk_1E8635010;
  v71[2] = v5;
  v72[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v91[28] = v17;
  v90[29] = CFSTR("NPAVetoMask");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v91[29] = v15;
  v90[30] = CFSTR("NPAVetoClientNumHistogram");
  v69[0] = v3;
  v69[1] = v4;
  v70[0] = &unk_1E8634EF0;
  v70[1] = &unk_1E8634F98;
  v69[2] = v5;
  v70[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v91[30] = v6;
  v90[31] = CFSTR("AppsClockStateDurationStr");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v91[31] = v8;
  v90[32] = CFSTR("MpssClockStateDurationStr");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v91[32] = v10;
  v90[33] = CFSTR("PCIEStateHistogram");
  v67[0] = v3;
  v67[1] = v4;
  v68[0] = &unk_1E8634EF0;
  v68[1] = &unk_1E8634F38;
  v67[2] = v5;
  v68[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v91[33] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 34);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v95[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)logEventBackwardMav13BBHwOther
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLBBMavLogMsg_logEventBackwardMav13BBHwOther__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED8856C8 != -1)
      dispatch_once(&qword_1ED8856C8, block);
    if (byte_1ED885571)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg logEventBackwardMav13BBHwOther]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg logEventBackwardMav13BBHwOther]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1247);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v4 = MEMORY[0x1E0C809B0];
    }
  }
  v11 = *MEMORY[0x1E0D80370];
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MavBBHwOther"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v12);
  -[PLBBMavLogMsg populateEntryBBMav13HwOther:](self, "populateEntryBBMav13HwOther:", v13);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v20[0] = v4;
    v20[1] = 3221225472;
    v20[2] = __47__PLBBMavLogMsg_logEventBackwardMav13BBHwOther__block_invoke_391;
    v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v20[4] = objc_opt_class();
    if (qword_1ED8856D0 != -1)
      dispatch_once(&qword_1ED8856D0, v20);
    if (byte_1ED885572)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("About to send to log at %s"), "-[PLBBMavLogMsg logEventBackwardMav13BBHwOther]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg logEventBackwardMav13BBHwOther]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 1253);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v14;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBMavLogMsg sendAndLogPLEntry:withName:withType:](self, "sendAndLogPLEntry:withName:withType:", v13, CFSTR("MavBBHwOther"), v11);

}

uint64_t __47__PLBBMavLogMsg_logEventBackwardMav13BBHwOther__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885571 = result;
  return result;
}

uint64_t __47__PLBBMavLogMsg_logEventBackwardMav13BBHwOther__block_invoke_391(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885572 = result;
  return result;
}

- (void)addToGroupPLBBMav13HwOther
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
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __43__PLBBMavLogMsg_addToGroupPLBBMav13HwOther__block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v3;
    if (qword_1ED8856D8 != -1)
      dispatch_once(&qword_1ED8856D8, &block);
    if (byte_1ED885573)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg addToGroupPLBBMav13HwOther]", block, v13, v14, v15, v16);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg addToGroupPLBBMav13HwOther]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 1262);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MavBBHwOther"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  -[PLBBMavLogMsg setGroupEntryKey:](self, "setGroupEntryKey:", v10);
  -[PLBBMavLogMsg populateEntryBBMav13HwOther:](self, "populateEntryBBMav13HwOther:", v11);
  -[PLBBMavLogMsg addToGroupPLBBMavHwEntry:withEntryKey:](self, "addToGroupPLBBMavHwEntry:withEntryKey:", v11, v10);

}

uint64_t __43__PLBBMavLogMsg_addToGroupPLBBMav13HwOther__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885573 = result;
  return result;
}

- (void)populateEntryBBMav13HwOther:(id)a3
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
  id v35;

  v4 = a3;
  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("BBDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("BBDate"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("BBDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertFromBasebandToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEntryDate:", v9);

  -[PLBBMavLogMsg bbSwRev](self, "bbSwRev");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("SWRevision"));

  -[PLBBMavLogMsg bbHwRev](self, "bbHwRev");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("HWRevision"));

  -[PLBBMavLogMsg bbHwStatsType](self, "bbHwStatsType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("HWStatsType"));

  -[PLBBMavLogMsg bbHwStatsLength](self, "bbHwStatsLength");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("HwStatsLength"));

  -[PLBBMavLogMsg bbHwStatsLevel](self, "bbHwStatsLevel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("HwStatsLevel"));

  -[PLBBMavLogMsg bbHwCurrTimeStamp](self, "bbHwCurrTimeStamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("CurrentTimestamp"));

  -[PLBBMavLogMsg bbHwLastTimeStamp](self, "bbHwLastTimeStamp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("LastTimestamp"));

  -[PLBBMavLogMsg bbHwLogDurationInTicks](self, "bbHwLogDurationInTicks");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("LogDuration"));

  -[PLBBMavLogMsg rpmXOShutDuration](self, "rpmXOShutDuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("RPMXOShutdownDuration"));

  -[PLBBMavLogMsg rpmXOShutCnt](self, "rpmXOShutCnt");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("RPMXOShutdownCount"));

  -[PLBBMavLogMsg rpmVDDMinDuration](self, "rpmVDDMinDuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("RPMVDDMinDuration"));

  -[PLBBMavLogMsg rpmVDDMinEnterCnt](self, "rpmVDDMinEnterCnt");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("RPMVDDMinEnterCount"));

  -[PLBBMavLogMsg appsPerfStateCountHist](self, "appsPerfStateCountHist");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("AppsPerfStateCountHistogram"));

  -[PLBBMavLogMsg cxoShutDownDuration](self, "cxoShutDownDuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("CXOShutdownDuration"));

  -[PLBBMavLogMsg cxoShutDownCount](self, "cxoShutDownCount");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("CXOShutdownCount"));

  -[PLBBMavLogMsg lpassOnOffState](self, "lpassOnOffState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("LPASSOnOffStateHistogram"));

  -[PLBBMavLogMsg appsSleepVeto](self, "appsSleepVeto");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("APPSSleepVetoState"));

  -[PLBBMavLogMsg mpssSleepVeto](self, "mpssSleepVeto");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("MPSSSleepVetoHistogram"));

  -[PLBBMavLogMsg qdspConfigCount](self, "qdspConfigCount");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("QDSPConfigCountHistogram"));

  -[PLBBMavLogMsg gpsOnOff](self, "gpsOnOff");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("GPSOnOffStateHistogram"));

  -[PLBBMavLogMsg gpsDPOOnOff](self, "gpsDPOOnOff");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("GPSDPOOnOffStateHistogram"));

  -[PLBBMavLogMsg gpsDPOBin](self, "gpsDPOBin");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, CFSTR("GPSDPOBins"));

  -[PLBBMavLogMsg mpssCxoShutDownDuration](self, "mpssCxoShutDownDuration");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("MPSSCXOShutdownDuration"));

  -[PLBBMavLogMsg mpssCxoShutDownCount](self, "mpssCxoShutDownCount");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("MPSSCXOShutdownCount"));

  -[PLBBMavLogMsg mcpmVetoNumHistogram](self, "mcpmVetoNumHistogram");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, CFSTR("MCPMVetoNumHistogram"));

  -[PLBBMavLogMsg pcieStateHistogram](self, "pcieStateHistogram");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("PCIEStateHistogram"));

}

- (void)refreshBBMav16HwOther
{
  void *v2;
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
  v2 = (void *)MEMORY[0x1D179C2E0](self, a2);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __38__PLBBMavLogMsg_refreshBBMav16HwOther__block_invoke;
    v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    v14 = v3;
    if (qword_1ED8856E0 != -1)
      dispatch_once(&qword_1ED8856E0, &block);
    if (byte_1ED885574)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg refreshBBMav16HwOther]", block, v11, v12, v13, v14);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg refreshBBMav16HwOther]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 1329);

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
  objc_autoreleasePoolPop(v2);
}

uint64_t __38__PLBBMavLogMsg_refreshBBMav16HwOther__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885574 = result;
  return result;
}

+ (id)entryEventMavBBMav16HwOther
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
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
  _QWORD v87[2];
  uint64_t v88;
  _QWORD v89[3];
  _QWORD v90[34];
  _QWORD v91[34];
  _QWORD v92[3];
  _QWORD v93[3];
  _QWORD v94[2];
  _QWORD v95[4];

  v95[2] = *MEMORY[0x1E0C80C00];
  v94[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v92[0] = *MEMORY[0x1E0D80318];
  v92[1] = v2;
  v93[0] = &unk_1E8635010;
  v93[1] = CFSTR("refreshMavBBHwOther");
  v92[2] = *MEMORY[0x1E0D80308];
  v93[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 3);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v66;
  v94[1] = *MEMORY[0x1E0D802F0];
  v90[0] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "commonTypeDict_BoolFormat");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = v64;
  v90[1] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "commonTypeDict_IntegerFormat");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v91[1] = v62;
  v90[2] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "commonTypeDict_DateFormat");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v91[2] = v60;
  v90[3] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "commonTypeDict_IntegerFormat");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v91[3] = v58;
  v90[4] = CFSTR("SWRevision");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "commonTypeDict_IntegerFormat");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v91[4] = v56;
  v90[5] = CFSTR("HWRevision");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "commonTypeDict_IntegerFormat");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v91[5] = v54;
  v90[6] = CFSTR("HWStatsType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v91[6] = v52;
  v90[7] = CFSTR("HwStatsLength");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v91[7] = v50;
  v90[8] = CFSTR("HwStatsLevel");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "commonTypeDict_IntegerFormat");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v91[8] = v48;
  v90[9] = CFSTR("LastTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v91[9] = v46;
  v90[10] = CFSTR("CurrentTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v91[10] = v44;
  v90[11] = CFSTR("LogDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v91[11] = v42;
  v90[12] = CFSTR("RPMXOShutdownDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v91[12] = v40;
  v90[13] = CFSTR("RPMXOShutdownCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v91[13] = v38;
  v90[14] = CFSTR("RPMVDDMinDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v91[14] = v36;
  v90[15] = CFSTR("RPMVDDMinEnterCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v91[15] = v34;
  v90[16] = CFSTR("AppsPerfStateCountHistogram");
  v4 = *MEMORY[0x1E0D80348];
  v87[0] = *MEMORY[0x1E0D80358];
  v3 = v87[0];
  v87[1] = v4;
  v89[0] = &unk_1E8634EF0;
  v89[1] = &unk_1E8635040;
  v88 = *MEMORY[0x1E0D80350];
  v5 = v88;
  v89[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v87, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v91[16] = v33;
  v90[17] = CFSTR("CXOShutdownDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_IntegerFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v91[17] = v31;
  v90[18] = CFSTR("CXOShutdownCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v91[18] = v29;
  v90[19] = CFSTR("LPASSOnOffStateHistogram");
  v85[0] = v3;
  v85[1] = v4;
  v86[0] = &unk_1E8634EF0;
  v86[1] = &unk_1E8634F50;
  v85[2] = v5;
  v86[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v91[19] = v28;
  v90[20] = CFSTR("APPSSleepVetoState");
  v83[0] = v3;
  v83[1] = v4;
  v84[0] = &unk_1E8634EF0;
  v84[1] = &unk_1E8634FC8;
  v83[2] = v5;
  v84[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v91[20] = v27;
  v90[21] = CFSTR("MPSSSleepVetoHistogram");
  v81[0] = v3;
  v81[1] = v4;
  v82[0] = &unk_1E8634EF0;
  v82[1] = &unk_1E86350A0;
  v81[2] = v5;
  v82[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v91[21] = v26;
  v90[22] = CFSTR("QDSPConfigCountHistogram");
  v79[0] = v3;
  v79[1] = v4;
  v80[0] = &unk_1E8634EF0;
  v80[1] = &unk_1E8635028;
  v79[2] = v5;
  v80[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v91[22] = v25;
  v90[23] = CFSTR("GPSOnOffStateHistogram");
  v77[0] = v3;
  v77[1] = v4;
  v78[0] = &unk_1E8634EF0;
  v78[1] = &unk_1E8634F50;
  v77[2] = v5;
  v78[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v91[23] = v24;
  v90[24] = CFSTR("GPSDPOOnOffStateHistogram");
  v75[0] = v3;
  v75[1] = v4;
  v76[0] = &unk_1E8634EF0;
  v76[1] = &unk_1E8634F50;
  v75[2] = v5;
  v76[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v91[24] = v23;
  v90[25] = CFSTR("GPSDPOBins");
  v73[0] = v3;
  v73[1] = v4;
  v74[0] = &unk_1E8634EF0;
  v74[1] = &unk_1E8634F08;
  v73[2] = v5;
  v74[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v91[25] = v22;
  v90[26] = CFSTR("MPSSCXOShutdownDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v91[26] = v20;
  v90[27] = CFSTR("MPSSCXOShutdownCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v91[27] = v18;
  v90[28] = CFSTR("MCPMVetoNumHistogram");
  v71[0] = v3;
  v71[1] = v4;
  v72[0] = &unk_1E8634EF0;
  v72[1] = &unk_1E8634FE0;
  v71[2] = v5;
  v72[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v91[28] = v17;
  v90[29] = CFSTR("NPAVetoMask");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v91[29] = v15;
  v90[30] = CFSTR("NPAVetoClientNumHistogram");
  v69[0] = v3;
  v69[1] = v4;
  v70[0] = &unk_1E8634EF0;
  v70[1] = &unk_1E8634F98;
  v69[2] = v5;
  v70[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v91[30] = v6;
  v90[31] = CFSTR("AppsClockStateDurationStr");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v91[31] = v8;
  v90[32] = CFSTR("MpssClockStateDurationStr");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v91[32] = v10;
  v90[33] = CFSTR("PCIEStateHistogram");
  v67[0] = v3;
  v67[1] = v4;
  v68[0] = &unk_1E8634EF0;
  v68[1] = &unk_1E8634F38;
  v67[2] = v5;
  v68[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v91[33] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 34);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v95[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)logEventBackwardMav16BBHwOther
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLBBMavLogMsg_logEventBackwardMav16BBHwOther__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED8856E8 != -1)
      dispatch_once(&qword_1ED8856E8, block);
    if (byte_1ED885575)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg logEventBackwardMav16BBHwOther]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg logEventBackwardMav16BBHwOther]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1405);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v4 = MEMORY[0x1E0C809B0];
    }
  }
  v11 = *MEMORY[0x1E0D80370];
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MavBBHwOther"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v12);
  -[PLBBMavLogMsg populateEntryBBMav16HwOther:](self, "populateEntryBBMav16HwOther:", v13);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v20[0] = v4;
    v20[1] = 3221225472;
    v20[2] = __47__PLBBMavLogMsg_logEventBackwardMav16BBHwOther__block_invoke_395;
    v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v20[4] = objc_opt_class();
    if (qword_1ED8856F0 != -1)
      dispatch_once(&qword_1ED8856F0, v20);
    if (byte_1ED885576)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("About to send to log at %s"), "-[PLBBMavLogMsg logEventBackwardMav16BBHwOther]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg logEventBackwardMav16BBHwOther]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 1411);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v14;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBMavLogMsg sendAndLogPLEntry:withName:withType:](self, "sendAndLogPLEntry:withName:withType:", v13, CFSTR("MavBBHwOther"), v11);

}

uint64_t __47__PLBBMavLogMsg_logEventBackwardMav16BBHwOther__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885575 = result;
  return result;
}

uint64_t __47__PLBBMavLogMsg_logEventBackwardMav16BBHwOther__block_invoke_395(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885576 = result;
  return result;
}

- (void)addToGroupPLBBMav16HwOther
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
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __43__PLBBMavLogMsg_addToGroupPLBBMav16HwOther__block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v3;
    if (qword_1ED8856F8 != -1)
      dispatch_once(&qword_1ED8856F8, &block);
    if (byte_1ED885577)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg addToGroupPLBBMav16HwOther]", block, v13, v14, v15, v16);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg addToGroupPLBBMav16HwOther]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 1420);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MavBBHwOther"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  -[PLBBMavLogMsg setGroupEntryKey:](self, "setGroupEntryKey:", v10);
  -[PLBBMavLogMsg populateEntryBBMav16HwOther:](self, "populateEntryBBMav16HwOther:", v11);
  -[PLBBMavLogMsg addToGroupPLBBMavHwEntry:withEntryKey:](self, "addToGroupPLBBMavHwEntry:withEntryKey:", v11, v10);

}

uint64_t __43__PLBBMavLogMsg_addToGroupPLBBMav16HwOther__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885577 = result;
  return result;
}

- (void)populateEntryBBMav16HwOther:(id)a3
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
  id v35;

  v4 = a3;
  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("BBDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("BBDate"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("BBDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertFromBasebandToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEntryDate:", v9);

  -[PLBBMavLogMsg bbSwRev](self, "bbSwRev");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("SWRevision"));

  -[PLBBMavLogMsg bbHwRev](self, "bbHwRev");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("HWRevision"));

  -[PLBBMavLogMsg bbHwStatsType](self, "bbHwStatsType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("HWStatsType"));

  -[PLBBMavLogMsg bbHwStatsLength](self, "bbHwStatsLength");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("HwStatsLength"));

  -[PLBBMavLogMsg bbHwStatsLevel](self, "bbHwStatsLevel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("HwStatsLevel"));

  -[PLBBMavLogMsg bbHwCurrTimeStamp](self, "bbHwCurrTimeStamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("CurrentTimestamp"));

  -[PLBBMavLogMsg bbHwLastTimeStamp](self, "bbHwLastTimeStamp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("LastTimestamp"));

  -[PLBBMavLogMsg bbHwLogDurationInTicks](self, "bbHwLogDurationInTicks");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("LogDuration"));

  -[PLBBMavLogMsg rpmXOShutDuration](self, "rpmXOShutDuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("RPMXOShutdownDuration"));

  -[PLBBMavLogMsg rpmXOShutCnt](self, "rpmXOShutCnt");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("RPMXOShutdownCount"));

  -[PLBBMavLogMsg rpmVDDMinDuration](self, "rpmVDDMinDuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("RPMVDDMinDuration"));

  -[PLBBMavLogMsg rpmVDDMinEnterCnt](self, "rpmVDDMinEnterCnt");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("RPMVDDMinEnterCount"));

  -[PLBBMavLogMsg appsPerfStateCountHist](self, "appsPerfStateCountHist");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("AppsPerfStateCountHistogram"));

  -[PLBBMavLogMsg cxoShutDownDuration](self, "cxoShutDownDuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("CXOShutdownDuration"));

  -[PLBBMavLogMsg cxoShutDownCount](self, "cxoShutDownCount");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("CXOShutdownCount"));

  -[PLBBMavLogMsg lpassOnOffState](self, "lpassOnOffState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("LPASSOnOffStateHistogram"));

  -[PLBBMavLogMsg appsSleepVeto](self, "appsSleepVeto");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("APPSSleepVetoState"));

  -[PLBBMavLogMsg mpssSleepVeto](self, "mpssSleepVeto");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("MPSSSleepVetoHistogram"));

  -[PLBBMavLogMsg qdspConfigCount](self, "qdspConfigCount");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("QDSPConfigCountHistogram"));

  -[PLBBMavLogMsg gpsOnOff](self, "gpsOnOff");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("GPSOnOffStateHistogram"));

  -[PLBBMavLogMsg gpsDPOOnOff](self, "gpsDPOOnOff");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("GPSDPOOnOffStateHistogram"));

  -[PLBBMavLogMsg gpsDPOBin](self, "gpsDPOBin");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, CFSTR("GPSDPOBins"));

  -[PLBBMavLogMsg mpssCxoShutDownDuration](self, "mpssCxoShutDownDuration");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("MPSSCXOShutdownDuration"));

  -[PLBBMavLogMsg mpssCxoShutDownCount](self, "mpssCxoShutDownCount");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("MPSSCXOShutdownCount"));

  -[PLBBMavLogMsg mcpmVetoNumHistogram](self, "mcpmVetoNumHistogram");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, CFSTR("MCPMVetoNumHistogram"));

  -[PLBBMavLogMsg pcieStateHistogram](self, "pcieStateHistogram");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("PCIEStateHistogram"));

}

- (void)refreshBBMav16BHwOther
{
  void *v2;
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
  v2 = (void *)MEMORY[0x1D179C2E0](self, a2);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __39__PLBBMavLogMsg_refreshBBMav16BHwOther__block_invoke;
    v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    v14 = v3;
    if (qword_1ED885700 != -1)
      dispatch_once(&qword_1ED885700, &block);
    if (byte_1ED885578)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg refreshBBMav16BHwOther]", block, v11, v12, v13, v14);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg refreshBBMav16BHwOther]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 1487);

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
  objc_autoreleasePoolPop(v2);
}

uint64_t __39__PLBBMavLogMsg_refreshBBMav16BHwOther__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885578 = result;
  return result;
}

+ (id)entryEventMavBBMav16BHwOther
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
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
  _QWORD v90[2];
  uint64_t v91;
  _QWORD v92[3];
  _QWORD v93[35];
  _QWORD v94[35];
  _QWORD v95[3];
  _QWORD v96[3];
  _QWORD v97[2];
  _QWORD v98[4];

  v98[2] = *MEMORY[0x1E0C80C00];
  v97[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802F8];
  v95[0] = *MEMORY[0x1E0D80318];
  v95[1] = v2;
  v96[0] = &unk_1E8634FE0;
  v96[1] = CFSTR("refreshMavBBHwOther");
  v95[2] = *MEMORY[0x1E0D80308];
  v96[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 3);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v67;
  v97[1] = *MEMORY[0x1E0D802F0];
  v93[0] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "commonTypeDict_BoolFormat");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = v65;
  v93[1] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "commonTypeDict_IntegerFormat");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v94[1] = v63;
  v93[2] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "commonTypeDict_DateFormat");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v94[2] = v61;
  v93[3] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "commonTypeDict_IntegerFormat");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v94[3] = v59;
  v93[4] = CFSTR("SWRevision");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "commonTypeDict_IntegerFormat");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v94[4] = v57;
  v93[5] = CFSTR("HWRevision");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "commonTypeDict_IntegerFormat");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v94[5] = v55;
  v93[6] = CFSTR("HWStatsType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "commonTypeDict_IntegerFormat");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v94[6] = v53;
  v93[7] = CFSTR("HwStatsLength");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "commonTypeDict_IntegerFormat");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v94[7] = v51;
  v93[8] = CFSTR("HwStatsLevel");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v94[8] = v49;
  v93[9] = CFSTR("LastTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "commonTypeDict_IntegerFormat");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v94[9] = v47;
  v93[10] = CFSTR("CurrentTimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "commonTypeDict_IntegerFormat");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v94[10] = v45;
  v93[11] = CFSTR("LogDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "commonTypeDict_IntegerFormat");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v94[11] = v43;
  v93[12] = CFSTR("RPMXOShutdownDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "commonTypeDict_IntegerFormat");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v94[12] = v41;
  v93[13] = CFSTR("RPMXOShutdownCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "commonTypeDict_IntegerFormat");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v94[13] = v39;
  v93[14] = CFSTR("RPMVDDMinDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "commonTypeDict_IntegerFormat");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v94[14] = v37;
  v93[15] = CFSTR("RPMVDDMinEnterCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "commonTypeDict_IntegerFormat");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v94[15] = v35;
  v93[16] = CFSTR("AppsPerfStateCountHistogram");
  v4 = *MEMORY[0x1E0D80348];
  v90[0] = *MEMORY[0x1E0D80358];
  v3 = v90[0];
  v90[1] = v4;
  v92[0] = &unk_1E8634EF0;
  v92[1] = &unk_1E8634FB0;
  v91 = *MEMORY[0x1E0D80350];
  v5 = v91;
  v92[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v90, 3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v94[16] = v34;
  v93[17] = CFSTR("CXOShutdownDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v94[17] = v32;
  v93[18] = CFSTR("CXOShutdownCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v94[18] = v30;
  v93[19] = CFSTR("LPASSOnOffStateHistogram");
  v88[0] = v3;
  v88[1] = v4;
  v89[0] = &unk_1E8634EF0;
  v89[1] = &unk_1E8634F50;
  v88[2] = v5;
  v89[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v94[19] = v29;
  v93[20] = CFSTR("APPSSleepVetoState");
  v86[0] = v3;
  v86[1] = v4;
  v87[0] = &unk_1E8634EF0;
  v87[1] = &unk_1E8634FC8;
  v86[2] = v5;
  v87[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v94[20] = v28;
  v93[21] = CFSTR("MPSSSleepVetoHistogram");
  v84[0] = v3;
  v84[1] = v4;
  v85[0] = &unk_1E8634EF0;
  v85[1] = &unk_1E86350A0;
  v84[2] = v5;
  v85[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v94[21] = v27;
  v93[22] = CFSTR("QDSPConfigCountHistogram");
  v82[0] = v3;
  v82[1] = v4;
  v83[0] = &unk_1E8634EF0;
  v83[1] = &unk_1E8635028;
  v82[2] = v5;
  v83[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v94[22] = v26;
  v93[23] = CFSTR("GPSOnOffStateHistogram");
  v80[0] = v3;
  v80[1] = v4;
  v81[0] = &unk_1E8634EF0;
  v81[1] = &unk_1E8634F50;
  v80[2] = v5;
  v81[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v94[23] = v25;
  v93[24] = CFSTR("GPSDPOOnOffStateHistogram");
  v78[0] = v3;
  v78[1] = v4;
  v79[0] = &unk_1E8634EF0;
  v79[1] = &unk_1E8634F50;
  v78[2] = v5;
  v79[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v94[24] = v24;
  v93[25] = CFSTR("GPSDPOBins");
  v76[0] = v3;
  v76[1] = v4;
  v77[0] = &unk_1E8634EF0;
  v77[1] = &unk_1E8634F08;
  v76[2] = v5;
  v77[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v94[25] = v23;
  v93[26] = CFSTR("MPSSCXOShutdownDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v94[26] = v21;
  v93[27] = CFSTR("MPSSCXOShutdownCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v94[27] = v19;
  v93[28] = CFSTR("MCPMVetoNumHistogram");
  v74[0] = v3;
  v74[1] = v4;
  v75[0] = &unk_1E8634EF0;
  v75[1] = &unk_1E86350B8;
  v74[2] = v5;
  v75[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v75, v74, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v94[28] = v18;
  v93[29] = CFSTR("ProtocolActivityHistogram");
  v72[0] = v3;
  v72[1] = v4;
  v73[0] = &unk_1E8634EF0;
  v73[1] = &unk_1E8634F08;
  v72[2] = v5;
  v73[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v94[29] = v17;
  v93[30] = CFSTR("NPAVetoMask");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v94[30] = v15;
  v93[31] = CFSTR("NPAVetoClientNumHistogram");
  v70[0] = v3;
  v70[1] = v4;
  v71[0] = &unk_1E8634EF0;
  v71[1] = &unk_1E8634F98;
  v70[2] = v5;
  v71[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v94[31] = v6;
  v93[32] = CFSTR("AppsClockStateDurationStr");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v94[32] = v8;
  v93[33] = CFSTR("MpssClockStateDurationStr");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v94[33] = v10;
  v93[34] = CFSTR("PCIEStateHistogram");
  v68[0] = v3;
  v68[1] = v4;
  v69[0] = &unk_1E8634EF0;
  v69[1] = &unk_1E8634F38;
  v68[2] = v5;
  v69[2] = &unk_1E8634F20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v94[34] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 35);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v98[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)logEventBackwardMav16BBBHwOther
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PLBBMavLogMsg_logEventBackwardMav16BBBHwOther__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED885708 != -1)
      dispatch_once(&qword_1ED885708, block);
    if (byte_1ED885579)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg logEventBackwardMav16BBBHwOther]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg logEventBackwardMav16BBBHwOther]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1566);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v4 = MEMORY[0x1E0C809B0];
    }
  }
  v11 = *MEMORY[0x1E0D80370];
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MavBBHwOther"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v12);
  -[PLBBMavLogMsg populateEntryBBMav16BHwOther:](self, "populateEntryBBMav16BHwOther:", v13);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v20[0] = v4;
    v20[1] = 3221225472;
    v20[2] = __48__PLBBMavLogMsg_logEventBackwardMav16BBBHwOther__block_invoke_401;
    v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v20[4] = objc_opt_class();
    if (qword_1ED885710 != -1)
      dispatch_once(&qword_1ED885710, v20);
    if (byte_1ED88557A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("About to send to log at %s"), "-[PLBBMavLogMsg logEventBackwardMav16BBBHwOther]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg logEventBackwardMav16BBBHwOther]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 1572);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v14;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBMavLogMsg sendAndLogPLEntry:withName:withType:](self, "sendAndLogPLEntry:withName:withType:", v13, CFSTR("MavBBHwOther"), v11);

}

uint64_t __48__PLBBMavLogMsg_logEventBackwardMav16BBBHwOther__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885579 = result;
  return result;
}

uint64_t __48__PLBBMavLogMsg_logEventBackwardMav16BBBHwOther__block_invoke_401(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88557A = result;
  return result;
}

- (void)addToGroupPLBBMav16BHwOther
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
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __44__PLBBMavLogMsg_addToGroupPLBBMav16BHwOther__block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v3;
    if (qword_1ED885718 != -1)
      dispatch_once(&qword_1ED885718, &block);
    if (byte_1ED88557B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavLogMsg addToGroupPLBBMav16BHwOther]", block, v13, v14, v15, v16);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavLogMsg addToGroupPLBBMav16BHwOther]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 1581);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("MavBBHwOther"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  -[PLBBMavLogMsg setGroupEntryKey:](self, "setGroupEntryKey:", v10);
  -[PLBBMavLogMsg populateEntryBBMav16BHwOther:](self, "populateEntryBBMav16BHwOther:", v11);
  -[PLBBMavLogMsg addToGroupPLBBMavHwEntry:withEntryKey:](self, "addToGroupPLBBMavHwEntry:withEntryKey:", v11, v10);

}

uint64_t __44__PLBBMavLogMsg_addToGroupPLBBMav16BHwOther__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88557B = result;
  return result;
}

- (void)populateEntryBBMav16BHwOther:(id)a3
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
  id v36;

  v4 = a3;
  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("BBDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("BBDate"));

  -[PLBBMavLogMsg commonInfo](self, "commonInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("BBDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertFromBasebandToMonotonic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEntryDate:", v9);

  -[PLBBMavLogMsg bbSwRev](self, "bbSwRev");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("SWRevision"));

  -[PLBBMavLogMsg bbHwRev](self, "bbHwRev");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("HWRevision"));

  -[PLBBMavLogMsg bbHwStatsType](self, "bbHwStatsType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("HWStatsType"));

  -[PLBBMavLogMsg bbHwStatsLength](self, "bbHwStatsLength");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("HwStatsLength"));

  -[PLBBMavLogMsg bbHwStatsLevel](self, "bbHwStatsLevel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("HwStatsLevel"));

  -[PLBBMavLogMsg bbHwCurrTimeStamp](self, "bbHwCurrTimeStamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("CurrentTimestamp"));

  -[PLBBMavLogMsg bbHwLastTimeStamp](self, "bbHwLastTimeStamp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("LastTimestamp"));

  -[PLBBMavLogMsg bbHwLogDurationInTicks](self, "bbHwLogDurationInTicks");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("LogDuration"));

  -[PLBBMavLogMsg rpmXOShutDuration](self, "rpmXOShutDuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("RPMXOShutdownDuration"));

  -[PLBBMavLogMsg rpmXOShutCnt](self, "rpmXOShutCnt");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("RPMXOShutdownCount"));

  -[PLBBMavLogMsg rpmVDDMinDuration](self, "rpmVDDMinDuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("RPMVDDMinDuration"));

  -[PLBBMavLogMsg rpmVDDMinEnterCnt](self, "rpmVDDMinEnterCnt");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("RPMVDDMinEnterCount"));

  -[PLBBMavLogMsg appsPerfStateCountHist](self, "appsPerfStateCountHist");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("AppsPerfStateCountHistogram"));

  -[PLBBMavLogMsg cxoShutDownDuration](self, "cxoShutDownDuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("CXOShutdownDuration"));

  -[PLBBMavLogMsg cxoShutDownCount](self, "cxoShutDownCount");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("CXOShutdownCount"));

  -[PLBBMavLogMsg lpassOnOffState](self, "lpassOnOffState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("LPASSOnOffStateHistogram"));

  -[PLBBMavLogMsg appsSleepVeto](self, "appsSleepVeto");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("APPSSleepVetoState"));

  -[PLBBMavLogMsg mpssSleepVeto](self, "mpssSleepVeto");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, CFSTR("MPSSSleepVetoHistogram"));

  -[PLBBMavLogMsg qdspConfigCount](self, "qdspConfigCount");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("QDSPConfigCountHistogram"));

  -[PLBBMavLogMsg gpsOnOff](self, "gpsOnOff");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("GPSOnOffStateHistogram"));

  -[PLBBMavLogMsg gpsDPOOnOff](self, "gpsDPOOnOff");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("GPSDPOOnOffStateHistogram"));

  -[PLBBMavLogMsg gpsDPOBin](self, "gpsDPOBin");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, CFSTR("GPSDPOBins"));

  -[PLBBMavLogMsg mpssCxoShutDownDuration](self, "mpssCxoShutDownDuration");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v32, CFSTR("MPSSCXOShutdownDuration"));

  -[PLBBMavLogMsg mpssCxoShutDownCount](self, "mpssCxoShutDownCount");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v33, CFSTR("MPSSCXOShutdownCount"));

  -[PLBBMavLogMsg mcpmVetoNumHistogram](self, "mcpmVetoNumHistogram");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v34, CFSTR("MCPMVetoNumHistogram"));

  -[PLBBMavLogMsg ProtocolActivityHistogram](self, "ProtocolActivityHistogram");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("ProtocolActivityHistogram"));

  -[PLBBMavLogMsg pcieStateHistogram](self, "pcieStateHistogram");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v36, CFSTR("PCIEStateHistogram"));

}

- (NSDate)bbDate
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBbDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)bbTimeCal
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setBbTimeCal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSNumber)bbSeqNum
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setBbSeqNum:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSNumber)bbHwMsgType
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setBbHwMsgType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSNumber)bbSwRev
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBbSwRev:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSNumber)bbHwRev
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setBbHwRev:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSNumber)bbHwStatsType
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setBbHwStatsType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSNumber)bbHwStatsLength
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setBbHwStatsLength:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSNumber)bbHwStatsLevel
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setBbHwStatsLevel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSNumber)bbHwCurrTimeStamp
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setBbHwCurrTimeStamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSNumber)bbHwLastTimeStamp
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setBbHwLastTimeStamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSNumber)bbHwLogDurationInTicks
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setBbHwLogDurationInTicks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSArray)bbHwProcSystemState
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setBbHwProcSystemState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSArray)bbHwProcArmPerfState
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setBbHwProcArmPerfState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSArray)bbHwModemAppMdspState
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setBbHwModemAppMdspState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSArray)bbHwModemAppMdspClockState
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (void)setBbHwModemAppMdspClockState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSArray)bbHwModemAppMdmState
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (void)setBbHwModemAppMdmState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSArray)bbHwModemAppMdmSpeed
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (void)setBbHwModemAppMdmSpeed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSArray)bbHwModemAppQ6FwSpeed
{
  return (NSArray *)objc_getProperty(self, a2, 240, 1);
}

- (void)setBbHwModemAppQ6FwSpeed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSArray)bbHwModemAppQ6SwSpeed
{
  return (NSArray *)objc_getProperty(self, a2, 248, 1);
}

- (void)setBbHwModemAppQ6SwSpeed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSArray)bbHwModemAppMdspSpeed
{
  return (NSArray *)objc_getProperty(self, a2, 256, 1);
}

- (void)setBbHwModemAppMdspSpeed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSArray)bbHwModemAppQdspSpeed
{
  return (NSArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setBbHwModemAppQdspSpeed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (NSArray)bbHwModemAppAdspState
{
  return (NSArray *)objc_getProperty(self, a2, 272, 1);
}

- (void)setBbHwModemAppAdspState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSArray)bbHwModemAppAdspClockState
{
  return (NSArray *)objc_getProperty(self, a2, 280, 1);
}

- (void)setBbHwModemAppAdspClockState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSArray)bbHwModemAppAdspSpeed
{
  return (NSArray *)objc_getProperty(self, a2, 288, 1);
}

- (void)setBbHwModemAppAdspSpeed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (NSArray)bbHwModemAppAdmState
{
  return (NSArray *)objc_getProperty(self, a2, 296, 1);
}

- (void)setBbHwModemAppAdmState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
}

- (NSArray)bbHwPeripheralUSBState
{
  return (NSArray *)objc_getProperty(self, a2, 304, 1);
}

- (void)setBbHwPeripheralUSBState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (NSArray)bbHwPeripheralSPIState
{
  return (NSArray *)objc_getProperty(self, a2, 312, 1);
}

- (void)setBbHwPeripheralSPIState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 312);
}

- (NSArray)bbHwPeripheralGPSState
{
  return (NSArray *)objc_getProperty(self, a2, 320, 1);
}

- (void)setBbHwPeripheralGPSState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (NSArray)bbHwPeripheralUARTState
{
  return (NSArray *)objc_getProperty(self, a2, 328, 1);
}

- (void)setBbHwPeripheralUARTState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (NSArray)bbHwSleepVetoClientListQdsp
{
  return (NSArray *)objc_getProperty(self, a2, 336, 1);
}

- (void)setBbHwSleepVetoClientListQdsp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (NSArray)bbHwSleepVetoClientListArm
{
  return (NSArray *)objc_getProperty(self, a2, 344, 1);
}

- (void)setBbHwSleepVetoClientListArm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (NSNumber)rpmXOShutDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 352, 1);
}

- (void)setRpmXOShutDuration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (NSNumber)rpmXOShutCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 360, 1);
}

- (void)setRpmXOShutCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 360);
}

- (NSNumber)rpmVDDMinEnterCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 368, 1);
}

- (void)setRpmVDDMinEnterCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (NSNumber)rpmVDDMinDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 376, 1);
}

- (void)setRpmVDDMinDuration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (NSArray)appsPerfStateCountHist
{
  return (NSArray *)objc_getProperty(self, a2, 384, 1);
}

- (void)setAppsPerfStateCountHist:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (NSNumber)cxoShutDownDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 392, 1);
}

- (void)setCxoShutDownDuration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (NSNumber)cxoShutDownCount
{
  return (NSNumber *)objc_getProperty(self, a2, 400, 1);
}

- (void)setCxoShutDownCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (NSArray)usbStateCountHist
{
  return (NSArray *)objc_getProperty(self, a2, 408, 1);
}

- (void)setUsbStateCountHist:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (NSArray)uartOnOffState
{
  return (NSArray *)objc_getProperty(self, a2, 416, 1);
}

- (void)setUartOnOffState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (NSArray)spiOnOffState
{
  return (NSArray *)objc_getProperty(self, a2, 424, 1);
}

- (void)setSpiOnOffState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (NSArray)admOnOffState
{
  return (NSArray *)objc_getProperty(self, a2, 432, 1);
}

- (void)setAdmOnOffState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 432);
}

- (NSArray)lpassOnOffState
{
  return (NSArray *)objc_getProperty(self, a2, 440, 1);
}

- (void)setLpassOnOffState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (NSArray)appsSleepVeto
{
  return (NSArray *)objc_getProperty(self, a2, 448, 1);
}

- (void)setAppsSleepVeto:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (NSArray)mpssSleepVeto
{
  return (NSArray *)objc_getProperty(self, a2, 456, 1);
}

- (void)setMpssSleepVeto:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (NSArray)mdspConfigCount
{
  return (NSArray *)objc_getProperty(self, a2, 464, 1);
}

- (void)setMdspConfigCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (NSArray)qdspConfigCount
{
  return (NSArray *)objc_getProperty(self, a2, 472, 1);
}

- (void)setQdspConfigCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 472);
}

- (NSArray)gpsOnOff
{
  return (NSArray *)objc_getProperty(self, a2, 480, 1);
}

- (void)setGpsOnOff:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
}

- (NSArray)gpsDPOOnOff
{
  return (NSArray *)objc_getProperty(self, a2, 488, 1);
}

- (void)setGpsDPOOnOff:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 488);
}

- (NSArray)gpsDPOBin
{
  return (NSArray *)objc_getProperty(self, a2, 496, 1);
}

- (void)setGpsDPOBin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 496);
}

- (NSNumber)mpssCxoShutDownDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 504, 1);
}

- (void)setMpssCxoShutDownDuration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 504);
}

- (NSNumber)mpssCxoShutDownCount
{
  return (NSNumber *)objc_getProperty(self, a2, 512, 1);
}

- (void)setMpssCxoShutDownCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 512);
}

- (NSArray)mcpmVetoNumHistogram
{
  return (NSArray *)objc_getProperty(self, a2, 520, 1);
}

- (void)setMcpmVetoNumHistogram:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 520);
}

- (NSArray)ProtocolActivityHistogram
{
  return (NSArray *)objc_getProperty(self, a2, 528, 1);
}

- (void)setProtocolActivityHistogram:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 528);
}

- (NSArray)pcieStateHistogram
{
  return (NSArray *)objc_getProperty(self, a2, 536, 1);
}

- (void)setPcieStateHistogram:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 536);
}

- (NSNumber)npaVetoMask
{
  return (NSNumber *)objc_getProperty(self, a2, 544, 1);
}

- (void)setNpaVetoMask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 544);
}

- (NSArray)npaVetoClientNumHistogram
{
  return (NSArray *)objc_getProperty(self, a2, 552, 1);
}

- (void)setNpaVetoClientNumHistogram:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 552);
}

- (NSString)appsClockStateDurationStr
{
  return (NSString *)objc_getProperty(self, a2, 560, 1);
}

- (void)setAppsClockStateDurationStr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 560);
}

- (NSString)mpssClockStateDurationStr
{
  return (NSString *)objc_getProperty(self, a2, 568, 1);
}

- (void)setMpssClockStateDurationStr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 568);
}

- (NSArray)hsicStateSleepVetoNum
{
  return (NSArray *)objc_getProperty(self, a2, 576, 1);
}

- (void)setHsicStateSleepVetoNum:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 576);
}

- (NSNumber)radioTech
{
  return (NSNumber *)objc_getProperty(self, a2, 584, 1);
}

- (void)setRadioTech:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 584);
}

- (NSArray)rssiModeCount
{
  return (NSArray *)objc_getProperty(self, a2, 592, 1);
}

- (void)setRssiModeCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 592);
}

- (NSArray)rx0RssiPowerHist
{
  return (NSArray *)objc_getProperty(self, a2, 600, 1);
}

- (void)setRx0RssiPowerHist:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 600);
}

- (NSArray)rx1RssiPowerHist
{
  return (NSArray *)objc_getProperty(self, a2, 608, 1);
}

- (void)setRx1RssiPowerHist:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 608);
}

- (NSArray)rx0SQAPowerHist
{
  return (NSArray *)objc_getProperty(self, a2, 616, 1);
}

- (void)setRx0SQAPowerHist:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 616);
}

- (NSArray)rx1SQAPowerHist
{
  return (NSArray *)objc_getProperty(self, a2, 624, 1);
}

- (void)setRx1SQAPowerHist:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 624);
}

- (NSArray)txPowerHist
{
  return (NSArray *)objc_getProperty(self, a2, 632, 1);
}

- (void)setTxPowerHist:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 632);
}

- (NSArray)protocolStateHist
{
  return (NSArray *)objc_getProperty(self, a2, 640, 1);
}

- (void)setProtocolStateHist:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 640);
}

- (NSDictionary)protocolStateHistDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 648, 1);
}

- (void)setProtocolStateHistDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 648);
}

- (NSArray)bbActive
{
  return (NSArray *)objc_getProperty(self, a2, 656, 1);
}

- (void)setBbActive:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 656);
}

- (NSArray)txPowerHist1x
{
  return (NSArray *)objc_getProperty(self, a2, 664, 1);
}

- (void)setTxPowerHist1x:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 664);
}

- (NSArray)txPowerHistEVDO
{
  return (NSArray *)objc_getProperty(self, a2, 672, 1);
}

- (void)setTxPowerHistEVDO:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 672);
}

- (NSNumber)txTicks
{
  return (NSNumber *)objc_getProperty(self, a2, 680, 1);
}

- (void)setTxTicks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 680);
}

- (NSNumber)rxTicks
{
  return (NSNumber *)objc_getProperty(self, a2, 688, 1);
}

- (void)setRxTicks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 688);
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

- (NSString)groupEntryKey
{
  return (NSString *)objc_getProperty(self, a2, 712, 1);
}

- (void)setGroupEntryKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 712);
}

- (NSString)groupID
{
  return (NSString *)objc_getProperty(self, a2, 720, 1);
}

- (void)setGroupID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 720);
}

- (NSMutableArray)groupArrEntries
{
  return (NSMutableArray *)objc_getProperty(self, a2, 728, 1);
}

- (void)setGroupArrEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 728);
}

- (NSMutableDictionary)groupDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 736, 1);
}

- (void)setGroupDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 736);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupDict, 0);
  objc_storeStrong((id *)&self->_groupArrEntries, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_groupEntryKey, 0);
  objc_storeStrong((id *)&self->_kvPairs, 0);
  objc_storeStrong((id *)&self->_commonInfo, 0);
  objc_storeStrong((id *)&self->_rxTicks, 0);
  objc_storeStrong((id *)&self->_txTicks, 0);
  objc_storeStrong((id *)&self->_txPowerHistEVDO, 0);
  objc_storeStrong((id *)&self->_txPowerHist1x, 0);
  objc_storeStrong((id *)&self->_bbActive, 0);
  objc_storeStrong((id *)&self->_protocolStateHistDict, 0);
  objc_storeStrong((id *)&self->_protocolStateHist, 0);
  objc_storeStrong((id *)&self->_txPowerHist, 0);
  objc_storeStrong((id *)&self->_rx1SQAPowerHist, 0);
  objc_storeStrong((id *)&self->_rx0SQAPowerHist, 0);
  objc_storeStrong((id *)&self->_rx1RssiPowerHist, 0);
  objc_storeStrong((id *)&self->_rx0RssiPowerHist, 0);
  objc_storeStrong((id *)&self->_rssiModeCount, 0);
  objc_storeStrong((id *)&self->_radioTech, 0);
  objc_storeStrong((id *)&self->_hsicStateSleepVetoNum, 0);
  objc_storeStrong((id *)&self->_mpssClockStateDurationStr, 0);
  objc_storeStrong((id *)&self->_appsClockStateDurationStr, 0);
  objc_storeStrong((id *)&self->_npaVetoClientNumHistogram, 0);
  objc_storeStrong((id *)&self->_npaVetoMask, 0);
  objc_storeStrong((id *)&self->_pcieStateHistogram, 0);
  objc_storeStrong((id *)&self->_ProtocolActivityHistogram, 0);
  objc_storeStrong((id *)&self->_mcpmVetoNumHistogram, 0);
  objc_storeStrong((id *)&self->_mpssCxoShutDownCount, 0);
  objc_storeStrong((id *)&self->_mpssCxoShutDownDuration, 0);
  objc_storeStrong((id *)&self->_gpsDPOBin, 0);
  objc_storeStrong((id *)&self->_gpsDPOOnOff, 0);
  objc_storeStrong((id *)&self->_gpsOnOff, 0);
  objc_storeStrong((id *)&self->_qdspConfigCount, 0);
  objc_storeStrong((id *)&self->_mdspConfigCount, 0);
  objc_storeStrong((id *)&self->_mpssSleepVeto, 0);
  objc_storeStrong((id *)&self->_appsSleepVeto, 0);
  objc_storeStrong((id *)&self->_lpassOnOffState, 0);
  objc_storeStrong((id *)&self->_admOnOffState, 0);
  objc_storeStrong((id *)&self->_spiOnOffState, 0);
  objc_storeStrong((id *)&self->_uartOnOffState, 0);
  objc_storeStrong((id *)&self->_usbStateCountHist, 0);
  objc_storeStrong((id *)&self->_cxoShutDownCount, 0);
  objc_storeStrong((id *)&self->_cxoShutDownDuration, 0);
  objc_storeStrong((id *)&self->_appsPerfStateCountHist, 0);
  objc_storeStrong((id *)&self->_rpmVDDMinDuration, 0);
  objc_storeStrong((id *)&self->_rpmVDDMinEnterCnt, 0);
  objc_storeStrong((id *)&self->_rpmXOShutCnt, 0);
  objc_storeStrong((id *)&self->_rpmXOShutDuration, 0);
  objc_storeStrong((id *)&self->_bbHwSleepVetoClientListArm, 0);
  objc_storeStrong((id *)&self->_bbHwSleepVetoClientListQdsp, 0);
  objc_storeStrong((id *)&self->_bbHwPeripheralUARTState, 0);
  objc_storeStrong((id *)&self->_bbHwPeripheralGPSState, 0);
  objc_storeStrong((id *)&self->_bbHwPeripheralSPIState, 0);
  objc_storeStrong((id *)&self->_bbHwPeripheralUSBState, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppAdmState, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppAdspSpeed, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppAdspClockState, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppAdspState, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppQdspSpeed, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppMdspSpeed, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppQ6SwSpeed, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppQ6FwSpeed, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppMdmSpeed, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppMdmState, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppMdspClockState, 0);
  objc_storeStrong((id *)&self->_bbHwModemAppMdspState, 0);
  objc_storeStrong((id *)&self->_bbHwProcArmPerfState, 0);
  objc_storeStrong((id *)&self->_bbHwProcSystemState, 0);
  objc_storeStrong((id *)&self->_bbHwLogDurationInTicks, 0);
  objc_storeStrong((id *)&self->_bbHwLastTimeStamp, 0);
  objc_storeStrong((id *)&self->_bbHwCurrTimeStamp, 0);
  objc_storeStrong((id *)&self->_bbHwStatsLevel, 0);
  objc_storeStrong((id *)&self->_bbHwStatsLength, 0);
  objc_storeStrong((id *)&self->_bbHwStatsType, 0);
  objc_storeStrong((id *)&self->_bbHwRev, 0);
  objc_storeStrong((id *)&self->_bbSwRev, 0);
  objc_storeStrong((id *)&self->_bbHwMsgType, 0);
  objc_storeStrong((id *)&self->_bbSeqNum, 0);
  objc_storeStrong((id *)&self->_bbTimeCal, 0);
  objc_storeStrong((id *)&self->_bbDate, 0);
}

@end
