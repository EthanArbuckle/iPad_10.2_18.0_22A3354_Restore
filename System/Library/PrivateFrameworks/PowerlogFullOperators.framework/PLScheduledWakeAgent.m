@implementation PLScheduledWakeAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLScheduledWakeAgent;
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
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)entryEventForwardDefinitions
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
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[2];
  _QWORD v19[2];
  const __CFString *v20;
  _QWORD v21[3];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v20 = CFSTR("ScheduledEvent");
  v18[0] = *MEMORY[0x24BE751D0];
  v2 = *MEMORY[0x24BE751C0];
  v16[0] = *MEMORY[0x24BE751F8];
  v16[1] = v2;
  v17[0] = &unk_24EB64780;
  v17[1] = &unk_24EB64AA8;
  v16[2] = *MEMORY[0x24BE751B8];
  v17[2] = &unk_24EB64AC0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v3;
  v18[1] = *MEMORY[0x24BE751E8];
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance", CFSTR("EventTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_DateFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v14[1] = CFSTR("Type");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  v14[2] = CFSTR("AppName");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_StringFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
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

- (PLScheduledWakeAgent)init
{
  PLScheduledWakeAgent *v2;
  uint64_t v3;
  NSMutableDictionary *previousScheduleWakeEvents;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLScheduledWakeAgent;
  v2 = -[PLAgent init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    previousScheduleWakeEvents = v2->_previousScheduleWakeEvents;
    v2->_previousScheduleWakeEvents = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)initOperatorDependancies
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x24BE74FE0], "sharedSemaphoreForKey:", *MEMORY[0x24BE75190]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLScheduledWakeAgent setCanSleepSemaphore:](self, "setCanSleepSemaphore:", v3);

  -[PLScheduledWakeAgent canSleepSemaphore](self, "canSleepSemaphore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signalInterestByObject:", self);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__PLScheduledWakeAgent_initOperatorDependancies__block_invoke;
  v6[3] = &unk_24EB5CDA0;
  v6[4] = self;
  objc_msgSend(MEMORY[0x24BE74FC8], "canSleepEntryNotificationWithOperator:withBlock:", self, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLScheduledWakeAgent setCanSleepNotification:](self, "setCanSleepNotification:", v5);

}

uint64_t __48__PLScheduledWakeAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "log");
}

- (void)logEventForwardScheduledEvent
{
  uint64_t v2;
  CFArrayRef v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  const __CFArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFArray *obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD block[5];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  void *v56;
  void *v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  +[PLOperator entryKeyForType:andName:](PLScheduledWakeAgent, "entryKeyForType:andName:", *MEMORY[0x24BE75218], CFSTR("ScheduledEvent"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = IOPMCopyScheduledPowerEvents();
  v41 = (void *)v2;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __53__PLScheduledWakeAgent_logEventForwardScheduledEvent__block_invoke;
    v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v55[4] = v4;
    if (logEventForwardScheduledEvent_defaultOnce != -1)
      dispatch_once(&logEventForwardScheduledEvent_defaultOnce, v55);
    if (logEventForwardScheduledEvent_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ signaling done"), self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLScheduledWakeAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLScheduledWakeAgent logEventForwardScheduledEvent]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 120);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAWDNetworkUsage handleNameConnectionCallback:].cold.1((uint64_t)v5, v10);

      v2 = (uint64_t)v41;
    }
  }
  -[PLScheduledWakeAgent canSleepSemaphore](self, "canSleepSemaphore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "signalDoneByObject:", self);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v3;
  v12 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v52;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v52 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v15);
        objc_msgSend(v16, "objectForKey:", CFSTR("time"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timeIntervalSinceNow");
        if (v18 >= 0.0)
        {
          objc_msgSend(v16, "objectForKey:", CFSTR("scheduledby"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLScheduledWakeAgent previousScheduleWakeEvents](self, "previousScheduleWakeEvents");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "valueForKey:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21 && objc_msgSend(v21, "isEqualToDate:", v17))
          {
            if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
            {
              v22 = objc_opt_class();
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __53__PLScheduledWakeAgent_logEventForwardScheduledEvent__block_invoke_38;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              block[4] = v22;
              if (logEventForwardScheduledEvent_defaultOnce_36 != -1)
                dispatch_once(&logEventForwardScheduledEvent_defaultOnce_36, block);
              if (logEventForwardScheduledEvent_classDebugEnabled_37)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Skip logging event %@"), v16);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = (void *)MEMORY[0x24BE74FA8];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLScheduledWakeAgent.m");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "lastPathComponent");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLScheduledWakeAgent logEventForwardScheduledEvent]");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v25, v26, 136);

                PLLogCommon();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v60 = v23;
                  _os_log_debug_impl(&dword_222C6D000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
                v2 = (uint64_t)v41;
LABEL_24:

              }
            }

            goto LABEL_26;
          }
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v2);
          objc_msgSend(v16, "objectForKey:", CFSTR("eventtype"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLScheduledWakeAgent humanReadableScheduledWakeString:](self, "humanReadableScheduledWakeString:", v28);
          v27 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "setObject:forKeyedSubscript:", v17, CFSTR("EventTime"));
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v27, CFSTR("Type"));
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v19, CFSTR("AppName"));
          objc_msgSend(v43, "addObject:", v23);
          goto LABEL_24;
        }
