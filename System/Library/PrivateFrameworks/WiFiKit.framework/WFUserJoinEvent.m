@implementation WFUserJoinEvent

+ (id)joinEventWithSecurity:(int64_t)a3 error:(int64_t)a4 sectionCounts:(id)a5 sectionName:(id)a6 didRun:(BOOL)a7 didPass:(BOOL)a8 failedTests:(id)a9
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  WFUserJoinEvent *v18;
  uint64_t v20;

  v10 = a7;
  v15 = a9;
  v16 = a6;
  v17 = a5;
  LOBYTE(v20) = a8;
  v18 = -[WFUserJoinEvent initWithType:security:error:sectionCounts:sectionName:didRunVelocityTests:didPassVelocityTests:failedTests:]([WFUserJoinEvent alloc], "initWithType:security:error:sectionCounts:sectionName:didRunVelocityTests:didPassVelocityTests:failedTests:", 0, a3, a4, v17, v16, v10, v20, v15);

  return v18;
}

+ (id)joinEventWithType:(int64_t)a3 security:(int64_t)a4 error:(int64_t)a5 didRun:(BOOL)a6 didPass:(BOOL)a7 failedTests:(id)a8
{
  _BOOL8 v9;
  id v13;
  WFUserJoinEvent *v14;
  uint64_t v16;

  v9 = a6;
  v13 = a8;
  LOBYTE(v16) = a7;
  v14 = -[WFUserJoinEvent initWithType:security:error:sectionCounts:sectionName:didRunVelocityTests:didPassVelocityTests:failedTests:]([WFUserJoinEvent alloc], "initWithType:security:error:sectionCounts:sectionName:didRunVelocityTests:didPassVelocityTests:failedTests:", a3, a4, a5, 0, 0, v9, v16, v13);

  return v14;
}

- (WFUserJoinEvent)initWithType:(int64_t)a3 security:(int64_t)a4 error:(int64_t)a5 sectionCounts:(id)a6 sectionName:(id)a7 didRunVelocityTests:(BOOL)a8 didPassVelocityTests:(BOOL)a9 failedTests:(id)a10
{
  _BOOL8 v10;
  id v16;
  __CFString *v17;
  WFUserJoinEvent *v18;
  WFUserJoinEvent *v19;
  uint64_t v20;
  _BOOL8 v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSDictionary *eventDictionary;
  void *v35;
  void *v36;
  id v37;
  objc_super v38;
  _QWORD v39[9];
  _QWORD v40[11];

  v10 = a8;
  v40[9] = *MEMORY[0x24BDAC8D0];
  v16 = a6;
  v17 = (__CFString *)a7;
  v37 = a10;
  v38.receiver = self;
  v38.super_class = (Class)WFUserJoinEvent;
  v18 = -[WFUserJoinEvent init](&v38, sel_init);
  v19 = v18;
  if (v18)
  {
    v39[0] = CFSTR("type");
    -[WFUserJoinEvent _eventTypeStringForType:](v18, "_eventTypeStringForType:", a3);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v36;
    v39[1] = CFSTR("errorCode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v35;
    v39[2] = CFSTR("securityType");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v10;
    v22 = (void *)v20;
    v23 = &stru_24DC36C30;
    if (v17)
      v23 = v17;
    v40[2] = v20;
    v40[3] = v23;
    v39[3] = CFSTR("value");
    v39[4] = CFSTR("context");
    -[WFUserJoinEvent _sectionCountsToJSONString:](v19, "_sectionCountsToJSONString:", v16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v40[4] = v24;
    v39[5] = CFSTR("process");
    +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "processName");
    v26 = v17;
    v27 = v16;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v40[5] = v28;
    v39[6] = CFSTR("didRunVelocityTests");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v21);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v40[6] = v29;
    v39[7] = CFSTR("didPassVelocityTests");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v40[7] = v30;
    v39[8] = CFSTR("failedVelocityTests");
    objc_msgSend(v37, "numberArrayToJsonString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v40[8] = v31;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 9);
    v32 = objc_claimAutoreleasedReturnValue();
    eventDictionary = v19->_eventDictionary;
    v19->_eventDictionary = (NSDictionary *)v32;

    v16 = v27;
    v17 = v26;

  }
  return v19;
}

- (id)_sectionCountsToJSONString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  os_log_type_t v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v3, 0, &v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    if (v4)
    {
      v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);
    }
    else
    {
      WFLogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[WFUserJoinEvent _sectionCountsToJSONString:]";
        v14 = 2112;
        v15 = v3;
        _os_log_impl(&dword_219FC8000, v8, v9, "%s: failed to create json from dictionary %@", buf, 0x16u);
      }

      v6 = &stru_24DC36C30;
    }
    v7 = v6;

  }
  else
  {
    v7 = &stru_24DC36C30;
  }

  return v7;
}

- (id)_eventTypeStringForType:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("unknown");
  else
    return off_24DC360B0[a3];
}

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.wifi.ui.event");
}

- (NSDictionary)eventDictionary
{
  return self->_eventDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventDictionary, 0);
}

@end
