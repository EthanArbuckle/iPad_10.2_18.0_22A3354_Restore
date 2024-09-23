@implementation TVRKeyboardView

- (TVRKeyboardView)initWithFrame:(CGRect)a3
{
  TVRKeyboardView *v3;
  uint64_t v4;
  UIVisualEffectView *effectView;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UIButton *dictationButton;
  id *v17;
  UIButton *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  _TVRTextField *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  _QWORD v57[4];
  id v58;
  id *v59;
  objc_super v60;
  uint64_t v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x24BDAC8D0];
  v60.receiver = self;
  v60.super_class = (Class)TVRKeyboardView;
  v3 = -[TVRKeyboardView initWithFrame:](&v60, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 2);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v56);
    effectView = v3->_effectView;
    v3->_effectView = (UIVisualEffectView *)v4;

    -[UIVisualEffectView _setContinuousCornerRadius:](v3->_effectView, "_setContinuousCornerRadius:", 12.0);
    -[UIVisualEffectView layer](v3->_effectView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerCurve:", *MEMORY[0x24BDE58E8]);

    -[TVRKeyboardView addSubview:](v3, "addSubview:", v3->_effectView);
    -[UIVisualEffectView contentView](v3->_effectView, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClipsToBounds:", 1);
    v8 = objc_alloc_init(MEMORY[0x24BEBD7A8]);
    v9 = objc_alloc(MEMORY[0x24BEBD410]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIPairingCancelString"), &stru_24DE30718, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v9, "initWithTitle:style:target:action:", v11, 0, v3, sel__cancelButton_);

    objc_msgSend(v8, "setLeftBarButtonItem:", v55);
    v12 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("IconSiri"), v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v15 = objc_claimAutoreleasedReturnValue();
    dictationButton = v3->_dictationButton;
    v3->_dictationButton = (UIButton *)v15;

    -[UIButton setImage:forState:](v3->_dictationButton, "setImage:forState:", v14, 0);
    -[UIButton addTarget:action:forControlEvents:](v3->_dictationButton, "addTarget:action:forControlEvents:", v3, sel__dictationButtonTapped_, 1);
    -[UIButton addTarget:action:forControlEvents:](v3->_dictationButton, "addTarget:action:forControlEvents:", v3, sel__dictationButtonReleased_, 448);
    -[UIButton setBounds:](v3->_dictationButton, "setBounds:", 0.0, 0.0, 44.0, 44.0);
    -[UIButton setContentHorizontalAlignment:](v3->_dictationButton, "setContentHorizontalAlignment:", 5);
    v57[0] = MEMORY[0x24BDAC760];
    v57[1] = 3221225472;
    v57[2] = __33__TVRKeyboardView_initWithFrame___block_invoke;
    v57[3] = &unk_24DE2C3B8;
    v58 = v14;
    v17 = v3;
    v59 = v17;
    v18 = v3->_dictationButton;
    v54 = v14;
    -[UIButton setPointerStyleProvider:](v18, "setPointerStyleProvider:", v57);
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v3->_dictationButton);
    objc_msgSend(v8, "setRightBarButtonItem:", v53);
    v19 = objc_alloc_init(MEMORY[0x24BEBD788]);
    v20 = v17[54];
    v17[54] = v19;

    objc_msgSend(v17[54], "pushNavigationItem:animated:", v8, 0);
    v21 = v17[54];
    v22 = (void *)objc_opt_new();
    objc_msgSend(v21, "setBackgroundImage:forBarMetrics:", v22, 0);

    v23 = v17[54];
    v24 = (void *)objc_opt_new();
    objc_msgSend(v23, "setShadowImage:", v24);

    objc_msgSend(v17[54], "setTranslucent:", 1);
    v25 = v17[54];
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDisplayP3Red:green:blue:alpha:", 0.17254902, 0.17254902, 0.180392157, 1.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBackgroundColor:", v26);

    v27 = v17[54];
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemTealColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setTintColor:", v28);

    v29 = v17[54];
    v61 = *MEMORY[0x24BEBB368];
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTitleTextAttributes:", v31);

    objc_msgSend(v7, "addSubview:", v17[54]);
    v32 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    v33 = v17[57];
    v17[57] = v32;

    v34 = v17[57];
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setBackgroundColor:", v35);

    objc_msgSend(v17[57], "setAlpha:", 0.4);
    objc_msgSend(v7, "addSubview:", v17[57]);
    v36 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    v37 = v17[55];
    v17[55] = v36;

    v38 = v17[55];
    objc_msgSend(v17[54], "backgroundColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setBackgroundColor:", v39);

    objc_msgSend(v7, "addSubview:", v17[55]);
    v40 = objc_alloc_init(_TVRTextField);
    v41 = v17[56];
    v17[56] = v40;

    v42 = v17[56];
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDisplayP3Red:green:blue:alpha:", 0.647058824, 0.647058824, 0.647058824, 1.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setBackgroundColor:", v43);

    v44 = v17[56];
    objc_msgSend(v17[54], "backgroundColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setTextColor:", v45);

    objc_msgSend(v17[56], "setDelegate:", v17);
    v46 = v17[56];
    objc_msgSend(v17[54], "tintColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setInsertionPointColor:", v47);

    objc_msgSend(v17[56], "setBorderStyle:", 3);
    objc_msgSend(v17[56], "addTarget:action:forControlEvents:", v17, sel__textDidChange_, 0x20000);
    objc_msgSend(v17[56], "setClearButtonMode:", 1);
    objc_msgSend(v17[56], "setAutocorrectionType:", 1);
    objc_msgSend(v17[56], "setKeyboardAppearance:", 1);
    objc_msgSend(v17[56], "setForceDisableDictation:", 1);
    v48 = v17[56];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE248]);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setFont:", v49);

    objc_msgSend(v17[56], "_setForcesClearButtonHighContrastAppearance:", 1);
    objc_msgSend(v17[55], "addSubview:", v17[56]);
    v50 = objc_alloc_init(MEMORY[0x24BE7ED88]);
    v51 = v17[60];
    v17[60] = v50;

    objc_msgSend(v17[60], "setPayloadDelegate:", v17);
    objc_msgSend(v17[56], "set_rtiSourceSession:", v17[60]);

  }
  return v3;
}

