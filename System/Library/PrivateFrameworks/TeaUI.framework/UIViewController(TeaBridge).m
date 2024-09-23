@implementation UIViewController(TeaBridge)

- (uint64_t)ts_setAppearanceTransitionsAreDisabled:()TeaBridge
{
  uint64_t v5;

  v5 = objc_msgSend(a1, "appearanceTransitionsAreDisabled");
  objc_msgSend(a1, "setAppearanceTransitionsAreDisabled:", a3);
  return v5;
}

+ (uint64_t)ts_performWithoutDeferringTransitions:()TeaBridge
{
  return objc_msgSend(MEMORY[0x1E0DC3F20], "_performWithoutDeferringTransitions:");
}

- (uint64_t)ts_isVideoPlayerPresentedFullScreen
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  objc_msgSend(a1, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("AVFullScreenViewController"));
  return v6;
}

@end
