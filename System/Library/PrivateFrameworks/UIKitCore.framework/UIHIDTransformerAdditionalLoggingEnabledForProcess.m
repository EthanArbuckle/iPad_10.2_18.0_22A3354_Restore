@implementation UIHIDTransformerAdditionalLoggingEnabledForProcess

void ___UIHIDTransformerAdditionalLoggingEnabledForProcess_block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_1198 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.PointerUI.pointeruid"));

}

@end
