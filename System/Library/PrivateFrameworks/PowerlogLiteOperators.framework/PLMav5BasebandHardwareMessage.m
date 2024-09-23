@implementation PLMav5BasebandHardwareMessage

- (PLMav5BasebandHardwareMessage)initWithData:(id)a3
{
  id v4;
  PLMav5BasebandHardwareMessage *v5;
  PLMav5BasebandHardwareMessage *v6;
  PLMav5BasebandHardwareMessage *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLMav5BasebandHardwareMessage;
  v5 = -[PLMav4BasebandHardwareMessage initWithData:](&v9, sel_initWithData_, v4);
  v6 = v5;
  if (!v5)
    goto LABEL_3;
  -[PLMav5BasebandHardwareMessage setRpm:](v5, "setRpm:", 0);
  -[PLMav5BasebandHardwareMessage setApps:](v6, "setApps:", 0);
  -[PLMav5BasebandHardwareMessage setApps_sleep:](v6, "setApps_sleep:", 0);
  -[PLMav5BasebandHardwareMessage setApps_sleep_veto:](v6, "setApps_sleep_veto:", 0);
  -[PLMav5BasebandHardwareMessage setLpass:](v6, "setLpass:", 0);
  -[PLMav5BasebandHardwareMessage setMdsp:](v6, "setMdsp:", 0);
  -[PLMav5BasebandHardwareMessage setQdsp:](v6, "setQdsp:", 0);
  -[PLMav5BasebandHardwareMessage setMpss_sleep:](v6, "setMpss_sleep:", 0);
  -[PLMav5BasebandHardwareMessage setMpss_sleep_veto:](v6, "setMpss_sleep_veto:", 0);
  -[PLMav5BasebandHardwareMessage setUsb:](v6, "setUsb:", 0);
  -[PLMav5BasebandHardwareMessage setGps_dpo:](v6, "setGps_dpo:", 0);
  -[PLMav5BasebandHardwareMessage setRx:](v6, "setRx:", 0);
  -[PLMav5BasebandHardwareMessage setRx_sqa:](v6, "setRx_sqa:", 0);
  -[PLMav5BasebandHardwareMessage setTx:](v6, "setTx:", 0);
  -[PLMav5BasebandHardwareMessage setProtocol:](v6, "setProtocol:", 0);
  -[PLMav5BasebandHardwareMessage setClock:](v6, "setClock:", 0);
  v7 = 0;
  if (-[PLMav5BasebandHardwareMessage parseData:](v6, "parseData:", v4))
LABEL_3:
    v7 = v6;

  return v7;
}

- (BOOL)parseData:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unsigned __int8 *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  NSObject *v20;
  id v22;
  unsigned __int8 *v23;
  uint64_t v24;
  uint64_t block;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  uint64_t v29;
  uint8_t buf[4];
  unsigned __int8 *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  v5 = (unsigned __int8 *)objc_msgSend(v4, "bytes");
  v6 = &v5[2 * (*v5 == 129)];
  -[PLMav4BasebandHardwareMessage setHeader:](self, "setHeader:", v6 + 13);
  v7 = v6 + 33;
  -[PLMav4BasebandHardwareMessage setLogDuration:](self, "setLogDuration:", ((_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[16]- (_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[12]));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __43__PLMav5BasebandHardwareMessage_parseData___block_invoke;
    v28 = &__block_descriptor_40_e5_v8__0lu32l8;
    v29 = v8;
    if (qword_1ED886C60 != -1)
      dispatch_once(&qword_1ED886C60, &block);
    if (_MergedGlobals_95)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration");
      objc_msgSend(v9, "stringWithFormat:", CFSTR("Mav5 hw log duration set as %u"), v10, block, v26, v27, v28, v29);
      v11 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage parseData:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 98);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v11;
        _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level"))
  {
    -[PLMav5BasebandHardwareMessage setRpm:](self, "setRpm:", v6 + 33);
    v7 = v6 + 49;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 2)
  {
    -[PLMav5BasebandHardwareMessage setApps:](self, "setApps:", v7);
    -[PLMav5BasebandHardwareMessage setApps_sleep:](self, "setApps_sleep:", v7 + 24);
    v7 += 32;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 3)
  {
    -[PLMav5BasebandHardwareMessage setUsb:](self, "setUsb:", v7);
    -[PLMav4BasebandHardwareMessage setUart:](self, "setUart:", v7 + 12);
    -[PLMav4BasebandHardwareMessage setSpi:](self, "setSpi:", v7 + 20);
    -[PLMav4BasebandHardwareMessage setAdm:](self, "setAdm:", v7 + 28);
    v7 += 36;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 4)
  {
    -[PLMav5BasebandHardwareMessage setLpass:](self, "setLpass:", v7);
    v7 += 8;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 5)
  {
    -[PLMav5BasebandHardwareMessage setApps_sleep_veto:](self, "setApps_sleep_veto:", v7);
    -[PLMav5BasebandHardwareMessage setMpss_sleep_veto:](self, "setMpss_sleep_veto:", v7 + 4);
    -[PLMav5BasebandHardwareMessage setMdsp:](self, "setMdsp:", v7 + 16);
    -[PLMav5BasebandHardwareMessage setQdsp:](self, "setQdsp:", v7 + 56);
    -[PLMav4BasebandHardwareMessage setGps:](self, "setGps:", v7 + 96);
    -[PLMav5BasebandHardwareMessage setGps_dpo:](self, "setGps_dpo:", v7 + 104);
    -[PLMav5BasebandHardwareMessage setMpss_sleep:](self, "setMpss_sleep:", v7 + 112);
    v7 += 120;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 6)
  {
    -[PLMav5BasebandHardwareMessage setRx:](self, "setRx:", v7);
    -[PLMav5BasebandHardwareMessage setTx:](self, "setTx:", v7 + 600);
    -[PLMav5BasebandHardwareMessage setRx_sqa:](self, "setRx_sqa:", v7 + 840);
    -[PLMav5BasebandHardwareMessage setProtocol:](self, "setProtocol:", v7 + 1280);
    v7 += 1600;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 7)
  {
    -[PLMav5BasebandHardwareMessage setClock:](self, "setClock:", v7);
    v7 += 836;
  }
  v17 = objc_retainAutorelease(v4);
  v18 = (unint64_t)&v7[-objc_msgSend(v17, "bytes")];
  v19 = objc_msgSend(v17, "length");
  if (v18 > v19)
  {
    PLLogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v22 = objc_retainAutorelease(v17);
      v23 = &v7[-objc_msgSend(v22, "bytes")];
      v24 = objc_msgSend(v22, "length");
      *(_DWORD *)buf = 134218498;
      v31 = v23;
      v32 = 2048;
      v33 = v24;
      v34 = 2080;
      v35 = "-[PLMav5BasebandHardwareMessage parseData:]";
      _os_log_error_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", buf, 0x20u);
    }

  }
  return v18 <= v19;
}

