@implementation TPSDetailController

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  void *v2;
  void *v3;

  -[TPSDetailController specifier](self, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tps_subscriptionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CTXPCServiceSubscriptionContext *)v3;
}

@end
