@implementation PLSecureServiceAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSecureServiceAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return &unk_1E864B860;
}

+ (id)entryEventPointDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("ConnectionState");
  +[PLSecureServiceAgent entryEventPointDefinitionConnectionState](PLSecureServiceAgent, "entryEventPointDefinitionConnectionState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("Summary");
  v7[0] = v2;
  +[PLSecureServiceAgent entryEventPointDefinitionSummary](PLSecureServiceAgent, "entryEventPointDefinitionSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)entryEventPointDefinitionConnectionState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[4];
  uint64_t v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18[0] = *MEMORY[0x1E0D80298];
  v16 = *MEMORY[0x1E0D80318];
  v17 = &unk_1E8652B90;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E0D802F0];
  v14[0] = CFSTR("keyId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("UUID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v5;
  v14[2] = CFSTR("EventType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  v14[3] = CFSTR("Confidence");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventPointDefinitionSummary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0D80298];
  v12 = *MEMORY[0x1E0D80318];
  v13 = &unk_1E8652B90;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("ActiveConnections");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("ConnectionCount");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)isSecureServiceSupported
{
  return objc_msgSend(MEMORY[0x1E0D80020], "kPLDeviceClassIsOneOf:", 102030, 102031, 102032, 102034, 102035, 102036, 102037, 102038, 102039, 102040, 102041, 0);
}

- (PLSecureServiceAgent)init
{
  PLSecureServiceAgent *v3;
  PLSecureServiceAgent *v4;
  void *previousHash;
  PLSecureServiceAgent *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (+[PLSecureServiceAgent isSecureServiceSupported](PLSecureServiceAgent, "isSecureServiceSupported"))
  {
    v15.receiver = self;
    v15.super_class = (Class)PLSecureServiceAgent;
    v3 = -[PLAgent init](&v15, sel_init);
    v4 = v3;
    if (v3)
    {
      v3->_numBTConn = 0;
      v3->_periodicReportCount = 0;
      v3->_prevActiveKeys = -1;
      v3->_numEntries = 0;
      v3->_previousEvent = -1;
      previousHash = v3->_previousHash;
      v3->_previousHash = 0;
    }
    else
    {
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_13;
      v7 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __28__PLSecureServiceAgent_init__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (qword_1ED8829F0 != -1)
        dispatch_once(&qword_1ED8829F0, block);
      if (!_MergedGlobals_1_20)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLSecureServiceAgent: failed to init"));
      previousHash = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSecureServiceAgent.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSecureServiceAgent init]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", previousHash, v10, v11, 130);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v17 = previousHash;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
LABEL_13:
    self = v4;
    v6 = self;
    goto LABEL_14;
  }
  v6 = 0;
LABEL_14:

  return v6;
}

uint64_t __28__PLSecureServiceAgent_init__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_20 = result;
  return result;
}

- (void)initOperatorDependancies
{
  double v3;
  double v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PLTimer *v9;
  PLTimer *entriesPerHourTimer;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];

  -[PLOperator defaultDoubleForKey:](self, "defaultDoubleForKey:", CFSTR("EntriesPerHourTimer"));
  v4 = v3;
  v5 = objc_alloc(MEMORY[0x1E0D80070]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator workQueue](self, "workQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke;
  v21[3] = &unk_1E8578078;
  v21[4] = self;
  v9 = (PLTimer *)objc_msgSend(v5, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v6, 1, 0, v7, v21, v4, 0.0);
  entriesPerHourTimer = self->_entriesPerHourTimer;
  self->_entriesPerHourTimer = v9;

  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_60;
  v20[3] = &unk_1E8578610;
  v20[4] = self;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B888, v20);
  -[PLSecureServiceAgent setDaemonLaunchListener:](self, "setDaemonLaunchListener:", v11);

  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_70;
  v19[3] = &unk_1E8578610;
  v19[4] = self;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B8B0, v19);
  -[PLSecureServiceAgent setConnectionListener:](self, "setConnectionListener:", v12);

  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_79;
  v18[3] = &unk_1E8578610;
  v18[4] = self;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B8D8, v18);
  -[PLSecureServiceAgent setDisconnectionListener:](self, "setDisconnectionListener:", v13);

  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_88;
  v17[3] = &unk_1E8578610;
  v17[4] = self;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B900, v17);
  -[PLSecureServiceAgent setDeviceIntentListener:](self, "setDeviceIntentListener:", v14);

  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_97;
  v16[3] = &unk_1E8578610;
  v16[4] = self;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B928, v16);
  -[PLSecureServiceAgent setPeriodicReportListener:](self, "setPeriodicReportListener:", v15);

}

void __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t block;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setNumEntries:", 0);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2;
    v12 = &__block_descriptor_40_e5_v8__0lu32l8;
    v13 = v2;
    if (qword_1ED8829F8 != -1)
      dispatch_once(&qword_1ED8829F8, &block);
    if (byte_1ED8829E1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLSecureServiceAgent:: Timer Credit refreshed %lu"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120), block, v10, v11, v12, v13);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSecureServiceAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSecureServiceAgent initOperatorDependancies]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 141);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v3;
        _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
}

