@implementation PLBasebandEurekaLogMessage

- (PLBasebandEurekaLogMessage)initWithData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  PLBasebandEurekaLogMessage *v12;
  PLBasebandEurekaLogMessage *v13;
  NSData *payload;
  PLBasebandEurekaLogMessage *v15;
  objc_super v17;
  _QWORD block[5];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PLBasebandEurekaLogMessage_initWithData___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED886F48 != -1)
      dispatch_once(&qword_1ED886F48, block);
    if (_MergedGlobals_105)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandEurekaLogMessage initWithData:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaLogMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaLogMessage initWithData:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 23);

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
  v17.receiver = self;
  v17.super_class = (Class)PLBasebandEurekaLogMessage;
  v12 = -[PLBasebandMessage initWithData:](&v17, sel_initWithData_, v4);
  v13 = v12;
  if (!v12
    || (v12->_header = 0,
        payload = v12->_payload,
        v12->_payload = 0,
        payload,
        v15 = 0,
        -[PLBasebandEurekaLogMessage parseData:](v13, "parseData:", v4)))
  {
    v15 = v13;
  }

  return v15;
}

uint64_t __43__PLBasebandEurekaLogMessage_initWithData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_105 = result;
  return result;
}

- (BOOL)parseData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  unsigned __int8 *v13;
  _PLBasebandLogHeader *v14;
  unsigned __int8 *v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  unint64_t v19;
  NSObject *p_super;
  BOOL v21;
  NSData *v22;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t block;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __40__PLBasebandEurekaLogMessage_parseData___block_invoke;
    v30 = &__block_descriptor_40_e5_v8__0lu32l8;
    v31 = v5;
    if (qword_1ED886F50 != -1)
      dispatch_once(&qword_1ED886F50, &block);
    if (byte_1ED886F41)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandEurekaLogMessage parseData:]", block, v28, v29, v30, v31);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaLogMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaLogMessage parseData:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 36);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v33 = (uint64_t)v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = objc_retainAutorelease(v4);
  v13 = (unsigned __int8 *)objc_msgSend(v12, "bytes");
  v14 = (_PLBasebandLogHeader *)&v13[2 * (*v13 == 129)];
  self->_header = v14;
  v15 = &v14->var3[7];
  v16 = (unsigned __int16)-[PLBasebandEurekaLogMessage header](self, "header")[1];
  v17 = v16 - 12;
  if (v16 >= 0xD
    && (v18 = objc_retainAutorelease(v12),
        v19 = (unint64_t)&v15[v17 - objc_msgSend(v18, "bytes")],
        v19 <= objc_msgSend(v18, "length")))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v15, v17);
    v22 = (NSData *)objc_claimAutoreleasedReturnValue();
    p_super = &self->_payload->super;
    self->_payload = v22;
    v21 = 1;
  }
  else
  {
    PLLogCommon();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      v24 = objc_retainAutorelease(v12);
      v25 = (uint64_t)&v15[v17 - objc_msgSend(v24, "bytes")];
      v26 = objc_msgSend(v24, "length");
      *(_DWORD *)buf = 134218498;
      v33 = v25;
      v34 = 2048;
      v35 = v26;
      v36 = 2080;
      v37 = "-[PLBasebandEurekaLogMessage parseData:]";
      _os_log_error_impl(&dword_1CAF47000, p_super, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", buf, 0x20u);
    }
    v21 = 0;
  }

  return v21;
}

uint64_t __40__PLBasebandEurekaLogMessage_parseData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886F41 = result;
  return result;
}

