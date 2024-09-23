@implementation PKLinkedAppView

- (PKLinkedAppView)initWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This class is not NSCoding compliant"));
  return -[PKLinkedAppView init](self, "init");
}

- (PKLinkedAppView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return -[PKLinkedAppView initWithStoreIDs:systemAppBundleIdentifiers:appLaunchURL:reuseIdentifier:](self, "initWithStoreIDs:systemAppBundleIdentifiers:appLaunchURL:reuseIdentifier:", 0, 0, 0, a4);
}

- (PKLinkedAppView)initWithStoreIDs:(id)a3 systemAppBundleIdentifiers:(id)a4 appLaunchURL:(id)a5 reuseIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PKLinkedApplication *v14;
  PKLinkedAppView *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[PKLinkedApplication initWithStoreIDs:systemAppBundleIdentifiers:defaultLaunchURL:]([PKLinkedApplication alloc], "initWithStoreIDs:systemAppBundleIdentifiers:defaultLaunchURL:", v13, v12, v11);

  v15 = -[PKLinkedAppView initWithLinkedApplication:reuseIdentifier:](self, "initWithLinkedApplication:reuseIdentifier:", v14, v10);
  return v15;
}

- (PKLinkedAppView)initWithLinkedApplication:(id)a3 reuseIdentifier:(id)a4
{
  id v6;
  PKLinkedAppView *v7;
  PKLinkedAppContentView *v8;
  PKLinkedAppContentView *linkedAppView;
  void *v10;
  uint64_t v11;
  UIColor *mainLabelColor;
  uint64_t v13;
  UIColor *subTextLabelColor;
  uint64_t v15;
  UIColor *buttonTintColor;
  uint64_t v17;
  UIColor *buttonBackgroundColor;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKLinkedAppView;
  v7 = -[PKLinkedAppView initWithStyle:reuseIdentifier:](&v20, sel_initWithStyle_reuseIdentifier_, 0, a4);
  if (v7)
  {
    v8 = -[PKLinkedAppContentView initWithLinkedApplication:]([PKLinkedAppContentView alloc], "initWithLinkedApplication:", v6);
    linkedAppView = v7->_linkedAppView;
    v7->_linkedAppView = v8;

    -[PKLinkedAppView contentView](v7, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v7->_linkedAppView);

    -[PKLinkedAppView setSelectionStyle:](v7, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v11 = objc_claimAutoreleasedReturnValue();
    mainLabelColor = v7->_mainLabelColor;
    v7->_mainLabelColor = (UIColor *)v11;

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v13 = objc_claimAutoreleasedReturnValue();
    subTextLabelColor = v7->_subTextLabelColor;
    v7->_subTextLabelColor = (UIColor *)v13;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v15 = objc_claimAutoreleasedReturnValue();
    buttonTintColor = v7->_buttonTintColor;
    v7->_buttonTintColor = (UIColor *)v15;

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
    v17 = objc_claimAutoreleasedReturnValue();
    buttonBackgroundColor = v7->_buttonBackgroundColor;
    v7->_buttonBackgroundColor = (UIColor *)v17;

  }
  return v7;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[PKLinkedAppContentView intrinsicContentSize](self->_linkedAppView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKLinkedAppContentView sizeThatFits:](self->_linkedAppView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  PKLinkedAppContentView *linkedAppView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKLinkedAppView;
  -[PKLinkedAppView layoutSubviews](&v4, sel_layoutSubviews);
  linkedAppView = self->_linkedAppView;
  -[PKLinkedAppView bounds](self, "bounds");
  -[PKLinkedAppContentView setFrame:](linkedAppView, "setFrame:");
}

- (void)setMainLabelColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_mainLabelColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mainLabelColor, a3);
    v5 = v6;
  }

}

- (void)setSubTextLabelColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_subTextLabelColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_subTextLabelColor, a3);
    v5 = v6;
  }

}

- (void)setButtonBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_buttonBackgroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_buttonBackgroundColor, a3);
    v5 = v6;
  }

}

- (void)setButtonTintColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_buttonTintColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_buttonTintColor, a3);
    v5 = v6;
  }

}

- (PKLinkedAppContentView)linkedAppView
{
  return self->_linkedAppView;
}

- (UIColor)mainLabelColor
{
  return self->_mainLabelColor;
}

- (UIColor)subTextLabelColor
{
  return self->_subTextLabelColor;
}

- (UIColor)buttonBackgroundColor
{
  return self->_buttonBackgroundColor;
}

- (UIColor)buttonTintColor
{
  return self->_buttonTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTintColor, 0);
  objc_storeStrong((id *)&self->_buttonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_subTextLabelColor, 0);
  objc_storeStrong((id *)&self->_mainLabelColor, 0);
  objc_storeStrong((id *)&self->_linkedAppView, 0);
}

@end
