@implementation PLMAVBBMetricUtility

+ (id)convertToStringData:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  unsigned __int8 *v8;
  unsigned int v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 2 * v4);
  v6 = objc_retainAutorelease(v3);
  v7 = objc_msgSend(v6, "bytes");
  if (v4)
  {
    v8 = (unsigned __int8 *)v7;
    do
    {
      v9 = *v8++;
      objc_msgSend(v5, "appendFormat:", CFSTR("%02x"), v9);
      --v4;
    }
    while (v4);
  }

  return v5;
}

+ (BOOL)isInvalidMetricIdTag:(id)a3 forClass:(Class)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PLMAVBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED8860D8 != -1)
    dispatch_once(&qword_1ED8860D8, block);
  objc_msgSend((id)qword_1ED8860D0, "objectForKey:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    NSStringFromClass(a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ED8860D0, "objectForKey:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "compare:", v11);

    if (!v12)
    {
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_21;
      v28[0] = v7;
      v28[1] = 3221225472;
      v28[2] = __54__PLMAVBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_62;
      v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v28[4] = objc_opt_class();
      if (qword_1ED8860E8 != -1)
        dispatch_once(&qword_1ED8860E8, v28);
      if (!byte_1ED8860C9)
      {
LABEL_21:
        v21 = 1;
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** invalid metricId tag ***"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBMetricUtility.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLMAVBBMetricUtility isInvalidMetricIdTag:forClass:]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v24, v25, 77);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v15;
        _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      v21 = 1;
      goto LABEL_20;
    }
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v27[0] = v7;
    v27[1] = 3221225472;
    v27[2] = __54__PLMAVBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_67;
    v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v27[4] = objc_opt_class();
    if (qword_1ED8860F0 != -1)
      dispatch_once(&qword_1ED8860F0, v27);
    if (byte_1ED8860CA)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromClass(a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("supported metricId tag: %@ for class: %@"), v6, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBMetricUtility.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLMAVBBMetricUtility isInvalidMetricIdTag:forClass:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 81);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v15;
        _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      v21 = 0;
LABEL_20:

      goto LABEL_22;
    }
  }
  v21 = 0;
LABEL_22:

  return v21;
}

