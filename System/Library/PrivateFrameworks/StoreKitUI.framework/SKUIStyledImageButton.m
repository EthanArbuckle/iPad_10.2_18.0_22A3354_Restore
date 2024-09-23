@implementation SKUIStyledImageButton

- (SKUIStyledImageButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUIStyledImageButton *v8;
  SKUIImageView *v9;
  uint64_t v10;
  SKUIImageView *imageView;
  SKUIImageView *v12;
  uint64_t v13;
  SKUIImageView *additionalImageView;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIStyledImageButton initWithFrame:].cold.1();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIStyledImageButton;
  v8 = -[SKUIStyledImageButton initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = [SKUIImageView alloc];
    -[SKUIStyledImageButton bounds](v8, "bounds");
    v10 = -[SKUIImageView initWithFrame:](v9, "initWithFrame:");
    imageView = v8->_imageView;
    v8->_imageView = (SKUIImageView *)v10;

    -[SKUIImageView setAutoresizingMask:](v8->_imageView, "setAutoresizingMask:", 18);
    -[SKUIImageView setUserInteractionEnabled:](v8->_imageView, "setUserInteractionEnabled:", 0);
    -[SKUIStyledImageButton addSubview:](v8, "addSubview:", v8->_imageView);
    v12 = [SKUIImageView alloc];
    v13 = -[SKUIImageView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    additionalImageView = v8->_additionalImageView;
    v8->_additionalImageView = (SKUIImageView *)v13;

    -[SKUIImageView setAutoresizingMask:](v8->_additionalImageView, "setAutoresizingMask:", 45);
    -[SKUIImageView setUserInteractionEnabled:](v8->_additionalImageView, "setUserInteractionEnabled:", 0);
    -[SKUIStyledImageButton addSubview:](v8, "addSubview:", v8->_additionalImageView);
  }
  return v8;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v4;

  self->_didInitialHighlightForTouch = 0;
  v4.receiver = self;
  v4.super_class = (Class)SKUIStyledImageButton;
  -[SKUIStyledImageButton touchesBegan:withEvent:](&v4, sel_touchesBegan_withEvent_, a3, a4);
}

- (CGRect)hitRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  objc_super v15;
  CGRect result;

  if (self->_useBigHitTarget)
  {
    v15.receiver = self;
    v15.super_class = (Class)SKUIStyledImageButton;
    -[SKUIStyledImageButton hitRect](&v15, sel_hitRect);
    v7 = 488;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SKUIStyledImageButton;
    -[SKUIStyledImageButton hitRect](&v14, sel_hitRect);
    v7 = 528;
  }
  v8 = (double *)((char *)self + v7);
  v9 = v8[1];
  v10 = v3 + v9;
  v11 = v4 + *v8;
  v12 = v5 - (v9 + v8[3]);
  v13 = v6 - (*v8 + v8[2]);
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  SKUIImageView *additionalImageView;
  CGFloat v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)SKUIStyledImageButton;
  -[SKUIStyledImageButton layoutSubviews](&v9, sel_layoutSubviews);
  -[SKUIImageView imageSize](self->_additionalImageView, "imageSize");
  v4 = v3;
  v6 = v5;
  additionalImageView = self->_additionalImageView;
  -[SKUIStyledImageButton bounds](self, "bounds");
  v8 = CGRectGetMidX(v10) - v4 * 0.5;
  -[SKUIStyledImageButton bounds](self, "bounds");
  -[SKUIImageView setFrame:](additionalImageView, "setFrame:", v8, CGRectGetMidY(v11) - v6 * 0.5, v4, v6);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[SKUIStyledImageButton hitRect](self, "hitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (void)setBackgroundColor:(id)a3
{
  SKUIImageView *imageView;
  id v5;
  SKUIImageView *additionalImageView;
  void *v7;
  objc_super v8;

  imageView = self->_imageView;
  v5 = a3;
  -[SKUIImageView setBackgroundColor:](imageView, "setBackgroundColor:", v5);
  additionalImageView = self->_additionalImageView;
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIImageView setBackgroundColor:](additionalImageView, "setBackgroundColor:", v7);

  v8.receiver = self;
  v8.super_class = (Class)SKUIStyledImageButton;
  -[SKUIStyledImageButton setBackgroundColor:](&v8, sel_setBackgroundColor_, v5);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  _QWORD v6[6];
  objc_super v7;

  v3 = a3;
  if (-[SKUIStyledImageButton isHighlighted](self, "isHighlighted") != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SKUIStyledImageButton;
    -[SKUIStyledImageButton setHighlighted:](&v7, sel_setHighlighted_, v3);
    v5 = 1.0;
    if (v3 && (v5 = 0.2, !self->_didInitialHighlightForTouch))
    {
      -[SKUIStyledImageButton setAlpha:](self, "setAlpha:", 0.2, 0.2);
      self->_didInitialHighlightForTouch = 1;
    }
    else
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __40__SKUIStyledImageButton_setHighlighted___block_invoke;
      v6[3] = &unk_1E73A4960;
      v6[4] = self;
      *(double *)&v6[5] = v5;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 327684, v6, 0, 0.47, 0.0);
    }
  }
}

uint64_t __40__SKUIStyledImageButton_setHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[SKUIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIEdgeInsets)bigHitInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_bigHitInsets.top;
  left = self->_bigHitInsets.left;
  bottom = self->_bigHitInsets.bottom;
  right = self->_bigHitInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setBigHitInsets:(UIEdgeInsets)a3
{
  self->_bigHitInsets = a3;
}

- (SKUIImageView)imageView
{
  return self->_imageView;
}

- (BOOL)useBigHitTarget
{
  return self->_useBigHitTarget;
}

- (void)setUseBigHitTarget:(BOOL)a3
{
  self->_useBigHitTarget = a3;
}

- (SKUIImageView)additionalImageView
{
  return self->_additionalImageView;
}

- (UIEdgeInsets)hitRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitRectInsets.top;
  left = self->_hitRectInsets.left;
  bottom = self->_hitRectInsets.bottom;
  right = self->_hitRectInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHitRectInsets:(UIEdgeInsets)a3
{
  self->_hitRectInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIStyledImageButton initWithFrame:]";
}

@end
