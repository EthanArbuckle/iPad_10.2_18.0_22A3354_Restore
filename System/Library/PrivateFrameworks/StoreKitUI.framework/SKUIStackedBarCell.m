@implementation SKUIStackedBarCell

- (SKUIStackedBarCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIStackedBarCell *v8;
  UIView *v9;
  UIView *separator;
  UIView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UIButton *backButton;
  UILabel *v18;
  UILabel *expandedLabel;
  UILabel *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStackedBarCell initWithFrame:].cold.1();
  }
  v27.receiver = self;
  v27.super_class = (Class)SKUIStackedBarCell;
  v8 = -[SKUIStackedBarCell initWithFrame:](&v27, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separator = v8->_separator;
    v8->_separator = v9;

    v11 = v8->_separator;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.25);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[SKUIStackedBarCell addSubview:](v8, "addSubview:", v8->_separator);
    v13 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageNamed:inBundle:", CFSTR("AppStoreBrowseCategoryBackChevron"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v16 = objc_claimAutoreleasedReturnValue();
    backButton = v8->_backButton;
    v8->_backButton = (UIButton *)v16;

    -[UIButton setImage:forState:](v8->_backButton, "setImage:forState:", v15, 0);
    -[UIButton setTag:](v8->_backButton, "setTag:", 1398030659);
    -[SKUIStackedBarCell addSubview:](v8, "addSubview:", v8->_backButton);
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    expandedLabel = v8->_expandedLabel;
    v8->_expandedLabel = v18;

    v20 = v8->_expandedLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 17.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v20, "setFont:", v21);

    -[SKUIStackedBarCell addSubview:](v8, "addSubview:", v8->_expandedLabel);
    -[SKUIStackedBarCell tintColor](v8, "tintColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStackedBarCell setTitleColor:forState:](v8, "setTitleColor:forState:", v22, 0);

    -[SKUIStackedBarCell titleLabel](v8, "titleLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFont:", v24);

    -[SKUIStackedBarCell titleLabel](v8, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTextAlignment:", 1);

  }
  return v8;
}

- (void)setHighlighted:(BOOL)a3
{
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  if (!self->_expanded)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.8824, 0.82);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0.25;
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = 0.47;
      v5 = (void *)v7;
    }
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37__SKUIStackedBarCell_setHighlighted___block_invoke;
    v10[3] = &unk_1E739FD10;
    v10[4] = self;
    v11 = v5;
    v9 = v5;
    objc_msgSend(v8, "animateWithDuration:animations:completion:", v10, 0, v6);

  }
}

uint64_t __37__SKUIStackedBarCell_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

- (void)setExpanded:(BOOL)a3
{
  UILabel *expandedLabel;
  double v5;
  void *v6;
  void *v7;
  double v8;
  CGAffineTransform v9;
  CGAffineTransform v10;

  self->_expanded = a3;
  expandedLabel = self->_expandedLabel;
  if (a3)
  {
    v5 = 1.0;
    CGAffineTransformMakeScale(&v10, 1.0, 1.0);
    -[UILabel setTransform:](expandedLabel, "setTransform:", &v10);
    -[UILabel setAlpha:](self->_expandedLabel, "setAlpha:", 1.0);
    -[SKUIStackedBarCell titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0.0;
  }
  else
  {
    CGAffineTransformMakeScale(&v9, 0.705882353, 0.705882353);
    -[UILabel setTransform:](expandedLabel, "setTransform:", &v9);
    v5 = 0.0;
    -[UILabel setAlpha:](self->_expandedLabel, "setAlpha:", 0.0);
    -[SKUIStackedBarCell titleLabel](self, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1.0;
  }
  objc_msgSend(v6, "setAlpha:", v8);

  -[UIButton setAlpha:](self->_backButton, "setAlpha:", v5);
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUIStackedBarCell;
  v6 = a3;
  -[SKUIStackedBarCell setTitle:forState:](&v7, sel_setTitle_forState_, v6, a4);
  -[UILabel setText:](self->_expandedLabel, "setText:", v6, v7.receiver, v7.super_class);

}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = 44.0;
  if (!self->_expanded)
    v3 = 25.0;
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat Width;
  void *v13;
  double v14;
  CGFloat v15;
  double Height;
  CGFloat v17;
  UIView *separator;
  UIButton *backButton;
  UILabel *expandedLabel;
  void *v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v22.receiver = self;
  v22.super_class = (Class)SKUIStackedBarCell;
  -[SKUIStackedBarCell layoutSubviews](&v22, sel_layoutSubviews);
  -[SKUIStackedBarCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[SKUIStackedBarCell bounds](self, "bounds");
  Width = CGRectGetWidth(v23);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = 1.0 / v14;

  -[SKUIStackedBarCell bounds](self, "bounds");
  Height = CGRectGetHeight(v24);
  v25.origin.x = 0.0;
  v25.origin.y = v11;
  v25.size.width = Width;
  v25.size.height = v15;
  v17 = CGRectGetHeight(v25);
  separator = self->_separator;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(0.0, Height - v17, Width, v15, v4, v6, v8, v10);
  -[UIView setFrame:](separator, "setFrame:");
  backButton = self->_backButton;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(0.0, 0.0, 47.0, 42.0, v4, v6, v8, v10);
  -[UIButton setFrame:](backButton, "setFrame:");
  -[UILabel sizeToFit](self->_expandedLabel, "sizeToFit");
  expandedLabel = self->_expandedLabel;
  -[SKUIStackedBarCell titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "center");
  -[UILabel setCenter:](expandedLabel, "setCenter:");

}

- (BOOL)expanded
{
  return self->_expanded;
}

- (UIButton)backButton
{
  return self->_backButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_expandedLabel, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIStackedBarCell initWithFrame:]";
}

@end
