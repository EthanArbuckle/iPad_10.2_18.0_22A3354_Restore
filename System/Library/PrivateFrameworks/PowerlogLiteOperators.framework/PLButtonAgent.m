@implementation PLButtonAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLButtonAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventPointDefinitions
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
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[2];
  _QWORD v17[2];
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v18 = CFSTR("Button");
  v16[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802A8];
  v14[0] = *MEMORY[0x1E0D80318];
  v14[1] = v2;
  v15[0] = &unk_1E8653240;
  v15[1] = MEMORY[0x1E0C9AAA0];
  v14[2] = *MEMORY[0x1E0D80300];
  v15[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  v16[1] = *MEMORY[0x1E0D802F0];
  v12[0] = CFSTR("ButtonType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("EventType");
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)entryEventForwardDefinitionActionButtonInteraction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1E8653250;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventForwardDefinitionActionButtonSelection
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
  v13 = &unk_1E8653260;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("action");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("sub-action");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventForwardDefinitions
{
  uint64_t v3;
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
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];
  _QWORD v22[5];

  v22[3] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("CoverState");
  v19[0] = *MEMORY[0x1E0D80298];
  v3 = *MEMORY[0x1E0D802A8];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v3;
  v18[0] = &unk_1E8653250;
  v18[1] = MEMORY[0x1E0C9AAA0];
  v17[2] = *MEMORY[0x1E0D80300];
  v18[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("Side");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("State");
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  v21[1] = CFSTR("ActionButtonSelection");
  objc_msgSend(a1, "entryEventForwardDefinitionActionButtonSelection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v10;
  v21[2] = CFSTR("ActionButtonInteraction");
  objc_msgSend(a1, "entryEventForwardDefinitionActionButtonInteraction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventBackwardDefinitionTrackpadPowerState
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653250;
  v14[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("ActiveDurationMs");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("ReadyDurationMs");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLButtonAgent)init
{
  PLButtonAgent *v3;
  objc_super v5;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLButtonAgent;
    self = -[PLAgent init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  v3 = objc_alloc(MEMORY[0x1E0D80090]);
  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __41__PLButtonAgent_initOperatorDependancies__block_invoke;
  v14[3] = &unk_1E8578610;
  v14[4] = self;
  v5 = (void *)objc_msgSend(v3, "initWithOperator:withRegistration:withBlock:", self, &unk_1E864CB98, v14);
  -[PLButtonAgent setButtonSelectionChangedListener:](self, "setButtonSelectionChangedListener:", v5);

  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __41__PLButtonAgent_initOperatorDependancies__block_invoke_65;
  v13[3] = &unk_1E8578610;
  v13[4] = self;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864CBC0, v13);
  -[PLButtonAgent setButtonSelectionListener:](self, "setButtonSelectionListener:", v6);

  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __41__PLButtonAgent_initOperatorDependancies__block_invoke_69;
  v12[3] = &unk_1E8578610;
  v12[4] = self;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864CBE8, v12);
  -[PLButtonAgent setButtonInteractionListener:](self, "setButtonInteractionListener:", v7);

  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __41__PLButtonAgent_initOperatorDependancies__block_invoke_71;
  v11[3] = &unk_1E857D3E8;
  v11[4] = self;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFD8]), "initWithOperator:forUsagePage:andUsage:withBlock:", self, 11, 1, v11);
  -[PLButtonAgent setButtonEvent:](self, "setButtonEvent:", v8);

  if (objc_msgSend(MEMORY[0x1E0D80020], "isiPhone"))
  {
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __41__PLButtonAgent_initOperatorDependancies__block_invoke_2;
    v10[3] = &unk_1E857D3E8;
    v10[4] = self;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFD8]), "initWithOperator:forUsagePage:andUsage:withBlock:", self, 65280, 41, v10);
    -[PLButtonAgent setSmartCoverEvent:](self, "setSmartCoverEvent:", v9);

  }
}

void __41__PLButtonAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
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
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Action Button Selection Changed payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardActionButtonSelection:", v6);
}

void __41__PLButtonAgent_initOperatorDependancies__block_invoke_65(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
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
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Action Button Selection Daily payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardActionButtonSelection:", v6);
}

void __41__PLButtonAgent_initOperatorDependancies__block_invoke_69(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
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
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Action Button Interaction payload: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardActionButtonInteraction:", v6);
}

