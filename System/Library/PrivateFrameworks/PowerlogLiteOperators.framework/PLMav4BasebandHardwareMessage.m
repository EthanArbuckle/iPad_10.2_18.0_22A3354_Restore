@implementation PLMav4BasebandHardwareMessage

- (PLMav4BasebandHardwareMessage)initWithData:(id)a3
{
  id v4;
  PLMav4BasebandHardwareMessage *v5;
  PLMav4BasebandHardwareMessage *v6;
  PLMav4BasebandHardwareMessage *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLMav4BasebandHardwareMessage;
  v5 = -[PLBasebandHardwareMessage initWithData:](&v9, sel_initWithData_, v4);
  v6 = v5;
  if (!v5)
    goto LABEL_3;
  -[PLMav4BasebandHardwareMessage setHeader:](v5, "setHeader:", 0);
  -[PLMav4BasebandHardwareMessage setSystem:](v6, "setSystem:", 0);
  -[PLMav4BasebandHardwareMessage setArmPerf:](v6, "setArmPerf:", 0);
  -[PLMav4BasebandHardwareMessage setMdsp:](v6, "setMdsp:", 0);
  -[PLMav4BasebandHardwareMessage setMdm:](v6, "setMdm:", 0);
  -[PLMav4BasebandHardwareMessage setQdsp:](v6, "setQdsp:", 0);
  -[PLMav4BasebandHardwareMessage setAdm:](v6, "setAdm:", 0);
  -[PLMav4BasebandHardwareMessage setGps:](v6, "setGps:", 0);
  -[PLMav4BasebandHardwareMessage setUsb:](v6, "setUsb:", 0);
  -[PLMav4BasebandHardwareMessage setUart:](v6, "setUart:", 0);
  -[PLMav4BasebandHardwareMessage setSpi:](v6, "setSpi:", 0);
  -[PLMav4BasebandHardwareMessage setRx:](v6, "setRx:", 0);
  -[PLMav4BasebandHardwareMessage setTx:](v6, "setTx:", 0);
  -[PLMav4BasebandHardwareMessage setSleep_qdsp:](v6, "setSleep_qdsp:", 0);
  -[PLMav4BasebandHardwareMessage setSleep_arm:](v6, "setSleep_arm:", 0);
  v7 = 0;
  if (-[PLMav4BasebandHardwareMessage parseData:](v6, "parseData:", v4))
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
  unint64_t v9;
  NSObject *v10;
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
  -[PLMav4BasebandHardwareMessage setHeader:](self, "setHeader:", v5 + 13);
  v6 = v5 + 33;
  -[PLMav4BasebandHardwareMessage setLogDuration:](self, "setLogDuration:", ((_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[16]- (_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[12]));
  if (-[PLMav4BasebandHardwareMessage level](self, "level"))
  {
    -[PLMav4BasebandHardwareMessage setSystem:](self, "setSystem:", v5 + 33);
    v6 = v5 + 45;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 4)
  {
    -[PLMav4BasebandHardwareMessage setArmPerf:](self, "setArmPerf:", v6);
    v6 += 32;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 3)
  {
    -[PLMav4BasebandHardwareMessage setMdsp:](self, "setMdsp:", v6);
    -[PLMav4BasebandHardwareMessage setMdm:](self, "setMdm:", v6 + 20);
    -[PLMav4BasebandHardwareMessage setQdsp:](self, "setQdsp:", v6 + 28);
    -[PLMav4BasebandHardwareMessage setAdm:](self, "setAdm:", v6 + 48);
    -[PLMav4BasebandHardwareMessage setGps:](self, "setGps:", v6 + 56);
    -[PLMav4BasebandHardwareMessage setUsb:](self, "setUsb:", v6 + 64);
    -[PLMav4BasebandHardwareMessage setUart:](self, "setUart:", v6 + 72);
    -[PLMav4BasebandHardwareMessage setSpi:](self, "setSpi:", v6 + 80);
    v6 += 88;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 6)
  {
    -[PLMav4BasebandHardwareMessage setRx:](self, "setRx:", v6);
    -[PLMav4BasebandHardwareMessage setTx:](self, "setTx:", v6 + 600);
    -[PLMav4BasebandHardwareMessage setSleep_qdsp:](self, "setSleep_qdsp:", v6 + 840);
    -[PLMav4BasebandHardwareMessage setSleep_arm:](self, "setSleep_arm:", v6 + 892);
    v6 += 944;
  }
  v7 = objc_retainAutorelease(v4);
  v8 = v6 - objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  if (v8 > v9)
  {
    PLLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_retainAutorelease(v7);
      v13 = 134218498;
      v14 = v6 - objc_msgSend(v12, "bytes");
      v15 = 2048;
      v16 = objc_msgSend(v12, "length");
      v17 = 2080;
      v18 = "-[PLMav4BasebandHardwareMessage parseData:]";
      _os_log_error_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", (uint8_t *)&v13, 0x20u);
    }

  }
  return v8 <= v9;
}

- (void)logWithLogger:(id)a3
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
  PLBBMavLogMsg *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[5];
  _QWORD block[5];
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PLMav4BasebandHardwareMessage;
  -[PLBasebandHardwareMessage logRawWithLogger:](&v25, sel_logRawWithLogger_, v4);
  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLMav4BasebandHardwareMessage_logWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED886EE0 != -1)
      dispatch_once(&qword_1ED886EE0, block);
    if (_MergedGlobals_104)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMav4BasebandHardwareMessage logWithLogger:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav4BasebandHardwareMessage logWithLogger:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 151);

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
  v13 = objc_alloc_init(PLBBMavLogMsg);
  -[PLBasebandMessage agent](self, "agent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage setAgent:](v13, "setAgent:", v14);

  -[PLBBMavLogMsg setError:](v13, "setError:", CFSTR("not set"));
  -[PLBasebandMessage seqNum](self, "seqNum");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage date](self, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage timeCal](self, "timeCal");
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

  -[PLMav4BasebandHardwareMessage logHeaderWithLogger:](self, "logHeaderWithLogger:", v13);
  -[PLMav4BasebandHardwareMessage logProcessorWithLogger:](self, "logProcessorWithLogger:", v13);
  -[PLMav4BasebandHardwareMessage logModemAppWithLogger:](self, "logModemAppWithLogger:", v13);
  -[PLMav4BasebandHardwareMessage logPeripheralsWithLogger:](self, "logPeripheralsWithLogger:", v13);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
    -[PLMav4BasebandHardwareMessage logSleepWithLogger:](self, "logSleepWithLogger:", v4);
  -[PLBBMavLogMsg addToGroupPLBBMav4HwOther](v13, "addToGroupPLBBMav4HwOther");
  -[PLMav4BasebandHardwareMessage logRFWithLogger2:](self, "logRFWithLogger2:", v13);
  -[PLBBMavLogMsg logEventBackwardGrpEntriesBBMavHw](v13, "logEventBackwardGrpEntriesBBMavHw");
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v23[0] = v6;
    v23[1] = 3221225472;
    v23[2] = __47__PLMav4BasebandHardwareMessage_logWithLogger___block_invoke_255;
    v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v23[4] = objc_opt_class();
    if (qword_1ED886EE8 != -1)
      dispatch_once(&qword_1ED886EE8, v23);
    if (byte_1ED886ED1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoding Mav4 BB HW RF completed"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav4BasebandHardwareMessage logWithLogger:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 177);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v17;
        _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __47__PLMav4BasebandHardwareMessage_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_104 = result;
  return result;
}

