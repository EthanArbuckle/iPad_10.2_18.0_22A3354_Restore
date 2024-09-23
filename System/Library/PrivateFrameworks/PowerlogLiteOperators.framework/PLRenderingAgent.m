@implementation PLRenderingAgent

id __52__PLRenderingAgent_logFrameCount_forConnectedState___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  objc_msgSend(a5, "transitionReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = SBSBacklightChangeSourceForDisplayLayoutTransitionReason();

  if (v8 != 8 && v8 != 28)
    -[PLRenderingAgent logEventForwardFrameCount:](self, "logEventForwardFrameCount:", v9);

}

- (void)logEventForwardFrameCount:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    v13 = v4;
    v5 = objc_msgSend(v4, "displayBacklightLevel") < 1;
    v4 = v13;
    if (!v5)
    {
      +[PLOperator entryKeyForType:andName:](PLRenderingAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("FrameCount"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v6);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", CARenderServerGetFrameCounter());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("FrameCount"));

      -[PLOperator logEntry:](self, "logEntry:", v7);
      -[PLRenderingAgent deviceIsPlugged](self, "deviceIsPlugged");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("FrameCount"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "unsignedIntValue");
        -[PLRenderingAgent deviceIsPlugged](self, "deviceIsPlugged");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLRenderingAgent logFrameCount:forConnectedState:](self, "logFrameCount:forConnectedState:", v11, objc_msgSend(v12, "BOOLValue"));

      }
      v4 = v13;
    }
  }

}

- (NSNumber)deviceIsPlugged
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)logFrameCount:(unsigned int)a3 forConnectedState:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  const __CFString *v12;
  const __CFString *v13;
  id v14;
  unsigned int lastFrameCount;
  unsigned int v16;
  void *v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  if (-[PLRenderingAgent lastFrameCount](self, "lastFrameCount"))
  {
    v7 = v5;
    if (-[PLRenderingAgent lastFrameCount](self, "lastFrameCount") <= v5)
      v7 = v5 - -[PLRenderingAgent lastFrameCount](self, "lastFrameCount");
    v8 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("frameCount"));

    PLLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v11)
      {
        lastFrameCount = self->_lastFrameCount;
        *(_DWORD *)buf = 67109632;
        v19 = v5;
        v20 = 1024;
        v21 = lastFrameCount;
        v22 = 1024;
        v23 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "Plugged: framesRendered=%d, lastFrameCount=%d, delta=%d", buf, 0x14u);
      }
      v12 = CFSTR("plugged");
      v13 = CFSTR("com.apple.power.framecount.plugged");
    }
    else
    {
      if (v11)
      {
        v16 = self->_lastFrameCount;
        *(_DWORD *)buf = 67109632;
        v19 = v5;
        v20 = 1024;
        v21 = v16;
        v22 = 1024;
        v23 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "Unplugged: framesRendered=%d, lastFrameCount=%d, delta=%d", buf, 0x14u);
      }
      v12 = CFSTR("unplugged");
      v13 = CFSTR("com.apple.power.framecount.unplugged");
    }

    MEMORY[0x1D179B7DC](v13, v7);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("state"));
    v17 = v8;
    v14 = v8;
    AnalyticsSendEventLazy();

  }
  -[PLRenderingAgent setLastFrameCount:](self, "setLastFrameCount:", v5);
}

- (unsigned)lastFrameCount
{
  return self->_lastFrameCount;
}

