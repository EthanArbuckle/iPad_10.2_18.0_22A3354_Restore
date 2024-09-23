@implementation SKUIBadgeLabel

- (SKUIBadgeLabel)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIBadgeLabel *v8;
  SKUIBadgeLabel *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBadgeLabel initWithFrame:].cold.1();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIBadgeLabel;
  v8 = -[SKUIBadgeLabel initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    -[SKUIBadgeLabel layer](v8, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerRadius:", 6.0);

    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 10.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIBadgeLabel setFont:](v9, "setFont:", v11);

    -[SKUIBadgeLabel setTextAlignment:](v9, "setTextAlignment:", 1);
    -[SKUIBadgeLabel setClipsToBounds:](v9, "setClipsToBounds:", 1);
    objc_msgSend((id)objc_opt_class(), "defaultBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIBadgeLabel setBackgroundColor:](v9, "setBackgroundColor:", v12);

    objc_msgSend((id)objc_opt_class(), "defaultTextColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIBadgeLabel setTextColor:](v9, "setTextColor:", v13);

  }
  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGSize result;

  v7.receiver = self;
  v7.super_class = (Class)SKUIBadgeLabel;
  -[SKUIBadgeLabel sizeThatFits:](&v7, sel_sizeThatFits_, a3.width, a3.height);
  v4 = v3 + 9.0;
  v6 = v5 + 0.0;
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  CGContext *CurrentContext;
  void *v10;
  void *v11;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SKUIBadgeLabel superview](self, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    -[SKUIBadgeLabel backgroundColor](self, "backgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "set");

    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, 6.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fill");

    CGContextRestoreGState(CurrentContext);
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIBadgeLabel;
  -[SKUIBadgeLabel drawTextInRect:](&v12, sel_drawTextInRect_, x, y, width, height);
}

+ (id)defaultBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.517647059, 1.0);
}

+ (id)defaultTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIBadgeLabel initWithFrame:]";
}

@end
