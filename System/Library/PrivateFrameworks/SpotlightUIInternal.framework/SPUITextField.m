@implementation SPUITextField

- (SPUIHeaderBlurView)blurView
{
  return self->_blurView;
}

- (double)backgroundCornerRadius
{
  int v2;
  double result;

  v2 = objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled");
  result = 10.0;
  if (v2)
    return 16.0;
  return result;
}

- (void)updateWithPrimaryColor:(id)a3 secondaryColor:(id)a4 isOnDarkBackground:(BOOL)a5 appearance:(id)a6
{
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  _BOOL4 IsReduceTransparencyEnabled;
  int v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  void *v47;
  _BYTE v48[128];
  _QWORD v49[5];

  v7 = a5;
  v49[3] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  objc_storeStrong((id *)&self->_primaryColor, a3);
  objc_storeStrong((id *)&self->_secondaryColor, a4);
  self->_isOnDarkBackground = v7;
  if ((objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow") & 1) == 0)
  {
    IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
    if (IsReduceTransparencyEnabled)
    {
      v15 = 0;
      v16 = 0;
      v17 = 0;
    }
    else
    {
      if (v7)
        objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      else
        objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = !v7;
      v16 = v7;
    }
    -[SPUITextField tintView](self, "tintView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", v17);

    if (v15)
    if (v16)

    v19 = (uint64_t *)MEMORY[0x24BDE5BD8];
    if (!v7)
      v19 = (uint64_t *)MEMORY[0x24BDE5BD0];
    v20 = *v19;
    if (IsReduceTransparencyEnabled)
      v21 = 0;
    else
      v21 = v20;
    -[SPUITextField tintView](self, "tintView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setCompositingFilter:", v21);

  }
  -[SPUITextField setTintColor:](self, "setTintColor:", v11);
  -[SPUITextField setTextColor:](self, "setTextColor:", v11);
  -[SPUITextField leftView](self, "leftView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v24;
  -[SPUITextField _clearButton](self, "_clearButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v25;
  -[SPUITextField _placeholderLabel](self, "_placeholderLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPUITextField rightView](self, "rightView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[SPUITextField rightView](self, "rightView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "arrayByAddingObject:", v29);
    v30 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v30;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v31 = v27;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v43 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v36, "setTintColor:", v12, (_QWORD)v42);
        objc_msgSend(v13, "enableAppearanceForView:", v36);
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v33);
  }

  objc_msgSend(v11, "colorWithAlphaComponent:", 0.36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_alloc(MEMORY[0x24BDD1458]);
  -[SPUITextField placeholder](self, "placeholder");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = *MEMORY[0x24BEBB368];
  v47 = v37;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v38, "initWithString:attributes:", v39, v40);

  -[SPUITextField setAttributedPlaceholder:](self, "setAttributedPlaceholder:", v41);
}

- (UIView)tintView
{
  return (UIView *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setTextColor:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SPUITextField;
  v4 = a3;
  -[SPUITextField setTextColor:](&v6, sel_setTextColor_, v4);
  -[SPUITextField hintingView](self, "hintingView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColorForCompletionLabel:", v4);

}

- (void)updateFocusResult:(id)a3 cardSection:(id)a4 focusIsOnFirstResult:(BOOL)a5
{
  _BOOL8 v5;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  unint64_t v16;

  v5 = a5;
  v16 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  if (!v5)
  {
    -[SPUITextField restorationStringOnKBMovement](self, "restorationStringOnKBMovement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[SPUITextField restorationStringOnKBMovement](self, "restorationStringOnKBMovement");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISearchTextField setText:](self, "setText:", v10);

    }
  }
  -[SPUITextField setRestorationStringOnKBMovement:](self, "setRestorationStringOnKBMovement:", 0);
  if (!-[SPUITextField isFirstResponder](self, "isFirstResponder") || !(v16 | v8))
    goto LABEL_12;
  -[SPUITextField scribbleInteraction](self, "scribbleInteraction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isHandlingWriting"))
  {

LABEL_12:
    -[SPUITextField hintingView](self, "hintingView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateWithResult:cardSection:focusIsOnFirstResult:", 0, 0, v5);

    objc_msgSend(MEMORY[0x24BEBD5D8], "focusSystemForEnvironment:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requestFocusUpdateToEnvironment:", self);
    goto LABEL_13;
  }
  -[SPUITextField selectedTextRange](self, "selectedTextRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEmpty");

  if ((v13 & 1) == 0)
    goto LABEL_12;
  if (!-[SPUITextField lastUpdateWasDeletion](self, "lastUpdateWasDeletion") || !v5)
  {
    -[SPUITextField hintingView](self, "hintingView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateWithResult:cardSection:focusIsOnFirstResult:", v16, v8, v5);
LABEL_13:

  }
  -[SPUITextField updateCaretVisibility](self, "updateCaretVisibility");

}

- (void)updateCaretVisibility
{
  id v3;

  -[SPUITextField hintingView](self, "hintingView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SPUITextField updateCaretVisibility:](self, "updateCaretVisibility:", objc_msgSend(v3, "hasContent") ^ 1);

}

- (void)updateCaretVisibility:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    -[SPUITextField removeCaretAssertion](self, "removeCaretAssertion");
  }
  else
  {
    -[SPUITextField caretAssertion](self, "caretAssertion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[SPUITextField _textInteraction](self, "_textInteraction");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_assertionController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nonVisibleAssertionWithReason:", CFSTR("spotlightHasCompletion"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUITextField setCaretAssertion:](self, "setCaretAssertion:", v6);

    }
  }
}

- (void)setCaretAssertion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1296);
}

