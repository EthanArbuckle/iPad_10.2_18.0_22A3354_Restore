@implementation BFFTitleView

- (BFFTitleView)initWithFrame:(CGRect)a3
{
  BFFTitleView *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BFFTitleView;
  v3 = -[BFFTitleView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BEBD708]);
    -[BFFTitleView setTitleLabel:](v3, "setTitleLabel:", v4);

    +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFTitleView titleLabel](v3, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applyThemeToTitleLabel:", v6);

    -[BFFTitleView titleLabel](v3, "titleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFTitleView addSubview:](v3, "addSubview:", v7);

    -[BFFTitleView setContentInsetAdjustmentBehavior:](v3, "setContentInsetAdjustmentBehavior:", 2);
  }
  return v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[BFFTitleView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[BFFTitleView setNeedsLayout](self, "setNeedsLayout");
}

- (CGRect)contentBounds
{
  void *v3;
  void *v4;
  void *v5;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFTitleView superview](self, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BFFTitleView superview](self, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v3, "horizontalInsetsForContainingInView:width:", v4, v6);

  -[BFFTitleView frame](self, "frame");
  -[BFFTitleView safeAreaInsets](self, "safeAreaInsets");
  UIRectInset();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[BFFTitleView safeAreaInsets](self, "safeAreaInsets");
  v16 = v15;
  -[BFFTitleView safeAreaInsets](self, "safeAreaInsets");
  v18 = v14 - (v16 + v17);
  v19 = v8;
  v20 = v10;
  v21 = v12;
  result.size.height = v18;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
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
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)BFFTitleView;
  -[BFFTitleView layoutSubviews](&v21, sel_layoutSubviews);
  -[BFFTitleView contentBounds](self, "contentBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[BFFTitleView titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", v8, v10);
  v13 = v12;

  +[BFFStyle sharedStyle](BFFStyle, "sharedStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "headerTitleBaselineOffsetForView:iconSize:", self, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
  v16 = v6 + v15;
  -[BFFTitleView titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_firstBaselineOffsetFromTop");
  v19 = v16 - v18;

  -[BFFTitleView titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v4, v19, v8, v13);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
