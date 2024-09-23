@implementation PLMav2BasebandHardwareMessage

- (PLMav2BasebandHardwareMessage)initWithData:(id)a3
{
  id v4;
  PLMav2BasebandHardwareMessage *v5;
  PLMav2BasebandHardwareMessage *v6;
  PLMav2BasebandHardwareMessage *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLMav2BasebandHardwareMessage;
  v5 = -[PLBasebandHardwareMessage initWithData:](&v9, sel_initWithData_, v4);
  v6 = v5;
  if (!v5
    || (-[PLMav2BasebandHardwareMessage setRx:](v5, "setRx:", 0),
        -[PLMav2BasebandHardwareMessage setTx:](v6, "setTx:", 0),
        v7 = 0,
        -[PLMav2BasebandHardwareMessage parseData:](v6, "parseData:", v4)))
  {
    v7 = v6;
  }

  return v7;
}

- (BOOL)parseData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int var1;
  id v8;
  unint64_t v9;
  NSObject *v10;
  BOOL v11;
  id v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  self->super._header = (_PLBasebandHWStatsHeader *)(v5 + 13);
  if (-[PLBasebandHardwareMessage revision](self, "revision") <= 2)
  {
    v6 = v5 + 29;
    -[PLBasebandHardwareMessage setLogDuration:](self, "setLogDuration:", self->super._header->var3 - self->super._header->var2);
    if (self->super._header->var1)
    {
      self->super._system = (_PLBasebandHWStatsSystem *)v6;
      v6 = v5 + 49;
      var1 = self->super._header->var1;
      if (var1 >= 4)
      {
        self->super._armPerf = (_PLBasebandHWStatsARMPerf *)v6;
        v6 = v5 + 89;
        var1 = self->super._header->var1;
      }
      if (var1 >= 3)
      {
        self->super._mdsp = (_PLBasebandHWStatsMDSP *)v6;
        self->super._mdm = (_PLBasebandHWOnOffComponentStats *)(v6 + 60);
        self->super._adsp = (_PLBasebandHWStatsADSP *)(v6 + 76);
        self->super._adm = (_PLBasebandHWOnOffComponentStats *)(v6 + 136);
        self->super._gps = (_PLBasebandHWOnOffComponentStats *)(v6 + 152);
        self->super._usb = (_PLBasebandHWOnOffComponentStats *)(v6 + 168);
        self->super._uart = (_PLBasebandHWStatsUART *)(v6 + 184);
        self->super._spi = (_PLBasebandHWOnOffComponentStats *)(v6 + 216);
        if (self->super._header->var1 < 6)
        {
          v6 += 232;
        }
        else
        {
          -[PLMav2BasebandHardwareMessage setRx:](self, "setRx:", v6 + 232);
          -[PLMav2BasebandHardwareMessage setTx:](self, "setTx:", v6 + 832);
          v6 += 1072;
        }
      }
    }
    v8 = objc_retainAutorelease(v4);
    v9 = v6 - objc_msgSend(v8, "bytes");
    if (v9 <= objc_msgSend(v8, "length"))
    {
      v11 = 1;
      goto LABEL_15;
    }
    PLLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_retainAutorelease(v8);
      v14 = 134218498;
      v15 = v6 - objc_msgSend(v13, "bytes");
      v16 = 2048;
      v17 = objc_msgSend(v13, "length");
      v18 = 2080;
      v19 = "-[PLMav2BasebandHardwareMessage parseData:]";
      _os_log_error_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_ERROR, "Expected data length %lu but got %lu in %s", (uint8_t *)&v14, 0x20u);
    }

  }
  v11 = 0;
