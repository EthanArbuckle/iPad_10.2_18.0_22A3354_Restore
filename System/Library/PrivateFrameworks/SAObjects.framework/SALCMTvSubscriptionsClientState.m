@implementation SALCMTvSubscriptionsClientState

+ (id)deliveryDeadline
{
  return CFSTR("SYNC");
}

+ (id)persistencePolicy
{
  return CFSTR("LIFE_OF_USER_DATA");
}

+ (id)syncKey
{
  return CFSTR("com.apple.siri.client.state.TvSubscriptionsClientState");
}

+ (id)uniqueObjectIdentifier
{
  return CFSTR("ClientState://TvSubscriptionsClientState");
}

- (id)groupIdentifier
{
  return CFSTR("com.apple.ace.livecontent");
}

- (id)encodedClassName
{
  return CFSTR("TvSubscriptionsClientState");
}

+ (id)tvSubscriptionsClientState
{
  return objc_alloc_init((Class)a1);
}

- (NSArray)subscriptions
{
  return (NSArray *)-[AceObject propertyForKey:](self, "propertyForKey:", CFSTR("subscriptions"));
}

- (void)setSubscriptions:(id)a3
{
  AceObjectSetCopyingObjectForProperty(self, CFSTR("subscriptions"), a3);
}

@end
