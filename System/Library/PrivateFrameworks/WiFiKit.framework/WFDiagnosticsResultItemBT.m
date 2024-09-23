@implementation WFDiagnosticsResultItemBT

- (WFDiagnosticsResultItemBT)initWithResults:(id)a3
{
  id v4;
  WFDiagnosticsResultItemBT *v5;
  void *v6;
  void *v7;
  WFDiagnosticsResultItemBT *v8;
  id v9;
  uint64_t v10;
  WFDiagnosticsResultItemBT *i;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  void *v15;
  void *v16;
  NSArray *failedTests;
  int IsChinaDevice;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  NSArray *v25;
  uint8_t v27[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)WFDiagnosticsResultItemBT;
  v5 = -[WFDiagnosticsResultItemBT init](&v32, sel_init);
  objc_msgSend(v4, "btDiagnosticsResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDiagnosticsResultItemBT setResults:](v5, "setResults:", v6);

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[WFDiagnosticsResultItemBT results](v5, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (WFDiagnosticsResultItemBT *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v8; i = (WFDiagnosticsResultItemBT *)((char *)i + 1))
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "testID") == 19)
        {
          if (v9)
          {
            WFLogForCategory(0);
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
            {
              *(_WORD *)v27 = 0;
              _os_log_impl(&dword_219FC8000, v13, v14, "Multiple BTConnected results found!", v27, 2u);
            }

            goto LABEL_18;
          }
          v9 = v12;
        }
      }
      v8 = (WFDiagnosticsResultItemBT *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v8)
        continue;
      break;
    }

    if (!v9)
    {
      v8 = 0;
      goto LABEL_26;
    }
LABEL_18:
    objc_msgSend(v9, "info");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("BTConnectedCount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDiagnosticsResultItemBT setDidPassTest:](v5, "setDidPassTest:", (int)objc_msgSend(v16, "intValue") < 5);

    failedTests = v5->_failedTests;
    v5->_failedTests = (NSArray *)MEMORY[0x24BDBD1A8];

    WFCurrentDeviceCapability();
    IsChinaDevice = WFCapabilityIsChinaDevice();
    if (!-[WFDiagnosticsResultItemBT didPassTest](v5, "didPassTest"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsBTResultTitle"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFDiagnosticsResultItemBT setTitle:](v5, "setTitle:", v20);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (IsChinaDevice)
        v23 = CFSTR("kWFLocDiagnosticsBTResultDetailDescription_CH");
      else
        v23 = CFSTR("kWFLocDiagnosticsBTResultDetailDescription");
      objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFDiagnosticsResultItemBT setSuggestion:](v5, "setSuggestion:", v24);

      v25 = v5->_failedTests;
      v5->_failedTests = (NSArray *)&unk_24DC5DC18;

    }
    v8 = v5;
  }
  else
  {
    v9 = v7;
  }

LABEL_26:
  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (BOOL)didPassTest
{
  return self->_didPassTest;
}

- (void)setDidPassTest:(BOOL)a3
{
  self->_didPassTest = a3;
}

- (NSArray)failedTests
{
  return self->_failedTests;
}

- (void)setFailedTests:(id)a3
{
  objc_storeStrong((id *)&self->_failedTests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedTests, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
