@implementation UIView(PKAppearanceObject)

- (void)pk_applyAppearance:()PKAppearanceObject
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBackgroundColor:", v5);

  objc_msgSend(v4, "tintColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setTintColor:", v6);
}

@end