uint64_t __47__PLMav4BasebandHardwareMessage_logWithLogger___block_invoke_255(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886ED1 = result;
  return result;
}

- (void)logHeaderWithLogger:(id)a3
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__PLMav4BasebandHardwareMessage_logHeaderWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED886EF0 != -1)
      dispatch_once(&qword_1ED886EF0, block);
    if (byte_1ED886ED2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMav4BasebandHardwareMessage logHeaderWithLogger:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav4BasebandHardwareMessage logHeaderWithLogger:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 182);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v6 = MEMORY[0x1E0C809B0];
    }
  }
  v13 = v4;
  if (-[PLMav4BasebandHardwareMessage header](self, "header"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBbSwRev:", v14);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[PLMav4BasebandHardwareMessage hw_rev](self, "hw_rev"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBbHwRev:", v15);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", (unsigned __int16)-[PLMav4BasebandHardwareMessage header](self, "header")[4]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBbHwStatsType:", v16);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", (unsigned __int16)-[PLMav4BasebandHardwareMessage header](self, "header")[6]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBbHwStatsLength:", v17);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage header](self, "header")[8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBbHwStatsLevel:", v18);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage header](self, "header")[16]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBbHwCurrTimeStamp:", v19);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage header](self, "header")[12]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBbHwLastTimeStamp:", v20);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", ((_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[16]- (_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[12]));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBbHwLogDurationInTicks:", v21);

  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v35[0] = v6;
      v35[1] = 3221225472;
      v35[2] = __53__PLMav4BasebandHardwareMessage_logHeaderWithLogger___block_invoke_261;
      v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v35[4] = objc_opt_class();
      if (qword_1ED886EF8 != -1)
        dispatch_once(&qword_1ED886EF8, v35);
      if (byte_1ED886ED3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BB HW: bad header"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "lastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav4BasebandHardwareMessage logHeaderWithLogger:]");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 199);

        PLLogCommon();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v22;
          _os_log_debug_impl(&dword_1CAF47000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v13, "appendToError:", CFSTR("Bad Header"));
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v34[0] = v6;
    v34[1] = 3221225472;
    v34[2] = __53__PLMav4BasebandHardwareMessage_logHeaderWithLogger___block_invoke_268;
    v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v34[4] = objc_opt_class();
    if (qword_1ED886F00 != -1)
      dispatch_once(&qword_1ED886F00, v34);
    if (byte_1ED886ED4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW Log"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "lastPathComponent");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav4BasebandHardwareMessage logHeaderWithLogger:]");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 203);

      PLLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v28;
        _os_log_debug_impl(&dword_1CAF47000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __53__PLMav4BasebandHardwareMessage_logHeaderWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886ED2 = result;
  return result;
}

