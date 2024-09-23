@implementation SmartPLMemoryTracking

+ (id)defaults
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(&unk_24EB64B90, "mutableCopy");
  if ((objc_msgSend(MEMORY[0x24BE74FF8], "isFullModeDaemon") & 1) == 0)
  {
    if (objc_msgSend(MEMORY[0x24BE74FD8], "is64Bit"))
      v3 = &unk_24EB64A78;
    else
      v3 = &unk_24EB64A90;
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("MemoryTrackingTriggerThreshold"));
  }
  return v2;
}

- (void)startWithOperator:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[SmartPLMemoryTracking setOperator:](self, "setOperator:", a3);
  objc_msgSend(MEMORY[0x24BE75278], "entryKeyForType:andName:", *MEMORY[0x24BE75230], *MEMORY[0x24BE75398]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x24BE74FC8]);
  -[SmartPLMemoryTracking operator](self, "operator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__SmartPLMemoryTracking_startWithOperator___block_invoke;
  v8[3] = &unk_24EB5CDA0;
  v8[4] = self;
  v7 = (void *)objc_msgSend(v5, "initWithOperator:forEntryKey:withBlock:", v6, v4, v8);

  -[SmartPLMemoryTracking setMemoryTrackingNotification:](self, "setMemoryTrackingNotification:", v7);
}

void __43__SmartPLMemoryTracking_startWithOperator___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectForKey:", CFSTR("entry"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleMemoryTracking:", v3);

}

- (void)handleMemoryTracking:(id)a3
{
  id v4;
  void *v5;
  float v6;
  double v7;
  uint64_t v8;
  double v9;
  void *v10;
  float v11;
  double v12;
  double v13;
  void *v14;
  float v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  __CFString *v29;
  double v30;
  _QWORD v31[4];
  __CFString *v32;
  double v33;
  _QWORD block[4];
  __CFString *v35;
  double v36;

  v4 = a3;
  +[SmartPLMemoryTracking defaults](SmartPLMemoryTracking, "defaults");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("MemoryTrackingDirtyPercent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  v8 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SmartPLMemoryTracking_handleMemoryTracking___block_invoke;
  block[3] = &unk_24EB5D230;
  v35 = CFSTR("MemoryTrackingDirtyPercent");
  v36 = v7;
  if (handleMemoryTracking__defaultOnce != -1)
    dispatch_once(&handleMemoryTracking__defaultOnce, block);
  v9 = *(double *)&handleMemoryTracking__objectForKey;

  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("MemoryTrackingOverhead"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  v31[0] = v8;
  v31[1] = 3221225472;
  v31[2] = __46__SmartPLMemoryTracking_handleMemoryTracking___block_invoke_2;
  v31[3] = &unk_24EB5D230;
  v32 = CFSTR("MemoryTrackingOverhead");
  v33 = v12;
  if (handleMemoryTracking__defaultOnce_25 != -1)
    dispatch_once(&handleMemoryTracking__defaultOnce_25, v31);
  v13 = *(double *)&handleMemoryTracking__objectForKey_26;

  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("MemoryTrackingTriggerThreshold"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v16 = v15;

  v28[0] = v8;
  v28[1] = 3221225472;
  v28[2] = __46__SmartPLMemoryTracking_handleMemoryTracking___block_invoke_3;
  v28[3] = &unk_24EB5D230;
  v29 = CFSTR("MemoryTrackingTriggerThreshold");
  v30 = v16;
  if (handleMemoryTracking__defaultOnce_27 != -1)
    dispatch_once(&handleMemoryTracking__defaultOnce_27, v28);
  v17 = *(double *)&handleMemoryTracking__objectForKey_28;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MallocSize"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "doubleValue");
  v20 = v13 + v19 * v9;

  if (v20 > v17)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dirtyMemoryGuess greater than threshold %f"), *(_QWORD *)&v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SmartPLMemoryTracking operator](self, "operator");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "logEventPointSmartPLFiredFromAuxilary:withReason:", objc_opt_class(), v21);

    -[SmartPLMemoryTracking operator](self, "operator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "logEventPointStackShotWithReason:", v21);

    -[SmartPLMemoryTracking operator](self, "operator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "processName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "logEventPointSampleForProcessName:", v26);

  }
}

uint64_t __46__SmartPLMemoryTracking_handleMemoryTracking___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "doubleForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
  handleMemoryTracking__objectForKey = v2;
  return result;
}

uint64_t __46__SmartPLMemoryTracking_handleMemoryTracking___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "doubleForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
  handleMemoryTracking__objectForKey_26 = v2;
  return result;
}

uint64_t __46__SmartPLMemoryTracking_handleMemoryTracking___block_invoke_3(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "doubleForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
  handleMemoryTracking__objectForKey_28 = v2;
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

- (PLEntryNotificationOperatorComposition)memoryTrackingNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMemoryTrackingNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryTrackingNotification, 0);
  objc_destroyWeak((id *)&self->_operator);
}

@end
