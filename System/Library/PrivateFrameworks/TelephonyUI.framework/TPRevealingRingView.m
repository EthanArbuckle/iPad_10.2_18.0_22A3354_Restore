@implementation TPRevealingRingView

+ (id)classIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (TPRevealingRingView)initWithFrame:(CGRect)a3
{
  return -[TPRevealingRingView initWithFrame:paddingOutsideRing:](self, "initWithFrame:paddingOutsideRing:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
}

- (TPRevealingRingView)initWithFrame:(CGRect)a3 paddingOutsideRing:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  TPRevealingRingView *v8;
  TPRevealingRingView *v9;
  void *v10;
  void *v11;
  void *v12;
  _TPTemplatedColoredImageView *v13;
  _TPTemplatedColoredImageView *outerView;
  _TPTemplatedColoredImageView *v15;
  void *v16;
  _TPTemplatedColoredImageView *v17;
  _TPTemplatedColoredImageView *innerView;
  _TPTemplatedColoredImageView *v19;
  void *v20;
  void *v21;
  objc_super v23;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v23.receiver = self;
  v23.super_class = (Class)TPRevealingRingView;
  v8 = -[TPRevealingRingView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = v8;
  if (v8)
  {
    -[TPRevealingRingView setOpaque:](v8, "setOpaque:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPRevealingRingView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[TPRevealingRingView layer](v9, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupBlending:", 0);

    -[TPRevealingRingView layer](v9, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsGroupOpacity:", 0);

    v13 = objc_alloc_init(_TPTemplatedColoredImageView);
    outerView = v9->_outerView;
    v9->_outerView = v13;

    v15 = v9->_outerView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TPTemplatedColoredImageView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[_TPTemplatedColoredImageView setAlpha:](v9->_outerView, "setAlpha:", 1.0);
    -[TPRevealingRingView addSubview:](v9, "addSubview:", v9->_outerView);
    v17 = objc_alloc_init(_TPTemplatedColoredImageView);
    innerView = v9->_innerView;
    v9->_innerView = v17;

    v19 = v9->_innerView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TPTemplatedColoredImageView setBackgroundColor:](v19, "setBackgroundColor:", v20);

    -[_TPTemplatedColoredImageView setAlpha:](v9->_innerView, "setAlpha:", 0.0);
    -[TPRevealingRingView addSubview:](v9, "addSubview:", v9->_innerView);
    -[TPRevealingRingView setDefaultRingStrokeWidth:](v9, "setDefaultRingStrokeWidth:", TPPixelCGCeiling(1.5));
    -[TPRevealingRingView setRevealAnimationDuration:](v9, "setRevealAnimationDuration:", 0.00100000005);
    -[TPRevealingRingView setUnrevealAnimationDuration:](v9, "setUnrevealAnimationDuration:", 0.392500013);
    -[TPRevealingRingView setPaddingOutsideRing:](v9, "setPaddingOutsideRing:", top, left, bottom, right);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPRevealingRingView setColorInsideRing:](v9, "setColorInsideRing:", v21);

    -[TPRevealingRingView setCornerRadius:](v9, "setCornerRadius:", 0.0);
    v9->_alphaInsideRing = 1.0;
    v9->_alphaOutsideRing = 1.0;
  }
  return v9;
}

- (CGSize)ringSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[TPRevealingRingView bounds](self, "bounds");
  v4 = v3 - (self->_paddingOutsideRing.left + self->_paddingOutsideRing.right);
  v6 = v5 - (self->_paddingOutsideRing.top + self->_paddingOutsideRing.bottom);
  result.height = v6;
  result.width = v4;
  return result;
}

- (void)setPaddingOutsideRing:(UIEdgeInsets)a3
{
  if (self->_paddingOutsideRing.left != a3.left
    || self->_paddingOutsideRing.top != a3.top
    || self->_paddingOutsideRing.right != a3.right
    || self->_paddingOutsideRing.bottom != a3.bottom)
  {
    self->_paddingOutsideRing = a3;
    -[TPRevealingRingView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setColorInsideRing:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_colorInsideRing != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_colorInsideRing, a3);
    -[_TPTemplatedColoredImageView setTemplateImageColor:](self->_innerView, "setTemplateImageColor:", self->_colorInsideRing);
    v5 = v6;
  }

}

