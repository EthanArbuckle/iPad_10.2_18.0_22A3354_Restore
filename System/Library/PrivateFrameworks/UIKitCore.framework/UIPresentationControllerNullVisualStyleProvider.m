@implementation UIPresentationControllerNullVisualStyleProvider

void __102___UIPresentationControllerNullVisualStyleProvider_defaultConcretePresentationStyleForViewController___block_invoke()
{
  void *v0;
  id v1;

  _UIMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_1153 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

  _UIMainBundleIdentifier();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  byte_1ECD7F1B1 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.PosterBoard"));

}

@end
