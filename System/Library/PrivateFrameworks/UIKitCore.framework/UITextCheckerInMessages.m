@implementation UITextCheckerInMessages

void __UITextCheckerInMessages_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  _UIMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0
    || objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.mobilesms.compose")))
  {
    byte_1ECD7B2FD = 1;
  }

}

@end