uint64_t __53__PLMav4BasebandHardwareMessage_logHeaderWithLogger___block_invoke_261(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886ED3 = result;
  return result;
}

uint64_t __53__PLMav4BasebandHardwareMessage_logHeaderWithLogger___block_invoke_268(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886ED4 = result;
  return result;
}

- (void)logProcessorWithLogger:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PLMav4BasebandHardwareMessage system](self, "system"))
  {
    self->super.super.ticksInGoodState = -[PLMav4BasebandHardwareMessage system](self, "system")[8];
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage system](self, "system"), 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBbHwProcSystemState:", v5);

  }
  else
  {
    objc_msgSend(v4, "appendToError:", CFSTR("System_State=<unknown>"));
  }
  if (-[PLMav4BasebandHardwareMessage armPerf](self, "armPerf"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage armPerf](self, "armPerf"), 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBbHwProcArmPerfState:", v6);

  }
  else
  {
    objc_msgSend(v4, "appendToError:", CFSTR("ARM_Perf_Level=<unknown>"));
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__PLMav4BasebandHardwareMessage_logProcessorWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (qword_1ED886F08 != -1)
      dispatch_once(&qword_1ED886F08, block);
    if (byte_1ED886ED5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW Processor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav4BasebandHardwareMessage logProcessorWithLogger:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 232);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __56__PLMav4BasebandHardwareMessage_logProcessorWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886ED5 = result;
  return result;
}

- (void)logModemAppWithLogger:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PLMav4BasebandHardwareMessage mdsp](self, "mdsp"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage mdsp](self, "mdsp"), 5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBbHwModemAppMdspSpeed:", v5);

  }
  else
  {
    objc_msgSend(v4, "appendToError:", CFSTR("Q6FW_Speed=<unknown>"));
  }
  if (-[PLMav4BasebandHardwareMessage mdm](self, "mdm"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage mdm](self, "mdm"), 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBbHwModemAppMdmState:", v6);

  }
  else
  {
    objc_msgSend(v4, "appendToError:", CFSTR("MDM=<unknown>"));
  }
  if (-[PLMav4BasebandHardwareMessage qdsp](self, "qdsp"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage qdsp](self, "qdsp"), 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBbHwModemAppQdspSpeed:", v7);

  }
  else
  {
    objc_msgSend(v4, "appendToError:", CFSTR("Q6SW_Speed=<unknown>"));
  }
  if (-[PLMav4BasebandHardwareMessage adm](self, "adm"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage adm](self, "adm"), 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBbHwModemAppAdmState:", v8);

  }
  else
  {
    objc_msgSend(v4, "appendToError:", CFSTR("ADM=<unknown>"));
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__PLMav4BasebandHardwareMessage_logModemAppWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1ED886F10 != -1)
      dispatch_once(&qword_1ED886F10, block);
    if (byte_1ED886ED6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW Modem/App"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav4BasebandHardwareMessage logModemAppWithLogger:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 278);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __55__PLMav4BasebandHardwareMessage_logModemAppWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886ED6 = result;
  return result;
}

