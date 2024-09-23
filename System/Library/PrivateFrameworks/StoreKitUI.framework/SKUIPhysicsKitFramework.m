@implementation SKUIPhysicsKitFramework

void *__SKUIPhysicsKitFramework_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/PhysicsKit.framework/PhysicsKit", 1);
  SKUIPhysicsKitFramework_sHandle = (uint64_t)result;
  return result;
}

@end
