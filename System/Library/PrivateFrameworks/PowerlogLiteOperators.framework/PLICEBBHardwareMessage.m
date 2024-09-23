@implementation PLICEBBHardwareMessage

- (PLICEBBHardwareMessage)init
{
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    __assert_rtn("-[PLICEBBHardwareMessage init]", "PLICEBBHardwareMessage.m", 88, "0");

  return 0;
}

- (id)initEntryWithBBTS:(id)a3 triggerId:(id)a4 seqnum:(id)a5 payload:(id)a6 logAgent:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PLICEBBHardwareMessage *v17;
  void *v18;
  uint64_t v19;
  NSDate *bbMonotonic;
  uint64_t v21;
  NSString *metricData;
  uint64_t v23;
  NSMutableArray *metricIdArr;
  uint64_t v25;
  NSMutableArray *metricDataArr;
  id v28;
  objc_super v29;

  v13 = a3;
  v28 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)PLICEBBHardwareMessage;
  v17 = -[PLICEBBHardwareMessage init](&v29, sel_init);
  if (v17)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", (double)(objc_msgSend(v13, "integerValue") / 1000));
    objc_msgSend(v18, "convertFromBasebandToMonotonic");
    v19 = objc_claimAutoreleasedReturnValue();
    bbMonotonic = v17->_bbMonotonic;
    v17->_bbMonotonic = (NSDate *)v19;

    objc_storeStrong((id *)&v17->_triggerId, a4);
    objc_storeStrong((id *)&v17->_bbtimestamp, a3);
    objc_storeStrong((id *)&v17->_triggerCnt, a5);
    +[PLICEBBMetricUtility convertToStringData:](PLICEBBMetricUtility, "convertToStringData:", v15);
    v21 = objc_claimAutoreleasedReturnValue();
    metricData = v17->_metricData;
    v17->_metricData = (NSString *)v21;

    v23 = objc_opt_new();
    metricIdArr = v17->_metricIdArr;
    v17->_metricIdArr = (NSMutableArray *)v23;

    v25 = objc_opt_new();
    metricDataArr = v17->_metricDataArr;
    v17->_metricDataArr = (NSMutableArray *)v25;

    objc_storeStrong((id *)&v17->_logAgent, a7);
  }

  return v17;
}

+ (id)entryEventBackwardDefinitionBBIcePeriodicMetrics
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[2];
  uint64_t v21;
  _QWORD v22[3];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[4];

  v28[2] = *MEMORY[0x1E0C80C00];
  v27[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80308];
  v25[0] = *MEMORY[0x1E0D80318];
  v25[1] = v2;
  v26[0] = &unk_1E86536E0;
  v26[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v17;
  v27[1] = *MEMORY[0x1E0D802F0];
  v23[0] = CFSTR("triggerId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  v23[1] = CFSTR("triggerCnt");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v3;
  v23[2] = CFSTR("bbtimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v5;
  v23[3] = CFSTR("mid");
  v7 = *MEMORY[0x1E0D80348];
  v20[0] = *MEMORY[0x1E0D80358];
  v6 = v20[0];
  v20[1] = v7;
  v22[0] = &unk_1E8634A70;
  v22[1] = &unk_1E8634A88;
  v21 = *MEMORY[0x1E0D80350];
  v8 = v21;
  v22[2] = &unk_1E8634AA0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v20, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v9;
  v23[4] = CFSTR("data");
  v18[0] = v6;
  v18[1] = v7;
  v19[0] = &unk_1E8634A70;
  v19[1] = &unk_1E8634A88;
  v18[2] = v8;
  v19[2] = &unk_1E8634AB8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitionBBIceEventMetrics
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
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80308];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E86536F0;
  v18[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("triggerCnt");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("bbtimestamp");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("metricId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("metricData");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_StringFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)logBBIceAperiodicMetrics
{
  NSObject *v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t block;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[PLICEBBHardwareMessage logBBIceAperiodicMetrics]";
    _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __50__PLICEBBHardwareMessage_logBBIceAperiodicMetrics__block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    v17 = v4;
    if (qword_1ED887028 != -1)
      dispatch_once(&qword_1ED887028, &block);
    if (_MergedGlobals_108)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLICEBBHardwareMessage logBBIceAperiodicMetrics]", block, v14, v15, v16, v17);
      v5 = (char *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLICEBBHardwareMessage logBBIceAperiodicMetrics]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 193);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("BBIceEventMetrics"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v11);
  if (v12)
  {
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003009) & 1) == 0)
      objc_msgSend(v12, "setEntryDate:", self->_bbMonotonic);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", self->_bbtimestamp, CFSTR("bbtimestamp"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", self->_triggerCnt, CFSTR("triggerCnt"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", self->_triggerId, CFSTR("metricId"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", self->_metricData, CFSTR("metricData"));
    -[PLAgent logEntry:](self->_logAgent, "logEntry:", v12);
  }

}

uint64_t __50__PLICEBBHardwareMessage_logBBIceAperiodicMetrics__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_108 = result;
  return result;
}

- (void)logBBIcePeriodicMetrics
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __49__PLICEBBHardwareMessage_logBBIcePeriodicMetrics__block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v3;
    if (qword_1ED887030 != -1)
      dispatch_once(&qword_1ED887030, &block);
    if (byte_1ED887019)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLICEBBHardwareMessage logBBIcePeriodicMetrics]", block, v13, v14, v15, v16);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLICEBBHardwareMessage logBBIcePeriodicMetrics]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 214);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v4;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("BBIcePeriodicMetrics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  if (v11)
  {
    if ((objc_msgSend(MEMORY[0x1E0D80020], "isBasebandClass:", 1003009) & 1) == 0)
      objc_msgSend(v11, "setEntryDate:", self->_bbMonotonic);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", self->_triggerId, CFSTR("triggerId"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", self->_bbtimestamp, CFSTR("bbtimestamp"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", self->_triggerCnt, CFSTR("triggerCnt"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", self->_metricIdArr, CFSTR("mid"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", self->_metricDataArr, CFSTR("data"));
    -[PLAgent logEntry:](self->_logAgent, "logEntry:", v11);
  }

}

uint64_t __49__PLICEBBHardwareMessage_logBBIcePeriodicMetrics__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887019 = result;
  return result;
}

