@implementation FamilyCircleUILibrary

void *__FamilyCircleUILibrary_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/FamilyCircleUI.framework/FamilyCircleUI", 2);
  FamilyCircleUILibrary_sLib = (uint64_t)result;
  return result;
}

@end
