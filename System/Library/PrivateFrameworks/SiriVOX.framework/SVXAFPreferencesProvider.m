@implementation SVXAFPreferencesProvider

- (id)get
{
  return (id)objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
}

@end