id __33__TVRKeyboardView_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  double v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  CGRect v24;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "size");
  v9 = v8 + 30.0;
  objc_msgSend(v7, "bounds");
  v10 = CGRectGetHeight(v24) + -6.0;
  v11 = *(void **)(a1 + 40);
  objc_msgSend(v7, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "convertRect:fromView:", v12, 15.0, 3.0, v9, v10);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  objc_msgSend(MEMORY[0x24BEBD840], "shapeWithRoundedRect:", v14, v16, v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD848], "styleWithEffect:shape:", v6, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGSize result;
  CGRect v12;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 1)
  {
    v6 = 320.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v6 = CGRectGetWidth(v12) + -32.0;

  }
  -[TVRKeyboardView _separatorHeight](self, "_separatorHeight");
  v9 = v8 + 48.0 + 64.5;
  v10 = v6;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGRect v11;

  v10.receiver = self;
  v10.super_class = (Class)TVRKeyboardView;
  -[TVRKeyboardView layoutSubviews](&v10, sel_layoutSubviews);
  -[TVRKeyboardView bounds](self, "bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v7 = CGRectGetWidth(v11);
  -[TVRKeyboardView _separatorHeight](self, "_separatorHeight");
  v9 = v8;
  -[UIVisualEffectView setFrame:](self->_effectView, "setFrame:", x, y, width, height);
  -[UINavigationBar setFrame:](self->_navigationBar, "setFrame:", 0.0, 0.0, v7, 48.0);
  -[UIView setFrame:](self->_separator, "setFrame:", 0.0, 48.0, v7, v9);
  -[UIView setFrame:](self->_textFieldWrapper, "setFrame:", 0.0, v9 + 48.0, v7, 64.5);
  -[_TVRTextField setFrame:](self->_textField, "setFrame:", 8.0, 8.0, v7 + -16.0, 48.5);
}