uint64_t __43__PLMav5BasebandHardwareMessage_parseData___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_95 = result;
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
  _QWORD v23[5];
  _QWORD block[5];
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PLMav5BasebandHardwareMessage;
  -[PLBasebandHardwareMessage logRawWithLogger:](&v25, sel_logRawWithLogger_, v4);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLMav5BasebandHardwareMessage_logWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED886C68 != -1)
      dispatch_once(&qword_1ED886C68, block);
    if (byte_1ED886C39)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMav5BasebandHardwareMessage logWithLogger:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 205);

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
  v12 = objc_alloc_init(PLBBMavLogMsg);
  -[PLBasebandMessage agent](self, "agent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage setAgent:](v12, "setAgent:", v13);

  -[PLBBMavLogMsg setError:](v12, "setError:", CFSTR("not set"));
  -[PLBasebandMessage seqNum](self, "seqNum");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage date](self, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage timeCal](self, "timeCal");
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v12, "setHeaderWithSeqNum:andDate:andTimeCal:", v14, v15);

  if (-[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev") != 4)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendFormat:", CFSTR(" Version Mismatch: Baseband_sw_rev=%d Powerlog_supported_sw_rev=%d"), -[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev"), 4);
    -[PLBBMavLogMsg setError:](v12, "setError:", v17);
    -[PLBBMavLogMsg setType:](v12, "setType:", CFSTR("BB HW Error"));
    -[PLBBMavLogMsg logEventBackwardMavBBHwOther](v12, "logEventBackwardMavBBHwOther");
LABEL_19:

    goto LABEL_20;
  }
  -[PLMav4BasebandHardwareMessage logHeaderWithLogger:](self, "logHeaderWithLogger:", v12);
  -[PLMav5BasebandHardwareMessage logRPMWithLogger:](self, "logRPMWithLogger:", v12);
  -[PLMav5BasebandHardwareMessage logAPPSWithLogger:](self, "logAPPSWithLogger:", v12);
  -[PLMav5BasebandHardwareMessage logLPASSWithLogger:](self, "logLPASSWithLogger:", v12);
  -[PLMav5BasebandHardwareMessage logModemAppWithLogger:](self, "logModemAppWithLogger:", v4);
  -[PLMav5BasebandHardwareMessage logPeripheralsWithLogger:](self, "logPeripheralsWithLogger:", v12);
  -[PLMav5BasebandHardwareMessage logProtocolWithLogger:withCount:](self, "logProtocolWithLogger:withCount:", v12, 5);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
    -[PLMav5BasebandHardwareMessage logClockWithLogger:](self, "logClockWithLogger:", v4);
  -[PLBBMavLogMsg addToGroupPLBBMavHwOther](v12, "addToGroupPLBBMavHwOther");
  -[PLMav5BasebandHardwareMessage logRFWithLogger2:](self, "logRFWithLogger2:", v12);
  -[PLBBMavLogMsg logEventBackwardGrpEntriesBBMavHw](v12, "logEventBackwardGrpEntriesBBMavHw");
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v16 = objc_opt_class();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __47__PLMav5BasebandHardwareMessage_logWithLogger___block_invoke_262;
    v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v23[4] = v16;
    if (qword_1ED886C70 != -1)
      dispatch_once(&qword_1ED886C70, v23);
    if (byte_1ED886C3A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoding BB HW RF completed"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logWithLogger:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 250);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v17;
        _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_19;
    }
  }
LABEL_20:

}

uint64_t __47__PLMav5BasebandHardwareMessage_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C39 = result;
  return result;
}

uint64_t __47__PLMav5BasebandHardwareMessage_logWithLogger___block_invoke_262(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C3A = result;
  return result;
}

- (void)logRPMWithLogger:(id)a3
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
  void *v24;
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
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__PLMav5BasebandHardwareMessage_logRPMWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED886C78 != -1)
      dispatch_once(&qword_1ED886C78, block);
    if (byte_1ED886C3B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMav5BasebandHardwareMessage logRPMWithLogger:]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logRPMWithLogger:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 255);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v6 = MEMORY[0x1E0C809B0];
    }
  }
  v13 = v4;
  if (-[PLMav5BasebandHardwareMessage rpm](self, "rpm"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)-[PLMav5BasebandHardwareMessage rpm](self, "rpm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRpmXOShutDuration:", v14);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLMav5BasebandHardwareMessage rpm](self, "rpm")[4]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRpmXOShutCnt:", v15);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLMav5BasebandHardwareMessage rpm](self, "rpm")[8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRpmVDDMinDuration:", v16);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLMav5BasebandHardwareMessage rpm](self, "rpm")[12]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRpmVDDMinEnterCnt:", v17);

  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v31[0] = v6;
      v31[1] = 3221225472;
      v31[2] = __50__PLMav5BasebandHardwareMessage_logRPMWithLogger___block_invoke_268;
      v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v31[4] = objc_opt_class();
      if (qword_1ED886C80 != -1)
        dispatch_once(&qword_1ED886C80, v31);
      if (byte_1ED886C3C)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("RPM=<unknown>"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "lastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logRPMWithLogger:]");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 285);

        PLLogCommon();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v18;
          _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v13, "appendToError:", CFSTR("RPM=<unknown> "));
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v30[0] = v6;
    v30[1] = 3221225472;
    v30[2] = __50__PLMav5BasebandHardwareMessage_logRPMWithLogger___block_invoke_275;
    v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v30[4] = objc_opt_class();
    if (qword_1ED886C88 != -1)
      dispatch_once(&qword_1ED886C88, v30);
    if (byte_1ED886C3D)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW RPM"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logRPMWithLogger:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 289);

      PLLogCommon();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v24;
        _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __50__PLMav5BasebandHardwareMessage_logRPMWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C3B = result;
  return result;
}