- (void)addToListMetric:(id)a3 payload:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSMutableArray *metricDataArr;
  void *v17;
  uint64_t block;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0D7FFA0];
  v8 = a4;
  if (objc_msgSend(v7, "debugEnabled"))
  {
    v9 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __50__PLICEBBHardwareMessage_addToListMetric_payload___block_invoke;
    v21 = &__block_descriptor_40_e5_v8__0lu32l8;
    v22 = v9;
    if (qword_1ED887038 != -1)
      dispatch_once(&qword_1ED887038, &block);
    if (byte_1ED88701A)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[PLICEBBHardwareMessage addToListMetric:payload:]", block, v19, v20, v21, v22);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLICEBBHardwareMessage addToListMetric:payload:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 236);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v10;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[NSMutableArray addObject:](self->_metricIdArr, "addObject:", v6);
  metricDataArr = self->_metricDataArr;
  +[PLICEBBMetricUtility convertToStringData:](PLICEBBMetricUtility, "convertToStringData:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](metricDataArr, "addObject:", v17);
}

uint64_t __50__PLICEBBHardwareMessage_addToListMetric_payload___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88701A = result;
  return result;
}

- (id)decodeEventPayload:(id)a3 forMetricId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  __objc2_class *v10;
  KCellularServingCellLost *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("metricId"));
  v8 = objc_msgSend(v6, "integerValue");
  v9 = 0;
  if (v8 <= 3985681)
  {
    if (v8 <= 3952151)
    {
      if (v8 == 3945603)
        goto LABEL_19;
      if (v8 != 3952132)
      {
        if (v8 != 3952138)
          goto LABEL_39;
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          __assert_rtn("-[PLICEBBHardwareMessage decodeEventPayload:forMetricId:]", "PLICEBBHardwareMessage.m", 261, "0");
LABEL_38:
        v9 = v7;
        goto LABEL_39;
      }
      v10 = KCellularLteRrcState;
    }
    else
    {
      if (v8 <= 3973390)
      {
        if (v8 == 3952152)
        {
          v10 = KCellularLteCdrxConfig;
          goto LABEL_35;
        }
        if (v8 != 3952165)
          goto LABEL_39;
LABEL_19:
        v10 = KCellularLteRadioLinkFailure;
        goto LABEL_35;
      }
      if (v8 == 3973391)
      {
        v11 = -[KCellularServingCellLost initWithData:]([KCellularServingCellLost alloc], "initWithData:", v5);
        if (!-[KCellularServingCellLost hasTimestamp](v11, "hasTimestamp"))
          goto LABEL_37;
        goto LABEL_36;
      }
      if (v8 != 3985416)
        goto LABEL_39;
      v10 = KCellularGsmL1State;
    }
LABEL_35:
    v11 = (KCellularServingCellLost *)objc_msgSend([v10 alloc], "initWithData:", v5);
    if (!-[KCellularServingCellLost hasTimestamp](v11, "hasTimestamp"))
    {
LABEL_37:
      objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("event"), CFSTR("type"));

      goto LABEL_38;
    }
LABEL_36:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[KCellularServingCellLost timestamp](v11, "timestamp"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("bbtimestamp"));

    goto LABEL_37;
  }
  if (v8 > 3985947)
  {
    if (v8 > 3986693)
    {
      if (v8 == 3986694)
      {
        v10 = KCellularCellPlmnSearchCount;
      }
      else
      {
        if (v8 != 3986696)
          goto LABEL_39;
        v10 = KCellularProtocolStackPowerState;
      }
    }
    else if (v8 == 3985948)
    {
      v10 = KCellularTdsL1State;
    }
    else
    {
      if (v8 != 3986196)
        goto LABEL_39;
      v10 = KCellularLteDataInactivityBeforeIdle;
    }
    goto LABEL_35;
  }
  switch(v8)
  {
    case 3985682:
      v10 = KCellularWcdmaRrcConnectionState;
      goto LABEL_35;
    case 3985683:
      v10 = KCellularWcdmaRrcConfiguration;
      goto LABEL_35;
    case 3985684:
      v10 = KCellularWcdmaRabStatus;
      goto LABEL_35;
    case 3985685:
      v10 = KCellularWcdmaL1State;
      goto LABEL_35;
    case 3985686:
      goto LABEL_19;
    default:
      break;
  }
LABEL_39:

  return v9;
}

