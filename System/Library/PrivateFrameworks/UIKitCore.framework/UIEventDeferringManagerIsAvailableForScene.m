@implementation UIEventDeferringManagerIsAvailableForScene

void ___UIEventDeferringManagerIsAvailableForScene_block_invoke()
{
  void *v0;
  char v1;

  _UIMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.CarPlayApp"));

  _UIEventDeferringManagerIsAvailableForScene_allowForProcess = v1 ^ 1;
}

@end
