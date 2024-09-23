@implementation AlphanumericPINTableViewCell

- (AlphanumericPINTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  AlphanumericPINTableViewCell *v4;
  AlphanumericPINTextField *v5;
  AlphanumericPINTextField *pinTextField;
  AlphanumericPINTextField *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AlphanumericPINTextField *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AlphanumericPINTextField *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  AlphanumericPINTextField *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t v28[16];
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)AlphanumericPINTableViewCell;
  v4 = -[AlphanumericPINTableViewCell initWithStyle:reuseIdentifier:](&v29, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(AlphanumericPINTextField);
    pinTextField = v4->_pinTextField;
    v4->_pinTextField = v5;

    v7 = v4->_pinTextField;
    +[PSListController appearance](PSListController, "appearance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AlphanumericPINTextField setTextColor:](v7, "setTextColor:", v9);

    +[PSListController appearance](PSListController, "appearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v10, "usesDarkTheme");

    if ((_DWORD)v8)
      -[AlphanumericPINTextField setKeyboardAppearance:](v4->_pinTextField, "setKeyboardAppearance:", 1);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "set devicePasscodeEntry (AlphanumericPINTableViewCell)", v28, 2u);
    }
    -[AlphanumericPINTextField setSecureTextEntry:](v4->_pinTextField, "setSecureTextEntry:", 1);
    -[AlphanumericPINTextField setDevicePasscodeEntry:](v4->_pinTextField, "setDevicePasscodeEntry:", 1);
    -[AlphanumericPINTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    +[PSListController appearance](PSListController, "appearance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "editableInsertionPointColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = v4->_pinTextField;
      +[PSListController appearance](PSListController, "appearance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "editableInsertionPointColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[AlphanumericPINTextField setInsertionPointColor:](v13, "setInsertionPointColor:", v15);

    }
    +[PSListController appearance](PSListController, "appearance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "editableSelectionBarColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = v4->_pinTextField;
      +[PSListController appearance](PSListController, "appearance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "editableSelectionBarColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[AlphanumericPINTextField setSelectionBarColor:](v18, "setSelectionBarColor:", v20);

    }
    +[PSListController appearance](PSListController, "appearance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "editableSelectionHighlightColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = v4->_pinTextField;
      +[PSListController appearance](PSListController, "appearance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "editableSelectionHighlightColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[AlphanumericPINTextField setSelectionHighlightColor:](v23, "setSelectionHighlightColor:", v25);

    }
    -[AlphanumericPINTableViewCell contentView](v4, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v4->_pinTextField);

    -[AlphanumericPINTableViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("ALPHANUMERIC_PIN_CELL"));
  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  float v15;
  double v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  v17.receiver = self;
  v17.super_class = (Class)AlphanumericPINTableViewCell;
  -[AlphanumericPINTableViewCell layoutSubviews](&v17, sel_layoutSubviews);
  -[AlphanumericPINTableViewCell editableTextField](self, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[AlphanumericPINTableViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[AlphanumericPINTextField sizeThatFits:](self->_pinTextField, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v14 = v13;
  v18.origin.x = v6;
  v18.origin.y = v8;
  v18.size.width = v10;
  v18.size.height = v12;
  v15 = (CGRectGetHeight(v18) - v14) * 0.5;
  v16 = floorf(v15);
  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  -[AlphanumericPINTextField setFrame:](self->_pinTextField, "setFrame:", 15.0, v16, CGRectGetWidth(v19) + -30.0, v14);
}

- (AlphanumericPINTextField)pinTextField
{
  return self->_pinTextField;
}

- (void)setPinTextField:(id)a3
{
  objc_storeStrong((id *)&self->_pinTextField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pinTextField, 0);
}

@end