- (id)decodePayload:(id)a3 forMetricId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PowerlogMetricLog *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v82;
  void *v83;
  void *v84;
  _QWORD block[5];
  _QWORD v86[5];
  _QWORD v87[5];
  _QWORD v88[5];
  _QWORD v89[5];
  _QWORD v90[5];
  _QWORD v91[5];
  _QWORD v92[5];
  _QWORD v93[5];
  _QWORD v94[5];
  uint8_t buf[4];
  void *v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("metricId"));
  v9 = -[PowerlogMetricLog initWithData:]([PowerlogMetricLog alloc], "initWithData:", v6);
  if (-[PowerlogMetricLog kCellularPerClientProfileTriggerCountsCount](v9, "kCellularPerClientProfileTriggerCountsCount") >= 2)objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v10 = objc_msgSend(v7, "integerValue");
  if (v10 <= 3986178)
  {
    if (v10 > 3985669)
    {
      switch(v10)
      {
        case 3985670:
          -[PowerlogMetricLog kCellularWcdmaCpcStatAtIndex:](v9, "kCellularWcdmaCpcStatAtIndex:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLICEBBHardwareMessage cpcStatsForClass:forEntry:](self, "cpcStatsForClass:forEntry:", v12, v8);
          goto LABEL_139;
        case 3985671:
          -[PowerlogMetricLog kCellularWcdmaRxDiversityHistAtIndex:](v9, "kCellularWcdmaRxDiversityHistAtIndex:", 0);
          v34 = objc_claimAutoreleasedReturnValue();
          goto LABEL_131;
        case 3985672:
          -[PowerlogMetricLog kCellularWcdmaServingCellRx0RssiHistAtIndex:](v9, "kCellularWcdmaServingCellRx0RssiHistAtIndex:", 0);
          v34 = objc_claimAutoreleasedReturnValue();
          goto LABEL_131;
        case 3985673:
          -[PowerlogMetricLog kCellularWcdmaServingCellRx1RssiHistAtIndex:](v9, "kCellularWcdmaServingCellRx1RssiHistAtIndex:", 0);
          v34 = objc_claimAutoreleasedReturnValue();
          goto LABEL_131;
        case 3985674:
          -[PowerlogMetricLog kCellularWcdmaServingCellRx0EcNoHistAtIndex:](v9, "kCellularWcdmaServingCellRx0EcNoHistAtIndex:", 0);
          v34 = objc_claimAutoreleasedReturnValue();
          goto LABEL_131;
        case 3985675:
          -[PowerlogMetricLog kCellularWcdmaServingCellRx1EcNoHistAtIndex:](v9, "kCellularWcdmaServingCellRx1EcNoHistAtIndex:", 0);
          v34 = objc_claimAutoreleasedReturnValue();
          goto LABEL_131;
        case 3985676:
          -[PowerlogMetricLog kCellularWcdmaTxPowerHistAtIndex:](v9, "kCellularWcdmaTxPowerHistAtIndex:", 0);
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_138;
        case 3985677:
          -[PowerlogMetricLog kCellularWcdmaReceiverStatusOnC0HistAtIndex:](v9, "kCellularWcdmaReceiverStatusOnC0HistAtIndex:", 0);
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_138;
        case 3985678:
          -[PowerlogMetricLog kCellularWcdmaReceiverStatusOnC1HistAtIndex:](v9, "kCellularWcdmaReceiverStatusOnC1HistAtIndex:", 0);
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_138;
        case 3985679:
          -[PowerlogMetricLog kCellularWcdmaCarrierStatusHistAtIndex:](v9, "kCellularWcdmaCarrierStatusHistAtIndex:", 0);
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_138;
        case 3985680:
          -[PowerlogMetricLog kCellularWcdmaRabModeHistAtIndex:](v9, "kCellularWcdmaRabModeHistAtIndex:", 0);
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_138;
        case 3985681:
          -[PowerlogMetricLog kCellularWcdmaRabTypeHistAtIndex:](v9, "kCellularWcdmaRabTypeHistAtIndex:", 0);
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_138;
        default:
          switch(v10)
          {
            case 3985926:
              -[PowerlogMetricLog kCellularTdsRxDiversityHistAtIndex:](v9, "kCellularTdsRxDiversityHistAtIndex:", 0);
              v34 = objc_claimAutoreleasedReturnValue();
              goto LABEL_131;
            case 3985927:
              -[PowerlogMetricLog kCellularTdsServingCellRx0RssiHistAtIndex:](v9, "kCellularTdsServingCellRx0RssiHistAtIndex:", 0);
              v34 = objc_claimAutoreleasedReturnValue();
              goto LABEL_131;
            case 3985928:
              -[PowerlogMetricLog kCellularTdsServingCellRx1RssiHistAtIndex:](v9, "kCellularTdsServingCellRx1RssiHistAtIndex:", 0);
              v34 = objc_claimAutoreleasedReturnValue();
              goto LABEL_131;
            case 3985929:
              -[PowerlogMetricLog kCellularTdsServingCellRx0RscpHistAtIndex:](v9, "kCellularTdsServingCellRx0RscpHistAtIndex:", 0);
              v34 = objc_claimAutoreleasedReturnValue();
              goto LABEL_131;
            case 3985930:
              -[PowerlogMetricLog kCellularTdsServingCellRx1RscpHistAtIndex:](v9, "kCellularTdsServingCellRx1RscpHistAtIndex:", 0);
              v34 = objc_claimAutoreleasedReturnValue();
              goto LABEL_131;
            case 3985931:
              -[PowerlogMetricLog kCellularTdsTxPowerHistAtIndex:](v9, "kCellularTdsTxPowerHistAtIndex:", 0);
              v11 = objc_claimAutoreleasedReturnValue();
              goto LABEL_138;
            case 3985941:
              -[PowerlogMetricLog kCellularTdsRabModeHistAtIndex:](v9, "kCellularTdsRabModeHistAtIndex:", 0);
              v11 = objc_claimAutoreleasedReturnValue();
              goto LABEL_138;
            case 3985942:
              -[PowerlogMetricLog kCellularTdsRabTypeHistAtIndex:](v9, "kCellularTdsRabTypeHistAtIndex:", 0);
              v11 = objc_claimAutoreleasedReturnValue();
              goto LABEL_138;
            default:
              goto LABEL_75;
          }
      }
    }
    switch(v10)
    {
      case 3985412:
        -[PowerlogMetricLog kCellularGsmServingCellRssiHistAtIndex:](v9, "kCellularGsmServingCellRssiHistAtIndex:", 0);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_138;
      case 3985413:
        -[PowerlogMetricLog kCellularGsmServingCellSnrHistAtIndex:](v9, "kCellularGsmServingCellSnrHistAtIndex:", 0);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_138;
      case 3985414:
        -[PowerlogMetricLog kCellularGsmTxPowerHistAtIndex:](v9, "kCellularGsmTxPowerHistAtIndex:", 0);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_138;
      case 3985415:
        -[PowerlogMetricLog kCellularGsmConnectedModeHistAtIndex:](v9, "kCellularGsmConnectedModeHistAtIndex:", 0);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_138;
      default:
        if (v10 == 3932163)
        {
          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
            __assert_rtn("-[PLICEBBHardwareMessage decodePayload:forMetricId:]", "PLICEBBHardwareMessage.m", 427, "0");
          goto LABEL_140;
        }
        if (v10 != 3952496)
          goto LABEL_75;
        -[PowerlogMetricLog kCellularLtePdcchStateStatsAtIndex:](v9, "kCellularLtePdcchStateStatsAtIndex:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLICEBBHardwareMessage pdcchStateStatsFor:forEntry:](self, "pdcchStateStatsFor:forEntry:", v12, v8);
        break;
    }
    goto LABEL_139;
  }
  if (v10 <= 3986692)
  {
    switch(v10)
    {
      case 3986179:
        -[PowerlogMetricLog kCellularLteFwDuplexModeAtIndex:](v9, "kCellularLteFwDuplexModeAtIndex:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLICEBBHardwareMessage duplexModeForClass:forEntry:](self, "duplexModeForClass:forEntry:", v12, v8);
        goto LABEL_139;
      case 3986180:
        -[PowerlogMetricLog kCellularLteServingCellRsrpHistAtIndex:](v9, "kCellularLteServingCellRsrpHistAtIndex:", 0);
        v34 = objc_claimAutoreleasedReturnValue();
        goto LABEL_131;
      case 3986181:
        -[PowerlogMetricLog kCellularLteServingCellSinrHistAtIndex:](v9, "kCellularLteServingCellSinrHistAtIndex:", 0);
        v34 = objc_claimAutoreleasedReturnValue();
        goto LABEL_131;
      case 3986182:
        -[PowerlogMetricLog kCellularLteSleepStateHistAtIndex:](v9, "kCellularLteSleepStateHistAtIndex:", 0);
        v34 = objc_claimAutoreleasedReturnValue();
LABEL_131:
        v12 = (void *)v34;
        -[PLICEBBHardwareMessage rrcModeHistForClass:forEntry:](self, "rrcModeHistForClass:forEntry:", v34, v8);
        goto LABEL_139;
      case 3986183:
        -[PowerlogMetricLog kCellularLteTxPowerHistAtIndex:](v9, "kCellularLteTxPowerHistAtIndex:", 0);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_138;
      case 3986184:
        -[PowerlogMetricLog kCellularLteDlSccStateHistAtIndex:](v9, "kCellularLteDlSccStateHistAtIndex:", 0);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_138;
      case 3986185:
        -[PowerlogMetricLog kCellularLteUlSccStateHistAtIndex:](v9, "kCellularLteUlSccStateHistAtIndex:", 0);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_138;
      case 3986186:
        -[PowerlogMetricLog kCellularLteAdvancedRxStateHistAtIndex:](v9, "kCellularLteAdvancedRxStateHistAtIndex:", 0);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_138;
      case 3986187:
        -[PowerlogMetricLog kCellularLteComponentCarrierInfoAtIndex:](v9, "kCellularLteComponentCarrierInfoAtIndex:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLICEBBHardwareMessage componentCarrierForClass:forEntry:](self, "componentCarrierForClass:forEntry:", v12, v8);
        goto LABEL_139;
      case 3986188:
        -[PowerlogMetricLog kCellularLteRxTxStateHistAtIndex:](v9, "kCellularLteRxTxStateHistAtIndex:", 0);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_138;
      case 3986189:
        -[PowerlogMetricLog kCellularLteTotalDlTbsHistAtIndex:](v9, "kCellularLteTotalDlTbsHistAtIndex:", 0);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_138;
      case 3986200:
        -[PowerlogMetricLog kCellularLteDlSccStateHistV3AtIndex:](v9, "kCellularLteDlSccStateHistV3AtIndex:", 0);
        v61 = objc_claimAutoreleasedReturnValue();
        goto LABEL_95;
      case 3986201:
        -[PowerlogMetricLog kCellularLteRxDiversityHistAtIndex:](v9, "kCellularLteRxDiversityHistAtIndex:", 0);
        v61 = objc_claimAutoreleasedReturnValue();
LABEL_95:
        v12 = (void *)v61;
        -[PLICEBBHardwareMessage protocolPerStateForClass:forEntry:](self, "protocolPerStateForClass:forEntry:", v61, v8);
        break;
      default:
        goto LABEL_75;
    }
    goto LABEL_139;
  }
  if (v10 > 3987205)
  {
    if (v10 > 3987332)
    {
      if (v10 == 3987333)
      {
        -[PowerlogMetricLog kCellularCdmaEvdoTxPowerHistAtIndex:](v9, "kCellularCdmaEvdoTxPowerHistAtIndex:", 0);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_138;
      }
      if (v10 != 3987334)
        goto LABEL_75;
      v35 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
      v36 = MEMORY[0x1E0C809B0];
      if (v35)
      {
        v91[0] = MEMORY[0x1E0C809B0];
        v91[1] = 3221225472;
        v91[2] = __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_81;
        v91[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v91[4] = objc_opt_class();
        if (qword_1ED887058 != -1)
          dispatch_once(&qword_1ED887058, v91);
        if (byte_1ED88701E)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ICE_HW_RF_EVDO_HIST - plMetricLog %@"), v9);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "lastPathComponent");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLICEBBHardwareMessage decodePayload:forMetricId:]");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "logMessage:fromFile:fromFunction:fromLineNumber:", v37, v40, v41, 700);

          PLLogCommon();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v96 = v37;
            _os_log_debug_impl(&dword_1CAF47000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v36 = MEMORY[0x1E0C809B0];
        }
      }
      -[PowerlogMetricLog kCellularCdmaEvdoProtocolStackStateHistAtIndex:](v9, "kCellularCdmaEvdoProtocolStackStateHistAtIndex:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v90[0] = v36;
        v90[1] = 3221225472;
        v90[2] = __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_86;
        v90[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v90[4] = objc_opt_class();
        if (qword_1ED887060 != -1)
          dispatch_once(&qword_1ED887060, v90);
        if (byte_1ED88701F)
        {
          v83 = v12;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ICE_HW_RF_EVDO_HIST - myClass %@"), v12);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "lastPathComponent");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLICEBBHardwareMessage decodePayload:forMetricId:]");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "logMessage:fromFile:fromFunction:fromLineNumber:", v43, v46, v47, 702);

          PLLogCommon();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v96 = v43;
            _os_log_debug_impl(&dword_1CAF47000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v36 = MEMORY[0x1E0C809B0];
          v12 = v83;
        }
      }
      -[PLICEBBHardwareMessage protocolHist2ForClass:forEntry:](self, "protocolHist2ForClass:forEntry:", v12, v8);
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_139;
      v89[0] = v36;
      v89[1] = 3221225472;
      v89[2] = __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_91;
      v89[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v89[4] = objc_opt_class();
      if (qword_1ED887068 != -1)
        dispatch_once(&qword_1ED887068, v89);
      if (!byte_1ED887020)
        goto LABEL_139;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ICE_HW_RF_EVDO_HIST - entry %@"), v8);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "lastPathComponent");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLICEBBHardwareMessage decodePayload:forMetricId:]");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v51, v52, 704);

      PLLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v96 = v28;
        goto LABEL_143;
      }
    }
    else
    {
      if (v10 == 3987206)
      {
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v62 = objc_opt_class();
          v94[0] = MEMORY[0x1E0C809B0];
          v94[1] = 3221225472;
          v94[2] = __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke;
          v94[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v94[4] = v62;
          if (qword_1ED887040 != -1)
            dispatch_once(&qword_1ED887040, v94);
          if (byte_1ED88701B)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ICE_HW_RF_CDMA1X_HIST - plMetricLog %@"), v9);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "lastPathComponent");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLICEBBHardwareMessage decodePayload:forMetricId:]");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "logMessage:fromFile:fromFunction:fromLineNumber:", v63, v66, v67, 685);

            PLLogCommon();
            v68 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v96 = v63;
              _os_log_debug_impl(&dword_1CAF47000, v68, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        -[PowerlogMetricLog kCellularCdma1XProtocolStackStateHistAtIndex:](v9, "kCellularCdma1XProtocolStackStateHistAtIndex:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v69 = objc_opt_class();
          v93[0] = MEMORY[0x1E0C809B0];
          v93[1] = 3221225472;
          v93[2] = __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_71;
          v93[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v93[4] = v69;
          if (qword_1ED887048 != -1)
            dispatch_once(&qword_1ED887048, v93);
          if (byte_1ED88701C)
          {
            v84 = v12;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ICE_HW_RF_CDMA1X_HIST - myClass %@"), v12);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "lastPathComponent");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLICEBBHardwareMessage decodePayload:forMetricId:]");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "logMessage:fromFile:fromFunction:fromLineNumber:", v70, v73, v74, 687);

            PLLogCommon();
            v75 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v96 = v70;
              _os_log_debug_impl(&dword_1CAF47000, v75, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v12 = v84;
          }
        }
        -[PLICEBBHardwareMessage protocolHist2ForClass:forEntry:](self, "protocolHist2ForClass:forEntry:", v12, v8);
        if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          goto LABEL_139;
        v76 = objc_opt_class();
        v92[0] = MEMORY[0x1E0C809B0];
        v92[1] = 3221225472;
        v92[2] = __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_76;
        v92[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v92[4] = v76;
        if (qword_1ED887050 != -1)
          dispatch_once(&qword_1ED887050, v92);
        if (!byte_1ED88701D)
          goto LABEL_139;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ICE_HW_RF_CDMA1X_HIST - entry %@"), v8);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "lastPathComponent");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLICEBBHardwareMessage decodePayload:forMetricId:]");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v79, v80, 689);

        PLLogCommon();
        v33 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          goto LABEL_116;
        *(_DWORD *)buf = 138412290;
        v96 = v28;
        goto LABEL_143;
      }
      if (v10 != 3987207)
        goto LABEL_75;
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v13 = objc_opt_class();
        v88[0] = MEMORY[0x1E0C809B0];
        v88[1] = 3221225472;
        v88[2] = __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_96;
        v88[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v88[4] = v13;
        if (qword_1ED887070 != -1)
          dispatch_once(&qword_1ED887070, v88);
        if (byte_1ED887021)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ICE_HW_RF_CDMA1X_CONN_HIST - plMetricLog %@"), v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "lastPathComponent");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLICEBBHardwareMessage decodePayload:forMetricId:]");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 709);

          PLLogCommon();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v96 = v14;
            _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      -[PowerlogMetricLog kCellularCdma1XConnectionHistAtIndex:](v9, "kCellularCdma1XConnectionHistAtIndex:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v20 = objc_opt_class();
        v87[0] = MEMORY[0x1E0C809B0];
        v87[1] = 3221225472;
        v87[2] = __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_101;
        v87[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v87[4] = v20;
        if (qword_1ED887078 != -1)
          dispatch_once(&qword_1ED887078, v87);
        if (byte_1ED887022)
        {
          v82 = v12;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ICE_HW_RF_CDMA1X_CONN_HIST - myClass %@"), v12);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "lastPathComponent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLICEBBHardwareMessage decodePayload:forMetricId:]");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 711);

          PLLogCommon();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v96 = v21;
            _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v12 = v82;
        }
      }
      -[PLICEBBHardwareMessage protocolHistForClass:forEntry:](self, "protocolHistForClass:forEntry:", v12, v8);
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_139;
      v27 = objc_opt_class();
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_106;
      v86[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v86[4] = v27;
      if (qword_1ED887080 != -1)
        dispatch_once(&qword_1ED887080, v86);
      if (!byte_1ED887023)
        goto LABEL_139;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ICE_HW_RF_CDMA1X_CONN_HIST - entry %@"), v8);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "lastPathComponent");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLICEBBHardwareMessage decodePayload:forMetricId:]");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 713);

      PLLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v96 = v28;
