@implementation PLIPSecAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLIPSecAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("IPSecWake");
  objc_msgSend(a1, "entryEventPointDefinitionIPSecWake");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventPointDefinitionIPSecWake
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
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1E8652960;
  v20[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("wakeUUID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("PID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat_withProcessName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("seqNo");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("spi");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)initIPSecKEvent
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uintptr_t ipsecSocket;
  NSObject *v34;
  dispatch_source_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint8_t *v43;
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD handler[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD block[5];
  int v50;
  _QWORD v51[5];
  uint8_t v52[4];
  void *v53;
  _BYTE buf[24];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  self->_ipsecSocket = -1;
  v3 = socket(32, 3, 1);
  self->_ipsecSocket = v3;
  if (v3 == -1)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v12 = objc_opt_class();
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __31__PLIPSecAgent_initIPSecKEvent__block_invoke;
      v51[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v51[4] = v12;
      if (qword_1ED886748 != -1)
        dispatch_once(&qword_1ED886748, v51);
      if (_MergedGlobals_82)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("socket(PF_SYSTEM, SOCK_RAW, SYSPROTO_EVENT) error"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIPSecAgent initIPSecKEvent]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 72);

        PLLogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v13;
          v43 = buf;
          goto LABEL_40;
        }
LABEL_14:

      }
    }
  }
  else
  {
    v50 = 1;
    if (ioctl(v3, 0x8004667EuLL, &v50))
    {
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_22;
      v4 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __31__PLIPSecAgent_initIPSecKEvent__block_invoke_27;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (qword_1ED886750 != -1)
        dispatch_once(&qword_1ED886750, block);
      if (!byte_1ED886739)
        goto LABEL_22;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ioctl(FIONBIO) error"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIPSecAgent initIPSecKEvent]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 79);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
LABEL_21:

LABEL_22:
        close(self->_ipsecSocket);
        return;
      }
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v5;
      v11 = buf;
LABEL_42:
      _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", v11, 0xCu);
      goto LABEL_21;
    }
    *(_QWORD *)buf = 0x100000001;
    *(_DWORD *)&buf[8] = 13;
    v19 = ioctl(self->_ipsecSocket, 0x800C6502uLL, buf);
    v20 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
    if (v19)
    {
      if (!v20)
        goto LABEL_22;
      v21 = objc_opt_class();
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __31__PLIPSecAgent_initIPSecKEvent__block_invoke_32;
      v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v48[4] = v21;
      if (qword_1ED886758 != -1)
        dispatch_once(&qword_1ED886758, v48);
      if (!byte_1ED88673A)
        goto LABEL_22;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ioctl(SIOCSKEVFILT) error"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIPSecAgent initIPSecKEvent]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v24, v25, 89);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        goto LABEL_21;
      *(_DWORD *)v52 = 138412290;
      v53 = v5;
      v11 = v52;
      goto LABEL_42;
    }
    if (v20)
    {
      v26 = objc_opt_class();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __31__PLIPSecAgent_initIPSecKEvent__block_invoke_37;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v26;
      if (qword_1ED886760 != -1)
        dispatch_once(&qword_1ED886760, v47);
      if (byte_1ED88673B)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ipsec socket number %d"), self->_ipsecSocket);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "lastPathComponent");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIPSecAgent initIPSecKEvent]");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 95);

        PLLogCommon();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v52 = 138412290;
          v53 = v27;
          _os_log_debug_impl(&dword_1CAF47000, v32, OS_LOG_TYPE_DEBUG, "%@", v52, 0xCu);
        }

      }
    }
    ipsecSocket = self->_ipsecSocket;
    -[PLOperator workQueue](self, "workQueue");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = dispatch_source_create(MEMORY[0x1E0C80DB8], ipsecSocket, 0, v34);
    v36 = (void *)qword_1ED886768;
    qword_1ED886768 = (uint64_t)v35;

    if (qword_1ED886768)
    {
      v37 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __31__PLIPSecAgent_initIPSecKEvent__block_invoke_40;
      handler[3] = &unk_1E85780C8;
      handler[4] = self;
      dispatch_source_set_cancel_handler((dispatch_source_t)qword_1ED886768, handler);
      v45[0] = v37;
      v45[1] = 3221225472;
      v45[2] = __31__PLIPSecAgent_initIPSecKEvent__block_invoke_43;
      v45[3] = &unk_1E85780C8;
      v45[4] = self;
      dispatch_source_set_event_handler((dispatch_source_t)qword_1ED886768, v45);
      dispatch_resume((dispatch_object_t)qword_1ED886768);
      return;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v38 = objc_opt_class();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __31__PLIPSecAgent_initIPSecKEvent__block_invoke_49;
      v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v44[4] = v38;
      if (qword_1ED886780 != -1)
        dispatch_once(&qword_1ED886780, v44);
      if (byte_1ED88673E)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ipsecsrc is invalid"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "lastPathComponent");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIPSecAgent initIPSecKEvent]");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v41, v42, 110);

        PLLogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v52 = 138412290;
          v53 = v13;
          v43 = v52;
