@implementation SKUIFamilyCircleFramework

void *__SKUIFamilyCircleFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/FamilyCircle.framework/FamilyCircle", 1);
  SKUIFamilyCircleFramework_sHandle = (uint64_t)result;
  return result;
}

@end
