@implementation UIApplicationIsStickerPickerService

void ___UIApplicationIsStickerPickerService_block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EDDC8006 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.StickerKit.StickerPickerService"));

}

@end