LABEL_143:
        _os_log_debug_impl(&dword_1CAF47000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
LABEL_116:

    goto LABEL_139;
  }
  if (v10 > 3986705)
  {
    if (v10 == 3986706)
    {
      -[PowerlogMetricLog kCellularProtocolStackStateHist2AtIndex:](v9, "kCellularProtocolStackStateHist2AtIndex:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLICEBBHardwareMessage protocolHist2ForClass:forEntry:](self, "protocolHist2ForClass:forEntry:", v12, v8);
      goto LABEL_139;
    }
    if (v10 == 3987205)
    {
      -[PowerlogMetricLog kCellularCdma1XTxPowerHistAtIndex:](v9, "kCellularCdma1XTxPowerHistAtIndex:", 0);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_138;
    }
LABEL_75:
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v53 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_111;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v53;
      if (qword_1ED887088 != -1)
        dispatch_once(&qword_1ED887088, block);
      if (byte_1ED887024)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: unexpected metric Id"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/Baseband/KICE/PLICEBBHardwareMessage.m");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "lastPathComponent");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLICEBBHardwareMessage decodePayload:forMetricId:]");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "logMessage:fromFile:fromFunction:fromLineNumber:", v54, v57, v58, 730);

        PLLogCommon();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v96 = v54;
          _os_log_debug_impl(&dword_1CAF47000, v59, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v60 = 0;
    goto LABEL_141;
  }
  if (v10 == 3986693)
  {
    -[PowerlogMetricLog kCellularProtocolStackStateHistAtIndex:](v9, "kCellularProtocolStackStateHistAtIndex:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_138;
  }
  if (v10 != 3986695)
    goto LABEL_75;
  -[PowerlogMetricLog kCellularCellPlmnSearchHistAtIndex:](v9, "kCellularCellPlmnSearchHistAtIndex:", 0);
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_138:
  v12 = (void *)v11;
  -[PLICEBBHardwareMessage protocolHistForClass:forEntry:](self, "protocolHistForClass:forEntry:", v11, v8);
LABEL_139:

LABEL_140:
  v60 = v8;
LABEL_141:

  return v60;
}

