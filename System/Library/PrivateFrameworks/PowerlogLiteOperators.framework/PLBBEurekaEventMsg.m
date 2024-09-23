@implementation PLBBEurekaEventMsg

- (PLBBEurekaEventMsg)init
{
  PLBBEurekaEventMsg *v2;
  id v3;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *commonInfo;
  NSMutableDictionary *v7;
  NSMutableDictionary *kvPairs;
  objc_super v10;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)PLBBEurekaEventMsg;
  v2 = -[PLBBEurekaEventMsg init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E08]);
    v11[0] = CFSTR("Validity");
    v11[1] = CFSTR("EventCode");
    v11[2] = CFSTR("Payload");
    v11[3] = CFSTR("Error");
    v11[4] = CFSTR("SeqNum");
    v11[5] = CFSTR("BBDate");
    v11[6] = CFSTR("TimeCal");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithObjects:forKeys:", &unk_1E8651398, v4);
    commonInfo = v2->_commonInfo;
    v2->_commonInfo = (NSMutableDictionary *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    kvPairs = v2->_kvPairs;
    v2->_kvPairs = v7;

    v2->_inited = 1;
  }
  return v2;
}

- (void)setEventCode:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
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

  v3 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__PLBBEurekaEventMsg_setEventCode___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED884B68 != -1)
      dispatch_once(&qword_1ED884B68, block);
    if (_MergedGlobals_1_49)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg setEventCode:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg setEventCode:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 85);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if ((_DWORD)v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v13 = objc_opt_class();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __35__PLBBEurekaEventMsg_setEventCode___block_invoke_35;
      v20[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v20[4] = v13;
      if (qword_1ED884B70 != -1)
        dispatch_once(&qword_1ED884B70, v20);
      if (byte_1ED884B41)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("set event code with %d"), v3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg setEventCode:]");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 93);

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
    -[NSMutableDictionary setValue:forKey:](self->_commonInfo, "setValue:forKey:", v12, CFSTR("EventCode"));

  }
}

uint64_t __35__PLBBEurekaEventMsg_setEventCode___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_49 = result;
  return result;
}

uint64_t __35__PLBBEurekaEventMsg_setEventCode___block_invoke_35(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B41 = result;
  return result;
}

- (void)setPayload:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  uint64_t v31;
  _QWORD v32[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__PLBBEurekaEventMsg_setPayload___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED884B78 != -1)
      dispatch_once(&qword_1ED884B78, block);
    if (byte_1ED884B42)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg setPayload:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg setPayload:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 102);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  if (v4)
  {
    if (v12)
    {
      v13 = objc_opt_class();
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __33__PLBBEurekaEventMsg_setPayload___block_invoke_45;
      v30 = &__block_descriptor_40_e5_v8__0lu32l8;
      v31 = v13;
      if (qword_1ED884B88 != -1)
        dispatch_once(&qword_1ED884B88, &v27);
      if (byte_1ED884B44)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("set payload with with %@"), v4, v27, v28, v29, v30, v31);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg setPayload:]");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 107);

        PLLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v14;
          _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[NSMutableDictionary setValue:forKey:](self->_commonInfo, "setValue:forKey:", v4, CFSTR("Payload"));
  }
  else if (v12)
  {
    v20 = objc_opt_class();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __33__PLBBEurekaEventMsg_setPayload___block_invoke_40;
    v32[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v32[4] = v20;
    if (qword_1ED884B80 != -1)
      dispatch_once(&qword_1ED884B80, v32);
    if (byte_1ED884B43)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bad payload"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg setPayload:]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 104);

      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v21;
        _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __33__PLBBEurekaEventMsg_setPayload___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B42 = result;
  return result;
}

uint64_t __33__PLBBEurekaEventMsg_setPayload___block_invoke_40(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B43 = result;
  return result;
}

uint64_t __33__PLBBEurekaEventMsg_setPayload___block_invoke_45(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B44 = result;
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
    v14 = __31__PLBBEurekaEventMsg_setError___block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v5;
    if (qword_1ED884B90 != -1)
      dispatch_once(&qword_1ED884B90, &block);
    if (byte_1ED884B45)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg setError:]", block, v13, v14, v15, v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg setError:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 117);

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
  if (v4)
    -[NSMutableDictionary setValue:forKey:](self->_commonInfo, "setValue:forKey:", v4, CFSTR("Error"));

}

uint64_t __31__PLBBEurekaEventMsg_setError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B45 = result;
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
    v14 = __36__PLBBEurekaEventMsg_appendToError___block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v5;
    if (qword_1ED884B98 != -1)
      dispatch_once(&qword_1ED884B98, &block);
    if (byte_1ED884B46)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg appendToError:]", block, v13, v14, v15, v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg appendToError:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 125);

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

uint64_t __36__PLBBEurekaEventMsg_appendToError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B46 = result;
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
    block[2] = __61__PLBBEurekaEventMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (qword_1ED884BA0 != -1)
      dispatch_once(&qword_1ED884BA0, block);
    if (byte_1ED884B47)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 134);

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
      v28[2] = __61__PLBBEurekaEventMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_50;
      v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v28[4] = v19;
      if (qword_1ED884BA8 != -1)
        dispatch_once(&qword_1ED884BA8, v28);
      if (byte_1ED884B48)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to set seqNum(%@)"), 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lastPathComponent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 136);

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
    v18 = &unk_1E8634620;
  }
  -[NSMutableDictionary setObject:forKey:](self->_commonInfo, "setObject:forKey:", v18, CFSTR("SeqNum"));
  -[NSMutableDictionary setValue:forKey:](self->_commonInfo, "setValue:forKey:", v10, CFSTR("BBDate"));

  commonInfo = self->_commonInfo;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](commonInfo, "setValue:forKey:", v27, CFSTR("TimeCal"));

}

uint64_t __61__PLBBEurekaEventMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B47 = result;
  return result;
}

uint64_t __61__PLBBEurekaEventMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_50(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B48 = result;
  return result;
}

