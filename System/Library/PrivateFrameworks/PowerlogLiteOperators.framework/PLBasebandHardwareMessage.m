@implementation PLBasebandHardwareMessage

- (PLBasebandHardwareMessage)initWithData:(id)a3
{
  id v4;
  PLBasebandHardwareMessage *v5;
  PLBasebandHardwareMessage *v6;
  PLBasebandHardwareMessage *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLBasebandHardwareMessage;
  v5 = -[PLBasebandMessage initWithData:](&v9, sel_initWithData_, v4);
  v6 = v5;
  if (!v5)
    goto LABEL_3;
  -[PLBasebandHardwareMessage setHeader:](v5, "setHeader:", 0);
  -[PLBasebandHardwareMessage setSystem:](v6, "setSystem:", 0);
  -[PLBasebandHardwareMessage setArmPerf:](v6, "setArmPerf:", 0);
  -[PLBasebandHardwareMessage setMdsp:](v6, "setMdsp:", 0);
  -[PLBasebandHardwareMessage setMdm:](v6, "setMdm:", 0);
  -[PLBasebandHardwareMessage setAdsp:](v6, "setAdsp:", 0);
  -[PLBasebandHardwareMessage setAdm:](v6, "setAdm:", 0);
  -[PLBasebandHardwareMessage setGps:](v6, "setGps:", 0);
  -[PLBasebandHardwareMessage setUsb:](v6, "setUsb:", 0);
  -[PLBasebandHardwareMessage setUart:](v6, "setUart:", 0);
  -[PLBasebandHardwareMessage setSpi:](v6, "setSpi:", 0);
  -[PLBasebandHardwareMessage setRx:](v6, "setRx:", 0);
  -[PLBasebandHardwareMessage setTx:](v6, "setTx:", 0);
  v7 = 0;
  if (-[PLBasebandHardwareMessage parseData:](v6, "parseData:", v4))
LABEL_3:
    v7 = v6;

  return v7;
}

- (BOOL)parseData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  NSObject *v9;
  BOOL v10;
  id v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  -[PLBasebandHardwareMessage setHeader:](self, "setHeader:", v5 + 13);
  if (-[PLBasebandHardwareMessage revision](self, "revision") <= 2)
  {
    v6 = v5 + 29;
    -[PLBasebandHardwareMessage setLogDuration:](self, "setLogDuration:", ((_DWORD)-[PLBasebandHardwareMessage header](self, "header")[12]- (_DWORD)-[PLBasebandHardwareMessage header](self, "header")[8]));
    if (-[PLBasebandHardwareMessage level](self, "level"))
    {
      -[PLBasebandHardwareMessage setSystem:](self, "setSystem:", v5 + 29);
      v6 = v5 + 49;
    }
    if (-[PLBasebandHardwareMessage level](self, "level") >= 4)
    {
      -[PLBasebandHardwareMessage setArmPerf:](self, "setArmPerf:", v6);
      v6 += 40;
    }
    if (-[PLBasebandHardwareMessage level](self, "level") >= 3)
    {
      -[PLBasebandHardwareMessage setMdsp:](self, "setMdsp:", v6);
      -[PLBasebandHardwareMessage setMdm:](self, "setMdm:", v6 + 60);
      -[PLBasebandHardwareMessage setAdsp:](self, "setAdsp:", v6 + 76);
      -[PLBasebandHardwareMessage setAdm:](self, "setAdm:", v6 + 136);
      -[PLBasebandHardwareMessage setGps:](self, "setGps:", v6 + 152);
      -[PLBasebandHardwareMessage setUsb:](self, "setUsb:", v6 + 168);
      -[PLBasebandHardwareMessage setUart:](self, "setUart:", v6 + 184);
      -[PLBasebandHardwareMessage setSpi:](self, "setSpi:", v6 + 216);
      v6 += 232;
    }
    if (-[PLBasebandHardwareMessage level](self, "level") >= 6)
    {
      -[PLBasebandHardwareMessage setRx:](self, "setRx:", v6);
      -[PLBasebandHardwareMessage setTx:](self, "setTx:", v6 + 120);
      v6 += 168;
    }
    v7 = objc_retainAutorelease(v4);
    v8 = v6 - objc_msgSend(v7, "bytes");
    if (v8 <= objc_msgSend(v7, "length"))
    {
      v10 = 1;
      goto LABEL_16;
    }
    PLLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_retainAutorelease(v7);
      v13 = 134218498;
      v14 = v6 - objc_msgSend(v12, "bytes");
      v15 = 2048;
      v16 = objc_msgSend(v12, "length");
      v17 = 2080;
      v18 = "-[PLBasebandHardwareMessage parseData:]";
      _os_log_error_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", (uint8_t *)&v13, 0x20u);
    }

  }
  v10 = 0;
