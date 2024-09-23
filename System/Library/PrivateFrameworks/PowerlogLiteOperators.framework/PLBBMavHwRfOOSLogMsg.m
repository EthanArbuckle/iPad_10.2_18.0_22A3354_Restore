@implementation PLBBMavHwRfOOSLogMsg

- (PLBBMavHwRfOOSLogMsg)init
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  PLBBMavHwRfOOSLogMsg *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *commonInfo;
  NSMutableDictionary *v13;
  NSMutableDictionary *kvPairs;
  objc_super v16;
  _QWORD block[5];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__PLBBMavHwRfOOSLogMsg_init__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1ED882D90 != -1)
      dispatch_once(&qword_1ED882D90, block);
    if (_MergedGlobals_1_23)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavHwRfOOSLogMsg init]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfOOSLogMsg.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfOOSLogMsg init]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 25);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v16.receiver = self;
  v16.super_class = (Class)PLBBMavHwRfOOSLogMsg;
  v10 = -[PLBBMavHwRfOOSLogMsg init](&v16, sel_init);
  if (v10)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    commonInfo = v10->_commonInfo;
    v10->_commonInfo = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    kvPairs = v10->_kvPairs;
    v10->_kvPairs = v13;

    v10->_inited = 1;
  }
  return v10;
}

uint64_t __28__PLBBMavHwRfOOSLogMsg_init__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_23 = result;
  return result;
}

- (void)setHeaderWithSeqNum:(id)a3 andDate:(id)a4 andTimeCal:(double)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSMutableDictionary *commonInfo;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v10 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__PLBBMavHwRfOOSLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1ED882D98 != -1)
      dispatch_once(&qword_1ED882D98, block);
    if (byte_1ED882D89)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMavHwRfOOSLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfOOSLogMsg.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfOOSLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 39);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v11;
        _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (v8 && v9)
  {
    -[NSMutableDictionary setObject:forKey:](self->_commonInfo, "setObject:forKey:", v8, CFSTR("SeqNum"));
    -[NSMutableDictionary setObject:forKey:](self->_commonInfo, "setObject:forKey:", v9, CFSTR("BBDate"));
    commonInfo = self->_commonInfo;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](commonInfo, "setValue:forKey:", v18, CFSTR("TimeCal"));
LABEL_18:

    goto LABEL_19;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v19 = objc_opt_class();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __63__PLBBMavHwRfOOSLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_15;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = v19;
    if (qword_1ED882DA0 != -1)
      dispatch_once(&qword_1ED882DA0, v25);
    if (byte_1ED882D8A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to set seqNum, date, timeCal"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMavHwRfOOSLogMsg.m");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMavHwRfOOSLogMsg setHeaderWithSeqNum:andDate:andTimeCal:]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v22, v23, 41);

      PLLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v18;
        _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_18;
    }
  }
LABEL_19:

}

uint64_t __63__PLBBMavHwRfOOSLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882D89 = result;
  return result;
}

uint64_t __63__PLBBMavHwRfOOSLogMsg_setHeaderWithSeqNum_andDate_andTimeCal___block_invoke_15(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882D8A = result;
  return result;
}