- (void)removeCaretAssertion
{
  void *v3;

  -[SPUITextField caretAssertion](self, "caretAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SPUITextField setCaretAssertion:](self, "setCaretAssertion:", 0);
}

- (UITextCursorAssertion)caretAssertion
{
  return (UITextCursorAssertion *)objc_getProperty(self, a2, 1296, 1);
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)SPUITextField;
  -[UISearchTextField layoutSubviews](&v26, sel_layoutSubviews);
  -[SPUITextField _fieldEditor](self, "_fieldEditor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (!-[SPUITextField effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
  {
    -[SPUITextField bounds](self, "bounds");
    -[SPUITextField textRectForBounds:](self, "textRectForBounds:");
    v13 = v12;
    v11 = v14;
    -[SPUITextField bounds](self, "bounds");
    -[SPUITextField clearButtonRectForBounds:](self, "clearButtonRectForBounds:");
    v9 = v13 + v15 + -16.0;
  }
  -[SPUITextField hintingView](self, "hintingView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v5, v7, v9, v11);

  -[SPUITextField hintingView](self, "hintingView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hasPrefix");
  -[SPUITextField _fieldEditor](self, "_fieldEditor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHidden:", v18);

  -[SPUITextField _fieldEditor](self, "_fieldEditor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "alpha");
  v22 = v21;

  if (v22 == 1.0)
  {
    -[SPUITextField hintingView](self, "hintingView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "hasContent");
    -[SPUITextField _placeholderLabel](self, "_placeholderLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setHidden:", v24);

  }
}

- (SPUICompletionStringView)hintingView
{
  return (SPUICompletionStringView *)objc_getProperty(self, a2, 1280, 1);
}

- (void)setRestorationStringOnKBMovement:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1312);
}

- (NSString)restorationStringOnKBMovement
{
  return (NSString *)objc_getProperty(self, a2, 1312, 1);
}

- (id)nextResponder
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  -[SPUITextField responderForKeyboardInput](self, "responderForKeyboardInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_msgSend(MEMORY[0x24BEBD6C8], "isInHardwareKeyboardMode") & 1) != 0)
  {
    -[SPUITextField responderForKeyboardInput](self, "responderForKeyboardInput");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SPUITextField;
    -[SPUITextField nextResponder](&v7, sel_nextResponder);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (UIResponder)responderForKeyboardInput
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_responderForKeyboardInput);
}

uint64_t __38__SPUITextField_keyboardFrameChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTextAlignment:", *(_QWORD *)(a1 + 40));
}

- (void)setResponderForKeyboardInput:(id)a3
{
  objc_storeWeak((id *)&self->_responderForKeyboardInput, a3);
}

- (void)keyboardFrameChanged:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double Height;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  BOOL v32;
  uint64_t v33;
  _QWORD v34[6];
  CGRect v35;
  CGRect v36;
  CGRect v37;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BEBE468]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[SPUITextField tlks_screen](self, "tlks_screen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v35.origin.x = v7;
  v35.origin.y = v9;
  v35.size.width = v11;
  v35.size.height = v13;
  v37.origin.x = v16;
  v37.origin.y = v18;
  v37.size.width = v20;
  v37.size.height = v22;
  v36 = CGRectIntersection(v35, v37);
  Height = CGRectGetHeight(v36);
  -[SPUITextField window](self, "window");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "windowScene");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_FBSScene");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "settings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "displayConfiguration");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "identity");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v29, "isContinuityDisplay") & 1) != 0)
    v30 = 1;
  else
    v30 = objc_msgSend(MEMORY[0x24BEBD6C8], "isInHardwareKeyboardMode");

  if (Height > 0.0)
    v31 = 1;
  else
    v31 = v30;
  v32 = v31 == 0;
  v33 = 4;
  if (v32)
    v33 = 1;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __38__SPUITextField_keyboardFrameChanged___block_invoke;
  v34[3] = &unk_24F9D5CA0;
  v34[4] = self;
  v34[5] = v33;
  objc_msgSend(MEMORY[0x24BE85288], "performAnimatableChanges:", v34);
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  v8.receiver = self;
  v8.super_class = (Class)SPUITextField;
  -[UISearchTextField editingRectForBounds:](&v8, sel_editingRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SPUITextField _shiftedBoundsForText:](self, "_shiftedBoundsForText:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  v8.receiver = self;
  v8.super_class = (Class)SPUITextField;
  -[UISearchTextField textRectForBounds:](&v8, sel_textRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SPUITextField _shiftedBoundsForText:](self, "_shiftedBoundsForText:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  objc_super v20;
  CGRect v21;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow"))
  {
    -[SPUITextField textFieldHeight](self, "textFieldHeight");
    v9 = v8;
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v10 = CGRectGetMaxX(v21) - v9 + -2.0;
    v11 = v9;
  }
  else if (objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled"))
  {
    v20.receiver = self;
    v20.super_class = (Class)SPUITextField;
    -[UISearchTextField rightViewRectForBounds:](&v20, sel_rightViewRectForBounds_, x, y, width, height);
    y = v12;
    v9 = v13;
    v10 = v14 + -3.5;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SPUITextField;
    -[UISearchTextField rightViewRectForBounds:](&v19, sel_rightViewRectForBounds_, x, y, width, height);
    y = v15;
    v9 = v16;
  }
  v17 = y;
  v18 = v9;
  result.size.height = v11;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v10;
  return result;
}

- (CGRect)_shiftedBoundsForText:(CGRect)a3
{
  CGFloat height;
  double width;
  CGFloat y;
  double x;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow"))
  {
    -[SPUITextField textFieldHeight](self, "textFieldHeight");
    v9 = v8;
    -[UISearchTextField tokens](self, "tokens");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v12 = 12.0;
    if (!v11)
      v12 = 4.0;
    x = v9 - v12;

    -[SPUITextField bounds](self, "bounds");
    width = CGRectGetWidth(v24) - (v9 + v9);
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceLayoutDirection");

    if (!v14)
    {
      -[SPUITextField hintingView](self, "hintingView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "trailingPaddingForFieldEditor");
      width = width - v16;

    }
  }
  else if (objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled"))
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "userInterfaceLayoutDirection");

    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BEB4BA0], "deviceScaledRoundedValue:forView:", self, 7.5);
      x = x + v19;
      width = width + -16.0;
    }
  }
  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v25;
  objc_super v26;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow"))
  {
    if (-[SPUITextField effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
      -[SPUITextField leftViewRectForBounds:](self, "leftViewRectForBounds:", x, y, width, height);
    else
      -[SPUITextField rightViewRectForBounds:](self, "rightViewRectForBounds:", x, y, width, height);
    goto LABEL_10;
  }
  if (!objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled"))
  {
    v25.receiver = self;
    v25.super_class = (Class)SPUITextField;
    -[UISearchTextField clearButtonRectForBounds:](&v25, sel_clearButtonRectForBounds_, x, y, width, height);
LABEL_10:
    v15 = v9;
    v17 = v10;
    v19 = v11;
    goto LABEL_11;
  }
  v26.receiver = self;
  v26.super_class = (Class)SPUITextField;
  -[UISearchTextField clearButtonRectForBounds:](&v26, sel_clearButtonRectForBounds_, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = -[SPUITextField effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v21 = -3.5;
  if (!v20)
    v21 = 7.5;
  v8 = v13 - v21;
LABEL_11:
  v22 = v15;
  v23 = v17;
  v24 = v19;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v8;
  return result;
}

- (CGRect)leftViewRectForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  objc_super v17;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow"))
  {
    -[SPUITextField textFieldHeight](self, "textFieldHeight");
    v9 = v8;
    v10 = v8 + 1.0;
    v11 = x + -1.0;
  }
  else if (objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled"))
  {
    v17.receiver = self;
    v17.super_class = (Class)SPUITextField;
    -[UISearchTextField leftViewRectForBounds:](&v17, sel_leftViewRectForBounds_, x, y, width, height);
    y = v12;
    v11 = v13 + 7.0;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SPUITextField;
    -[UISearchTextField leftViewRectForBounds:](&v16, sel_leftViewRectForBounds_, x, y, width, height);
    y = v14;
  }
  v15 = y;
  result.size.height = v9;
  result.size.width = v10;
  result.origin.y = v15;
  result.origin.x = v11;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(MEMORY[0x24BE85210], "idealPlatterWidth");
  v4 = v3;
  -[SPUITextField textFieldHeight](self, "textFieldHeight");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (double)textFieldHeight
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v10;
  objc_super v11;

  if (objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled"))
  {
    v3 = (void *)MEMORY[0x24BEB4BA0];
    objc_msgSend((id)objc_opt_class(), "lineHeightMultiplierForCurrentLanguage");
    v5 = v4 * 48.0;
    -[SPUITextField font](self, "font");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scaledValueForValue:withFont:view:", v6, self, v5);
    v8 = v7;

    return v8;
  }
  else if ((objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow") & 1) != 0)
  {
    return 61.0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SPUITextField;
    -[UISearchTextField intrinsicContentSize](&v11, sel_intrinsicContentSize);
    return v10;
  }
}

+ (double)lineHeightMultiplierForCurrentLanguage
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  int v10;

  v2 = (void *)MEMORY[0x24BDBCEA0];
  objc_msgSend(MEMORY[0x24BEBD6F0], "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentInputMode");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "primaryLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeWithLocaleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(&unk_24F9E0768, "containsObject:", v7);

  if ((v4 & 1) != 0)
  {
    v8 = 1.18;
  }
  else
  {
    objc_msgSend(v6, "languageCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(&unk_24F9E0780, "containsObject:", v9);

    if (v10)
      v8 = 1.27;
    else
      v8 = 1.0;
  }

  return v8;
}

- (SPUITextField)init
{
  SPUITextField *v2;
  SPUITextField *v3;
  void *v4;
  void *v5;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  id v34;
  id location;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)SPUITextField;
  v2 = -[SPUITextField init](&v36, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SPUITextField setSymbolAnimationEnabled:](v2, "setSymbolAnimationEnabled:", 0);
    -[SPUITextField setBorderStyle:](v3, "setBorderStyle:", 0);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SEARCH_BAR_PLACEHOLDER"), &stru_24F9D6A70, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUITextField setPlaceholder:](v3, "setPlaceholder:", v5);

    -[SPUITextField setAutocapitalizationType:](v3, "setAutocapitalizationType:", 0);
    -[SPUITextField setAutocorrectionType:](v3, "setAutocorrectionType:", 1);
    -[SPUITextField setReturnKeyType:](v3, "setReturnKeyType:", 6);
    -[SPUITextField setEnablesReturnKeyAutomatically:](v3, "setEnablesReturnKeyAutomatically:", 1);
    -[SPUITextField setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("SpotlightSearchField"));
    -[SPUITextField setAcceptsDictationSearchResults:](v3, "setAcceptsDictationSearchResults:", 1);
    objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 23.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUITextField setAccessoryIconFont:](v3, "setAccessoryIconFont:", v6);

    if (objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow"))
    {
      objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 26.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUITextField setFont:](v3, "setFont:", v7);

      objc_initWeak(&location, v3);
      v8 = (void *)MEMORY[0x24BEBD388];
      v30 = MEMORY[0x24BDAC760];
      v31 = 3221225472;
      v32 = __21__SPUITextField_init__block_invoke;
      v33 = &unk_24F9D5C78;
      objc_copyWeak(&v34, &location);
      objc_msgSend(v8, "actionWithHandler:", &v30);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD438], "plainButtonConfiguration", v30, v31, v32, v33);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setImagePlacement:", 15);
      -[SPUITextField accessoryIconWithSymbolName:](v3, "accessoryIconWithSymbolName:", CFSTR("magnifyingglass"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setImage:", v11);

      objc_msgSend(MEMORY[0x24BEBD430], "buttonWithConfiguration:primaryAction:", v10, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUITextField setLeftView:](v3, "setLeftView:", v12);

      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD908]), "initWithDelegate:", v3);
      -[SPUITextField setScribbleInteraction:](v3, "setScribbleInteraction:", v13);
      -[SPUITextField addInteraction:](v3, "addInteraction:", v13);
      -[SPUITextField resetClearButtonWithScale:](v3, "resetClearButtonWithScale:", 1);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
    }
    else
    {
      -[SPUITextField setCanAcquireFieldEditor:](v3, "setCanAcquireFieldEditor:", 1);
      v14 = (void *)objc_opt_new();
      objc_msgSend(v14, "setUserInteractionEnabled:", 0);
      -[SPUITextField subviews](v3, "subviews");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUITextField insertSubview:belowSubview:](v3, "insertSubview:belowSubview:", v14, v16);

      objc_msgSend(MEMORY[0x24BE85220], "constrainViewToContainer:", v14);
      -[SPUITextField setTintView:](v3, "setTintView:", v14);
      if (objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled"))
      {
        -[SPUITextField tintView](v3, "tintView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeFromSuperview");

      }
      -[SPUITextField applyMetrics](v3, "applyMetrics");
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObserver:selector:name:object:", v3, sel_applyMetrics, *MEMORY[0x24BEBE088], 0);

      -[SPUITextField setKeyboardAppearance:](v3, "setKeyboardAppearance:", 11);
    }
    v19 = (void *)objc_opt_new();
    -[SPUITextField setHintingView:](v3, "setHintingView:", v19);

    -[SPUITextField font](v3, "font");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUITextField hintingView](v3, "hintingView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFontForCompletionLabel:", v20);

    -[SPUITextField hintingView](v3, "hintingView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUITextField subviews](v3, "subviews");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "lastObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUITextField insertSubview:below:](v3, "insertSubview:below:", v22, v24);

    -[SPUITextField layer](v3, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAllowsGroupBlending:", 0);

    -[SPUITextField leftView](v3, "leftView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTintColor:", 0);

    -[SPUITextField setTextDragOptions:](v3, "setTextDragOptions:", 1);
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v3, sel_textFieldWasTapped);
    objc_msgSend(v27, "setDelegate:", v3);
    -[SPUITextField addGestureRecognizer:](v3, "addGestureRecognizer:", v27);
    -[SPUITextField setCompletionTapGestureRecognizer:](v3, "setCompletionTapGestureRecognizer:", v27);
    if (objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled"))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObserver:selector:name:object:", v3, sel_keyboardFrameChanged_, *MEMORY[0x24BEBE570], 0);

    }
    -[SPUITextField setSymbolAnimationEnabled:](v3, "setSymbolAnimationEnabled:", 0);

  }
  return v3;
}