LABEL_16:

  return v10;
}

- (void)logWithLogger:(id)a3
{
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  PLBBMavLogMsg *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[PLBasebandHardwareMessage logRawWithLogger:](self, "logRawWithLogger:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__PLBasebandHardwareMessage_logWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED8870A8 != -1)
      dispatch_once(&qword_1ED8870A8, block);
    if (_MergedGlobals_109)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandHardwareMessage logWithLogger:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandHardwareMessage logWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 154);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v5 = MEMORY[0x1E0C809B0];
    }
  }
  v12 = objc_alloc_init(PLBBMavLogMsg);
  -[PLBasebandMessage agent](self, "agent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage setAgent:](v12, "setAgent:", v13);

  -[PLBBMavLogMsg setError:](v12, "setError:", &stru_1E8587D00);
  -[PLBasebandMessage seqNum](self, "seqNum");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage date](self, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage timeCal](self, "timeCal");
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v12, "setHeaderWithSeqNum:andDate:andTimeCal:", v14, v15);

  -[PLBasebandHardwareMessage logHeaderWithLogger:](self, "logHeaderWithLogger:", v12);
  -[PLBasebandHardwareMessage logProcessorWithLogger:](self, "logProcessorWithLogger:", v12);
  -[PLBasebandHardwareMessage logModemAppWithLogger:](self, "logModemAppWithLogger:", v12);
  -[PLBasebandHardwareMessage logPeripheralsWithLogger:](self, "logPeripheralsWithLogger:", v12);
  -[PLBBMavLogMsg addToGroupPLBBMav1HwOther](v12, "addToGroupPLBBMav1HwOther");
  -[PLBasebandHardwareMessage logRFWithLogger2:](self, "logRFWithLogger2:", v12);
  -[PLBBMavLogMsg logEventBackwardGrpEntriesBBMavHw](v12, "logEventBackwardGrpEntriesBBMavHw");
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v22[0] = v5;
    v22[1] = 3221225472;
    v22[2] = __43__PLBasebandHardwareMessage_logWithLogger___block_invoke_253;
    v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v22[4] = objc_opt_class();
    if (qword_1ED8870B0 != -1)
      dispatch_once(&qword_1ED8870B0, v22);
    if (byte_1ED887091)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoding BB HW RF completed"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandHardwareMessage logWithLogger:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 175);

      PLLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v16;
        _os_log_debug_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __43__PLBasebandHardwareMessage_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_109 = result;
  return result;
}

uint64_t __43__PLBasebandHardwareMessage_logWithLogger___block_invoke_253(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887091 = result;
  return result;
}

- (void)logRawWithLogger:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLBasebandHardwareMessage;
  -[PLBasebandMessage logWithLogger:](&v3, sel_logWithLogger_, a3);
}

- (void)logHeaderWithLogger:(id)a3
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
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t block;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __49__PLBasebandHardwareMessage_logHeaderWithLogger___block_invoke;
    v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    v21 = v5;
    if (qword_1ED8870B8 != -1)
      dispatch_once(&qword_1ED8870B8, &block);
    if (byte_1ED887092)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandHardwareMessage logHeaderWithLogger:]", block, v18, v19, v20, v21);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandHardwareMessage logHeaderWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 186);

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
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = v4;
  objc_msgSend(v12, "numberWithUnsignedInt:", -[PLBasebandHardwareMessage logDuration](self, "logDuration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBbHwLogDurationInTicks:", v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBasebandHardwareMessage level](self, "level"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBbHwStatsLevel:", v15);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBasebandHardwareMessage revision](self, "revision"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBbHwRev:", v16);

}

uint64_t __49__PLBasebandHardwareMessage_logHeaderWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887092 = result;
  return result;
}