uint64_t __50__PLMav5BasebandHardwareMessage_logRPMWithLogger___block_invoke_268(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C3C = result;
  return result;
}

uint64_t __50__PLMav5BasebandHardwareMessage_logRPMWithLogger___block_invoke_275(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C3D = result;
  return result;
}

- (void)logAPPSWithLogger:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  void *v37;
  uint64_t v38;
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PLMav5BasebandHardwareMessage apps](self, "apps"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage apps](self, "apps"), 6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAppsPerfStateCountHist:", v5);
LABEL_3:

    goto LABEL_11;
  }
  objc_msgSend(v4, "appendToError:", CFSTR("Perf_Level=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PLMav5BasebandHardwareMessage_logAPPSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1ED886C90 != -1)
      dispatch_once(&qword_1ED886C90, block);
    if (byte_1ED886C3E)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Perf_Level=<unknown>"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logAPPSWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v9, v10, 313);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_3;
    }
  }
LABEL_11:
  if (-[PLMav5BasebandHardwareMessage apps_sleep](self, "apps_sleep"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)-[PLMav5BasebandHardwareMessage apps_sleep](self, "apps_sleep"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCxoShutDownDuration:", v12);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLMav5BasebandHardwareMessage apps_sleep](self, "apps_sleep")[4]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCxoShutDownCount:", v13);
LABEL_13:

    goto LABEL_21;
  }
  objc_msgSend(v4, "appendToError:", CFSTR("Sleep_Stats=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v14 = objc_opt_class();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __51__PLMav5BasebandHardwareMessage_logAPPSWithLogger___block_invoke_286;
    v40[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v40[4] = v14;
    if (qword_1ED886C98 != -1)
      dispatch_once(&qword_1ED886C98, v40);
    if (byte_1ED886C3F)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep_Stats=<unknown>"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logAPPSWithLogger:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v17, v18, 332);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v13;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_13;
    }
  }
LABEL_21:
  if (-[PLMav5BasebandHardwareMessage apps_sleep_veto](self, "apps_sleep_veto"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage apps_sleep_veto](self, "apps_sleep_veto"), 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAppsSleepVeto:", v20);
LABEL_23:

    goto LABEL_31;
  }
  objc_msgSend(v4, "appendToError:", CFSTR("Sleep_Veto_Duration=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v21 = objc_opt_class();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __51__PLMav5BasebandHardwareMessage_logAPPSWithLogger___block_invoke_293;
    v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v39[4] = v21;
    if (qword_1ED886CA0 != -1)
      dispatch_once(&qword_1ED886CA0, v39);
    if (byte_1ED886C40)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep_Veto_Duration=<unknown>"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logAPPSWithLogger:]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v24, v25, 353);

      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v20;
        _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_23;
    }
  }
LABEL_31:
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v27 = objc_opt_class();
    v34 = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = __51__PLMav5BasebandHardwareMessage_logAPPSWithLogger___block_invoke_298;
    v37 = &__block_descriptor_40_e5_v8__0lu32l8;
    v38 = v27;
    if (qword_1ED886CA8 != -1)
      dispatch_once(&qword_1ED886CA8, &v34);
    if (byte_1ED886C41)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW APPS"), v34, v35, v36, v37, v38);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "lastPathComponent");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logAPPSWithLogger:]");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 357);

      PLLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v28;
        _os_log_debug_impl(&dword_1CAF47000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __51__PLMav5BasebandHardwareMessage_logAPPSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C3E = result;
  return result;
}

uint64_t __51__PLMav5BasebandHardwareMessage_logAPPSWithLogger___block_invoke_286(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C3F = result;
  return result;
}

uint64_t __51__PLMav5BasebandHardwareMessage_logAPPSWithLogger___block_invoke_293(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C40 = result;
  return result;
}

uint64_t __51__PLMav5BasebandHardwareMessage_logAPPSWithLogger___block_invoke_298(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C41 = result;
  return result;
}

- (void)logLPASSWithLogger:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t v23;
  _QWORD block[5];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PLMav5BasebandHardwareMessage lpass](self, "lpass"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage lpass](self, "lpass"), 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLpassOnOffState:", v5);
LABEL_3:

    goto LABEL_11;
  }
  objc_msgSend(v4, "appendToError:", CFSTR("LPASS State=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__PLMav5BasebandHardwareMessage_logLPASSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1ED886CB0 != -1)
      dispatch_once(&qword_1ED886CB0, block);
    if (byte_1ED886C42)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LPASS State=<unknown>"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logLPASSWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v9, v10, 374);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_3;
    }
  }
LABEL_11:
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v12 = objc_opt_class();
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __52__PLMav5BasebandHardwareMessage_logLPASSWithLogger___block_invoke_307;
    v22 = &__block_descriptor_40_e5_v8__0lu32l8;
    v23 = v12;
    if (qword_1ED886CB8 != -1)
      dispatch_once(&qword_1ED886CB8, &v19);
    if (byte_1ED886C43)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW LPASS"), v19, v20, v21, v22, v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logLPASSWithLogger:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 377);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v13;
        _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __52__PLMav5BasebandHardwareMessage_logLPASSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C42 = result;
  return result;
}

uint64_t __52__PLMav5BasebandHardwareMessage_logLPASSWithLogger___block_invoke_307(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C43 = result;
  return result;
}

