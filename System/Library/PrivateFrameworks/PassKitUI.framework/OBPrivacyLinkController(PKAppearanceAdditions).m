@implementation OBPrivacyLinkController(PKAppearanceAdditions)

- (uint64_t)pk_applyAppearance:()PKAppearanceAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&off_1EE6301F8;
  v4 = a3;
  objc_msgSendSuper2(&v9, sel_pk_applyAppearance_, v4);
  objc_msgSend(a1, "view", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v6);

  v7 = objc_msgSend(v4, "hasDarkAppearance");
  return objc_msgSend(a1, "setPresentedViewControllerShouldUseDarkMode:", v7);
}

@end
