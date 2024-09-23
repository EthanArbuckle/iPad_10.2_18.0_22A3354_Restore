@implementation WFDiagnosticsEvent

- (WFDiagnosticsEvent)initWithDiagnosticsEventType:(int64_t)a3 didPassTest:(BOOL)a4 failedTests:(id)a5
{
  _BOOL8 v5;
  id v8;
  WFDiagnosticsEvent *v9;
  WFDiagnosticsEvent *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDictionary *eventDictionary;
  objc_super v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v5 = a4;
  v19[3] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WFDiagnosticsEvent;
  v9 = -[WFDiagnosticsEvent init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    v18[0] = CFSTR("testType");
    -[WFDiagnosticsEvent _testTypeToString:](v9, "_testTypeToString:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v11;
    v18[1] = CFSTR("testDidPass");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v12;
    v18[2] = CFSTR("failedTests");
    objc_msgSend(v8, "numberArrayToJsonString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v14 = objc_claimAutoreleasedReturnValue();
    eventDictionary = v10->_eventDictionary;
    v10->_eventDictionary = (NSDictionary *)v14;

  }
  return v10;
}

- (id)_testTypeToString:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("unknown");
  else
    return off_24DC361A8[a3];
}

- (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.wifi.ui.diagnosticsevent");
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