uint64_t __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88701B = result;
  return result;
}

uint64_t __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_71(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88701C = result;
  return result;
}

uint64_t __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_76(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88701D = result;
  return result;
}

uint64_t __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_81(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88701E = result;
  return result;
}

uint64_t __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_86(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88701F = result;
  return result;
}

uint64_t __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_91(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887020 = result;
  return result;
}

uint64_t __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_96(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887021 = result;
  return result;
}

uint64_t __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_101(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887022 = result;
  return result;
}

uint64_t __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_106(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887023 = result;
  return result;
}

uint64_t __52__PLICEBBHardwareMessage_decodePayload_forMetricId___block_invoke_111(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED887024 = result;
  return result;
}

- (void)rrcModeHistForClass:(id)a3 forEntry:(id)a4
{
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
  id v32;

  v32 = a3;
  v5 = a4;
  if (objc_msgSend(v32, "hasTimestamp"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v32, "timestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("bbtimestamp"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("bbtimestamp"));
  }
  if (objc_msgSend(v32, "hasDurationMs"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "durationMs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("duration"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("duration"));
  }
  if (objc_msgSend(v32, "hasIdleDurBin0"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin0"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("idle_dur_bin_0"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("idle_dur_bin_0"));
  }
  if (objc_msgSend(v32, "hasIdleDurBin1"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin1"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("idle_dur_bin_1"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("idle_dur_bin_1"));
  }
  if (objc_msgSend(v32, "hasIdleDurBin2"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin2"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("idle_dur_bin_2"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("idle_dur_bin_2"));
  }
  if (objc_msgSend(v32, "hasIdleDurBin3"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin3"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("idle_dur_bin_3"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("idle_dur_bin_3"));
  }
  if (objc_msgSend(v32, "hasIdleDurBin4"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin4"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("idle_dur_bin_4"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("idle_dur_bin_4"));
  }
  if (objc_msgSend(v32, "hasIdleDurBin5"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin5"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("idle_dur_bin_5"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("idle_dur_bin_5"));
  }
  if (objc_msgSend(v32, "hasIdleDurBin6"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin6"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("idle_dur_bin_6"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("idle_dur_bin_6"));
  }
  if (objc_msgSend(v32, "hasIdleDurBin7"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin7"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("idle_dur_bin_7"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("idle_dur_bin_7"));
  }
  if (objc_msgSend(v32, "hasIdleDurBin8"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin8"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("idle_dur_bin_8"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("idle_dur_bin_8"));
  }
  if (objc_msgSend(v32, "hasIdleDurBin9"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin9"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("idle_dur_bin_9"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("idle_dur_bin_9"));
  }
  if (objc_msgSend(v32, "hasIdleDurBin10"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin10"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("idle_dur_bin_10"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("idle_dur_bin_10"));
  }
  if (objc_msgSend(v32, "hasIdleDurBin11"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "idleDurBin11"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("idle_dur_bin_11"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("idle_dur_bin_11"));
  }
  if (objc_msgSend(v32, "hasConnDurBin0"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin0"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("conn_dur_bin_0"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("conn_dur_bin_0"));
  }
  if (objc_msgSend(v32, "hasConnDurBin1"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin1"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("conn_dur_bin_1"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("conn_dur_bin_1"));
  }
  if (objc_msgSend(v32, "hasConnDurBin2"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin2"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("conn_dur_bin_2"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("conn_dur_bin_2"));
  }
  if (objc_msgSend(v32, "hasConnDurBin3"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin3"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("conn_dur_bin_3"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("conn_dur_bin_3"));
  }
  if (objc_msgSend(v32, "hasConnDurBin4"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin4"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("conn_dur_bin_4"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("conn_dur_bin_4"));
  }
  if (objc_msgSend(v32, "hasConnDurBin5"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin5"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("conn_dur_bin_5"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("conn_dur_bin_5"));
  }
  if (objc_msgSend(v32, "hasConnDurBin6"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin6"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("conn_dur_bin_6"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("conn_dur_bin_6"));
  }
  if (objc_msgSend(v32, "hasConnDurBin7"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin7"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("conn_dur_bin_7"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("conn_dur_bin_7"));
  }
  if (objc_msgSend(v32, "hasConnDurBin8"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin8"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("conn_dur_bin_8"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("conn_dur_bin_8"));
  }
  if (objc_msgSend(v32, "hasConnDurBin9"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin9"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("conn_dur_bin_9"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("conn_dur_bin_9"));
  }
  if (objc_msgSend(v32, "hasConnDurBin10"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin10"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, CFSTR("conn_dur_bin_10"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("conn_dur_bin_10"));
  }
  if (objc_msgSend(v32, "hasConnDurBin11"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v32, "connDurBin11"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, CFSTR("conn_dur_bin_11"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("conn_dur_bin_11"));
  }

}

- (void)protocolHistForClass:(id)a3 forEntry:(id)a4
{
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
  id v41;

  v41 = a3;
  v5 = a4;
  if (objc_msgSend(v41, "hasTimestamp"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v41, "timestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("bbtimestamp"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("bbtimestamp"));
  }
  if (objc_msgSend(v41, "hasDurationMs"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durationMs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("duration"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("duration"));
  }
  if (objc_msgSend(v41, "hasSubsId"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "subsId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("subs_id"));

  }
  if (objc_msgSend(v41, "hasDurBin0"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin0"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("dur_bin_0"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_0"));
  }
  if (objc_msgSend(v41, "hasDurBin1"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin1"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("dur_bin_1"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_1"));
  }
  if (objc_msgSend(v41, "hasDurBin2"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin2"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("dur_bin_2"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_2"));
  }
  if (objc_msgSend(v41, "hasDurBin3"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin3"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("dur_bin_3"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_3"));
  }
  if (objc_msgSend(v41, "hasDurBin4"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin4"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("dur_bin_4"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_4"));
  }
  if (objc_msgSend(v41, "hasDurBin5"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin5"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("dur_bin_5"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_5"));
  }
  if (objc_msgSend(v41, "hasDurBin6"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin6"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("dur_bin_6"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_6"));
  }
  if (objc_msgSend(v41, "hasDurBin7"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin7"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("dur_bin_7"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_7"));
  }
  if (objc_msgSend(v41, "hasDurBin8"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin8"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("dur_bin_8"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_8"));
  }
  if (objc_msgSend(v41, "hasDurBin9"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin9"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("dur_bin_9"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_9"));
  }
  if (objc_msgSend(v41, "hasDurBin10"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin10"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("dur_bin_10"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_10"));
  }
  if (objc_msgSend(v41, "hasDurBin11"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin11"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("dur_bin_11"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_11"));
  }
  if (objc_msgSend(v41, "hasDurBin12"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin12"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("dur_bin_12"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_12"));
  }
  if (objc_msgSend(v41, "hasDurBin13"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin13"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("dur_bin_13"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_13"));
  }
  if (objc_msgSend(v41, "hasDurBin14"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin14"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("dur_bin_14"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_14"));
  }
  if (objc_msgSend(v41, "hasDurBin15"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin15"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("dur_bin_15"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_15"));
  }
  if (objc_msgSend(v41, "hasDurBin16"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin16"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("dur_bin_16"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_16"));
  }
  if (objc_msgSend(v41, "hasDurBin17"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin17"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("dur_bin_17"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_17"));
  }
  if (objc_msgSend(v41, "hasDurBin18"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin18"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("dur_bin_18"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_18"));
  }
  if (objc_msgSend(v41, "hasDurBin19"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin19"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("dur_bin_19"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_19"));
  }
  if (objc_msgSend(v41, "hasDurBin20"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin20"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("dur_bin_20"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_20"));
  }
  if (objc_msgSend(v41, "hasDurBin21"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin21"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, CFSTR("dur_bin_21"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_21"));
  }
  if (objc_msgSend(v41, "hasDurBin22"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin22"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, CFSTR("dur_bin_22"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_22"));
  }
  if (objc_msgSend(v41, "hasDurBin23"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin23"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("dur_bin_23"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_23"));
  }
  if (objc_msgSend(v41, "hasDurBin24"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin24"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("dur_bin_24"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_24"));
  }
  if (objc_msgSend(v41, "hasDurBin25"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin25"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, CFSTR("dur_bin_25"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_25"));
  }
  if (objc_msgSend(v41, "hasDurBin26"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin26"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, CFSTR("dur_bin_26"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_26"));
  }
  if (objc_msgSend(v41, "hasDurBin27"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin27"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, CFSTR("dur_bin_27"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_27"));
  }
  if (objc_msgSend(v41, "hasDurBin28"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin28"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, CFSTR("dur_bin_28"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_28"));
  }
  if (objc_msgSend(v41, "hasDurBin29"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin29"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v38, CFSTR("dur_bin_29"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_29"));
  }
  if (objc_msgSend(v41, "hasDurBin30"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin30"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v39, CFSTR("dur_bin_30"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_30"));
  }
  if (objc_msgSend(v41, "hasDurBin31"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v41, "durBin31"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v40, CFSTR("dur_bin_31"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("dur_bin_31"));
  }

}