- (void)setCanAcquireFieldEditor:(BOOL)a3
{
  id v3;

  self->_canAcquireFieldEditor = a3;
  if (!a3)
  {
    -[SPUITextField blurView](self, "blurView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 0.0);

  }
}

- (void)setTintView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1264);
}

- (void)setHintingView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1280);
}

- (void)setCompletionTapGestureRecognizer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1288);
}

- (void)setAccessoryIconFont:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1352);
}

- (void)applyMetrics
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled"))
    v3 = 16.0;
  else
    v3 = 10.0;
  -[SPUITextField tintView](self, "tintView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setContinuousCornerRadius:", v3);

  -[SPUITextField blurView](self, "blurView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setContinuousCornerRadius:", v3);

  -[SPUITextField blurView](self, "blurView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setContinuousCornerRadius:", v3);

  -[SPUITextField invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUITextField setFont:](self, "setFont:", v8);

  if (objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled"))
  {
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE250]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUITextField setFont:](self, "setFont:", v9);

  }
  -[SPUITextField resetPhoneClearButton](self, "resetPhoneClearButton");
}

- (void)setFont:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SPUITextField;
  -[SPUITextField setFont:](&v6, sel_setFont_, a3);
  -[SPUITextField font](self, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUITextField hintingView](self, "hintingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFontForCompletionLabel:", v4);

}

