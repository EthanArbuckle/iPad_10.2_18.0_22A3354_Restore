@implementation PLBasebandMessage

+ (id)messageWithData:(id)a3
{
  id v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  unsigned int v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  _QWORD block[5];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a3);
  v4 = (unsigned __int8 *)objc_msgSend(v3, "bytes");
  v5 = &v4[2 * (*v4 == 129)];
  v6 = *v5;
  if (v6 <= 3)
    goto LABEL_18;
  if (v6 == 4)
  {
    v7 = *(unsigned __int16 *)(v5 + 3);
    if ((v7 - 33) >= 5)
    {
      if (v7 == 1)
      {
        switch(*(_WORD *)(v5 + 15))
        {
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 7:
          case 8:
            goto LABEL_18;
          default:
            MGIsDeviceOneOfType();
            break;
        }
      }
    }
    else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v8 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__PLBasebandMessage_messageWithData___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v8;
      if (qword_1ED886E18 != -1)
        dispatch_once(&qword_1ED886E18, block);
      if (_MergedGlobals_99)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Mav health mon msgs"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMessage.m");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLBasebandMessage messageWithData:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 150);

        PLLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v9;
          _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    goto LABEL_18;
  }
  if (v6 != 255 || *(_WORD *)(v5 + 3) == 3)
  {
LABEL_18:
    v15 = (objc_class *)objc_opt_class();
    goto LABEL_19;
  }
  v15 = 0;
LABEL_19:
  v16 = (void *)objc_msgSend([v15 alloc], "initWithData:", v3);

  return v16;
}

uint64_t __37__PLBasebandMessage_messageWithData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_99 = result;
  return result;
}

- (PLBasebandMessage)initWithData:(id)a3
{
  id v5;
  PLBasebandMessage *v6;
  PLBasebandMessage *v7;
  uint64_t v8;
  NSDate *apTimestamp;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLBasebandMessage;
  v6 = -[PLBasebandMessage init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->rawData, a3);
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v8 = objc_claimAutoreleasedReturnValue();
    apTimestamp = v7->_apTimestamp;
    v7->_apTimestamp = (NSDate *)v8;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PLBasebandMessage;
  -[PLBasebandMessage dealloc](&v2, sel_dealloc);
}

- (BOOL)isTimestampValid:(char *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
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
    v4 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __38__PLBasebandMessage_isTimestampValid___block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v4;
    if (qword_1ED886E20 != -1)
      dispatch_once(&qword_1ED886E20, &block);
    if (byte_1ED886E11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandMessage isTimestampValid:]", block, v13, v14, v15, v16);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMessage.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandMessage isTimestampValid:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 206);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  return bswap64(*(_QWORD *)a3) != 0;
}

uint64_t __38__PLBasebandMessage_isTimestampValid___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886E11 = result;
  return result;
}

- (NSDate)timestamp
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v22[5];
  _QWORD block[5];
  uint8_t buf[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__PLBasebandMessage_timestamp__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1ED886E28 != -1)
      dispatch_once(&qword_1ED886E28, block);
    if (byte_1ED886E12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandMessage timestamp]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMessage.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandMessage timestamp]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 254);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v10 = -[NSData bytes](self->rawData, "bytes");
  v11 = &v10[2 * (*v10 == 129)];
  switch(*v11)
  {
    case 1u:
    case 2u:
    case 4u:
    case 8u:
      *(_QWORD *)buf = *(_QWORD *)(v11 + 5);
      if (!-[PLBasebandMessage isTimestampValid:](self, "isTimestampValid:", buf))
        goto LABEL_18;
      v12 = 5 * (*(_QWORD *)buf >> 16) + *(_WORD *)buf / 0x2667u + 2;
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(int)(1000 * ((v12 >> 2) - 1000 * (((v12 >> 2) * (unsigned __int128)0x4189374BC6A7F0uLL) >> 64)))/ 1000000.0+ (double)(uint64_t)(((v12 * (unsigned __int128)0x10624DD2F1A9FCuLL) >> 64) + 315964800));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v14 = objc_opt_class();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __30__PLBasebandMessage_timestamp__block_invoke_269;
        v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v22[4] = v14;
        if (qword_1ED886E30 != -1)
          dispatch_once(&qword_1ED886E30, v22);
        if (byte_1ED886E13)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown BB msg type, ret current date"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMessage.m");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "lastPathComponent");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandMessage timestamp]");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 281);

          PLLogCommon();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v15;
            _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
LABEL_18:
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return (NSDate *)v13;
}

uint64_t __30__PLBasebandMessage_timestamp__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886E12 = result;
  return result;
}

uint64_t __30__PLBasebandMessage_timestamp__block_invoke_269(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886E13 = result;
  return result;
}

- (NSDate)calibratedTimestamp
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t block;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __40__PLBasebandMessage_calibratedTimestamp__block_invoke;
    v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    v20 = v3;
    if (qword_1ED886E38 != -1)
      dispatch_once(&qword_1ED886E38, &block);
    if (byte_1ED886E14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandMessage calibratedTimestamp]", block, v17, v18, v19, v20);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMessage.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandMessage calibratedTimestamp]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 295);

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
  v10 = (void *)MEMORY[0x1E0C99D68];
  -[PLBasebandMessage timeCalibration](self, "timeCalibration");
  v12 = v11;
  -[PLBasebandMessage timestamp](self, "timestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateWithTimeInterval:sinceDate:", v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v14;
}