- (void)setLastFrameCount:(unsigned int)a3
{
  self->_lastFrameCount = a3;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLRenderingAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventBackwardDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("FrameCount");
  objc_msgSend(a1, "entryEventBackwardDefinitionFrameCount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("FrameStats");
  v8[0] = v3;
  objc_msgSend(a1, "entryEventBackwardDefinitionFrameStats");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryEventBackwardDefinitionFrameCount
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8652AA0;
  v12[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("FrameCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)entryEventBackwardDefinitionFrameStats
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
  _QWORD v21[7];
  _QWORD v22[7];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[2];
  _QWORD v26[4];

  v26[2] = *MEMORY[0x1E0C80C00];
  v25[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v23[0] = *MEMORY[0x1E0D80318];
  v23[1] = v2;
  v24[0] = &unk_1E8652AB0;
  v24[1] = MEMORY[0x1E0C9AAA0];
  v23[2] = *MEMORY[0x1E0D80330];
  v24[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v20;
  v25[1] = *MEMORY[0x1E0D802F0];
  v21[0] = CFSTR("APL_r");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_RealFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  v21[1] = CFSTR("APL_g");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_RealFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  v21[2] = CFSTR("APL_b");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_RealFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v14;
  v21[3] = CFSTR("AZLE_max");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_RealFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v4;
  v21[4] = CFSTR("AZLE_min");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_RealFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v6;
  v21[5] = CFSTR("AZLE_mean");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_RealFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v8;
  v21[6] = CFSTR("EDR_headroom");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_RealFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLRenderingAgent)init
{
  PLRenderingAgent *v3;
  PLRenderingAgent *v4;
  uint64_t v5;
  FBSDisplayLayoutMonitor *mainDisplayMonitor;
  objc_super v8;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PLRenderingAgent;
    v4 = -[PLAgent init](&v8, sel_init);
    if (v4)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D230D0]), "initWithDisplayType:", 0);
      mainDisplayMonitor = v4->_mainDisplayMonitor;
      v4->_mainDisplayMonitor = (FBSDisplayLayoutMonitor *)v5;

      -[FBSDisplayLayoutMonitor addObserver:](v4->_mainDisplayMonitor, "addObserver:", v4);
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[PLRenderingAgent setLastFrameCount:](self, "setLastFrameCount:", 0);
  -[PLRenderingAgent setDeviceIsPlugged:](self, "setDeviceIsPlugged:", 0);
  v3 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v11 = CFSTR("ExternalConnected");
  v9 = &unk_1E8632400;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__PLRenderingAgent_initOperatorDependancies__block_invoke;
  v8[3] = &unk_1E8577F48;
  v8[4] = self;
  v7 = (void *)objc_msgSend(v3, "initWithOperator:forEntryKey:withFilter:withBlock:", self, CFSTR("PLBatteryAgent_EventBackward_Battery"), v6, v8);
  -[PLRenderingAgent setPluggedInStateNotification:](self, "setPluggedInStateNotification:", v7);

  if (-[PLRenderingAgent shouldLogFrameStats](self, "shouldLogFrameStats"))
    -[PLRenderingAgent disableCAScreenTelemetry](self, "disableCAScreenTelemetry");
}

uint64_t __44__PLRenderingAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleConnectedChange:", a2);
}

- (void)initTaskOperatorDependancies
{
  id v3;
  void *v4;
  _QWORD v5[5];

  if (-[PLRenderingAgent shouldLogFrameStats](self, "shouldLogFrameStats"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode"))
    {
      v3 = objc_alloc(MEMORY[0x1E0D80090]);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __48__PLRenderingAgent_initTaskOperatorDependancies__block_invoke;
      v5[3] = &unk_1E8578610;
      v5[4] = self;
      v4 = (void *)objc_msgSend(v3, "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B6A8, v5);
      -[PLRenderingAgent setFrameStatsListener:](self, "setFrameStatsListener:", v4);

      -[PLRenderingAgent enableCAScreenTelemetry](self, "enableCAScreenTelemetry");
    }
  }
}

void __48__PLRenderingAgent_initTaskOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Frame Stats callback: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardFrameStats:", v6);
}

- (void)dealloc
{
  FBSDisplayLayoutMonitor *mainDisplayMonitor;
  objc_super v4;

  mainDisplayMonitor = self->_mainDisplayMonitor;
  if (mainDisplayMonitor)
    -[FBSDisplayLayoutMonitor invalidate](mainDisplayMonitor, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)PLRenderingAgent;
  -[PLAgent dealloc](&v4, sel_dealloc);
}

- (void)log
{
  void *v3;
  id v4;

  -[PLRenderingAgent mainDisplayMonitor](self, "mainDisplayMonitor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLRenderingAgent logEventForwardFrameCount:](self, "logEventForwardFrameCount:", v3);

}

- (void)handleConnectedChange:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ExternalConnected"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLRenderingAgent setDeviceIsPlugged:](self, "setDeviceIsPlugged:", v7);

    -[PLRenderingAgent logFrameCount:forConnectedState:](self, "logFrameCount:forConnectedState:", CARenderServerGetFrameCounter(), v6 ^ 1);
    v4 = v8;
  }

}

- (void)logEventBackwardFrameStats:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = *MEMORY[0x1E0D80370];
    v5 = a3;
    +[PLOperator entryKeyForType:andName:](PLRenderingAgent, "entryKeyForType:andName:", v4, CFSTR("FrameStats"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

    -[PLOperator logEntry:](self, "logEntry:", v6);
  }
}

- (BOOL)shouldLogFrameStats
{
  if (qword_1ED882810 != -1)
    dispatch_once(&qword_1ED882810, &__block_literal_global_14);
  return _MergedGlobals_1_17;
}

uint64_t __39__PLRenderingAgent_shouldLogFrameStats__block_invoke()
{
  uint64_t result;
  BOOL v1;

  result = objc_msgSend(MEMORY[0x1E0D80020], "isiPad");
  if ((_DWORD)result)
  {
    result = objc_msgSend(MEMORY[0x1E0D80020], "kPLSoCClassOfDevice");
    v1 = (_DWORD)result == 1001012;
  }
  else
  {
    v1 = 0;
  }
  _MergedGlobals_1_17 = v1;
  return result;
}

- (void)enableCAScreenTelemetry
{
  void *v2;
  double v3;
  unint64_t v4;
  void *v5;
  double v6;
  unint64_t v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSObject *v13;
  unint64_t v14;
  unint64_t v15;
  NSObject *v16;
  int v17;
  unint64_t v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = (unint64_t)v3;

  objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = (unint64_t)v6;

  v8 = MGGetSInt32Answer();
  if (v8 == 20)
    v9 = 36;
  else
    v9 = 44;
  if (v8 == 20)
    v10 = 52;
  else
    v10 = 59;
  v11 = (v4 + v9 - 1) / v9;
  v12 = (v7 + v10 - 1) / v10;
  PLLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v17 = 134218752;
    v18 = v4;
    v19 = 2048;
    v20 = v7;
    v21 = 2048;
    v22 = v9;
    v23 = 2048;
    v24 = v10;
    _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "sW: %lu, sH: %lu, nX: %lu, nY: %lu", (uint8_t *)&v17, 0x2Au);
  }
  v14 = vcvtpd_u64_f64((float)v11 * 1.9);
  v15 = vcvtpd_u64_f64((float)v12 * 1.9);

  PLLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = 134218752;
    v18 = v11;
    v19 = 2048;
    v20 = v12;
    v21 = 2048;
    v22 = v14;
    v23 = 2048;
    v24 = v15;
    _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "rW: %lu, rH: %lu, zW: %lu, zH: %lu", (uint8_t *)&v17, 0x2Au);
  }

  objc_msgSend(MEMORY[0x1E0D7FFA0], "longForKey:ifNotSet:", CFSTR("FrameStatsSampleInterval"), 60);
  CARenderServerSetScreenTelemetryParameters();
}

- (void)disableCAScreenTelemetry
{
  CARenderServerSetScreenTelemetryParameters();
}

- (FBSDisplayLayoutMonitor)mainDisplayMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMainDisplayMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLEntryNotificationOperatorComposition)pluggedInStateNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPluggedInStateNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setDeviceIsPlugged:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLXPCListenerOperatorComposition)frameStatsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFrameStatsListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameStatsListener, 0);
  objc_storeStrong((id *)&self->_deviceIsPlugged, 0);
  objc_storeStrong((id *)&self->_pluggedInStateNotification, 0);
  objc_storeStrong((id *)&self->_mainDisplayMonitor, 0);
}

@end