- (void)logProcessorWithLogger:(id)a3
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
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__PLBasebandHardwareMessage_logProcessorWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED8870C0 != -1)
      dispatch_once(&qword_1ED8870C0, block);
    if (byte_1ED887093)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandHardwareMessage logProcessorWithLogger:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandHardwareMessage logProcessorWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 197);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = v4;
  if (-[PLBasebandHardwareMessage system](self, "system"))
  {
    self->super.ticksInGoodState = -[PLBasebandHardwareMessage system](self, "system")[16];
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBasebandHardwareMessage system](self, "system") + 8, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBbHwProcSystemState:", v13);
LABEL_10:

    goto LABEL_18;
  }
  objc_msgSend(v12, "appendToError:", CFSTR("System_State=<unknown>"));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v14 = objc_opt_class();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __52__PLBasebandHardwareMessage_logProcessorWithLogger___block_invoke_263;
    v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v28[4] = v14;
    if (qword_1ED8870C8 != -1)
      dispatch_once(&qword_1ED8870C8, v28);
    if (byte_1ED887094)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("System_State=<unknown>"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandHardwareMessage logProcessorWithLogger:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v17, v18, 214);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v13;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_10;
    }
  }
LABEL_18:
  if (-[PLBasebandHardwareMessage armPerf](self, "armPerf"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBasebandHardwareMessage armPerf](self, "armPerf") + 12, 7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBbHwProcArmPerfState:", v20);
LABEL_20:

    goto LABEL_28;
  }
  objc_msgSend(v12, "appendToError:", CFSTR("ARM_Perf_Level=<unknown>"));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v21 = objc_opt_class();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __52__PLBasebandHardwareMessage_logProcessorWithLogger___block_invoke_268;
    v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v27[4] = v21;
    if (qword_1ED8870D0 != -1)
      dispatch_once(&qword_1ED8870D0, v27);
    if (byte_1ED887095)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ARM_Perf_Level=<unknown>"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandHardwareMessage logProcessorWithLogger:]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v24, v25, 233);

      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v20;
        _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_20;
    }
  }
LABEL_28:
  objc_msgSend(v12, "setType:", CFSTR("BB HW Log"));

}

uint64_t __52__PLBasebandHardwareMessage_logProcessorWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887093 = result;
  return result;
}

uint64_t __52__PLBasebandHardwareMessage_logProcessorWithLogger___block_invoke_263(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887094 = result;
  return result;
}

uint64_t __52__PLBasebandHardwareMessage_logProcessorWithLogger___block_invoke_268(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887095 = result;
  return result;
}

- (void)logModemAppWithLogger:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t block;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __51__PLBasebandHardwareMessage_logModemAppWithLogger___block_invoke;
    v24 = &__block_descriptor_40_e5_v8__0lu32l8;
    v25 = v5;
    if (qword_1ED8870D8 != -1)
      dispatch_once(&qword_1ED8870D8, &block);
    if (byte_1ED887096)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandHardwareMessage logModemAppWithLogger:]", block, v22, v23, v24, v25);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandHardwareMessage logModemAppWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 242);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = v4;
  if (-[PLBasebandHardwareMessage mdsp](self, "mdsp"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBasebandHardwareMessage mdsp](self, "mdsp") + 8, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBbHwModemAppMdspState:", v13);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBasebandHardwareMessage mdsp](self, "mdsp") + 24, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBbHwModemAppMdspClockState:", v14);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBasebandHardwareMessage mdsp](self, "mdsp") + 40, 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBbHwModemAppMdspSpeed:", v15);

  }
  else
  {
    objc_msgSend(v12, "appendToError:", CFSTR("MDSP=<unknown>"));
  }
  if (-[PLBasebandHardwareMessage mdm](self, "mdm"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBasebandHardwareMessage mdm](self, "mdm") + 8, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBbHwModemAppMdmState:", v16);

  }
  else
  {
    objc_msgSend(v12, "appendToError:", CFSTR("MDM=<unknown>"));
  }
  if (-[PLBasebandHardwareMessage adsp](self, "adsp"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBasebandHardwareMessage adsp](self, "adsp") + 8, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBbHwModemAppAdspState:", v17);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBasebandHardwareMessage adsp](self, "adsp") + 24, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBbHwModemAppAdspClockState:", v18);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBasebandHardwareMessage adsp](self, "adsp") + 8, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBbHwModemAppAdspSpeed:", v19);

  }
  else
  {
    objc_msgSend(v12, "appendToError:", CFSTR("ADSP_Speed=<unknown>"));
  }
  if (-[PLBasebandHardwareMessage adm](self, "adm"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBasebandHardwareMessage adm](self, "adm") + 8, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBbHwModemAppAdmState:", v20);

  }
  else
  {
    objc_msgSend(v12, "appendToError:", CFSTR("ADM=<unknown>"));
  }
  objc_msgSend(v12, "setType:", CFSTR("BB HW Modem/App"));

}