- (void)setAlphaInsideRing:(double)a3
{
  self->_alphaInsideRing = a3;
  if (!self->_revealed)
    -[_TPTemplatedColoredImageView setAlpha:](self->_innerView, "setAlpha:", 0.0);
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[TPRevealingRingView _evaluateCircularness](self, "_evaluateCircularness");
  }
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TPRevealingRingView;
  -[TPRevealingRingView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[TPRevealingRingView _evaluateCircularness](self, "_evaluateCircularness");
}

- (void)setRevealed:(BOOL)a3 animated:(BOOL)a4
{
  -[TPRevealingRingView setRevealed:animated:delay:](self, "setRevealed:animated:delay:", a3, a4, 0.0);
}

- (void)setRevealed:(BOOL)a3 animated:(BOOL)a4 delay:(double)a5
{
  int *v6;
  double v7;

  if (self->_revealed != a3)
  {
    self->_revealed = a3;
    v6 = &OBJC_IVAR___TPRevealingRingView__unrevealAnimationDuration;
    if (a3)
      v6 = &OBJC_IVAR___TPRevealingRingView__revealAnimationDuration;
    v7 = *(double *)((char *)&self->super.super.super.isa + *v6);
    *(float *)&v7 = v7;
    -[TPRevealingRingView _animateForReveal:withDuration:delay:](self, "_animateForReveal:withDuration:delay:", v7, a5);
  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  UIColor *colorOutsideRing;
  UIColor *colorInsideRing;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  colorOutsideRing = self->_colorOutsideRing;
  colorInsideRing = self->_colorInsideRing;
  NSStringFromUIEdgeInsets(self->_paddingOutsideRing);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p - colorOutsideRing: %@, colorInsideRing: %@, paddingOutsideRing: %@, strokeWidth: %.2f, _cornerRadius: %.2f, circularRing: %d, _revealed: %d>"), v5, self, colorOutsideRing, colorInsideRing, v8, *(_QWORD *)&self->_defaultRingStrokeWidth, *(_QWORD *)&self->_cornerRadius, self->_isCircularRing, self->_revealed);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)layoutSubviews
{
  double top;
  double left;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _TPTemplatedColoredImageView *outerView;
  void *v18;
  _TPTemplatedColoredImageView *innerView;
  void *v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;

  -[TPRevealingRingView bounds](self, "bounds");
  top = self->_paddingOutsideRing.top;
  left = self->_paddingOutsideRing.left;
  v22.origin.x = v9 + left;
  x = v22.origin.x;
  v22.origin.y = v10 + top;
  y = v22.origin.y;
  v22.size.width = v11 - (left + self->_paddingOutsideRing.right);
  width = v22.size.width;
  v22.size.height = v12 - (top + self->_paddingOutsideRing.bottom);
  height = v22.size.height;
  v23 = CGRectInset(v22, self->_defaultRingStrokeWidth, self->_defaultRingStrokeWidth);
  v13 = v23.origin.x;
  v14 = v23.origin.y;
  v15 = v23.size.width;
  v16 = v23.size.height;
  -[_TPTemplatedColoredImageView setFrame:](self->_outerView, "setFrame:", x, y, width, height);
  -[TPRevealingRingView _computeOuterViewDrawingPropertiesWithScale:](self, "_computeOuterViewDrawingPropertiesWithScale:", 1.0);
  outerView = self->_outerView;
  __imageForRoundedRectProperties((uint64_t)&self->_outerViewDrawingProperties);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TPTemplatedColoredImageView setImage:](outerView, "setImage:", v18);

  -[_TPTemplatedColoredImageView setFrame:](self->_innerView, "setFrame:", v13, v14, v15, v16);
  -[TPRevealingRingView _computeInnerViewDrawingPropertiesWithScale:](self, "_computeInnerViewDrawingPropertiesWithScale:", 1.0);
  innerView = self->_innerView;
  __imageForRoundedRectProperties((uint64_t)&self->_innerViewDrawingProperties);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TPTemplatedColoredImageView setImage:](innerView, "setImage:", v20);

  v21.receiver = self;
  v21.super_class = (Class)TPRevealingRingView;
  -[TPRevealingRingView layoutSubviews](&v21, sel_layoutSubviews);
}