- (void)protocolHist2ForClass:(id)a3 forEntry:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v5 = a4;
  if (objc_msgSend(v16, "hasTimestamp"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v16, "timestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("bbtimestamp"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("bbtimestamp"));
  }
  if (objc_msgSend(v16, "hasDuration"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v16, "duration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("duration"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("duration"));
  }
  if (objc_msgSend(v16, "hasSubsId"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v16, "subsId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("subs_id"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("subs_id"));
  }
  v9 = (void *)objc_opt_new();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("bin"));

  v10 = 35;
  do
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bin"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", &unk_1E8634AD0);

    --v10;
  }
  while (v10);
  if (objc_msgSend(v16, "binsCount"))
  {
    v12 = 0;
    do
    {
      objc_msgSend(v16, "binAtIndex:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "hasIds") && objc_msgSend(v13, "hasValue"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v13, "value"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bin"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:atIndexedSubscript:", v14, objc_msgSend(v13, "ids"));

      }
      ++v12;
    }
    while (objc_msgSend(v16, "binsCount") > v12);
  }

}

- (void)protocolPerStateForClass:(id)a3 forEntry:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v5 = a4;
  if (objc_msgSend(v23, "hasTimestamp"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v23, "timestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("bbtimestamp"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("bbtimestamp"));
  }
  if (objc_msgSend(v23, "hasDuration"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v23, "duration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("duration"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("duration"));
  }
  if (objc_msgSend(v23, "hasSubsId"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v23, "subsId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("subs_id"));

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E8634AD0, CFSTR("subs_id"));
  }
  v9 = (void *)objc_opt_new();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("hist"));

  if (objc_msgSend(v23, "histsCount"))
  {
    v10 = 0;
    do
    {
      v11 = (void *)objc_opt_new();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hist"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v11);

      v13 = 8;
      do
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hist"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", &unk_1E8634AD0);

        --v13;
      }
      while (v13);

      ++v10;
    }
    while (objc_msgSend(v23, "histsCount") > v10);
  }
  if (objc_msgSend(v23, "histsCount"))
  {
    v16 = 0;
    do
    {
      objc_msgSend(v23, "histAtIndex:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "binsCount"))
      {
        v18 = 0;
        do
        {
          objc_msgSend(v17, "binAtIndex:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "hasIds") && objc_msgSend(v19, "hasValue"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v19, "value"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hist"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectAtIndexedSubscript:", v16);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:atIndexedSubscript:", v20, objc_msgSend(v19, "ids"));

          }
          ++v18;
        }
        while (objc_msgSend(v17, "binsCount") > v18);
      }

      ++v16;
    }
    while (objc_msgSend(v23, "histsCount") > v16);
  }

}

