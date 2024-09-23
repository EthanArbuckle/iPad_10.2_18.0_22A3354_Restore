@implementation SAAppSubscription

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.system");
}

- (id)encodedClassName
{
  return CFSTR("AppSubscription");
}

+ (id)appSubscription
{
  return objc_alloc_init((Class)a1);
}

- (NSString)bundleId
{
  return (NSString *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("bundleId"));
}

- (void)setBundleId:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("bundleId"), a3);
}

- (NSArray)subscriptionTiers
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subscriptionTiers"));
}

- (void)setSubscriptionTiers:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subscriptionTiers"), a3);
}

@end