LABEL_15:

  return v11;
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
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)PLMav2BasebandHardwareMessage;
  -[PLBasebandHardwareMessage logRawWithLogger:](&v24, sel_logRawWithLogger_, a3);
  v4 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLMav2BasebandHardwareMessage_logWithLogger___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED886708 != -1)
      dispatch_once(&qword_1ED886708, block);
    if (_MergedGlobals_81)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMav2BasebandHardwareMessage logWithLogger:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav2BasebandHardwareMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav2BasebandHardwareMessage logWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 114);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v6;
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

  -[PLMav2BasebandHardwareMessage logHeaderWithLogger:](self, "logHeaderWithLogger:", v12);
  -[PLBasebandHardwareMessage logProcessorWithLogger:](self, "logProcessorWithLogger:", v12);
  -[PLBasebandHardwareMessage logModemAppWithLogger:](self, "logModemAppWithLogger:", v12);
  -[PLBasebandHardwareMessage logPeripheralsWithLogger:](self, "logPeripheralsWithLogger:", v12);
  -[PLBBMavLogMsg addToGroupPLBBMav2HwOther](v12, "addToGroupPLBBMav2HwOther");
  -[PLMav2BasebandHardwareMessage logRFWithLogger2:](self, "logRFWithLogger2:", v12);
  -[PLBBMavLogMsg logEventBackwardGrpEntriesBBMavHw](v12, "logEventBackwardGrpEntriesBBMavHw");
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v22[0] = v5;
    v22[1] = 3221225472;
    v22[2] = __47__PLMav2BasebandHardwareMessage_logWithLogger___block_invoke_255;
    v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v22[4] = objc_opt_class();
    if (qword_1ED886710 != -1)
      dispatch_once(&qword_1ED886710, v22);
    if (byte_1ED886701)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Decoding BB HW RF completed"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav2BasebandHardwareMessage.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav2BasebandHardwareMessage logWithLogger:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 136);

      PLLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v16;
        _os_log_debug_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

}

uint64_t __47__PLMav2BasebandHardwareMessage_logWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_81 = result;
  return result;
}

uint64_t __47__PLMav2BasebandHardwareMessage_logWithLogger___block_invoke_255(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886701 = result;
  return result;
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
  id v12;
  _PLBasebandHWStatsHeader *header;
  void *v14;
  void *v15;
  void *v16;
  uint64_t block;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  uint64_t v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PLMav2BasebandHardwareMessage;
  -[PLBasebandHardwareMessage logHeaderWithLogger:](&v22, sel_logHeaderWithLogger_, v4);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __53__PLMav2BasebandHardwareMessage_logHeaderWithLogger___block_invoke;
    v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    v21 = v5;
    if (qword_1ED886718 != -1)
      dispatch_once(&qword_1ED886718, &block);
    if (byte_1ED886702)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMav2BasebandHardwareMessage logHeaderWithLogger:]", block, v18, v19, v20, v21);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav2BasebandHardwareMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav2BasebandHardwareMessage logHeaderWithLogger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 143);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = v4;
  header = self->super._header;
  if (header)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", header->var3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBbHwCurrTimeStamp:", v14);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->super._header->var2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBbHwLastTimeStamp:", v15);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->super._header->var3 - self->super._header->var2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBbHwLogDurationInTicks:", v16);

  }
}

uint64_t __53__PLMav2BasebandHardwareMessage_logHeaderWithLogger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886702 = result;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  _QWORD block[5];
  _QWORD v47[5];
  _QWORD v48[5];
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __50__PLMav2BasebandHardwareMessage_logRFWithLogger2___block_invoke;
    v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v48[4] = v5;
    if (qword_1ED886720 != -1)
      dispatch_once(&qword_1ED886720, v48);
    if (byte_1ED886703)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLMav2BasebandHardwareMessage logRFWithLogger2:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav2BasebandHardwareMessage.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav2BasebandHardwareMessage logRFWithLogger2:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 155);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = v4;
  v13 = (void *)objc_opt_new();
  -[PLBasebandMessage agent](self, "agent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAgent:", v14);

  objc_msgSend(v13, "setError:", &stru_1E8587D00);
  -[PLBasebandMessage seqNum](self, "seqNum");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage date](self, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBasebandMessage timeCal](self, "timeCal");
  v45 = v13;
  objc_msgSend(v13, "setHeaderWithSeqNum:andDate:andTimeCal:", v15, v16);

  if (-[PLMav2BasebandHardwareMessage rx](self, "rx") && -[PLMav2BasebandHardwareMessage tx](self, "tx"))
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 80;
    v43 = v12;
    while (1)
    {
      -[PLMav2BasebandHardwareMessage indexToRAT:](self, "indexToRAT:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "length"))
      {
        objc_msgSend(v45, "setRat:", v21);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBasebandHardwareMessage logDuration](self, "logDuration"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setLogDuration:", v22);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setRadioTech:", v23);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLBasebandHardwareMessage logDuration](self, "logDuration"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setBbHwLogDurationInTicks:", v24);

        -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav2BasebandHardwareMessage rx](self, "rx") + v17, 4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setRssiModeCount:", v25);

        -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav2BasebandHardwareMessage rx](self, "rx") + v20, 13);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setRx0RssiPowerHist:", v26);

        -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav2BasebandHardwareMessage rx](self, "rx") + v20 + 260, 13);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setRx1RssiPowerHist:", v27);

        -[PLBasebandHardwareMessage convertUint32ArrayToNSArray:ofSize:](self, "convertUint32ArrayToNSArray:ofSize:", -[PLMav2BasebandHardwareMessage tx](self, "tx") + v18, 12);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setTxPowerHist:", v28);

        objc_msgSend(v45, "logEventBackwardGrpEntriesBBMavHwOtherPerRAT");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKey:", CFSTR("entry"));
        v30 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKey:", CFSTR("name"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addToGroupPLBBMavHwEntry:withEntryKey:", v30, v31);

      }
      else
      {
        if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          goto LABEL_21;
        v32 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __50__PLMav2BasebandHardwareMessage_logRFWithLogger2___block_invoke_268;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v32;
        if (qword_1ED886730 != -1)
          dispatch_once(&qword_1ED886730, block);
        if (!byte_1ED886705)
          goto LABEL_21;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: RAT unknown, cannot record"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav2BasebandHardwareMessage.m");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "lastPathComponent");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav2BasebandHardwareMessage logRFWithLogger2:]");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v34, v35, 179);

        PLLogCommon();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v50 = v29;
          _os_log_debug_impl(&dword_1CAF47000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        v12 = v43;
      }

