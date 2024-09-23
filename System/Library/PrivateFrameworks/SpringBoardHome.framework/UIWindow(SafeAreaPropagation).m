@implementation UIWindow(SafeAreaPropagation)

- (void)_sb_recursiveUpdateContentOverlayInsetsFromParentIfNecessary
{
  id v1;

  objc_msgSend(a1, "rootViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_sb_recursiveUpdateContentOverlayInsetsFromParentIfNecessary");

}

@end
