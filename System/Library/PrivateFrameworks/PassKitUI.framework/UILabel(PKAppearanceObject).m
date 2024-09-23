@implementation UILabel(PKAppearanceObject)

- (uint64_t)pk_childrenForAppearance
{
  return MEMORY[0x1E0C9AA60];
}

- (void)pk_applyAppearance:()PKAppearanceObject
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "textColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTextColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBackgroundColor:", v5);

  objc_msgSend(a1, "attributedText");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pk_setAttributedTextRespectingTextAndBackgroundColors:", v6);

}

- (void)pk_setAttributedTextRespectingTextAndBackgroundColors:()PKAppearanceObject
{
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v4 = *MEMORY[0x1E0DC1140];
  v10 = a3;
  objc_msgSend(a1, "textColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKAttributedStringSetAttributeForKey(v10, v4, v5);

  v7 = *MEMORY[0x1E0DC1100];
  objc_msgSend(a1, "backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = PKAttributedStringSetAttributeForKey(v10, v7, v8);

  objc_msgSend(a1, "setAttributedText:", v10);
}

@end
