@implementation SKUIBarRatingView

- (SKUIBarRatingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIBarRatingView *result;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBarRatingView initWithFrame:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIBarRatingView;
  result = -[SKUIBarRatingView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  if (result)
    result->_numberOfBars = 11;
  return result;
}

- (void)setBarRatingStyle:(int64_t)a3
{
  if (self->_barRatingStyle != a3)
  {
    self->_barRatingStyle = a3;
    -[SKUIBarRatingView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setNumberOfBars:(int64_t)a3
{
  if (self->_numberOfBars != a3)
  {
    self->_numberOfBars = a3;
    -[SKUIBarRatingView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setRatingValue:(float)a3
{
  if (self->_ratingValue != a3)
  {
    self->_ratingValue = a3;
    -[SKUIBarRatingView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  int64_t numberOfBars;
  float v7;
  int64_t v8;
  uint64_t v9;
  double v10;
  void *v11;
  int64_t barRatingStyle;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  id v18;

  -[SKUIBarRatingView tintColor](self, "tintColor", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "colorWithAlphaComponent:", 0.15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "colorWithAlphaComponent:", 0.45);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  numberOfBars = self->_numberOfBars;
  v7 = ceilf(self->_ratingValue * (float)numberOfBars);
  if (v7 > (float)numberOfBars)
    v7 = (float)numberOfBars;
  if (numberOfBars >= 1)
  {
    v8 = 0;
    v9 = (uint64_t)v7;
    v10 = 0.0;
    do
    {
      if (v8 >= v9)
        v11 = v4;
      else
        v11 = v5;
      objc_msgSend(v11, "set");
      barRatingStyle = self->_barRatingStyle;
      if (barRatingStyle)
        v13 = 1.0;
      else
        v13 = 3.0;
      if (barRatingStyle)
        v14 = 13.0;
      else
        v14 = 10.0;
      v15 = 0;
      v16 = v10;
      v17 = v13;
      UIRectFillUsingBlendMode(*(CGRect *)(&v14 - 3), kCGBlendModeNormal);
      v10 = v10 + v13 + 1.0;
      ++v8;
    }
    while (v8 < self->_numberOfBars);
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  int64_t numberOfBars;
  double v4;
  int64_t barRatingStyle;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  numberOfBars = self->_numberOfBars;
  v4 = (double)numberOfBars;
  barRatingStyle = self->_barRatingStyle;
  v6 = numberOfBars - 1;
  v7 = 1.0;
  if (!barRatingStyle)
    v7 = 3.0;
  v8 = (float)v6 + v4 * v7;
  v9 = 13.0;
  if (!barRatingStyle)
    v9 = 10.0;
  result.height = v9;
  result.width = v8;
  return result;
}

- (int64_t)barRatingStyle
{
  return self->_barRatingStyle;
}

- (int64_t)numberOfBars
{
  return self->_numberOfBars;
}

- (float)ratingValue
{
  return self->_ratingValue;
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIBarRatingView initWithFrame:]";
}

@end
