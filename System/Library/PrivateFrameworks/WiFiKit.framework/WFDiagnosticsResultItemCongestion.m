@implementation WFDiagnosticsResultItemCongestion

- (WFDiagnosticsResultItemCongestion)initWithResults:(id)a3
{
  id v4;
  WFDiagnosticsResultItemCongestion *v5;
  void *v6;
  void *v7;
  WFDiagnosticsResultItemCongestion *v8;
  id v9;
  uint64_t v10;
  WFDiagnosticsResultItemCongestion *i;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  NSArray *failedTests;
  int IsChinaDevice;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  uint8_t v25[16];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)WFDiagnosticsResultItemCongestion;
  v5 = -[WFDiagnosticsResultItemCongestion init](&v30, sel_init);
  objc_msgSend(v4, "congestionDiagnosticsResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDiagnosticsResultItemCongestion setResults:](v5, "setResults:", v6);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[WFDiagnosticsResultItemCongestion results](v5, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (WFDiagnosticsResultItemCongestion *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v8; i = (WFDiagnosticsResultItemCongestion *)((char *)i + 1))
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "testID") == 24)
        {
          if (v9)
          {
            WFLogForCategory(0);
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v14))
            {
              *(_WORD *)v25 = 0;
              _os_log_impl(&dword_219FC8000, v13, v14, "Multiple channel congestion results found!", v25, 2u);
            }

            goto LABEL_18;
          }
          v9 = v12;
        }
      }
      v8 = (WFDiagnosticsResultItemCongestion *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
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
    -[WFDiagnosticsResultItemCongestion setDidPassTest:](v5, "setDidPassTest:", objc_msgSend(v9, "didPass"));
    failedTests = v5->_failedTests;
    v5->_failedTests = (NSArray *)MEMORY[0x24BDBD1A8];

    WFCurrentDeviceCapability();
    IsChinaDevice = WFCapabilityIsChinaDevice();
    if (!-[WFDiagnosticsResultItemCongestion didPassTest](v5, "didPassTest"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (IsChinaDevice)
        v19 = CFSTR("kWFLocDiagnosticsCongestionResultTitle_CH");
      else
        v19 = CFSTR("kWFLocDiagnosticsCongestionResultTitle");
      objc_msgSend(v17, "localizedStringForKey:value:table:", v19, &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFDiagnosticsResultItemCongestion setTitle:](v5, "setTitle:", v20);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsCongestionResultDetailDescription"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFDiagnosticsResultItemCongestion setSuggestion:](v5, "setSuggestion:", v22);

      v23 = v5->_failedTests;
      v5->_failedTests = (NSArray *)&unk_24DC5DB58;

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
