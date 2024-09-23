@implementation UIApplicationIsFirstPartyStickers

void ___UIApplicationIsFirstPartyStickers_block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1EDDC8004 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Stickers.UserGenerated.MessagesExtension"));

}

@end
