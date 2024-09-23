@implementation SXLegacySubscriptionButtonComponent

- (id)action
{
  return objc_alloc_init(SXSubscribeAction);
}

- (id)type
{
  return CFSTR("button");
}

@end
