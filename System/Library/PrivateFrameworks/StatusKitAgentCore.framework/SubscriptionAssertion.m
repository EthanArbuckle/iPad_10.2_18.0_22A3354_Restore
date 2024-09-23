@implementation SubscriptionAssertion

+ (NSString)applicationIdentifierKeyPath
{
  return (NSString *)CFSTR("applicationIdentifier");
}

+ (NSString)channelIdentifierKeyPath
{
  return (NSString *)CFSTR("channelIdentifier");
}

+ (NSString)statusTypeIdentifierKeyPath
{
  return (NSString *)CFSTR("statusTypeIdentifier");
}

+ (id)predicateForApplicationIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  +[SubscriptionAssertion applicationIdentifierKeyPath](SubscriptionAssertion, "applicationIdentifierKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForChannelIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  +[SubscriptionAssertion channelIdentifierKeyPath](SubscriptionAssertion, "channelIdentifierKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForStatusTypeIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  +[SubscriptionAssertion statusTypeIdentifierKeyPath](SubscriptionAssertion, "statusTypeIdentifierKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("SubscriptionAssertion"));
}

@end
