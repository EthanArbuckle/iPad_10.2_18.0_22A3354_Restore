@implementation PLMav7BasebandHardwareMessage

- (PLMav7BasebandHardwareMessage)initWithData:(id)a3
{
  id v4;
  PLMav7BasebandHardwareMessage *v5;
  PLMav7BasebandHardwareMessage *v6;
  PLMav7BasebandHardwareMessage *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLMav7BasebandHardwareMessage;
  v5 = -[PLMav5BasebandHardwareMessage initWithData:](&v9, sel_initWithData_, v4);
  v6 = v5;
  if (v5 && !-[PLMav7BasebandHardwareMessage parseData:](v5, "parseData:", v4))
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

- (BOOL)parseData:(id)a3
{
  id v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  NSObject *v19;
  id v21;
  int v22;
  unsigned __int8 *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  v5 = (unsigned __int8 *)objc_msgSend(v4, "bytes");
  v6 = &v5[2 * (*v5 == 129)];
  -[PLMav4BasebandHardwareMessage setHeader:](self, "setHeader:", v6 + 13);
  v7 = v6 + 33;
  -[PLMav4BasebandHardwareMessage setLogDuration:](self, "setLogDuration:", ((_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[16]- (_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[12]));
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
    -[PLMav7BasebandHardwareMessage setGps_dpo_bins:](self, "setGps_dpo_bins:", v7 + 112);
    -[PLMav5BasebandHardwareMessage setMpss_sleep:](self, "setMpss_sleep:", v7 + 136);
    v7 += 144;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 6)
  {
    -[PLMav7BasebandHardwareMessage setRf:](self, "setRf:", v7);
    -[PLMav7BasebandHardwareMessage setProtocol:](self, "setProtocol:", v7 + 1536);
    -[PLMav7BasebandHardwareMessage setMcpm_sleep_veto:](self, "setMcpm_sleep_veto:", v7 + 1944);
    -[PLMav7BasebandHardwareMessage setNpa_sleep_veto:](self, "setNpa_sleep_veto:", v7 + 1968);
    v7 += 2068;
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 7)
  {
    -[PLMav7BasebandHardwareMessage setApps_clock_duration_mask:](self, "setApps_clock_duration_mask:", v7);
    v8 = v7 + 16;
    v9 = -[PLMav7BasebandHardwareMessage GetClockCount:](self, "GetClockCount:", -[PLMav7BasebandHardwareMessage apps_clock_duration_mask](self, "apps_clock_duration_mask"));
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMav7BasebandHardwareMessage setApps_clock_duration:](self, "setApps_clock_duration:", v10);

    -[PLMav7BasebandHardwareMessage SetClocks:oftype:withData:](self, "SetClocks:oftype:withData:", -[PLMav7BasebandHardwareMessage apps_clock_duration_mask](self, "apps_clock_duration_mask"), 0, v8);
    v11 = (uint64_t)&v8[4 * v9];
    -[PLMav7BasebandHardwareMessage setMpss_clock_duration_mask:](self, "setMpss_clock_duration_mask:", v11);
    v11 += 16;
    v12 = -[PLMav7BasebandHardwareMessage GetClockCount:](self, "GetClockCount:", -[PLMav7BasebandHardwareMessage mpss_clock_duration_mask](self, "mpss_clock_duration_mask"));
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMav7BasebandHardwareMessage setMpss_clock_duration:](self, "setMpss_clock_duration:", v13);

    -[PLMav7BasebandHardwareMessage SetClocks:oftype:withData:](self, "SetClocks:oftype:withData:", -[PLMav7BasebandHardwareMessage mpss_clock_duration_mask](self, "mpss_clock_duration_mask"), 1, v11);
    v7 = (unsigned __int8 *)(v11 + 4 * v12);
  }
  if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 8)
  {
    -[PLMav7BasebandHardwareMessage setApps_clock_count_mask:](self, "setApps_clock_count_mask:", v7);
    v14 = (uint64_t)&v7[4
                     * -[PLMav7BasebandHardwareMessage GetClockCount:](self, "GetClockCount:", -[PLMav7BasebandHardwareMessage apps_clock_count_mask](self, "apps_clock_count_mask"))+ 16];
    -[PLMav7BasebandHardwareMessage setMpss_clock_count_mask:](self, "setMpss_clock_count_mask:", v14);
    v15 = v14
        + 4
        * -[PLMav7BasebandHardwareMessage GetClockCount:](self, "GetClockCount:", -[PLMav7BasebandHardwareMessage mpss_clock_count_mask](self, "mpss_clock_count_mask"));
    -[PLMav7BasebandHardwareMessage setHsic:](self, "setHsic:", v15 + 16);
    v7 = (unsigned __int8 *)(v15 + 48);
  }
  v16 = objc_retainAutorelease(v4);
  v17 = (unint64_t)&v7[-objc_msgSend(v16, "bytes")];
  v18 = objc_msgSend(v16, "length");
  if (v17 > v18)
  {
    PLLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_retainAutorelease(v16);
      v22 = 134218498;
      v23 = &v7[-objc_msgSend(v21, "bytes")];
      v24 = 2048;
      v25 = objc_msgSend(v21, "length");
      v26 = 2080;
      v27 = "-[PLMav7BasebandHardwareMessage parseData:]";
      _os_log_error_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", (uint8_t *)&v22, 0x20u);
    }

  }
  return v17 <= v18;
}

