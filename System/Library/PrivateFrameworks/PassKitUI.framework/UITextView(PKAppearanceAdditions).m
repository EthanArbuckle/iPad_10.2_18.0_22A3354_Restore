@implementation UITextView(PKAppearanceAdditions)

- (id)pk_childrenForAppearance
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "inputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(a1, "inputView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  objc_msgSend(a1, "inputAccessoryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "inputAccessoryView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

  }
  v7 = (void *)objc_msgSend(v2, "copy");

  return v7;
}

- (void)pk_applyAppearance:()PKAppearanceAdditions
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(a1, "keyboardAppearance");
  if ((objc_msgSend(v9, "hasDarkAppearance") & 1) != 0)
  {
    v5 = 1;
LABEL_5:
    objc_msgSend(a1, "setKeyboardAppearance:", v5);
    goto LABEL_6;
  }
  if (v4 == 1)
  {
    v5 = 0;
    goto LABEL_5;
  }
LABEL_6:
  if (v4 != objc_msgSend(a1, "keyboardAppearance") && objc_msgSend(a1, "isFirstResponder"))
    objc_msgSend(a1, "reloadInputViews");
  objc_msgSend(v9, "textColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTextColor:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBackgroundColor:", v7);

  objc_msgSend(a1, "attributedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pk_setAttributedTextRespectingTextAndBackgroundColors:", v8);

}

- (void)pk_setAttributedTextRespectingTextAndBackgroundColors:()PKAppearanceAdditions
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