- (BOOL)becomeFirstResponder
{
  return -[_TVRTextField becomeFirstResponder](self->_textField, "becomeFirstResponder");
}

- (BOOL)resignFirstResponder
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TVRKeyboardView;
  -[TVRKeyboardView resignFirstResponder](&v4, sel_resignFirstResponder);
  return -[_TVRTextField becomeFirstResponder](self->_textField, "becomeFirstResponder");
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "keyboardViewDidHitReturnKey:", self);

  return 1;
}

- (void)setText:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  -[_TVRTextField setText:](self->_textField, "setText:");
  -[_TVRTextField markedTextRange](self->_textField, "markedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "isEmpty"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "keyboardView:didUpdateText:", self, v9);

    }
  }

}

- (NSString)text
{
  return (NSString *)-[_TVRTextField text](self->_textField, "text");
}

- (void)setTitle:(id)a3
{
  UINavigationBar *navigationBar;
  id v4;
  id v5;

  if (a3)
  {
    navigationBar = self->_navigationBar;
    v4 = a3;
    -[UINavigationBar topItem](navigationBar, "topItem");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v4);

  }
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[UINavigationBar topItem](self->_navigationBar, "topItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAttributes:(id)a3
{
  void *v5;
  TVRCKeyboardAttributes *v6;

  v6 = (TVRCKeyboardAttributes *)a3;
  if (self->_attributes != v6)
  {
    objc_storeStrong((id *)&self->_attributes, a3);
    -[TVRCKeyboardAttributes title](v6, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRKeyboardView setTitle:](self, "setTitle:", v5);

    -[TVRCKeyboardAttributes applyToTextField:](v6, "applyToTextField:", self->_textField);
  }

}

- (void)enableDictationButton:(BOOL)a3
{
  -[UIButton setHidden:](self->_dictationButton, "setHidden:", !a3);
}

- (void)handleTextActionPayload:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "keyboardView:generatedTextInputPayload:", self, v7);

  }
}

- (void)_cancelButton:(id)a3
{
  TVRKeyboardViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "keyboardViewDidCancel:", self);

  }
}

- (void)_dictationButtonTapped:(id)a3
{
  TVRKeyboardViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "keyboardViewPressedDictationButton:", self);

  }
}

- (void)_dictationButtonReleased:(id)a3
{
  TVRKeyboardViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "keyboardViewReleasedDictationButton:", self);

  }
}

- (void)_textDidChange:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "markedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "isEmpty"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "keyboardView:didUpdateText:", self, v9);

    }
  }

}

- (double)_separatorHeight
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = 1.0 / v3;

  return v4;
}

- (TVRCKeyboardAttributes)attributes
{
  return self->_attributes;
}

- (TVRKeyboardViewDelegate)delegate
{
  return (TVRKeyboardViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (void)setNavigationBar:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBar, a3);
}

- (UIView)textFieldWrapper
{
  return self->_textFieldWrapper;
}

- (void)setTextFieldWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_textFieldWrapper, a3);
}

- (_TVRTextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
  objc_storeStrong((id *)&self->_textField, a3);
}

- (UIView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_storeStrong((id *)&self->_separator, a3);
}

- (UIButton)dictationButton
{
  return self->_dictationButton;
}

- (void)setDictationButton:(id)a3
{
  objc_storeStrong((id *)&self->_dictationButton, a3);
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (RTIInputSystemSourceSession)currentSourceSession
{
  return self->_currentSourceSession;
}

- (void)setCurrentSourceSession:(id)a3
{
  objc_storeStrong((id *)&self->_currentSourceSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSourceSession, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_dictationButton, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_textFieldWrapper, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