- (void)logWithLogger:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  PLBBMavLogMsg *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD block[5];
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)PLMav7BasebandHardwareMessage;
  -[PLBasebandHardwareMessage logRawWithLogger:](&v25, sel_logRawWithLogger_, a3);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLMav7BasebandHardwareMessage_logWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (qword_1ED8847F8 != -1)
      dispatch_once(&qword_1ED8847F8, block);
    if (_MergedGlobals_1_42)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMav7BasebandHardwareMessage logWithLogger:]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logWithLogger:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 210);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v11 = objc_alloc_init(PLBBMavLogMsg);
  -[PLBasebandMessage agent](self, "agent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage setAgent:](v11, "setAgent:", v12);

  -[PLBBMavLogMsg setError:](v11, "setError:", &stru_1E8587D00);
  -[PLBasebandMessage seqNum](self, "seqNum");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage date](self, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage timeCal](self, "timeCal");
  -[PLBBMavLogMsg setHeaderWithSeqNum:andDate:andTimeCal:](v11, "setHeaderWithSeqNum:andDate:andTimeCal:", v13, v14);

  if (-[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev") == 3)
  {
    -[PLMav4BasebandHardwareMessage logHeaderWithLogger:](self, "logHeaderWithLogger:", v11);
    -[PLMav5BasebandHardwareMessage logRPMWithLogger:](self, "logRPMWithLogger:", v11);
    -[PLMav7BasebandHardwareMessage logAPPSWithLogger:](self, "logAPPSWithLogger:", v11);
    -[PLMav7BasebandHardwareMessage logMPSSWithLogger:](self, "logMPSSWithLogger:", v11);
    -[PLMav5BasebandHardwareMessage logLPASSWithLogger:](self, "logLPASSWithLogger:", v11);
    -[PLMav7BasebandHardwareMessage logPeripheralsWithLogger:](self, "logPeripheralsWithLogger:", v11);
    -[PLMav5BasebandHardwareMessage logProtocolWithLogger:withCount:](self, "logProtocolWithLogger:withCount:", v11, 6);
    -[PLMav7BasebandHardwareMessage logProtocolActiveWithLogger:](self, "logProtocolActiveWithLogger:", v11);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
      -[PLMav7BasebandHardwareMessage logSleepVetoWithLogger:](self, "logSleepVetoWithLogger:", v11);
    if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 7)
    {
      -[PLMav7BasebandHardwareMessage logClockWithLogger:](self, "logClockWithLogger:", v11);
      -[PLMav7BasebandHardwareMessage logHSICWithLogger:](self, "logHSICWithLogger:", v11);
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v15 = objc_opt_class();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __47__PLMav7BasebandHardwareMessage_logWithLogger___block_invoke_260;
      v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v23[4] = v15;
      if (qword_1ED884800 != -1)
        dispatch_once(&qword_1ED884800, v23);
      if (byte_1ED8847D9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW Other"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logWithLogger:]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 245);

        PLLogCommon();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v16;
          _os_log_debug_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLBBMavLogMsg addToGroupPLBBMavHwOther](v11, "addToGroupPLBBMavHwOther");
    -[PLMav7BasebandHardwareMessage logRFWithLogger2:](self, "logRFWithLogger2:", v11);
    -[PLBBMavLogMsg logEventBackwardGrpEntriesBBMavHw](v11, "logEventBackwardGrpEntriesBBMavHw");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "appendFormat:", CFSTR("Version Mismatch: Baseband_sw_rev=%d Powerlog_supported_sw_rev=%d"), -[PLMav4BasebandHardwareMessage sw_rev](self, "sw_rev"), 3);
    -[PLBBMavLogMsg setError:](v11, "setError:", v22);
    -[PLBBMavLogMsg setType:](v11, "setType:", CFSTR("BB HW Error"));
    -[PLBBMavLogMsg logEventBackwardMavBBHwOther](v11, "logEventBackwardMavBBHwOther");

  }
}

uint64_t __47__PLMav7BasebandHardwareMessage_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_42 = result;
  return result;
}

uint64_t __47__PLMav7BasebandHardwareMessage_logWithLogger___block_invoke_260(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847D9 = result;
  return result;
}

