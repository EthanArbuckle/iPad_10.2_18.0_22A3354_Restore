@implementation WFRunnerRunningState

- (WFRunnerRunningState)initWithEnvironment:(int64_t)a3 isPersonalAutomation:(BOOL)a4
{
  WFRunnerRunningState *v5;
  WFRunnerRunningState *v6;
  WFRunnerRunningState *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFRunnerRunningState;
  v5 = -[WFRunnerRunningState init](&v9, sel_init, a3);
  v6 = v5;
  if (v5)
  {
    v5->_isPersonalAutomation = a4;
    v7 = v5;
  }

  return v6;
}

- (unint64_t)stage
{
  return 2;
}

- (BOOL)shouldStartTimer
{
  int64_t v3;
  int64_t v4;

  v3 = -[WFRunnerRunningState environment](self, "environment");
  v4 = -[WFRunnerRunningState environment](self, "environment");
  return v3 == 1 || v4 == 3 || -[WFRunnerRunningState isPersonalAutomation](self, "isPersonalAutomation");
}

- (double)timeoutDuration
{
  int64_t v2;
  double *v3;

  v2 = -[WFRunnerRunningState environment](self, "environment");
  v3 = (double *)MEMORY[0x1E0DC82A0];
  if (v2 != 1)
    v3 = (double *)MEMORY[0x1E0DC8298];
  return *v3;
}

- (void)cancel
{
  void (**v2)(void);

  -[WFRunnerRunningState timeoutHandler](self, "timeoutHandler");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v2[2]();

}

- (int64_t)environment
{
  return self->_environment;
}

- (BOOL)isPersonalAutomation
{
  return self->_isPersonalAutomation;
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutHandler, 0);
}

@end
