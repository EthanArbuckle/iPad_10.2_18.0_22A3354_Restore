@implementation SKUIFullscreenRedeemCameraView

- (SKUIFullscreenRedeemCameraView)initWithClientContext:(id)a3
{
  id v4;
  SKUIFullscreenRedeemCameraView *v5;
  uint64_t v6;
  _UIBackdropView *textFieldSafeAreaBackdrop;
  uint64_t v8;
  SKUIRedeemTextField *textField;
  SKUIRedeemTextField *v10;
  void *v11;
  id v12;
  UIView *v13;
  UIView *overlay;
  UIView *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIFullscreenRedeemCameraView initWithClientContext:].cold.1();
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIFullscreenRedeemCameraView;
  v5 = -[SKUIFullscreenRedeemCameraView init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", 10060);
    textFieldSafeAreaBackdrop = v5->_textFieldSafeAreaBackdrop;
    v5->_textFieldSafeAreaBackdrop = (_UIBackdropView *)v6;

    -[SKUIFullscreenRedeemCameraView addSubview:](v5, "addSubview:", v5->_textFieldSafeAreaBackdrop);
    v8 = -[SKUIFullscreenRedeemCameraView _newTextFieldWithClientContext:](v5, "_newTextFieldWithClientContext:", v4);
    textField = v5->_textField;
    v5->_textField = (SKUIRedeemTextField *)v8;

    -[SKUIRedeemTextField setDelegate:](v5->_textField, "setDelegate:", v5);
    v10 = v5->_textField;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemTextField setBackgroundColor:](v10, "setBackgroundColor:", v11);

    -[SKUIRedeemTextField setOpaque:](v5->_textField, "setOpaque:", 0);
    -[SKUIFullscreenRedeemCameraView addSubview:](v5, "addSubview:", v5->_textField);
    v12 = objc_alloc_init(MEMORY[0x1E0DC3D80]);
    objc_msgSend(v12, "addTarget:action:", v5, sel__tapGestureAction_);
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    overlay = v5->_overlay;
    v5->_overlay = v13;

    v15 = v5->_overlay;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[UIView setAlpha:](v5->_overlay, "setAlpha:", 0.0);
    -[UIView addGestureRecognizer:](v5->_overlay, "addGestureRecognizer:", v12);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v5, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v5, sel_keyboardDidShow_, *MEMORY[0x1E0DC4E70], 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v5, sel_keyboardWillHide_, *MEMORY[0x1E0DC4FE0], 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v5, sel_keyboardDidHide_, *MEMORY[0x1E0DC4E68], 0);
    objc_msgSend(v17, "addObserver:selector:name:object:", v5, sel_textFieldTextDidChange_, *MEMORY[0x1E0DC54D0], v5->_textField);
    v5->_enabled = 1;

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4E70], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE0], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4E68], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC54D0], 0);
  -[SKUIRedeemTextField setDelegate:](self->_textField, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)SKUIFullscreenRedeemCameraView;
  -[SKUIFullscreenRedeemCameraView dealloc](&v4, sel_dealloc);
}

- (void)setText:(id)a3
{
  SKUIRedeemTextField *textField;
  id v5;
  id WeakRetained;

  textField = self->_textField;
  v5 = a3;
  -[SKUIRedeemTextField setText:](textField, "setText:", v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "SKUIRedeemCameraView:textFieldDidChange:", self, v5);

}

- (NSString)text
{
  return (NSString *)-[SKUIRedeemTextField text](self->_textField, "text");
}

- (UIImage)image
{
  return 0;
}

- (void)showKeyboard
{
  -[SKUIRedeemTextField becomeFirstResponder](self->_textField, "becomeFirstResponder");
}