- (void)logPeripheralsWithLogger:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  __int16 *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD block[5];
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PLMav7BasebandHardwareMessage;
  -[PLMav5BasebandHardwareMessage logPeripheralsWithLogger:](&v31, sel_logPeripheralsWithLogger_, v4);
  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  v7 = &word_1CB388000;
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__PLMav7BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED884808 != -1)
      dispatch_once(&qword_1ED884808, block);
    if (byte_1ED8847DA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMav7BasebandHardwareMessage logPeripheralsWithLogger:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logPeripheralsWithLogger:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 259);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v6 = MEMORY[0x1E0C809B0];
      v7 = &word_1CB388000;
    }
  }
  v14 = v4;
  if (-[PLMav7BasebandHardwareMessage gps_dpo_bins](self, "gps_dpo_bins"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav7BasebandHardwareMessage gps_dpo_bins](self, "gps_dpo_bins"), 6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setGpsDPOBin:", v15);
LABEL_10:

    goto LABEL_18;
  }
  objc_msgSend(v14, "appendToError:", CFSTR("GPS_DPO_BINS=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v29[0] = v6;
    v29[1] = 3221225472;
    v29[2] = __58__PLMav7BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_269;
    v29[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v29[4] = objc_opt_class();
    if (qword_1ED884810 != -1)
      dispatch_once(&qword_1ED884810, v29);
    if (byte_1ED8847DB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GPS_DPO_BINS=<unknown>"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logPeripheralsWithLogger:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 271);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v15;
        _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v6 = MEMORY[0x1E0C809B0];
      v7 = &word_1CB388000;
      goto LABEL_10;
    }
  }
LABEL_18:
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v21 = objc_opt_class();
    v28[0] = v6;
    v28[1] = *((_QWORD *)v7 + 166);
    v28[2] = __58__PLMav7BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_274;
    v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v28[4] = v21;
    if (qword_1ED884818 != -1)
      dispatch_once(&qword_1ED884818, v28);
    if (byte_1ED8847DC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW Peripherals GPS DPO BINS"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lastPathComponent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logPeripheralsWithLogger:]");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 274);

      PLLogCommon();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v22;
        _os_log_debug_impl(&dword_1CAF47000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __58__PLMav7BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847DA = result;
  return result;
}

uint64_t __58__PLMav7BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_269(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847DB = result;
  return result;
}

uint64_t __58__PLMav7BasebandHardwareMessage_logPeripheralsWithLogger___block_invoke_274(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847DC = result;
  return result;
}

- (void)logAPPSWithLogger:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  __int16 *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  v7 = &word_1CB388000;
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PLMav7BasebandHardwareMessage_logAPPSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED884820 != -1)
      dispatch_once(&qword_1ED884820, block);
    if (byte_1ED8847DD)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMav7BasebandHardwareMessage logAPPSWithLogger:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logAPPSWithLogger:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 279);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v6 = MEMORY[0x1E0C809B0];
      v7 = &word_1CB388000;
    }
  }
  v14 = v4;
  if (-[PLMav5BasebandHardwareMessage apps](self, "apps"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage apps](self, "apps"), 6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAppsPerfStateCountHist:", v15);
LABEL_10:

    goto LABEL_18;
  }
  objc_msgSend(v14, "appendToError:", CFSTR("Perf_Level=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v48[0] = v6;
    v48[1] = 3221225472;
    v48[2] = __51__PLMav7BasebandHardwareMessage_logAPPSWithLogger___block_invoke_281;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v48[4] = objc_opt_class();
    if (qword_1ED884828 != -1)
      dispatch_once(&qword_1ED884828, v48);
    if (byte_1ED8847DE)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Perf_Level=<unknown>"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logAPPSWithLogger:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 296);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v15;
        _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v7 = &word_1CB388000;
      goto LABEL_10;
    }
  }
LABEL_18:
  if (-[PLMav5BasebandHardwareMessage apps_sleep](self, "apps_sleep"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)-[PLMav5BasebandHardwareMessage apps_sleep](self, "apps_sleep"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCxoShutDownDuration:", v21);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLMav5BasebandHardwareMessage apps_sleep](self, "apps_sleep")[4]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCxoShutDownCount:", v22);

  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v23 = objc_opt_class();
      v47[0] = v6;
      v47[1] = *((_QWORD *)v7 + 166);
      v47[2] = __51__PLMav7BasebandHardwareMessage_logAPPSWithLogger___block_invoke_287;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v23;
      if (qword_1ED884830 != -1)
        dispatch_once(&qword_1ED884830, v47);
      if (byte_1ED8847DF)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep_Stats=<unknown>"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastPathComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logAPPSWithLogger:]");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 316);

        PLLogCommon();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v24;
          _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v7 = &word_1CB388000;
      }
    }
    objc_msgSend(v14, "appendToError:", CFSTR("Sleep_Stats=<unknown> "));
  }
  if (-[PLMav5BasebandHardwareMessage apps_sleep_veto](self, "apps_sleep_veto"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage apps_sleep_veto](self, "apps_sleep_veto"), 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAppsSleepVeto:", v30);

  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v31 = objc_opt_class();
      v46[0] = v6;
      v46[1] = *((_QWORD *)v7 + 166);
      v46[2] = __51__PLMav7BasebandHardwareMessage_logAPPSWithLogger___block_invoke_294;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v31;
      if (qword_1ED884838 != -1)
        dispatch_once(&qword_1ED884838, v46);
      if (byte_1ED8847E0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep_Veto_Duration=<unknown>"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "lastPathComponent");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logAPPSWithLogger:]");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 337);

        PLLogCommon();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v32;
          _os_log_debug_impl(&dword_1CAF47000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v14, "appendToError:", CFSTR("Sleep_Veto_Duration=<unknown> "));
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v38 = objc_opt_class();
    v45[0] = v6;
    v45[1] = *((_QWORD *)v7 + 166);
    v45[2] = __51__PLMav7BasebandHardwareMessage_logAPPSWithLogger___block_invoke_301;
    v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v45[4] = v38;
    if (qword_1ED884840 != -1)
      dispatch_once(&qword_1ED884840, v45);
    if (byte_1ED8847E1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW APPS"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "lastPathComponent");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logAPPSWithLogger:]");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v42, v43, 341);

      PLLogCommon();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v39;
        _os_log_debug_impl(&dword_1CAF47000, v44, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __51__PLMav7BasebandHardwareMessage_logAPPSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847DD = result;
  return result;
}

uint64_t __51__PLMav7BasebandHardwareMessage_logAPPSWithLogger___block_invoke_281(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847DE = result;
  return result;
}

uint64_t __51__PLMav7BasebandHardwareMessage_logAPPSWithLogger___block_invoke_287(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847DF = result;
  return result;
}

uint64_t __51__PLMav7BasebandHardwareMessage_logAPPSWithLogger___block_invoke_294(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847E0 = result;
  return result;
}

uint64_t __51__PLMav7BasebandHardwareMessage_logAPPSWithLogger___block_invoke_301(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847E1 = result;
  return result;
}

