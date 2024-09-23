@implementation TUDeviceHasDynamicIsland

uint64_t __TUDeviceHasDynamicIsland_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  TUDeviceHasDynamicIsland___supportsDynamicIsland = result;
  return result;
}

@end