uint64_t __41__PLButtonAgent_initOperatorDependancies__block_invoke_71(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "logEventPointButton:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "logEventForwardSmartCover:", a2);
}

uint64_t __41__PLButtonAgent_initOperatorDependancies__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "logEventForwardSmartCover:", a2);
}

- (void)logEventPointButton:(__IOHIDEvent *)a3
{
  void *v4;
  uint64_t IntegerValue;
  uint64_t v6;
  uint64_t TimeStamp;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (IOHIDEventGetType() == 3 && IOHIDEventGetIntegerValue() == 12)
  {
    +[PLOperator entryKeyForType:andName:](PLButtonAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("Button"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    IntegerValue = IOHIDEventGetIntegerValue();
    v6 = IOHIDEventGetIntegerValue();
    TimeStamp = IOHIDEventGetTimeStamp();
    v8 = mach_absolute_time();
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v8);
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", TimeStamp);
    objc_msgSend(v9, "dateByAddingTimeInterval:", -(v11 - v12));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v4, v13);
    PLLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v18 = 134217984;
      v19 = IntegerValue;
      _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "Button event: State %llu", (uint8_t *)&v18, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", IntegerValue);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("ButtonType"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("EventType"));

    -[PLOperator logEntry:](self, "logEntry:", v14);
  }
}

- (void)logEventForwardActionButtonInteraction:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  id v10;

  v4 = *MEMORY[0x1E0D80378];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLButtonAgent, "entryKeyForType:andName:", v4, CFSTR("ActionButtonInteraction"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v10);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PLButtonAgent interactionTypeStringToEnum:](self, "interactionTypeStringToEnum:", v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("type"));

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventForwardActionButtonSelection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  +[PLOperator entryKeyForType:andName:](PLButtonAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("ActionButtonSelection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v11);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("action"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsString:", CFSTR("Camera")) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("action"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "containsString:", CFSTR("Focus"));

  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("param_value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v7)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("param_value"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("sub-action"));

  }
  -[PLOperator logEntry:](self, "logEntry:", v5);

}

- (void)logEventForwardSmartCover:(__IOHIDEvent *)a3
{
  void *v4;
  uint64_t IntegerValue;
  NSObject *v6;
  uint64_t TimeStamp;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (IOHIDEventGetType() == 3 && IOHIDEventGetIntegerValue() == 65289)
  {
    +[PLOperator entryKeyForType:andName:](PLButtonAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("CoverState"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    IntegerValue = IOHIDEventGetIntegerValue();
    PLLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v18 = 134217984;
      v19 = IntegerValue;
      _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "SmartCover event: State %llu", (uint8_t *)&v18, 0xCu);
    }

    TimeStamp = IOHIDEventGetTimeStamp();
    v8 = mach_absolute_time();
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v8);
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", TimeStamp);
    objc_msgSend(v9, "dateByAddingTimeInterval:", -(v11 - v12));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withDate:", v4, v13);
    v15 = IOHIDEventGetIntegerValue();
    if (v15 == 1)
    {
      v16 = &unk_1E8633870;
    }
    else
    {
      if (v15 != 16)
      {
LABEL_10:

        return;
      }
      v16 = &unk_1E8633888;
    }
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("Side"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", IntegerValue);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("State"));

    -[PLOperator logEntry:](self, "logEntry:", v14);
    goto LABEL_10;
  }
}

- (int64_t)interactionTypeStringToEnum:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Pressed")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LongPressed")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Suppressed")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (PLXPCListenerOperatorComposition)buttonSelectionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setButtonSelectionListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLXPCListenerOperatorComposition)buttonSelectionChangedListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setButtonSelectionChangedListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLXPCListenerOperatorComposition)buttonInteractionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setButtonInteractionListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLHIDEventOperatorComposition)buttonEvent
{
  return (PLHIDEventOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setButtonEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLHIDEventOperatorComposition)smartCoverEvent
{
  return (PLHIDEventOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSmartCoverEvent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartCoverEvent, 0);
  objc_storeStrong((id *)&self->_buttonEvent, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
  objc_storeStrong((id *)&self->_buttonInteractionListener, 0);
  objc_storeStrong((id *)&self->_buttonSelectionChangedListener, 0);
  objc_storeStrong((id *)&self->_buttonSelectionListener, 0);
}

@end
