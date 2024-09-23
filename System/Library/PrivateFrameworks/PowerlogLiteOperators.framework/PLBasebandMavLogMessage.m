@implementation PLBasebandMavLogMessage

- (PLBasebandMavLogMessage)initWithData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  PLBasebandMavLogMessage *v12;
  PLBasebandMavLogMessage *v13;
  NSData *payload;
  PLBasebandMavLogMessage *v15;
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
    block[2] = __40__PLBasebandMavLogMessage_initWithData___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED886DA8 != -1)
      dispatch_once(&qword_1ED886DA8, block);
    if (_MergedGlobals_97)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandMavLogMessage initWithData:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMavLogMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandMavLogMessage initWithData:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 22);

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
  v17.super_class = (Class)PLBasebandMavLogMessage;
  v12 = -[PLBasebandMessage initWithData:](&v17, sel_initWithData_, v4);
  v13 = v12;
  if (!v12
    || (v12->_header = 0,
        payload = v12->_payload,
        v12->_payload = 0,
        payload,
        v15 = 0,
        -[PLBasebandMavLogMessage parseData:](v13, "parseData:", v4)))
  {
    v15 = v13;
  }

  return v15;
}

uint64_t __40__PLBasebandMavLogMessage_initWithData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_97 = result;
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
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  unint64_t v19;
  NSObject *v20;
  BOOL v21;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t block;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __37__PLBasebandMavLogMessage_parseData___block_invoke;
    v29 = &__block_descriptor_40_e5_v8__0lu32l8;
    v30 = v5;
    if (qword_1ED886DB0 != -1)
      dispatch_once(&qword_1ED886DB0, &block);
    if (byte_1ED886DA1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandMavLogMessage parseData:]", block, v27, v28, v29, v30);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMavLogMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandMavLogMessage parseData:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 35);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v32 = (uint64_t)v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = objc_retainAutorelease(v4);
  v13 = (unsigned __int8 *)objc_msgSend(v12, "bytes");
  v14 = &v13[2 * (*v13 == 129)];
  -[PLBasebandMavLogMessage setHeader:](self, "setHeader:", v14);
  v15 = v14 + 13;
  v16 = (unsigned __int16)-[PLBasebandMavLogMessage header](self, "header")[1];
  v17 = v16 - 12;
  if (v16 >= 0xD
    && (v18 = objc_retainAutorelease(v12),
        v19 = (unint64_t)&v15[v17 - objc_msgSend(v18, "bytes")],
        v19 <= objc_msgSend(v18, "length")))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v15, v17);
    v20 = objc_claimAutoreleasedReturnValue();
    -[PLBasebandMavLogMessage setPayload:](self, "setPayload:", v20);
    v21 = 1;
  }
  else
  {
    PLLogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_retainAutorelease(v12);
      v24 = (uint64_t)&v15[v17 - objc_msgSend(v23, "bytes")];
      v25 = objc_msgSend(v23, "length");
      *(_DWORD *)buf = 134218498;
      v32 = v24;
      v33 = 2048;
      v34 = v25;
      v35 = 2080;
      v36 = "-[PLBasebandMavLogMessage parseData:]";
      _os_log_error_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", buf, 0x20u);
    }
    v21 = 0;
  }

  return v21;
}

uint64_t __37__PLBasebandMavLogMessage_parseData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886DA1 = result;
  return result;
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
  objc_super v12;
  _QWORD block[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__PLBasebandMavLogMessage_logWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED886DB8 != -1)
      dispatch_once(&qword_1ED886DB8, block);
    if (byte_1ED886DA2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandMavLogMessage logWithLogger:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMavLogMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandMavLogMessage logWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 67);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PLBasebandMavLogMessage;
  -[PLBasebandMessage logWithLogger:](&v12, sel_logWithLogger_, v4);
  -[PLBasebandMavLogMessage header](self, "header");

}

uint64_t __41__PLBasebandMavLogMessage_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886DA2 = result;
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
    block[2] = __49__PLBasebandMavLogMessage_stringForUnknownBytes___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (qword_1ED886DC0 != -1)
      dispatch_once(&qword_1ED886DC0, block);
    if (byte_1ED886DA3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandMavLogMessage stringForUnknownBytes:]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMavLogMessage.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandMavLogMessage stringForUnknownBytes:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 120);

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

uint64_t __49__PLBasebandMavLogMessage_stringForUnknownBytes___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886DA3 = result;
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
    v13 = __46__PLBasebandMavLogMessage_tooShortErrorString__block_invoke;
    v14 = &__block_descriptor_40_e5_v8__0lu32l8;
    v15 = v3;
    if (qword_1ED886DC8 != -1)
      dispatch_once(&qword_1ED886DC8, &block);
    if (byte_1ED886DA4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandMavLogMessage tooShortErrorString]", block, v12, v13, v14, v15);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMavLogMessage.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandMavLogMessage tooShortErrorString]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 125);

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
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("short_length!(%d)"), (unsigned __int16)-[PLBasebandMavLogMessage header](self, "header")[1]);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __46__PLBasebandMavLogMessage_tooShortErrorString__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886DA4 = result;
  return result;
}

- (NSString)eventCodeString
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (unsigned)eventCode
{
  return self->_eventCode;
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
  objc_storeStrong((id *)&self->_eventCodeString, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
