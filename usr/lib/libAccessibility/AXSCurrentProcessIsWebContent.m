@implementation AXSCurrentProcessIsWebContent

void ___AXSCurrentProcessIsWebContent_block_invoke()
{
  void *v0;
  id v1;

  if (_AXHasBooleanEntitlement(CFSTR("com.apple.developer.web-browser-engine.webcontent")))
  {
    _AXSCurrentProcessIsWebContent_IsWebContent = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "bundleIdentifier");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    _AXSCurrentProcessIsWebContent_IsWebContent = objc_msgSend(v0, "hasPrefix:", CFSTR("com.apple.WebKit.WebContent"));

  }
}

@end
