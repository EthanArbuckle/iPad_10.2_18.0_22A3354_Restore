@implementation SBApplicationWakeSchedulerFactory

+ (id)newLegacyVOIPPeriodicWakeSchedulerForApplication:(id)a3
{
  id v3;
  SBLegacyVOIPRefreshWakeTracker *v4;
  id v5;

  v3 = a3;
  v4 = objc_alloc_init(SBLegacyVOIPRefreshWakeTracker);
  v5 = -[SBApplicationWakeScheduler _initWithLifecycleTracker:forApplication:]([SBApplicationWakeScheduler alloc], "_initWithLifecycleTracker:forApplication:", v4, v3);

  return v5;
}

@end
