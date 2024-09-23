@implementation AXSProcessDrawsAssistiveUI

void ___AXSProcessDrawsAssistiveUI_block_invoke()
{
  void *v0;
  char v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.accessibility.AccessibilityUIServer")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.AccessibilityUIServer")) & 1) != 0)
  {
    v1 = 1;
  }
  else
  {
    v1 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.assistivetouchd"));
  }
  _AXSProcessDrawsAssistiveUI_result = v1;

}

@end