- (void)logModemAppWithLogger:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
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
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t);
  void *v51;
  uint64_t v52;
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD v56[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PLMav5BasebandHardwareMessage mpss_sleep](self, "mpss_sleep"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)-[PLMav5BasebandHardwareMessage mpss_sleep](self, "mpss_sleep"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMpssCxoShutDownDuration:", v5);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLMav5BasebandHardwareMessage mpss_sleep](self, "mpss_sleep")[4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMpssCxoShutDownCount:", v6);
LABEL_3:

    goto LABEL_11;
  }
  objc_msgSend(v4, "appendToError:", CFSTR("MPSS CXO_Shutdown=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (qword_1ED886CC0 != -1)
      dispatch_once(&qword_1ED886CC0, block);
    if (byte_1ED886C44)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MPSS CXO_Shutdown=<unknown>"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logModemAppWithLogger:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v10, v11, 399);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_3;
    }
  }
LABEL_11:
  if (-[PLMav5BasebandHardwareMessage mpss_sleep_veto](self, "mpss_sleep_veto"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage mpss_sleep_veto](self, "mpss_sleep_veto"), 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMpssSleepVeto:", v13);
LABEL_13:

    goto LABEL_21;
  }
  objc_msgSend(v4, "appendToError:", CFSTR("MPSS_Sleep_Veto_Duration=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v14 = objc_opt_class();
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke_318;
    v56[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v56[4] = v14;
    if (qword_1ED886CC8 != -1)
      dispatch_once(&qword_1ED886CC8, v56);
    if (byte_1ED886C45)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MPSS_Sleep_Veto_Duration=<unknown>"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logModemAppWithLogger:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v17, v18, 415);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v13;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_13;
    }
  }
LABEL_21:
  if (-[PLMav5BasebandHardwareMessage mdsp](self, "mdsp"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage mdsp](self, "mdsp"), 10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMpssSleepVeto:", v20);
LABEL_23:

    goto LABEL_31;
  }
  objc_msgSend(v4, "appendToError:", CFSTR("MDSP=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v21 = objc_opt_class();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke_325;
    v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v55[4] = v21;
    if (qword_1ED886CD0 != -1)
      dispatch_once(&qword_1ED886CD0, v55);
    if (byte_1ED886C46)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MPSS_Sleep_Veto_Duration=<unknown>"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logModemAppWithLogger:]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v24, v25, 434);

      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v20;
        _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_23;
    }
  }
LABEL_31:
  if (-[PLMav5BasebandHardwareMessage qdsp](self, "qdsp"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage qdsp](self, "qdsp"), 10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMpssSleepVeto:", v27);
LABEL_33:

    goto LABEL_41;
  }
  objc_msgSend(v4, "appendToError:", CFSTR("QDSP=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v28 = objc_opt_class();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke_330;
    v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v54[4] = v28;
    if (qword_1ED886CD8 != -1)
      dispatch_once(&qword_1ED886CD8, v54);
    if (byte_1ED886C47)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("QDSP=<unknown>"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "lastPathComponent");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logModemAppWithLogger:]");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v31, v32, 453);

      PLLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v27;
        _os_log_debug_impl(&dword_1CAF47000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_33;
    }
  }
LABEL_41:
  if (-[PLMav4BasebandHardwareMessage adm](self, "adm"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage adm](self, "adm"), 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMpssSleepVeto:", v34);
LABEL_43:

    goto LABEL_51;
  }
  objc_msgSend(v4, "appendToError:", CFSTR("ADM=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v35 = objc_opt_class();
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke_337;
    v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v53[4] = v35;
    if (qword_1ED886CE0 != -1)
      dispatch_once(&qword_1ED886CE0, v53);
    if (byte_1ED886C48)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ADM=<unknown>"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "lastPathComponent");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logModemAppWithLogger:]");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v38, v39, 470);

      PLLogCommon();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v34;
        _os_log_debug_impl(&dword_1CAF47000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_43;
    }
  }
LABEL_51:
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v41 = objc_opt_class();
    v48 = MEMORY[0x1E0C809B0];
    v49 = 3221225472;
    v50 = __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke_342;
    v51 = &__block_descriptor_40_e5_v8__0lu32l8;
    v52 = v41;
    if (qword_1ED886CE8 != -1)
      dispatch_once(&qword_1ED886CE8, &v48);
    if (byte_1ED886C49)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW MPSS"), v48, v49, v50, v51, v52);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "lastPathComponent");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logModemAppWithLogger:]");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "logMessage:fromFile:fromFunction:fromLineNumber:", v42, v45, v46, 476);

      PLLogCommon();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v42;
        _os_log_debug_impl(&dword_1CAF47000, v47, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C44 = result;
  return result;
}

uint64_t __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke_318(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C45 = result;
  return result;
}

uint64_t __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke_325(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C46 = result;
  return result;
}

uint64_t __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke_330(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C47 = result;
  return result;
}

uint64_t __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke_337(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C48 = result;
  return result;
}

uint64_t __55__PLMav5BasebandHardwareMessage_logModemAppWithLogger___block_invoke_342(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C49 = result;
  return result;
}