- (void)logMPSSWithLogger:(id)a3
{
  id v4;
  unint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
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
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 0x1E0D7F000uLL;
  v6 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED884848 != -1)
      dispatch_once(&qword_1ED884848, block);
    if (byte_1ED8847E2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMav7BasebandHardwareMessage logMPSSWithLogger:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logMPSSWithLogger:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 348);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v5 = 0x1E0D7F000uLL;
    }
  }
  v14 = v4;
  if (-[PLMav5BasebandHardwareMessage mpss_sleep](self, "mpss_sleep"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)-[PLMav5BasebandHardwareMessage mpss_sleep](self, "mpss_sleep"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMpssCxoShutDownDuration:", v15);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLMav5BasebandHardwareMessage mpss_sleep](self, "mpss_sleep")[4]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMpssCxoShutDownCount:", v16);

  }
  if (-[PLMav5BasebandHardwareMessage mpss_sleep_veto](self, "mpss_sleep_veto"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage mpss_sleep_veto](self, "mpss_sleep_veto"), 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMpssSleepVeto:", v17);
LABEL_12:

    goto LABEL_20;
  }
  objc_msgSend(v14, "appendToError:", CFSTR("Sleep_Veto=<unknown> "));
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v51[0] = v7;
    v51[1] = 3221225472;
    v51[2] = __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke_308;
    v51[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v51[4] = objc_opt_class();
    if (qword_1ED884850 != -1)
      dispatch_once(&qword_1ED884850, v51);
    if (byte_1ED8847E3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep_Veto=<unknown>"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logMPSSWithLogger:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 383);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v17;
        _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v5 = 0x1E0D7F000;
      goto LABEL_12;
    }
  }
LABEL_20:
  if (-[PLMav5BasebandHardwareMessage mdsp](self, "mdsp"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage mdsp](self, "mdsp"), 10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMdspConfigCount:", v23);
LABEL_22:

    goto LABEL_30;
  }
  objc_msgSend(v14, "appendToError:", CFSTR("Q6FW_Perf=<unknown> "));
  if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
  {
    v50[0] = v7;
    v50[1] = 3221225472;
    v50[2] = __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke_315;
    v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v50[4] = objc_opt_class();
    if (qword_1ED884858 != -1)
      dispatch_once(&qword_1ED884858, v50);
    if (byte_1ED8847E4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Q6FW_Perf=<unknown>"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logMPSSWithLogger:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 404);

      PLLogCommon();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v23;
        _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v5 = 0x1E0D7F000;
      goto LABEL_22;
    }
  }
LABEL_30:
  if (-[PLMav5BasebandHardwareMessage qdsp](self, "qdsp"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav5BasebandHardwareMessage qdsp](self, "qdsp"), 10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setQdspConfigCount:", v29);
LABEL_32:

    goto LABEL_40;
  }
  objc_msgSend(v14, "appendToError:", CFSTR("Q6SW_Perf=<unknown> "));
  if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
  {
    v49[0] = v7;
    v49[1] = 3221225472;
    v49[2] = __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke_322;
    v49[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v49[4] = objc_opt_class();
    if (qword_1ED884860 != -1)
      dispatch_once(&qword_1ED884860, v49);
    if (byte_1ED8847E5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Q6SW_Perf=<unknown>"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "lastPathComponent");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logMPSSWithLogger:]");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v32, v33, 423);

      PLLogCommon();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v29;
        _os_log_debug_impl(&dword_1CAF47000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v5 = 0x1E0D7F000;
      goto LABEL_32;
    }
  }
LABEL_40:
  if (-[PLMav4BasebandHardwareMessage adm](self, "adm"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav4BasebandHardwareMessage adm](self, "adm"), 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAdmOnOffState:", v35);
LABEL_42:

    goto LABEL_50;
  }
  objc_msgSend(v14, "appendToError:", CFSTR("ADM=<unknown> "));
  if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
  {
    v48[0] = v7;
    v48[1] = 3221225472;
    v48[2] = __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke_329;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v48[4] = objc_opt_class();
    if (qword_1ED884868 != -1)
      dispatch_once(&qword_1ED884868, v48);
    if (byte_1ED8847E6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ADM=<unknown>"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "lastPathComponent");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logMPSSWithLogger:]");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 443);

      PLLogCommon();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v35;
        _os_log_debug_impl(&dword_1CAF47000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v5 = 0x1E0D7F000;
      goto LABEL_42;
    }
  }
LABEL_50:
  if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
  {
    v47[0] = v7;
    v47[1] = 3221225472;
    v47[2] = __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke_334;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = objc_opt_class();
    if (qword_1ED884870 != -1)
      dispatch_once(&qword_1ED884870, v47);
    if (byte_1ED8847E7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW MPSS"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "lastPathComponent");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logMPSSWithLogger:]");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v44, v45, 449);

      PLLogCommon();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v54 = v41;
        _os_log_debug_impl(&dword_1CAF47000, v46, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847E2 = result;
  return result;
}

uint64_t __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke_308(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847E3 = result;
  return result;
}

uint64_t __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke_315(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847E4 = result;
  return result;
}

uint64_t __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke_322(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847E5 = result;
  return result;
}

uint64_t __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke_329(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847E6 = result;
  return result;
}

