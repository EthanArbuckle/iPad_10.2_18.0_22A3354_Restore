@implementation PLTestService

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLTestService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLTestService)init
{
  PLTestService *v3;
  PLTestService *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PLTestService;
    v4 = -[PLOperator init](&v14, sel_init);
    if (v4 && objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v5 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __21__PLTestService_init__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v5;
      if (qword_1ED886E60 != -1)
        dispatch_once(&qword_1ED886E60, block);
      if (_MergedGlobals_100)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLTestService initialized"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLTestService.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTestService init]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 32);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v6;
          _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

uint64_t __21__PLTestService_init__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_100 = result;
  return result;
}

- (void)initOperatorDependancies
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = objc_alloc(MEMORY[0x1E0D80098]);
  dispatch_get_global_queue(-32768, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__PLTestService_initOperatorDependancies__block_invoke;
  v6[3] = &unk_1E8577F70;
  v6[4] = self;
  v5 = (void *)objc_msgSend(v3, "initWithWorkQueue:withRegistration:withBlock:", v4, &unk_1E864CD00, v6);
  -[PLTestService setPresubmissionTestResponder:](self, "setPresubmissionTestResponder:", v5);

}

id __41__PLTestService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
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
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v40;
  _QWORD v41[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("testName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("testName"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_opt_new();
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v15 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __41__PLTestService_initOperatorDependancies__block_invoke_2;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v15;
        if (qword_1ED886E68 != -1)
          dispatch_once(&qword_1ED886E68, block);
        if (byte_1ED886E59)
        {
          v40 = v14;
          v16 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("testParam"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("presubmissionTestResponder testName=%@ testParam=%@"), v13, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLTestService.m");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "lastPathComponent");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTestService initOperatorDependancies]_block_invoke");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 43);

          PLLogCommon();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v18;
            _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v14 = v40;
        }
      }
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("DebugServiceForATP")))
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("testParam"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("testParam"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("ENABLE"));

        }
        else
        {
          v26 = 0;
        }

        v30 = (void *)MEMORY[0x1E0D7FFA0];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v26);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKey:saveToDisk:", v31, CFSTR("PLDebugService_Enabled"), 1);

        objc_msgSend(MEMORY[0x1E0D80078], "exitWithReason:", 8);
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("testEPLMode")))
      {
        v28 = *(void **)(a1 + 32);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("testParam"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "presubmissionTest_testEPLMode:withParam:", v14, v29);
        v27 = (id)objc_claimAutoreleasedReturnValue();

LABEL_26:
        goto LABEL_27;
      }
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v32 = objc_opt_class();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __41__PLTestService_initOperatorDependancies__block_invoke_43;
        v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v41[4] = v32;
        if (qword_1ED886E70 != -1)
          dispatch_once(&qword_1ED886E70, v41);
        if (byte_1ED886E5A)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("payload=%@\nresult=%@"), v11, v14);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLTestService.m");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "lastPathComponent");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTestService initOperatorDependancies]_block_invoke_2");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v36, v37, 55);

          PLLogCommon();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v33;
            _os_log_debug_impl(&dword_1CAF47000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      v27 = v14;
      goto LABEL_26;
    }
  }
  v27 = 0;
LABEL_27:

  return v27;
}

uint64_t __41__PLTestService_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886E59 = result;
  return result;
}

uint64_t __41__PLTestService_initOperatorDependancies__block_invoke_43(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886E5A = result;
  return result;
}

- (id)presubmissionTest_testEPLMode:(id)a3 withParam:(id)a4
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  int v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _QWORD v27[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PLTestService_presubmissionTest_testEPLMode_withParam___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (qword_1ED886E78 != -1)
      dispatch_once(&qword_1ED886E78, block);
    if (byte_1ED886E5B)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("presubmissionTest_testEPLMode with param=%@"), v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLTestService.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTestService presubmissionTest_testEPLMode:withParam:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 62);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v9;
        _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v15 = objc_msgSend(MEMORY[0x1E0D7FFA0], "eplEnabled");
  if (v6)
  {
    v16 = v15;
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("ENABLE")))
    {
      v17 = CFSTR("FAIL");
      v18 = CFSTR("PASS");
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("DISABLE")))
        goto LABEL_17;
      v17 = CFSTR("PASS");
      v18 = CFSTR("FAIL");
    }
    if (v16)
      v19 = v18;
    else
      v19 = v17;
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v6);
  }
LABEL_17:
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v27[0] = v8;
    v27[1] = 3221225472;
    v27[2] = __57__PLTestService_presubmissionTest_testEPLMode_withParam___block_invoke_58;
    v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v27[4] = objc_opt_class();
    if (qword_1ED886E80 != -1)
      dispatch_once(&qword_1ED886E80, v27);
    if (byte_1ED886E5C)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("presubmissionTest_testEPLMode with result=%@"), v5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLTestService.m");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastPathComponent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTestService presubmissionTest_testEPLMode:withParam:]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 74);

      PLLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v20;
        _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

  return v5;
}

uint64_t __57__PLTestService_presubmissionTest_testEPLMode_withParam___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886E5B = result;
  return result;
}

uint64_t __57__PLTestService_presubmissionTest_testEPLMode_withParam___block_invoke_58(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886E5C = result;
  return result;
}

- (PLXPCResponderOperatorComposition)presubmissionTestResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPresubmissionTestResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presubmissionTestResponder, 0);
}

@end