uint64_t __51__PLBasebandHardwareMessage_logModemAppWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887096 = result;
  return result;
}

- (void)logPeripheralsWithLogger:(id)a3
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
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
    block[2] = __54__PLBasebandHardwareMessage_logPeripheralsWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED8870E0 != -1)
      dispatch_once(&qword_1ED8870E0, block);
    if (byte_1ED887097)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandHardwareMessage logPeripheralsWithLogger:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandHardwareMessage logPeripheralsWithLogger:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 334);

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
  v13 = v4;
  if (-[PLBasebandHardwareMessage gps](self, "gps"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBasebandHardwareMessage gps](self, "gps") + 8, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBbHwPeripheralGPSState:", v14);

  }
  else
  {
    objc_msgSend(v13, "appendToError:", CFSTR("GPS=<unknown>"));
  }
  if (-[PLBasebandHardwareMessage usb](self, "usb"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBasebandHardwareMessage usb](self, "usb") + 8, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBbHwPeripheralUSBState:", v15);

  }
  else
  {
    objc_msgSend(v13, "appendToError:", CFSTR("USB=<unknown>"));
  }
  if (-[PLBasebandHardwareMessage spi](self, "spi"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBasebandHardwareMessage spi](self, "spi") + 8, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBbHwPeripheralSPIState:", v16);

  }
  else
  {
    objc_msgSend(v13, "appendToError:", CFSTR("SPI=<unknown>"));
  }
  if (-[PLBasebandHardwareMessage uart](self, "uart"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBasebandHardwareMessage uart](self, "uart") + 24, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBbHwPeripheralUARTState:", v17);

  }
  else
  {
    objc_msgSend(v13, "appendToError:", CFSTR("UART_Clock=<unknown>"));
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v24[0] = v6;
    v24[1] = 3221225472;
    v24[2] = __54__PLBasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_291;
    v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v24[4] = objc_opt_class();
    if (qword_1ED8870E8 != -1)
      dispatch_once(&qword_1ED8870E8, v24);
    if (byte_1ED887098)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW Peripheral"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandHardwareMessage logPeripheralsWithLogger:]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 404);

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

}

uint64_t __54__PLBasebandHardwareMessage_logPeripheralsWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887097 = result;
  return result;
}

uint64_t __54__PLBasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_291(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887098 = result;
  return result;
}

