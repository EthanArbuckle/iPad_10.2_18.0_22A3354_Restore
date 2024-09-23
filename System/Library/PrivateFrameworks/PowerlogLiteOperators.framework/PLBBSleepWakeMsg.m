@implementation PLBBSleepWakeMsg

- (void)sendAndLogPLEntry:(id)a3 withName:(id)a4 withType:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
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
  void *v25;
  NSObject *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D7FFA0];
  v11 = a3;
  if (objc_msgSend(v10, "debugEnabled"))
  {
    v12 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__PLBBSleepWakeMsg_sendAndLogPLEntry_withName_withType___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v12;
    if (qword_1ED8827E8 != -1)
      dispatch_once(&qword_1ED8827E8, block);
    if (_MergedGlobals_1_16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Sending PLEntry: name=%@ type=%@"), "-[PLBBSleepWakeMsg sendAndLogPLEntry:withName:withType:]", v8, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBSleepWakeMsg.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBSleepWakeMsg sendAndLogPLEntry:withName:withType:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 42);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v13;
        _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBMsgRoot agent](self, "agent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19 && objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v20 = objc_opt_class();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __56__PLBBSleepWakeMsg_sendAndLogPLEntry_withName_withType___block_invoke_14;
    v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v28[4] = v20;
    if (qword_1ED8827F0 != -1)
      dispatch_once(&qword_1ED8827F0, v28);
    if (byte_1ED8827E1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bad agent"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBSleepWakeMsg.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBSleepWakeMsg sendAndLogPLEntry:withName:withType:]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 45);

      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v21;
        _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLBBMsgRoot agent](self, "agent");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "logEntry:", v11);

}

uint64_t __56__PLBBSleepWakeMsg_sendAndLogPLEntry_withName_withType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_16 = result;
  return result;
}

uint64_t __56__PLBBSleepWakeMsg_sendAndLogPLEntry_withName_withType___block_invoke_14(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8827E1 = result;
  return result;
}