LABEL_26:

        ++v15;
      }
      while (v13 != v15);
      v13 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    }
    while (v13);
  }

  -[PLScheduledWakeAgent previousScheduleWakeEvents](self, "previousScheduleWakeEvents");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "removeAllObjects");

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v30 = obj;
  v31 = -[__CFArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v47 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v35, "objectForKey:", CFSTR("time"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "timeIntervalSinceNow");
        if (v37 >= 0.0)
        {
          objc_msgSend(v35, "objectForKey:", CFSTR("scheduledby"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLScheduledWakeAgent previousScheduleWakeEvents](self, "previousScheduleWakeEvents");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setValue:forKey:", v36, v38);

        }
      }
      v32 = -[__CFArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    }
    while (v32);
  }

  if (objc_msgSend(v43, "count"))
  {
    v56 = v41;
    v57 = v43;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v40, v41);
  }
  else
  {
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v41);
    objc_msgSend(v40, "setIsErrorEntry:", 1);
    objc_msgSend(v40, "setObject:forKeyedSubscript:", CFSTR("No scheduled events"), CFSTR("__PLEntryErrorString__"));
    -[PLOperator logEntry:](self, "logEntry:", v40);
  }

}

uint64_t __53__PLScheduledWakeAgent_logEventForwardScheduledEvent__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventForwardScheduledEvent_classDebugEnabled = result;
  return result;
}

uint64_t __53__PLScheduledWakeAgent_logEventForwardScheduledEvent__block_invoke_38(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventForwardScheduledEvent_classDebugEnabled_37 = result;
  return result;
}

- (id)humanReadableScheduledWakeString:(id)a3
{
  __CFString *v3;
  __CFString *v4;

  v3 = (__CFString *)a3;
  if (CFStringCompare(v3, CFSTR("wake"), 0))
  {
    if (CFStringCompare(v3, CFSTR("wakepoweron"), 0))
    {
      if (CFStringCompare(v3, CFSTR("poweron"), 0))
      {
        if (CFStringCompare(v3, CFSTR("sleep"), 0))
        {
          if (CFStringCompare(v3, CFSTR("shutdown"), 0))
          {
            if (CFStringCompare(v3, CFSTR("restart"), 0))
              v4 = v3;
            else
              v4 = CFSTR("Scheduled Restart");
          }
          else
          {
            v4 = CFSTR("Scheduled Shutdown");
          }
        }
        else
        {
          v4 = CFSTR("Scheduled Sleep");
        }
      }
      else
      {
        v4 = CFSTR("Power On from Off state");
      }
    }
    else
    {
      v4 = CFSTR("Scheduled Wake or Power On");
    }
  }
  else
  {
    v4 = CFSTR("Scheduled Wake");
  }

  return v4;
}

- (PLEntryNotificationOperatorComposition)canSleepNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCanSleepNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLSemaphore)canSleepSemaphore
{
  return (PLSemaphore *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCanSleepSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableDictionary)previousScheduleWakeEvents
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPreviousScheduleWakeEvents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousScheduleWakeEvents, 0);
  objc_storeStrong((id *)&self->_canSleepSemaphore, 0);
  objc_storeStrong((id *)&self->_canSleepNotification, 0);
}

@end
