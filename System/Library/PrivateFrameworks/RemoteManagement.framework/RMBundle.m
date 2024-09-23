@implementation RMBundle

+ (void)setManagementScope:(int64_t)a3
{
  _managementScope = a3;
}

+ (int64_t)managementScope
{
  return _managementScope;
}

+ (NSBundle)remoteManagementBundle
{
  return (NSBundle *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", a1);
}

@end