+ (id)entryEventBackwardDefinitionOOSPerRat
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[15];
  _QWORD v25[15];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[3];
  _QWORD v31[5];

  v31[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D80348];
  v30[0] = *MEMORY[0x1E0D80358];
  v30[1] = v2;
  v31[0] = &unk_1E8632820;
  v31[1] = &unk_1E8632838;
  v30[2] = *MEMORY[0x1E0D80350];
  v31[2] = &unk_1E8632850;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = *MEMORY[0x1E0D80298];
  v4 = *MEMORY[0x1E0D802B8];
  v26[0] = *MEMORY[0x1E0D80318];
  v26[1] = v4;
  v27[0] = &unk_1E8652C50;
  v27[1] = MEMORY[0x1E0C9AAA0];
  v5 = *MEMORY[0x1E0D80308];
  v26[2] = *MEMORY[0x1E0D802F8];
  v26[3] = v5;
  v27[2] = CFSTR("refreshRequestHandler");
  v27[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  v28[1] = *MEMORY[0x1E0D802F0];
  v24[0] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  v24[1] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_DateFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v19;
  v24[2] = CFSTR("LogDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_RealFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v17;
  v24[3] = CFSTR("oosInProgress");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_BoolFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v6;
  v24[4] = CFSTR("oosTimes");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v8;
  v24[5] = CFSTR("oosTicks");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v10;
  v24[6] = CFSTR("pssiTicks");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commonTypeDict_IntegerFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v12;
  v25[7] = v3;
  v24[7] = CFSTR("oosLtePssiTimes");
  v24[8] = CFSTR("oosLtePssiStatTicks");
  v25[8] = v3;
  v25[9] = v3;
  v24[9] = CFSTR("oosGsmPssiTimes");
  v24[10] = CFSTR("oosGsmPssiStatTicks");
  v25[10] = v3;
  v25[11] = v3;
  v24[11] = CFSTR("oosWcdmaPssiTimes");
  v24[12] = CFSTR("oosWcdmaPssiStatTicks");
  v25[12] = v3;
  v25[13] = v3;
  v24[13] = CFSTR("oosTdsPssiTimes");
  v24[14] = CFSTR("oosTdsPssiStatTicks");
  v25[14] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)refreshBBMavHwRfOOS
{
  objc_autoreleasePoolPop((void *)MEMORY[0x1D179C2E0](self, a2));
}

- (id)logEventBackwardBBMavHwRfOos
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("BBMavHwRfOos"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v3);
  -[PLBBMavHwRfOOSLogMsg populateEntry:](self, "populateEntry:", v4);
  v7[0] = CFSTR("entry");
  v7[1] = CFSTR("entryKey");
  v8[0] = v4;
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)populateEntry:(id)a3
{
  NSMutableDictionary *commonInfo;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  commonInfo = self->_commonInfo;
  v5 = a3;
  -[NSMutableDictionary objectForKey:](commonInfo, "objectForKey:", CFSTR("BBDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertFromBasebandToMonotonic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEntryDate:", v7);

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("BBDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("BBDate"));

  -[NSMutableDictionary objectForKey:](self->_commonInfo, "objectForKey:", CFSTR("SeqNum"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("SeqNum"));

  -[PLBBMavHwRfOOSLogMsg logDuration](self, "logDuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("LogDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[PLBBMavHwRfOOSLogMsg oosInProgress](self, "oosInProgress"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("oosInProgress"));

  -[PLBBMavHwRfOOSLogMsg oosTimes](self, "oosTimes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("oosTimes"));

  -[PLBBMavHwRfOOSLogMsg oosTicks](self, "oosTicks");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("oosTicks"));

  -[PLBBMavHwRfOOSLogMsg pssiTicks](self, "pssiTicks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("pssiTicks"));

  -[PLBBMavHwRfOOSLogMsg oosLtePssiTimes](self, "oosLtePssiTimes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("oosLtePssiTimes"));

  -[PLBBMavHwRfOOSLogMsg oosLtePssiStatTicks](self, "oosLtePssiStatTicks");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("oosLtePssiStatTicks"));

  -[PLBBMavHwRfOOSLogMsg oosGsmPssiTimes](self, "oosGsmPssiTimes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("oosGsmPssiTimes"));

  -[PLBBMavHwRfOOSLogMsg oosGsmPssiStatTicks](self, "oosGsmPssiStatTicks");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("oosGsmPssiStatTicks"));

  -[PLBBMavHwRfOOSLogMsg oosWcdmaPssiTimes](self, "oosWcdmaPssiTimes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("oosWcdmaPssiTimes"));

  -[PLBBMavHwRfOOSLogMsg oosWcdmaPssiStatTicks](self, "oosWcdmaPssiStatTicks");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("oosWcdmaPssiStatTicks"));

  -[PLBBMavHwRfOOSLogMsg oosTdsPssiTimes](self, "oosTdsPssiTimes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("oosTdsPssiTimes"));

  -[PLBBMavHwRfOOSLogMsg oosTdsPssiStatTicks](self, "oosTdsPssiStatTicks");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("oosTdsPssiStatTicks"));

}

- (NSString)error
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSNumber)logDuration
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLogDuration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (unsigned)oosInProgress
{
  return self->_oosInProgress;
}

- (void)setOosInProgress:(unsigned __int8)a3
{
  self->_oosInProgress = a3;
}

- (NSNumber)oosTimes
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setOosTimes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSNumber)oosTicks
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setOosTicks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSNumber)pssiTicks
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPssiTicks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSArray)oosLtePssiTimes
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setOosLtePssiTimes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSArray)oosLtePssiStatTicks
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setOosLtePssiStatTicks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSArray)oosGsmPssiTimes
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setOosGsmPssiTimes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSArray)oosGsmPssiStatTicks
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setOosGsmPssiStatTicks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSArray)oosWcdmaPssiTimes
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setOosWcdmaPssiTimes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSArray)oosWcdmaPssiStatTicks
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setOosWcdmaPssiStatTicks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSArray)oosTdsPssiTimes
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setOosTdsPssiTimes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSArray)oosTdsPssiStatTicks
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setOosTdsPssiStatTicks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (unsigned)inited
{
  return self->_inited;
}

- (void)setInited:(unsigned __int8)a3
{
  self->_inited = a3;
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
  objc_storeStrong((id *)&self->_oosTdsPssiStatTicks, 0);
  objc_storeStrong((id *)&self->_oosTdsPssiTimes, 0);
  objc_storeStrong((id *)&self->_oosWcdmaPssiStatTicks, 0);
  objc_storeStrong((id *)&self->_oosWcdmaPssiTimes, 0);
  objc_storeStrong((id *)&self->_oosGsmPssiStatTicks, 0);
  objc_storeStrong((id *)&self->_oosGsmPssiTimes, 0);
  objc_storeStrong((id *)&self->_oosLtePssiStatTicks, 0);
  objc_storeStrong((id *)&self->_oosLtePssiTimes, 0);
  objc_storeStrong((id *)&self->_pssiTicks, 0);
  objc_storeStrong((id *)&self->_oosTicks, 0);
  objc_storeStrong((id *)&self->_oosTimes, 0);
  objc_storeStrong((id *)&self->_logDuration, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
