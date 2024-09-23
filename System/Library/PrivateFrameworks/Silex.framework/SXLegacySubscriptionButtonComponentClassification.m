@implementation SXLegacySubscriptionButtonComponentClassification

+ (id)typeString
{
  return CFSTR("subscription_button");
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

@end
