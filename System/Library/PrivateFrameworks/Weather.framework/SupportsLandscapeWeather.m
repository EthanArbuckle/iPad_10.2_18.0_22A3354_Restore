@implementation SupportsLandscapeWeather

uint64_t __SupportsLandscapeWeather_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE6B638], "naui_isPad");
  SupportsLandscapeWeather_support = result;
  return result;
}

@end
