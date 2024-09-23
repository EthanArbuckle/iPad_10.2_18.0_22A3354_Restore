@implementation PLBBMsgAll

- (void)setISeqNum:(id)a3
{
  objc_storeStrong((id *)&self->_iseqNum, a3);
}

+ (id)entryEventNoneBBMsgAll
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[2];
  _QWORD v23[4];

  v23[2] = *MEMORY[0x1E0C80C00];
  v22[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802A8];
  v20[0] = *MEMORY[0x1E0D80318];
  v20[1] = v2;
  v3 = *MEMORY[0x1E0D802F8];
  v20[2] = *MEMORY[0x1E0D802B8];
  v20[3] = v3;
  v21[0] = &unk_1E86529C0;
  v21[1] = MEMORY[0x1E0C9AAA0];
  v21[2] = MEMORY[0x1E0C9AAA0];
  v21[3] = CFSTR("refreshRequestHandler");
  v20[4] = *MEMORY[0x1E0D80308];
  v21[4] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E0D802F0];
  v18[0] = CFSTR("Payload");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_StringFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v18[1] = CFSTR("Error");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v5;
  v18[2] = CFSTR("Type");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v7;
  v18[3] = CFSTR("SeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v9;
  v18[4] = CFSTR("BBDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "commonTypeDict_DateFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)refreshBBMsgAll
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t block;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D179C2E0](self, a2);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __29__PLBBMsgAll_refreshBBMsgAll__block_invoke;
    v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    v14 = v3;
    if (qword_1ED882580 != -1)
      dispatch_once(&qword_1ED882580, &block);
    if (_MergedGlobals_1_10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMsgAll refreshBBMsgAll]", block, v11, v12, v13, v14);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgAll.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMsgAll refreshBBMsgAll]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 58);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __29__PLBBMsgAll_refreshBBMsgAll__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_10 = result;
  return result;
}

- (void)logEventNoneBBMsgAll
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t block;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __34__PLBBMsgAll_logEventNoneBBMsgAll__block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    v17 = v3;
    if (qword_1ED882588 != -1)
      dispatch_once(&qword_1ED882588, &block);
    if (byte_1ED882579)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMsgAll logEventNoneBBMsgAll]", block, v14, v15, v16, v17);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgAll.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMsgAll logEventNoneBBMsgAll]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 65);

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
  v10 = *MEMORY[0x1E0D80388];
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("BBMsgAll"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
  -[PLBBMsgAll sendAndLogPLEntry:withName:withType:](self, "sendAndLogPLEntry:withName:withType:", v12, CFSTR("BBMsgAll"), v10);

}

uint64_t __34__PLBBMsgAll_logEventNoneBBMsgAll__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED882579 = result;
  return result;
}

- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__PLBBMsgAll_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED882590 != -1)
      dispatch_once(&qword_1ED882590, block);
    if (byte_1ED88257A)
    {
      v37 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBMsgAll sendAndLogPLEntry:withName:withType:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgAll.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMsgAll sendAndLogPLEntry:withName:withType:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 81);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v13;
        _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v9 = v37;
      v12 = MEMORY[0x1E0C809B0];
    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v38[0] = v12;
    v38[1] = 3221225472;
    v38[2] = __50__PLBBMsgAll_sendAndLogPLEntry_withName_withType___block_invoke_25;
    v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v38[4] = objc_opt_class();
    if (qword_1ED882598 != -1)
      dispatch_once(&qword_1ED882598, v38);
    if (byte_1ED88257B)
    {
      v19 = v10;
      v36 = v10;
      v20 = v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sending PLEntry: name=%@ type=%@"), v9, v36);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBMsgAll.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBMsgAll sendAndLogPLEntry:withName:withType:]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 82);

      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v21;
        _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v9 = v20;
      v10 = v19;
    }
  }
  -[PLBBMsgAll payload](self, "payload");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, CFSTR("Payload"));

  -[PLBBMsgRoot msgType](self, "msgType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v28, CFSTR("Type"));

  -[PLBBMsgAll seqNum](self, "seqNum");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v29, CFSTR("SeqNum"));

  -[PLBBMsgAll bbDate](self, "bbDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v30, CFSTR("BBDate"));

  -[PLBBMsgAll error](self, "error");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, CFSTR("Error"));

  -[PLBBMsgAll bbDate](self, "bbDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[PLBBMsgAll bbDate](self, "bbDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "convertFromBasebandToMonotonic");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEntryDate:", v34);

  }
  -[PLBBMsgRoot agent](self, "agent");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "logEntry:", v8);

}

uint64_t __50__PLBBMsgAll_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88257A = result;
  return result;
}

uint64_t __50__PLBBMsgAll_sendAndLogPLEntry_withName_withType___block_invoke_25(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88257B = result;
  return result;
}

- (NSNumber)seqNum
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSeqNum:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDate)bbDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBbDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)payload
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPayload:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)error
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableDictionary)info
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSNumber)iseqNum
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setIseqNum:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSDate)ibbDate
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setIbbDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)ieventCode
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setIeventCode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSString)ipayload
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setIpayload:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSString)ierror
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setIerror:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ierror, 0);
  objc_storeStrong((id *)&self->_ipayload, 0);
  objc_storeStrong((id *)&self->_ieventCode, 0);
  objc_storeStrong((id *)&self->_ibbDate, 0);
  objc_storeStrong((id *)&self->_iseqNum, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_bbDate, 0);
  objc_storeStrong((id *)&self->_seqNum, 0);
}

@end