- (void)sendAndLogPLEntry:(id)a3
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__PLBBEurekaEventMsg_sendAndLogPLEntry___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED884BB0 != -1)
      dispatch_once(&qword_1ED884BB0, block);
    if (byte_1ED884B49)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg sendAndLogPLEntry:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg sendAndLogPLEntry:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 157);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("EventCode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("EventCode"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Payload"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("Payload"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Error"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("Error"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("SeqNum"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("SeqNum"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("BBDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("BBDate"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("TimeCal"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("TimeCal"));

  -[PLBasebandMessage agent](self, "agent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18 && objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v19 = objc_opt_class();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __40__PLBBEurekaEventMsg_sendAndLogPLEntry___block_invoke_56;
    v29[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v29[4] = v19;
    if (qword_1ED884BB8 != -1)
      dispatch_once(&qword_1ED884BB8, v29);
    if (byte_1ED884B4A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad agent"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastPathComponent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg sendAndLogPLEntry:]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 168);

      PLLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v20;
        _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("BBDate"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "convertFromBasebandToMonotonic");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEntryDate:", v27);

  -[PLBasebandMessage agent](self, "agent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "logEntry:", v4);

}

uint64_t __40__PLBBEurekaEventMsg_sendAndLogPLEntry___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B49 = result;
  return result;
}

uint64_t __40__PLBBEurekaEventMsg_sendAndLogPLEntry___block_invoke_56(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B4A = result;
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
    block[2] = __48__PLBBEurekaEventMsg_addPairWithKey_andWithVal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1ED884BC0 != -1)
      dispatch_once(&qword_1ED884BC0, block);
    if (byte_1ED884B4B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg addPairWithKey:andWithVal:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg addPairWithKey:andWithVal:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 205);

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
      v25 = __48__PLBBEurekaEventMsg_addPairWithKey_andWithVal___block_invoke_61;
      v26 = &__block_descriptor_40_e5_v8__0lu32l8;
      v27 = v15;
      if (qword_1ED884BC8 != -1)
        dispatch_once(&qword_1ED884BC8, &v23);
      if (byte_1ED884B4C)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Add KVPair [%@,%@]"), v6, v7, v23, v24, v25, v26, v27);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg addPairWithKey:andWithVal:]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 207);

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
    -[PLBBEurekaEventMsg kvPairs](self, "kvPairs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v7, v6);

  }
}

uint64_t __48__PLBBEurekaEventMsg_addPairWithKey_andWithVal___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B4B = result;
  return result;
}

uint64_t __48__PLBBEurekaEventMsg_addPairWithKey_andWithVal___block_invoke_61(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B4C = result;
  return result;
}

- (void)refreshBBEurekaEventMsgLite
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
    v16 = __49__PLBBEurekaEventMsg_refreshBBEurekaEventMsgLite__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v4;
    if (qword_1ED884BD0 != -1)
      dispatch_once(&qword_1ED884BD0, &block);
    if (byte_1ED884B4D)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg refreshBBEurekaEventMsgLite]", block, v15, v16, v17, v18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg refreshBBEurekaEventMsgLite]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 246);

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
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("BBEurekaEventMsgLite"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
  objc_msgSend(v12, "setIsErrorEntry:", 1);
  -[PLBasebandMessage agent](self, "agent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logEntry:", v12);

  objc_autoreleasePoolPop(v3);
}

uint64_t __49__PLBBEurekaEventMsg_refreshBBEurekaEventMsgLite__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B4D = result;
  return result;
}

+ (id)bbEuEvMsgNameBBEurekaMsgLite
{
  uint64_t v2;
  uint64_t v3;
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
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[6];
  _QWORD v28[6];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[3];
  _QWORD v32[5];

  v32[3] = *MEMORY[0x1E0C80C00];
  v31[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802A8];
  v29[0] = *MEMORY[0x1E0D80318];
  v29[1] = v2;
  v3 = *MEMORY[0x1E0D802F8];
  v29[2] = *MEMORY[0x1E0D802B8];
  v29[3] = v3;
  v30[2] = MEMORY[0x1E0C9AAA0];
  v30[3] = CFSTR("refreshRequestHandler");
  v30[0] = &unk_1E86534D0;
  v30[1] = MEMORY[0x1E0C9AAB0];
  v29[4] = *MEMORY[0x1E0D80308];
  v30[4] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v24;
  v31[1] = *MEMORY[0x1E0D802F0];
  v27[0] = CFSTR("EventCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  v27[1] = CFSTR("Payload");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_StringFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v20;
  v27[2] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_BoolFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v18;
  v27[3] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v16;
  v27[4] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_DateFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v4;
  v27[5] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v7;
  v31[2] = *MEMORY[0x1E0D802B0];
  v25[0] = CFSTR("value");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = CFSTR("unit");
  v26[0] = v9;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_StringFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)logEventForwardBBEurekaEventMsgLite
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD block[5];
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PLBBEurekaEventMsg_logEventForwardBBEurekaEventMsgLite__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1ED884BD8 != -1)
      dispatch_once(&qword_1ED884BD8, block);
    if (byte_1ED884B4E)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg logEventForwardBBEurekaEventMsgLite]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg logEventForwardBBEurekaEventMsgLite]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 295);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("BBEurekaEventMsgLite"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PLBBEurekaEventMsg kvPairs](self, "kvPairs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[PLBBEurekaEventMsg kvPairs](self, "kvPairs");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v14);
  }

  -[PLBBEurekaEventMsg sendAndLogPLEntry:](self, "sendAndLogPLEntry:", v11);
}

uint64_t __57__PLBBEurekaEventMsg_logEventForwardBBEurekaEventMsgLite__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B4E = result;
  return result;
}

- (void)refreshSDEventActionCode
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
    v16 = __46__PLBBEurekaEventMsg_refreshSDEventActionCode__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v4;
    if (qword_1ED884BE0 != -1)
      dispatch_once(&qword_1ED884BE0, &block);
    if (byte_1ED884B4F)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg refreshSDEventActionCode]", block, v15, v16, v17, v18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg refreshSDEventActionCode]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 319);

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
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("SDEventActionCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
  objc_msgSend(v12, "setIsErrorEntry:", 1);
  -[PLBasebandMessage agent](self, "agent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logEntry:", v12);

  objc_autoreleasePoolPop(v3);
}

uint64_t __46__PLBBEurekaEventMsg_refreshSDEventActionCode__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B4F = result;
  return result;
}