- (void)logRFWithLogger2:(id)a3
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
  PLBBMavLogMsg *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _PLBasebandHWStatsTXPower *v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD block[5];
  uint8_t v49[4];
  void *v50;
  _OWORD buf[6];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__PLBasebandHardwareMessage_logRFWithLogger2___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED8870F0 != -1)
      dispatch_once(&qword_1ED8870F0, block);
    if (byte_1ED887099)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandHardwareMessage logRFWithLogger2:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandHardwareMessage logRFWithLogger2:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 409);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf[0]) = 138412290;
        *(_QWORD *)((char *)buf + 4) = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)buf, 0xCu);
      }

    }
  }
  v12 = v4;
  v13 = objc_alloc_init(PLBBMavLogMsg);
  -[PLBasebandMessage agent](self, "agent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage setAgent:](v13, "setAgent:", v14);

  -[PLBBMavLogMsg setError:](v13, "setError:", &stru_1E8587D00);
  -[PLBasebandMessage seqNum](self, "seqNum");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage date](self, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage timeCal](self, "timeCal");
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

  if (-[PLBasebandHardwareMessage rx](self, "rx") && -[PLBasebandHardwareMessage tx](self, "tx"))
  {
    buf[0] = *(_OWORD *)-[PLBasebandHardwareMessage rx](self, "rx");
    v17 = -[PLBasebandHardwareMessage sumHardwareStat:ofSize:](self, "sumHardwareStat:ofSize:", buf, 4);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v17);
    -[PLBBMavLogMsg setRxTicks:](v13, "setRxTicks:", v18);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBasebandHardwareMessage rx](self, "rx"), 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavLogMsg setRssiModeCount:](v13, "setRssiModeCount:", v19);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBasebandHardwareMessage rx](self, "rx") + 16, 13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavLogMsg setRx0RssiPowerHist:](v13, "setRx0RssiPowerHist:", v20);

    v21 = -[PLBasebandHardwareMessage tx](self, "tx");
    v23 = *(_OWORD *)&v21->var0[4];
    v22 = *(_OWORD *)&v21->var0[8];
    buf[0] = *(_OWORD *)v21->var0;
    buf[1] = v23;
    buf[2] = v22;
    v24 = -[PLBasebandHardwareMessage sumHardwareStat:ofSize:](self, "sumHardwareStat:ofSize:", buf, 12);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavLogMsg setTxTicks:](v13, "setTxTicks:", v25);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBasebandHardwareMessage logDuration](self, "logDuration"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavLogMsg setBbHwLogDurationInTicks:](v13, "setBbHwLogDurationInTicks:", v26);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBasebandHardwareMessage tx](self, "tx"), 12);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavLogMsg setTxPowerHist1x:](v13, "setTxPowerHist1x:", v27);

    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLBasebandHardwareMessage rx](self, "rx") + 68, 12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBMavLogMsg setTxPowerHistEVDO:](v13, "setTxPowerHistEVDO:", v28);

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v29 = objc_opt_class();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __46__PLBasebandHardwareMessage_logRFWithLogger2___block_invoke_301;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v29;
      if (qword_1ED887100 != -1)
        dispatch_once(&qword_1ED887100, v46);
      if (byte_1ED88709B)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded Mav BB HW RF"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "lastPathComponent");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandHardwareMessage logRFWithLogger2:]");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v33, v34, 463);

        PLLogCommon();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v49 = 138412290;
          v50 = v30;
          _os_log_debug_impl(&dword_1CAF47000, v35, OS_LOG_TYPE_DEBUG, "%@", v49, 0xCu);
        }

      }
    }
    -[PLBBMavLogMsg logEventBackwardGrpEntriesBBMav1HwOtherPerRAT](v13, "logEventBackwardGrpEntriesBBMav1HwOtherPerRAT");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKey:", CFSTR("entry"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKey:", CFSTR("name"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addToGroupPLBBMavHwEntry:withEntryKey:", v37, v38);

  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v39 = objc_opt_class();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __46__PLBasebandHardwareMessage_logRFWithLogger2___block_invoke_296;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v39;
      if (qword_1ED8870F8 != -1)
        dispatch_once(&qword_1ED8870F8, v47);
      if (byte_1ED88709A)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: BB HW RF <RAT> is expected but not present"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "lastPathComponent");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandHardwareMessage logRFWithLogger2:]");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "logMessage:fromFile:fromFunction:fromLineNumber:", v40, v43, v44, 432);

        PLLogCommon();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf[0]) = 138412290;
          *(_QWORD *)((char *)buf + 4) = v40;
          _os_log_debug_impl(&dword_1CAF47000, v45, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)buf, 0xCu);
        }

      }
    }
    -[PLBBMavLogMsg appendToError:](v13, "appendToError:", CFSTR("Error: BB HW RF <RAT> is expected but not present"));
    -[PLBBMavLogMsg logEventBackwardMavBBHwOtherPerRAT](v13, "logEventBackwardMavBBHwOtherPerRAT");
  }

}

uint64_t __46__PLBasebandHardwareMessage_logRFWithLogger2___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887099 = result;
  return result;
}

uint64_t __46__PLBasebandHardwareMessage_logRFWithLogger2___block_invoke_296(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88709A = result;
  return result;
}

uint64_t __46__PLBasebandHardwareMessage_logRFWithLogger2___block_invoke_301(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88709B = result;
  return result;
}

