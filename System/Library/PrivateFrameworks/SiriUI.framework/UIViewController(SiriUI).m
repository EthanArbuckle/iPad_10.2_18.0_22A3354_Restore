@implementation UIViewController(SiriUI)

- (uint64_t)siriui_shouldRotateToLandscape
{
  return 0;
}

- (BOOL)siriui_isVisible
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  if (!objc_msgSend(a1, "isViewLoaded"))
    return 0;
  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

@end