- (void)resetPhoneClearButton
{
  uint64_t v3;

  if ((objc_msgSend(MEMORY[0x24BEB0808], "enableFloatingWindow") & 1) == 0)
  {
    if (objc_msgSend(MEMORY[0x24BEB4BA0], "isSuperLargeAccessibilitySize"))
      v3 = 1;
    else
      v3 = 2;
    -[SPUITextField resetClearButtonWithScale:](self, "resetClearButtonWithScale:", v3);
  }
}

- (void)resetClearButtonWithScale:(int64_t)a3
{
  id v4;

  -[SPUITextField accessoryIconWithSymbolName:](self, "accessoryIconWithSymbolName:", CFSTR("xmark.circle.fill"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UISearchTextField _setClearButtonImage:forState:](self, "_setClearButtonImage:forState:", v4, 0);

}

- (id)accessoryIconWithSymbolName:(id)a3
{
  void *v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BEB0808];
  v5 = a3;
  v6 = objc_msgSend(v4, "enableFloatingWindow");
  v7 = (void *)MEMORY[0x24BE85280];
  if (v6)
  {
    -[SPUITextField accessoryIconFont](self, "accessoryIconFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uiImageWithSymbolName:font:scale:weight:isTemplate:", v5, v8, -1, 6, 1);
  }
  else
  {
    -[SPUITextField font](self, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uiImageWithSymbolName:font:scale:", v5, v8, -1);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setMicrophoneImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1328);
}

- (UIImage)microphoneImage
{
  return (UIImage *)objc_getProperty(self, a2, 1328, 1);
}

- (void)updateRightView
{
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[SPUITextField hasContent](self, "hasContent");
  if (v3)
    v4 = 3;
  else
    v4 = 0;
  if (v3)
    v5 = 0;
  else
    v5 = 3;
  -[SPUITextField setClearButtonMode:](self, "setClearButtonMode:", v4);
  -[SPUITextField setRightViewMode:](self, "setRightViewMode:", v5);
  -[SPUITextField layoutIfNeeded](self, "layoutIfNeeded");
}

- (BOOL)hasContent
{
  void *v3;
  BOOL v4;
  void *v5;

  -[UISearchTextField text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 1;
  }
  else
  {
    -[UISearchTextField tokens](self, "tokens");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  objc_super v13;
  uint8_t buf[16];

  -[SPUITextField animateAssertion](self, "animateAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[SPUITextField keyboardSceneDelegate](self, "keyboardSceneDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[SPUITextField keyboardSceneDelegate](self, "keyboardSceneDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "requestAnimationAssertionWithDirection:", 6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUITextField setAnimateAssertion:](self, "setAnimateAssertion:", v7);

    }
  }
  v8 = MEMORY[0x24BEB0818];
  v9 = *(NSObject **)(MEMORY[0x24BEB0818] + 16);
  if (!v9)
  {
    SPUIInitLogging();
    v9 = *(NSObject **)(v8 + 16);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E078000, v9, OS_LOG_TYPE_DEFAULT, "becomeFirstResponder", buf, 2u);
  }
  -[SPUITextField delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "currentlyPresentingWebEntity");

  -[SPUITextField detokenizeIfNeededAndSearch:](self, "detokenizeIfNeededAndSearch:", 0);
  -[SPUITextField setDidShowWebEntityBeforeTap:](self, "setDidShowWebEntityBeforeTap:", v11);
  v13.receiver = self;
  v13.super_class = (Class)SPUITextField;
  return -[UISearchTextField becomeFirstResponder](&v13, sel_becomeFirstResponder);
}

- (void)setDidShowWebEntityBeforeTap:(BOOL)a3
{
  self->_didShowWebEntityBeforeTap = a3;
}

- (void)setAnimateAssertion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1336);
}

- (void)detokenizeIfNeededAndSearch:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  dispatch_time_t v22;
  void *v23;
  _QWORD block[5];

  v3 = a3;
  if (!objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled"))
    goto LABEL_18;
  -[SPUITextField delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "currentlyPresentingWebEntity") & 1) != 0)
  {

    goto LABEL_5;
  }
  v6 = -[SPUITextField didShowWebEntityBeforeTap](self, "didShowWebEntityBeforeTap");

  if (v6)
  {
LABEL_5:
    -[UISearchTextField tokens](self, "tokens");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "representedObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v11 = (void *)objc_opt_class();
      -[UISearchTextField tokens](self, "tokens");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "representedObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "webEntityStringForEntity:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[UISearchTextField tokens](self, "tokens");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "representedObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v19 = objc_opt_isKindOfClass();

      if ((v19 & 1) == 0)
      {
        v15 = 0;
        goto LABEL_11;
      }
      -[UISearchTextField tokens](self, "tokens");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "representedObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_11:
    if (objc_msgSend(v15, "length"))
    {
      -[SPUITextField clearAllTokens](self, "clearAllTokens");
      -[UISearchTextField setText:](self, "setText:", v15);
      -[SPUITextField setNeedsLayout](self, "setNeedsLayout");
      -[SPUITextField delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "textFieldDidReplaceTokensWithStringEquivalent:", self);

    }
    if (v3)
    {
      -[SPUITextField delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "switchToSuggestions");

    }
  }
  if (v3)
  {
    -[SPUITextField becomeFirstResponder](self, "becomeFirstResponder");
    v22 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__SPUITextField_detokenizeIfNeededAndSearch___block_invoke;
    block[3] = &unk_24F9D5CC8;
    block[4] = self;
    dispatch_after(v22, MEMORY[0x24BDAC9B8], block);
  }