+ (id)entryEventPointDefinitionSleepWakeActivityMavABM
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v27;
  void *v28;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[20];
  _QWORD v48[20];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[4];

  v52[2] = *MEMORY[0x1E0C80C00];
  v51[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v49[0] = *MEMORY[0x1E0D80318];
  v49[1] = v2;
  v50[0] = &unk_1E8652A80;
  v50[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v46;
  v51[1] = *MEMORY[0x1E0D802F0];
  v47[0] = CFSTR("WakeChannel");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v44;
  v47[1] = CFSTR("WakeData");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commonTypeDict_StringFormat");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v42;
  v47[2] = CFSTR("WakeDataParsed");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_StringFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v40;
  v47[3] = CFSTR("WakeSubType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v38;
  v47[4] = CFSTR("WakeType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v36;
  v47[5] = CFSTR("QmiSvcType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v34;
  v47[6] = CFSTR("QmiClientId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v48[6] = v32;
  v47[7] = CFSTR("QmiMsgId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v48[7] = v30;
  v47[8] = CFSTR("QmiLen");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48[8] = v28;
  v47[9] = CFSTR("IpVer");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v48[9] = v26;
  v47[10] = CFSTR("IpProto");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v48[10] = v24;
  v47[11] = CFSTR("IpSrc");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_StringFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v48[11] = v22;
  v47[12] = CFSTR("IpDst");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_StringFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v48[12] = v20;
  v47[13] = CFSTR("IpSrcPort");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v48[13] = v18;
  v47[14] = CFSTR("IpDstPort");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48[14] = v16;
  v47[15] = CFSTR("PID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48[15] = v14;
  v47[16] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat_withProcessName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v48[16] = v4;
  v47[17] = CFSTR("IsCmas");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v48[17] = v6;
  v47[18] = CFSTR("spi");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v48[18] = v8;
  v47[19] = CFSTR("seqNo");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v48[19] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventPointDefinitionSleepWakeActivityIceABM
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v27;
  void *v28;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[21];
  _QWORD v50[21];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[4];

  v54[2] = *MEMORY[0x1E0C80C00];
  v53[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v51[0] = *MEMORY[0x1E0D80318];
  v51[1] = v2;
  v52[0] = &unk_1E8652A90;
  v52[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v48;
  v53[1] = *MEMORY[0x1E0D802F0];
  v49[0] = CFSTR("WakeChannel");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v46;
  v49[1] = CFSTR("WakeData");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "commonTypeDict_StringFormat");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v44;
  v49[2] = CFSTR("WakeDataParsed");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commonTypeDict_StringFormat");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v42;
  v49[3] = CFSTR("WakeSubType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v40;
  v49[4] = CFSTR("WakeType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50[4] = v38;
  v49[5] = CFSTR("AriGroupID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v50[5] = v36;
  v49[6] = CFSTR("AriMsgID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v50[6] = v34;
  v49[7] = CFSTR("AriLength");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v50[7] = v32;
  v49[8] = CFSTR("AriMsgName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_StringFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v50[8] = v30;
  v49[9] = CFSTR("AriSeqNum");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v50[9] = v28;
  v49[10] = CFSTR("IpVer");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v50[10] = v26;
  v49[11] = CFSTR("IpProto");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v50[11] = v24;
  v49[12] = CFSTR("IpSrc");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_StringFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v50[12] = v22;
  v49[13] = CFSTR("IpDst");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_StringFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v50[13] = v20;
  v49[14] = CFSTR("IpSrcPort");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v50[14] = v18;
  v49[15] = CFSTR("IpDstPort");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v50[15] = v16;
  v49[16] = CFSTR("PID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v50[16] = v14;
  v49[17] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat_withProcessName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v50[17] = v4;
  v49[18] = CFSTR("IsCmas");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50[18] = v6;
  v49[19] = CFSTR("spi");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50[19] = v8;
  v49[20] = CFSTR("seqNo");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v50[20] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)refreshSleepWakeActivity
{
  objc_autoreleasePoolPop((void *)MEMORY[0x1D179C2E0](self, a2));
}

- (void)logEventPointSleepWakeABM
{
  NSObject *v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __objc2_class **v20;
  NSObject *v21;
  char *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  unint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  NSObject *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  int v45;
  NSObject *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  int v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  int v74;
  void *v75;
  int v76;
  void *v77;
  void *v78;
  void *v79;
  int v80;
  const __CFString *v81;
  void *v82;
  int v83;
  void *v84;
  void *v85;
  int v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  char *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  void *v111;
  int v112;
  NSDictionary *bbWakeDataParsed;
  void *v114;
  int v115;
  void *v116;
  int v117;
  void *v118;
  int v119;
  void *v120;
  int v121;
  void *v122;
  int v123;
  void *v124;
  int v125;
  void *v126;
  int v127;
  void *v128;
  int v129;
  void *v130;
  int v131;
  void *v132;
  int v133;
  uint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  void *v139;
  _QWORD v140[5];
  _QWORD block[5];
  uint8_t buf[4];
  const char *v143;
  uint64_t v144;

  v144 = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v143 = "-[PLBBSleepWakeMsg logEventPointSleepWakeABM]";
    _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PLBBSleepWakeMsg_logEventPointSleepWakeABM__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (qword_1ED8827F8 != -1)
      dispatch_once(&qword_1ED8827F8, block);
    if (byte_1ED8827E2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLBBSleepWakeMsg logEventPointSleepWakeABM]");
      v5 = (char *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBSleepWakeMsg.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBSleepWakeMsg logEventPointSleepWakeABM]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 243);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v143 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v11 = objc_msgSend(MEMORY[0x1E0D80020], "isBasebandIce");
  v12 = (uint64_t *)MEMORY[0x1E0D80390];
  if ((v11 & 1) != 0 || objc_msgSend(MEMORY[0x1E0D80020], "isBasebandIBIS"))
  {
    v13 = *v12;
    v14 = CFSTR("SleepWakeActivityIceABM");
  }
  else
  {
    v13 = *v12;
    v14 = CFSTR("SleepWakeActivityMavABM");
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v15);
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[PLBBSleepWakeMsg bbWakeChannel](self, "bbWakeChannel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithInt:", objc_msgSend(v18, "intValue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("WakeChannel"));

    if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandIce") & 1) != 0)
    {
      v20 = &off_1E8575C50;
    }
    else
    {
      if (!objc_msgSend(MEMORY[0x1E0D80020], "isBasebandMav"))
        goto LABEL_25;
      v20 = off_1E8575CC0;
    }
    -[__objc2_class convertToStringData:](*v20, "convertToStringData:", self->_bbWakeDataBin);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v28, CFSTR("WakeData"));

LABEL_25:
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
    {
      -[PLBBSleepWakeMsg bbWakeDataParsed](self, "bbWakeDataParsed");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v29, CFSTR("WakeDataParsed"));

    }
    -[PLBBSleepWakeMsg bbWakeType](self, "bbWakeType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("DATA"));

    v32 = 0x1ED87D000uLL;
    if (v31)
    {
      PLLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CAF47000, v33, OS_LOG_TYPE_DEBUG, "BB Agent: Wake Type - Data", buf, 2u);
      }

      objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E86322B0, CFSTR("WakeType"));
      v34 = (void *)MEMORY[0x1E0D80018];
      -[PLBBSleepWakeMsg bbWakeDataBin](self, "bbWakeDataBin");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "decodeIPPacket:encryptedPath:", v35, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "objectForKey:", CFSTR("protocol_info"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBSleepWakeMsg bbWakeSubType](self, "bbWakeSubType");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("IP"));

      if (!v39)
      {
        objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E8632310, CFSTR("WakeSubType"));
LABEL_77:

        v32 = 0x1ED87D000;
        goto LABEL_101;
      }
      PLLogCommon();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        bbWakeDataParsed = self->_bbWakeDataParsed;
        *(_DWORD *)buf = 138412290;
        v143 = (const char *)bbWakeDataParsed;
        _os_log_debug_impl(&dword_1CAF47000, v40, OS_LOG_TYPE_DEBUG, "BB Agent: Wake Sub Type - IP Wake %@", buf, 0xCu);
      }

      objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E86322C8, CFSTR("WakeSubType"));
      -[NSDictionary objectForKeyedSubscript:](self->_bbWakeDataParsed, "objectForKeyedSubscript:", CFSTR("kKeyIPVersion"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("IPv4"));

      if ((v42 & 1) != 0)
      {
        v43 = &unk_1E86322E0;
      }
      else
      {
        -[NSDictionary objectForKeyedSubscript:](self->_bbWakeDataParsed, "objectForKeyedSubscript:", CFSTR("kKeyIPVersion"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "isEqualToString:", CFSTR("IPv6"));

        if (v61)
          v43 = &unk_1E86322F8;
        else
          v43 = &unk_1E8632310;
      }
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v43, CFSTR("IpVer"));
      -[NSDictionary objectForKeyedSubscript:](self->_bbWakeDataParsed, "objectForKeyedSubscript:", CFSTR("kKeyIPProtocol"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "isEqualToString:", CFSTR("TCP"));

      v138 = v13;
      v139 = v15;
      v137 = v37;
      if (v63)
      {
        v64 = &unk_1E8632328;
      }
      else
      {
        -[NSDictionary objectForKeyedSubscript:](self->_bbWakeDataParsed, "objectForKeyedSubscript:", CFSTR("kKeyIPProtocol"));
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v75, "isEqualToString:", CFSTR("UDP"));

        if (!v76)
        {
          -[NSDictionary objectForKeyedSubscript:](self->_bbWakeDataParsed, "objectForKeyedSubscript:", CFSTR("kKeyIPProtocol"));
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = objc_msgSend(v82, "isEqualToString:", CFSTR("ICMP"));

          if (v83)
            v84 = &unk_1E8632340;
          else
            v84 = &unk_1E8632310;
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v84, CFSTR("IpProto"));
          goto LABEL_67;
        }
        v64 = &unk_1E86322B0;
      }
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v64, CFSTR("IpProto"));
      objc_msgSend(v37, "objectForKey:", CFSTR("source_port"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v77, CFSTR("IpSrcPort"));

      objc_msgSend(v37, "objectForKey:", CFSTR("dest_port"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v78, CFSTR("IpDstPort"));

LABEL_67:
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("source"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v87, CFSTR("IpSrc"));

      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("destination"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v88, CFSTR("IpDst"));

      v89 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("seqNo"));
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "numberWithUnsignedInt:", objc_msgSend(v90, "unsignedIntValue"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v91, CFSTR("seqNo"));

      v92 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("spi"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "numberWithUnsignedInt:", objc_msgSend(v93, "unsignedIntValue"));
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v94, CFSTR("spi"));

      -[NSDictionary objectForKeyedSubscript:](self->_bbWakeDataParsed, "objectForKeyedSubscript:", CFSTR("kKeyIPProtocol"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLProcessPortMap sharedInstance](PLProcessPortMap, "sharedInstance");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("destination"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("IpDstPort"));
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("source"));
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("IpSrcPort"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:", v97, v98, v99, v100, v95);
      v101 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v138;
      v15 = v139;
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v102 = objc_opt_class();
        v140[0] = MEMORY[0x1E0C809B0];
        v140[1] = 3221225472;
        v140[2] = __45__PLBBSleepWakeMsg_logEventPointSleepWakeABM__block_invoke_128;
        v140[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v140[4] = v102;
        if (qword_1ED882800 != -1)
          dispatch_once(&qword_1ED882800, v140);
        if (byte_1ED8827E3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pidAndProcessName=%@"), v101);
          v103 = (char *)objc_claimAutoreleasedReturnValue();
          v104 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBSleepWakeMsg.m");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "lastPathComponent");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBSleepWakeMsg logEventPointSleepWakeABM]");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "logMessage:fromFile:fromFunction:fromLineNumber:", v103, v106, v107, 352);

          PLLogCommon();
          v108 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v143 = v103;
            _os_log_debug_impl(&dword_1CAF47000, v108, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v13 = v138;
          v15 = v139;
        }
      }
      if (v101)
      {
        objc_msgSend(v101, "pid");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v109, CFSTR("PID"));

        objc_msgSend(v101, "processName");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v110, CFSTR("ProcessName"));

      }
      objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, CFSTR("WakeData"));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, CFSTR("WakeDataParsed"));

      v37 = v137;
      goto LABEL_77;
    }
    -[PLBBSleepWakeMsg bbWakeType](self, "bbWakeType");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("CONTROL"));

    if (v45)
    {
      PLLogCommon();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CAF47000, v46, OS_LOG_TYPE_DEBUG, "BB Agent: Wake Type - Control", buf, 2u);
      }

      objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E8632358, CFSTR("WakeType"));
      -[PLBBSleepWakeMsg bbWakeSubType](self, "bbWakeSubType");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("ARI"));

      if (v48)
      {
        objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E8632328, CFSTR("WakeSubType"));
        -[NSDictionary objectForKeyedSubscript:](self->_bbWakeDataParsed, "objectForKeyedSubscript:", CFSTR("kKeyARIGroupID"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v49, CFSTR("AriGroupID"));

        -[NSDictionary objectForKeyedSubscript:](self->_bbWakeDataParsed, "objectForKeyedSubscript:", CFSTR("kKeyARIMsgID"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v50, CFSTR("AriMsgID"));

        -[NSDictionary objectForKeyedSubscript:](self->_bbWakeDataParsed, "objectForKeyedSubscript:", CFSTR("kKeyARILength"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v51, CFSTR("AriLength"));

        -[NSDictionary objectForKeyedSubscript:](self->_bbWakeDataParsed, "objectForKeyedSubscript:", CFSTR("kKeyARIMsgName"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v52, CFSTR("AriMsgName"));

        -[NSDictionary objectForKeyedSubscript:](self->_bbWakeDataParsed, "objectForKeyedSubscript:", CFSTR("kKeyARISeqNumber"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = CFSTR("AriSeqNum");
LABEL_51:
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v53, v54);

LABEL_101:
        v134 = *(int *)(v32 + 1540);
        objc_msgSend(*(id *)((char *)&self->super.super.isa + v134), "objectForKeyedSubscript:", CFSTR("kKeyBasebandWakeFromCMAS"));
        v135 = (void *)objc_claimAutoreleasedReturnValue();

        if (v135)
        {
          objc_msgSend(*(id *)((char *)&self->super.super.isa + v134), "objectForKeyedSubscript:", CFSTR("kKeyBasebandWakeFromCMAS"));
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v136, CFSTR("IsCmas"));

        }
        else
        {
          objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("IsCmas"));
        }
        -[PLBBSleepWakeMsg sendAndLogPLEntry:withName:withType:](self, "sendAndLogPLEntry:withName:withType:", v16, CFSTR("SleepWakeActivityABM"), v13);
        goto LABEL_105;
      }
      -[PLBBSleepWakeMsg bbWakeSubType](self, "bbWakeSubType");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "isEqualToString:", CFSTR("QMI"));

      if (v66)
      {
        objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E8632358, CFSTR("WakeSubType"));
        -[NSDictionary objectForKeyedSubscript:](self->_bbWakeDataParsed, "objectForKeyedSubscript:", CFSTR("kKeyQMIServiceType"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v67, CFSTR("QmiSvcType"));

        -[NSDictionary objectForKeyedSubscript:](self->_bbWakeDataParsed, "objectForKeyedSubscript:", CFSTR("kKeyQMIClientID"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v68, CFSTR("QmiClientId"));

        -[NSDictionary objectForKeyedSubscript:](self->_bbWakeDataParsed, "objectForKeyedSubscript:", CFSTR("kKeyQMIMsgID"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v69, CFSTR("QmiMsgId"));

        -[NSDictionary objectForKeyedSubscript:](self->_bbWakeDataParsed, "objectForKeyedSubscript:", CFSTR("kKeyQMIMsgType"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v70, CFSTR("QmiMsgType"));

        -[NSDictionary objectForKeyedSubscript:](self->_bbWakeDataParsed, "objectForKeyedSubscript:", CFSTR("kKeyQMILength"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = CFSTR("QmiLen");
        goto LABEL_51;
      }
      goto LABEL_98;
    }
    -[PLBBSleepWakeMsg bbWakeType](self, "bbWakeType");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "isEqualToString:", CFSTR("TRACE"));

    if (v56)
    {
      objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E8632328, CFSTR("WakeType"));
      -[PLBBSleepWakeMsg bbWakeSubType](self, "bbWakeSubType");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v57, "isEqualToString:", CFSTR("DIAG"));

      if (v58)
        goto LABEL_43;
      -[PLBBSleepWakeMsg bbWakeSubType](self, "bbWakeSubType");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v79, "isEqualToString:", CFSTR("STT"));

      if (v80)
        goto LABEL_59;
    }
    else
    {
      -[PLBBSleepWakeMsg bbWakeType](self, "bbWakeType");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "isEqualToString:", CFSTR("OTHER"));

      if (!v72)
      {
        v59 = &unk_1E8632310;
        v81 = CFSTR("WakeType");
LABEL_100:
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v59, v81);
        goto LABEL_101;
      }
      objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E8632340, CFSTR("WakeType"));
      -[PLBBSleepWakeMsg bbWakeSubType](self, "bbWakeSubType");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v73, "isEqualToString:", CFSTR("QMI"));

      if (v74)
      {
        v59 = &unk_1E8632358;
        goto LABEL_99;
      }
      -[PLBBSleepWakeMsg bbWakeSubType](self, "bbWakeSubType");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v85, "isEqualToString:", CFSTR("ARI"));

      if (v86)
      {
        v59 = &unk_1E8632328;
        goto LABEL_99;
      }
      -[PLBBSleepWakeMsg bbWakeSubType](self, "bbWakeSubType");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = objc_msgSend(v111, "isEqualToString:", CFSTR("CMAS"));

      if (v112)
      {
        v59 = &unk_1E86322B0;
        goto LABEL_99;
      }
      -[PLBBSleepWakeMsg bbWakeSubType](self, "bbWakeSubType");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = objc_msgSend(v114, "isEqualToString:", CFSTR("PAGING"));

      if (v115)
      {
        v59 = &unk_1E8632340;
        goto LABEL_99;
      }
      -[PLBBSleepWakeMsg bbWakeSubType](self, "bbWakeSubType");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = objc_msgSend(v116, "isEqualToString:", CFSTR("SERIAL"));

      if (v117)
      {
        v59 = &unk_1E86322E0;
        goto LABEL_99;
      }
      -[PLBBSleepWakeMsg bbWakeSubType](self, "bbWakeSubType");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = objc_msgSend(v118, "isEqualToString:", CFSTR("HSIC"));

      if (v119)
      {
        v59 = &unk_1E86323A0;
        goto LABEL_99;
      }
      -[PLBBSleepWakeMsg bbWakeSubType](self, "bbWakeSubType");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = objc_msgSend(v120, "isEqualToString:", CFSTR("PCI"));

      if (v121)
      {
        v59 = &unk_1E86322F8;
        goto LABEL_99;
      }
      -[PLBBSleepWakeMsg bbWakeSubType](self, "bbWakeSubType");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = objc_msgSend(v122, "isEqualToString:", CFSTR("DIAG"));

      if (v123)
      {
LABEL_43:
        v59 = &unk_1E8632370;
LABEL_99:
        v81 = CFSTR("WakeSubType");
        goto LABEL_100;
      }
      -[PLBBSleepWakeMsg bbWakeSubType](self, "bbWakeSubType");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = objc_msgSend(v124, "isEqualToString:", CFSTR("STT"));

      if (v125)
      {
LABEL_59:
        v59 = &unk_1E8632388;
        goto LABEL_99;
      }
      -[PLBBSleepWakeMsg bbWakeSubType](self, "bbWakeSubType");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = objc_msgSend(v126, "isEqualToString:", CFSTR("UART"));

      if (v127)
      {
        v59 = &unk_1E86323B8;
        goto LABEL_99;
      }
      -[PLBBSleepWakeMsg bbWakeSubType](self, "bbWakeSubType");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = objc_msgSend(v128, "isEqualToString:", CFSTR("QMAP"));

      if (v129)
      {
        v59 = &unk_1E86323D0;
        goto LABEL_99;
      }
      -[PLBBSleepWakeMsg bbWakeSubType](self, "bbWakeSubType");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = objc_msgSend(v130, "isEqualToString:", CFSTR("ADAM"));

      if (v131)
      {
        v59 = &unk_1E86323E8;
        goto LABEL_99;
      }
      -[PLBBSleepWakeMsg bbWakeSubType](self, "bbWakeSubType");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = objc_msgSend(v132, "isEqualToString:", CFSTR("IP"));

      if (v133)
      {
        v59 = &unk_1E86322C8;
        goto LABEL_99;
      }
    }
