@implementation WFScanPerformanceEvent

- (WFScanPerformanceEvent)initWithScanReason:(unint64_t)a3 timeElasped:(unint64_t)a4 firstScan:(BOOL)a5 results:(unint64_t)a6 errorCode:(int64_t)a7 lowPriority:(BOOL)a8 rssiFilter:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v12;
  WFScanPerformanceEvent *v15;
  WFScanPerformanceEvent *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSDictionary *eventDictionary;
  objc_super v29;
  _QWORD v30[8];
  _QWORD v31[10];

  v9 = a8;
  v12 = a5;
  v31[8] = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)WFScanPerformanceEvent;
  v15 = -[WFScanPerformanceEvent init](&v29, sel_init);
  v16 = v15;
  if (v15)
  {
    v30[0] = CFSTR("reason");
    -[WFScanPerformanceEvent _scanReasonToString:](v15, "_scanReasonToString:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v17;
    v30[1] = CFSTR("duration");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v18;
    v30[2] = CFSTR("results");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v19;
    v30[3] = CFSTR("firstScan");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v20;
    v30[4] = CFSTR("errorCode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31[4] = v21;
    v30[5] = CFSTR("lowPriority");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[5] = v22;
    v30[6] = CFSTR("rssiFilter");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[6] = v23;
    v30[7] = CFSTR("process");
    +[WFMetricsManager sharedManager](WFMetricsManager, "sharedManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "processName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31[7] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 8);
    v26 = objc_claimAutoreleasedReturnValue();
    eventDictionary = v16->_eventDictionary;
    v16->_eventDictionary = (NSDictionary *)v26;

  }
  return v16;
}

- (id)_scanReasonToString:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("unknown");
  else
    return off_24DC35610[a3];
}

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.wifi.ui.scanperf");
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
