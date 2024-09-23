@implementation WFHealthUIEvent

- (WFHealthUIEvent)initWithEventType:(int64_t)a3 issues:(id)a4 ssid:(id)a5 securityType:(int64_t)a6 testTimes:(int64_t)a7 didPassTest:(BOOL)a8 failedTests:(id)a9
{
  _BOOL8 v9;
  id v15;
  id v16;
  WFHealthUIEvent *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSDictionary *eventDictionary;
  WFHealthUIEvent *v33;
  os_log_type_t v35;
  const char *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[16];
  objc_super v44;
  _QWORD v45[7];
  _QWORD v46[7];
  _BYTE v47[128];
  uint64_t v48;

  v9 = a8;
  v48 = *MEMORY[0x24BDAC8D0];
  v15 = a4;
  v16 = a9;
  v44.receiver = self;
  v44.super_class = (Class)WFHealthUIEvent;
  v17 = -[WFHealthUIEvent init](&v44, sel_init);
  if (!v17)
  {
    v33 = 0;
    goto LABEL_15;
  }
  if (!v15)
  {
    WFLogForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    v35 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v25 || !os_log_type_enabled(v25, v35))
      goto LABEL_26;
    *(_WORD *)buf = 0;
    v36 = "Missing WFHealthIssues for WFHealthUIEvent";
    goto LABEL_25;
  }
  if (a5)
  {
    v37 = v16;
    v38 = v15;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v18 = v15;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v19)
    {
      v20 = v19;
      v21 = 0;
      v22 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v40 != v22)
            objc_enumerationMutation(v18);
          v21 |= objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "type", v37);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v20);
    }
    else
    {
      v21 = 0;
    }

    v45[0] = CFSTR("type");
    -[WFHealthUIEvent _eventTypeStringForType:](v17, "_eventTypeStringForType:", a3);
    v24 = objc_claimAutoreleasedReturnValue();
    v46[0] = v24;
    v45[1] = CFSTR("issues");
    -[WFHealthUIEvent _issuesToJSONString:](v17, "_issuesToJSONString:", v18);
    v25 = objc_claimAutoreleasedReturnValue();
    v46[1] = v25;
    v45[2] = CFSTR("issueBitMask");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v26;
    v45[3] = CFSTR("securityType");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v27;
    v45[4] = CFSTR("didRunVelocityTests");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a7 > 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46[4] = v28;
    v45[5] = CFSTR("didPassVelocityTests");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v46[5] = v29;
    v45[6] = CFSTR("failedVelocityTests");
    v16 = v37;
    objc_msgSend(v37, "numberArrayToJsonString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v46[6] = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 7);
    v31 = objc_claimAutoreleasedReturnValue();
    eventDictionary = v17->_eventDictionary;
    v17->_eventDictionary = (NSDictionary *)v31;

    v15 = v38;
    goto LABEL_14;
  }
  WFLogForCategory(0);
  v25 = objc_claimAutoreleasedReturnValue();
  v35 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v25 && os_log_type_enabled(v25, v35))
  {
    *(_WORD *)buf = 0;
    v36 = "Missing ssid for WFHealthUIEvent";
LABEL_25:
    _os_log_impl(&dword_219FC8000, v25, v35, v36, buf, 2u);
  }
LABEL_26:
  v24 = (uint64_t)v17;
  v17 = 0;
LABEL_14:
  v33 = v17;

  v17 = (WFHealthUIEvent *)v24;
LABEL_15:

  return v33;
}

+ (id)subtitleEventWithIssues:(id)a3 ssid:(id)a4 securityType:(int64_t)a5
{
  id v7;
  id v8;
  WFHealthUIEvent *v9;
  WFHealthUIEvent *v10;

  v7 = a4;
  v8 = a3;
  v9 = [WFHealthUIEvent alloc];
  v10 = -[WFHealthUIEvent initWithEventType:issues:ssid:securityType:testTimes:didPassTest:failedTests:](v9, "initWithEventType:issues:ssid:securityType:testTimes:didPassTest:failedTests:", 1, v8, v7, a5, 0, 0, MEMORY[0x24BDBD1A8]);

  return v10;
}

+ (id)detailEventWithIssues:(id)a3 ssid:(id)a4 securityType:(int64_t)a5
{
  id v7;
  id v8;
  WFHealthUIEvent *v9;
  WFHealthUIEvent *v10;

  v7 = a4;
  v8 = a3;
  v9 = [WFHealthUIEvent alloc];
  v10 = -[WFHealthUIEvent initWithEventType:issues:ssid:securityType:testTimes:didPassTest:failedTests:](v9, "initWithEventType:issues:ssid:securityType:testTimes:didPassTest:failedTests:", 2, v8, v7, a5, 0, 0, MEMORY[0x24BDBD1A8]);

  return v10;
}

+ (id)tapLinkEventWithIssues:(id)a3 ssid:(id)a4 securityType:(int64_t)a5
{
  id v7;
  id v8;
  WFHealthUIEvent *v9;
  WFHealthUIEvent *v10;

  v7 = a4;
  v8 = a3;
  v9 = [WFHealthUIEvent alloc];
  v10 = -[WFHealthUIEvent initWithEventType:issues:ssid:securityType:testTimes:didPassTest:failedTests:](v9, "initWithEventType:issues:ssid:securityType:testTimes:didPassTest:failedTests:", 3, v8, v7, a5, 0, 0, MEMORY[0x24BDBD1A8]);

  return v10;
}

+ (id)noInternetEventWithTestTimes:(int64_t)a3 didPassTest:(BOOL)a4 failedVelocityTests:(id)a5 ssid:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  WFHealthUIEvent *v11;
  void *v12;
  void *v13;
  void *v14;
  WFHealthUIEvent *v15;

  v7 = a4;
  v9 = a6;
  v10 = a5;
  v11 = [WFHealthUIEvent alloc];
  v12 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BEC2958], "issueWithType:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[WFHealthUIEvent initWithEventType:issues:ssid:securityType:testTimes:didPassTest:failedTests:](v11, "initWithEventType:issues:ssid:securityType:testTimes:didPassTest:failedTests:", 4, v14, v9, -1, a3, v7, v10);

  return v15;
}

- (id)_issuesToJSONString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  __CFString *v13;
  NSObject *v14;
  os_log_type_t v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "typeString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v7);
  }

  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v4, 0, &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;
  if (v11)
  {
    v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v11, 4);
  }
  else
  {
    WFLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "-[WFHealthUIEvent _issuesToJSONString:]";
      v24 = 2112;
      v25 = v3;
      _os_log_impl(&dword_219FC8000, v14, v15, "%s: failed to create json from dictionary %@", buf, 0x16u);
    }

    v13 = &stru_24DC36C30;
  }

  return v13;
}

- (id)_eventTypeStringForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("unknown");
  else
    return off_24DC35F90[a3 - 1];
}

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.wifi.ui.health");
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
