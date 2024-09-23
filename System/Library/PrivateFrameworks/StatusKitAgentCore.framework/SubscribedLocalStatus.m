@implementation SubscribedLocalStatus

+ (NSString)idsIdentifierKeyPath
{
  return (NSString *)CFSTR("idsIdentifier");
}

+ (NSString)identifierKeyPath
{
  return (NSString *)CFSTR("identifier");
}

+ (id)predicateForSubscribedLocalStatusIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  +[SubscribedLocalStatus identifierKeyPath](SubscribedLocalStatus, "identifierKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForSubscribedLocalStatusIDSIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  +[SubscribedLocalStatus idsIdentifierKeyPath](SubscribedLocalStatus, "idsIdentifierKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForSubscribedLocalStatusIdentifier:(id)a3 idsIdentifier:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDD1758];
  v6 = a4;
  v7 = a3;
  +[SubscribedLocalStatus idsIdentifierKeyPath](SubscribedLocalStatus, "idsIdentifierKeyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SubscribedLocalStatus identifierKeyPath](SubscribedLocalStatus, "identifierKeyPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K == %@ AND %K == %@"), v8, v6, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("SubscribedLocalStatus"));
}

@end
