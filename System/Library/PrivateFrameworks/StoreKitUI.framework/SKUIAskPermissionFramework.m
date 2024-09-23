@implementation SKUIAskPermissionFramework

void *__SKUIAskPermissionFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/AskPermission.framework/AskPermission", 1);
  SKUIAskPermissionFramework_sHandle = (uint64_t)result;
  return result;
}

@end
