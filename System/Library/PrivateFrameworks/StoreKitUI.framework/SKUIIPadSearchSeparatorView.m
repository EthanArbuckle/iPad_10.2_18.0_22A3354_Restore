@implementation SKUIIPadSearchSeparatorView

- (SKUIIPadSearchSeparatorView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIIPadSearchSeparatorView *v16;
  void *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        -[SKUIIPadSearchSeparatorView initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIIPadSearchSeparatorView;
  v16 = -[SKUIIPadSearchSeparatorView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.8, 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIIPadSearchSeparatorView setBackgroundColor:](v16, "setBackgroundColor:", v17);

  }
  return v16;
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
