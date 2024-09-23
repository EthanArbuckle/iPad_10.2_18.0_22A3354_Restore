@implementation BBSmartPL

- (void)startWithOperator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];

  v4 = a3;
  -[BBSmartPL setOperator:](self, "setOperator:", v4);
  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBSmartPL setLastLogDate:](self, "setLastLogDate:", v5);

  -[BBSmartPL setLogDuration:](self, "setLogDuration:", 0.0);
  -[BBSmartPL setCxoDuration:](self, "setCxoDuration:", 0.0);
  objc_msgSend(MEMORY[0x24BE75298], "sharedTelephonyConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBSmartPL setConnection:](self, "setConnection:", v6);

  objc_msgSend(MEMORY[0x24BE75240], "entryKeyForType:andName:", *MEMORY[0x24BE75210], *MEMORY[0x24BE75308]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x24BE74FC8]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __31__BBSmartPL_startWithOperator___block_invoke;
  v10[3] = &unk_24EB5CDA0;
  v10[4] = self;
  v9 = (void *)objc_msgSend(v8, "initWithOperator:forEntryKey:withBlock:", v4, v7, v10);

  -[BBSmartPL setBbHwOtherCallback:](self, "setBbHwOtherCallback:", v9);
}

uint64_t __31__BBSmartPL_startWithOperator___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleMavBBHwOtherCallback:", a2);
  return result;
}

- (void)triggerBBCoreDump
{
  OUTLINED_FUNCTION_0(&dword_222C6D000, a2, a3, "%@", a5, a6, a7, a8, 2u);
}

- (void)handleMavBBHwOtherCallback:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  uint64_t block;
  uint64_t v51;
  uint64_t (*v52)(uint64_t);
  void *v53;
  uint64_t v54;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE752E8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  -[BBSmartPL logDuration](self, "logDuration");
  -[BBSmartPL setLogDuration:](self, "setLogDuration:", v7 + v8);

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE752C8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;
  -[BBSmartPL cxoDuration](self, "cxoDuration");
  -[BBSmartPL setCxoDuration:](self, "setCxoDuration:", v11 + v12);

  objc_msgSend(v4, "entryDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBSmartPL lastLogDate](self, "lastLogDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v14);
  v16 = v15;

  if (v16 >= 1200.0)
  {
    objc_msgSend(MEMORY[0x24BE75240], "entryKeyForType:andName:", *MEMORY[0x24BE75230], *MEMORY[0x24BE752C0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBSmartPL operator](self, "operator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "storage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastEntryForKey:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("callStatus"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isEqualToString:", CFSTR("Inactive")))
    {
      -[BBSmartPL cxoDuration](self, "cxoDuration");
      v23 = v22;
      -[BBSmartPL logDuration](self, "logDuration");
      if (v23 / v24 < 0.0)
      {
        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v25 = objc_opt_class();
          block = MEMORY[0x24BDAC760];
          v51 = 3221225472;
          v52 = __40__BBSmartPL_handleMavBBHwOtherCallback___block_invoke;
          v53 = &__block_descriptor_40_e5_v8__0lu32l8;
          v54 = v25;
          if (handleMavBBHwOtherCallback__defaultOnce != -1)
            dispatch_once(&handleMavBBHwOtherCallback__defaultOnce, &block);
          if (handleMavBBHwOtherCallback__classDebugEnabled)
          {
            v26 = (void *)MEMORY[0x24BDD17C8];
            -[BBSmartPL cxoDuration](self, "cxoDuration");
            v28 = v27;
            -[BBSmartPL logDuration](self, "logDuration");
            objc_msgSend(v26, "stringWithFormat:", CFSTR("SMARTPL - trigger Core Dump%f"), v28 / v29, block, v51, v52, v53, v54);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/SmartPL/BBSmartPL.m");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "lastPathComponent");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[BBSmartPL handleMavBBHwOtherCallback:]");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v33, v34, 74);

            PLLogCommon();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              -[BBSmartPL triggerBBCoreDump].cold.1((uint64_t)v30, v35, v36, v37, v38, v39, v40, v41);

          }
        }
        -[BBSmartPL triggerBBCoreDump](self, "triggerBBCoreDump");
        -[BBSmartPL operator](self, "operator");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_opt_class();
        v44 = (void *)MEMORY[0x24BDD17C8];
        -[BBSmartPL cxoDuration](self, "cxoDuration");
        v46 = v45;
        -[BBSmartPL logDuration](self, "logDuration");
        objc_msgSend(v44, "stringWithFormat:", CFSTR("cxoDuration/logDuration=%f"), v46 / v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "logEventPointSmartPLFiredFromAuxilary:withReason:", v43, v48);

      }
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[BBSmartPL setLastLogDate:](self, "setLastLogDate:", v49);

    -[BBSmartPL setLogDuration:](self, "setLogDuration:", 0.0);
    -[BBSmartPL setCxoDuration:](self, "setCxoDuration:", 0.0);

  }
}

uint64_t __40__BBSmartPL_handleMavBBHwOtherCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleMavBBHwOtherCallback__classDebugEnabled = result;
  return result;
}

- (PLSmartPLService)operator
{
  return (PLSmartPLService *)objc_loadWeakRetained((id *)&self->_operator);
}

- (void)setOperator:(id)a3
{
  objc_storeWeak((id *)&self->_operator, a3);
}

- (PLEntryNotificationOperatorComposition)bbHwOtherCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBbHwOtherCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)lastLogDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastLogDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (double)logDuration
{
  return self->_logDuration;
}

- (void)setLogDuration:(double)a3
{
  self->_logDuration = a3;
}

- (double)cxoDuration
{
  return self->_cxoDuration;
}

- (void)setCxoDuration:(double)a3
{
  self->_cxoDuration = a3;
}

- (PLTelephonyConnection)connection
{
  return (PLTelephonyConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_lastLogDate, 0);
  objc_storeStrong((id *)&self->_bbHwOtherCallback, 0);
  objc_destroyWeak((id *)&self->_operator);
}

@end
