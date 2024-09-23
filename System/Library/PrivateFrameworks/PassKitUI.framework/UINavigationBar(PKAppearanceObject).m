@implementation UINavigationBar(PKAppearanceObject)

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
  if (objc_msgSend(v4, "hasDarkAppearance"))
  {
    objc_msgSend(a1, "setBarStyle:", 1);
    objc_msgSend(a1, "setTranslucent:", 1);
  }
  objc_msgSend(v4, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTintColor:", v5);

  objc_msgSend(v4, "navBarPointImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBackgroundImage:forBarMetrics:", v6, 0);

  objc_msgSend(v4, "navBarShadowPointImage");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setShadowImage:", v7);
}

@end
