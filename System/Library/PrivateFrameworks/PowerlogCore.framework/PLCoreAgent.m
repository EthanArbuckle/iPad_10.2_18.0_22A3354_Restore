@implementation PLCoreAgent

- (PLCoreAgent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLCoreAgent;
  return -[PLCoreOperator init](&v3, sel_init);
}

- (void)startAgents
{
  NSObject *v3;
  uint64_t v4;
  objc_super v5;
  uint8_t buf[16];

  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "Start Powerlog Agents", buf, 2u);
  }

  v4 = objc_opt_class();
  v5.receiver = self;
  v5.super_class = (Class)PLCoreAgent;
  -[PLCoreOperator startOperatorsOfSuperClassType:](&v5, sel_startOperatorsOfSuperClassType_, v4);
}

@end
