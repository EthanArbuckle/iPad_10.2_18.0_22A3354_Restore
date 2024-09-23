@implementation LoadNearbyInteraction

void *__LoadNearbyInteraction_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/NearbyInteraction.framework/NearbyInteraction", 2);
  LoadNearbyInteraction_frameworkLibrary = (uint64_t)result;
  return result;
}

@end