- (void)logPeripheralsWithLogger:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
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
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t);
  void *v50;
  uint64_t v51;
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PLMav5BasebandHardwareMessage usb](self, "usb"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage usb](self, "usb"), 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUsbStateCountHist:", v5);
LABEL_3:

    goto LABEL_11;
  }
  objc_msgSend(v4, "appendToError:", CFSTR("USB=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1ED886CF0 != -1)
      dispatch_once(&qword_1ED886CF0, block);
    if (byte_1ED886C4A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("USB=<unknown>"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logPeripheralsWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v9, v10, 498);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_3;
    }
  }
LABEL_11:
  if (-[PLMav4BasebandHardwareMessage spi](self, "spi"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage spi](self, "spi"), 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSpiOnOffState:", v12);
LABEL_13:

    goto LABEL_21;
  }
  objc_msgSend(v4, "appendToError:", CFSTR("SPI=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v13 = objc_opt_class();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_353;
    v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v55[4] = v13;
    if (qword_1ED886CF8 != -1)
      dispatch_once(&qword_1ED886CF8, v55);
    if (byte_1ED886C4B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("USB=<unknown>"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logPeripheralsWithLogger:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v16, v17, 516);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v12;
        _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_13;
    }
  }
LABEL_21:
  if (-[PLMav4BasebandHardwareMessage uart](self, "uart"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage uart](self, "uart"), 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUartOnOffState:", v19);
LABEL_23:

    goto LABEL_31;
  }
  objc_msgSend(v4, "appendToError:", CFSTR("UART=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v20 = objc_opt_class();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_358;
    v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v54[4] = v20;
    if (qword_1ED886D00 != -1)
      dispatch_once(&qword_1ED886D00, v54);
    if (byte_1ED886C4C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UART=<unknown>"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastPathComponent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logPeripheralsWithLogger:]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v23, v24, 535);

      PLLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v19;
        _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_23;
    }
  }
LABEL_31:
  if (-[PLMav4BasebandHardwareMessage gps](self, "gps"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage gps](self, "gps"), 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGpsOnOff:", v26);
LABEL_33:

    goto LABEL_41;
  }
  objc_msgSend(v4, "appendToError:", CFSTR("GPS=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v27 = objc_opt_class();
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_365;
    v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v53[4] = v27;
    if (qword_1ED886D08 != -1)
      dispatch_once(&qword_1ED886D08, v53);
    if (byte_1ED886C4D)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GPS=<unknown>"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "lastPathComponent");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logPeripheralsWithLogger:]");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v30, v31, 554);

      PLLogCommon();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v26;
        _os_log_debug_impl(&dword_1CAF47000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_33;
    }
  }
LABEL_41:
  if (-[PLMav5BasebandHardwareMessage gps_dpo](self, "gps_dpo"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage gps_dpo](self, "gps_dpo"), 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setGpsDPOOnOff:", v33);
LABEL_43:

    goto LABEL_51;
  }
  objc_msgSend(v4, "appendToError:", CFSTR("GPS_DPO=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v34 = objc_opt_class();
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_372;
    v52[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v52[4] = v34;
    if (qword_1ED886D10 != -1)
      dispatch_once(&qword_1ED886D10, v52);
    if (byte_1ED886C4E)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GPS_DPO=<unknown>"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "lastPathComponent");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logPeripheralsWithLogger:]");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v37, v38, 572);

      PLLogCommon();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v33;
        _os_log_debug_impl(&dword_1CAF47000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_43;
    }
  }
LABEL_51:
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v40 = objc_opt_class();
    v47 = MEMORY[0x1E0C809B0];
    v48 = 3221225472;
    v49 = __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_377;
    v50 = &__block_descriptor_40_e5_v8__0lu32l8;
    v51 = v40;
    if (qword_1ED886D18 != -1)
      dispatch_once(&qword_1ED886D18, &v47);
    if (byte_1ED886C4F)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW Peripherals"), v47, v48, v49, v50, v51);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "lastPathComponent");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logPeripheralsWithLogger:]");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v44, v45, 578);

      PLLogCommon();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v41;
        _os_log_debug_impl(&dword_1CAF47000, v46, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C4A = result;
  return result;
}

uint64_t __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_353(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C4B = result;
  return result;
}

uint64_t __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_358(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C4C = result;
  return result;
}

uint64_t __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_365(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C4D = result;
  return result;
}

uint64_t __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_372(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C4E = result;
  return result;
}

