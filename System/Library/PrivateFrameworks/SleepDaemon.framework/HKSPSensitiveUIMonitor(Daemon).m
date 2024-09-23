@implementation HKSPSensitiveUIMonitor(Daemon)

- (uint64_t)initWithEnvironment:()Daemon
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "defaultCallbackScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "initWithCallbackScheduler:", v4);

  return v5;
}

- (uint64_t)environment
{
  return 0;
}

@end
