@implementation UIActionSheetiOSDismissActionView

- (UIActionSheetiOSDismissActionView)initWithContinuousCornerRadius:(double)a3
{
  UIActionSheetiOSDismissActionView *v4;
  UIActionSheetiOSDismissActionView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIActionSheetiOSDismissActionView;
  v4 = -[UIView init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[UIActionSheetiOSDismissActionView _setupDismissButton](v4, "_setupDismissButton");
    -[_UIAlertControlleriOSActionSheetCancelBackgroundView _setContinuousCornerRadius:](v5, "_setContinuousCornerRadius:", a3);
  }
  return v5;
}

- (void)_setupDismissButton
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActionSheetiOSDismissActionView setDismissButton:](self, "setDismissButton:", v3);

  -[UIActionSheetiOSDismissActionView dismissButton](self, "dismissButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](self, "addSubview:", v4);

  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIActionSheetiOSDismissActionView dismissButton](self, "dismissButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  -[UIActionSheetiOSDismissActionView dismissButton](self, "dismissButton");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAutoresizingMask:", 18);

}

- (NSString)title
{
  void *v2;
  void *v3;
  void *v4;

  -[UIActionSheetiOSDismissActionView dismissButton](self, "dismissButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedTitleForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setTitle:(id)a3
{
  objc_class *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = (objc_class *)MEMORY[0x1E0CB3778];
  v5 = a3;
  v10 = (id)objc_msgSend([v4 alloc], "initWithString:", v5);
  v6 = *(_QWORD *)off_1E1678D90;
  objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 20.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "length");

  objc_msgSend(v10, "addAttribute:value:range:", v6, v7, 0, v8);
  -[UIActionSheetiOSDismissActionView dismissButton](self, "dismissButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAttributedTitle:forState:", v10, 0);

}

- (void)setUsesShortCompactVerticalLayout:(BOOL)a3
{
  if (self->_usesShortCompactVerticalLayout != a3)
  {
    self->_usesShortCompactVerticalLayout = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (double)_heightForTraitCollection:(id)a3
{
  uint64_t v3;
  double result;

  if (!self->_usesShortCompactVerticalLayout)
    return 57.0;
  v3 = objc_msgSend(a3, "verticalSizeClass");
  result = 57.0;
  if (v3 == 1)
    return 44.0;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIActionSheetiOSDismissActionView dismissButton](self, "dismissButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;

  -[UIView traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActionSheetiOSDismissActionView _heightForTraitCollection:](self, "_heightForTraitCollection:", v9);
  v11 = v10;

  v12 = v8;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButton, a3);
}

- (BOOL)usesShortCompactVerticalLayout
{
  return self->_usesShortCompactVerticalLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissButton, 0);
}

@end
