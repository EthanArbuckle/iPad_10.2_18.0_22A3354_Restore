@implementation PLBBMsgRoot

- (PLBBMsgRoot)init
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  PLBBMsgRoot *v10;
  uint64_t v11;
  NSDictionary *msgEntry;
  uint64_t v13;
  NSDictionary *msgKVPairs;
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
    block[2] = __19__PLBBMsgRoot_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1ED887148 != -1)
      dispatch_once(&qword_1ED887148, block);
    if (_MergedGlobals_111)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMsgRoot init]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgRoot.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMsgRoot init]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 17);

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
  v16.super_class = (Class)PLBBMsgRoot;
  v10 = -[PLBBMsgRoot init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_opt_new();
    msgEntry = v10->_msgEntry;
    v10->_msgEntry = (NSDictionary *)v11;

    v13 = objc_opt_new();
    msgKVPairs = v10->_msgKVPairs;
    v10->_msgKVPairs = (NSDictionary *)v13;

  }
  return v10;
}

uint64_t __19__PLBBMsgRoot_init__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_111 = result;
  return result;
}

- (void)sendAndLogPLEntry:(id)a3 andOverride:(id)a4
{
  id v6;
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
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
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
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PLBBMsgRoot_sendAndLogPLEntry_andOverride___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (qword_1ED887150 != -1)
      dispatch_once(&qword_1ED887150, block);
    if (byte_1ED887141)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMsgRoot sendAndLogPLEntry:andOverride:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgRoot.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMsgRoot sendAndLogPLEntry:andOverride:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 34);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v14 = objc_opt_class();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __45__PLBBMsgRoot_sendAndLogPLEntry_andOverride___block_invoke_15;
    v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v35[4] = v14;
    if (qword_1ED887158 != -1)
      dispatch_once(&qword_1ED887158, v35);
    if (byte_1ED887142)
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "entryKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("Sending PLEntry: key=%@"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgRoot.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMsgRoot sendAndLogPLEntry:andOverride:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 35);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v17;
        _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBMsgRoot agent](self, "agent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23 && objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v24 = objc_opt_class();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __45__PLBBMsgRoot_sendAndLogPLEntry_andOverride___block_invoke_20;
    v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v34[4] = v24;
    if (qword_1ED887160 != -1)
      dispatch_once(&qword_1ED887160, v34);
    if (byte_1ED887143)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad agent"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgRoot.m");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "lastPathComponent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMsgRoot sendAndLogPLEntry:andOverride:]");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 38);

      PLLogCommon();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v25;
        _os_log_debug_impl(&dword_1CAF47000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (!a4)
  {
    objc_msgSend(0, "objectForKey:", CFSTR("Date"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v31)
    {
      objc_msgSend(0, "convertFromBasebandToMonotonic");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEntryDate:", v32);

    }
  }
  -[PLBBMsgRoot agent](self, "agent");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "logEntry:", v6);

}

uint64_t __45__PLBBMsgRoot_sendAndLogPLEntry_andOverride___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887141 = result;
  return result;
}

uint64_t __45__PLBBMsgRoot_sendAndLogPLEntry_andOverride___block_invoke_15(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887142 = result;
  return result;
}

uint64_t __45__PLBBMsgRoot_sendAndLogPLEntry_andOverride___block_invoke_20(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887143 = result;
  return result;
}

- (void)appendToMsgProcError:(id)a3
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
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __36__PLBBMsgRoot_appendToMsgProcError___block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v5;
    if (qword_1ED887168 != -1)
      dispatch_once(&qword_1ED887168, &block);
    if (byte_1ED887144)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMsgRoot appendToMsgProcError:]", block, v15, v16, v17, v18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgRoot.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMsgRoot appendToMsgProcError:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 52);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (v4)
  {
    -[PLBBMsgRoot msgProcErr](self, "msgProcErr");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "appendString:", v4);
  }

}

uint64_t __36__PLBBMsgRoot_appendToMsgProcError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887144 = result;
  return result;
}

- (NSString)msgName
{
  return self->_msgName;
}

- (void)setMsgName:(id)a3
{
  objc_storeStrong((id *)&self->_msgName, a3);
}

- (NSNumber)msgType
{
  return self->_msgType;
}

- (void)setMsgType:(id)a3
{
  objc_storeStrong((id *)&self->_msgType, a3);
}

- (NSString)msgPayload
{
  return self->_msgPayload;
}

- (void)setMsgPayload:(id)a3
{
  objc_storeStrong((id *)&self->_msgPayload, a3);
}

- (NSString)msgProcErr
{
  return self->_msgProcErr;
}

- (void)setMsgProcErr:(id)a3
{
  objc_storeStrong((id *)&self->_msgProcErr, a3);
}

- (NSDate)msgDate
{
  return self->_msgDate;
}

- (void)setMsgDate:(id)a3
{
  objc_storeStrong((id *)&self->_msgDate, a3);
}

- (NSDictionary)msgEntry
{
  return self->_msgEntry;
}

- (void)setMsgEntry:(id)a3
{
  objc_storeStrong((id *)&self->_msgEntry, a3);
}

- (NSDictionary)msgKVPairs
{
  return self->_msgKVPairs;
}

- (void)setMsgKVPairs:(id)a3
{
  objc_storeStrong((id *)&self->_msgKVPairs, a3);
}

- (PLAgent)agent
{
  return self->_agent;
}

- (void)setAgent:(id)a3
{
  objc_storeStrong((id *)&self->_agent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_msgKVPairs, 0);
  objc_storeStrong((id *)&self->_msgEntry, 0);
  objc_storeStrong((id *)&self->_msgDate, 0);
  objc_storeStrong((id *)&self->_msgProcErr, 0);
  objc_storeStrong((id *)&self->_msgPayload, 0);
  objc_storeStrong((id *)&self->_msgType, 0);
  objc_storeStrong((id *)&self->_msgName, 0);
}

@end