- (unsigned)revision
{
  return *(_DWORD *)-[PLBasebandHardwareMessage header](self, "header");
}

- (unsigned)level
{
  return -[PLBasebandHardwareMessage header](self, "header")[4];
}

- (void)formatOnOffStates:(_PLBasebandHWOnOffComponentStats *)a3 inString:(id)a4
{
  -[PLBasebandHardwareMessage formatArray:ofSize:inString:](self, "formatArray:ofSize:inString:", a3->var2, 2, a4);
}

- (void)formatArray:(unsigned int *)a3 ofSize:(unsigned int)a4 inString:(id)a5
{
  -[PLBasebandHardwareMessage formatArray:ofSize:inString:inReverse:](self, "formatArray:ofSize:inString:inReverse:", a3, *(_QWORD *)&a4, a5, 0);
}

- (void)formatArray:(unsigned int *)a3 ofSize:(unsigned int)a4 inString:(id)a5 inReverse:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  double v10;
  id v11;

  v6 = a6;
  v7 = *(_QWORD *)&a4;
  v11 = a5;
  *(float *)&v10 = 100.0 / (float)-[PLBasebandHardwareMessage logDuration](self, "logDuration");
  -[PLBasebandHardwareMessage formatArray:ofSize:withMultiplier:inString:inReverse:](self, "formatArray:ofSize:withMultiplier:inString:inReverse:", a3, v7, v11, v6, v10);

}

- (void)formatArray:(unsigned int *)a3 ofSize:(unsigned int)a4 withMultiplier:(float)a5 inString:(id)a6
{
  -[PLBasebandHardwareMessage formatArray:ofSize:withMultiplier:inString:inReverse:](self, "formatArray:ofSize:withMultiplier:inString:inReverse:", a3, *(_QWORD *)&a4, a6, 0);
}

- (void)formatArray:(unsigned int *)a3 ofSize:(unsigned int)a4 withMultiplier:(float)a5 inString:(id)a6 inReverse:(BOOL)a7
{
  _BOOL4 v7;
  uint64_t v9;
  BOOL v12;
  BOOL v13;
  double v14;
  void *v15;
  unint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  float v20;
  float v21;
  id v22;

  v7 = a7;
  v9 = *(_QWORD *)&a4;
  v22 = a6;
  *(float *)&v14 = fabsf(a5);
  v12 = *(float *)&v14 < INFINITY;
  v13 = *(float *)&v14 <= INFINITY;
  LODWORD(v14) = 0;
  if (v12)
    *(float *)&v14 = a5;
  if (v13)
    a5 = *(float *)&v14;
  -[PLBasebandHardwareMessage convertToObjectArray:ofSize:](self, "convertToObjectArray:ofSize:", a3, v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v22, "appendString:", CFSTR("["));
    if (objc_msgSend(v15, "count"))
    {
      v16 = 0;
      v17 = CFSTR("%];");
      do
      {
        if (v16)
          objc_msgSend(v22, "appendString:", CFSTR(","));
        v18 = v16;
        if (v7)
          v18 = objc_msgSend(v15, "count", v16) + ~v16;
        objc_msgSend(v15, "objectAtIndexedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "floatValue");
        v21 = a5 * v20;

        if (v21 >= 0.01)
          objc_msgSend(v22, "appendFormat:", CFSTR("%.02f"), v21);
        else
          objc_msgSend(v22, "appendString:", CFSTR("0"), v21);
        ++v16;
      }
      while (v16 < objc_msgSend(v15, "count"));
    }
    else
    {
      v17 = CFSTR("%];");
    }
  }
  else
  {
    v17 = CFSTR("[Array Length > FORMAT_ARRAY_MAX_LENGTH]");
  }
  objc_msgSend(v22, "appendString:", v17);

}