LABEL_98:
    v59 = &unk_1E8632310;
    goto LABEL_99;
  }
  PLLogCommon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CAF47000, v21, OS_LOG_TYPE_DEBUG, "BB Agent: Unable to allocate wake entry", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** Error *** unable to allocate PLEntry"));
  v22 = (char *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/PLBBSleepWakeMsg.m");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "lastPathComponent");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBBSleepWakeMsg logEventPointSleepWakeABM]");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 265);

  PLLogCommon();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v143 = v22;
    _os_log_debug_impl(&dword_1CAF47000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

LABEL_105:
}

uint64_t __45__PLBBSleepWakeMsg_logEventPointSleepWakeABM__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8827E2 = result;
  return result;
}

uint64_t __45__PLBBSleepWakeMsg_logEventPointSleepWakeABM__block_invoke_128(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8827E3 = result;
  return result;
}

- (NSString)swReason
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSwReason:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)bbWakeChannel
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBbWakeChannel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)bbWakeType
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBbWakeType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)bbWakeSubType
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBbWakeSubType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSData)bbWakeDataBin
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setBbWakeDataBin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSDictionary)bbWakeDataParsed
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setBbWakeDataParsed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)qmiSvcType
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setQmiSvcType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)qmiClntId
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setQmiClntId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSString)qmiMsgId
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setQmiMsgId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSString)qmiMsgType
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setQmiMsgType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSString)qmiLen
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setQmiLen:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSString)ariGroupId
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAriGroupId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSString)ariMsgId
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAriMsgId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSString)ariMsgName
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAriMsgName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSString)ariLen
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAriLen:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSString)ariSeqNum
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setAriSeqNum:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSString)swAtCmd
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setSwAtCmd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSString)swRawData
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setSwRawData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSNumber)swSvcId
{
  return (NSNumber *)objc_getProperty(self, a2, 216, 1);
}

