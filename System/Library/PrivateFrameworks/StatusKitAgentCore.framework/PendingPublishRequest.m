@implementation PendingPublishRequest

+ (NSString)statusTypeIdentifierKeyPath
{
  return (NSString *)CFSTR("statusTypeIdentifier");
}

+ (NSString)dateCreatedKeyPath
{
  return (NSString *)CFSTR("dateCreated");
}

+ (NSString)statusUniqueIdentifierKeyPath
{
  return (NSString *)CFSTR("statusUniqueIdentifier");
}

+ (id)predicateForStatusTypeIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  +[PendingPublishRequest statusTypeIdentifierKeyPath](PendingPublishRequest, "statusTypeIdentifierKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForStatusUniqueIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  +[PendingPublishRequest statusUniqueIdentifierKeyPath](PendingPublishRequest, "statusUniqueIdentifierKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sortDescriptorForDateCreatedAscending:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD17C0];
  +[PendingPublishRequest dateCreatedKeyPath](PendingPublishRequest, "dateCreatedKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("PendingPublishRequest"));
}

@end
