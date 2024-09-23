@implementation UIApplicationProcessIsOverlayUI

void ___UIApplicationProcessIsOverlayUI_block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EDDC8007 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.UIKit.OverlayUI"));

}

@end
