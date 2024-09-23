@implementation UIToolbar(PKAppearanceObject)

- (uint64_t)pk_childrenForAppearance
{
  return MEMORY[0x1E0C9AA60];
}

- (void)pk_applyAppearance:()PKAppearanceObject
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTintColor:", v5);

  objc_msgSend(v4, "navBarPointImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBackgroundImage:forToolbarPosition:barMetrics:", v6, 0, 0);

  objc_msgSend(v4, "navBarShadowPointImage");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setShadowImage:forToolbarPosition:", v7, 0);
}

@end
