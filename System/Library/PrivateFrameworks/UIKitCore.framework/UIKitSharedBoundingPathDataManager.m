@implementation UIKitSharedBoundingPathDataManager

uint64_t ____UIKitSharedBoundingPathDataManager_block_invoke()
{
  _UIAssetManager *v0;
  uint64_t result;

  v0 = [_UIAssetManager alloc];
  result = -[_UIAssetManager initWithName:inBundle:idiom:](v0, "initWithName:inBundle:idiom:", CFSTR("UIKit_BoundingPathData"), objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", _UIKitResourceBundlePath(CFSTR("BoundingPathData.bundle"))), -[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom"));
  qword_1ECD81EA8 = result;
  *(_BYTE *)(result + 116) |= 4u;
  return result;
}

@end