LABEL_18:
  -[SPUITextField canvasView](self, "canvasView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAlpha:", 1.0);

}

- (BOOL)didShowWebEntityBeforeTap
{
  return self->_didShowWebEntityBeforeTap;
}

- (id)animateAssertion
{
  return objc_getProperty(self, a2, 1336, 1);
}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SPUITextField;
  -[UISearchTextField tintColorDidChange](&v5, sel_tintColorDidChange);
  -[SPUITextField selectionHighlightColor](self, "selectionHighlightColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUITextField hintingView](self, "hintingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectionHighlightColor:", v3);

}

- (void)removeCompletionAndHighlight
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[SPUITextField hintingView](self, "hintingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "focusIsOnFirstResult");

  -[SPUITextField hintingView](self, "hintingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithResult:cardSection:focusIsOnFirstResult:", 0, 0, 0);

  if (v4)
  {
    -[SPUITextField delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeCompletionAndHighlightAsTyped:", 0);

  }
  -[SPUITextField updateCaretVisibility](self, "updateCaretVisibility");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SPUITextField;
  -[SPUITextField traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[SPUITextField resetPhoneClearButton](self, "resetPhoneClearButton");
}

void __21__SPUITextField_init__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "backButtonPressed");

}

- (void)setSelectionGrabbersHiddenSafe:(BOOL)a3
{
  id v4;

  if (a3)
  {
    -[SPUITextField obtainSelectionGrabberSuppressionAssertion](self, "obtainSelectionGrabberSuppressionAssertion");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SPUITextField setAssertionForGrabbers:](self, "setAssertionForGrabbers:", v4);

  }
  else
  {
    -[SPUITextField setAssertionForGrabbers:](self, "setAssertionForGrabbers:", 0);
  }
}

- (void)textFieldWasTapped
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  if ((objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled") & 1) == 0)
  {
    -[SPUITextField delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "currentlyPresentingWebEntity");

    -[SPUITextField searchEntity](self, "searchEntity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 || (v4 & 1) == 0)
    {
      -[SPUITextField removeCompletionsOrEntitiesAndGoToSuggestions:](self, "removeCompletionsOrEntitiesAndGoToSuggestions:", 1);
    }
    else
    {
      v6 = MEMORY[0x24BEB0818];
      v7 = *(NSObject **)(MEMORY[0x24BEB0818] + 8);
      if (!v7)
      {
        SPUIInitLogging();
        v7 = *(NSObject **)(v6 + 8);
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_22E078000, v7, OS_LOG_TYPE_DEFAULT, "Search field was tapped while showing web entity results, switching to suggestions.", v9, 2u);
      }
      -[SPUITextField delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "switchToSuggestions");

    }
  }
  -[SPUITextField detokenizeIfNeededAndSearch:](self, "detokenizeIfNeededAndSearch:", 1);
}

uint64_t __45__SPUITextField_detokenizeIfNeededAndSearch___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "selectAll:", 0);
}

- (void)removeCompletionsOrEntitiesAndGoToSuggestions:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  v3 = a3;
  v5 = (void *)objc_opt_class();
  -[SPUITextField searchEntity](self, "searchEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webEntityStringForEntity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    -[SPUITextField clearAllTokens](self, "clearAllTokens");
    -[UISearchTextField setText:](self, "setText:", v7);
    -[SPUITextField delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textFieldDidReplaceTokensWithStringEquivalent:", self);

    if (v3)
    {
      v9 = MEMORY[0x24BEB0818];
      v10 = *(NSObject **)(MEMORY[0x24BEB0818] + 8);
      if (!v10)
      {
        SPUIInitLogging();
        v10 = *(NSObject **)(v9 + 8);
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_22E078000, v10, OS_LOG_TYPE_DEFAULT, "Search field was tapped while showing web entity results, switching to suggestions.", v12, 2u);
      }
      -[SPUITextField delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "switchToSuggestions");

    }
    else
    {
      -[SPUITextField setNeedsLayout](self, "setNeedsLayout");
    }
  }
  else
  {
    -[SPUITextField removeCompletionAndHighlight](self, "removeCompletionAndHighlight");
  }

}

- (id)focusGroupIdentifier
{
  return (id)objc_msgSend(MEMORY[0x24BE85288], "focusGroupIdentifier");
}

