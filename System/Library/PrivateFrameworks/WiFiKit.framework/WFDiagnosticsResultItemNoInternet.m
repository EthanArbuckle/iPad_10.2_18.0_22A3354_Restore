@implementation WFDiagnosticsResultItemNoInternet

- (WFDiagnosticsResultItemNoInternet)initWithResults:(id)a3
{
  id v4;
  WFDiagnosticsResultItemNoInternet *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  WFDiagnosticsResultItemNoInternet *v17;
  os_log_type_t v18;
  uint8_t v20[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WFDiagnosticsResultItemNoInternet;
  v5 = -[WFDiagnosticsResultItemNoInternet init](&v25, sel_init);
  objc_msgSend(v4, "noInternetDiagnosticsResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDiagnosticsResultItemNoInternet setResults:](v5, "setResults:", v6);

  v7 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[WFDiagnosticsResultItemNoInternet results](v5, "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v22;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v12)
        objc_enumerationMutation(v8);
      v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
      if (objc_msgSend(v14, "testID") == 11)
      {
        if (v11)
        {
          WFLogForCategory(0);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = OSLogForWFLogLevel(1uLL);
          if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
          {
            *(_WORD *)v20 = 0;
            _os_log_impl(&dword_219FC8000, v15, v16, "Multiple RetrieveAppleDisallowCellular results found!", v20, 2u);
          }

          goto LABEL_18;
        }
        v11 = v14;
      }
      if (v10 == ++v13)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v10)
          goto LABEL_3;

        if (!v11)
          goto LABEL_22;
LABEL_18:
        if ((-[NSObject didPass](v11, "didPass") & 1) == 0)
          objc_msgSend(v7, "addObject:", &unk_24DC5D7F8);
        objc_storeStrong((id *)&v5->_failedTests, v7);
        -[WFDiagnosticsResultItemNoInternet setDidPassTest:](v5, "setDidPassTest:", -[NSObject didPass](v11, "didPass"));
        v17 = v5;
        goto LABEL_27;
      }
    }
  }

LABEL_22:
  WFLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  v18 = OSLogForWFLogLevel(1uLL);
  v17 = 0;
  if (WFCurrentLogLevel() && v11)
  {
    if (os_log_type_enabled(v11, v18))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_219FC8000, v11, v18, "No Internet tests didn't have complete test results!", v20, 2u);
    }
    v17 = 0;
  }
LABEL_27:

  return v17;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