+ (id)bbEuEvMsgNameSDEventActionCode
{
  uint64_t v2;
  uint64_t v3;
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
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[9];
  _QWORD v34[9];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[3];
  _QWORD v38[5];

  v38[3] = *MEMORY[0x1E0C80C00];
  v37[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802A8];
  v35[0] = *MEMORY[0x1E0D80318];
  v35[1] = v2;
  v3 = *MEMORY[0x1E0D802F8];
  v35[2] = *MEMORY[0x1E0D802B8];
  v35[3] = v3;
  v36[2] = MEMORY[0x1E0C9AAA0];
  v36[3] = CFSTR("refreshRequestHandler");
  v36[0] = &unk_1E86534D0;
  v36[1] = MEMORY[0x1E0C9AAB0];
  v35[4] = *MEMORY[0x1E0D80308];
  v36[4] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v30;
  v37[1] = *MEMORY[0x1E0D802F0];
  v33[0] = CFSTR("EventCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v28;
  v33[1] = CFSTR("Payload");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_StringFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v26;
  v33[2] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_BoolFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v24;
  v33[3] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v22;
  v33[4] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_DateFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v20;
  v33[5] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v18;
  v33[6] = CFSTR("Event");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34[6] = v16;
  v33[7] = CFSTR("Action");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34[7] = v4;
  v33[8] = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[8] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v7;
  v37[2] = *MEMORY[0x1E0D802B0];
  v31[0] = CFSTR("value");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = CFSTR("unit");
  v32[0] = v9;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_StringFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)setSDEventActionCodeWith:(id)a3 andSDAction:(id)a4 andSDState:(id)a5
{
  NSMutableDictionary *commonInfo;
  id v9;
  id v10;

  commonInfo = self->_commonInfo;
  v10 = a5;
  v9 = a4;
  -[NSMutableDictionary setObject:forKey:](commonInfo, "setObject:forKey:", a3, CFSTR("Event"));
  -[NSMutableDictionary setObject:forKey:](self->_commonInfo, "setObject:forKey:", v9, CFSTR("Action"));

  -[NSMutableDictionary setObject:forKey:](self->_commonInfo, "setObject:forKey:", v10, CFSTR("State"));
}

- (void)logEventForwardSDEventActionCode
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD block[5];
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__PLBBEurekaEventMsg_logEventForwardSDEventActionCode__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1ED884BE8 != -1)
      dispatch_once(&qword_1ED884BE8, block);
    if (byte_1ED884B50)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg logEventForwardSDEventActionCode]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg logEventForwardSDEventActionCode]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 385);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("SDEventActionCode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  -[PLBBEurekaEventMsg commonInfo](self, "commonInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("Event"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("Event"));

  -[PLBBEurekaEventMsg commonInfo](self, "commonInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("Action"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("Action"));

  -[PLBBEurekaEventMsg commonInfo](self, "commonInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("State"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("State"));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[PLBBEurekaEventMsg kvPairs](self, "kvPairs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        -[PLBBEurekaEventMsg kvPairs](self, "kvPairs");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKey:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v20);
  }

  -[PLBBEurekaEventMsg sendAndLogPLEntry:](self, "sendAndLogPLEntry:", v11);
  -[PLBasebandMessage agent](self, "agent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "modelOOSPower:", v11);

}

uint64_t __54__PLBBEurekaEventMsg_logEventForwardSDEventActionCode__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B50 = result;
  return result;
}