- (void)logPeripheralsWithLogger:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PLMav4BasebandHardwareMessage gps](self, "gps"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage gps](self, "gps"), 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBbHwPeripheralGPSState:", v5);

  }
  else
  {
    objc_msgSend(v4, "appendToError:", CFSTR("GPS=<unknown>"));
  }
  if (-[PLMav4BasebandHardwareMessage usb](self, "usb"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage usb](self, "usb"), 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBbHwPeripheralUSBState:", v6);

  }
  else
  {
    objc_msgSend(v4, "appendToError:", CFSTR("USB=<unknown>"));
  }
  if (-[PLMav4BasebandHardwareMessage spi](self, "spi"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage spi](self, "spi"), 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBbHwPeripheralSPIState:", v7);

  }
  else
  {
    objc_msgSend(v4, "appendToError:", CFSTR("SPI_Clock=<unknown>"));
  }
  if (-[PLMav4BasebandHardwareMessage uart](self, "uart"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage uart](self, "uart"), 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBbHwPeripheralUARTState:", v8);

  }
  else
  {
    objc_msgSend(v4, "appendToError:", CFSTR("UART_Clock=<unknown>"));
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__PLMav4BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1ED886F18 != -1)
      dispatch_once(&qword_1ED886F18, block);
    if (byte_1ED886ED7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW Peripherals"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav4BasebandHardwareMessage logPeripheralsWithLogger:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 325);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __58__PLMav4BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886ED7 = result;
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
  PLBBMavLogMsg *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  PLMav4BasebandHardwareMessage *v54;
  id v55;
  void *v56;
  void *v57;
  _QWORD block[5];
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[5];
  uint8_t buf[4];
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __50__PLMav4BasebandHardwareMessage_logRFWithLogger2___block_invoke;
    v61[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v61[4] = v5;
    if (qword_1ED886F20 != -1)
      dispatch_once(&qword_1ED886F20, v61);
    if (byte_1ED886ED8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMav4BasebandHardwareMessage logRFWithLogger2:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav4BasebandHardwareMessage logRFWithLogger2:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 330);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v55 = v4;
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

  v54 = self;
  if (!-[PLMav4BasebandHardwareMessage rx](self, "rx") || !-[PLMav4BasebandHardwareMessage tx](self, "tx"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v16 = objc_opt_class();
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __50__PLMav4BasebandHardwareMessage_logRFWithLogger2___block_invoke_301;
      v60[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v60[4] = v16;
      if (qword_1ED886F28 != -1)
        dispatch_once(&qword_1ED886F28, v60);
      if (byte_1ED886ED9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: BB HW RF <RAT> is expected but not present"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav4BasebandHardwareMessage logRFWithLogger2:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 343);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v17;
          _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        self = v54;
      }
    }
    -[PLBBMavLogMsg appendToError:](v12, "appendToError:", CFSTR("Error: BB HW RF <RAT> is expected but not present"));
    -[PLBBMavLogMsg logEventBackwardMavBBHwOtherPerRAT](v12, "logEventBackwardMavBBHwOtherPerRAT");
  }
  v23 = 0;
  v24 = 0;
  v25 = 0;
  for (i = 340; i != 600; i += 52)
  {
    -[PLMav4BasebandHardwareMessage indexToRAT:](self, "indexToRAT:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "length"))
    {
      -[PLBBMavLogMsg setRat:](v12, "setRat:", v27);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavLogMsg setLogDuration:](v12, "setLogDuration:", v28);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavLogMsg setRadioTech:](v12, "setRadioTech:", v29);

      v30 = (void *)MEMORY[0x1E0CB37E8];
      v56 = v27;
      v31 = (int)-[PLMav4BasebandHardwareMessage header](self, "header")[16];
      v32 = (v31 - (_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[12]);
      v27 = v56;
      objc_msgSend(v30, "numberWithUnsignedInt:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavLogMsg setBbHwLogDurationInTicks:](v12, "setBbHwLogDurationInTicks:", v33);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage rx](self, "rx") + v23, 4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavLogMsg setRssiModeCount:](v12, "setRssiModeCount:", v34);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage rx](self, "rx") + i - 260, 13);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavLogMsg setRx0RssiPowerHist:](v12, "setRx0RssiPowerHist:", v35);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage rx](self, "rx") + i, 13);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavLogMsg setRx1RssiPowerHist:](v12, "setRx1RssiPowerHist:", v36);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavLogMsg setLogDuration:](v12, "setLogDuration:", v37);

      -[PLBBMavLogMsg setRat:](v12, "setRat:", v56);
      if (i == 548)
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E86341E8, &unk_1E86341E8, &unk_1E86341E8, &unk_1E86341E8, &unk_1E86341E8, &unk_1E86341E8, &unk_1E86341E8, &unk_1E86341E8, &unk_1E86341E8, &unk_1E86341E8, &unk_1E86341E8, 0);
      else
        -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage tx](self, "tx") + v24, 12);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavLogMsg setTxPowerHist:](v12, "setTxPowerHist:", v45);

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v46 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __50__PLMav4BasebandHardwareMessage_logRFWithLogger2___block_invoke_313;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v46;
        if (qword_1ED886F38 != -1)
          dispatch_once(&qword_1ED886F38, block);
        if (byte_1ED886EDB)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded Mav4 BB HW RF %@"), v56);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "lastPathComponent");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav4BasebandHardwareMessage logRFWithLogger2:]");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "logMessage:fromFile:fromFunction:fromLineNumber:", v47, v50, v51, 399);

          PLLogCommon();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v63 = v47;
            _os_log_debug_impl(&dword_1CAF47000, v52, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          self = v54;
          v27 = v56;
        }
      }
      -[PLBBMavLogMsg logEventBackwardGrpEntriesBBMavHwOtherPerRAT](v12, "logEventBackwardGrpEntriesBBMavHwOtherPerRAT");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKey:", CFSTR("entry"));
      v44 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKey:", CFSTR("name"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "addToGroupPLBBMavHwEntry:withEntryKey:", v44, v53);