void __54__PLMAVBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke()
{
  uint64_t v0;
  void *v1;
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
  _QWORD v16[40];
  _QWORD v17[41];

  v17[40] = *MEMORY[0x1E0C80C00];
  v16[0] = &unk_1E862EB48;
  v16[1] = &unk_1E862EB60;
  v17[0] = CFSTR("cellularPowerLogProfileTriggerCount");
  v17[1] = CFSTR("CellularPowerLogHistogram");
  v16[2] = &unk_1E862EB78;
  v16[3] = &unk_1E862EB90;
  v17[2] = CFSTR("CellularPowerLogHistogram");
  v17[3] = CFSTR("CellularPowerLogHistogram");
  v16[4] = &unk_1E862EBA8;
  v16[5] = &unk_1E862EBC0;
  v17[4] = CFSTR("CellularPowerLogHistogram");
  v17[5] = CFSTR("CellularPowerLogHistogram");
  v16[6] = &unk_1E862EBD8;
  v16[7] = &unk_1E862EBF0;
  v17[6] = CFSTR("CellularPowerLogHistogram");
  v17[7] = CFSTR("CellularPowerLogHistogram");
  v16[8] = &unk_1E862EC08;
  v16[9] = &unk_1E862EC20;
  v17[8] = CFSTR("CellularPowerLogLTECarrierComponentInfo");
  v17[9] = CFSTR("CellularPowerLogHistogram");
  v16[10] = &unk_1E862EC38;
  v16[11] = &unk_1E862EC50;
  v17[10] = CFSTR("CellularPowerLogHistogram");
  v17[11] = CFSTR("CellularPowerLogHistogram");
  v16[12] = &unk_1E862EC68;
  v16[13] = &unk_1E862EC80;
  v17[12] = CFSTR("CellularPowerLogHistogram");
  v17[13] = CFSTR("CellularPowerLogHistogram");
  v16[14] = &unk_1E862EC98;
  v16[15] = &unk_1E862ECB0;
  v17[14] = CFSTR("CellularPowerLogHistogram");
  v17[15] = CFSTR("CellularPowerLogHistogram");
  v16[16] = &unk_1E862ECC8;
  v16[17] = &unk_1E862ECE0;
  v17[16] = CFSTR("CellularPowerLogHistogram");
  v17[17] = CFSTR("CellularPowerLogHistogram");
  v16[18] = &unk_1E862ECF8;
  v16[19] = &unk_1E862ED10;
  v17[18] = CFSTR("CellularPowerLogHistogram");
  v17[19] = CFSTR("CellularPowerLogHistogram");
  v16[20] = &unk_1E862ED28;
  v16[21] = &unk_1E862ED40;
  v17[20] = CFSTR("CellularPowerLogHistogram");
  v17[21] = CFSTR("CellularPowerLogHistogram");
  v16[22] = &unk_1E862ED58;
  v16[23] = &unk_1E862ED70;
  v17[22] = CFSTR("CellularPowerLogHistogram");
  v17[23] = CFSTR("CellularPowerLogHistogram");
  v16[24] = &unk_1E862ED88;
  v16[25] = &unk_1E862EDA0;
  v17[24] = CFSTR("CellularPowerLogNRCarrierComponentInfo");
  v17[25] = CFSTR("CellularPowerLogHistogram");
  v16[26] = &unk_1E862EDB8;
  v16[27] = &unk_1E862EDD0;
  v17[26] = CFSTR("CellularPowerLogHistogram");
  v17[27] = CFSTR("CellularPowerLogHistogram");
  v16[28] = &unk_1E862EDE8;
  v16[29] = &unk_1E862EE00;
  v17[28] = CFSTR("CellularPowerLogHistogram");
  v17[29] = CFSTR("CellularPowerLogHistogram");
  v16[30] = &unk_1E862EE18;
  v16[31] = &unk_1E862EE30;
  v17[30] = CFSTR("CellularPowerLogHistogram");
  v17[31] = CFSTR("CellularPowerLogHistogram");
  v16[32] = &unk_1E862EE48;
  v16[33] = &unk_1E862EE60;
  v17[32] = CFSTR("CellularPowerLogHistogram");
  v17[33] = CFSTR("CellularPowerLogHistogram");
  v16[34] = &unk_1E862EE78;
  v16[35] = &unk_1E862EE90;
  v17[34] = CFSTR("CellularPowerLogHistogram");
  v17[35] = CFSTR("CellularPowerLogNRCarrierComponentInfo");
  v16[36] = &unk_1E862EEA8;
  v16[37] = &unk_1E862EEC0;
  v17[36] = CFSTR("CellularPowerLogHistogram");
  v17[37] = CFSTR("CellularPowerLogHistogram");
  v16[38] = &unk_1E862EED8;
  v16[39] = &unk_1E862EEF0;
  v17[38] = CFSTR("CellularPowerLogHistogram");
  v17[39] = CFSTR("CellularPowerLogHistogram");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 40);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED8860D0;
  qword_1ED8860D0 = v0;

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __54__PLMAVBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_54;
    v12 = &__block_descriptor_40_e5_v8__0lu32l8;
    v13 = v2;
    if (qword_1ED8860E0 != -1)
      dispatch_once(&qword_1ED8860E0, &block);
    if (_MergedGlobals_77)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), qword_1ED8860D0, block, v10, v11, v12, v13);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KMAV/PLMAVBBMetricUtility.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLMAVBBMetricUtility isInvalidMetricIdTag:forClass:]_block_invoke_2");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 73);

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

uint64_t __54__PLMAVBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_54(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_77 = result;
  return result;
}

uint64_t __54__PLMAVBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_62(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8860C9 = result;
  return result;
}

uint64_t __54__PLMAVBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_67(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8860CA = result;
  return result;
}

@end