+ (id)bbEuEvMsgNameCMCallEventConn
{
  uint64_t v2;
  uint64_t v3;
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
  _QWORD v26[9];
  _QWORD v27[9];
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[2];
  _QWORD v31[4];

  v31[2] = *MEMORY[0x1E0C80C00];
  v30[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v28[0] = *MEMORY[0x1E0D80318];
  v28[1] = v2;
  v29[0] = &unk_1E86534E0;
  v29[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v28[2] = *MEMORY[0x1E0D802F8];
  v28[3] = v3;
  v29[2] = CFSTR("refreshRequestHandler");
  v29[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v25;
  v30[1] = *MEMORY[0x1E0D802F0];
  v26[0] = CFSTR("EventCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v23;
  v26[1] = CFSTR("Payload");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_StringFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v21;
  v26[2] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_BoolFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v19;
  v26[3] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v17;
  v26[4] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_DateFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v15;
  v26[5] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v5;
  v26[6] = CFSTR("callId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v7;
  v26[7] = CFSTR("callType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v9;
  v26[8] = CFSTR("systemMode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_StringFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)logEventCMCallEventConnWithId:(id)a3 andCallType:(id)a4 andSysMode:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
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
  int v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;
  uint64_t block;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  uint64_t v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0D7FFA0];
  v10 = a4;
  v11 = a3;
  if (objc_msgSend(v9, "debugEnabled"))
  {
    v12 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v34 = 3221225472;
    v35 = __75__PLBBEurekaEventMsg_logEventCMCallEventConnWithId_andCallType_andSysMode___block_invoke;
    v36 = &__block_descriptor_40_e5_v8__0lu32l8;
    v37 = v12;
    if (qword_1ED884BF0 != -1)
      dispatch_once(&qword_1ED884BF0, &block);
    if (byte_1ED884B51)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg logEventCMCallEventConnWithId:andCallType:andSysMode:]", block, v34, v35, v36, v37);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg logEventCMCallEventConnWithId:andCallType:andSysMode:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 465);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v13;
        _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("CMCallEventConnCode"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v19);
  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("EventCode"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("EventCode"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Payload"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("Payload"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Error"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("Error"));

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v11, CFSTR("callId"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v10, CFSTR("callType"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v8, CFSTR("systemMode"));
  -[PLBBEurekaEventMsg sendAndLogPLEntry:](self, "sendAndLogPLEntry:", v20);
  v24 = objc_msgSend(v10, "isEqualToString:", CFSTR("VOICE"));

  if (v24)
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("CDMA")))
    {
      -[PLBasebandMessage agent](self, "agent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v27 = CFSTR("CDMA2K");
      v28 = v20;
    }
    else
    {
      v32 = CFSTR("GSM");
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("GSM")))
      {
        v32 = CFSTR("WCDMA");
        if (!objc_msgSend(v8, "isEqualToString:", CFSTR("WCDMA")))
        {
          v32 = CFSTR("UTRAN");
          if (!objc_msgSend(v8, "isEqualToString:", CFSTR("UTRAN")))
            goto LABEL_18;
        }
      }
      -[PLBasebandMessage agent](self, "agent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v28 = v20;
      v27 = v32;
    }
    objc_msgSend(v25, "modelStateTransitionPower:rat:state:", v28, v27, CFSTR("Voice"));

LABEL_18:
    -[PLBasebandMessage agent](self, "agent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "accountVoicePower:state:", v20, CFSTR("voice_start"));
LABEL_22:

    goto LABEL_23;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("HDR")))
  {
    -[PLBasebandMessage agent](self, "agent");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v31 = CFSTR("1xEVDO");
LABEL_21:
    objc_msgSend(v29, "modelStateTransitionPower:rat:state:", v20, v31, CFSTR("Connected"));
    goto LABEL_22;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("CDMA")))
  {
    -[PLBasebandMessage agent](self, "agent");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v31 = CFSTR("CDMA2K");
    goto LABEL_21;
  }
LABEL_23:

}

uint64_t __75__PLBBEurekaEventMsg_logEventCMCallEventConnWithId_andCallType_andSysMode___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B51 = result;
  return result;
}

+ (id)bbEuEvMsgNameCMCallEventEnd
{
  uint64_t v2;
  uint64_t v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[8];
  _QWORD v25[8];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[2];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x1E0C80C00];
  v28[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v26[0] = *MEMORY[0x1E0D80318];
  v26[1] = v2;
  v27[0] = &unk_1E86534E0;
  v27[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v26[2] = *MEMORY[0x1E0D802F8];
  v26[3] = v3;
  v27[2] = CFSTR("refreshRequestHandler");
  v27[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  v28[1] = *MEMORY[0x1E0D802F0];
  v24[0] = CFSTR("EventCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  v24[1] = CFSTR("Payload");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_StringFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v19;
  v24[2] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_BoolFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v17;
  v24[3] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v15;
  v24[4] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_DateFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v5;
  v24[5] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v7;
  v24[6] = CFSTR("numberOfCalls");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v9;
  v24[7] = CFSTR("callId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_StringFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)logEventCMCallEventEndWithId:(id)a3 andNumCalls:(id)a4
{
  void *v6;
  id v7;
  id v8;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t block;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D7FFA0];
  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v6, "debugEnabled"))
  {
    v9 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __63__PLBBEurekaEventMsg_logEventCMCallEventEndWithId_andNumCalls___block_invoke;
    v27 = &__block_descriptor_40_e5_v8__0lu32l8;
    v28 = v9;
    if (qword_1ED884BF8 != -1)
      dispatch_once(&qword_1ED884BF8, &block);
    if (byte_1ED884B52)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg logEventCMCallEventEndWithId:andNumCalls:]", block, v25, v26, v27, v28);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg logEventCMCallEventEndWithId:andNumCalls:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 543);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v10;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("CMCallEventEndCode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v16);
  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("EventCode"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("EventCode"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Payload"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("Payload"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Error"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("Error"));

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v8, CFSTR("callId"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v7, CFSTR("numberOfCalls"));

  -[PLBBEurekaEventMsg sendAndLogPLEntry:](self, "sendAndLogPLEntry:", v17);
  -[PLBasebandMessage agent](self, "agent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "modelStateTransitionPower:rat:state:", v17, CFSTR("CDMA2K"), CFSTR("Inactive"));

  -[PLBasebandMessage agent](self, "agent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "modelStateTransitionPower:rat:state:", v17, CFSTR("1xEVDO"), CFSTR("Inactive"));

  -[PLBasebandMessage agent](self, "agent");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "accountVoicePower:state:", v17, CFSTR("voice_end"));

}

uint64_t __63__PLBBEurekaEventMsg_logEventCMCallEventEndWithId_andNumCalls___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B52 = result;
  return result;
}

+ (id)bbEuEvMsgNameCMCallEventOrig
{
  uint64_t v2;
  uint64_t v3;
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
  _QWORD v26[9];
  _QWORD v27[9];
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[2];
  _QWORD v31[4];

  v31[2] = *MEMORY[0x1E0C80C00];
  v30[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v28[0] = *MEMORY[0x1E0D80318];
  v28[1] = v2;
  v29[0] = &unk_1E86534E0;
  v29[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v28[2] = *MEMORY[0x1E0D802F8];
  v28[3] = v3;
  v29[2] = CFSTR("refreshRequestHandler");
  v29[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v25;
  v30[1] = *MEMORY[0x1E0D802F0];
  v26[0] = CFSTR("EventCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v23;
  v26[1] = CFSTR("Payload");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_StringFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v21;
  v26[2] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_BoolFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v19;
  v26[3] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v17;
  v26[4] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_DateFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v15;
  v26[5] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v5;
  v26[6] = CFSTR("callId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v7;
  v26[7] = CFSTR("callType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v9;
  v26[8] = CFSTR("serviceType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_StringFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)logEventCMCallEventOrigWithId:(id)a3 andCallType:(id)a4 andSrvType:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
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
  uint64_t block;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0D7FFA0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  if (objc_msgSend(v8, "debugEnabled"))
  {
    v12 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __75__PLBBEurekaEventMsg_logEventCMCallEventOrigWithId_andCallType_andSrvType___block_invoke;
    v27 = &__block_descriptor_40_e5_v8__0lu32l8;
    v28 = v12;
    if (qword_1ED884C00 != -1)
      dispatch_once(&qword_1ED884C00, &block);
    if (byte_1ED884B53)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg logEventCMCallEventOrigWithId:andCallType:andSrvType:]", block, v25, v26, v27, v28);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg logEventCMCallEventOrigWithId:andCallType:andSrvType:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 602);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v13;
        _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("CMCallEventOrigCode"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v19);
  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("EventCode"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("EventCode"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Payload"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("Payload"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Error"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("Error"));

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v11, CFSTR("callId"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v10, CFSTR("callType"));

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v9, CFSTR("serviceType"));
  -[PLBBEurekaEventMsg sendAndLogPLEntry:](self, "sendAndLogPLEntry:", v20);

}

uint64_t __75__PLBBEurekaEventMsg_logEventCMCallEventOrigWithId_andCallType_andSrvType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B53 = result;
  return result;
}

+ (id)bbEuEvMsgNameCMCallEventConnV2
{
  uint64_t v2;
  uint64_t v3;
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
  _QWORD v28[10];
  _QWORD v29[10];
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[2];
  _QWORD v33[4];

  v33[2] = *MEMORY[0x1E0C80C00];
  v32[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v30[0] = *MEMORY[0x1E0D80318];
  v30[1] = v2;
  v31[0] = &unk_1E86534E0;
  v31[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v30[2] = *MEMORY[0x1E0D802F8];
  v30[3] = v3;
  v31[2] = CFSTR("refreshRequestHandler");
  v31[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v27;
  v32[1] = *MEMORY[0x1E0D802F0];
  v28[0] = CFSTR("EventCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v25;
  v28[1] = CFSTR("Payload");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_StringFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v23;
  v28[2] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_BoolFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v21;
  v28[3] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v19;
  v28[4] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_DateFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v17;
  v28[5] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v15;
  v28[6] = CFSTR("callId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v5;
  v28[7] = CFSTR("callType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v7;
  v28[8] = CFSTR("systemMode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[8] = v9;
  v28[9] = CFSTR("clientId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_StringFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)logEventCMCallEventConnWithId:(id)a3 andCallType:(id)a4 andSysMode:(id)a5 andClientId:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  _QWORD block[5];
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D7FFA0];
  v12 = a6;
  v13 = a4;
  v14 = a3;
  if (objc_msgSend(v11, "debugEnabled"))
  {
    v15 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__PLBBEurekaEventMsg_logEventCMCallEventConnWithId_andCallType_andSysMode_andClientId___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v15;
    if (qword_1ED884C08 != -1)
      dispatch_once(&qword_1ED884C08, block);
    if (byte_1ED884B54)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg logEventCMCallEventConnWithId:andCallType:andSysMode:andClientId:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg logEventCMCallEventConnWithId:andCallType:andSysMode:andClientId:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 658);

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
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("CMCallEventConnCode"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v22);
  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("EventCode"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, CFSTR("EventCode"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Payload"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, CFSTR("Payload"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Error"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, CFSTR("Error"));

  objc_msgSend(v23, "setObject:forKeyedSubscript:", v14, CFSTR("callId"));
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v13, CFSTR("callType"));
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v10, CFSTR("systemMode"));
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v12, CFSTR("clientId"));

  -[PLBBEurekaEventMsg sendAndLogPLEntry:](self, "sendAndLogPLEntry:", v23);
  v27 = objc_msgSend(v13, "isEqualToString:", CFSTR("VOICE"));

  if (v27)
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("CDMA")))
    {
      -[PLBasebandMessage agent](self, "agent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v30 = CFSTR("CDMA2K");
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("GSM")))
    {
      -[PLBasebandMessage agent](self, "agent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v30 = CFSTR("GSM");
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("WCDMA")))
    {
      -[PLBasebandMessage agent](self, "agent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v30 = CFSTR("WCDMA");
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("UTRAN")))
      {
LABEL_23:
        -[PLBasebandMessage agent](self, "agent");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "accountVoicePower:state:", v23, CFSTR("voice_start"));
        goto LABEL_24;
      }
      -[PLBasebandMessage agent](self, "agent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v30 = CFSTR("UTRAN");
    }
    objc_msgSend(v28, "modelStateTransitionPower:rat:state:", v23, v30, CFSTR("Voice"));

    goto LABEL_23;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("HDR")))
  {
    -[PLBasebandMessage agent](self, "agent");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    v33 = CFSTR("1xEVDO");
LABEL_17:
    objc_msgSend(v31, "modelStateTransitionPower:rat:state:", v23, v33, CFSTR("Connected"));
LABEL_24:

    goto LABEL_25;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("CDMA")))
  {
    -[PLBasebandMessage agent](self, "agent");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    v33 = CFSTR("CDMA2K");
    goto LABEL_17;
  }
LABEL_25:

}

uint64_t __87__PLBBEurekaEventMsg_logEventCMCallEventConnWithId_andCallType_andSysMode_andClientId___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B54 = result;
  return result;
}

+ (id)bbEuEvMsgNameCMCallEventEndV2
{
  uint64_t v2;
  uint64_t v3;
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
  _QWORD v26[9];
  _QWORD v27[9];
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[2];
  _QWORD v31[4];

  v31[2] = *MEMORY[0x1E0C80C00];
  v30[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v28[0] = *MEMORY[0x1E0D80318];
  v28[1] = v2;
  v29[0] = &unk_1E86534E0;
  v29[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v28[2] = *MEMORY[0x1E0D802F8];
  v28[3] = v3;
  v29[2] = CFSTR("refreshRequestHandler");
  v29[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v25;
  v30[1] = *MEMORY[0x1E0D802F0];
  v26[0] = CFSTR("EventCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v23;
  v26[1] = CFSTR("Payload");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_StringFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v21;
  v26[2] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_BoolFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v19;
  v26[3] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v17;
  v26[4] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_DateFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v15;
  v26[5] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v5;
  v26[6] = CFSTR("numberOfCalls");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v7;
  v26[7] = CFSTR("callId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v9;
  v26[8] = CFSTR("clientId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_StringFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)logEventCMCallEventEndWithId:(id)a3 andNumCalls:(id)a4 andClientId:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
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
  void *v24;
  void *v25;
  void *v26;
  uint64_t block;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0D7FFA0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  if (objc_msgSend(v8, "debugEnabled"))
  {
    v12 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __75__PLBBEurekaEventMsg_logEventCMCallEventEndWithId_andNumCalls_andClientId___block_invoke;
    v30 = &__block_descriptor_40_e5_v8__0lu32l8;
    v31 = v12;
    if (qword_1ED884C10 != -1)
      dispatch_once(&qword_1ED884C10, &block);
    if (byte_1ED884B55)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg logEventCMCallEventEndWithId:andNumCalls:andClientId:]", block, v28, v29, v30, v31);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg logEventCMCallEventEndWithId:andNumCalls:andClientId:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 740);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v13;
        _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("CMCallEventEndCode"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v19);
  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("EventCode"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("EventCode"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Payload"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("Payload"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Error"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("Error"));

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v11, CFSTR("callId"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v10, CFSTR("numberOfCalls"));

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v9, CFSTR("clientId"));
  -[PLBBEurekaEventMsg sendAndLogPLEntry:](self, "sendAndLogPLEntry:", v20);
  -[PLBasebandMessage agent](self, "agent");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "modelStateTransitionPower:rat:state:", v20, CFSTR("CDMA2K"), CFSTR("Inactive"));

  -[PLBasebandMessage agent](self, "agent");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "modelStateTransitionPower:rat:state:", v20, CFSTR("1xEVDO"), CFSTR("Inactive"));

  -[PLBasebandMessage agent](self, "agent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "accountVoicePower:state:", v20, CFSTR("voice_end"));

}

uint64_t __75__PLBBEurekaEventMsg_logEventCMCallEventEndWithId_andNumCalls_andClientId___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B55 = result;
  return result;
}

+ (id)bbEuEvMsgNameCMCallEventOrigV2
{
  uint64_t v2;
  uint64_t v3;
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
  _QWORD v28[10];
  _QWORD v29[10];
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[2];
  _QWORD v33[4];

  v33[2] = *MEMORY[0x1E0C80C00];
  v32[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v30[0] = *MEMORY[0x1E0D80318];
  v30[1] = v2;
  v31[0] = &unk_1E86534E0;
  v31[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v30[2] = *MEMORY[0x1E0D802F8];
  v30[3] = v3;
  v31[2] = CFSTR("refreshRequestHandler");
  v31[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v27;
  v32[1] = *MEMORY[0x1E0D802F0];
  v28[0] = CFSTR("EventCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v25;
  v28[1] = CFSTR("Payload");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_StringFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v23;
  v28[2] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_BoolFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v21;
  v28[3] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v19;
  v28[4] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_DateFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v17;
  v28[5] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v15;
  v28[6] = CFSTR("callId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v5;
  v28[7] = CFSTR("callType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v7;
  v28[8] = CFSTR("serviceType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[8] = v9;
  v28[9] = CFSTR("clientId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_StringFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[9] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)logEventCMCallEventOrigWithId:(id)a3 andCallType:(id)a4 andSrvType:(id)a5 andClientId:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t block;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1E0D7FFA0];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  if (objc_msgSend(v10, "debugEnabled"))
  {
    v15 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __87__PLBBEurekaEventMsg_logEventCMCallEventOrigWithId_andCallType_andSrvType_andClientId___block_invoke;
    v30 = &__block_descriptor_40_e5_v8__0lu32l8;
    v31 = v15;
    if (qword_1ED884C18 != -1)
      dispatch_once(&qword_1ED884C18, &block);
    if (byte_1ED884B56)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg logEventCMCallEventOrigWithId:andCallType:andSrvType:andClientId:]", block, v28, v29, v30, v31);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg logEventCMCallEventOrigWithId:andCallType:andSrvType:andClientId:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 803);

      PLLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v16;
        _os_log_debug_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("CMCallEventOrigCode"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v22);
  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("EventCode"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, CFSTR("EventCode"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Payload"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, CFSTR("Payload"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Error"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, CFSTR("Error"));

  objc_msgSend(v23, "setObject:forKeyedSubscript:", v14, CFSTR("callId"));
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v13, CFSTR("callType"));

  objc_msgSend(v23, "setObject:forKeyedSubscript:", v12, CFSTR("serviceType"));
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v11, CFSTR("clientId"));

  -[PLBBEurekaEventMsg sendAndLogPLEntry:](self, "sendAndLogPLEntry:", v23);
}

uint64_t __87__PLBBEurekaEventMsg_logEventCMCallEventOrigWithId_andCallType_andSrvType_andClientId___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B56 = result;
  return result;
}

+ (id)bbEuEvMsgNameCMCallEventIncom
{
  uint64_t v2;
  uint64_t v3;
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
  _QWORD v26[9];
  _QWORD v27[9];
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[2];
  _QWORD v31[4];

  v31[2] = *MEMORY[0x1E0C80C00];
  v30[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v28[0] = *MEMORY[0x1E0D80318];
  v28[1] = v2;
  v29[0] = &unk_1E86534D0;
  v29[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v28[2] = *MEMORY[0x1E0D802F8];
  v28[3] = v3;
  v29[2] = CFSTR("refreshRequestHandler");
  v29[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v25;
  v30[1] = *MEMORY[0x1E0D802F0];
  v26[0] = CFSTR("EventCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v23;
  v26[1] = CFSTR("Payload");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_StringFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v21;
  v26[2] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_BoolFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v19;
  v26[3] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v17;
  v26[4] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_DateFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v15;
  v26[5] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v5;
  v26[6] = CFSTR("callId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v7;
  v26[7] = CFSTR("callType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v9;
  v26[8] = CFSTR("serviceType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_StringFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)bbEuEvMsgNameCMCDMAExit
{
  uint64_t v2;
  uint64_t v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[7];
  _QWORD v23[7];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[2];
  _QWORD v27[4];

  v27[2] = *MEMORY[0x1E0C80C00];
  v26[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v24[0] = *MEMORY[0x1E0D80318];
  v24[1] = v2;
  v25[0] = &unk_1E86534D0;
  v25[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v24[2] = *MEMORY[0x1E0D802F8];
  v24[3] = v3;
  v25[2] = CFSTR("refreshRequestHandler");
  v25[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  v26[1] = *MEMORY[0x1E0D802F0];
  v22[0] = CFSTR("EventCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  v22[1] = CFSTR("Payload");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_StringFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  v22[2] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_BoolFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v15;
  v22[3] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v5;
  v22[4] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_DateFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v7;
  v22[5] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v9;
  v22[6] = CFSTR("cdmaExitCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_StringFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)logEventPointCMExitCodeWithState:(id)a3
{
  void *v4;
  id v5;
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
  uint64_t block;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D7FFA0];
  v5 = a3;
  if (objc_msgSend(v4, "debugEnabled"))
  {
    v6 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __55__PLBBEurekaEventMsg_logEventPointCMExitCodeWithState___block_invoke;
    v21 = &__block_descriptor_40_e5_v8__0lu32l8;
    v22 = v6;
    if (qword_1ED884C20 != -1)
      dispatch_once(&qword_1ED884C20, &block);
    if (byte_1ED884B57)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg logEventPointCMExitCodeWithState:]", block, v19, v20, v21, v22);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg logEventPointCMExitCodeWithState:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 890);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("CMCDMAExitCode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v13);
  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("EventCode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("EventCode"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Payload"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("Payload"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Error"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("Error"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v5, CFSTR("cdmaExitCode"));
  -[PLBBEurekaEventMsg sendAndLogPLEntry:](self, "sendAndLogPLEntry:", v14);

}

uint64_t __55__PLBBEurekaEventMsg_logEventPointCMExitCodeWithState___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B57 = result;
  return result;
}

+ (id)bbEuEvMsgNameGSML1State
{
  uint64_t v2;
  uint64_t v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[7];
  _QWORD v23[7];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[2];
  _QWORD v27[4];

  v27[2] = *MEMORY[0x1E0C80C00];
  v26[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v24[0] = *MEMORY[0x1E0D80318];
  v24[1] = v2;
  v25[0] = &unk_1E86534D0;
  v25[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v24[2] = *MEMORY[0x1E0D802F8];
  v24[3] = v3;
  v25[2] = CFSTR("refreshRequestHandler");
  v25[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  v26[1] = *MEMORY[0x1E0D802F0];
  v22[0] = CFSTR("EventCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  v22[1] = CFSTR("Payload");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_StringFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  v22[2] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_BoolFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v15;
  v22[3] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v5;
  v22[4] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_DateFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v7;
  v22[5] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v9;
  v22[6] = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_StringFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)logEventForwardGSML1StateWith:(id)a3
{
  void *v4;
  id v5;
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
  uint64_t block;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D7FFA0];
  v5 = a3;
  if (objc_msgSend(v4, "debugEnabled"))
  {
    v6 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __52__PLBBEurekaEventMsg_logEventForwardGSML1StateWith___block_invoke;
    v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    v20 = v6;
    if (qword_1ED884C28 != -1)
      dispatch_once(&qword_1ED884C28, &block);
    if (byte_1ED884B58)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg logEventForwardGSML1StateWith:]", block, v17, v18, v19, v20);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg logEventForwardGSML1StateWith:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 943);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("GSML1State"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v13);
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v5, CFSTR("State"));
  -[PLBBEurekaEventMsg sendAndLogPLEntry:](self, "sendAndLogPLEntry:", v14);
  -[PLBasebandMessage agent](self, "agent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "modelStateTransitionPower:rat:state:", v14, CFSTR("GSM"), v5);

}

uint64_t __52__PLBBEurekaEventMsg_logEventForwardGSML1StateWith___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B58 = result;
  return result;
}

- (void)refreshWCDMARRCState
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
    v16 = __42__PLBBEurekaEventMsg_refreshWCDMARRCState__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v4;
    if (qword_1ED884C30 != -1)
      dispatch_once(&qword_1ED884C30, &block);
    if (byte_1ED884B59)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg refreshWCDMARRCState]", block, v15, v16, v17, v18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg refreshWCDMARRCState]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 968);

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
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("WCDMARRCState"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
  objc_msgSend(v12, "setIsErrorEntry:", 1);
  -[PLBasebandMessage agent](self, "agent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logEntry:", v12);

  objc_autoreleasePoolPop(v3);
}

uint64_t __42__PLBBEurekaEventMsg_refreshWCDMARRCState__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B59 = result;
  return result;
}

+ (id)bbEuEvMsgNameWCDMARRCState
{
  uint64_t v2;
  uint64_t v3;
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
  _QWORD v26[9];
  _QWORD v27[9];
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[2];
  _QWORD v31[4];

  v31[2] = *MEMORY[0x1E0C80C00];
  v30[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v28[0] = *MEMORY[0x1E0D80318];
  v28[1] = v2;
  v29[0] = &unk_1E86534E0;
  v29[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v28[2] = *MEMORY[0x1E0D802F8];
  v28[3] = v3;
  v29[2] = CFSTR("refreshRequestHandler");
  v29[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v25;
  v30[1] = *MEMORY[0x1E0D802F0];
  v26[0] = CFSTR("EventCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v23;
  v26[1] = CFSTR("Payload");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_StringFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v21;
  v26[2] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_BoolFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v19;
  v26[3] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v17;
  v26[4] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_DateFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v15;
  v26[5] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v5;
  v26[6] = CFSTR("PrevState");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v7;
  v26[7] = CFSTR("CurrState");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v9;
  v26[8] = CFSTR("Rate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_StringFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)logEventForwardWCDMARRCPrevStateAs:(id)a3 andCurrState:(id)a4 andRate:(id)a5
{
  void *v7;
  id v8;
  id v9;
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
  uint64_t block;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0D7FFA0];
  v8 = a4;
  v9 = a3;
  if (objc_msgSend(v7, "debugEnabled"))
  {
    v10 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __78__PLBBEurekaEventMsg_logEventForwardWCDMARRCPrevStateAs_andCurrState_andRate___block_invoke;
    v23 = &__block_descriptor_40_e5_v8__0lu32l8;
    v24 = v10;
    if (qword_1ED884C38 != -1)
      dispatch_once(&qword_1ED884C38, &block);
    if (byte_1ED884B5A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg logEventForwardWCDMARRCPrevStateAs:andCurrState:andRate:]", block, v21, v22, v23, v24);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg logEventForwardWCDMARRCPrevStateAs:andCurrState:andRate:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 1012);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v11;
        _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("WCDMARRCState"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v17);
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v9, CFSTR("PrevState"));

  objc_msgSend(v18, "setObject:forKeyedSubscript:", v8, CFSTR("CurrState"));
  -[PLBBEurekaEventMsg sendAndLogPLEntry:](self, "sendAndLogPLEntry:", v18);
  -[PLBasebandMessage agent](self, "agent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "modelStateTransitionPower:rat:state:", v18, CFSTR("WCDMA"), v8);

}

uint64_t __78__PLBBEurekaEventMsg_logEventForwardWCDMARRCPrevStateAs_andCurrState_andRate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B5A = result;
  return result;
}

- (void)refreshLTERRCState
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
    v16 = __40__PLBBEurekaEventMsg_refreshLTERRCState__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v4;
    if (qword_1ED884C40 != -1)
      dispatch_once(&qword_1ED884C40, &block);
    if (byte_1ED884B5B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg refreshLTERRCState]", block, v15, v16, v17, v18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg refreshLTERRCState]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1052);

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
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("LTERRCState"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
  objc_msgSend(v12, "setIsErrorEntry:", 1);
  -[PLBasebandMessage agent](self, "agent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logEntry:", v12);

  objc_autoreleasePoolPop(v3);
}

uint64_t __40__PLBBEurekaEventMsg_refreshLTERRCState__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B5B = result;
  return result;
}

+ (id)bbEuEvMsgNameLTERRCState
{
  uint64_t v2;
  uint64_t v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[7];
  _QWORD v23[7];
  _QWORD v24[4];
  _QWORD v25[4];
  _QWORD v26[2];
  _QWORD v27[4];

  v27[2] = *MEMORY[0x1E0C80C00];
  v26[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v24[0] = *MEMORY[0x1E0D80318];
  v24[1] = v2;
  v25[0] = &unk_1E86534D0;
  v25[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v24[2] = *MEMORY[0x1E0D802F8];
  v24[3] = v3;
  v25[2] = CFSTR("refreshRequestHandler");
  v25[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  v26[1] = *MEMORY[0x1E0D802F0];
  v22[0] = CFSTR("EventCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  v22[1] = CFSTR("Payload");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_StringFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  v22[2] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_BoolFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v15;
  v22[3] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v5;
  v22[4] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_DateFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v7;
  v22[5] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v9;
  v22[6] = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_StringFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)logEventForwardLTERRCStateAs:(id)a3
{
  void *v4;
  id v5;
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
  void *v18;
  uint64_t block;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D7FFA0];
  v5 = a3;
  if (objc_msgSend(v4, "debugEnabled"))
  {
    v6 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __51__PLBBEurekaEventMsg_logEventForwardLTERRCStateAs___block_invoke;
    v22 = &__block_descriptor_40_e5_v8__0lu32l8;
    v23 = v6;
    if (qword_1ED884C48 != -1)
      dispatch_once(&qword_1ED884C48, &block);
    if (byte_1ED884B5C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg logEventForwardLTERRCStateAs:]", block, v20, v21, v22, v23);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg logEventForwardLTERRCStateAs:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 1092);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("LTERRCState"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v13);
  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("EventCode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("EventCode"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Payload"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("Payload"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Error"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("Error"));

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v5, CFSTR("State"));
  -[PLBBEurekaEventMsg sendAndLogPLEntry:](self, "sendAndLogPLEntry:", v14);
  -[PLBasebandMessage agent](self, "agent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "modelStateTransitionPower:rat:state:", v14, CFSTR("LTE"), v5);

}

uint64_t __51__PLBBEurekaEventMsg_logEventForwardLTERRCStateAs___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B5C = result;
  return result;
}

- (void)refreshUTRANRRCState
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
    v16 = __42__PLBBEurekaEventMsg_refreshUTRANRRCState__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v4;
    if (qword_1ED884C50 != -1)
      dispatch_once(&qword_1ED884C50, &block);
    if (byte_1ED884B5D)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg refreshUTRANRRCState]", block, v15, v16, v17, v18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg refreshUTRANRRCState]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1133);

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
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("UTRANRRCState"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
  objc_msgSend(v12, "setIsErrorEntry:", 1);
  -[PLBasebandMessage agent](self, "agent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logEntry:", v12);

  objc_autoreleasePoolPop(v3);
}

uint64_t __42__PLBBEurekaEventMsg_refreshUTRANRRCState__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B5D = result;
  return result;
}

+ (id)bbEuEvMsgUTRANRRCState
{
  uint64_t v2;
  uint64_t v3;
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
  _QWORD v26[9];
  _QWORD v27[9];
  _QWORD v28[4];
  _QWORD v29[4];
  _QWORD v30[2];
  _QWORD v31[4];

  v31[2] = *MEMORY[0x1E0C80C00];
  v30[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v28[0] = *MEMORY[0x1E0D80318];
  v28[1] = v2;
  v29[0] = &unk_1E86534D0;
  v29[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v28[2] = *MEMORY[0x1E0D802F8];
  v28[3] = v3;
  v29[2] = CFSTR("refreshRequestHandler");
  v29[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v25;
  v30[1] = *MEMORY[0x1E0D802F0];
  v26[0] = CFSTR("EventCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v23;
  v26[1] = CFSTR("Payload");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_StringFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v21;
  v26[2] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_BoolFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v19;
  v26[3] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v17;
  v26[4] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_DateFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v15;
  v26[5] = CFSTR("TimeCal");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v5;
  v26[6] = CFSTR("NextState");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[6] = v7;
  v26[7] = CFSTR("CurrState");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[7] = v9;
  v26[8] = CFSTR("Rate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_StringFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)logEventForwardUTRANRRCNextStateAs:(id)a3 andCurrStateAs:(id)a4 andRateAs:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
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
  void *v24;
  uint64_t block;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0D7FFA0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  if (objc_msgSend(v8, "debugEnabled"))
  {
    v12 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __82__PLBBEurekaEventMsg_logEventForwardUTRANRRCNextStateAs_andCurrStateAs_andRateAs___block_invoke;
    v28 = &__block_descriptor_40_e5_v8__0lu32l8;
    v29 = v12;
    if (qword_1ED884C58 != -1)
      dispatch_once(&qword_1ED884C58, &block);
    if (byte_1ED884B5E)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg logEventForwardUTRANRRCNextStateAs:andCurrStateAs:andRateAs:]", block, v26, v27, v28, v29);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg logEventForwardUTRANRRCNextStateAs:andCurrStateAs:andRateAs:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 1177);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v13;
        _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("UTRANRRCState"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v19);
  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("EventCode"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("EventCode"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Payload"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("Payload"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Error"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("Error"));

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v11, CFSTR("NextState"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v10, CFSTR("CurrState"));
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v9, CFSTR("Rate"));

  -[PLBBEurekaEventMsg sendAndLogPLEntry:](self, "sendAndLogPLEntry:", v20);
  -[PLBasebandMessage agent](self, "agent");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "modelStateTransitionPower:rat:state:", v20, CFSTR("UTRAN"), v10);

}

uint64_t __82__PLBBEurekaEventMsg_logEventForwardUTRANRRCNextStateAs_andCurrStateAs_andRateAs___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B5E = result;
  return result;
}

- (void)refreshEventNotProcessed
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
    v16 = __46__PLBBEurekaEventMsg_refreshEventNotProcessed__block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v4;
    if (qword_1ED884C60 != -1)
      dispatch_once(&qword_1ED884C60, &block);
    if (byte_1ED884B5F)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg refreshEventNotProcessed]", block, v15, v16, v17, v18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg refreshEventNotProcessed]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1211);

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
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("EventNotProcessed"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
  objc_msgSend(v12, "setIsErrorEntry:", 1);
  -[PLBasebandMessage agent](self, "agent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logEntry:", v12);

  objc_autoreleasePoolPop(v3);
}

uint64_t __46__PLBBEurekaEventMsg_refreshEventNotProcessed__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B5F = result;
  return result;
}

+ (id)bbEuEvMsgEventNotProcessed
{
  uint64_t v2;
  uint64_t v3;
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
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[4];
  _QWORD v21[4];
  _QWORD v22[2];
  _QWORD v23[4];

  v23[2] = *MEMORY[0x1E0C80C00];
  v22[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v20[0] = *MEMORY[0x1E0D80318];
  v20[1] = v2;
  v21[0] = &unk_1E86534D0;
  v21[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80308];
  v20[2] = *MEMORY[0x1E0D802F8];
  v20[3] = v3;
  v21[2] = CFSTR("refreshRequestHandler");
  v21[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E0D802F0];
  v18[0] = CFSTR("EventCode");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v18[1] = CFSTR("Payload");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v5;
  v18[2] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v7;
  v18[3] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v9;
  v18[4] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_DateFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)logEventNoneEventNotProcessed
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
  void *v14;
  uint64_t block;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __51__PLBBEurekaEventMsg_logEventNoneEventNotProcessed__block_invoke;
    v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    v19 = v3;
    if (qword_1ED884C68 != -1)
      dispatch_once(&qword_1ED884C68, &block);
    if (byte_1ED884B60)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBEurekaEventMsg logEventNoneEventNotProcessed]", block, v16, v17, v18, v19);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBEurekaEventMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBEurekaEventMsg logEventNoneEventNotProcessed]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 1247);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("EventNotProcessed"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("EventCode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("EventCode"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Payload"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("Payload"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("Error"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("Error"));

  -[PLBBEurekaEventMsg sendAndLogPLEntry:](self, "sendAndLogPLEntry:", v11);
}

uint64_t __51__PLBBEurekaEventMsg_logEventNoneEventNotProcessed__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884B60 = result;
  return result;
}

- (unsigned)inited
{
  return self->_inited;
}

- (void)setInited:(unsigned __int8)a3
{
  self->_inited = a3;
}

- (NSMutableString)sdEvent
{
  return self->_sdEvent;
}

- (void)setSdEvent:(id)a3
{
  objc_storeStrong((id *)&self->_sdEvent, a3);
}

- (NSMutableString)sdAct
{
  return self->_sdAct;
}

- (void)setSdAct:(id)a3
{
  objc_storeStrong((id *)&self->_sdAct, a3);
}

- (NSMutableString)sdState
{
  return self->_sdState;
}

- (void)setSdState:(id)a3
{
  objc_storeStrong((id *)&self->_sdState, a3);
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
  objc_storeStrong((id *)&self->_sdState, 0);
  objc_storeStrong((id *)&self->_sdAct, 0);
  objc_storeStrong((id *)&self->_sdEvent, 0);
}

@end
