@implementation PLPersistentConnectionAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLPersistentConnectionAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)railDefinitions
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)accountingGroupDefinitions
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)entryEventPointDefinitions
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
  _QWORD v13[3];
  _QWORD v14[3];
  uint64_t v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v19 = CFSTR("Cache");
  v17[0] = *MEMORY[0x24BE751D0];
  v15 = *MEMORY[0x24BE751F8];
  v16 = &unk_24EB64720;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  v17[1] = *MEMORY[0x24BE751E8];
  v13[0] = CFSTR("CacheId");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v13[1] = CFSTR("CacheInterval");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v13[2] = CFSTR("CacheAge");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventForwardDefinitions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  uint64_t v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v17 = CFSTR("Config");
  v15[0] = *MEMORY[0x24BE751D0];
  v13 = *MEMORY[0x24BE751F8];
  v14 = &unk_24EB64720;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v2;
  v15[1] = *MEMORY[0x24BE751E8];
  v11[0] = CFSTR("Enabled");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("PollingInterval");
  v12[0] = v4;
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (PLPersistentConnectionAgent)init
{
  PLPersistentConnectionAgent *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  PLPersistentConnectionAgent *v6;
  uint64_t v7;
  PLCFNotificationOperatorComposition *intervalChangedNotification;
  id v9;
  uint64_t v10;
  PLPersistentConnectionAgent *v11;
  uint64_t v12;
  PLCFNotificationOperatorComposition *preferencesChangedNotification;
  _QWORD v15[4];
  PLPersistentConnectionAgent *v16;
  _QWORD v17[4];
  PLPersistentConnectionAgent *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PLPersistentConnectionAgent;
  v2 = -[PLAgent init](&v19, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BE74FA0]);
    v4 = *MEMORY[0x24BE71A18];
    v5 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __35__PLPersistentConnectionAgent_init__block_invoke;
    v17[3] = &unk_24EB5CDA0;
    v6 = v2;
    v18 = v6;
    v7 = objc_msgSend(v3, "initWithOperator:forNotification:requireState:withBlock:", v6, v4, 0, v17);
    intervalChangedNotification = v6->_intervalChangedNotification;
    v6->_intervalChangedNotification = (PLCFNotificationOperatorComposition *)v7;

    v9 = objc_alloc(MEMORY[0x24BE74FA0]);
    v10 = *MEMORY[0x24BE71A30];
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __35__PLPersistentConnectionAgent_init__block_invoke_32;
    v15[3] = &unk_24EB5CDA0;
    v11 = v6;
    v16 = v11;
    v12 = objc_msgSend(v9, "initWithOperator:forNotification:requireState:withBlock:", v11, v10, 0, v15);
    preferencesChangedNotification = v11->_preferencesChangedNotification;
    v11->_preferencesChangedNotification = (PLCFNotificationOperatorComposition *)v12;

  }
  return v2;
}

uint64_t __35__PLPersistentConnectionAgent_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__PLPersistentConnectionAgent_init__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (kPLPersistentConnectionAgentCache_block_invoke_defaultOnce != -1)
      dispatch_once(&kPLPersistentConnectionAgentCache_block_invoke_defaultOnce, block);
    if (kPLPersistentConnectionAgentCache_block_invoke_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Interval changed"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPersistentConnectionAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLPersistentConnectionAgent init]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 102);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLPMUAgent init].cold.1((uint64_t)v3, v8, v9, v10, v11, v12, v13, v14);

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "log");
}

uint64_t __35__PLPersistentConnectionAgent_init__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLPersistentConnectionAgentCache_block_invoke_classDebugEnabled = result;
  return result;
}

uint64_t __35__PLPersistentConnectionAgent_init__block_invoke_32(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__PLPersistentConnectionAgent_init__block_invoke_2_33;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (kPLPersistentConnectionAgentCache_block_invoke_2_defaultOnce != -1)
      dispatch_once(&kPLPersistentConnectionAgentCache_block_invoke_2_defaultOnce, block);
    if (kPLPersistentConnectionAgentCache_block_invoke_2_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Preferences changed"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPersistentConnectionAgent.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLPersistentConnectionAgent init]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 108);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLPMUAgent init].cold.1((uint64_t)v3, v8, v9, v10, v11, v12, v13, v14);

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "log");
}

uint64_t __35__PLPersistentConnectionAgent_init__block_invoke_2_33(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLPersistentConnectionAgentCache_block_invoke_2_classDebugEnabled = result;
  return result;
}

- (BOOL)pushEnabled
{
  return PCSettingsGetClassPushEnabled() != 0;
}

- (int64_t)pollingInterval
{
  return (int)PCSettingsGetClassPollInterval();
}

- (void)log
{
  -[PLPersistentConnectionAgent logEventForwardConfig](self, "logEventForwardConfig");
  -[PLPersistentConnectionAgent logEventPointCache](self, "logEventPointCache");
}

- (void)logEventPointCache
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD block[5];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE719F8], "intervalCacheDictionaries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__PLPersistentConnectionAgent_logEventPointCache__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (logEventPointCache_defaultOnce != -1)
      dispatch_once(&logEventPointCache_defaultOnce, block);
    if (logEventPointCache_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cache = %@"), v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPersistentConnectionAgent.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLPersistentConnectionAgent logEventPointCache]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 139);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLPMUAgent init].cold.1((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);

    }
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v31 = v2;
  objc_msgSend(v2, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v35;
    v19 = *MEMORY[0x24BE75230];
    v20 = *MEMORY[0x24BE71A28];
    v21 = *MEMORY[0x24BE71A20];
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v35 != v18)
          objc_enumerationMutation(obj);
        v23 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        +[PLOperator entryKeyForType:andName:](PLPersistentConnectionAgent, "entryKeyForType:andName:", v19, CFSTR("Cache"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v24);
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v23, CFSTR("CacheId"));
        objc_msgSend(0, "objectForKey:", v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, CFSTR("CacheInterval"));

        v27 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(0, "objectForKey:", v21);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "timeIntervalSinceNow");
        objc_msgSend(v27, "numberWithDouble:", -v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v30, CFSTR("CacheAge"));

        -[PLOperator logEntry:](self, "logEntry:", v25);
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v17);
  }

}

uint64_t __49__PLPersistentConnectionAgent_logEventPointCache__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointCache_classDebugEnabled = result;
  return result;
}

- (void)logEventForwardConfig
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[PLOperator entryKeyForType:andName:](PLPersistentConnectionAgent, "entryKeyForType:andName:", *MEMORY[0x24BE75218], CFSTR("Config"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v6);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PLPersistentConnectionAgent pushEnabled](self, "pushEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Enabled"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[PLPersistentConnectionAgent pollingInterval](self, "pollingInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("PollingInterval"));

  -[PLOperator logEntry:](self, "logEntry:", v3);
}

- (PLCFNotificationOperatorComposition)intervalChangedNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (PLCFNotificationOperatorComposition)preferencesChangedNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferencesChangedNotification, 0);
  objc_storeStrong((id *)&self->_intervalChangedNotification, 0);
}

@end