- (void)setSwSvcId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSString)swClientId
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSwClientId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSString)swMsgId
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setSwMsgId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSString)swMsgType
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setSwMsgType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSString)swCmdName
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setSwCmdName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSString)swCmdFullName
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setSwCmdFullName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSDictionary)swIpData
{
  return (NSDictionary *)objc_getProperty(self, a2, 264, 1);
}

- (void)setSwIpData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (NSString)swRadioClass
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setSwRadioClass:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSString)swCTData
{
  return (NSString *)objc_getProperty(self, a2, 280, 1);
}

- (void)setSwCTData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSString)swChan
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (void)setSwChan:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (NSString)swCmd
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setSwCmd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 296);
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
  objc_storeStrong((id *)&self->_swCmd, 0);
  objc_storeStrong((id *)&self->_swChan, 0);
  objc_storeStrong((id *)&self->_swCTData, 0);
  objc_storeStrong((id *)&self->_swRadioClass, 0);
  objc_storeStrong((id *)&self->_swIpData, 0);
  objc_storeStrong((id *)&self->_swCmdFullName, 0);
  objc_storeStrong((id *)&self->_swCmdName, 0);
  objc_storeStrong((id *)&self->_swMsgType, 0);
  objc_storeStrong((id *)&self->_swMsgId, 0);
  objc_storeStrong((id *)&self->_swClientId, 0);
  objc_storeStrong((id *)&self->_swSvcId, 0);
  objc_storeStrong((id *)&self->_swRawData, 0);
  objc_storeStrong((id *)&self->_swAtCmd, 0);
  objc_storeStrong((id *)&self->_ariSeqNum, 0);
  objc_storeStrong((id *)&self->_ariLen, 0);
  objc_storeStrong((id *)&self->_ariMsgName, 0);
  objc_storeStrong((id *)&self->_ariMsgId, 0);
  objc_storeStrong((id *)&self->_ariGroupId, 0);
  objc_storeStrong((id *)&self->_qmiLen, 0);
  objc_storeStrong((id *)&self->_qmiMsgType, 0);
  objc_storeStrong((id *)&self->_qmiMsgId, 0);
  objc_storeStrong((id *)&self->_qmiClntId, 0);
  objc_storeStrong((id *)&self->_qmiSvcType, 0);
  objc_storeStrong((id *)&self->_bbWakeDataParsed, 0);
  objc_storeStrong((id *)&self->_bbWakeDataBin, 0);
  objc_storeStrong((id *)&self->_bbWakeSubType, 0);
  objc_storeStrong((id *)&self->_bbWakeType, 0);
  objc_storeStrong((id *)&self->_bbWakeChannel, 0);
  objc_storeStrong((id *)&self->_swReason, 0);
}

@end