uint64_t __40__PLBasebandMessage_calibratedTimestamp__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886E14 = result;
  return result;
}

- (BOOL)isCalibratedDateGood
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
  double v12;
  double v13;
  uint64_t block;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __41__PLBasebandMessage_isCalibratedDateGood__block_invoke;
    v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    v20 = v3;
    if (qword_1ED886E40 != -1)
      dispatch_once(&qword_1ED886E40, &block);
    if (byte_1ED886E15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandMessage isCalibratedDateGood]", block, v17, v18, v19, v20);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMessage.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandMessage isCalibratedDateGood]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 304);

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
  -[PLBasebandMessage calibratedTimestamp](self, "calibratedTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage apTimestamp](self, "apTimestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v11);
  v13 = v12;

  if (v13 >= 0.0 && v13 <= 60.0)
    return 1;
  if (v13 < 0.0)
    return v13 > -86400.0;
  return 0;
}

uint64_t __41__PLBasebandMessage_isCalibratedDateGood__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886E15 = result;
  return result;
}

- (void)logWithLogger:(id)a3
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  NSNumber *v6;
  NSNumber *seqNum;
  NSNumber *v8;
  NSNumber *msgType;
  NSString *v10;
  NSString *pload;

  v4 = -[NSData bytes](self->rawData, "bytes", a3);
  if (*v4 == 129)
  {
    v5 = v4;
    v6 = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedChar:", v4[1]);
    seqNum = self->_seqNum;
    self->_seqNum = v6;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v5[2]);
    v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    msgType = self->_msgType;
    self->_msgType = v8;

  }
  -[NSData description](self->rawData, "description");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  pload = self->_pload;
  self->_pload = v10;

  -[PLBasebandMessage logEntry:withBody:](self, "logEntry:withBody:", CFSTR("Baseband Log"), 0);
}

- (void)logEntry:(id)a3 withBody:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSDate *v9;
  NSDate *date;
  double v11;
  uint64_t v12;
  _QWORD block[5];

  if (!-[PLBasebandMessage isCalibratedDateGood](self, "isCalibratedDateGood", a3, a4))
  {
    -[PLBasebandMessage apTimestamp](self, "apTimestamp");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBasebandMessage timestamp](self, "timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v6);
    v8 = v7;

    -[PLBasebandMessage setTimeCalibration:](self, "setTimeCalibration:", v8);
  }
  -[PLBasebandMessage timestamp](self, "timestamp");
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  date = self->_date;
  self->_date = v9;

  -[PLBasebandMessage timeCalibration](self, "timeCalibration");
  self->_timeCal = v11;
  v12 = objc_opt_class();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PLBasebandMessage_logEntry_withBody___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = v12;
  if (qword_1ED886E48 != -1)
    dispatch_once(&qword_1ED886E48, block);
  if (byte_1ED886E16)
    -[PLBasebandMessage logMsgAll](self, "logMsgAll");
}

uint64_t __39__PLBasebandMessage_logEntry_withBody___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886E16 = result;
  return result;
}

- (void)logMsgAll
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  PLBBMsgAll *v10;
  void *v11;
  void *v12;
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
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __30__PLBasebandMessage_logMsgAll__block_invoke;
    v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    v20 = v3;
    if (qword_1ED886E50 != -1)
      dispatch_once(&qword_1ED886E50, &block);
    if (byte_1ED886E17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandMessage logMsgAll]", block, v17, v18, v19, v20);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandMessage.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandMessage logMsgAll]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 420);

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
  v10 = objc_alloc_init(PLBBMsgAll);
  -[PLBasebandMessage agent](self, "agent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMsgRoot setAgent:](v10, "setAgent:", v11);

  -[PLBasebandMessage pload](self, "pload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMsgAll setPayload:](v10, "setPayload:", v12);

  -[PLBasebandMessage seqNum](self, "seqNum");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMsgAll setSeqNum:](v10, "setSeqNum:", v13);

  -[PLBasebandMessage date](self, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMsgAll setBbDate:](v10, "setBbDate:", v14);

  -[PLBBMsgAll setError:](v10, "setError:", CFSTR("no error"));
  -[PLBasebandMessage msgType](self, "msgType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBMsgRoot setMsgType:](v10, "setMsgType:", v15);

  -[PLBBMsgAll logEventNoneBBMsgAll](v10, "logEventNoneBBMsgAll");
}

uint64_t __30__PLBasebandMessage_logMsgAll__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886E17 = result;
  return result;
}

- (NSData)rawData
{
  return self->rawData;
}

- (unsigned)ticksInGoodState
{
  return self->ticksInGoodState;
}

- (unsigned)ticksInGPSONState
{
  return self->ticksInGPSONState;
}

- (double)timeCalibration
{
  return self->timeCalibration;
}

- (void)setTimeCalibration:(double)a3
{
  self->timeCalibration = a3;
}

- (NSDate)apTimestamp
{
  return self->_apTimestamp;
}

- (PLBBMsg)logger
{
  return (PLBBMsg *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLogger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
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

- (double)timeCal
{
  return self->_timeCal;
}

- (void)setTimeCal:(double)a3
{
  self->_timeCal = a3;
}

- (NSString)pload
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPload:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)msgType
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMsgType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_msgType, 0);
  objc_storeStrong((id *)&self->_pload, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_seqNum, 0);
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_apTimestamp, 0);
  objc_storeStrong((id *)&self->rawData, 0);
}

@end