LABEL_21:
      ++v19;
      v20 += 52;
      v18 += 48;
      v17 += 16;
      if (v20 == 340)
        goto LABEL_31;
    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v36 = objc_opt_class();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __50__PLMav2BasebandHardwareMessage_logRFWithLogger2___block_invoke_263;
    v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v47[4] = v36;
    if (qword_1ED886728 != -1)
      dispatch_once(&qword_1ED886728, v47);
    if (byte_1ED886704)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: BB HW RF <RAT> is expected but not present"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLMav2BasebandHardwareMessage.m");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "lastPathComponent");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMav2BasebandHardwareMessage logRFWithLogger2:]");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "logMessage:fromFile:fromFunction:fromLineNumber:", v37, v40, v41, 168);

      PLLogCommon();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v37;
        _os_log_debug_impl(&dword_1CAF47000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v13, "appendToError:", CFSTR("Error: BB HW RF <RAT> is expected but not present"));
  objc_msgSend(v13, "logEventBackwardMavBBHwOtherPerRAT");
LABEL_31:

}

uint64_t __50__PLMav2BasebandHardwareMessage_logRFWithLogger2___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886703 = result;
  return result;
}

uint64_t __50__PLMav2BasebandHardwareMessage_logRFWithLogger2___block_invoke_263(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886704 = result;
  return result;
}

uint64_t __50__PLMav2BasebandHardwareMessage_logRFWithLogger2___block_invoke_268(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886705 = result;
  return result;
}

- (id)indexToRAT:(unint64_t)a3
{
  __CFString *v3;
  __CFString **v4;
  id result;

  v3 = CFSTR("NONE");
  switch(a3)
  {
    case 0uLL:
      v4 = kPLGSM;
      goto LABEL_7;
    case 1uLL:
      v4 = kPLCDMA2K;
      goto LABEL_7;
    case 2uLL:
      v4 = kPL1xEVDO;
      goto LABEL_7;
    case 3uLL:
      v4 = kPLWCDMA;
LABEL_7:
      v3 = *v4;
      goto LABEL_8;
    case 4uLL:
LABEL_8:
      result = v3;
      break;
    default:
      result = CFSTR("Unknown");
      break;
  }
  return result;
}

- (_PLMav2BasebandHWStatsRX)rx
{
  return self->_mav2_rx;
}

- (void)setRx:(_PLMav2BasebandHWStatsRX *)a3
{
  self->_mav2_rx = a3;
}

- (_PLMav2BasebandHWStatsTX)tx
{
  return self->_mav2_tx;
}

- (void)setTx:(_PLMav2BasebandHWStatsTX *)a3
{
  self->_mav2_tx = a3;
}

@end
