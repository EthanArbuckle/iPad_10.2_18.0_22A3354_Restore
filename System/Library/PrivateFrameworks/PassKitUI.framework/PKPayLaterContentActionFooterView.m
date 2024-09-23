@implementation PKPayLaterContentActionFooterView

- (PKPayLaterContentActionFooterView)initWithDelegate:(id)a3
{
  id v4;
  PKPayLaterContentActionFooterView *v5;
  PKPayLaterContentActionFooterView *v6;
  uint64_t v7;
  _UIBackdropView *backdropView;
  PKPayLaterContentActionFooterViewContent *v9;
  PKPayLaterContentActionFooterViewContent *content;
  void *v11;
  void *v12;
  UIView *v13;
  UIView *topSeparatorView;
  UIView *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPayLaterContentActionFooterView;
  v5 = -[PKPayLaterContentActionFooterView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_backdropStyle = -[PKPayLaterContentActionFooterView preferredBackdropStyle](v5, "preferredBackdropStyle");
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", v6->_backdropStyle);
    backdropView = v6->_backdropView;
    v6->_backdropView = (_UIBackdropView *)v7;

    -[PKPayLaterContentActionFooterView addSubview:](v6, "addSubview:", v6->_backdropView);
    v9 = -[PKPayLaterContentActionFooterViewContent initWithDelegate:]([PKPayLaterContentActionFooterViewContent alloc], "initWithDelegate:", v4);
    content = v6->_content;
    v6->_content = v9;

    -[_UIBackdropView setUserInteractionEnabled:](v6->_backdropView, "setUserInteractionEnabled:", 1);
    -[_UIBackdropView contentView](v6->_backdropView, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUserInteractionEnabled:", 1);

    -[_UIBackdropView contentView](v6->_backdropView, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v6->_content);

    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    topSeparatorView = v6->_topSeparatorView;
    v6->_topSeparatorView = v13;

    v15 = v6->_topSeparatorView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[_UIBackdropView contentView](v6->_backdropView, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v6->_topSeparatorView);

  }
  return v6;
}

- (void)setButtonText:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  id v8;

  v4 = a3;
  -[PKPayLaterContentActionFooterViewContent buttonText](self->_content, "buttonText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v6 = v5;
  if (v6 == v8)
  {

  }
  else
  {
    if (v8 && v6)
    {
      v7 = objc_msgSend(v8, "isEqualToString:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[PKPayLaterContentActionFooterViewContent setButtonText:](self->_content, "setButtonText:", v8);
    -[PKPayLaterContentActionFooterView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setButtonTintColor:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[PKPayLaterContentActionFooterViewContent buttonTintColor](self->_content, "buttonTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[PKPayLaterContentActionFooterViewContent setButtonTintColor:](self->_content, "setButtonTintColor:", v6);
    -[PKPayLaterContentActionFooterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setButtonTitleColor:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[PKPayLaterContentActionFooterViewContent buttonTitleColor](self->_content, "buttonTitleColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[PKPayLaterContentActionFooterViewContent setButtonTitleColor:](self->_content, "setButtonTitleColor:", v6);
    -[PKPayLaterContentActionFooterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setLeadingTitleText:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  id v8;

  v4 = a3;
  -[PKPayLaterContentActionFooterViewContent leadingTitleText](self->_content, "leadingTitleText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v6 = v5;
  if (v6 == v8)
  {

  }
  else
  {
    if (v8 && v6)
    {
      v7 = objc_msgSend(v8, "isEqualToString:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[PKPayLaterContentActionFooterViewContent setLeadingTitleText:](self->_content, "setLeadingTitleText:", v8);
    -[PKPayLaterContentActionFooterView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setLeadingTitleTextColor:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[PKPayLaterContentActionFooterViewContent leadingTitleTextColor](self->_content, "leadingTitleTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[PKPayLaterContentActionFooterViewContent setLeadingTitleTextColor:](self->_content, "setLeadingTitleTextColor:", v6);
    -[PKPayLaterContentActionFooterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setLeadingTitleIcon:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_leadingTitleIcon != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_leadingTitleIcon, a3);
    -[PKPayLaterContentActionFooterViewContent setLeadingTitleIcon:](self->_content, "setLeadingTitleIcon:", self->_leadingTitleIcon);
    -[PKPayLaterContentActionFooterView setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setLeadingDetailTextColor:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[PKPayLaterContentActionFooterViewContent leadingDetailTextColor](self->_content, "leadingDetailTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKEqualObjects();

  if ((v5 & 1) == 0)
  {
    -[PKPayLaterContentActionFooterViewContent setLeadingDetailTextColor:](self->_content, "setLeadingDetailTextColor:", v6);
    -[PKPayLaterContentActionFooterView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setLeadingDetailText:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  id v8;

  v4 = a3;
  -[PKPayLaterContentActionFooterViewContent leadingDetailText](self->_content, "leadingDetailText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v6 = v5;
  if (v6 == v8)
  {

  }
  else
  {
    if (v8 && v6)
    {
      v7 = objc_msgSend(v8, "isEqualToString:", v6);

      if ((v7 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[PKPayLaterContentActionFooterViewContent setLeadingDetailText:](self->_content, "setLeadingDetailText:", v8);
    -[PKPayLaterContentActionFooterView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_9:

}

- (void)setShowSpinner:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[PKPayLaterContentActionFooterViewContent showSpinner](self->_content, "showSpinner") != a3)
    -[PKPayLaterContentActionFooterViewContent setShowSpinner:](self->_content, "setShowSpinner:", v3);
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  int64_t v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterContentActionFooterView;
  -[PKPayLaterContentActionFooterView _dynamicUserInterfaceTraitDidChange](&v4, sel__dynamicUserInterfaceTraitDidChange);
  v3 = -[PKPayLaterContentActionFooterView preferredBackdropStyle](self, "preferredBackdropStyle");
  if (self->_backdropStyle != v3)
  {
    self->_backdropStyle = v3;
    -[_UIBackdropView transitionToPrivateStyle:](self->_backdropView, "transitionToPrivateStyle:", v3);
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPayLaterContentActionFooterView;
  -[PKPayLaterContentActionFooterView layoutSubviews](&v3, sel_layoutSubviews);
  -[PKPayLaterContentActionFooterView bounds](self, "bounds");
  -[PKPayLaterContentActionFooterView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKPayLaterContentActionFooterView _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PKPayLaterContentActionFooterView safeAreaInsets](self, "safeAreaInsets");
  v11 = v10;
  -[PKPayLaterContentActionFooterViewContent sizeThatFits:](self->_content, "sizeThatFits:", width, height - v10);
  v14 = v13;
  if (!a4)
  {
    v15 = v12;
    -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:", x, y, width, height);
    -[UIView setFrame:](self->_topSeparatorView, "setFrame:", 0.0, 0.0, width, PKUIPixelLength() * 3.0);
    -[PKPayLaterContentActionFooterViewContent setFrame:](self->_content, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v15, v14);
  }
  v16 = v11 + v14;
  v17 = width;
  result.height = v16;
  result.width = v17;
  return result;
}

- (int64_t)preferredBackdropStyle
{
  void *v2;
  uint64_t v3;

  -[PKPayLaterContentActionFooterView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  if (v3 == 2)
    return 2030;
  else
    return 2010;
}

+ (id)leadingTitleFont
{
  return +[PKPayLaterContentActionFooterViewContent leadingTitleFont](PKPayLaterContentActionFooterViewContent, "leadingTitleFont");
}

- (NSString)leadingTitleText
{
  return self->_leadingTitleText;
}

- (UIImage)leadingTitleIcon
{
  return self->_leadingTitleIcon;
}

- (UIColor)leadingTitleTextColor
{
  return self->_leadingTitleTextColor;
}

- (NSString)leadingDetailText
{
  return self->_leadingDetailText;
}

- (UIColor)leadingDetailTextColor
{
  return self->_leadingDetailTextColor;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (UIColor)buttonTintColor
{
  return self->_buttonTintColor;
}

- (UIColor)buttonTitleColor
{
  return self->_buttonTitleColor;
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTitleColor, 0);
  objc_storeStrong((id *)&self->_buttonTintColor, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_leadingDetailTextColor, 0);
  objc_storeStrong((id *)&self->_leadingDetailText, 0);
  objc_storeStrong((id *)&self->_leadingTitleTextColor, 0);
  objc_storeStrong((id *)&self->_leadingTitleIcon, 0);
  objc_storeStrong((id *)&self->_leadingTitleText, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_topSeparatorView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
