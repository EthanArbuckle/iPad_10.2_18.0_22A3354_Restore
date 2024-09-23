@implementation WFDNDTrigger(CoreDuetContext)

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForDoNotDisturbStatusDataDictionary");
}

- (id)contextStorePredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_new();
  if (objc_msgSend(a1, "onEnable"))
    objc_msgSend(v2, "addObject:", MEMORY[0x1E0C9AAB0]);
  if (objc_msgSend(a1, "onDisable"))
    objc_msgSend(v2, "addObject:", MEMORY[0x1E0C9AAA0]);
  objc_msgSend(a1, "contextStoreKeyPathForCurrentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D15C90];
  objc_msgSend(MEMORY[0x1E0D15C58], "doNotDisturbState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateForKeyPath:withFormat:", v3, CFSTR("SELF.%@.value.%K IN %@"), v3, v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

@end
