@implementation UINavigationControllerUseAugmentedPopGesture

void ___UINavigationControllerUseAugmentedPopGesture_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  _UIKitPreferencesOnce();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("UIUseAugmentedPopGesture"));
  v2 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v2;
  if (v2)
  {
    __UINavigationControllerUseAugmentedPopGesture = objc_msgSend(v2, "BOOLValue");
    v1 = v2;
  }

}

@end
