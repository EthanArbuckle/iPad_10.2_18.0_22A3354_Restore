@implementation STScreenTimeSettingsUIBundle

+ (NSBundle)bundle
{
  return (NSBundle *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", a1);
}

+ (NSString)restrictionsStringsTable
{
  return (NSString *)CFSTR("Restrictions");
}

@end
