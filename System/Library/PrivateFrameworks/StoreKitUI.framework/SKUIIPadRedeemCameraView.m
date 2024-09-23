@implementation SKUIIPadRedeemCameraView

- (SKUIIPadRedeemCameraView)initWithClientContext:(id)a3
{
  id v4;
  SKUIIPadRedeemCameraView *v5;
  UIScrollView *v6;
  UIScrollView *scrollView;
  SKUIRedeemCameraLandingView *v8;
  SKUIRedeemCameraLandingView *landingView;
  void *v10;
  void *v11;
  uint64_t v12;
  SKUIRedeemTextField *textField;
  void *v14;
  SKUILinkButton *v15;
  UIButton *termsButton;
  UIButton *v17;
  void *v18;
  void *v19;
  void *v20;
  UIButton *v21;
  void *v22;
  UIButton *v23;
  void *v24;
  objc_super v26;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIPadRedeemCameraView initWithClientContext:].cold.1();
  }
  v26.receiver = self;
  v26.super_class = (Class)SKUIIPadRedeemCameraView;
  v5 = -[SKUIIPadRedeemCameraView init](&v26, sel_init);
  if (v5)
  {
    v6 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
    scrollView = v5->_scrollView;
    v5->_scrollView = v6;

    -[SKUIIPadRedeemCameraView addSubview:](v5, "addSubview:", v5->_scrollView);
    v8 = -[SKUIRedeemCameraLandingView initWithClientContext:]([SKUIRedeemCameraLandingView alloc], "initWithClientContext:", v4);
    landingView = v5->_landingView;
    v5->_landingView = v8;

    -[SKUIRedeemCameraLandingView button](v5->_landingView, "button");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addTarget:action:forControlEvents:", v5, sel__landingButtonAction_, 64);

    -[UIScrollView addSubview:](v5->_scrollView, "addSubview:", v5->_landingView);
    -[SKUIIPadRedeemCameraView tintColor](v5, "tintColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SKUIIPadRedeemCameraView _newTextFieldWithClientContext:placeholderColor:](v5, "_newTextFieldWithClientContext:placeholderColor:", v4, v11);
    textField = v5->_textField;
    v5->_textField = (SKUIRedeemTextField *)v12;

    -[SKUIRedeemTextField setDelegate:](v5->_textField, "setDelegate:", v5);
    -[UIScrollView addSubview:](v5->_scrollView, "addSubview:", v5->_textField);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v5, sel_keyboardDidChange_, *MEMORY[0x1E0DC4FE8], 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v5, sel_keyboardDidChange_, *MEMORY[0x1E0DC4FE0], 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v5, sel_textFieldTextDidChange_, *MEMORY[0x1E0DC54D0], v5->_textField);
    v15 = -[SKUILinkButton initWithArrowStyle:]([SKUILinkButton alloc], "initWithArrowStyle:", 0);
    termsButton = v5->_termsButton;
    v5->_termsButton = &v15->super;

    v17 = v5->_termsButton;
    if (v4)
      objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("REDEEM_TERMS_LINK"), CFSTR("Redeem"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("REDEEM_TERMS_LINK"), 0, CFSTR("Redeem"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v17, "setTitle:forState:", v18, 0);

    -[UIButton titleLabel](v5->_termsButton, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFont:", v20);

    v21 = v5->_termsButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v21, "setTitleColor:forState:", v22, 0);

    v23 = v5->_termsButton;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitleColor:forState:](v23, "setTitleColor:forState:", v24, 1);

    -[UIButton addTarget:action:forControlEvents:](v5->_termsButton, "addTarget:action:forControlEvents:", v5, sel__termsButtonAction_, 64);
    -[UIScrollView addSubview:](v5->_scrollView, "addSubview:", v5->_termsButton);

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
  v4.super_class = (Class)SKUIIPadRedeemCameraView;
  -[SKUIIPadRedeemCameraView dealloc](&v4, sel_dealloc);
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

- (void)setImage:(id)a3
{
  -[SKUIRedeemCameraLandingView setImage:](self->_landingView, "setImage:", a3);
}

- (UIImage)image
{
  return -[SKUIRedeemCameraLandingView image](self->_landingView, "image");
}

- (void)showKeyboard
{
  -[SKUIRedeemTextField becomeFirstResponder](self->_textField, "becomeFirstResponder");
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  SKUIRedeemTextField *textField;
  void *v6;

  v3 = a3;
  textField = self->_textField;
  if (a3)
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.392156863, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemTextField setTextColor:](textField, "setTextColor:", v6);

  -[SKUIRedeemTextField setEnabled:](self->_textField, "setEnabled:", v3);
  -[SKUIIPadRedeemCameraView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v3);
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
  void *v11;
  uint64_t v12;
  double v13;
  UIScrollView *scrollView;
  SKUIRedeemCameraLandingView *landingView;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  SKUIRedeemTextField *textField;
  UIButton *termsButton;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;

  -[SKUIIPadRedeemCameraView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v13 = 44.0;
  else
    v13 = 94.0;
  scrollView = self->_scrollView;
  if (scrollView)
  {
    -[UIScrollView setContentSize:](scrollView, "setContentSize:", v8, v10);
    -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v4, v6, v8, v10);
  }
  landingView = self->_landingView;
  if (landingView)
  {
    -[SKUIRedeemCameraLandingView frame](landingView, "frame");
    -[SKUIRedeemCameraLandingView sizeThatFits:](self->_landingView, "sizeThatFits:", v8, v10);
    v17 = v16;
    v19 = v18;
    -[SKUIRedeemCameraLandingView setFrame:](self->_landingView, "setFrame:", 0.0, v13, v16, v18);
    v29.origin.x = 0.0;
    v29.origin.y = v13;
    v29.size.width = v17;
    v29.size.height = v19;
    v13 = CGRectGetMaxY(v29) + 49.0;
  }
  textField = self->_textField;
  if (textField)
  {
    -[SKUIRedeemTextField setFrame:](textField, "setFrame:", 0.0, v13, v8, 44.0);
    v30.origin.x = 0.0;
    v30.origin.y = v13;
    v30.size.width = v8;
    v30.size.height = 44.0;
    v13 = CGRectGetMaxY(v30) + 36.0;
  }
  termsButton = self->_termsButton;
  if (termsButton)
  {
    -[UIButton sizeToFit](termsButton, "sizeToFit");
    -[UIButton frame](self->_termsButton, "frame");
    v23 = v22;
    v25 = v24;
    v26 = (v8 - v22) * 0.5;
    v27 = roundf(v26);
    -[SKUIIPadRedeemCameraView _adjustVerticalSpacingForHeight:](self, "_adjustVerticalSpacingForHeight:", v13);
    -[UIButton setFrame:](self->_termsButton, "setFrame:", v27, v28, v23, v25);
  }
}

