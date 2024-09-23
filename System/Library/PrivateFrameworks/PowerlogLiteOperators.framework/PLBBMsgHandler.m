@implementation PLBBMsgHandler

- (PLBBMsgHandler)init
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
    v13 = __22__PLBBMsgHandler_init__block_invoke;
    v14 = &__block_descriptor_40_e5_v8__0lu32l8;
    v15 = v3;
    if (qword_1ED886DE8 != -1)
      dispatch_once(&qword_1ED886DE8, &block);
    if (_MergedGlobals_98)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMsgHandler init]", block, v12, v13, v14, v15);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgHandler.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMsgHandler init]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 55);

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

  return 0;
}

uint64_t __22__PLBBMsgHandler_init__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_98 = result;
  return result;
}

+ (id)getMsgHandler
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  PLBBMsgHandler *v10;
  void *v11;
  id v12;
  void *v13;
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
    v2 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __31__PLBBMsgHandler_getMsgHandler__block_invoke;
    v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    v19 = v2;
    if (qword_1ED886DF0 != -1)
      dispatch_once(&qword_1ED886DF0, &block);
    if (byte_1ED886DD1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "+[PLBBMsgHandler getMsgHandler]", block, v16, v17, v18, v19);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgHandler.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLBBMsgHandler getMsgHandler]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 61);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v3;
        _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v9 = (void *)qword_1ED886DD8;
  if (!qword_1ED886DD8)
  {
    v10 = objc_alloc_init(PLBBMsgHandler);
    v11 = (void *)qword_1ED886DD8;
    qword_1ED886DD8 = (uint64_t)v10;

    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = (void *)qword_1ED886DE0;
    qword_1ED886DE0 = (uint64_t)v12;

    v9 = (void *)qword_1ED886DD8;
  }
  return v9;
}

uint64_t __31__PLBBMsgHandler_getMsgHandler__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886DD1 = result;
  return result;
}

- (void)registerWithHandlerAs:(id)a3 forType:(unint64_t)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
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
  v5 = (void *)MEMORY[0x1E0D7FFA0];
  v6 = a3;
  if (objc_msgSend(v5, "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __48__PLBBMsgHandler_registerWithHandlerAs_forType___block_invoke;
    v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    v20 = v7;
    if (qword_1ED886DF8 != -1)
      dispatch_once(&qword_1ED886DF8, &block);
    if (byte_1ED886DD2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMsgHandler registerWithHandlerAs:forType:]", block, v17, v18, v19, v20);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgHandler.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMsgHandler registerWithHandlerAs:forType:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 88);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v14 = (void *)qword_1ED886DE0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v6, v15);

}

uint64_t __48__PLBBMsgHandler_registerWithHandlerAs_forType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886DD2 = result;
  return result;
}

- (void)handleMsg:(id)a3 forAgent:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
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
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled", a3, a4))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __37__PLBBMsgHandler_handleMsg_forAgent___block_invoke;
    v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    v19 = v5;
    if (qword_1ED886E00 != -1)
      dispatch_once(&qword_1ED886E00, &block);
    if (byte_1ED886DD3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMsgHandler handleMsg:forAgent:]", block, v16, v17, v18, v19);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgHandler.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMsgHandler handleMsg:forAgent:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 97);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBMsgHandler decodeMsgHeader](self, "decodeMsgHeader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedCharValue");

  switch(v13)
  {
    case 1:
      v14 = &unk_1E86336D8;
      break;
    case 2:
      v14 = &unk_1E86336A8;
      break;
    case 4:
      v14 = &unk_1E86336C0;
      break;
    default:
      return;
  }
  objc_msgSend((id)qword_1ED886DE0, "objectForKey:", v14);

}

uint64_t __37__PLBBMsgHandler_handleMsg_forAgent___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886DD3 = result;
  return result;
}

- (id)decodeMsgHeader
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t block;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __33__PLBBMsgHandler_decodeMsgHeader__block_invoke;
    v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    v14 = v2;
    if (qword_1ED886E08 != -1)
      dispatch_once(&qword_1ED886E08, &block);
    if (byte_1ED886DD4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMsgHandler decodeMsgHeader]", block, v11, v12, v13, v14);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgHandler.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMsgHandler decodeMsgHeader]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 132);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v3;
        _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  return &unk_1E86336F0;
}

uint64_t __33__PLBBMsgHandler_decodeMsgHeader__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886DD4 = result;
  return result;
}

- (NSData)rawData
{
  return self->_rawData;
}

- (void)setRawData:(id)a3
{
  objc_storeStrong((id *)&self->_rawData, a3);
}

- (PLAgent)agent
{
  return self->_agent;
}

- (void)setAgent:(id)a3
{
  objc_storeStrong((id *)&self->_agent, a3);
}

- (NSNumber)seqNum
{
  return self->_seqNum;
}

- (void)setSeqNum:(id)a3
{
  objc_storeStrong((id *)&self->_seqNum, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (unsigned)ticksInGoodState
{
  return self->_ticksInGoodState;
}

- (unsigned)ticksInGPSONState
{
  return self->_ticksInGPSONState;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSDate)apTimestamp
{
  return self->_apTimestamp;
}

- (NSDate)calibratedTimestamp
{
  return self->_calibratedTimestamp;
}

- (double)timeCalibration
{
  return self->_timeCalibration;
}

- (void)setTimeCalibration:(double)a3
{
  self->_timeCalibration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calibratedTimestamp, 0);
  objc_storeStrong((id *)&self->_apTimestamp, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_seqNum, 0);
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_rawData, 0);
}

@end
