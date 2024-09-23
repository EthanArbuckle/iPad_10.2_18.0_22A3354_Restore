@implementation UIApplicationIsWidgetServer

void ___UIApplicationIsWidgetServer_block_invoke()
{
  void *v0;
  int v1;

  _UIMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", UIKeyboardWidgetServerBundleIdentifier);

  if (v1)
    byte_1EDDC7FFF = 1;
}

@end
