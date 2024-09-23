@implementation SKUICircleProgressIndicator

- (SKUICircleProgressIndicator)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SKUICircleProgressIndicator *v8;
  SKUICircleProgressIndicator *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  UIImage *borderImage;
  void *v14;
  uint64_t v15;
  UIImage *fillImage;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUICircleProgressIndicator initWithFrame:].cold.1();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUICircleProgressIndicator;
  v8 = -[SKUICircleProgressIndicator initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    -[SKUICircleProgressIndicator tintColor](v8, "tintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_borderImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_flatImageWithColor:", v10);
    v12 = objc_claimAutoreleasedReturnValue();
    borderImage = v9->_borderImage;
    v9->_borderImage = (UIImage *)v12;

    objc_msgSend((id)objc_opt_class(), "_fillImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "_flatImageWithColor:", v10);
    v15 = objc_claimAutoreleasedReturnValue();
    fillImage = v9->_fillImage;
    v9->_fillImage = (UIImage *)v15;

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIImageView layer](self->_indeterminateView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  v4.receiver = self;
  v4.super_class = (Class)SKUICircleProgressIndicator;
  -[SKUICircleProgressIndicator dealloc](&v4, sel_dealloc);
}

- (BOOL)isIndeterminate
{
  return self->_indeterminateView != 0;
}

- (void)setHighlighted:(BOOL)a3
{
  void *unhighlightedBackgroundColor;
  UIColor *v6;
  UIColor *v7;

  if (self->_highlighted != a3)
  {
    if (self->_highlighted)
    {
      -[SKUICircleProgressIndicator setBackgroundColor:](self, "setBackgroundColor:", self->_unhighlightedBackgroundColor);
      unhighlightedBackgroundColor = self->_unhighlightedBackgroundColor;
      self->_unhighlightedBackgroundColor = 0;
    }
    else
    {
      -[SKUICircleProgressIndicator backgroundColor](self, "backgroundColor");
      v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v7 = self->_unhighlightedBackgroundColor;
      self->_unhighlightedBackgroundColor = v6;

      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      unhighlightedBackgroundColor = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUICircleProgressIndicator setBackgroundColor:](self, "setBackgroundColor:", unhighlightedBackgroundColor);
    }

    self->_highlighted = a3;
    -[SKUICircleProgressIndicator setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  UIImage *v6;
  UIImage *centerImage;
  void *v8;
  _QWORD v9[5];

  if (self->_centerImage != a3)
  {
    v4 = a3;
    -[SKUICircleProgressIndicator tintColor](self, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_flatImageWithColor:", v5);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();

    centerImage = self->_centerImage;
    self->_centerImage = v6;

    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__SKUICircleProgressIndicator_setImage___block_invoke;
    v9[3] = &unk_1E739FD38;
    v9[4] = self;
    objc_msgSend(v8, "_performBlockAfterCATransactionCommits:", v9);

  }
}

uint64_t __40__SKUICircleProgressIndicator_setImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
}

- (void)setImageInsets:(UIEdgeInsets)a3
{
  if (self->_centerImageInsets.left != a3.left
    || self->_centerImageInsets.top != a3.top
    || self->_centerImageInsets.right != a3.right
    || self->_centerImageInsets.bottom != a3.bottom)
  {
    self->_centerImageInsets = a3;
    -[SKUICircleProgressIndicator setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setIndeterminate:(BOOL)a3
{
  UIImageView *indeterminateView;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;
  void *v11;
  UIImageView *v12;
  id v13;

  indeterminateView = self->_indeterminateView;
  if (a3)
  {
    if (!indeterminateView)
    {
      objc_msgSend((id)objc_opt_class(), "_indeterminateImage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUICircleProgressIndicator tintColor](self, "tintColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_flatImageWithColor:", v6);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      v7 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v13);
      v8 = self->_indeterminateView;
      self->_indeterminateView = v7;

      v9 = self->_indeterminateView;
      -[SKUICircleProgressIndicator backgroundColor](self, "backgroundColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setBackgroundColor:](v9, "setBackgroundColor:", v10);

      -[SKUICircleProgressIndicator addSubview:](self, "addSubview:", self->_indeterminateView);
      -[SKUICircleProgressIndicator setNeedsDisplay](self, "setNeedsDisplay");
      -[SKUICircleProgressIndicator _startIndeterminateAnimation](self, "_startIndeterminateAnimation");

    }
  }
  else if (indeterminateView)
  {
    -[UIImageView layer](indeterminateView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeAllAnimations");

    -[UIImageView removeFromSuperview](self->_indeterminateView, "removeFromSuperview");
    v12 = self->_indeterminateView;
    self->_indeterminateView = 0;

    -[SKUICircleProgressIndicator setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setProgress:(double)a3
{
  -[SKUICircleProgressIndicator setProgress:animated:](self, "setProgress:animated:", 0, a3);
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  double progress;
  double v7;
  void *v8;
  CADisplayLink *v9;
  CADisplayLink *displayLink;
  CADisplayLink *v11;
  void *v12;

  progress = self->_progress;
  if (progress != a3)
  {
    if (a4)
    {
      if (self->_isAnimating)
        progress = self->_animatedValue;
      self->_animationStartValue = progress;
      self->_isAnimating = 1;
      self->_animatedValue = self->_progress;
      v7 = CACurrentMediaTime();
      self->_animationStartTime = v7;
      self->_animationEndTime = v7 + 0.2;
      if (self->_displayLink)
        goto LABEL_10;
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayLinkWithTarget:selector:", self, sel__animateValueOnDisplayLink_);
      v9 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      displayLink = self->_displayLink;
      self->_displayLink = v9;

      v11 = self->_displayLink;
      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v11, "addToRunLoop:forMode:", v12, *MEMORY[0x1E0C99860]);
    }
    else
    {
      self->_isAnimating = 0;
      -[CADisplayLink invalidate](self->_displayLink, "invalidate");
      v12 = self->_displayLink;
      self->_displayLink = 0;
    }

LABEL_10:
    self->_progress = a3;
    -[SKUICircleProgressIndicator setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)didMoveToWindow
{
  void *v3;
  UIImageView *indeterminateView;
  void *v5;
  objc_super v6;
  _QWORD v7[5];

  -[SKUICircleProgressIndicator window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    indeterminateView = self->_indeterminateView;

    if (indeterminateView)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __46__SKUICircleProgressIndicator_didMoveToWindow__block_invoke;
      v7[3] = &unk_1E739FD38;
      v7[4] = self;
      objc_msgSend(v5, "_performBlockAfterCATransactionCommits:", v7);

    }
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUICircleProgressIndicator;
  -[SKUICircleProgressIndicator didMoveToWindow](&v6, sel_didMoveToWindow);
}

uint64_t __46__SKUICircleProgressIndicator_didMoveToWindow__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 520), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllAnimations");

  return objc_msgSend(*(id *)(a1 + 32), "_startIndeterminateAnimation");
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIImage *centerImage;
  double v13;
  double v14;
  double v15;
  double MidX;
  double MidY;
  float v18;
  double v19;
  int *v20;
  double v21;
  id v22;
  CGRect v23;
  CGRect v24;

  if (!self->_indeterminateView)
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[SKUICircleProgressIndicator bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[UIImage drawInRect:](self->_borderImage, "drawInRect:");
    centerImage = self->_centerImage;
    if (centerImage)
    {
      -[UIImage size](centerImage, "size");
      v14 = v13;
      *(float *)&v13 = (v9 - v13) * 0.5;
      *(float *)&v15 = (v11 - v15) * 0.5;
      -[UIImage drawInRect:](self->_centerImage, "drawInRect:", self->_centerImageInsets.left + floorf(*(float *)&v13), self->_centerImageInsets.top + floorf(*(float *)&v15), v14);
    }
    v23.origin.x = v5;
    v23.origin.y = v7;
    v23.size.width = v9;
    v23.size.height = v11;
    MidX = CGRectGetMidX(v23);
    v24.origin.x = v5;
    v24.origin.y = v7;
    v24.size.width = v9;
    v24.size.height = v11;
    MidY = CGRectGetMidY(v24);
    v18 = v11 * 0.5;
    v19 = ceilf(v18);
    if (self->_isAnimating)
      v20 = &OBJC_IVAR___SKUICircleProgressIndicator__animatedValue;
    else
      v20 = &OBJC_IVAR___SKUICircleProgressIndicator__progress;
    v21 = *(double *)((char *)&self->super.super.super.isa + *v20);
    objc_msgSend(v22, "moveToPoint:", MidX, MidY);
    objc_msgSend(v22, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, v19, -1.57079633, v21 * 6.28318531 + -1.57079633);
    objc_msgSend(v22, "addLineToPoint:", MidX, MidY);
    objc_msgSend(v22, "clip");
    -[UIImage drawInRect:](self->_fillImage, "drawInRect:", v5, v7, v9, v11);

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  float v8;
  double v9;
  float v10;

  if (self->_indeterminateView)
  {
    -[SKUICircleProgressIndicator bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    -[UIImageView frame](self->_indeterminateView, "frame");
    v8 = (v4 - v7) * 0.5;
    v10 = (v6 - v9) * 0.5;
    -[UIImageView setFrame:](self->_indeterminateView, "setFrame:", roundf(v8), roundf(v10));
  }
}

- (void)setBackgroundColor:(id)a3
{
  UIImageView *indeterminateView;
  id v5;
  objc_super v6;

  indeterminateView = self->_indeterminateView;
  v5 = a3;
  -[UIImageView setBackgroundColor:](indeterminateView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SKUICircleProgressIndicator;
  -[SKUICircleProgressIndicator setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIImage size](self->_fillImage, "size", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)tintColorDidChange
{
  void *v3;
  UIImage *v4;
  UIImage *centerImage;
  void *v6;
  UIImage *v7;
  UIImage *borderImage;
  void *v9;
  UIImage *v10;
  UIImage *fillImage;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SKUICircleProgressIndicator;
  -[SKUICircleProgressIndicator tintColorDidChange](&v15, sel_tintColorDidChange);
  -[SKUICircleProgressIndicator tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImage _flatImageWithColor:](self->_centerImage, "_flatImageWithColor:", v3);
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  centerImage = self->_centerImage;
  self->_centerImage = v4;

  if (self->_borderImage)
  {
    objc_msgSend((id)objc_opt_class(), "_borderImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_flatImageWithColor:", v3);
    v7 = (UIImage *)objc_claimAutoreleasedReturnValue();
    borderImage = self->_borderImage;
    self->_borderImage = v7;

  }
  objc_msgSend((id)objc_opt_class(), "_fillImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_flatImageWithColor:", v3);
  v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
  fillImage = self->_fillImage;
  self->_fillImage = v10;

  if (self->_indeterminateView)
  {
    objc_msgSend((id)objc_opt_class(), "_indeterminateImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUICircleProgressIndicator tintColor](self, "tintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_flatImageWithColor:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    -[UIImageView setImage:](self->_indeterminateView, "setImage:", v14);
    v9 = (void *)v14;
  }
  -[SKUICircleProgressIndicator setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)_setHidesBorderView:(BOOL)a3
{
  void *borderImage;
  void *v5;
  UIImage *v6;
  UIImage *v7;

  if (a3)
  {
    borderImage = self->_borderImage;
    self->_borderImage = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_borderImage");
    borderImage = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUICircleProgressIndicator tintColor](self, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(borderImage, "_flatImageWithColor:", v5);
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_borderImage;
    self->_borderImage = v6;

  }
  -[SKUICircleProgressIndicator setNeedsDisplay](self, "setNeedsDisplay");
}

+ (id)_borderImage
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)_borderImage_image;
  if (!_borderImage_image)
  {
    v3 = (void *)MEMORY[0x1E0DC3870];
    SKUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("DownloadProgressBorderThin"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)_borderImage_image;
    _borderImage_image = v5;

    v2 = (void *)_borderImage_image;
  }
  return v2;
}

+ (id)_fillImage
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)_fillImage_image;
  if (!_fillImage_image)
  {
    v3 = (void *)MEMORY[0x1E0DC3870];
    SKUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("DownloadProgressBorderThick"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)_fillImage_image;
    _fillImage_image = v5;

    v2 = (void *)_fillImage_image;
  }
  return v2;
}

+ (id)_indeterminateImage
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)_indeterminateImage_image;
  if (!_indeterminateImage_image)
  {
    v3 = (void *)MEMORY[0x1E0DC3870];
    SKUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("DownloadProgressBorderIndeterminate"), v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)_indeterminateImage_image;
    _indeterminateImage_image = v5;

    v2 = (void *)_indeterminateImage_image;
  }
  return v2;
}

- (void)_animateValueOnDisplayLink:(id)a3
{
  double v4;
  float v5;
  CADisplayLink *displayLink;

  objc_msgSend(a3, "timestamp");
  v5 = (v4 - self->_animationStartTime) / (self->_animationEndTime - self->_animationStartTime);
  if (v5 >= 0.99)
  {
    self->_isAnimating = 0;
    self->_animatedValue = self->_progress;
    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    displayLink = self->_displayLink;
    self->_displayLink = 0;

  }
  else
  {
    self->_animatedValue = self->_animationStartValue + (self->_progress - self->_animationStartValue) * v5;
  }
  -[SKUICircleProgressIndicator setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_startIndeterminateAnimation
{
  UIImageView *indeterminateView;
  _QWORD v4[5];
  CGAffineTransform v5;

  indeterminateView = self->_indeterminateView;
  CGAffineTransformMakeRotation(&v5, -1.57079633);
  -[UIImageView setTransform:](indeterminateView, "setTransform:", &v5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__SKUICircleProgressIndicator__startIndeterminateAnimation__block_invoke;
  v4[3] = &unk_1E739FD38;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateKeyframesWithDuration:delay:options:animations:completion:", 196616, v4, 0, 1.0, 0.0);
}

uint64_t __59__SKUICircleProgressIndicator__startIndeterminateAnimation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD v5[6];

  v2 = 0;
  v3 = MEMORY[0x1E0C809B0];
  do
  {
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __59__SKUICircleProgressIndicator__startIndeterminateAnimation__block_invoke_2;
    v5[3] = &unk_1E73A4960;
    v5[4] = *(_QWORD *)(a1 + 32);
    v5[5] = v2;
    result = objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, (double)v2++ * 0.25, 0.25);
  }
  while (v2 != 4);
  return result;
}

uint64_t __59__SKUICircleProgressIndicator__startIndeterminateAnimation__block_invoke_2(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 520);
  CGAffineTransformMakeRotation(&v3, (double)*(uint64_t *)(a1 + 40) * 1.57079633);
  return objc_msgSend(v1, "setTransform:", &v3);
}

- (UIImage)image
{
  return self->_centerImage;
}

- (UIEdgeInsets)imageInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_centerImageInsets.top;
  left = self->_centerImageInsets.left;
  bottom = self->_centerImageInsets.bottom;
  right = self->_centerImageInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unhighlightedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_indeterminateView, 0);
  objc_storeStrong((id *)&self->_fillImage, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_centerImage, 0);
  objc_storeStrong((id *)&self->_borderImage, 0);
}

- (void)initWithFrame:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUICircleProgressIndicator initWithFrame:]";
}

@end