+ (id)webEntityStringForEntity:(id)a3
{
  id v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "command");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "entityType");

    if (v6 == 3)
    {
      objc_msgSend(v4, "command");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tokenString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)optOutOfGoButton
{
  BOOL v3;
  void *v4;

  if (-[SPUITextField lastUpdateWasDeletion](self, "lastUpdateWasDeletion")
    && -[SPUITextField hasContent](self, "hasContent"))
  {
    return 1;
  }
  -[SPUITextField restorationStringOnKBMovement](self, "restorationStringOnKBMovement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (void)setSearchFieldModel:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[SPUITextField hintingView](self, "hintingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchFieldModel:", v4);

  -[SPUITextField updateCaretVisibility](self, "updateCaretVisibility");
}

- (id)currentQueryContext
{
  void *v2;
  void *v3;

  -[SPUITextField hintingView](self, "hintingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchFieldModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  id v6;
  int v7;
  void *v9;
  int v10;
  void *v11;

  v5 = a3;
  -[SPUITextField completionTapGestureRecognizer](self, "completionTapGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    -[SPUITextField delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "currentlyPresentingWebEntity");

    if (objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled"))
    {
      if (v10)
        return -[SPUITextField isFirstResponder](self, "isFirstResponder") ^ 1;
    }
    else if (v10 && -[SPUITextField isEditing](self, "isEditing"))
    {
      -[SPUITextField selectedTextRange](self, "selectedTextRange");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v11, "isEmpty") ^ 1;

      return v7;
    }
  }
  LOBYTE(v7) = 1;
  return v7;
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  double y;
  double x;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  -[SPUITextField removeCompletionAndHighlight](self, "removeCompletionAndHighlight");
  v6.receiver = self;
  v6.super_class = (Class)SPUITextField;
  -[SPUITextField beginFloatingCursorAtPoint:](&v6, sel_beginFloatingCursorAtPoint_, x, y);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  -[SPUITextField completionTapGestureRecognizer](self, "completionTapGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[SPUITextField firstResponder](self, "firstResponder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 == 0;

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SPUITextField;
    if (-[UISearchTextField gestureRecognizerShouldBegin:](&v9, sel_gestureRecognizerShouldBegin_, v4))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[SPUITextField removeCompletionAndHighlight](self, "removeCompletionAndHighlight");
      v6 = 1;
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  -[SPUITextField responderForKeyboardInput](self, "responderForKeyboardInput");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8, v10 = objc_msgSend(MEMORY[0x24BEBD6C8], "isInHardwareKeyboardMode"), v9, v10))
  {
    -[SPUITextField responderForKeyboardInput](self, "responderForKeyboardInput");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pressesEnded:withEvent:", v6, v7);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SPUITextField;
    -[SPUITextField pressesEnded:withEvent:](&v12, sel_pressesEnded_withEvent_, v6, v7);
  }

}

- (BOOL)keyboardInputShouldDelete:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[SPUITextField hintingView](self, "hintingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasContent");

  v10.receiver = self;
  v10.super_class = (Class)SPUITextField;
  LODWORD(v5) = -[SPUITextField keyboardInputShouldDelete:](&v10, sel_keyboardInputShouldDelete_, v4);

  if (!(_DWORD)v5)
    return 0;
  if ((!-[SPUITextField lastUpdateWasDeletion](self, "lastUpdateWasDeletion") | v6) != 1)
    return 1;
  -[SPUITextField setLastUpdateWasDeletion:](self, "setLastUpdateWasDeletion:", 1);
  -[SPUITextField hintingView](self, "hintingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateWithResult:cardSection:focusIsOnFirstResult:", 0, 0, 1);

  if (-[SPUITextField returnKeyType](self, "returnKeyType") != 6)
  {
    -[SPUITextField setReturnKeyType:](self, "setReturnKeyType:", 6);
    objc_msgSend((id)objc_opt_class(), "updateBlueButton");
  }
  -[SPUITextField updateCaretVisibility:](self, "updateCaretVisibility:", 1);
  -[SPUITextField delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeCompletionAndHighlightAsTyped:", 1);

  return v6 ^ 1;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  objc_super v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  -[SPUITextField resetDeletion](self, "resetDeletion");
  v11.receiver = self;
  v11.super_class = (Class)SPUITextField;
  LOBYTE(v5) = -[SPUITextField keyboardInput:shouldInsertText:isMarkedText:](&v11, sel_keyboardInput_shouldInsertText_isMarkedText_, v9, v8, v5);

  return v5;
}

- (void)insertText:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[SPUITextField resetDeletion](self, "resetDeletion");
  v5.receiver = self;
  v5.super_class = (Class)SPUITextField;
  -[UISearchTextField insertText:](&v5, sel_insertText_, v4);

}

- (_NSRange)insertFilteredText:(id)a3
{
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  objc_super v9;
  _NSRange result;

  v9.receiver = self;
  v9.super_class = (Class)SPUITextField;
  v4 = -[UISearchTextField insertFilteredText:](&v9, sel_insertFilteredText_, a3);
  v6 = v5;
  -[SPUITextField resetDeletion](self, "resetDeletion");
  v7 = (NSUInteger)v4;
  v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)resetDeletion
{
  -[SPUITextField setLastUpdateWasDeletion:](self, "setLastUpdateWasDeletion:", 0);
  -[SPUITextField setRestorationStringOnKBMovement:](self, "setRestorationStringOnKBMovement:", 0);
}

- (BOOL)resignFirstResponder
{
  uint64_t v3;
  NSObject *v4;
  objc_super v6;
  uint8_t buf[16];

  -[SPUITextField removeCompletionAndHighlight](self, "removeCompletionAndHighlight");
  v3 = MEMORY[0x24BEB0818];
  v4 = *(NSObject **)(MEMORY[0x24BEB0818] + 16);
  if (!v4)
  {
    SPUIInitLogging();
    v4 = *(NSObject **)(v3 + 16);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22E078000, v4, OS_LOG_TYPE_DEFAULT, "resignFirstResponder", buf, 2u);
  }
  v6.receiver = self;
  v6.super_class = (Class)SPUITextField;
  return -[UISearchTextField resignFirstResponder](&v6, sel_resignFirstResponder);
}

- (void)selectAll:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SPUITextField;
  -[SPUITextField selectAll:](&v4, sel_selectAll_, a3);
  -[SPUITextField removeCompletionsOrEntitiesAndGoToSuggestions:](self, "removeCompletionsOrEntitiesAndGoToSuggestions:", 0);
  -[SPUITextField removeCaretAssertion](self, "removeCaretAssertion");
}

