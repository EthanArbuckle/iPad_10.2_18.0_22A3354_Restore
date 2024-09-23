@implementation SKUIRedeemTextField

- (SKUIRedeemTextField)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIRedeemTextField *v8;
  uint64_t v9;
  UIView *backdropView;
  UIView *v11;
  UIView *bottomBorderView;
  UIView *v13;
  void *v14;
  UIView *v15;
  UIView *topBorderView;
  UIView *v17;
  void *v18;
  void *v19;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemTextField initWithFrame:].cold.1();
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIRedeemTextField;
  v8 = -[SKUIRedeemTextField initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", 10060);
    backdropView = v8->_backdropView;
    v8->_backdropView = (UIView *)v9;

    -[UIView setHidden:](v8->_backdropView, "setHidden:", 1);
    -[SKUIRedeemTextField insertSubview:atIndex:](v8, "insertSubview:atIndex:", v8->_backdropView, 0);
    v11 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    bottomBorderView = v8->_bottomBorderView;
    v8->_bottomBorderView = v11;

    v13 = v8->_bottomBorderView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v13, "setBackgroundColor:", v14);

    -[SKUIRedeemTextField addSubview:](v8, "addSubview:", v8->_bottomBorderView);
    v15 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    topBorderView = v8->_topBorderView;
    v8->_topBorderView = v15;

    v17 = v8->_topBorderView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    -[SKUIRedeemTextField addSubview:](v8, "addSubview:", v8->_topBorderView);
    v8->_backdropBackground = 0;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemTextField setBackgroundColor:](v8, "setBackgroundColor:", v19);

    -[SKUIRedeemTextField setOpaque:](v8, "setOpaque:", 1);
  }
  return v8;
}

- (void)setBackdropBackground:(BOOL)a3
{
  _BOOL4 v3;
  UIView *backdropView;
  void *v6;

  if (self->_backdropBackground != a3)
  {
    v3 = a3;
    self->_backdropBackground = a3;
    backdropView = self->_backdropView;
    if (a3)
    {
      -[UIView setHidden:](backdropView, "setHidden:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    }
    else
    {
      -[UIView setHidden:](backdropView, "setHidden:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIRedeemTextField setBackgroundColor:](self, "setBackgroundColor:", v6);

    -[SKUIRedeemTextField setOpaque:](self, "setOpaque:", !v3);
  }
}

- (void)setSuppressBorder:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_suppressBorder = a3;
  -[UIView setHidden:](self->_bottomBorderView, "setHidden:");
  -[UIView setHidden:](self->_topBorderView, "setHidden:", v3);
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)SKUIRedeemTextField;
  -[SKUIRedeemTextField editingRectForBounds:](&v8, sel_editingRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = width + -30.0;
  v7 = 15.0;
  result.size.height = v5;
  result.size.width = v6;
  result.origin.y = v4;
  result.origin.x = v7;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)SKUIRedeemTextField;
  -[SKUIRedeemTextField placeholderRectForBounds:](&v8, sel_placeholderRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = width + -30.0;
  v7 = 15.0;
  result.size.height = v5;
  result.size.width = v6;
  result.origin.y = v4;
  result.origin.x = v7;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double width;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)SKUIRedeemTextField;
  -[SKUIRedeemTextField textRectForBounds:](&v8, sel_textRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = width + -30.0;
  v7 = 15.0;
  result.size.height = v5;
  result.size.width = v6;
  result.origin.y = v4;
  result.origin.x = v7;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  objc_super v10;

  -[SKUIRedeemTextField bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = 1.0 / v8;

  -[UIView setFrame:](self->_bottomBorderView, "setFrame:", 0.0, v6 - v9, v4, v9);
  -[UIView setFrame:](self->_topBorderView, "setFrame:", 0.0, 0.0, v4, v9);
  v10.receiver = self;
  v10.super_class = (Class)SKUIRedeemTextField;
  -[SKUIRedeemTextField layoutSubviews](&v10, sel_layoutSubviews);
}

- (BOOL)backdropBackground
{
  return self->_backdropBackground;
}

- (BOOL)suppressBorder
{
  return self->_suppressBorder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_bottomBorderView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIRedeemTextField initWithFrame:]";
}

@end
