@implementation UIViewController(VideosUICore)

- (void)setVuiViewControllerIdentifier:()VideosUICore
{
  objc_setAssociatedObject(a1, &VUIViewControllerIdentifierKey, a3, (void *)1);
}

- (uint64_t)vui_addSubview:()VideosUICore oldView:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "vuiView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "vui_addSubview:oldView:", v7, v6);

  return v9;
}

- (uint64_t)vuiShouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

- (uint64_t)vuiIsRTL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "vuiView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "vuiIsRTL");

  return v2;
}

- (BOOL)vuiIsNavigationRoot
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "vuiNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 == a1;
}

- (uint64_t)vui_requiresLegacyPresentation
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, &VUIRequiresLegacyPresentationKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setVui_requiresLegacyPresentation:()VideosUICore
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &VUIRequiresLegacyPresentationKey, v2, (void *)1);

}

- (unint64_t)vuiUserInterfaceStyle
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userInterfaceStyle");

  return +[VUICoreUtilities vuiUserInterfaceStyleForInterfaceStyle:](VUICoreUtilities, "vuiUserInterfaceStyleForInterfaceStyle:", v2);
}

- (unint64_t)vuiOverrideUserInterfaceStyle
{
  return +[VUICoreUtilities vuiUserInterfaceStyleForInterfaceStyle:](VUICoreUtilities, "vuiUserInterfaceStyleForInterfaceStyle:", objc_msgSend(a1, "overrideUserInterfaceStyle"));
}

- (uint64_t)vui_setOverrideUserInterfaceStyle:()VideosUICore
{
  uint64_t v3;

  if (a3 == 1)
    v3 = 1;
  else
    v3 = 2 * (a3 == 2);
  return objc_msgSend(a1, "setOverrideUserInterfaceStyle:", v3);
}

- (id)vuiViewControllerIdentifier
{
  return objc_getAssociatedObject(a1, &VUIViewControllerIdentifierKey);
}

- (id)vui_initWithNibName:()VideosUICore bundle:
{
  return (id)objc_msgSend(a1, "initWithNibName:bundle:", a3, a4);
}

- (id)vui_initWithCoder:()VideosUICore
{
  return (id)objc_msgSend(a1, "initWithCoder:", a3);
}

- (void)vui_presentedContentSizeChanged:()VideosUICore
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intrinsicContentSize");
  v6 = v5;
  v8 = v7;

  if (round(v6) != 0.0 && round(v8) != 0.0)
    objc_msgSend(a1, "setPreferredContentSize:");
}

@end