uint64_t __58__PLMav5BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_377(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C4F = result;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
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
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  _QWORD block[5];
  _QWORD v66[5];
  _QWORD v67[5];
  _QWORD v68[5];
  uint8_t buf[4];
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __50__PLMav5BasebandHardwareMessage_logRFWithLogger2___block_invoke;
    v68[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v68[4] = v5;
    if (qword_1ED886D20 != -1)
      dispatch_once(&qword_1ED886D20, v68);
    if (byte_1ED886C50)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMav5BasebandHardwareMessage logRFWithLogger2:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logRFWithLogger2:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 584);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v70 = (uint64_t)v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v61 = v4;
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

  if (-[PLMav5BasebandHardwareMessage rx](self, "rx")
    && -[PLMav5BasebandHardwareMessage rx_sqa](self, "rx_sqa")
    && -[PLMav5BasebandHardwareMessage tx](self, "tx"))
  {
    v16 = 0;
    v64 = 0;
    v17 = 0;
    v18 = 80;
    v19 = 220;
    v20 = 0x1E0D7F000uLL;
    while (1)
    {
      -[PLMav5BasebandHardwareMessage indexToRAT:](self, "indexToRAT:", v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "length"))
      {
        -[PLBBMavLogMsg setRat:](v12, "setRat:", v21);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBBMavLogMsg setLogDuration:](v12, "setLogDuration:", v22);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBBMavLogMsg setRadioTech:](v12, "setRadioTech:", v23);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", ((_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[16]- (_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[12]));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBBMavLogMsg setBbHwLogDurationInTicks:](v12, "setBbHwLogDurationInTicks:", v24);

        v58 = v16;
        -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage rx](self, "rx") + v16, 4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBBMavLogMsg setRssiModeCount:](v12, "setRssiModeCount:", v25);

        -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage rx](self, "rx") + v18, 13);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBBMavLogMsg setRx0RssiPowerHist:](v12, "setRx0RssiPowerHist:", v26);

        -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage rx](self, "rx") + v18 + 260, 13);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBBMavLogMsg setRx1RssiPowerHist:](v12, "setRx1RssiPowerHist:", v27);

        -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage rx_sqa](self, "rx_sqa") + v19 - 220, 11);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBBMavLogMsg setRx0SQAPowerHist:](v12, "setRx0SQAPowerHist:", v28);

        -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage rx_sqa](self, "rx_sqa") + v19, 11);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBBMavLogMsg setRx1SQAPowerHist:](v12, "setRx1SQAPowerHist:", v29);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBBMavLogMsg setLogDuration:](v12, "setLogDuration:", v30);

        v62 = v21;
        -[PLBBMavLogMsg setRat:](v12, "setRat:", v21);
        -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage tx](self, "tx") + v64, 12);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBBMavLogMsg setTxPowerHist:](v12, "setTxPowerHist:", v31);

        objc_msgSend(v61, "protocolStateHistDict");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKey:", v33);
        v34 = objc_claimAutoreleasedReturnValue();

        if (v34)
          -[PLBBMavLogMsg setProtocolStateHist:](v12, "setProtocolStateHist:", v34);
        v60 = (void *)v34;
        v20 = 0x1E0D7F000uLL;
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v35 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __50__PLMav5BasebandHardwareMessage_logRFWithLogger2___block_invoke_394;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v35;
          if (qword_1ED886D38 != -1)
            dispatch_once(&qword_1ED886D38, block);
          if (byte_1ED886C53)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW RF %@"), v21);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "lastPathComponent");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logRFWithLogger2:]");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "logMessage:fromFile:fromFunction:fromLineNumber:", v36, v39, v40, 654);

            PLLogCommon();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v70 = (uint64_t)v36;
              _os_log_debug_impl(&dword_1CAF47000, v41, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v20 = 0x1E0D7F000;
            v21 = v62;
          }
        }
        -[PLBBMavLogMsg logEventBackwardGrpEntriesBBMavHwOtherPerRAT](v12, "logEventBackwardGrpEntriesBBMavHwOtherPerRAT");
        v42 = objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKey:](v42, "objectForKey:", CFSTR("entry"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKey:](v42, "objectForKey:", CFSTR("name"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "addToGroupPLBBMavHwEntry:withEntryKey:", v43, v44);

        v16 = v58;
      }
      else
      {
        if (!objc_msgSend(*(id *)(v20 + 4000), "debugEnabled"))
          goto LABEL_31;
        v45 = objc_opt_class();
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __50__PLMav5BasebandHardwareMessage_logRFWithLogger2___block_invoke_389;
        v66[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v66[4] = v45;
        if (qword_1ED886D30 != -1)
          dispatch_once(&qword_1ED886D30, v66);
        if (!byte_1ED886C52)
          goto LABEL_31;
        v63 = v21;
        v59 = v16;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: RAT unknown, cannot record"));
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "lastPathComponent");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logRFWithLogger2:]");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (void *)v46;
        objc_msgSend(v47, "logMessage:fromFile:fromFunction:fromLineNumber:", v46, v49, v50, 609);

        PLLogCommon();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v70 = v46;
          _os_log_debug_impl(&dword_1CAF47000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        v20 = 0x1E0D7F000;
        v16 = v59;
        v21 = v63;
      }

LABEL_31:
      ++v17;
      v18 += 52;
      v64 += 48;
      v19 += 44;
      v16 += 16;
      if (v18 == 340)
        goto LABEL_41;
    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v51 = objc_opt_class();
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __50__PLMav5BasebandHardwareMessage_logRFWithLogger2___block_invoke_384;
    v67[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v67[4] = v51;
    if (qword_1ED886D28 != -1)
      dispatch_once(&qword_1ED886D28, v67);
    if (byte_1ED886C51)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: BB HW RF <RAT> is expected but not present"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "lastPathComponent");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logRFWithLogger2:]");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "logMessage:fromFile:fromFunction:fromLineNumber:", v52, v55, v56, 598);

      PLLogCommon();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v70 = (uint64_t)v52;
        _os_log_debug_impl(&dword_1CAF47000, v57, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBMavLogMsg appendToError:](v12, "appendToError:", CFSTR("Error: BB HW RF <RAT> is expected but not present"));
  -[PLBBMavLogMsg logEventBackwardMavBBHwOtherPerRAT](v12, "logEventBackwardMavBBHwOtherPerRAT");
LABEL_41:

}

uint64_t __50__PLMav5BasebandHardwareMessage_logRFWithLogger2___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C50 = result;
  return result;
}

uint64_t __50__PLMav5BasebandHardwareMessage_logRFWithLogger2___block_invoke_384(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C51 = result;
  return result;
}

uint64_t __50__PLMav5BasebandHardwareMessage_logRFWithLogger2___block_invoke_389(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C52 = result;
  return result;
}

uint64_t __50__PLMav5BasebandHardwareMessage_logRFWithLogger2___block_invoke_394(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C53 = result;
  return result;
}

