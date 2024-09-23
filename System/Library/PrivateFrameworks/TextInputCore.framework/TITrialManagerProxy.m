@implementation TITrialManagerProxy

+ (TITrialManager)sharedManager
{
  if (sharedManagerOverride)
    return (TITrialManager *)(id)sharedManagerOverride;
  +[TITrialManager sharedInstance](TITrialManager, "sharedInstance");
  return (TITrialManager *)(id)objc_claimAutoreleasedReturnValue();
}

+ (void)setSharedManager:(id)a3
{
  objc_storeStrong((id *)&sharedManagerOverride, a3);
}

@end
