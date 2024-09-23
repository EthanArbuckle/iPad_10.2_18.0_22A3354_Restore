@implementation PublishedLocalStatusDevice

+ (NSString)idsIdentifierKeyPath
{
  return (NSString *)CFSTR("idsIdentifier");
}

+ (id)predicateForPublishedLocalStatusDeviceIdentifiers:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1758];
  v4 = a3;
  +[PublishedLocalStatusDevice idsIdentifierKeyPath](PublishedLocalStatusDevice, "idsIdentifierKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("%K IN %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("PublishedLocalStatusDevice"));
}

@end