uint64_t __51__PLMav7BasebandHardwareMessage_logMPSSWithLogger___block_invoke_334(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847E7 = result;
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
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
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
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  _QWORD block[5];
  _QWORD v63[5];
  _QWORD v64[5];
  _QWORD v65[5];
  uint8_t buf[4];
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __50__PLMav7BasebandHardwareMessage_logRFWithLogger2___block_invoke;
    v65[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v65[4] = v5;
    if (qword_1ED884878 != -1)
      dispatch_once(&qword_1ED884878, v65);
    if (byte_1ED8847E8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMav7BasebandHardwareMessage logRFWithLogger2:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logRFWithLogger2:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 626);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v58 = v4;
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

  if (!-[PLMav7BasebandHardwareMessage rf](self, "rf"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v16 = objc_opt_class();
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __50__PLMav7BasebandHardwareMessage_logRFWithLogger2___block_invoke_339;
      v64[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v64[4] = v16;
      if (qword_1ED884880 != -1)
        dispatch_once(&qword_1ED884880, v64);
      if (byte_1ED8847E9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: BB HW RF <RAT> is expected but not present"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logRFWithLogger2:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 639);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v67 = v17;
          _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    -[PLBBMavLogMsg appendToError:](v12, "appendToError:", CFSTR("Error: BB HW RF <RAT> is expected but not present"));
    -[PLBBMavLogMsg logEventBackwardMavBBHwOtherPerRAT](v12, "logEventBackwardMavBBHwOtherPerRAT");
  }
  v23 = 0;
  v24 = 0;
  v25 = 1272;
  v26 = 408;
  v27 = 720;
  v28 = 0x1E0D7F000uLL;
  do
  {
    -[PLMav7BasebandHardwareMessage indexToRAT:](self, "indexToRAT:", v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "length"))
    {
      -[PLBBMavLogMsg setRat:](v12, "setRat:", v29);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavLogMsg setLogDuration:](v12, "setLogDuration:", v30);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavLogMsg setRadioTech:](v12, "setRadioTech:", v31);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", ((_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[16]- (_DWORD)-[PLMav4BasebandHardwareMessage header](self, "header")[12]));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavLogMsg setBbHwLogDurationInTicks:](v12, "setBbHwLogDurationInTicks:", v32);

      v60 = v23;
      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav7BasebandHardwareMessage rf](self, "rf") + v23, 4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavLogMsg setRssiModeCount:](v12, "setRssiModeCount:", v33);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav7BasebandHardwareMessage rf](self, "rf") + v26 - 312, 13);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavLogMsg setRx0RssiPowerHist:](v12, "setRx0RssiPowerHist:", v34);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav7BasebandHardwareMessage rf](self, "rf") + v26, 13);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavLogMsg setRx1RssiPowerHist:](v12, "setRx1RssiPowerHist:", v35);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav7BasebandHardwareMessage rf](self, "rf") + v25 - 264, 11);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavLogMsg setRx0SQAPowerHist:](v12, "setRx0SQAPowerHist:", v36);

      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav7BasebandHardwareMessage rf](self, "rf") + v25, 11);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavLogMsg setRx1SQAPowerHist:](v12, "setRx1SQAPowerHist:", v37);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavLogMsg setLogDuration:](v12, "setLogDuration:", v38);

      v61 = v29;
      v28 = 0x1E0D7F000uLL;
      -[PLBBMavLogMsg setRat:](v12, "setRat:", v29);
      -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav7BasebandHardwareMessage rf](self, "rf") + v27, 12);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavLogMsg setTxPowerHist:](v12, "setTxPowerHist:", v39);

      objc_msgSend(v58, "protocolStateHistDict");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKey:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBMavLogMsg setProtocolStateHist:](v12, "setProtocolStateHist:", v42);

      v59 = v27;
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v43 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __50__PLMav7BasebandHardwareMessage_logRFWithLogger2___block_invoke_349;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v43;
        if (qword_1ED884890 != -1)
          dispatch_once(&qword_1ED884890, block);
        if (byte_1ED8847EB)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW RF %@"), v61);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "lastPathComponent");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logRFWithLogger2:]");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "logMessage:fromFile:fromFunction:fromLineNumber:", v44, v47, v48, 695);

          PLLogCommon();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v67 = v44;
            _os_log_debug_impl(&dword_1CAF47000, v49, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v28 = 0x1E0D7F000;
        }
      }
      -[PLBBMavLogMsg logEventBackwardGrpEntriesBBMavHwOtherPerRAT](v12, "logEventBackwardGrpEntriesBBMavHwOtherPerRAT");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKey:", CFSTR("entry"));
      v51 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKey:", CFSTR("name"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "addToGroupPLBBMavHwEntry:withEntryKey:", v51, v52);

LABEL_27:
      v23 = v60;
      v29 = v61;

      v27 = v59;
      goto LABEL_35;
    }
    if (objc_msgSend(*(id *)(v28 + 4000), "debugEnabled"))
    {
      v53 = objc_opt_class();
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __50__PLMav7BasebandHardwareMessage_logRFWithLogger2___block_invoke_344;
      v63[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v63[4] = v53;
      if (qword_1ED884888 != -1)
        dispatch_once(&qword_1ED884888, v63);
      if (byte_1ED8847EA)
      {
        v60 = v23;
        v61 = v29;
        v59 = v27;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: RAT unknown, cannot record"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "lastPathComponent");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logRFWithLogger2:]");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "logMessage:fromFile:fromFunction:fromLineNumber:", v50, v56, v57, 651);

        PLLogCommon();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v67 = v50;
          _os_log_debug_impl(&dword_1CAF47000, v51, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        v28 = 0x1E0D7F000;
        goto LABEL_27;
      }
    }