- (void)logProtocolWithLogger:(id)a3 withCount:(unsigned int)a4
{
  id v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t i;
  unsigned int v22;
  unsigned int v23;
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
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD block[5];
  _QWORD v56[5];
  uint8_t buf[4];
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = 0x1E0D7F000uLL;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __65__PLMav5BasebandHardwareMessage_logProtocolWithLogger_withCount___block_invoke;
    v56[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v56[4] = v8;
    if (qword_1ED886D40 != -1)
      dispatch_once(&qword_1ED886D40, v56);
    if (byte_1ED886C54)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMav5BasebandHardwareMessage logProtocolWithLogger:withCount:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logProtocolWithLogger:withCount:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 819);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v9;
        _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v50 = v6;
  v49 = (void *)objc_opt_new();
  if (-[PLMav5BasebandHardwareMessage protocol](self, "protocol"))
  {
    if (a4)
    {
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v48 = a4;
      v18 = 0x1E0CB3000uLL;
      do
      {
        v19 = v17;
        v51 = v16;
        -[PLMav5BasebandHardwareMessage indexToRAT:](self, "indexToRAT:", v16);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_opt_new();

        if (-[PLMav5BasebandHardwareMessage protocol](self, "protocol"))
        {
          for (i = 0; i != 16; ++i)
          {
            if ((_DWORD)(-[PLMav5BasebandHardwareMessage protocol](self, "protocol") + v15)[4 * i])
            {
              v22 = (-[PLMav5BasebandHardwareMessage protocol](self, "protocol") + v15)[4 * i];
              v23 = -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration");
              if (i <= 0xE)
                objc_msgSend(v20, "appendString:", off_1E857CC00[i]);
              if (objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
              {
                v24 = objc_opt_class();
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __65__PLMav5BasebandHardwareMessage_logProtocolWithLogger_withCount___block_invoke_435;
                block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                block[4] = v24;
                if (qword_1ED886D48 != -1)
                  dispatch_once(&qword_1ED886D48, block);
                if (byte_1ED886C55)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Protocol State: RAT [%@], Log [%@], percent [%f]= "), v52, v20, (float)((float)((float)v22 * 100.0) / (float)v23));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = (void *)MEMORY[0x1E0D7FF98];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "lastPathComponent");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logProtocolWithLogger:withCount:]");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 859);

                  PLLogCommon();
                  v30 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v58 = v25;
                    _os_log_debug_impl(&dword_1CAF47000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  v7 = 0x1E0D7F000;
                  v18 = 0x1E0CB3000uLL;
                }
              }
              objc_msgSend(*(id *)(v18 + 2024), "numberWithUnsignedInt:", (-[PLMav5BasebandHardwareMessage protocol](self, "protocol") + v15)[4 * i]);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "addObject:", v31);

            }
            else
            {
              objc_msgSend(v17, "addObject:", &unk_1E86335D0);
            }
          }
        }
        objc_msgSend(*(id *)(v18 + 2024), "numberWithInt:", v51);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setRadioTech:", v32);

        objc_msgSend(*(id *)(v18 + 2024), "numberWithInt:", v51);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setObject:forKey:", v17, v33);

        if (objc_msgSend(*(id *)(v7 + 4000), "debugEnabled"))
        {
          v34 = objc_opt_class();
          v54[0] = MEMORY[0x1E0C809B0];
          v54[1] = 3221225472;
          v54[2] = __65__PLMav5BasebandHardwareMessage_logProtocolWithLogger_withCount___block_invoke_441;
          v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v54[4] = v34;
          if (qword_1ED886D50 != -1)
            dispatch_once(&qword_1ED886D50, v54);
          if (byte_1ED886C56)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW Protocol %@"), v52);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "lastPathComponent");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logProtocolWithLogger:withCount:]");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 873);

            PLLogCommon();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v58 = v35;
              _os_log_debug_impl(&dword_1CAF47000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v7 = 0x1E0D7F000;
            v18 = 0x1E0CB3000;
          }
        }

        v16 = v51 + 1;
        v15 += 64;
      }
      while (v51 + 1 != v48);

    }
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v41 = objc_opt_class();
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __65__PLMav5BasebandHardwareMessage_logProtocolWithLogger_withCount___block_invoke_446;
      v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v53[4] = v41;
      if (qword_1ED886D58 != -1)
        dispatch_once(&qword_1ED886D58, v53);
      if (byte_1ED886C57)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: BB HW Protocol is expected but not present"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "lastPathComponent");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logProtocolWithLogger:withCount:]");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "logMessage:fromFile:fromFunction:fromLineNumber:", v42, v45, v46, 879);

        PLLogCommon();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v58 = v42;
          _os_log_debug_impl(&dword_1CAF47000, v47, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v50, "appendToError:", CFSTR("Error: BB HW Protocol is expected but not present. "));
    objc_msgSend(v50, "logEventBackwardMavBBHwOtherPerRAT");
  }
  objc_msgSend(v50, "setProtocolStateHistDict:", v49);

}

uint64_t __65__PLMav5BasebandHardwareMessage_logProtocolWithLogger_withCount___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C54 = result;
  return result;
}

uint64_t __65__PLMav5BasebandHardwareMessage_logProtocolWithLogger_withCount___block_invoke_435(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C55 = result;
  return result;
}

uint64_t __65__PLMav5BasebandHardwareMessage_logProtocolWithLogger_withCount___block_invoke_441(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C56 = result;
  return result;
}

uint64_t __65__PLMav5BasebandHardwareMessage_logProtocolWithLogger_withCount___block_invoke_446(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C57 = result;
  return result;
}

- (void)logClockWithLogger:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t i;
  double v13;
  float v14;
  double v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t j;
  double v26;
  float v27;
  double v28;
  __CFString *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__PLMav5BasebandHardwareMessage_logClockWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED886D60 != -1)
      dispatch_once(&qword_1ED886D60, block);
    if (byte_1ED886C58)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMav5BasebandHardwareMessage logClockWithLogger:]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logClockWithLogger:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 889);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v11 = v4;
  if (-[PLMav5BasebandHardwareMessage clock](self, "clock"))
  {
    for (i = 0; i != 114; ++i)
    {
      if ((_DWORD)-[PLMav5BasebandHardwareMessage clock](self, "clock")[4 * i])
      {
        v13 = (float)-[PLMav5BasebandHardwareMessage clock](self, "clock")[4 * i] * 100.0;
        v14 = v13 / (double)-[PLMav4BasebandHardwareMessage logDuration](self, "logDuration");
        v15 = v14;
        if (v15 > 0.01)
        {
          v16 = apps_clock_names_0[i];
          objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%.02f%%"), *(_QWORD *)&v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addPairWithKey:andWithVal:", v16, v17);

        }
      }
    }
    if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled") & 1) != 0)
    {
      v18 = objc_opt_class();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __52__PLMav5BasebandHardwareMessage_logClockWithLogger___block_invoke_455;
      v39[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v39[4] = v18;
      if (qword_1ED886D68 != -1)
        dispatch_once(&qword_1ED886D68, v39);
      if (byte_1ED886C59)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW APPS Clock"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "lastPathComponent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logClockWithLogger:]");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 912);

        PLLogCommon();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v19;
          _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    for (j = 0; j != 95; ++j)
    {
      if ((_DWORD)(-[PLMav5BasebandHardwareMessage clock](self, "clock") + 4 * j)[456])
      {
        v26 = (float)(-[PLMav5BasebandHardwareMessage clock](self, "clock") + 4 * j)[456] * 100.0;
        v27 = v26 / (double)-[PLMav4BasebandHardwareMessage logDuration](self, "logDuration");
        v28 = v27;
        if (v28 > 0.01)
        {
          v29 = mpss_clock_names[j];
          objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%.02f%%"), *(_QWORD *)&v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addPairWithKey:andWithVal:", v29, v30);

        }
      }
    }
    if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled") & 1) != 0)
    {
      v31 = objc_opt_class();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __52__PLMav5BasebandHardwareMessage_logClockWithLogger___block_invoke_460;
      v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v38[4] = v31;
      if (qword_1ED886D70 != -1)
        dispatch_once(&qword_1ED886D70, v38);
      if (byte_1ED886C5A)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW MPSS Clock"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav5BasebandHardwareMessage.m");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "lastPathComponent");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav5BasebandHardwareMessage logClockWithLogger:]");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 932);

        PLLogCommon();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v32;
          _os_log_debug_impl(&dword_1CAF47000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v11, "setType:", CFSTR("BB HW APPS Clock"));
  }

}

