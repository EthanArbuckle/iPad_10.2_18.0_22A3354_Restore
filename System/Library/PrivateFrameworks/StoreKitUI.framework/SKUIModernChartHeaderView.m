@implementation SKUIModernChartHeaderView

- (SKUIModernChartHeaderView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIModernChartHeaderView *v8;
  UIView *v9;
  UIView *contentView;
  UILabel *v11;
  UILabel *label;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIModernChartHeaderView initWithFrame:].cold.1();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIModernChartHeaderView;
  v8 = -[SKUIModernChartHeaderView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    contentView = v8->_contentView;
    v8->_contentView = v9;

    -[SKUIModernChartHeaderView addSubview:](v8, "addSubview:", v8->_contentView);
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    label = v8->_label;
    v8->_label = v11;

    -[UIView addSubview:](v8->_contentView, "addSubview:", v8->_label);
  }
  return v8;
}

- (void)setTitle:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
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
  id v21;

  v4 = (void *)MEMORY[0x1E0DC1358];
  v5 = *MEMORY[0x1E0DC4AA0];
  v6 = a3;
  objc_msgSend(v4, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v5, 2, 2);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v21, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", 1.3);
  v9 = objc_alloc(MEMORY[0x1E0C99D80]);
  v10 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v7, *MEMORY[0x1E0DC1138], v8, *MEMORY[0x1E0DC1150], 0);
  objc_msgSend(v6, "uppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v11, v10);
  -[UILabel setAttributedText:](self->_label, "setAttributedText:", v12);
  objc_msgSend(v7, "_scaledValueForValue:", 16.0);
  v14 = v13;
  -[UILabel _firstBaselineOffsetFromTop](self->_label, "_firstBaselineOffsetFromTop");
  v16 = v14 - v15;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v18 = v17;
  -[UILabel setFrame:](self->_label, "setFrame:", 0.0, v16, v17, v19);
  objc_msgSend(v7, "_scaledValueForValue:", 24.0);
  -[UIView setFrame:](self->_contentView, "setFrame:", 0.0, 0.0, v18, v20);
  -[SKUIModernChartHeaderView setNeedsLayout](self, "setNeedsLayout");

}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  CGFloat v9;
  objc_super v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  v10.receiver = self;
  v10.super_class = (Class)SKUIModernChartHeaderView;
  -[SKUIModernChartHeaderView layoutSubviews](&v10, sel_layoutSubviews);
  -[SKUIModernChartHeaderView bounds](self, "bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v7 = CGRectGetWidth(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v8 = CGRectGetHeight(v12);
  -[UIView frame](self->_contentView, "frame");
  v9 = CGRectGetHeight(v13);
  -[UIView setFrame:](self->_contentView, "setFrame:", 0.0, floor((v8 - v9) * 0.5), v7, v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIModernChartHeaderView initWithFrame:]";
}

@end
