@implementation _UICircleProgressIndicator

- (_UICircleProgressIndicator)initWithFrame:(CGRect)a3
{
  _UICircleProgressIndicator *v3;
  _UICircleProgressIndicator *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  UIImage *borderImage;
  void *v9;
  uint64_t v10;
  UIImage *fillImage;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UICircleProgressIndicator;
  v3 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView tintColor](v3, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_borderImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithTintColor:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    borderImage = v4->_borderImage;
    v4->_borderImage = (UIImage *)v7;

    objc_msgSend((id)objc_opt_class(), "_fillImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "imageWithTintColor:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    fillImage = v4->_fillImage;
    v4->_fillImage = (UIImage *)v10;

    -[UIView setOpaque:](v4, "setOpaque:", 0);
    -[UIView setClearsContextBeforeDrawing:](v4, "setClearsContextBeforeDrawing:", 1);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIView layer](self->_indeterminateView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  v4.receiver = self;
  v4.super_class = (Class)_UICircleProgressIndicator;
  -[UIView dealloc](&v4, sel_dealloc);
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
      -[UIView setBackgroundColor:](self, "setBackgroundColor:", self->_unhighlightedBackgroundColor);
      unhighlightedBackgroundColor = self->_unhighlightedBackgroundColor;
      self->_unhighlightedBackgroundColor = 0;
    }
    else
    {
      -[UIView backgroundColor](self, "backgroundColor");
      v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
      v7 = self->_unhighlightedBackgroundColor;
      self->_unhighlightedBackgroundColor = v6;

      +[UIColor clearColor](UIColor, "clearColor");
      unhighlightedBackgroundColor = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self, "setBackgroundColor:", unhighlightedBackgroundColor);
    }

    self->_highlighted = a3;
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (self->_centerImage != a3)
  {
    v4 = a3;
    -[UIView tintColor](self, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageWithTintColor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UICircleProgressIndicator setImage:](self, "setImage:", v6);
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setImageInsets:(UIEdgeInsets)a3
{
  if (self->_centerImageInsets.left != a3.left
    || self->_centerImageInsets.top != a3.top
    || self->_centerImageInsets.right != a3.right
    || self->_centerImageInsets.bottom != a3.bottom)
  {
    self->_centerImageInsets = a3;
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setIndeterminate:(BOOL)a3
{
  UIImageView *indeterminateView;
  void *v5;
  void *v6;
  UIImageView *v7;
  UIImageView *v8;
  void *v9;
  UIImageView *v10;
  id v11;

  indeterminateView = self->_indeterminateView;
  if (a3)
  {
    if (!indeterminateView)
    {
      objc_msgSend((id)objc_opt_class(), "_indeterminateImage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView tintColor](self, "tintColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "imageWithTintColor:", v6);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v7 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v11);
      v8 = self->_indeterminateView;
      self->_indeterminateView = v7;

      -[UIView addSubview:](self, "addSubview:", self->_indeterminateView);
      -[UIView setNeedsDisplay](self, "setNeedsDisplay");
      -[_UICircleProgressIndicator _startIndeterminateAnimation](self, "_startIndeterminateAnimation");

    }
  }
  else if (indeterminateView)
  {
    -[UIView layer](indeterminateView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllAnimations");

    -[UIView removeFromSuperview](self->_indeterminateView, "removeFromSuperview");
    v10 = self->_indeterminateView;
    self->_indeterminateView = 0;

    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setProgress:(double)a3
{
  -[_UICircleProgressIndicator setProgress:animated:](self, "setProgress:animated:", 0, a3);
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
      +[UIScreen mainScreen](UIScreen, "mainScreen");
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
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)didMoveToWindow
{
  void *v3;
  UIImageView *indeterminateView;
  void *v5;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    indeterminateView = self->_indeterminateView;

    if (indeterminateView)
    {
      -[UIView layer](self->_indeterminateView, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeAllAnimations");

      -[_UICircleProgressIndicator _startIndeterminateAnimation](self, "_startIndeterminateAnimation");
    }
  }
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
  uint64_t v20;
  double v21;
  id v22;
  CGRect v23;
  CGRect v24;

  if (!self->_indeterminateView)
  {
    +[UIBezierPath bezierPath](UIBezierPath, "bezierPath", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView bounds](self, "bounds");
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
    v20 = 10;
    if (!self->_isAnimating)
      v20 = 7;
    v21 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____UICircleProgressIndicator__borderImage[v20]);
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
    -[UIView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    -[UIView frame](self->_indeterminateView, "frame");
    v8 = (v4 - v7) * 0.5;
    v10 = (v6 - v9) * 0.5;
    -[UIImageView setFrame:](self->_indeterminateView, "setFrame:", floorf(v8), floorf(v10));
  }
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UICircleProgressIndicator;
  -[UIView tintColorDidChange](&v12, sel_tintColorDidChange);
  -[UIView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImage imageWithTintColor:](self->_centerImage, "imageWithTintColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICircleProgressIndicator setImage:](self, "setImage:", v4);

  if (self->_borderImage)
  {
    objc_msgSend((id)objc_opt_class(), "_borderImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithTintColor:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICircleProgressIndicator setBorderImage:](self, "setBorderImage:", v6);

  }
  objc_msgSend((id)objc_opt_class(), "_fillImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithTintColor:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UICircleProgressIndicator setFillImage:](self, "setFillImage:", v8);

  if (self->_indeterminateView)
  {
    objc_msgSend((id)objc_opt_class(), "_indeterminateImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView tintColor](self, "tintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageWithTintColor:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    -[UIImageView setImage:](self->_indeterminateView, "setImage:", v11);
    v7 = (void *)v11;
  }
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)_setHidesBorderView:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    -[_UICircleProgressIndicator setBorderImage:](self, "setBorderImage:", 0);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_borderImage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView tintColor](self, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageWithTintColor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICircleProgressIndicator setBorderImage:](self, "setBorderImage:", v6);

  }
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

+ (id)_borderImage
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_borderImage_image;
  if (!_borderImage_image)
  {
    _UIImageWithName(CFSTR("UIDownloadProgressBorderThin"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_borderImage_image;
    _borderImage_image = v3;

    v2 = (void *)_borderImage_image;
  }
  return v2;
}

+ (id)_fillImage
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_fillImage_image;
  if (!_fillImage_image)
  {
    _UIImageWithName(CFSTR("UIDownloadProgressBorderThick"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_fillImage_image;
    _fillImage_image = v3;

    v2 = (void *)_fillImage_image;
  }
  return v2;
}

+ (id)_indeterminateImage
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_indeterminateImage_image;
  if (!_indeterminateImage_image)
  {
    _UIImageWithName(CFSTR("UIDownloadProgressBorderIndeterminate"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_indeterminateImage_image;
    _indeterminateImage_image = v3;

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
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_startIndeterminateAnimation
{
  UIImageView *indeterminateView;
  _QWORD v4[5];
  CGAffineTransform v5;

  indeterminateView = self->_indeterminateView;
  CGAffineTransformMakeRotation(&v5, -1.57079633);
  -[UIView setTransform:](indeterminateView, "setTransform:", &v5);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58___UICircleProgressIndicator__startIndeterminateAnimation__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 196616, v4, 0, 1.0, 0.0);
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

- (UIImage)borderImage
{
  return self->_borderImage;
}

- (void)setBorderImage:(id)a3
{
  objc_storeStrong((id *)&self->_borderImage, a3);
}

- (UIImage)fillImage
{
  return self->_fillImage;
}

- (void)setFillImage:(id)a3
{
  objc_storeStrong((id *)&self->_fillImage, a3);
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

@end