- (void)_calculateOuter:(CGRect *)a3 inner:(CGRect *)a4 newXOffset:(double *)a5 newYOffset:(double *)a6 withScale:(double)a7
{
  double top;
  double left;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  CGRect v24;

  -[TPRevealingRingView bounds](self, "bounds");
  top = self->_paddingOutsideRing.top;
  left = self->_paddingOutsideRing.left;
  v16 = v15 + left;
  v18 = v17 + top;
  v20 = v19 - (left + self->_paddingOutsideRing.right);
  v22 = v21 - (top + self->_paddingOutsideRing.bottom);
  v23.origin.x = v15 + left;
  v23.origin.y = v17 + top;
  v23.size.width = v20;
  v23.size.height = v22;
  v24 = CGRectInset(v23, self->_defaultRingStrokeWidth, self->_defaultRingStrokeWidth);
  if (a3)
  {
    a3->origin.x = v16;
    a3->origin.y = v18;
    a3->size.width = v20;
    a3->size.height = v22;
  }
  if (a4)
    *a4 = v24;
  if (a5)
    *a5 = v24.size.width * 0.5 - v24.size.width * 0.5 * a7;
  if (a6)
    *a6 = v24.size.height * 0.5 - v24.size.height * 0.5 * a7;
}

- (void)_computeInnerViewDrawingPropertiesWithScale:(double)a3
{
  CGFloat v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGSize v10;
  double v11;
  double v12;
  __int128 v13;
  float64x2_t v14;
  _OWORD v15[2];

  memset(v15, 0, sizeof(v15));
  v13 = 0u;
  v14 = 0u;
  v11 = 0.0;
  v12 = 0.0;
  -[TPRevealingRingView _calculateOuter:inner:newXOffset:newYOffset:withScale:](self, "_calculateOuter:inner:newXOffset:newYOffset:withScale:", v15, &v13, &v12, &v11);
  v5 = v11;
  v4 = v12;
  v6 = (self->_cornerRadius - self->_defaultRingStrokeWidth) * a3;
  v10 = (CGSize)vmulq_n_f64(v14, a3);
  -[_TPTemplatedColoredImageView size](self->_innerView, "size");
  self->_innerViewDrawingProperties.size.width = v7;
  self->_innerViewDrawingProperties.size.height = v8;
  self->_innerViewDrawingProperties.outerPath.rect.origin.x = v4;
  self->_innerViewDrawingProperties.outerPath.rect.origin.y = v5;
  self->_innerViewDrawingProperties.outerPath.rect.size = v10;
  self->_innerViewDrawingProperties.outerPath.cornerRadius = v6;
}

