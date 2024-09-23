@implementation AXSAccessibilityEnabled

void ___AXSAccessibilityEnabled_block_invoke()
{
  dispatch_time_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v0 = dispatch_time(0, 500000000);
  dispatch_after(v0, MEMORY[0x1E0C80D38], &__block_literal_global_1833);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _AXSAccessibilityEnabled_isPreBoard = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.PreBoard"));

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _AXSAccessibilityEnabled_isCheckerBoard = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.CheckerBoard"));

}

@end
