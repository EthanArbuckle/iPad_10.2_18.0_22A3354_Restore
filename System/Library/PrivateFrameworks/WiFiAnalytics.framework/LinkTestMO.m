@implementation LinkTestMO

+ (id)entityName
{
  return CFSTR("LinkTest");
}

+ (id)generateInstance:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[LinkTestMO entityName](LinkTestMO, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AnalyticsStoreProxy createEntity:moc:](AnalyticsStoreProxy, "createEntity:moc:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("LinkTest"));
}

@end
