@implementation WFNFCTrigger(CoreDuetContext)

- (uint64_t)contextStoreKeyPathForCurrentState
{
  return objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForNFCTagIdentifiers");
}

- (id)contextStorePredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "contextStoreKeyPathForCurrentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D15C90];
  objc_msgSend(a1, "tagIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateForKeyPath:withFormat:", v2, CFSTR("%@ IN SELF.%@.value"), v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setEvaluateOnEveryKeyPathUpdate:", 1);
  return v5;
}

- (uint64_t)contextStoreQualityOfService
{
  return 25;
}

@end