- (BOOL)shouldPromoteCompletion
{
  BOOL v3;
  void *v4;
  void *v5;

  if ((-[SPUITextField hasMarkedText](self, "hasMarkedText") & 1) != 0)
    return 0;
  -[SPUITextField hintingView](self, "hintingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "completionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5 != 0;

  return v3;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SPUITextField;
  v3 = a3;
  -[SPUITextField buildMenuWithBuilder:](&v4, sel_buildMenuWithBuilder_, v3);
  objc_msgSend(v3, "removeMenuForIdentifier:", CFSTR("com.apple.menu.insert-from-external-sources"), v4.receiver, v4.super_class);

}

- (id)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  -[SPUITextField responderForKeyboardInput](self, "responderForKeyboardInput");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  -[SPUITextField hintingView](self, "hintingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SPUITextField responderForKeyboardInput](self, "responderForKeyboardInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    v11[1] = self;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
LABEL_4:
    v10.receiver = self;
    v10.super_class = (Class)SPUITextField;
    -[SPUITextField preferredFocusEnvironments](&v10, sel_preferredFocusEnvironments);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (BOOL)needsLandscapeHeight
{
  if ((unint64_t)(-[SPUITextField activeInterfaceOrientation](self, "activeInterfaceOrientation") - 3) > 1)
    return 0;
  else
    return objc_msgSend(MEMORY[0x24BE85288], "isIpad") ^ 1;
}

- (NSString)textIncludingTokens
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[UISearchTextField tokens](self, "tokens", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "representedObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "tokenText");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendString:", v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  -[UISearchTextField text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v11);

  objc_msgSend((id)objc_opt_class(), "removeDictationCharacterInString:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

+ (id)removeDictationCharacterInString:(id)a3
{
  return (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\uFFFC"), &stru_24F9D6A70);
}

- (void)clearAllTokens
{
  SPUITextField *i;
  void *v3;
  uint64_t v4;

  for (i = self; ; self = i)
  {
    -[UISearchTextField tokens](self, "tokens");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (!v4)
      break;
    -[UISearchTextField removeTokenAtIndex:](i, "removeTokenAtIndex:", 0);
  }
}

- (void)updateToken:(id)a3
{
  id v4;

  v4 = a3;
  -[SPUITextField setIgnoreTokensUpdate:](self, "setIgnoreTokensUpdate:", 1);
  -[SPUITextField clearAllTokens](self, "clearAllTokens");
  if (v4)
    -[UISearchTextField insertToken:atIndex:](self, "insertToken:atIndex:", v4, 0);
  -[SPUITextField setIgnoreTokensUpdate:](self, "setIgnoreTokensUpdate:", 0);
  -[SPUITextField updateRightView](self, "updateRightView");

}

- (void)updateTextRange:(id)a3
{
  __CFString *v5;
  __CFString *v6;
  void *v7;
  id v8;

  v5 = &stru_24F9D6A70;
  if (a3)
    v5 = (__CFString *)a3;
  v6 = v5;
  v8 = a3;
  -[SPUITextField setIgnoreTokensUpdate:](self, "setIgnoreTokensUpdate:", 1);
  -[UISearchTextField textualRange](self, "textualRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchTextField replaceRange:withText:](self, "replaceRange:withText:", v7, v6);

  -[SPUITextField setIgnoreTokensUpdate:](self, "setIgnoreTokensUpdate:", 0);
  -[SPUITextField updateRightView](self, "updateRightView");

}

- (void)updateLeftViewWithSymbolName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SPUITextField leftView](self, "leftView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUITextField accessoryIconWithSymbolName:](self, "accessoryIconWithSymbolName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setImage:", v6);
  objc_msgSend(v7, "setConfiguration:", v5);

}

- (SPSearchEntity)searchEntity
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  char isKindOfClass;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[UISearchTextField tokens](self, "tokens", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "representedObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v6, "representedObject");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (SPSearchEntity *)v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  int v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v6 = a4;
  if (NSSelectorFromString(CFSTR("_define:")) == a3
    || NSSelectorFromString(CFSTR("_lookup:")) == a3
    || NSSelectorFromString(CFSTR("_share:")) == a3
    || NSSelectorFromString(CFSTR("_translate:")) == a3)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SPUITextField;
    v7 = -[UISearchTextField canPerformAction:withSender:](&v14, sel_canPerformAction_withSender_, a3, v6);
    if (sel_enterKeyPressed == a3)
    {
      v8 = -[SPUITextField hasMarkedText](self, "hasMarkedText") ^ 1;
    }
    else if (sel_commitToCommitedSearch == a3 || (LOBYTE(v8) = v7, sel_toggleCommitedSearch == a3))
    {
      if ((-[SPUITextField hasMarkedText](self, "hasMarkedText") & 1) != 0)
      {
        v8 = 0;
      }
      else
      {
        -[UISearchTextField text](self, "text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "length"))
        {
          -[UISearchTextField tokens](self, "tokens");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v11, "count") == 0;

        }
        else
        {
          v8 = 0;
        }

      }
      if (sel_toggleCommitedSearch == a3)
      {
        -[SPUITextField switchBackToSuggestionsTimer](self, "switchBackToSuggestionsTimer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isValid") & 1) == 0)
        {
          -[SPUITextField delegate](self, "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v8 &= objc_msgSend(v13, "lastQueryKindSupportsOptionKey");

        }
      }
    }
  }

  return v8;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (int64_t)_focusItemDeferralMode
{
  return 2;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  SPUITextField *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SPUITextField;
  v6 = a3;
  -[SPUITextField didUpdateFocusInContext:withAnimationCoordinator:](&v8, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedView", v8.receiver, v8.super_class);
  v7 = (SPUITextField *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
    -[SPUITextField removeCompletionAndHighlight](self, "removeCompletionAndHighlight");
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v12;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)SPUITextField;
  -[SPUITextField keyCommands](&v12, sel_keyCommands);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!keyCommands_spotlightKeyCommands)
  {
    objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BEBE3E0], 0, sel_escapeKeyCommand);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel_enterKeyPressed);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", &stru_24F9D6A70, 0x80000, sel_toggleCommitedSearch);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0x80000, sel_commitToCommitedSearch);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v3;
    v13[1] = v4;
    v13[2] = v5;
    v13[3] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)keyCommands_spotlightKeyCommands;
    keyCommands_spotlightKeyCommands = v7;

  }
  if (v2)
  {
    objc_msgSend(v2, "arrayByAddingObjectsFromArray:", keyCommands_spotlightKeyCommands);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (id)keyCommands_spotlightKeyCommands;
  }
  v10 = v9;

  return v10;
}

- (UIView)canvasView
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  char v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SPUITextField subviews](self, "subviews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v6);
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("_UITextLayoutCanvasView"));

        if ((v10 & 1) != 0)
        {
          v11 = v7;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return (UIView *)v11;
}

- (void)toggleCommitedSearch
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;

  -[SPUITextField switchBackToSuggestionsTimer](self, "switchBackToSuggestionsTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isValid");

  if ((v4 & 1) == 0)
  {
    -[SPUITextField delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "commitSearch");

  }
  -[SPUITextField switchBackToSuggestionsTimer](self, "switchBackToSuggestionsTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_toggleBackToCommittedSearch, 0, 0, 0.25);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SPUITextField setSwitchBackToSuggestionsTimer:](self, "setSwitchBackToSuggestionsTimer:", v7);

}

- (void)commitToCommitedSearch
{
  void *v3;

  -[SPUITextField switchBackToSuggestionsTimer](self, "switchBackToSuggestionsTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SPUITextField setSwitchBackToSuggestionsTimer:](self, "setSwitchBackToSuggestionsTimer:", 0);
}

- (void)toggleBackToCommittedSearch
{
  id v2;

  -[SPUITextField delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switchToSuggestions");

}

- (void)enterKeyPressed
{
  void *v3;

  -[SPUITextField delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "returnKeyPressed");

  -[SPUITextField setLastUpdateWasDeletion:](self, "setLastUpdateWasDeletion:", 0);
}

- (void)escapeKeyCommand
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if ((-[SPUITextField hasMarkedText](self, "hasMarkedText") & 1) == 0)
  {
    -[UISearchTextField text](self, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
    {

    }
    else
    {
      -[UISearchTextField tokens](self, "tokens");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count");

      if (!v5)
      {
        -[SPUITextField delegate](self, "delegate");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "escapeKeyPressed");
        goto LABEL_6;
      }
    }
    -[UISearchTextField setText:](self, "setText:", &stru_24F9D6A70);
    v6 = (void *)objc_opt_new();
    -[UISearchTextField setTokens:](self, "setTokens:", v6);

    -[UISearchTextField textualRange](self, "textualRange");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UISearchTextField replaceRange:withText:](self, "replaceRange:withText:");
LABEL_6:

  }
}

