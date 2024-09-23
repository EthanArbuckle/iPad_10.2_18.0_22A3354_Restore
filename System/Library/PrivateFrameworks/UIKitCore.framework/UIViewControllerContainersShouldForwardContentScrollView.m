@implementation UIViewControllerContainersShouldForwardContentScrollView

void ___UIViewControllerContainersShouldForwardContentScrollView_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("UIViewControllerContainersShouldForwardContentScrollView"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v3;
  if (v3
    || (_UIKitPreferencesOnce(),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "objectForKey:", CFSTR("UIViewControllerContainersShouldForwardContentScrollView")),
        v4 = (id)objc_claimAutoreleasedReturnValue(),
        v2,
        (v1 = v4) != 0))
  {
    v5 = v1;
    _UIViewControllerContainersShouldForwardContentScrollView_shouldForward = objc_msgSend(v1, "BOOLValue");

  }
}

@end