LABEL_38:
      goto LABEL_39;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v38 = objc_opt_class();
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __50__PLMav4BasebandHardwareMessage_logRFWithLogger2___block_invoke_306;
      v59[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v59[4] = v38;
      if (qword_1ED886F30 != -1)
        dispatch_once(&qword_1ED886F30, v59);
      if (byte_1ED886EDA)
      {
        v57 = v27;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: RAT unknown, cannot record"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav4BasebandHardwareMessage.m");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "lastPathComponent");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav4BasebandHardwareMessage logRFWithLogger2:]");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v42, v43, 356);

        PLLogCommon();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v39;
          _os_log_debug_impl(&dword_1CAF47000, v44, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        self = v54;
        v27 = v57;
        goto LABEL_38;
      }
    }
LABEL_39:

    ++v25;
    v24 += 48;
    v23 += 16;
  }

}

uint64_t __50__PLMav4BasebandHardwareMessage_logRFWithLogger2___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886ED8 = result;
  return result;
}

uint64_t __50__PLMav4BasebandHardwareMessage_logRFWithLogger2___block_invoke_301(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886ED9 = result;
  return result;
}

uint64_t __50__PLMav4BasebandHardwareMessage_logRFWithLogger2___block_invoke_306(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886EDA = result;
  return result;
}

uint64_t __50__PLMav4BasebandHardwareMessage_logRFWithLogger2___block_invoke_313(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886EDB = result;
  return result;
}

- (void)logSleepWithLogger:(id)a3
{
  uint64_t i;
  void *v5;
  uint64_t j;
  void *v7;
  id v8;

  v8 = a3;
  if (-[PLMav4BasebandHardwareMessage sleep_qdsp](self, "sleep_qdsp"))
  {
    for (i = 0; i != 52; i += 13)
    {
      if (-[PLMav4BasebandHardwareMessage sleep_qdsp](self, "sleep_qdsp"))
      {
        -[PLBasebandHardwareMessage convertUint8ArrayToNSArray:ofSize:](self, "convertUint8ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage sleep_qdsp](self, "sleep_qdsp") + i, 13);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setBbHwSleepVetoClientListQdsp:", v5);

      }
    }
  }
  objc_msgSend(v8, "setType:", CFSTR("BB HW Sleep Veto QDSP"));
  if (-[PLMav4BasebandHardwareMessage sleep_arm](self, "sleep_arm"))
  {
    for (j = 0; j != 52; j += 13)
    {
      -[PLBasebandHardwareMessage convertUint8ArrayToNSArray:ofSize:](self, "convertUint8ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage sleep_arm](self, "sleep_arm") + j, 13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBbHwSleepVetoClientListQdsp:", v7);

    }
  }
  objc_msgSend(v8, "setType:", CFSTR("BB HW Sleep Veto ARM"));

}