- (id)payloadString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLBasebandEurekaLogMessage payload](self, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[PLBasebandEurekaLogMessage payload](self, "payload");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)logWithLogger:(id)a3
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
  PLBBEurekaLogMsg *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  unsigned __int8 *v23;
  uint64_t v24;
  uint64_t v25;
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
  unsigned int v37;
  unsigned int v38;
  id v39;
  objc_super v40;
  _QWORD block[5];
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PLBasebandEurekaLogMessage_logWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED886F58 != -1)
      dispatch_once(&qword_1ED886F58, block);
    if (byte_1ED886F42)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandEurekaLogMessage logWithLogger:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaLogMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaLogMessage logWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 93);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v40.receiver = self;
  v40.super_class = (Class)PLBasebandEurekaLogMessage;
  -[PLBasebandMessage logWithLogger:](&v40, sel_logWithLogger_, v4);
  v12 = (void *)objc_opt_new();
  v13 = objc_alloc_init(PLBBEurekaLogMsg);
  -[PLBasebandMessage agent](self, "agent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage setAgent:](v13, "setAgent:", v14);

  -[PLBBEurekaLogMsg setEventCode:](v13, "setEventCode:", -[PLBasebandEurekaLogMessage eventCode](self, "eventCode"));
  -[PLBBEurekaLogMsg setError:](v13, "setError:", CFSTR("notSet"));
  -[PLBasebandMessage seqNum](self, "seqNum");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage date](self, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage timeCal](self, "timeCal");
  -[PLBBEurekaLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

  -[PLBasebandEurekaLogMessage payload](self, "payload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[PLBasebandEurekaLogMessage payloadString](self, "payloadString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithString:", v19);
    -[PLBBEurekaLogMsg setPayload:](v13, "setPayload:", v20);

  }
  if ((unsigned __int16)-[PLBasebandEurekaLogMessage header](self, "header")[3] == 45452)
  {
    if ((unsigned __int16)-[PLBasebandEurekaLogMessage header](self, "header")[1] > 0x27u)
    {
      v39 = v4;
      -[PLBasebandEurekaLogMessage payload](self, "payload");
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v23 = (unsigned __int8 *)objc_msgSend(v22, "bytes");

      v24 = *((unsigned int *)v23 + 4);
      if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003001) & 1) != 0
        || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003002))
      {
        v25 = *((unsigned int *)v23 + 5);
        v37 = *((_DWORD *)v23 + 6);
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", *v23);
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v23[4]);
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v23 + 2));
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", (*((_DWORD *)v23 + 2) + 1));
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v24);
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v25);
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v37);
        -[PLBBEurekaLogMsg logEventBackwardLTESleepMgrStatsWithVer:andML1State:andSES:andSDS:andStDur:andDSlpDur:andLSlpDur:](v13, "logEventBackwardLTESleepMgrStatsWithVer:andML1State:andSES:andSDS:andStDur:andDSlpDur:andLSlpDur:", v21, v26, v27, v28, v29, v30, v31);

      }
      else
      {
        v38 = *((_DWORD *)v23 + 6) + *((_DWORD *)v23 + 7) + *((_DWORD *)v23 + 8);
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", *v23);
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", v23[4]);
        v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v23 + 2));
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v23 + 3));
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v23 + 4));
        v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v23 + 5));
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v38);
        -[PLBBEurekaLogMsg logEventBackwardLTESleepMgrStatsWithVer:andML1State:andSES:andSDS:andStDur:andDSlpDur:andLSlpDur:](v13, "logEventBackwardLTESleepMgrStatsWithVer:andML1State:andSES:andSDS:andStDur:andDSlpDur:andLSlpDur:", v21, v26, v32, v33, v34, v35, v36);

      }
      v4 = v39;
    }
    else
    {
      -[PLBasebandEurekaLogMessage tooShortErrorString](self, "tooShortErrorString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBEurekaLogMsg setError:](v13, "setError:", v21);
    }

  }
  -[PLBasebandMessage logEntry:withBody:](self, "logEntry:withBody:", CFSTR("BB Event"), v12);

}

uint64_t __44__PLBasebandEurekaLogMessage_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886F42 = result;
  return result;
}

- (unsigned)eventCode
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t block;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __39__PLBasebandEurekaLogMessage_eventCode__block_invoke;
    v14 = &__block_descriptor_40_e5_v8__0lu32l8;
    v15 = v3;
    if (qword_1ED886F60 != -1)
      dispatch_once(&qword_1ED886F60, &block);
    if (byte_1ED886F43)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandEurekaLogMessage eventCode]", block, v12, v13, v14, v15);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaLogMessage.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaLogMessage eventCode]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 175);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  return (unsigned __int16)-[PLBasebandEurekaLogMessage header](self, "header")[3];
}

uint64_t __39__PLBasebandEurekaLogMessage_eventCode__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886F43 = result;
  return result;
}

- (id)stringForUnknownBytes:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v3 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__PLBasebandEurekaLogMessage_stringForUnknownBytes___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (qword_1ED886F68 != -1)
      dispatch_once(&qword_1ED886F68, block);
    if (byte_1ED886F44)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandEurekaLogMessage stringForUnknownBytes:]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaLogMessage.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaLogMessage stringForUnknownBytes:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 203);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("?-(0x%x/%u)"), v3, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __52__PLBasebandEurekaLogMessage_stringForUnknownBytes___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886F44 = result;
  return result;
}

- (id)tooShortErrorString
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t block;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __49__PLBasebandEurekaLogMessage_tooShortErrorString__block_invoke;
    v14 = &__block_descriptor_40_e5_v8__0lu32l8;
    v15 = v3;
    if (qword_1ED886F70 != -1)
      dispatch_once(&qword_1ED886F70, &block);
    if (byte_1ED886F45)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandEurekaLogMessage tooShortErrorString]", block, v12, v13, v14, v15);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandEurekaLogMessage.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandEurekaLogMessage tooShortErrorString]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 208);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("short_length!(%d)"), (unsigned __int16)-[PLBasebandEurekaLogMessage header](self, "header")[1]);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __49__PLBasebandEurekaLogMessage_tooShortErrorString__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886F45 = result;
  return result;
}

- (_PLBasebandLogHeader)header
{
  return self->_header;
}

- (void)setHeader:(_PLBasebandLogHeader *)a3
{
  self->_header = a3;
}

- (NSData)payload
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPayload:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