- (id)convertUint8ArrayToNSArray:(char *)a3 ofSize:(unsigned int)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  unsigned int v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD v26[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__PLBasebandHardwareMessage_convertUint8ArrayToNSArray_ofSize___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1ED887108 != -1)
      dispatch_once(&qword_1ED887108, block);
    if (byte_1ED88709C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBasebandHardwareMessage convertUint8ArrayToNSArray:ofSize:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandHardwareMessage convertUint8ArrayToNSArray:ofSize:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 668);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a3 && a4)
  {
    v14 = a4;
    do
    {
      v15 = *a3++;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v16);

      --v14;
    }
    while (v14);
    v17 = v13;
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v18 = objc_opt_class();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __63__PLBasebandHardwareMessage_convertUint8ArrayToNSArray_ofSize___block_invoke_323;
      v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v26[4] = v18;
      if (qword_1ED887110 != -1)
        dispatch_once(&qword_1ED887110, v26);
      if (byte_1ED88709D)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bad input"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "lastPathComponent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandHardwareMessage convertUint8ArrayToNSArray:ofSize:]");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 672);

        PLLogCommon();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v19;
          _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v17 = (id)MEMORY[0x1E0C9AA60];
  }

  return v17;
}

uint64_t __63__PLBasebandHardwareMessage_convertUint8ArrayToNSArray_ofSize___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88709C = result;
  return result;
}

uint64_t __63__PLBasebandHardwareMessage_convertUint8ArrayToNSArray_ofSize___block_invoke_323(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88709D = result;
  return result;
}

- (id)convertUint16ArrayToNSArray:(unsigned __int16 *)a3 ofSize:(unsigned int)a4
{
  id v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[5];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a3 && a4)
  {
    v7 = a4;
    do
    {
      v8 = *a3++;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

      --v7;
    }
    while (v7);
    v10 = v6;
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v11 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__PLBasebandHardwareMessage_convertUint16ArrayToNSArray_ofSize___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v11;
      if (qword_1ED887118 != -1)
        dispatch_once(&qword_1ED887118, block);
      if (byte_1ED88709E)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bad input"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandHardwareMessage convertUint16ArrayToNSArray:ofSize:]");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 689);

        PLLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v12;
          _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

uint64_t __64__PLBasebandHardwareMessage_convertUint16ArrayToNSArray_ofSize___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88709E = result;
  return result;
}

- (id)convertUint32ArrayToNSArray:(unsigned int *)a3 ofSize:(unsigned int)a4
{
  id v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[5];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a3 && a4)
  {
    v7 = a4;
    do
    {
      v8 = *a3++;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

      --v7;
    }
    while (v7);
    v10 = v6;
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v11 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__PLBasebandHardwareMessage_convertUint32ArrayToNSArray_ofSize___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v11;
      if (qword_1ED887120 != -1)
        dispatch_once(&qword_1ED887120, block);
      if (byte_1ED88709F)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bad input"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:]");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 706);

        PLLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v12;
          _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

uint64_t __64__PLBasebandHardwareMessage_convertUint32ArrayToNSArray_ofSize___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88709F = result;
  return result;
}

- (id)convertUint64ArrayToNSArray:(unint64_t *)a3 ofSize:(unsigned int)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD block[5];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a3 && a4)
  {
    v7 = a4;
    do
    {
      v8 = *a3++;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

      --v7;
    }
    while (v7);
    v10 = v6;
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v11 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__PLBasebandHardwareMessage_convertUint64ArrayToNSArray_ofSize___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v11;
      if (qword_1ED887128 != -1)
        dispatch_once(&qword_1ED887128, block);
      if (byte_1ED8870A0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bad input"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBasebandHardwareMessage.m");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBasebandHardwareMessage convertUint64ArrayToNSArray:ofSize:]");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 723);

        PLLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v12;
          _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

uint64_t __64__PLBasebandHardwareMessage_convertUint64ArrayToNSArray_ofSize___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8870A0 = result;
  return result;
}

- (id)convertUint32ArrayToNSArray:(unsigned int *)a3 ofSize:(unsigned int)a4 andFill:(unsigned int)a5
{
  void *v6;
  void *v7;
  uint64_t v8;

  -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", a3, *(_QWORD *)&a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (a5)
  {
    v8 = a5;
    do
    {
      objc_msgSend(v7, "addObject:", &unk_1E8634EC0);
      --v8;
    }
    while (v8);
  }
  return v7;
}