- (void)componentCarrierForClass:(id)a3 forEntry:(id)a4
{
  id v5;
  unint64_t v6;
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
  id v21;

  v21 = a3;
  v5 = a4;
  if (objc_msgSend(v21, "carrierInfosCount"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v21, "carrierInfoAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "hasDlEarfcn"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dl_earfcn_%d"), v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "dlEarfcn"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, v8);

      }
      if (objc_msgSend(v7, "hasDlBandwidth"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dl_bandwidth_%d"), v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "dlBandwidth"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v10);

      }
      if (objc_msgSend(v7, "hasDlRfBand"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dl_rf_band_%d"), v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "dlRfBand"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v12);

      }
      ++v6;
    }
    while (objc_msgSend(v21, "carrierInfosCount") > v6);
  }
  if ((objc_msgSend(v21, "hasTimestamp") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v21, "timestamp"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("bbtimestamp"));

  }
  if (objc_msgSend(v21, "hasPccEarfcn"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v21, "pccEarfcn"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("pcc_earfcn"));

  }
  if (objc_msgSend(v21, "hasScc0Earfcn"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v21, "scc0Earfcn"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("scc0_earfcn"));

  }
  if (objc_msgSend(v21, "hasScc1Earfcn"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v21, "scc1Earfcn"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("scc1_earfcn"));

  }
  if (objc_msgSend(v21, "hasPccBandwidth"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v21, "pccBandwidth"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("pcc_bandwidth"));

  }
  if (objc_msgSend(v21, "hasScc0Bandwidth"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v21, "scc0Bandwidth"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("scc0_bandwidth"));

  }
  if (objc_msgSend(v21, "hasScc1Bandwidth"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v21, "scc1Bandwidth"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("scc1_bandwidth"));

  }
}

