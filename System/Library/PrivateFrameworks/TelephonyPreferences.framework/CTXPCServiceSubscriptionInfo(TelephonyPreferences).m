@implementation CTXPCServiceSubscriptionInfo(TelephonyPreferences)

- (id)tps_activeSubscriptionSet
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "subscriptionsInUse");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)tps_subscriptionSet
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "subscriptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
