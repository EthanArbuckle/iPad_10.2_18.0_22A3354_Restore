@implementation _RPTTestRunnerResultsDelegate

- (void)testRunner:(id)a3 didFinishRunningParameters:(id)a4
{
  id v4;

  -[_RPTTestRunnerResultsDelegate resultsHandler](self, "resultsHandler", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);

}

- (void)testRunner:(id)a3 didFailRunningParameters:(id)a4 withError:(id)a5
{
  id v6;
  void (**v7)(id, uint64_t, id);

  v6 = a5;
  -[_RPTTestRunnerResultsDelegate resultsHandler](self, "resultsHandler");
  v7 = (void (**)(id, uint64_t, id))objc_claimAutoreleasedReturnValue();
  v7[2](v7, 1, v6);

}

- (BOOL)testRunner:(id)a3 shouldManagePPTLifetimeEvent:(int64_t)a4 forParamaters:(id)a5
{
  return 0;
}

- (id)resultsHandler
{
  return self->resultsHandler;
}

- (void)setResultsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->resultsHandler, 0);
}

@end
