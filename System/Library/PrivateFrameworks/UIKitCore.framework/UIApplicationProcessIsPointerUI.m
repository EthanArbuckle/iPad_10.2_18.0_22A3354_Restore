@implementation UIApplicationProcessIsPointerUI

void ___UIApplicationProcessIsPointerUI_block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EDDC800A = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.PointerUI.pointeruid"));

}

@end
