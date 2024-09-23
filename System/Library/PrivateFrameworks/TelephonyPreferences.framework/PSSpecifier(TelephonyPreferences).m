@implementation PSSpecifier(TelephonyPreferences)

- (id)tps_subscriptionContext
{
  void *v1;
  id v2;

  objc_msgSend(a1, "propertyForKey:", *MEMORY[0x1E0D80930]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)tps_subscriptions
{
  void *v1;
  id v2;

  objc_msgSend(a1, "propertyForKey:", CFSTR("TPSSpecifierSubscriptionsKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

@end