- (void)duplexModeForClass:(id)a3 forEntry:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (objc_msgSend(v8, "hasTimestamp"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v8, "timestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("bbtimestamp"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isInTddMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("is_in_tdd_mode"));

}

- (void)pdcchStateStatsFor:(id)a3 forEntry:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v5 = a4;
  if (objc_msgSend(v17, "hasTimestamp"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v17, "timestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("bbtimestamp"));

  }
  if (objc_msgSend(v17, "hasDurationMs"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v17, "durationMs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("duration"));

  }
  if (objc_msgSend(v17, "pccPdcchStatesCount"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pcc_%d"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v17, "pccPdcchStateAtIndex:", v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v9);

      ++v8;
    }
    while (objc_msgSend(v17, "pccPdcchStatesCount") > v8);
  }
  if (objc_msgSend(v17, "scc0PdcchStatesCount"))
  {
    v11 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("scc0_%d"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v17, "scc0PdcchStateAtIndex:", v11));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v12);

      ++v11;
    }
    while (objc_msgSend(v17, "scc0PdcchStatesCount") > v11);
  }
  if (objc_msgSend(v17, "scc1PdcchStatesCount"))
  {
    v14 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("scc1_%d"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v17, "scc1PdcchStateAtIndex:", v14));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v15);

      ++v14;
    }
    while (objc_msgSend(v17, "scc1PdcchStatesCount") > v14);
  }

}

- (void)cpcStatsForClass:(id)a3 forEntry:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  if (objc_msgSend(v11, "hasTimestamp"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v11, "timestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("bbtimestamp"));

  }
  if (objc_msgSend(v11, "hasTotalDurationMs"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v11, "totalDurationMs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("duration"));

  }
  if (objc_msgSend(v11, "hasRxTxOffDurationMs"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v11, "energy"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("rx_tx_off_duration_ms"));

  }
  if (objc_msgSend(v11, "hasRxOnDurationMs"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v11, "energy"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("rx_on_duration_ms"));

  }
  if (objc_msgSend(v11, "hasEnergy"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v11, "energy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("energy"));

  }
}

- (NSNumber)metricId
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMetricId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)metricData
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetricData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSNumber)triggerId
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTriggerId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PBCodable)pbc
{
  return (PBCodable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPbc:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableArray)metricIdArr
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMetricIdArr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableArray)metricDataArr
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMetricDataArr:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSNumber)triggerCnt
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTriggerCnt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSNumber)bbtimestamp
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBbtimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDate)bbMonotonic
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBbMonotonic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLAgent)logAgent
{
  return (PLAgent *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLogAgent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logAgent, 0);
  objc_storeStrong((id *)&self->_bbMonotonic, 0);
  objc_storeStrong((id *)&self->_bbtimestamp, 0);
  objc_storeStrong((id *)&self->_triggerCnt, 0);
  objc_storeStrong((id *)&self->_metricDataArr, 0);
  objc_storeStrong((id *)&self->_metricIdArr, 0);
  objc_storeStrong((id *)&self->_pbc, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_triggerId, 0);
  objc_storeStrong((id *)&self->_metricData, 0);
  objc_storeStrong((id *)&self->_metricId, 0);
}

@end