LABEL_40:
          _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", v43, 0xCu);
          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
  }
}

uint64_t __31__PLIPSecAgent_initIPSecKEvent__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_82 = result;
  return result;
}

uint64_t __31__PLIPSecAgent_initIPSecKEvent__block_invoke_27(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886739 = result;
  return result;
}

uint64_t __31__PLIPSecAgent_initIPSecKEvent__block_invoke_32(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88673A = result;
  return result;
}

uint64_t __31__PLIPSecAgent_initIPSecKEvent__block_invoke_37(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88673B = result;
  return result;
}

uint64_t __31__PLIPSecAgent_initIPSecKEvent__block_invoke_40(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__PLIPSecAgent_initIPSecKEvent__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (qword_1ED886770 != -1)
      dispatch_once(&qword_1ED886770, block);
    if (byte_1ED88673C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ipsec cancel event!!!!"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIPSecAgent initIPSecKEvent]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 101);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v3;
        _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  return close(objc_msgSend(*(id *)(a1 + 32), "ipsecSocket"));
}

uint64_t __31__PLIPSecAgent_initIPSecKEvent__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88673C = result;
  return result;
}

uint64_t __31__PLIPSecAgent_initIPSecKEvent__block_invoke_43(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__PLIPSecAgent_initIPSecKEvent__block_invoke_2_44;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (qword_1ED886778 != -1)
      dispatch_once(&qword_1ED886778, block);
    if (byte_1ED88673D)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("got ipsec event!!!!"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIPSecAgent initIPSecKEvent]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 105);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v3;
        _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "logEventPointIPSecWake");
}

uint64_t __31__PLIPSecAgent_initIPSecKEvent__block_invoke_2_44(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88673D = result;
  return result;
}

uint64_t __31__PLIPSecAgent_initIPSecKEvent__block_invoke_49(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88673E = result;
  return result;
}