uint64_t __52__PLMav5BasebandHardwareMessage_logClockWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C58 = result;
  return result;
}

uint64_t __52__PLMav5BasebandHardwareMessage_logClockWithLogger___block_invoke_455(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C59 = result;
  return result;
}

uint64_t __52__PLMav5BasebandHardwareMessage_logClockWithLogger___block_invoke_460(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886C5A = result;
  return result;
}

- (void)formatDurationandCount:(unsigned int)a3 withCount:(unsigned int)a4 inString:(id)a5
{
  uint64_t v5;
  float v7;
  float v8;
  double v9;
  BOOL v10;
  BOOL v11;
  double v12;
  id v13;

  v5 = *(_QWORD *)&a4;
  v7 = (float)a3 * 100.0;
  v13 = a5;
  v8 = v7 / (float)-[PLMav4BasebandHardwareMessage logDuration](self, "logDuration");
  v9 = v8;
  v10 = v8 < INFINITY;
  v11 = v8 <= INFINITY;
  v12 = 0.0;
  if (v10)
    v12 = v9;
  if (!v11)
    v12 = v9;
  objc_msgSend(v13, "appendFormat:", CFSTR("[%.02f%%,%d];"), *(_QWORD *)&v12, v5);

}

- (id)indexToRAT:(unint64_t)a3
{
  if (a3 > 4)
    return &stru_1E8587D00;
  else
    return *off_1E857CC78[a3];
}

- (_PLMav5BasebandHWStatsRPM)rpm
{
  return self->_mav5_rpm;
}

- (void)setRpm:(_PLMav5BasebandHWStatsRPM *)a3
{
  self->_mav5_rpm = a3;
}

- (_PLMav5BasebandHWStatsAPPSPerf)apps
{
  return self->_mav5_apps;
}

- (void)setApps:(_PLMav5BasebandHWStatsAPPSPerf *)a3
{
  self->_mav5_apps = a3;
}

- (_PLMav5BasebandHWStatsSleep)apps_sleep
{
  return self->_mav5_apps_sleep;
}

- (void)setApps_sleep:(_PLMav5BasebandHWStatsSleep *)a3
{
  self->_mav5_apps_sleep = a3;
}

- (_PLMav5BasebandHWAPPSSleepVeto)apps_sleep_veto
{
  return self->_mav5_apps_sleep_veto;
}

- (void)setApps_sleep_veto:(_PLMav5BasebandHWAPPSSleepVeto *)a3
{
  self->_mav5_apps_sleep_veto = a3;
}

- (_PLMav4BasebandHWOnOffComponentStats)lpass
{
  return self->_mav5_lpass;
}

- (void)setLpass:(_PLMav4BasebandHWOnOffComponentStats *)a3
{
  self->_mav5_lpass = a3;
}

- (_PLMav5BasebandHWStatsMDSP)mdsp
{
  return self->_mav5_mdsp;
}

- (void)setMdsp:(_PLMav5BasebandHWStatsMDSP *)a3
{
  self->_mav5_mdsp = a3;
}

- (_PLMav5BasebandHWStatsQDSP)qdsp
{
  return self->_mav5_qdsp;
}

- (void)setQdsp:(_PLMav5BasebandHWStatsQDSP *)a3
{
  self->_mav5_qdsp = a3;
}

- (_PLMav5BasebandHWStatsSleep)mpss_sleep
{
  return self->_mav4_mpss_sleep;
}

- (void)setMpss_sleep:(_PLMav5BasebandHWStatsSleep *)a3
{
  self->_mav4_mpss_sleep = a3;
}

- (_PLMav5BasebandHWMPSSSleepVeto)mpss_sleep_veto
{
  return self->_mav4_mpss_sleep_veto;
}

- (void)setMpss_sleep_veto:(_PLMav5BasebandHWMPSSSleepVeto *)a3
{
  self->_mav4_mpss_sleep_veto = a3;
}

- (_PLMav5BasebandHWStatsUSB)usb
{
  return self->_mav5_usb;
}

- (void)setUsb:(_PLMav5BasebandHWStatsUSB *)a3
{
  self->_mav5_usb = a3;
}

- (_PLMav4BasebandHWOnOffComponentStats)gps_dpo
{
  return self->_mav5_gps_dpo;
}

- (void)setGps_dpo:(_PLMav4BasebandHWOnOffComponentStats *)a3
{
  self->_mav5_gps_dpo = a3;
}

- (_PLMav5BasebandHWStatsRX)rx
{
  return self->_mav5_rx;
}

- (void)setRx:(_PLMav5BasebandHWStatsRX *)a3
{
  self->_mav5_rx = a3;
}

- (_PLMav5BasebandHWStatsRXSQA)rx_sqa
{
  return self->_mav5_rx_sqa;
}

- (void)setRx_sqa:(_PLMav5BasebandHWStatsRXSQA *)a3
{
  self->_mav5_rx_sqa = a3;
}

- (_PLMav5BasebandHWStatsTX)tx
{
  return self->_mav5_tx;
}

- (void)setTx:(_PLMav5BasebandHWStatsTX *)a3
{
  self->_mav5_tx = a3;
}

- (_PLMav5BasebandHWStatsProtocol)protocol
{
  return self->_mav5_protocol;
}

- (void)setProtocol:(_PLMav5BasebandHWStatsProtocol *)a3
{
  self->_mav5_protocol = a3;
}

- (_PLMav5BasebandHWClocksDuration)clock
{
  return self->_mav5_clock;
}

- (void)setClock:(_PLMav5BasebandHWClocksDuration *)a3
{
  self->_mav5_clock = a3;
}

@end
