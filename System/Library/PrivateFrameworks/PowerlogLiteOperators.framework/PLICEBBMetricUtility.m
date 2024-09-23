@implementation PLICEBBMetricUtility

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
  block[2] = __54__PLICEBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED886F88 != -1)
    dispatch_once(&qword_1ED886F88, block);
  objc_msgSend((id)qword_1ED886F80, "objectForKey:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    NSStringFromClass(a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ED886F80, "objectForKey:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "compare:", v11);

    if (!v12)
    {
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_21;
      v28[0] = v7;
      v28[1] = 3221225472;
      v28[2] = __54__PLICEBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_77;
      v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v28[4] = objc_opt_class();
      if (qword_1ED886F98 != -1)
        dispatch_once(&qword_1ED886F98, v28);
      if (!byte_1ED886F79)
      {
LABEL_21:
        v21 = 1;
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** invalid metricId tag ***"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBMetricUtility.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLICEBBMetricUtility isInvalidMetricIdTag:forClass:]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v24, v25, 74);

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
    v27[2] = __54__PLICEBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_82;
    v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v27[4] = objc_opt_class();
    if (qword_1ED886FA0 != -1)
      dispatch_once(&qword_1ED886FA0, v27);
    if (byte_1ED886F7A)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromClass(a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("supported metricId tag: %@ for class: %@"), v6, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBMetricUtility.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLICEBBMetricUtility isInvalidMetricIdTag:forClass:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 78);

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

void __54__PLICEBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke()
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
  _QWORD v16[39];
  _QWORD v17[40];

  v17[39] = *MEMORY[0x1E0C80C00];
  v16[0] = &unk_1E8634260;
  v16[1] = &unk_1E8634278;
  v17[0] = CFSTR("KCellularPerClientProfileTriggerCount");
  v17[1] = CFSTR("KCellularProtocolStackHist");
  v16[2] = &unk_1E8634290;
  v16[3] = &unk_1E86342A8;
  v17[2] = CFSTR("KCellularPeripheralStats");
  v17[3] = CFSTR("KCellularProtocolStackHist");
  v16[4] = &unk_1E86342C0;
  v16[5] = &unk_1E86342D8;
  v17[4] = CFSTR("KCellularProtocolStackHist");
  v17[5] = CFSTR("KCellularProtocolStackHist");
  v16[6] = &unk_1E86342F0;
  v16[7] = &unk_1E8634308;
  v17[6] = CFSTR("KCellularProtocolStackHist");
  v17[7] = CFSTR("KCellularLteFwDuplexMode");
  v16[8] = &unk_1E8634320;
  v16[9] = &unk_1E8634338;
  v17[8] = CFSTR("KCellularRrcModeHist");
  v17[9] = CFSTR("KCellularRrcModeHist");
  v16[10] = &unk_1E8634350;
  v16[11] = &unk_1E8634368;
  v17[10] = CFSTR("KCellularRrcModeHist");
  v17[11] = CFSTR("KCellularProtocolStackHist");
  v16[12] = &unk_1E8634380;
  v16[13] = &unk_1E8634398;
  v17[12] = CFSTR("KCellularProtocolStackHist");
  v17[13] = CFSTR("KCellularProtocolStackHist");
  v16[14] = &unk_1E86343B0;
  v16[15] = &unk_1E86343C8;
  v17[14] = CFSTR("KCellularProtocolStackHist");
  v17[15] = CFSTR("KCellularLteComponentCarrierInfo");
  v16[16] = &unk_1E86343E0;
  v16[17] = &unk_1E86343F8;
  v17[16] = CFSTR("KCellularProtocolStackHist");
  v17[17] = CFSTR("KCellularProtocolStackHist");
  v16[18] = &unk_1E8634410;
  v16[19] = &unk_1E8634428;
  v17[18] = CFSTR("KCellularProtocolStackHist");
  v17[19] = CFSTR("KCellularProtocolStackHist");
  v16[20] = &unk_1E8634440;
  v16[21] = &unk_1E8634458;
  v17[20] = CFSTR("KCellularLteCdrxConfig");
  v17[21] = CFSTR("kCellularLteRadioLinkFailure");
  v16[22] = &unk_1E8634470;
  v16[23] = &unk_1E8634488;
  v17[22] = CFSTR("KCellularProtocolStackHist");
  v17[23] = CFSTR("KCellularCellPlmnSearchCount");
  v16[24] = &unk_1E86344A0;
  v16[25] = &unk_1E86344B8;
  v17[24] = CFSTR("KCellularProtocolStackHist");
  v17[25] = CFSTR("KCellularProtocolStackPowerState");
  v16[26] = &unk_1E86344D0;
  v16[27] = &unk_1E86344E8;
  v17[26] = CFSTR("KCellularServingCellLost");
  v17[27] = CFSTR("KCellularWcdmaCpcStat");
  v16[28] = &unk_1E8634500;
  v16[29] = &unk_1E8634518;
  v17[28] = CFSTR("KCellularRrcModeHist");
  v17[29] = CFSTR("KCellularRrcModeHist");
  v16[30] = &unk_1E8634530;
  v16[31] = &unk_1E8634548;
  v17[30] = CFSTR("KCellularRrcModeHist");
  v17[31] = CFSTR("KCellularRrcModeHist");
  v16[32] = &unk_1E8634560;
  v16[33] = &unk_1E8634578;
  v17[32] = CFSTR("KCellularRrcModeHist");
  v17[33] = CFSTR("KCellularProtocolStackHist");
  v16[34] = &unk_1E8634590;
  v16[35] = &unk_1E86345A8;
  v17[34] = CFSTR("KCellularProtocolStackHist");
  v17[35] = CFSTR("KCellularProtocolStackHist");
  v16[36] = &unk_1E86345C0;
  v16[37] = &unk_1E86345D8;
  v17[36] = CFSTR("KCellularProtocolStackHist");
  v17[37] = CFSTR("KCellularProtocolStackHist");
  v16[38] = &unk_1E86345F0;
  v17[38] = CFSTR("KCellularProtocolStackHist");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 39);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED886F80;
  qword_1ED886F80 = v0;

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __54__PLICEBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_69;
    v12 = &__block_descriptor_40_e5_v8__0lu32l8;
    v13 = v2;
    if (qword_1ED886F90 != -1)
      dispatch_once(&qword_1ED886F90, &block);
    if (_MergedGlobals_106)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), qword_1ED886F80, block, v10, v11, v12, v13);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBMetricUtility.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLICEBBMetricUtility isInvalidMetricIdTag:forClass:]_block_invoke_2");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 70);

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

uint64_t __54__PLICEBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_69(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_106 = result;
  return result;
}

uint64_t __54__PLICEBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_77(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886F79 = result;
  return result;
}

uint64_t __54__PLICEBBMetricUtility_isInvalidMetricIdTag_forClass___block_invoke_82(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886F7A = result;
  return result;
}

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

@end