- (void)logEventPointIPSecWake
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
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
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  PLIPSecAgent *v76;
  uint64_t v77;
  _QWORD v78[5];
  _QWORD v79[5];
  _QWORD v80[5];
  _QWORD v81[5];
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D80018], "handleIPSecEvent:", self->_ipsecSocket);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__PLIPSecAgent_logEventPointIPSecWake__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (qword_1ED886788 != -1)
      dispatch_once(&qword_1ED886788, block);
    if (byte_1ED88673F)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("packet dictionary %@"), v3);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIPSecAgent logEventPointIPSecWake]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 124);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v84 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("headerInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0D80018];
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("headerInfo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "decodeIPPacket:encryptedPath:", v13, 1);
      v14 = objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        +[PLOperator entryKeyForType:andName:](PLIPSecAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("IPSecWake"));
        v77 = objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v77);
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("wakeUUID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v16, CFSTR("wakeUUID"));

        v17 = 0x1E0CB3000uLL;
        v18 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("seqNo"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "numberWithUnsignedInt:", objc_msgSend(v19, "unsignedIntValue"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v20, CFSTR("seqNo"));

        v21 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("spi"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "numberWithUnsignedInt:", objc_msgSend(v22, "unsignedIntValue"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v23, CFSTR("spi"));

        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v24 = objc_opt_class();
          v79[0] = MEMORY[0x1E0C809B0];
          v79[1] = 3221225472;
          v79[2] = __38__PLIPSecAgent_logEventPointIPSecWake__block_invoke_72;
          v79[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v79[4] = v24;
          if (qword_1ED8867A0 != -1)
            dispatch_once(&qword_1ED8867A0, v79);
          if (byte_1ED886742)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Dictionary for IPSec : %@"), v14);
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "lastPathComponent");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIPSecAgent logEventPointIPSecWake]");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 148);

            PLLogCommon();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v84 = v25;
              _os_log_debug_impl(&dword_1CAF47000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v17 = 0x1E0CB3000;
          }
        }
        v76 = self;
        -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("destination"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v31, CFSTR("ip_destination"));

        -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("source"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v32, CFSTR("ip_source"));

        -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("protocol"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v33, CFSTR("ip_protocol"));

        -[NSObject objectForKey:](v14, "objectForKey:", CFSTR("protocol"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          v35 = (void *)MEMORY[0x1E0CB3940];
          -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("protocol_info"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("dest_port"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringWithFormat:", CFSTR("%@"), v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v38, CFSTR("dest_port"));

          v39 = (void *)MEMORY[0x1E0CB3940];
          -[NSObject objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("protocol_info"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("source_port"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "stringWithFormat:", CFSTR("%@"), v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v42, CFSTR("source_port"));

          v17 = 0x1E0CB3000uLL;
        }
        v43 = *(void **)(v17 + 2024);
        -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("dest_port"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "numberWithInteger:", objc_msgSend(v44, "integerValue"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        v46 = *(void **)(v17 + 2024);
        -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("source_port"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "numberWithInteger:", objc_msgSend(v47, "integerValue"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        +[PLProcessPortMap sharedInstance](PLProcessPortMap, "sharedInstance");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("ip_destination"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("ip_source"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", CFSTR("ip_protocol"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "pidAndProcessNameForDestAddress:withDestPort:withSourceAddress:withSourcePort:withProtocol:", v50, v45, v51, v48, v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v54 = objc_opt_class();
          v78[0] = MEMORY[0x1E0C809B0];
          v78[1] = 3221225472;
          v78[2] = __38__PLIPSecAgent_logEventPointIPSecWake__block_invoke_98;
          v78[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v78[4] = v54;
          if (qword_1ED8867A8 != -1)
            dispatch_once(&qword_1ED8867A8, v78);
          if (byte_1ED886743)
          {
            v75 = v14;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" pidAndProcessName=%@"), v53);
            v55 = objc_claimAutoreleasedReturnValue();
            v56 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "lastPathComponent");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v55;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIPSecAgent logEventPointIPSecWake]");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "logMessage:fromFile:fromFunction:fromLineNumber:", v59, v58, v60, 163);

            PLLogCommon();
            v61 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v84 = v59;
              _os_log_debug_impl(&dword_1CAF47000, v61, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v14 = v75;
          }
        }
        if (v53)
        {
          objc_msgSend(v53, "pid");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v62, CFSTR("PID"));

          objc_msgSend(v53, "processName");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v63, CFSTR("ProcessName"));

        }
        -[PLOperator logEntry:](v76, "logEntry:", v15);

        v64 = v77;
      }
      else
      {
        if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          goto LABEL_44;
        v70 = objc_opt_class();
        v80[0] = MEMORY[0x1E0C809B0];
        v80[1] = 3221225472;
        v80[2] = __38__PLIPSecAgent_logEventPointIPSecWake__block_invoke_64;
        v80[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v80[4] = v70;
        if (qword_1ED886798 != -1)
          dispatch_once(&qword_1ED886798, v80);
        if (!byte_1ED886741)
        {
LABEL_44:
          v14 = 0;
          goto LABEL_45;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("decodedPacket is empty"));
        v64 = objc_claimAutoreleasedReturnValue();
        v71 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "lastPathComponent");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIPSecAgent logEventPointIPSecWake]");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "logMessage:fromFile:fromFunction:fromLineNumber:", v64, v73, v74, 137);

        PLLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v84 = v64;
          _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }

LABEL_31:
LABEL_45:

      goto LABEL_46;
    }
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v65 = objc_opt_class();
      v81[0] = MEMORY[0x1E0C809B0];
      v81[1] = 3221225472;
      v81[2] = __38__PLIPSecAgent_logEventPointIPSecWake__block_invoke_59;
      v81[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v81[4] = v65;
      if (qword_1ED886790 != -1)
        dispatch_once(&qword_1ED886790, v81);
      if (byte_1ED886740)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("headerInfo not present"));
        v14 = objc_claimAutoreleasedReturnValue();
        v66 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLIPSecAgent.m");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "lastPathComponent");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLIPSecAgent logEventPointIPSecWake]");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v68, v69, 130);

        PLLogCommon();
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v84 = v14;
          _os_log_debug_impl(&dword_1CAF47000, v64, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        goto LABEL_31;
      }
    }
  }
LABEL_46:

}

uint64_t __38__PLIPSecAgent_logEventPointIPSecWake__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88673F = result;
  return result;
}

uint64_t __38__PLIPSecAgent_logEventPointIPSecWake__block_invoke_59(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886740 = result;
  return result;
}

uint64_t __38__PLIPSecAgent_logEventPointIPSecWake__block_invoke_64(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886741 = result;
  return result;
}

uint64_t __38__PLIPSecAgent_logEventPointIPSecWake__block_invoke_72(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886742 = result;
  return result;
}

uint64_t __38__PLIPSecAgent_logEventPointIPSecWake__block_invoke_98(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886743 = result;
  return result;
}

- (int)ipsecSocket
{
  return self->_ipsecSocket;
}

- (void)setIpsecSocket:(int)a3
{
  self->_ipsecSocket = a3;
}

@end
