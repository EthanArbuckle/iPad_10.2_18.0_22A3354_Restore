@implementation SKUIStandardInteractiveDividerView

- (SKUIStandardInteractiveDividerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIStandardInteractiveDividerView *v8;
  SKUIStandardInteractiveDividerView *v9;
  void *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStandardInteractiveDividerView initWithFrame:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIStandardInteractiveDividerView;
  v8 = -[SKUIStandardInteractiveDividerView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    -[SKUIStandardInteractiveDividerView tintColor](v8, "tintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIStandardInteractiveDividerView setBackgroundColor:](v9, "setBackgroundColor:", v10);

  }
  return v9;
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIStandardInteractiveDividerView;
  -[SKUIStandardInteractiveDividerView tintColorDidChange](&v4, sel_tintColorDidChange);
  -[SKUIStandardInteractiveDividerView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIStandardInteractiveDividerView setBackgroundColor:](self, "setBackgroundColor:", v3);

}

+ (double)defaultWidth
{
  return 1.0;
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIStandardInteractiveDividerView initWithFrame:]";
}

@end
