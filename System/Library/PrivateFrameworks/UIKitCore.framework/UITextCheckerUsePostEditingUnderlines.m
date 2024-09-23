@implementation UITextCheckerUsePostEditingUnderlines

void __UITextCheckerUsePostEditingUnderlines_block_invoke()
{
  void *v0;
  char v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("UITextCheckerUsePostEditingUnderlines"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();

  if (v0)
  {
    v1 = objc_msgSend(v2, "BOOLForKey:", CFSTR("UITextCheckerUsePostEditingUnderlines"));
LABEL_5:
    byte_1ECD7B2FB = v1;
    goto LABEL_6;
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v1 = 1;
    goto LABEL_5;
  }
LABEL_6:

}

@end
