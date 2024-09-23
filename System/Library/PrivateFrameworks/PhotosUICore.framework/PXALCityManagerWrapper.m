@implementation PXALCityManagerWrapper

+ (ALCityManager)sharedALCityManager
{
  return (ALCityManager *)objc_msgSend(MEMORY[0x1E0CFA978], "sharedManager");
}

@end
