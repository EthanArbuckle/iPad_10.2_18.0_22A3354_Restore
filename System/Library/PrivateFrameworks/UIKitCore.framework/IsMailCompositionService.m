@implementation IsMailCompositionService

void __IsMailCompositionService_block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1ECD7B681 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.MailCompositionService"));

}

@end
