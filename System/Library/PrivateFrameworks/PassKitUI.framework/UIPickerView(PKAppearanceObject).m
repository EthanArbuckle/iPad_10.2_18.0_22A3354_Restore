@implementation UIPickerView(PKAppearanceObject)

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
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.366, 0.366, 0.366, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setBackgroundColor:", v5);

  }
  objc_msgSend(v4, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_setHighlightColor:", v6);

  objc_msgSend(v4, "textColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_setTextColor:", v7);
}

@end
