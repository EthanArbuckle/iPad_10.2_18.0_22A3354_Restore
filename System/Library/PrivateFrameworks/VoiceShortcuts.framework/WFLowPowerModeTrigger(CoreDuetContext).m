@implementation WFLowPowerModeTrigger(CoreDuetContext)

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForLowPowerModeStatus");
}

- (id)contextStorePredicate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  if (objc_msgSend(a1, "onEnable"))
    objc_msgSend(v2, "addObject:", MEMORY[0x1E0C9AAB0]);
  if (objc_msgSend(a1, "onDisable"))
    objc_msgSend(v2, "addObject:", MEMORY[0x1E0C9AAA0]);
  objc_msgSend(a1, "contextStoreKeyPathForCurrentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C90], "predicateForKeyPath:withFormat:", v3, CFSTR("SELF.%@.value IN %@"), v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

@end
