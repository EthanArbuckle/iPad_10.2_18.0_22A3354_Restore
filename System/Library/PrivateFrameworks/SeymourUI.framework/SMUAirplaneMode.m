@implementation SMUAirplaneMode

+ (id)smu_settingsURL
{
  return (id)objc_msgSend(MEMORY[0x24BE75460], "preferencesURL");
}

@end
