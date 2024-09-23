@implementation UIFocusSystemAssertIfNotSafari

void ___UIFocusSystemAssertIfNotSafari_block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_1279 = objc_msgSend(&unk_1E1A95090, "containsObject:", v0);

}

@end
