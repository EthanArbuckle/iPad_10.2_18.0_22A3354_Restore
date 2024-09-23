@implementation SBUIPeriocularController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_42);
  return (id)sharedInstance___sharedInstance_2;
}

void __42__SBUIPeriocularController_sharedInstance__block_invoke()
{
  SBUIPeriocularController *v0;
  void *v1;

  v0 = objc_alloc_init(SBUIPeriocularController);
  v1 = (void *)sharedInstance___sharedInstance_2;
  sharedInstance___sharedInstance_2 = (uint64_t)v0;

}

- (BOOL)periocularEnabled
{
  void *v2;
  char v3;

  +[SBUIBiometricResource sharedInstance](SBUIBiometricResource, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPeriocularMatchingEnabled");

  return v3;
}

@end
