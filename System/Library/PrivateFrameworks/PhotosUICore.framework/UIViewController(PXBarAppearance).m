@implementation UIViewController(PXBarAppearance)

- (uint64_t)_pxswizzled_barAppearance_prefersStatusBarHidden
{
  void *v3;
  uint64_t v4;

  if ((objc_msgSend(a1, "_pxswizzled_barAppearance_prefersStatusBarHidden") & 1) != 0)
    return 1;
  objc_msgSend(a1, "px_barAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "adjustedPrefersStatusBarHidden:", 0);

  return v4;
}

- (PXBarAppearance)px_barAppearance
{
  PXBarAppearance *v2;

  objc_getAssociatedObject(a1, (const void *)PXBarAppearanceAssocationKey);
  v2 = (PXBarAppearance *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = -[PXBarAppearance initWithViewController:]([PXBarAppearance alloc], "initWithViewController:", a1);
    objc_setAssociatedObject(a1, (const void *)PXBarAppearanceAssocationKey, v2, (void *)1);
  }
  return v2;
}

- (void)_pxswizzled_barAppearance_viewWillAppear:()PXBarAppearance
{
  id v5;

  objc_msgSend(a1, "_pxswizzled_barAppearance_viewWillAppear:");
  objc_msgSend(a1, "px_barAppearance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerViewWillAppear:", a3);

}

- (void)_pxswizzled_barAppearance_viewIsAppearing:()PXBarAppearance
{
  id v5;

  objc_msgSend(a1, "_pxswizzled_barAppearance_viewIsAppearing:");
  objc_msgSend(a1, "px_barAppearance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerViewIsAppearing:", a3);

}

- (void)px_enableBarAppearance
{
  id v2;

  objc_msgSend((id)objc_opt_class(), "_px_prepareClassForBarAppearance");
  objc_msgSend(a1, "px_barAppearance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", 1);

}

+ (uint64_t)_px_prepareClassForBarAppearance
{
  return objc_msgSend(a1, "px_swizzleOnceAsSubclassOfClass:context:usingBlock:", objc_opt_class(), PXBarAppearanceContext, &__block_literal_global_140487);
}

- (uint64_t)_pxswizzled_barAppearance_preferredStatusBarStyle
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, "_pxswizzled_barAppearance_preferredStatusBarStyle");
  objc_msgSend(a1, "px_barAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "adjustedPreferredStatusBarStyle:", v2);

  return v4;
}

- (void)px_enablePrefersViewIsAppearingForAppearanceUpdates
{
  id v1;

  objc_msgSend(a1, "px_barAppearance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setPrefersViewIsAppearingForAppearanceUpdates:", 1);

}

- (void)_pxswizzled_barAppearance_viewDidDisappear:()PXBarAppearance
{
  id v5;

  objc_msgSend(a1, "_pxswizzled_barAppearance_viewDidDisappear:");
  objc_msgSend(a1, "px_barAppearance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerViewDidDisappear:", a3);

}

- (uint64_t)_pxswizzled_barAppearance_preferredStatusBarUpdateAnimation
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, "_pxswizzled_barAppearance_preferredStatusBarUpdateAnimation");
  objc_msgSend(a1, "px_barAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "adjustedPreferredStatusBarUpdateAnimation:", v2);

  return v4;
}

@end
