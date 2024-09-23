@implementation UIButton(PKAppearanceObject)

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
  objc_msgSend(v4, "buttonTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTitleColor:forState:", v5, 0);

  objc_msgSend(v4, "buttonDisabledTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTitleColor:forState:", v6, 2);

  objc_msgSend(v4, "buttonBackgroundColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setBackgroundColor:", v7);
}

@end
