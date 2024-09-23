@implementation SKUIGroupedHeaderView

- (SKUIGroupedHeaderView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIGroupedHeaderView *v8;
  void *v9;
  UILabel *v10;
  UILabel *titleLabel;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  UIView *v16;
  UIView *topBorder;
  UIView *v18;
  void *v19;
  UIView *v20;
  UIView *botBorder;
  UIView *v22;
  void *v23;
  objc_super v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGroupedHeaderView initWithFrame:].cold.1();
  }
  v25.receiver = self;
  v25.super_class = (Class)SKUIGroupedHeaderView;
  v8 = -[SKUIGroupedHeaderView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.94, 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIGroupedHeaderView setBackgroundColor:](v8, "setBackgroundColor:", v9);

    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v10;

    v12 = v8->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12, "setFont:", v13);

    v14 = v8->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.43, 1.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v14, "setTextColor:", v15);

    -[SKUIGroupedHeaderView addSubview:](v8, "addSubview:", v8->_titleLabel);
    v16 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    topBorder = v8->_topBorder;
    v8->_topBorder = v16;

    v18 = v8->_topBorder;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.85, 1.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v18, "setBackgroundColor:", v19);

    -[SKUIGroupedHeaderView addSubview:](v8, "addSubview:", v8->_topBorder);
    v20 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    botBorder = v8->_botBorder;
    v8->_botBorder = v20;

    v22 = v8->_botBorder;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.85, 1.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v22, "setBackgroundColor:", v23);

    -[SKUIGroupedHeaderView addSubview:](v8, "addSubview:", v8->_botBorder);
  }
  return v8;
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (BOOL)hasTopBorder
{
  return -[UIView isHidden](self->_topBorder, "isHidden");
}

- (void)setHasTopBorder:(BOOL)a3
{
  -[UIView setHidden:](self->_topBorder, "setHidden:", !a3);
}

- (BOOL)hasBottomBorder
{
  return -[UIView isHidden](self->_botBorder, "isHidden");
}

- (void)setHasBottomBorder:(BOOL)a3
{
  -[UIView setHidden:](self->_botBorder, "setHidden:", !a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UILabel text](self->_titleLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  v7 = 35.0;
  if (v6)
    v7 = width;
  v8 = 56.0;
  if (!v6)
    v8 = height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat MaxY;
  UILabel *titleLabel;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;

  v22.receiver = self;
  v22.super_class = (Class)SKUIGroupedHeaderView;
  -[SKUIGroupedHeaderView layoutSubviews](&v22, sel_layoutSubviews);
  -[SKUIGroupedHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UILabel sizeToFit](self->_titleLabel, "sizeToFit");
  -[UILabel frame](self->_titleLabel, "frame");
  v12 = v11;
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  MaxY = CGRectGetMaxY(v23);
  titleLabel = self->_titleLabel;
  SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v4 + 15.0, MaxY - v12 + -5.0, v8 + 30.0, v12, v4, v6, v8, v10);
  -[UILabel setFrame:](titleLabel, "setFrame:");
  if (storeShouldReverseLayoutDirection())
    v15 = 2;
  else
    v15 = 0;
  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", v15);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scale");
  v18 = 1.0 / v17;

  -[UIView setFrame:](self->_topBorder, "setFrame:", v4, v6, v8, v18);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "scale");
  v21 = 1.0 / v20;

  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  -[UIView setFrame:](self->_botBorder, "setFrame:", v4, CGRectGetMaxY(v24) - v21, v8, v21);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_botBorder, 0);
  objc_storeStrong((id *)&self->_topBorder, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIGroupedHeaderView initWithFrame:]";
}

@end