- (void)setEnabled:(BOOL)a3
{
  SKUIRedeemTextField *textField;
  void *v5;

  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    textField = self->_textField;
    if (a3)
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.392156863, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemTextField setTextColor:](textField, "setTextColor:", v5);

    -[SKUIRedeemTextField setEnabled:](self->_textField, "setEnabled:", self->_enabled);
    -[SKUIFullscreenRedeemCameraView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", self->_enabled);
  }
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)start
{
  id WeakRetained;
  UIView *v4;
  UIView *redeemerView;

  if (!self->_redeemerView)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "redeemerViewForSKUIRedeemCameraView:", self);
    v4 = (UIView *)objc_claimAutoreleasedReturnValue();
    redeemerView = self->_redeemerView;
    self->_redeemerView = v4;

    -[SKUIFullscreenRedeemCameraView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_redeemerView, 0);
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect *p_keyboardRect;
  double v14;
  _UIBackdropView *v15;
  double v16;
  double v17;
  double v18;
  _UIBackdropView *textFieldSafeAreaBackdrop;
  CGRect v20;

  -[SKUIFullscreenRedeemCameraView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_overlay, "setFrame:");
  -[UIView setFrame:](self->_redeemerView, "setFrame:", v4, v6, v8, v10);
  -[SKUIFullscreenRedeemCameraView safeAreaInsets](self, "safeAreaInsets");
  v12 = v11;
  if (-[SKUIRedeemTextField isFirstResponder](self->_textField, "isFirstResponder")
    && (p_keyboardRect = &self->_keyboardRect, !CGRectEqualToRect(self->_keyboardRect, *MEMORY[0x1E0C9D648])))
  {
    v20.origin.x = p_keyboardRect->origin.x;
    v20.origin.y = self->_keyboardRect.origin.y;
    v20.size.width = self->_keyboardRect.size.width;
    v20.size.height = self->_keyboardRect.size.height;
    -[SKUIRedeemTextField setFrame:](self->_textField, "setFrame:", 0.0, CGRectGetMinY(v20) + -44.0, v8, 44.0);
    textFieldSafeAreaBackdrop = self->_textFieldSafeAreaBackdrop;
    v17 = CGRectGetMinY(*p_keyboardRect) + -44.0;
    v15 = textFieldSafeAreaBackdrop;
    v18 = v8;
    v16 = 44.0;
  }
  else
  {
    v14 = v10 + -44.0 - v12;
    -[SKUIRedeemTextField setFrame:](self->_textField, "setFrame:", 0.0, v14, v8, 44.0);
    v15 = self->_textFieldSafeAreaBackdrop;
    v16 = v12 + 44.0;
    v17 = v14;
    v18 = v8;
  }
  -[_UIBackdropView setFrame:](v15, "setFrame:", 0.0, v17, v18, v16);
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  _QWORD v12[5];
  uint64_t v13;
  double v14;
  __int128 v15;
  __int128 v16;

  v15 = 0u;
  v16 = 0u;
  v13 = 0;
  v14 = 0.0;
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getValue:", &v15);

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E40]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getValue:", &v13);

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E48]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getValue:", &v14);

  -[SKUIFullscreenRedeemCameraView convertRect:fromView:](self, "convertRect:fromView:", 0, v15, v16);
  self->_keyboardRect.origin.x = v8;
  self->_keyboardRect.origin.y = v9;
  self->_keyboardRect.size.width = v10;
  self->_keyboardRect.size.height = v11;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__SKUIFullscreenRedeemCameraView_keyboardWillShow___block_invoke;
  v12[3] = &unk_1E739FD38;
  v12[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", v13, v12, 0, v14, 0.0);

}

uint64_t __51__SKUIFullscreenRedeemCameraView_keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CGFloat v4;
  uint64_t v5;
  void *v6;
  CGFloat v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 440);
  v4 = CGRectGetMinY(*(CGRect *)(v2 + 456)) + -44.0;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v3, "setFrame:", 0.0, v4);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 448);
  v7 = CGRectGetMinY(*(CGRect *)(v5 + 456)) + -44.0;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  return objc_msgSend(v6, "setFrame:", 0.0, v7);
}

- (void)keyboardWillHide:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  _QWORD v12[5];
  uint64_t v13;
  double v14;
  __int128 v15;
  __int128 v16;

  v15 = 0u;
  v16 = 0u;
  v13 = 0;
  v14 = 0.0;
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getValue:", &v15);

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E40]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getValue:", &v13);

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E48]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getValue:", &v14);

  -[SKUIFullscreenRedeemCameraView convertRect:fromView:](self, "convertRect:fromView:", 0, v15, v16);
  self->_keyboardRect.origin.x = v8;
  self->_keyboardRect.origin.y = v9;
  self->_keyboardRect.size.width = v10;
  self->_keyboardRect.size.height = v11;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__SKUIFullscreenRedeemCameraView_keyboardWillHide___block_invoke;
  v12[3] = &unk_1E739FD38;
  v12[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", v13, v12, 0, v14, 0.0);

}

uint64_t __51__SKUIFullscreenRedeemCameraView_keyboardWillHide___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v4;
  void *v5;
  CGFloat v6;
  uint64_t v7;
  void *v8;
  CGFloat v9;

  objc_msgSend(*(id *)(a1 + 32), "safeAreaInsets");
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 440);
  v6 = CGRectGetMinY(*(CGRect *)(v4 + 456)) + -44.0 - v2;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v5, "setFrame:", 0.0, v6);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 448);
  v9 = CGRectGetMinY(*(CGRect *)(v7 + 456)) + -44.0 - v3;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  return objc_msgSend(v8, "setFrame:", 0.0, v9);
}

