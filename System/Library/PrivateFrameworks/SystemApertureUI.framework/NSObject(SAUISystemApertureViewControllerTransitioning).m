@implementation NSObject(SAUISystemApertureViewControllerTransitioning)

- (BOOL)_isSystemApertureTransitioningOptionEnabled:()SAUISystemApertureViewControllerTransitioning
{
  void *v4;
  _BOOL8 v5;

  objc_getAssociatedObject(a1, "com.apple.SystemApertureUI.viewControllerTransitioningOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_msgSend(v4, "unsignedIntegerValue") & a3) != 0;

  return v5;
}

- (void)_setSystemApertureTransitioningOption:()SAUISystemApertureViewControllerTransitioning enabled:
{
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_getAssociatedObject(a1, "com.apple.SystemApertureUI.viewControllerTransitioningOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  v9 = 0;
  if (a4 && v8 | a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8 | a3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  objc_setAssociatedObject(a1, "com.apple.SystemApertureUI.viewControllerTransitioningOptions", v9, (void *)3);

}

- (uint64_t)isPerformingSystemApertureCustomContentTransition
{
  return objc_msgSend(a1, "_isSystemApertureTransitioningOptionEnabled:", 1);
}

- (uint64_t)setPerformingSystemApertureCustomContentTransition:()SAUISystemApertureViewControllerTransitioning
{
  return objc_msgSend(a1, "_setSystemApertureTransitioningOption:enabled:", 1, a3);
}

- (uint64_t)isPerformingSystemApertureInertTransition
{
  return objc_msgSend(a1, "_isSystemApertureTransitioningOptionEnabled:", 2);
}

- (uint64_t)setPerformingSystemApertureInertTransition:()SAUISystemApertureViewControllerTransitioning
{
  return objc_msgSend(a1, "_setSystemApertureTransitioningOption:enabled:", 2, a3);
}

@end
