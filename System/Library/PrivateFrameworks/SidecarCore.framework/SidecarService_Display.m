@implementation SidecarService_Display

+ (id)name
{
  __CFString *v2;

  v2 = CFSTR("SidecarServiceNameDisplay");
  return CFSTR("SidecarServiceNameDisplay");
}

+ (id)returnTypes
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (int64_t)minimumRapportVersion
{
  return 1820000;
}

- (id)serviceIdentifier
{
  return CFSTR("com.apple.sidecar.display");
}

- (id)serviceExtension
{
  return CFSTR("com.apple.sidecar.extension.display");
}

- (id)localizedDescription
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Display"), &stru_24E5E1A30, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedItemName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Display"), &stru_24E5E1A30, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
