@implementation RemovedUser

+ (id)dateRemovedKeyPath
{
  return CFSTR("dateRemoved");
}

+ (id)handleKeyPath
{
  return CFSTR("removedHandle");
}

+ (id)statusTypeIdentifierKeyPath
{
  return CFSTR("statusTypeIdentifier");
}

+ (id)presenceIdentifierKeyPath
{
  return CFSTR("presenceIdentifier");
}

+ (id)predicateForHandle:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "normalizedHandleString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "predicateForHandleString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateForHandleString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  +[RemovedUser handleKeyPath](RemovedUser, "handleKeyPath");
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
  +[RemovedUser statusTypeIdentifierKeyPath](RemovedUser, "statusTypeIdentifierKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)predicateForPresenceIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  +[RemovedUser presenceIdentifierKeyPath](RemovedUser, "presenceIdentifierKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K == %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("RemovedUser"));
}

@end