LABEL_35:

    ++v24;
    v25 += 44;
    v27 += 48;
    v26 += 52;
    v23 += 16;
  }
  while (v25 != 1536);

}

uint64_t __50__PLMav7BasebandHardwareMessage_logRFWithLogger2___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847E8 = result;
  return result;
}

uint64_t __50__PLMav7BasebandHardwareMessage_logRFWithLogger2___block_invoke_339(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847E9 = result;
  return result;
}

uint64_t __50__PLMav7BasebandHardwareMessage_logRFWithLogger2___block_invoke_344(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847EA = result;
  return result;
}

uint64_t __50__PLMav7BasebandHardwareMessage_logRFWithLogger2___block_invoke_349(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847EB = result;
  return result;
}

- (void)logProtocolActiveWithLogger:(id)a3
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
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  _QWORD v28[5];
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
    block[2] = __61__PLMav7BasebandHardwareMessage_logProtocolActiveWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED884898 != -1)
      dispatch_once(&qword_1ED884898, block);
    if (byte_1ED8847EC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMav7BasebandHardwareMessage logProtocolActiveWithLogger:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logProtocolActiveWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 709);

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
  v12 = v4;
  if (-[PLMav7BasebandHardwareMessage protocol](self, "protocol"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav7BasebandHardwareMessage protocol](self, "protocol") + 384, 6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBbActive:", v13);

    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v14 = objc_opt_class();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __61__PLMav7BasebandHardwareMessage_logProtocolActiveWithLogger___block_invoke_363;
      v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v28[4] = v14;
      if (qword_1ED8848A8 != -1)
        dispatch_once(&qword_1ED8848A8, v28);
      if (byte_1ED8847EE)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW Protocol Active"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logProtocolActiveWithLogger:]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 721);

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v15;
          _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v21 = objc_opt_class();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __61__PLMav7BasebandHardwareMessage_logProtocolActiveWithLogger___block_invoke_358;
      v29[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v29[4] = v21;
      if (qword_1ED8848A0 != -1)
        dispatch_once(&qword_1ED8848A0, v29);
      if (byte_1ED8847ED)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: BB HW Protocol is expected but not present"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "lastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logProtocolActiveWithLogger:]");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 712);

        PLLogCommon();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v22;
          _os_log_debug_impl(&dword_1CAF47000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v12, "setError:", CFSTR("Error: BB HW Protocol is expected but not present"));
  }

}

uint64_t __61__PLMav7BasebandHardwareMessage_logProtocolActiveWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847EC = result;
  return result;
}

uint64_t __61__PLMav7BasebandHardwareMessage_logProtocolActiveWithLogger___block_invoke_358(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847ED = result;
  return result;
}

uint64_t __61__PLMav7BasebandHardwareMessage_logProtocolActiveWithLogger___block_invoke_363(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847EE = result;
  return result;
}

- (void)logSleepVetoWithLogger:(id)a3
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__PLMav7BasebandHardwareMessage_logSleepVetoWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1ED8848B0 != -1)
      dispatch_once(&qword_1ED8848B0, block);
    if (byte_1ED8847EF)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMav7BasebandHardwareMessage logSleepVetoWithLogger:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logSleepVetoWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 728);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = v4;
  if (!-[PLMav7BasebandHardwareMessage mcpm_sleep_veto](self, "mcpm_sleep_veto"))
  {
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_29;
    v23 = objc_opt_class();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __56__PLMav7BasebandHardwareMessage_logSleepVetoWithLogger___block_invoke_368;
    v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v37[4] = v23;
    if (qword_1ED8848B8 != -1)
      dispatch_once(&qword_1ED8848B8, v37);
    if (!byte_1ED8847F0)
      goto LABEL_29;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: BB HW Sleep Veto is expected but not present"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "lastPathComponent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logSleepVetoWithLogger:]");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 745);

    PLLogCommon();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      goto LABEL_28;
    *(_DWORD *)buf = 138412290;
    v40 = v24;
    goto LABEL_32;
  }
  -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav7BasebandHardwareMessage mcpm_sleep_veto](self, "mcpm_sleep_veto"), 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMcpmVetoNumHistogram:", v13);

  if (!-[PLMav7BasebandHardwareMessage npa_sleep_veto](self, "npa_sleep_veto"))
  {
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_29;
    v30 = objc_opt_class();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __56__PLMav7BasebandHardwareMessage_logSleepVetoWithLogger___block_invoke_375;
    v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v36[4] = v30;
    if (qword_1ED8848C0 != -1)
      dispatch_once(&qword_1ED8848C0, v36);
    if (!byte_1ED8847F1)
      goto LABEL_29;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: BB HW Sleep Veto is expected but not present"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "lastPathComponent");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logSleepVetoWithLogger:]");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v33, v34, 765);

    PLLogCommon();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
LABEL_28:

LABEL_29:
      objc_msgSend(v12, "appendToError:", CFSTR("Error: BB HW Sleep Veto is expected but not present. "));
      goto LABEL_30;
    }
    *(_DWORD *)buf = 138412290;
    v40 = v24;
LABEL_32:
    _os_log_debug_impl(&dword_1CAF47000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)-[PLMav7BasebandHardwareMessage npa_sleep_veto](self, "npa_sleep_veto"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNpaVetoMask:", v14);

  -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav7BasebandHardwareMessage npa_sleep_veto](self, "npa_sleep_veto") + 4, 24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNpaVetoClientNumHistogram:", v15);

  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled") & 1) != 0)
  {
    v16 = objc_opt_class();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __56__PLMav7BasebandHardwareMessage_logSleepVetoWithLogger___block_invoke_378;
    v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v35[4] = v16;
    if (qword_1ED8848C8 != -1)
      dispatch_once(&qword_1ED8848C8, v35);
    if (byte_1ED8847F2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW Sleep Veto"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logSleepVetoWithLogger:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 773);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v17;
        _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
LABEL_30:

}

uint64_t __56__PLMav7BasebandHardwareMessage_logSleepVetoWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847EF = result;
  return result;
}