uint64_t __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8829E1 = result;
  return result;
}

void __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_60(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
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
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2_61;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1ED882A00 != -1)
      dispatch_once(&qword_1ED882A00, block);
    if (byte_1ED8829E2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLSecureServiceAgent:: Daemon Launch State =%@ for %@"), v8, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSecureServiceAgent.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSecureServiceAgent initOperatorDependancies]_block_invoke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 145);

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
  objc_msgSend(*(id *)(a1 + 32), "logEventPointConnectionState:withEvent:", v8, 0);

}

uint64_t __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2_61(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8829E2 = result;
  return result;
}

void __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_70(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
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
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2_71;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1ED882A08 != -1)
      dispatch_once(&qword_1ED882A08, block);
    if (byte_1ED8829E3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLSecureServiceAgent:: Connection State=%@ for %@"), v8, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSecureServiceAgent.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSecureServiceAgent initOperatorDependancies]_block_invoke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 150);

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
  objc_msgSend(*(id *)(a1 + 32), "logEventPointConnectionState:withEvent:", v8, 1);

}

uint64_t __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2_71(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8829E3 = result;
  return result;
}

void __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_79(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
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
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2_80;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1ED882A10 != -1)
      dispatch_once(&qword_1ED882A10, block);
    if (byte_1ED8829E4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLSecureServiceAgent:: Disconnection Connection State=%@ for %@"), v8, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSecureServiceAgent.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSecureServiceAgent initOperatorDependancies]_block_invoke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 155);

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
  objc_msgSend(*(id *)(a1 + 32), "logEventPointConnectionState:withEvent:", v8, 2);

}

uint64_t __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2_80(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8829E4 = result;
  return result;
}

void __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_88(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
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
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2_89;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1ED882A18 != -1)
      dispatch_once(&qword_1ED882A18, block);
    if (byte_1ED8829E5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLSecureServiceAgent:: Device Intent State=%@ for %@"), v8, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSecureServiceAgent.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSecureServiceAgent initOperatorDependancies]_block_invoke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 160);

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
  objc_msgSend(*(id *)(a1 + 32), "logEventPointConnectionState:withEvent:", v8, 3);

}

uint64_t __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2_89(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8829E5 = result;
  return result;
}

void __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_97(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
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
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2_98;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1ED882A20 != -1)
      dispatch_once(&qword_1ED882A20, block);
    if (byte_1ED8829E6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLSecureServiceAgent:: Periodic Report State=%@ for %@"), v8, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSecureServiceAgent.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSecureServiceAgent initOperatorDependancies]_block_invoke");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 165);

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
  objc_msgSend(*(id *)(a1 + 32), "logEventPointPeriodicReport:", v8);

}

uint64_t __48__PLSecureServiceAgent_initOperatorDependancies__block_invoke_2_98(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8829E6 = result;
  return result;
}

- (void)logEventPointConnectionState:(id)a3 withEvent:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int64_t v18;
  _BOOL4 v19;
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
  void *v30;
  float v31;
  double v32;
  void *v33;
  _QWORD block[5];
  _QWORD v35[5];
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v9, "hash"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)(a4 - 1) <= 1
      && -[NSString isEqualToString:](self->_previousHash, "isEqualToString:", v10)
      && self->_previousEvent == a4)
    {
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_29;
      v11 = objc_opt_class();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __63__PLSecureServiceAgent_logEventPointConnectionState_withEvent___block_invoke;
      v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v35[4] = v11;
      if (qword_1ED882A28 != -1)
        dispatch_once(&qword_1ED882A28, v35);
      if (!byte_1ED8829E7)
        goto LABEL_29;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLSecureServiceAgent:: Too many connect/disconnects, avoiding duplicates=%@"), v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSecureServiceAgent.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSecureServiceAgent logEventPointConnectionState:withEvent:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 180);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
LABEL_23:

LABEL_29:
        goto LABEL_30;
      }
      *(_DWORD *)buf = 138412290;
      v37 = v12;
LABEL_32:
      _os_log_debug_impl(&dword_1CAF47000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      goto LABEL_23;
    }
    v18 = a4;
    if (a4 != 1)
    {
      if (a4 != 2)
      {
        v19 = a4 == 3;
        if ((unint64_t)(a4 - 1) >= 3)
        {
          -[PLSecureServiceAgent numEntries](self, "numEntries");
          goto LABEL_26;
        }
LABEL_17:
        -[PLSecureServiceAgent setNumEntries:](self, "setNumEntries:", -[PLSecureServiceAgent numEntries](self, "numEntries") + 1);
        if (-[PLSecureServiceAgent numEntries](self, "numEntries") > 10)
        {
          if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
            goto LABEL_29;
          v20 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __63__PLSecureServiceAgent_logEventPointConnectionState_withEvent___block_invoke_109;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v20;
          if (qword_1ED882A30 != -1)
            dispatch_once(&qword_1ED882A30, block);
          if (!byte_1ED8829E8)
            goto LABEL_29;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLSecureServiceAgent:: Too many connect/disconnects=%@"), v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSecureServiceAgent.m");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "lastPathComponent");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLSecureServiceAgent logEventPointConnectionState:withEvent:]");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v23, v24, 212);

          PLLogCommon();
          v17 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            goto LABEL_23;
          *(_DWORD *)buf = 138412290;
          v37 = v12;
          goto LABEL_32;
        }