- (void)promoteCompletionIfPossibleAndMoveForward:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[SPUITextField removeCaretAssertion](self, "removeCaretAssertion");
  if (-[SPUITextField shouldPromoteCompletion](self, "shouldPromoteCompletion"))
    -[SPUITextField _promoteCompletionAndMoveForward:](self, "_promoteCompletionAndMoveForward:", v3);
  else
    -[SPUITextField updateFocusResult:cardSection:focusIsOnFirstResult:](self, "updateFocusResult:cardSection:focusIsOnFirstResult:", 0, 0, 0);
  -[SPUITextField delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeCompletionAndHighlightAsTyped:", 0);

}

- (void)_promoteCompletionAndMoveForward:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SPUICompletionStringModel *v12;
  void *v13;
  void *v14;
  void *v15;
  SPUICompletionStringModel *v16;
  void *v17;
  id v18;

  -[UISearchTextField text](self, "text");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[UISearchTextField text](self, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  -[SPUITextField hintingView](self, "hintingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "completionText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISearchTextField setText:](self, "setText:", v8);

  if (!a3)
  {
    -[SPUITextField beginningOfDocument](self, "beginningOfDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUITextField positionFromPosition:inDirection:offset:](self, "positionFromPosition:inDirection:offset:", v9, 2, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[SPUITextField textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v10, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUITextField setSelectedTextRange:](self, "setSelectedTextRange:", v11);

  }
  v12 = [SPUICompletionStringModel alloc];
  -[UISearchTextField text](self, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUITextField hintingView](self, "hintingView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "searchFieldModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SPUICompletionStringModel initWithTypedString:hasTokens:queryId:hasMarkedText:](v12, "initWithTypedString:hasTokens:queryId:hasMarkedText:", v13, 0, objc_msgSend(v15, "queryId"), 0);
  -[SPUITextField hintingView](self, "hintingView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSearchFieldModel:", v16);

  -[SPUITextField updateFocusResult:cardSection:focusIsOnFirstResult:](self, "updateFocusResult:cardSection:focusIsOnFirstResult:", 0, 0, 1);
  -[SPUITextField setRestorationStringOnKBMovement:](self, "setRestorationStringOnKBMovement:", v18);

}

- (void)unmarkText
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SPUITextField;
  -[SPUITextField unmarkText](&v4, sel_unmarkText);
  -[SPUITextField setLastUpdateWasDeletion:](self, "setLastUpdateWasDeletion:", 0);
  -[SPUITextField delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "highlightResultAfterUnmarkingText");

}

- (void)scribbleInteractionWillBeginWriting:(id)a3
{
  -[SPUITextField updateFocusResult:cardSection:focusIsOnFirstResult:](self, "updateFocusResult:cardSection:focusIsOnFirstResult:", 0, 0, 0);
}

- (BOOL)completionResultIsPotentiallyPunchout
{
  void *v2;
  char v3;

  -[SPUITextField hintingView](self, "hintingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "completionResultIsPotentiallyPunchout");

  return v3;
}

+ (void)updateBlueButton
{
  void *v2;
  id v3;

  if ((objc_msgSend(MEMORY[0x24BEBD6C8], "isInHardwareKeyboardMode") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEBD6C8], "activeKeyboard");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "textInputTraitsDidChange");

    objc_msgSend(MEMORY[0x24BEBD6E0], "activeInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateReturnKey:", 1);

  }
}

- (void)cut:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[SPUITextField delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textWasCutFromTextField:", self);

  v6.receiver = self;
  v6.super_class = (Class)SPUITextField;
  -[UISearchTextField cut:](&v6, sel_cut_, v4);

}

- (BOOL)supportsEmojiImageTextAttachments
{
  return 0;
}

- (BOOL)supportsAdaptiveImageGlyph
{
  return 0;
}

- (SPUICompletionStringModel)searchFieldModel
{
  return self->_searchFieldModel;
}

- (int64_t)activeInterfaceOrientation
{
  return self->_activeInterfaceOrientation;
}

- (void)setActiveInterfaceOrientation:(int64_t)a3
{
  self->_activeInterfaceOrientation = a3;
}

- (UIColor)primaryColor
{
  return (UIColor *)objc_getProperty(self, a2, 1248, 1);
}

- (UIColor)secondaryColor
{
  return (UIColor *)objc_getProperty(self, a2, 1256, 1);
}

- (BOOL)isOnDarkBackground
{
  return self->_isOnDarkBackground;
}

- (BOOL)canAcquireFieldEditor
{
  return self->_canAcquireFieldEditor;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (BOOL)ignoreTokensUpdate
{
  return self->_ignoreTokensUpdate;
}

- (void)setIgnoreTokensUpdate:(BOOL)a3
{
  self->_ignoreTokensUpdate = a3;
}

- (UIGestureRecognizer)completionTapGestureRecognizer
{
  return (UIGestureRecognizer *)objc_getProperty(self, a2, 1288, 1);
}

- (BOOL)lastUpdateWasDeletion
{
  return self->_lastUpdateWasDeletion;
}

- (void)setLastUpdateWasDeletion:(BOOL)a3
{
  self->_lastUpdateWasDeletion = a3;
}

- (UIScribbleInteraction)scribbleInteraction
{
  return (UIScribbleInteraction *)objc_getProperty(self, a2, 1304, 1);
}

- (void)setScribbleInteraction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1304);
}

- (NSTimer)switchBackToSuggestionsTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 1320, 1);
}

- (void)setSwitchBackToSuggestionsTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1320);
}

- (int64_t)internalTextAlignment
{
  return self->_internalTextAlignment;
}

- (void)setInternalTextAlignment:(int64_t)a3
{
  self->_internalTextAlignment = a3;
}

- (UIFont)accessoryIconFont
{
  return (UIFont *)objc_getProperty(self, a2, 1352, 1);
}

- (int64_t)accessorySymbolWeight
{
  return self->_accessorySymbolWeight;
}

- (void)setAccessorySymbolWeight:(int64_t)a3
{
  self->_accessorySymbolWeight = a3;
}

- (id)assertionForGrabbers
{
  return objc_getProperty(self, a2, 1368, 1);
}

- (void)setAssertionForGrabbers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1368);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_assertionForGrabbers, 0);
  objc_storeStrong((id *)&self->_accessoryIconFont, 0);
  objc_storeStrong(&self->_animateAssertion, 0);
  objc_storeStrong((id *)&self->_microphoneImage, 0);
  objc_storeStrong((id *)&self->_switchBackToSuggestionsTimer, 0);
  objc_storeStrong((id *)&self->_restorationStringOnKBMovement, 0);
  objc_storeStrong((id *)&self->_scribbleInteraction, 0);
  objc_storeStrong((id *)&self->_caretAssertion, 0);
  objc_storeStrong((id *)&self->_completionTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_hintingView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_searchFieldModel, 0);
  objc_destroyWeak((id *)&self->_responderForKeyboardInput);
}

@end