uint64_t __56__PLMav7BasebandHardwareMessage_logSleepVetoWithLogger___block_invoke_368(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847F0 = result;
  return result;
}

uint64_t __56__PLMav7BasebandHardwareMessage_logSleepVetoWithLogger___block_invoke_375(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847F1 = result;
  return result;
}

uint64_t __56__PLMav7BasebandHardwareMessage_logSleepVetoWithLogger___block_invoke_378(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847F2 = result;
  return result;
}

- (int)GetClockCount:(_PLMav7BasebandHWStatsClockStateMask *)a3
{
  uint64_t v3;
  int result;
  unsigned int v5;
  BOOL v6;

  v3 = 0;
  result = 0;
  do
  {
    v5 = a3->var0[v3];
    if (v5)
    {
      do
      {
        result += v5 & 1;
        v6 = v5 >= 2;
        v5 >>= 1;
      }
      while (v6);
    }
    ++v3;
  }
  while (v3 != 4);
  return result;
}

- (void)SetClocks:(_PLMav7BasebandHWStatsClockStateMask *)a3 oftype:(int)a4 withData:(char *)a5
{
  uint64_t v8;
  __CFString **v9;
  unsigned int v10;
  __CFString **v11;
  unsigned int v12;
  float v13;
  double v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = apps_clock_names_1;
  do
  {
    v10 = a3->var0[v8];
    v11 = v9;
    if (v10)
    {
      do
      {
        if ((v10 & 1) != 0)
        {
          v12 = *(_DWORD *)a5;
          if (-[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"))
          {
            if (-[PLMav4BasebandHardwareMessage logDuration](self, "logDuration"))
            {
              v13 = (float)v12 * 100.0 / (double)-[PLMav4BasebandHardwareMessage logDuration](self, "logDuration");
              v14 = v13;
              if (v14 > 0.01)
                objc_msgSend(v21, "appendFormat:", CFSTR(" %@=[%.02f%%];"), *v11, *(_QWORD *)&v14);
            }
          }
          a5 += 4;
        }
        ++v11;
        v15 = v10 >= 2;
        v10 >>= 1;
      }
      while (v15);
    }
    ++v8;
    ++v9;
  }
  while (v8 != 4);
  if (!a4)
  {
    -[PLMav7BasebandHardwareMessage apps_clock_duration](self, "apps_clock_duration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[PLMav7BasebandHardwareMessage apps_clock_duration](self, "apps_clock_duration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  -[PLMav7BasebandHardwareMessage mpss_clock_duration](self, "mpss_clock_duration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PLMav7BasebandHardwareMessage mpss_clock_duration](self, "mpss_clock_duration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
    v19 = v17;
    objc_msgSend(v17, "appendString:", v21);

  }
}

- (void)logClockWithLogger:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  uint64_t v33;
  uint64_t block;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  void *v37;
  uint64_t v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLMav7BasebandHardwareMessage apps_clock_duration](self, "apps_clock_duration");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[PLMav7BasebandHardwareMessage apps_clock_duration](self, "apps_clock_duration"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v6,
        v8))
  {
    -[PLMav7BasebandHardwareMessage apps_clock_duration](self, "apps_clock_duration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAppsClockStateDurationStr:", v9);

  }
  else if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 7)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v10 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v35 = 3221225472;
      v36 = __52__PLMav7BasebandHardwareMessage_logClockWithLogger___block_invoke;
      v37 = &__block_descriptor_40_e5_v8__0lu32l8;
      v38 = v10;
      if (qword_1ED8848D0 != -1)
        dispatch_once(&qword_1ED8848D0, &block);
      if (byte_1ED8847F3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: BB HW APPS Clocks is expected but not present"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logClockWithLogger:]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 848);

        PLLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v11;
          _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v4, "appendToError:", CFSTR("Error: BB HW APPS Clocks is expected but not present. "));
  }
  -[PLMav7BasebandHardwareMessage mpss_clock_duration](self, "mpss_clock_duration");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17
    && (v18 = (void *)v17,
        -[PLMav7BasebandHardwareMessage mpss_clock_duration](self, "mpss_clock_duration"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "length"),
        v19,
        v18,
        v20))
  {
    -[PLMav7BasebandHardwareMessage mpss_clock_duration](self, "mpss_clock_duration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMpssClockStateDurationStr:", v21);

  }
  else if (-[PLMav4BasebandHardwareMessage level](self, "level") >= 7)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v22 = objc_opt_class();
      v29 = MEMORY[0x1E0C809B0];
      v30 = 3221225472;
      v31 = __52__PLMav7BasebandHardwareMessage_logClockWithLogger___block_invoke_389;
      v32 = &__block_descriptor_40_e5_v8__0lu32l8;
      v33 = v22;
      if (qword_1ED8848D8 != -1)
        dispatch_once(&qword_1ED8848D8, &v29);
      if (byte_1ED8847F4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: BB HW MPSS Clock is expected but not present"), v29, v30, v31, v32, v33);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "lastPathComponent");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logClockWithLogger:]");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 876);

        PLLogCommon();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v23;
          _os_log_debug_impl(&dword_1CAF47000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v4, "appendToError:", CFSTR("Error: BB HW MPSS Clock is expected but not present. "), v29, v30, v31, v32, v33, block, v35, v36, v37, v38);
  }

}

