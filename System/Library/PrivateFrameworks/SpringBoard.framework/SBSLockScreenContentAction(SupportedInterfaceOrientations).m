@implementation SBSLockScreenContentAction(SupportedInterfaceOrientations)

- (BOOL)specifiesSupportedInterfaceOrientations
{
  return objc_msgSend(a1, "supportedInterfaceOrientations") != 0;
}

- (uint64_t)supportedInterfaceOrientations
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = objc_opt_class();
  objc_msgSend(a1, "configurationObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DAB7A0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  return v6;
}

@end
