@implementation WFScanSessionEvent

+ (id)scanSessionEventWithSectionCounts:(id)a3 duration:(double)a4
{
  id v5;
  WFScanSessionEvent *v6;

  v5 = a3;
  v6 = -[WFScanSessionEvent initWithScanSectionCounts:duration:]([WFScanSessionEvent alloc], "initWithScanSectionCounts:duration:", v5, a4);

  return v6;
}

- (WFScanSessionEvent)initWithScanSectionCounts:(id)a3 duration:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *eventDictionary;
  void *v11;
  void *v12;
  void *v13;
  NSDictionary *v14;
  NSDictionary *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v17[0] = CFSTR("duration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[WFScanSessionEvent _durationBucketFromTimeInterval:](self, "_durationBucketFromTimeInterval:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("sections");
  v18[0] = v7;
  -[WFScanSessionEvent _sectionCountsToJSONString:](self, "_sectionCountsToJSONString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  eventDictionary = self->_eventDictionary;
  self->_eventDictionary = v9;

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "keysSortedByValueUsingComparator:", &__block_literal_global);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (NSDictionary *)-[NSDictionary mutableCopy](self->_eventDictionary, "mutableCopy");
    -[NSDictionary setObject:forKey:](v14, "setObject:forKey:", v13, CFSTR("maxCount"));
    -[NSDictionary setObject:forKey:](v14, "setObject:forKey:", v12, CFSTR("maxSection"));
    v15 = self->_eventDictionary;
    self->_eventDictionary = v14;

  }
  return self;
}

uint64_t __57__WFScanSessionEvent_initWithScanSectionCounts_duration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (unint64_t)_durationBucketFromTimeInterval:(double)a3
{
  if (a3 > 10.0 && a3 < 30.0)
    return 1;
  if (a3 > 30.0 && a3 < 60.0)
    return 2;
  if (a3 > 60.0)
    return 3;
  return 0;
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
        v13 = "-[WFScanSessionEvent _sectionCountsToJSONString:]";
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

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.wifi.ui.scanlist");
}

- (NSDictionary)eventDictionary
{
  return self->_eventDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->eventName, 0);
  objc_storeStrong((id *)&self->_eventDictionary, 0);
}

@end
