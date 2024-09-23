@implementation UIApplicationIsKeyboardMediaService

void ___UIApplicationIsKeyboardMediaService_block_invoke()
{
  void *v0;
  int v1;

  _UIMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", UIKeyboardMediaServiceBundleIdentifier);

  if (v1)
    byte_1EDDC7FFE = 1;
}

@end