- (unsigned)hw_rev
{
  return (unsigned __int16)-[PLMav4BasebandHardwareMessage header](self, "header")[2];
}

- (unsigned)sw_rev
{
  return *(_WORD *)-[PLMav4BasebandHardwareMessage header](self, "header");
}

- (unsigned)level
{
  return -[PLMav4BasebandHardwareMessage header](self, "header")[8];
}

- (id)indexToRAT:(unint64_t)a3
{
  if (a3 > 4)
    return &stru_1E8587D00;
  else
    return *off_1E857F9D0[a3];
}

- (unsigned)logDuration
{
  return self->_mav4_duration;
}

- (void)setLogDuration:(unsigned int)a3
{
  self->_mav4_duration = a3;
}

- (_PLMav4BasebandHWStatsHeader)header
{
  return self->_mav4_header;
}

- (void)setHeader:(_PLMav4BasebandHWStatsHeader *)a3
{
  self->_mav4_header = a3;
}

- (_PLMav4BasebandHWStatsSystem)system
{
  return self->_mav4_system;
}

- (void)setSystem:(_PLMav4BasebandHWStatsSystem *)a3
{
  self->_mav4_system = a3;
}

- (_PLMav4BasebandHWStatsARMPerf)armPerf
{
  return self->_mav4_armPerf;
}

- (void)setArmPerf:(_PLMav4BasebandHWStatsARMPerf *)a3
{
  self->_mav4_armPerf = a3;
}

- (_PLMav4BasebandHWStatsMDSP)mdsp
{
  return self->_mav4_mdsp;
}

- (void)setMdsp:(_PLMav4BasebandHWStatsMDSP *)a3
{
  self->_mav4_mdsp = a3;
}

- (_PLMav4BasebandHWOnOffComponentStats)mdm
{
  return self->_mav4_mdm;
}

- (void)setMdm:(_PLMav4BasebandHWOnOffComponentStats *)a3
{
  self->_mav4_mdm = a3;
}

- (_PLMav4BasebandHWStatsQDSP)qdsp
{
  return self->_mav4_qdsp;
}

- (void)setQdsp:(_PLMav4BasebandHWStatsQDSP *)a3
{
  self->_mav4_qdsp = a3;
}

- (_PLMav4BasebandHWOnOffComponentStats)adm
{
  return self->_mav4_adm;
}

- (void)setAdm:(_PLMav4BasebandHWOnOffComponentStats *)a3
{
  self->_mav4_adm = a3;
}

- (_PLMav4BasebandHWOnOffComponentStats)gps
{
  return self->_mav4_gps;
}

- (void)setGps:(_PLMav4BasebandHWOnOffComponentStats *)a3
{
  self->_mav4_gps = a3;
}

- (_PLMav4BasebandHWOnOffComponentStats)usb
{
  return self->_mav4_usb;
}

- (void)setUsb:(_PLMav4BasebandHWOnOffComponentStats *)a3
{
  self->_mav4_usb = a3;
}

- (_PLMav4BasebandHWOnOffComponentStats)uart
{
  return self->_mav4_uart;
}

- (void)setUart:(_PLMav4BasebandHWOnOffComponentStats *)a3
{
  self->_mav4_uart = a3;
}

- (_PLMav4BasebandHWOnOffComponentStats)spi
{
  return self->_mav4_spi;
}

- (void)setSpi:(_PLMav4BasebandHWOnOffComponentStats *)a3
{
  self->_mav4_spi = a3;
}

- (_PLMav4BasebandHWStatsRX)rx
{
  return self->_mav4_rx;
}

- (void)setRx:(_PLMav4BasebandHWStatsRX *)a3
{
  self->_mav4_rx = a3;
}

- (_PLMav4BasebandHWStatsTX)tx
{
  return self->_mav4_tx;
}

- (void)setTx:(_PLMav4BasebandHWStatsTX *)a3
{
  self->_mav4_tx = a3;
}

- (_PLMav4BasebandHWSleepVeto)sleep_qdsp
{
  return self->_mav4_sleep_qdsp;
}

- (void)setSleep_qdsp:(_PLMav4BasebandHWSleepVeto *)a3
{
  self->_mav4_sleep_qdsp = a3;
}

- (_PLMav4BasebandHWSleepVeto)sleep_arm
{
  return self->_mav4_sleep_arm;
}

- (void)setSleep_arm:(_PLMav4BasebandHWSleepVeto *)a3
{
  self->_mav4_sleep_arm = a3;
}

@end
