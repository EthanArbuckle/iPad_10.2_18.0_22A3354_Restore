@implementation WFDiagnosticsResultItemAWDL

- (WFDiagnosticsResultItemAWDL)initWithResults:(id)a3
{
  id v4;
  WFDiagnosticsResultItemAWDL *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  _BOOL4 v27;
  uint64_t v28;
  WFDiagnosticsResultItemAWDL *v29;
  int IsChinaDevice;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[16];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)WFDiagnosticsResultItemAWDL;
  v5 = -[WFDiagnosticsResultItemAWDL init](&v49, sel_init);
  objc_msgSend(v4, "awdlDiagnosticsResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDiagnosticsResultItemAWDL setResults:](v5, "setResults:", v6);

  v7 = (void *)objc_opt_new();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[WFDiagnosticsResultItemAWDL results](v5, "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v46;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v46 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        if (objc_msgSend(v14, "testID") == 21)
        {
          if (v11)
          {
            WFLogForCategory(0);
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_219FC8000, v15, v16, "Multiple AWDLEnabled results found!", buf, 2u);
            }

            goto LABEL_18;
          }
          v11 = v14;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_18:

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[WFDiagnosticsResultItemAWDL results](v5, "results", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v41;
    while (2)
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v41 != v21)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
        if (objc_msgSend(v23, "testID") == 22)
        {
          if (v20)
          {
            WFLogForCategory(0);
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = OSLogForWFLogLevel(1uLL);
            if (WFCurrentLogLevel() && v24 && os_log_type_enabled(v24, v25))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_219FC8000, v24, v25, "Multiple AWDL real time mode results found!", buf, 2u);
            }

            v26 = v11 != 0;
            v27 = 1;
            goto LABEL_36;
          }
          v20 = v23;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
      if (v19)
        continue;
      break;
    }
  }
  else
  {
    v20 = 0;
  }

  v26 = v11 != 0;
  v27 = v20 != 0;
  if (v11 | v20)
  {
LABEL_36:
    if (objc_msgSend((id)v11, "didPass"))
      objc_msgSend(v7, "addObject:", &unk_24DC5D708);
    if (objc_msgSend((id)v20, "didPass"))
      objc_msgSend(v7, "addObject:", &unk_24DC5D720);
    objc_storeStrong((id *)&v5->_failedTests, v7);
    if (v26 && v27 && (objc_msgSend((id)v11, "didPass") & 1) == 0)
      v28 = objc_msgSend((id)v20, "didPass") ^ 1;
    else
      v28 = 0;
    -[WFDiagnosticsResultItemAWDL setDidPassTest:](v5, "setDidPassTest:", v28);
    WFCurrentDeviceCapability();
    IsChinaDevice = WFCapabilityIsChinaDevice();
    if (!-[WFDiagnosticsResultItemAWDL didPassTest](v5, "didPassTest"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (IsChinaDevice)
      {
        objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsAWDLResultTitle_CH"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFDiagnosticsResultItemAWDL setTitle:](v5, "setTitle:", v33);

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        v36 = CFSTR("kWFLocDiagnosticsAWDLResultDetailDescription_CH");
      }
      else
      {
        objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("kWFLocDiagnosticsAWDLResultTitle"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFDiagnosticsResultItemAWDL setTitle:](v5, "setTitle:", v37);

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        v36 = CFSTR("kWFLocDiagnosticsAWDLResultDetailDescription");
      }
      objc_msgSend(v34, "localizedStringForKey:value:table:", v36, &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFDiagnosticsResultItemAWDL setSuggestion:](v5, "setSuggestion:", v38);

    }
    v29 = v5;
  }
  else
  {
    v20 = 0;
    v29 = 0;
  }

  return v29;
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