LABEL_26:
        +[PLOperator entryKeyForType:andName:](PLSecureServiceAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("ConnectionState"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v25);
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v10, CFSTR("keyId"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("EventType"));

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PeerUUID"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, CFSTR("UUID"));

        if (v19)
        {
          v29 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ConfidenceLevel"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "floatValue");
          *(float *)&v32 = v31 * 100.0;
          objc_msgSend(v29, "numberWithFloat:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v33, CFSTR("Confidence"));

        }
        -[PLOperator logEntry:](self, "logEntry:", v26);
        self->_previousEvent = a4;
        objc_storeStrong((id *)&self->_previousHash, v10);

        goto LABEL_29;
      }
      if (-[PLSecureServiceAgent numBTConn](self, "numBTConn") <= 0)
      {
LABEL_16:
        v19 = 0;
        goto LABEL_17;
      }
      v18 = -1;
    }
    -[PLSecureServiceAgent setNumBTConn:](self, "setNumBTConn:", -[PLSecureServiceAgent numBTConn](self, "numBTConn") + v18);
    goto LABEL_16;
  }
LABEL_30:

}

uint64_t __63__PLSecureServiceAgent_logEventPointConnectionState_withEvent___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8829E7 = result;
  return result;
}

uint64_t __63__PLSecureServiceAgent_logEventPointConnectionState_withEvent___block_invoke_109(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8829E8 = result;
  return result;
}

- (void)logEventPointPeriodicReport:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    v13 = v4;
    -[PLSecureServiceAgent setPeriodicReportCount:](self, "setPeriodicReportCount:", -[PLSecureServiceAgent periodicReportCount](self, "periodicReportCount") + 1);
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("NumberOfActiveKeys"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");
    if (v6 == -[PLSecureServiceAgent prevActiveKeys](self, "prevActiveKeys"))
    {
      v7 = -[PLSecureServiceAgent periodicReportCount](self, "periodicReportCount");

      v4 = v13;
      if (v7 >= 4)
        goto LABEL_7;
    }
    else
    {

    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("NumberOfActiveKeys"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSecureServiceAgent setPrevActiveKeys:](self, "setPrevActiveKeys:", objc_msgSend(v8, "integerValue"));

    +[PLOperator entryKeyForType:andName:](PLSecureServiceAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("Summary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v9);
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("NumberOfActiveKeys"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("ActiveConnections"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PLSecureServiceAgent numBTConn](self, "numBTConn"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("ConnectionCount"));

    -[PLOperator logEntry:](self, "logEntry:", v10);
    v4 = v13;
  }
LABEL_7:

}

- (PLXPCListenerOperatorComposition)daemonLaunchListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDaemonLaunchListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLXPCListenerOperatorComposition)connectionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConnectionListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLXPCListenerOperatorComposition)disconnectionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDisconnectionListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLXPCListenerOperatorComposition)deviceIntentListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDeviceIntentListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLXPCListenerOperatorComposition)periodicReportListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPeriodicReportListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLTimer)entriesPerHourTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setEntriesPerHourTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (int64_t)numBTConn
{
  return self->_numBTConn;
}

- (void)setNumBTConn:(int64_t)a3
{
  self->_numBTConn = a3;
}

- (int64_t)periodicReportCount
{
  return self->_periodicReportCount;
}

- (void)setPeriodicReportCount:(int64_t)a3
{
  self->_periodicReportCount = a3;
}

- (int64_t)prevActiveKeys
{
  return self->_prevActiveKeys;
}

- (void)setPrevActiveKeys:(int64_t)a3
{
  self->_prevActiveKeys = a3;
}

- (int64_t)numEntries
{
  return self->_numEntries;
}

- (void)setNumEntries:(int64_t)a3
{
  self->_numEntries = a3;
}

- (int64_t)previousEvent
{
  return self->_previousEvent;
}

- (void)setPreviousEvent:(int64_t)a3
{
  self->_previousEvent = a3;
}

- (NSString)previousHash
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPreviousHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousHash, 0);
  objc_storeStrong((id *)&self->_entriesPerHourTimer, 0);
  objc_storeStrong((id *)&self->_periodicReportListener, 0);
  objc_storeStrong((id *)&self->_deviceIntentListener, 0);
  objc_storeStrong((id *)&self->_disconnectionListener, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_daemonLaunchListener, 0);
}

@end