- (id)convertToObjectArrayPercentage:(unsigned int *)a3 ofSize:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  unsigned int v9;
  float v10;
  unint64_t v11;
  void *v12;
  float v13;
  float v14;
  double v15;
  void *v16;

  v4 = *(_QWORD *)&a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PLBasebandHardwareMessage convertToObjectArray:ofSize:](self, "convertToObjectArray:ofSize:", a3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PLBasebandHardwareMessage logDuration](self, "logDuration");
  if ((float)(100.0 / (float)v9) == INFINITY)
    v10 = 0.0;
  else
    v10 = 100.0 / (float)v9;
  if (objc_msgSend(v8, "count"))
  {
    v11 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "floatValue");
      v14 = v10 * v13;

      *(float *)&v15 = v14;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v16);

      ++v11;
    }
    while (v11 < objc_msgSend(v8, "count"));
  }

  return v7;
}

- (id)convertToObjectArray:(unsigned int *)a3 ofSize:(unsigned int)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  void *v10;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a4 <= 0x18)
  {
    __memcpy_chk();
    if (a4)
    {
      v7 = a4;
      v8 = (unsigned int *)&v12;
      do
      {
        v9 = *v8++;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v10);

        --v7;
      }
      while (v7);
    }
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unsigned)sumHardwareStat:(unsigned int *)a3 ofSize:(unsigned int)a4
{
  unsigned int result;
  uint64_t v5;
  int v6;

  result = 0;
  if (a4)
  {
    v5 = a4;
    do
    {
      v6 = *a3++;
      result += v6;
      --v5;
    }
    while (v5);
  }
  return result;
}

- (unsigned)logDuration
{
  return self->_duration;
}

- (void)setLogDuration:(unsigned int)a3
{
  self->_duration = a3;
}

- (_PLBasebandHWStatsHeader)header
{
  return self->_header;
}

- (void)setHeader:(_PLBasebandHWStatsHeader *)a3
{
  self->_header = a3;
}

- (_PLBasebandHWStatsSystem)system
{
  return self->_system;
}

- (void)setSystem:(_PLBasebandHWStatsSystem *)a3
{
  self->_system = a3;
}

- (_PLBasebandHWStatsARMPerf)armPerf
{
  return self->_armPerf;
}

- (void)setArmPerf:(_PLBasebandHWStatsARMPerf *)a3
{
  self->_armPerf = a3;
}

- (_PLBasebandHWStatsMDSP)mdsp
{
  return self->_mdsp;
}

- (void)setMdsp:(_PLBasebandHWStatsMDSP *)a3
{
  self->_mdsp = a3;
}

- (_PLBasebandHWOnOffComponentStats)mdm
{
  return self->_mdm;
}

- (void)setMdm:(_PLBasebandHWOnOffComponentStats *)a3
{
  self->_mdm = a3;
}

- (_PLBasebandHWStatsADSP)adsp
{
  return self->_adsp;
}

- (void)setAdsp:(_PLBasebandHWStatsADSP *)a3
{
  self->_adsp = a3;
}

- (_PLBasebandHWOnOffComponentStats)adm
{
  return self->_adm;
}

- (void)setAdm:(_PLBasebandHWOnOffComponentStats *)a3
{
  self->_adm = a3;
}

- (_PLBasebandHWOnOffComponentStats)gps
{
  return self->_gps;
}

- (void)setGps:(_PLBasebandHWOnOffComponentStats *)a3
{
  self->_gps = a3;
}

- (_PLBasebandHWOnOffComponentStats)usb
{
  return self->_usb;
}

- (void)setUsb:(_PLBasebandHWOnOffComponentStats *)a3
{
  self->_usb = a3;
}

- (_PLBasebandHWStatsUART)uart
{
  return self->_uart;
}

- (void)setUart:(_PLBasebandHWStatsUART *)a3
{
  self->_uart = a3;
}

- (_PLBasebandHWOnOffComponentStats)spi
{
  return self->_spi;
}

- (void)setSpi:(_PLBasebandHWOnOffComponentStats *)a3
{
  self->_spi = a3;
}

- (_PLBasebandHWStatsRXRSSI)rx
{
  return self->_rx;
}

- (void)setRx:(_PLBasebandHWStatsRXRSSI *)a3
{
  self->_rx = a3;
}

- (_PLBasebandHWStatsTXPower)tx
{
  return self->_tx;
}

- (void)setTx:(_PLBasebandHWStatsTXPower *)a3
{
  self->_tx = a3;
}

@end
