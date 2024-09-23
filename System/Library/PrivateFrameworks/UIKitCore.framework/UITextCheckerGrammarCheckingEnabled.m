@implementation UITextCheckerGrammarCheckingEnabled

void __UITextCheckerGrammarCheckingEnabled_block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  _UIMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("UITextCheckerEnablePostEditingGrammarCheck"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    v2 = objc_msgSend(v3, "BOOLForKey:", CFSTR("UITextCheckerEnablePostEditingGrammarCheck"));
LABEL_11:
    byte_1ECD7B2FA = v2;
    goto LABEL_12;
  }
  if ((_os_feature_enabled_impl() & 1) != 0
    || (objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0
    || (objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0
    || (objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.mobilenotes")) & 1) != 0
    || (objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.mobilesafari")) & 1) != 0
    || (objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.UIKitester")) & 1) != 0
    || objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Typist")))
  {
    v2 = 1;
    goto LABEL_11;
  }
LABEL_12:

}

@end
