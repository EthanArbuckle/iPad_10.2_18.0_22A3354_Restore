@implementation WFDiagnosticsResultItemTestPass

- (WFDiagnosticsResultItemTestPass)initWithResults:(id)a3
{
  id v3;
  WFDiagnosticsResultItemTestPass *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFDiagnosticsResultItemTestPass;
  v3 = a3;
  v4 = -[WFDiagnosticsResultItemTestPass init](&v6, sel_init);
  -[WFDiagnosticsResultItemTestPass setResults:](v4, "setResults:", v3, v6.receiver, v6.super_class);

  -[WFDiagnosticsResultItemTestPass setDidPassTest:](v4, "setDidPassTest:", 1);
  -[WFDiagnosticsResultItemTestPass setFailedTests:](v4, "setFailedTests:", MEMORY[0x24BDBD1A8]);
  return v4;
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
