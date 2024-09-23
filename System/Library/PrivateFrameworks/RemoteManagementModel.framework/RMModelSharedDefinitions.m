@implementation RMModelSharedDefinitions

+ (int64_t)currentPlatform
{
  if (objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad"))
    return 2;
  else
    return 1;
}

@end