- (void)keyboardDidChange:(id)a3
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
  double height;
  id v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[UIScrollView superview](self->_scrollView, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "CGRectValue");
    objc_msgSend(v5, "convertRect:fromView:", 0);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[UIScrollView frame](self->_scrollView, "frame");
    v18.origin.x = v7;
    v18.origin.y = v9;
    v18.size.width = v11;
    v18.size.height = v13;
    v17 = CGRectIntersection(v16, v18);
    height = v17.size.height;
    -[UIScrollView contentInset](self->_scrollView, "contentInset", v17.origin.x, v17.origin.y, v17.size.width);
    -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:");
    -[UIScrollView scrollIndicatorInsets](self->_scrollView, "scrollIndicatorInsets");
    -[UIScrollView setScrollIndicatorInsets:](self->_scrollView, "setScrollIndicatorInsets:");
    -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 1, 0.0, height);
  }

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

- (void)_landingButtonAction:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "presentFullScreenCameraViewForSKUIRedeemCameraView:", self);

}

- (void)_termsButtonAction:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "termsAndConditionsURL", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  SKUIMetricsOpenURL(v3);

}

- (double)_adjustVerticalSpacingForHeight:(double)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double Width;
  double Height;
  double v18;
  CGRect v20;
  CGRect v21;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (v5 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3F98], "keyWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v20.origin.x = v8;
    v20.origin.y = v10;
    v20.size.width = v12;
    v20.size.height = v14;
    Width = CGRectGetWidth(v20);
    v21.origin.x = v8;
    v21.origin.y = v10;
    v21.size.width = v12;
    v21.size.height = v14;
    Height = CGRectGetHeight(v21);
    if (Width >= 1024.0 && Height >= 1024.0)
    {
      if (Height <= Width)
        v18 = 320.0;
      else
        v18 = 461.0;
      return a3 + v18;
    }
  }
  return a3;
}

- (void)_hideKeyboard
{
  -[SKUIRedeemTextField resignFirstResponder](self->_textField, "resignFirstResponder");
}

- (id)_newTextFieldWithClientContext:(id)a3 placeholderColor:(id)a4
{
  id v5;
  id v6;
  SKUIRedeemTextField *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = -[SKUIRedeemTextField initWithFrame:]([SKUIRedeemTextField alloc], "initWithFrame:", 0.0, 0.0, 1.0, 44.0);
  -[SKUIRedeemTextField setAutocorrectionType:](v7, "setAutocorrectionType:", 1);
  -[SKUIRedeemTextField setAutocapitalizationType:](v7, "setAutocapitalizationType:", 3);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 16.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIRedeemTextField setFont:](v7, "setFont:", v8);
  v9 = *MEMORY[0x1E0DC1138];
  v18[0] = v8;
  v10 = *MEMORY[0x1E0DC1140];
  v17[0] = v9;
  v17[1] = v10;
  v11 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.7, 1.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)

  v13 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v5)
    objc_msgSend(v5, "localizedStringForKey:inTable:", CFSTR("CAMERA_REDEEM_ENTER_CODE"), CFSTR("Redeem"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("CAMERA_REDEEM_ENTER_CODE"), 0, CFSTR("Redeem"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithString:attributes:", v14, v12);

  -[SKUIRedeemTextField setAttributedPlaceholder:](v7, "setAttributedPlaceholder:", v15);
  return v7;
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
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_termsButton, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_redeemerView, 0);
  objc_storeStrong((id *)&self->_landingView, 0);
  objc_storeStrong((id *)&self->_inputAccessoryTextField, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithClientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIIPadRedeemCameraView initWithClientContext:]";
}

@end
