@implementation UIKeyWindowSceneStackProcessIsInputIntelligenceUITestRunner

void ___UIKeyWindowSceneStackProcessIsInputIntelligenceUITestRunner_block_invoke()
{
  id v0;

  if ((os_variant_has_internal_diagnostics() & 1) != 0)
  {
    _UIMainBundleIdentifier();
    v0 = (id)objc_claimAutoreleasedReturnValue();
    _MergedGlobals_929 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.InputIntelligenceUITests-iOS-All.xctrunner"));

  }
  else
  {
    _MergedGlobals_929 = 0;
  }
}

@end
