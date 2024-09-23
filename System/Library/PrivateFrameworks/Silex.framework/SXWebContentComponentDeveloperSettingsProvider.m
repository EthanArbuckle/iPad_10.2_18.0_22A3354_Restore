@implementation SXWebContentComponentDeveloperSettingsProvider

- (id)developerSettings
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE90790]), "initWithAllowRemoteInspection:", 1);
}

@end
