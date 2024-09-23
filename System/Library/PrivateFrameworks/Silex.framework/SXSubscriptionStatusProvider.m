@implementation SXSubscriptionStatusProvider

- (SXSubscriptionStatusProvider)init
{
  return -[SXSubscriptionStatusProvider initWithBundleSubscriptionStatus:channelSubscriptionStatus:](self, "initWithBundleSubscriptionStatus:channelSubscriptionStatus:", 0, 0);
}

- (SXSubscriptionStatusProvider)initWithBundleSubscriptionStatus:(int64_t)a3 channelSubscriptionStatus:(int64_t)a4
{
  SXSubscriptionStatusProvider *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXSubscriptionStatusProvider;
  result = -[SXSubscriptionStatusProvider init](&v7, sel_init);
  if (result)
  {
    result->_bundleSubscriptionStatus = a3;
    result->_channelSubscriptionStatus = a4;
  }
  return result;
}

- (int64_t)bundleSubscriptionStatus
{
  return self->_bundleSubscriptionStatus;
}

- (int64_t)channelSubscriptionStatus
{
  return self->_channelSubscriptionStatus;
}

@end