- (void)keyboardDidHide:(id)a3
{
  CGSize v3;

  v3 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_keyboardRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_keyboardRect.size = v3;
}

- (void)textFieldTextDidChange:(id)a3
{
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[SKUIRedeemTextField text](self->_textField, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "SKUIRedeemCameraView:textFieldDidChange:", self, v4);

}

- (void)textFieldDidBeginEditing:(id)a3
{
  UIView *overlay;
  UIView *v5;
  void *v6;
  _QWORD v7[5];

  -[SKUIFullscreenRedeemCameraView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", self->_overlay, self->_textField);
  overlay = self->_overlay;
  -[SKUIFullscreenRedeemCameraView bounds](self, "bounds");
  -[UIView setFrame:](overlay, "setFrame:");
  v5 = self->_overlay;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  -[UIView setAlpha:](self->_overlay, "setAlpha:", 0.0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__SKUIFullscreenRedeemCameraView_textFieldDidBeginEditing___block_invoke;
  v7[3] = &unk_1E739FD38;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v7, 0.2);
  -[SKUIFullscreenRedeemCameraView _pauseRedeemer](self, "_pauseRedeemer");
}

uint64_t __59__SKUIFullscreenRedeemCameraView_textFieldDidBeginEditing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 0.4);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  SKUIRedeemCameraViewDelegate **p_delegate;
  id v5;
  id WeakRetained;
  void *v7;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v5, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "SKUIRedeemCameraView:textFieldDidRedeem:", self, v7);
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  _QWORD v4[5];
  _QWORD v5[5];

  v4[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__SKUIFullscreenRedeemCameraView_textFieldDidEndEditing___block_invoke;
  v5[3] = &unk_1E739FD38;
  v5[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__SKUIFullscreenRedeemCameraView_textFieldDidEndEditing___block_invoke_2;
  v4[3] = &unk_1E73A0108;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v5, v4, 0.2);
  UIKeyboardOrderOutAutomatic();
  if (-[SKUIFullscreenRedeemCameraView enabled](self, "enabled"))
  {
    -[SKUIFullscreenRedeemCameraView _resumeRedeemer](self, "_resumeRedeemer");
    -[SKUIFullscreenRedeemCameraView setText:](self, "setText:", &stru_1E73A9FB0);
  }
}

uint64_t __57__SKUIFullscreenRedeemCameraView_textFieldDidEndEditing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setAlpha:", 0.0);
}

uint64_t __57__SKUIFullscreenRedeemCameraView_textFieldDidEndEditing___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "removeFromSuperview");
}

- (void)_hideKeyboard
{
  -[SKUIRedeemTextField resignFirstResponder](self->_textField, "resignFirstResponder");
}

- (id)_newTextFieldWithClientContext:(id)a3
{
  id v4;
  SKUIRedeemTextField *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = -[SKUIRedeemTextField initWithFrame:]([SKUIRedeemTextField alloc], "initWithFrame:", 0.0, 0.0, 1.0, 44.0);
  -[SKUIRedeemTextField setSuppressBorder:](v5, "setSuppressBorder:", 1);
  -[SKUIRedeemTextField setAutocorrectionType:](v5, "setAutocorrectionType:", 1);
  -[SKUIRedeemTextField setAutocapitalizationType:](v5, "setAutocapitalizationType:", 3);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 16.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemTextField setFont:](v5, "setFont:", v6);
  if (v4)
    objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("CAMERA_REDEEM_ENTER_CODE"), CFSTR("Redeem"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("CAMERA_REDEEM_ENTER_CODE"), 0, CFSTR("Redeem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0C99D80]);
  v9 = *MEMORY[0x1E0DC1138];
  -[SKUIFullscreenRedeemCameraView tintColor](self, "tintColor");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v12 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", v6, v9, v10, *MEMORY[0x1E0DC1140], 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.7, 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", v6, v9, v13, *MEMORY[0x1E0DC1140], 0);

  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v12);
  -[SKUIRedeemTextField setAttributedPlaceholder:](v5, "setAttributedPlaceholder:", v14);

  return v5;
}

- (void)_pauseRedeemer
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "cancelRedeemerViewForSKUIRedeemCameraView:", self);

}

- (void)_resumeRedeemer
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "startRedeemerViewForSKUIRedeemCameraView:", self);

}

- (SKUIRedeemCameraViewDelegate)delegate
{
  return (SKUIRedeemCameraViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFieldSafeAreaBackdrop, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_redeemerView, 0);
  objc_storeStrong((id *)&self->_overlay, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithClientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIFullscreenRedeemCameraView initWithClientContext:]";
}

@end