- (void)_computeOuterViewDrawingPropertiesWithScale:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double defaultRingStrokeWidth;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGSize v15;
  double v16;
  double v17;
  __int128 v18;
  float64x2_t v19;
  _OWORD v20[2];

  memset(v20, 0, sizeof(v20));
  v18 = 0u;
  v19 = 0u;
  v16 = 0.0;
  v17 = 0.0;
  -[TPRevealingRingView _calculateOuter:inner:newXOffset:newYOffset:withScale:](self, "_calculateOuter:inner:newXOffset:newYOffset:withScale:", v20, &v18, &v17, &v16);
  v4 = (self->_cornerRadius - self->_defaultRingStrokeWidth) * a3;
  -[_TPTemplatedColoredImageView bounds](self->_outerView, "bounds");
  v6 = v5;
  -[_TPTemplatedColoredImageView bounds](self->_outerView, "bounds");
  v8 = v7;
  defaultRingStrokeWidth = self->_defaultRingStrokeWidth;
  v10 = v6 * 0.5 - (v6 * 0.5 - defaultRingStrokeWidth) * a3;
  v11 = v8 * 0.5 - (v8 * 0.5 - defaultRingStrokeWidth) * a3;
  v16 = v11;
  v17 = v10;
  v15 = (CGSize)vmulq_n_f64(v19, a3);
  -[_TPTemplatedColoredImageView size](self->_outerView, "size");
  self->_outerViewDrawingProperties.size.width = v12;
  self->_outerViewDrawingProperties.size.height = v13;
  self->_outerViewDrawingProperties.outerPath.rect.origin.x = 0.0;
  self->_outerViewDrawingProperties.outerPath.rect.origin.y = 0.0;
  self->_outerViewDrawingProperties.outerPath.rect.size.width = v6;
  self->_outerViewDrawingProperties.outerPath.rect.size.height = v8;
  self->_outerViewDrawingProperties.outerPath.cornerRadius = self->_cornerRadius;
  self->_outerViewDrawingProperties.innerPath.rect.origin.x = v10;
  self->_outerViewDrawingProperties.innerPath.rect.origin.y = v11;
  self->_outerViewDrawingProperties.innerPath.rect.size = v15;
  self->_outerViewDrawingProperties.innerPath.cornerRadius = v4;
}

- (void)_evaluateCircularness
{
  -[TPRevealingRingView ringSize](self, "ringSize");
  self->_isCircularRing = -[TPRevealingRingView _shouldDrawAsCircle:cornerRadius:](self, "_shouldDrawAsCircle:cornerRadius:");
}

- (BOOL)_isSquare:(CGSize)a3
{
  return vabdd_f64(a3.height, a3.width) < 0.1;
}

- (BOOL)_shouldDrawAsCircle:(CGSize)a3 cornerRadius:(double)a4
{
  double width;
  _BOOL4 v6;

  width = a3.width;
  v6 = -[TPRevealingRingView _isSquare:](self, "_isSquare:", a3.width, a3.height);
  if (v6)
    LOBYTE(v6) = vabdd_f64(width * 0.5, fabs(a4)) < 0.1;
  return v6;
}

- (void)_animateForReveal:(BOOL)a3 withDuration:(float)a4 delay:(double)a5
{
  _QWORD v5[5];
  BOOL v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__TPRevealingRingView__animateForReveal_withDuration_delay___block_invoke;
  v5[3] = &unk_1E75FCFA8;
  v5[4] = self;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, a4);
}

uint64_t __60__TPRevealingRingView__animateForReveal_withDuration_delay___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "setAlpha:", v1);
}

- (double)alphaInsideRing
{
  return self->_alphaInsideRing;
}

- (double)alphaOutsideRing
{
  return self->_alphaOutsideRing;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIEdgeInsets)paddingOutsideRing
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_paddingOutsideRing.top;
  left = self->_paddingOutsideRing.left;
  bottom = self->_paddingOutsideRing.bottom;
  right = self->_paddingOutsideRing.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)defaultRingStrokeWidth
{
  return self->_defaultRingStrokeWidth;
}

- (void)setDefaultRingStrokeWidth:(double)a3
{
  self->_defaultRingStrokeWidth = a3;
}

- (double)revealAnimationDuration
{
  return self->_revealAnimationDuration;
}

- (void)setRevealAnimationDuration:(double)a3
{
  self->_revealAnimationDuration = a3;
}

- (double)unrevealAnimationDuration
{
  return self->_unrevealAnimationDuration;
}

- (void)setUnrevealAnimationDuration:(double)a3
{
  self->_unrevealAnimationDuration = a3;
}

- (UIColor)colorOutsideRing
{
  return self->_colorOutsideRing;
}

- (UIColor)colorInsideRing
{
  return self->_colorInsidegamRing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorInsidegamRing, 0);
  objc_storeStrong((id *)&self->_colorInsideRing, 0);
  objc_storeStrong((id *)&self->_colorOutsideRing, 0);
  objc_storeStrong((id *)&self->_innerView, 0);
  objc_storeStrong((id *)&self->_outerView, 0);
}

@end