uint64_t __52__PLMav7BasebandHardwareMessage_logClockWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847F3 = result;
  return result;
}

uint64_t __52__PLMav7BasebandHardwareMessage_logClockWithLogger___block_invoke_389(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847F4 = result;
  return result;
}

- (void)logHSICWithLogger:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  uint64_t v24;
  _QWORD block[5];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PLMav7BasebandHardwareMessage hsic](self, "hsic"))
  {
    -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav7BasebandHardwareMessage hsic](self, "hsic"), 8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHsicStateSleepVetoNum:", v5);

  }
  else
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v6 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__PLMav7BasebandHardwareMessage_logHSICWithLogger___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v6;
      if (qword_1ED8848E0 != -1)
        dispatch_once(&qword_1ED8848E0, block);
      if (byte_1ED8847F5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: HSIC is expected but not present"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logHSICWithLogger:]");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 907);

        PLLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v7;
          _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(v4, "appendToError:", CFSTR("State=<unknown>;"));
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v13 = objc_opt_class();
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __51__PLMav7BasebandHardwareMessage_logHSICWithLogger___block_invoke_400;
    v23 = &__block_descriptor_40_e5_v8__0lu32l8;
    v24 = v13;
    if (qword_1ED8848E8 != -1)
      dispatch_once(&qword_1ED8848E8, &v20);
    if (byte_1ED8847F6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoded BB HW HSIC"), v20, v21, v22, v23, v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav7BasebandHardwareMessage.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav7BasebandHardwareMessage logHSICWithLogger:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 914);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v14;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __51__PLMav7BasebandHardwareMessage_logHSICWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847F5 = result;
  return result;
}

uint64_t __51__PLMav7BasebandHardwareMessage_logHSICWithLogger___block_invoke_400(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8847F6 = result;
  return result;
}

- (id)indexToRAT:(unint64_t)a3
{
  if (a3 > 5)
    return &stru_1E8587D00;
  else
    return *off_1E857E250[a3];
}

- (_PLMav7BasebandHWStatsRFTech)rf
{
  return self->_rf;
}

- (void)setRf:(_PLMav7BasebandHWStatsRFTech *)a3
{
  self->_rf = a3;
}

- (_PLMav7BasebandHWStatsProtocol)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(_PLMav7BasebandHWStatsProtocol *)a3
{
  self->_protocol = a3;
}

- (_PLMav7BasebandHWStatsMCPMVeto)mcpm_sleep_veto
{
  return self->_mcpm_sleep_veto;
}

- (void)setMcpm_sleep_veto:(_PLMav7BasebandHWStatsMCPMVeto *)a3
{
  self->_mcpm_sleep_veto = a3;
}

- (_PLMav7BasebandHWStatsNPAVeto)npa_sleep_veto
{
  return self->_npa_sleep_veto;
}

- (void)setNpa_sleep_veto:(_PLMav7BasebandHWStatsNPAVeto *)a3
{
  self->_npa_sleep_veto = a3;
}

- (_PLMav7BasebandHWStatsClockStateMask)apps_clock_duration_mask
{
  return self->_apps_clock_duration_mask;
}

- (void)setApps_clock_duration_mask:(_PLMav7BasebandHWStatsClockStateMask *)a3
{
  self->_apps_clock_duration_mask = a3;
}

- (_PLMav7BasebandHWStatsClockStateMask)mpss_clock_duration_mask
{
  return self->_mpss_clock_duration_mask;
}

- (void)setMpss_clock_duration_mask:(_PLMav7BasebandHWStatsClockStateMask *)a3
{
  self->_mpss_clock_duration_mask = a3;
}

- (NSMutableString)apps_clock_duration
{
  return self->_apps_clock_duration;
}

- (void)setApps_clock_duration:(id)a3
{
  objc_storeStrong((id *)&self->_apps_clock_duration, a3);
}

- (NSMutableString)mpss_clock_duration
{
  return self->_mpss_clock_duration;
}

- (void)setMpss_clock_duration:(id)a3
{
  objc_storeStrong((id *)&self->_mpss_clock_duration, a3);
}

- (_PLMav7BasebandHWStatsClockStateMask)apps_clock_count_mask
{
  return self->_apps_clock_count_mask;
}

- (void)setApps_clock_count_mask:(_PLMav7BasebandHWStatsClockStateMask *)a3
{
  self->_apps_clock_count_mask = a3;
}

- (_PLMav7BasebandHWStatsClockStateMask)mpss_clock_count_mask
{
  return self->_mpss_clock_count_mask;
}

- (void)setMpss_clock_count_mask:(_PLMav7BasebandHWStatsClockStateMask *)a3
{
  self->_mpss_clock_count_mask = a3;
}

- (_PLMav7BasebandHWStatsHSICState)hsic
{
  return self->_hsic;
}

- (void)setHsic:(_PLMav7BasebandHWStatsHSICState *)a3
{
  self->_hsic = a3;
}

- (_PLMav7BasebandGPSDPOBin)gps_dpo_bins
{
  return self->_gps_dpo_bins;
}

- (void)setGps_dpo_bins:(_PLMav7BasebandGPSDPOBin *)a3
{
  self->_gps_dpo_bins = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mpss_clock_duration, 0);
  objc_storeStrong((id *)&self->_apps_clock_duration, 0);
}

@end
