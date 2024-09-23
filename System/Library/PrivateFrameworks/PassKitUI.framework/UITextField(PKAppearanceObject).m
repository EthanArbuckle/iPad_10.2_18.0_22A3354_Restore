@implementation UITextField(PKAppearanceObject)

- (id)pk_childrenForAppearance
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

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
  return v2;
}

- (void)pk_applyAppearance:()PKAppearanceObject
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v4 = objc_msgSend(a1, "keyboardAppearance");
  if ((objc_msgSend(v23, "hasDarkAppearance") & 1) != 0)
  {
    v5 = 1;
LABEL_5:
    objc_msgSend(a1, "setKeyboardAppearance:", v5);
    goto LABEL_6;
  }
  if (objc_msgSend(a1, "keyboardAppearance") == 1)
  {
    v5 = 0;
    goto LABEL_5;
  }
LABEL_6:
  if (v4 != objc_msgSend(a1, "keyboardAppearance") && objc_msgSend(a1, "isFirstResponder"))
    objc_msgSend(a1, "reloadInputViews");
  objc_msgSend(v23, "editableTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTextColor:", v6);

  objc_msgSend(v23, "editablePlaceholderTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pk_setPlaceholderColor:", v7);

  objc_msgSend(v23, "editableInsertionPointColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setInsertionPointColor:", v8);

  objc_msgSend(v23, "editableSelectionBarColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setSelectionBarColor:", v9);

  objc_msgSend(v23, "editableSelectionHighlightColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setSelectionHighlightColor:", v10);

  UIImageGetTextFieldClearButton();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "editableTextColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_flatImageWithColor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_clearButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImage:forState:", v13, 0);

  UIImageGetTextFieldClearButtonPressed();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "editablePlaceholderTextColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_flatImageWithColor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_clearButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setImage:forState:", v17, 1);

  UIImageGetTextFieldClearButtonDisabled();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "editablePlaceholderTextColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_flatImageWithColor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_clearButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setImage:forState:", v21, 2);

}

- (id)pk_placeholderColor
{
  return objc_getAssociatedObject(a1, sel_pk_placeholderColor);
}

- (void)pk_setPlaceholderColor:()PKAppearanceObject
{
  id v4;
  id v5;

  v4 = a3;
  objc_setAssociatedObject(a1, sel_pk_placeholderColor, v4, (void *)1);
  objc_msgSend(a1, "_placeholderLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v4);

}

@end
